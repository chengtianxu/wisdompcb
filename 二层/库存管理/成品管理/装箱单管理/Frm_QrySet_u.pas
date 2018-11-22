unit Frm_QrySet_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TFrm_QrySet = class(TForm)
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    BitBtn7: TBitBtn;
    grp1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    grp2: TGroupBox;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;

  public
    { Public declarations }
  end;

var Frm_QrySet:TFrm_QrySet;
implementation

uses common,damo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_QrySet.Button3Click(Sender: TObject);
var
 i:byte;

begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];

  if listbox3.itemindex=5 then
  begin
    if RadioButton1.Checked then
    begin
      sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioButton1.Caption;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and (not data0439.invoice_ptr is null)';
    end else begin
      sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioButton2.Caption;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and (data0439.invoice_ptr is null)';
    end;
  end else
  begin
    if RadioButton3.Checked then
    begin
      sgrid1.Cells[1,sgrid1.RowCount-1]:='='+edtValue.Text;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='''+edtValue.Text+'''';
    end else begin
      sgrid1.Cells[1,sgrid1.RowCount-1]:='like %'+edtValue.Text+'%';
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
    end;
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrm_QrySet.ListBox3Click(Sender: TObject);

begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [1,3,4] ;
  Button3.Enabled:= listbox3.ItemIndex=5;
  edtValue.Visible := not listbox3.ItemIndex=5;
  grp1.Visible:= listbox3.ItemIndex = 5;
  grp2.Visible:= listbox3.ItemIndex <> 5;
  edtValue.Visible := listbox3.ItemIndex<>5;
  edtValue.Text:='';
end;

procedure TFrm_QrySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_QrySet.ComboBox1Change(Sender: TObject);
begin
  Button3.Enabled:=true;
end;

procedure TFrm_QrySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrm_QrySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['装运编号','客户代码','装运地址','装运员工','工厂代码','出具发票']);
  v_Field_List_EN := VarArrayOf(['data0439.delivery_no','data0010.cust_code','data0012.location','data0005.EMPL_CODE','data0015.warehouse_code','data0439.invoice_ptr']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date; DateTimePicker2.Date:=date;
end;

procedure TFrm_QrySet.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    if ListBox3.ItemIndex=1 then
    begin
      InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250';
      InputVar.Sqlstr :='select rkey,cust_code,customer_name from data0010 order by 1 ';
    end else if ListBox3.ItemIndex=3 then begin
      InputVar.Fields := 'EMPL_CODE/员工代码/200,EMPLOYEE_NAME/员工姓名/200';
      InputVar.Sqlstr := 'select EMPL_CODE,EMPLOYEE_NAME from data0005';
    end else if ListBox3.ItemIndex=4 then begin
      InputVar.Fields := 'warehouse_CODE/工厂代码/100,ABBR_NAME/工厂简称/100,warehouse_NAME/工厂名称/200';
      InputVar.Sqlstr := 'select warehouse_CODE,ABBR_NAME,warehouse_NAME from data0015';
    end;

    InputVar.AdoConn := dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if ListBox3.ItemIndex=1 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['cust_code']
      else if ListBox3.ItemIndex=3 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE']
      else if ListBox3.ItemIndex=4 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['warehouse_CODE'];
      Button3.Enabled := true ;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.
