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
    edtValue: TComboBox;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
  private
    v_Field_List_CN,v_Field_List_EN:Variant;
  public
    { Public declarations }
  end;

var Frm_QrySet:TFrm_QrySet;
implementation

uses common,demo,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_QrySet.Button3Click(Sender: TObject);
var
 i:integer;
begin
  if edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
  if  ListBox3.ItemIndex in [2,4,6] then
  begin
  sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
  sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [0,1,3,5]  then
  begin
  sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
  sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
end;


procedure TFrm_QrySet.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [2,4,6] ;
  edtValue.Text:='';
end;

procedure TFrm_QrySet.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_QrySet.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrm_QrySet.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['入库单号','供应商送货单号','工厂','采购订单','创建人员','送货人员','供应商代码']);
  v_Field_List_EN := VarArrayOf(['data0133.Grn_number','data0133.deliver_number','Data0015.WAREHOUSE_CODE','Data0070.PO_NUMBER','Data0005.EMPL_CODE','data0133.ship_by','Data0023.code']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-14; DateTimePicker2.Date:=date;
end;

procedure TFrm_QrySet.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case ListBox3.ItemIndex of
    2:
    begin
      InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/200,WAREHOUSE_NAME/工厂名称/200';
      InputVar.Sqlstr :='SELECT RKEY, WAREHOUSE_CODE, WAREHOUSE_NAME FROM dbo.Data0015 order by 2';
      inputvar.KeyField:='WAREHOUSE_CODE';
    end;
    4:
    begin
      InputVar.Fields := 'EMPL_CODE/人员代码/200,EMPLOYEE_NAME/人员名称/200';
      InputVar.Sqlstr :='SELECT RKEY, EMPL_CODE, EMPLOYEE_NAME FROM dbo.Data0005 order by 2';
      inputvar.KeyField:='EMPL_CODE';
    end;
    6:
    begin
      InputVar.Fields := 'CODE/供应商代码/150,SUPPLIER_NAME/供应商名称/200';
      InputVar.Sqlstr :='SELECT RKEY, CODE, SUPPLIER_NAME, ABBR_NAME FROM dbo.Data0023 order by 2';
      inputvar.KeyField:='CODE';
    end;
  end;
  InputVar.AdoConn := dm.ADOConnection1 ;
  frmPick_Item_Single.InitForm_New(InputVar);

    if frmPick_Item_Single.ShowModal=mrok then
    begin
     case ListBox3.ItemIndex of
       2: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
       4: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE'];
       6: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['CODE'];
     end;
     Button3.Enabled := true ;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_QrySet.edtValueChange(Sender: TObject);
begin
  Button3.Enabled:=edtValue.Text<>'';
end;

end.
