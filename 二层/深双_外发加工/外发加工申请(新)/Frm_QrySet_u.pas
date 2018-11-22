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

uses common,DM_u,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_QrySet.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
  if listbox3.itemindex=0 then
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%'''
  else
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='''+edtValue.Text+'''' ;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TFrm_QrySet.ListBox3Click(Sender: TObject);

begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [1,2,3,4] ;
 // edtValue.Visible := listbox3.ItemIndex<>2 ;
  edtValue.Text:='';
  Button3.Enabled:= listbox3.ItemIndex=2;
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
  v_Field_List_CN := VarArrayOf(['外发单号','工序代码','申请员工','工厂代码','供应商代码']);
  v_Field_List_EN := VarArrayOf(['WZDATA300.epiboly_number','data0034.dept_code','data0005.employee_name','data0015.warehouse_code','Data0023.CODE']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-7; DateTimePicker2.Date:=date;
end;

procedure TFrm_QrySet.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    if ListBox3.ItemIndex=1 then
    begin
      InputVar.Fields := 'Dept_code/工序编号/120,dept_name/工序名称/250';
      InputVar.Sqlstr :='SELECT RKEY, DEPT_CODE,DEPT_NAME FROM Data0034 WHERE (OUT_SOURCE = 1) AND (TTYPE = 1)';
    end else if ListBox3.ItemIndex=2 then begin
      InputVar.Fields := 'EMPL_CODE/员工代码/200,EMPLOYEE_NAME/员工姓名/200';
      InputVar.Sqlstr := 'select EMPL_CODE,EMPLOYEE_NAME from data0005';
    end else if ListBox3.ItemIndex=3 then begin
      InputVar.Fields := 'warehouse_CODE/工厂代码/200,abbr_NAME/工厂/200';
      InputVar.Sqlstr := 'select warehouse_CODE,abbr_NAME from data0015';
    end else if ListBox3.ItemIndex=4 then begin
      InputVar.Fields := 'CODE/供应商代码/200,SUPPLIER_NAME/供应商名称/250';
      InputVar.Sqlstr := 'select rkey,code,SUPPLIER_NAME from data0023';
    end;

    InputVar.AdoConn := DM.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if ListBox3.ItemIndex=1 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['dept_code']
      else if ListBox3.ItemIndex=2 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']
      else if ListBox3.ItemIndex=3 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['warehouse_CODE']
      else if ListBox3.ItemIndex=4 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['CODE'];
      Button3.Enabled := true ;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

end.
