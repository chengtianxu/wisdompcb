unit Frm_QryOrder_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Buttons, Grids, Menus;

type
  TFrm_QryOrder = class(TForm)
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
    BitBtn7: TBitBtn;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    DP1: TDateTimePicker;
    Label2: TLabel;
    DP2: TDateTimePicker;
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

var Frm_QryOrder:TFrm_QryOrder;

implementation

uses common,DM_u,Pick_Item_Single,ConstVar;
{$R *.dfm}

procedure TFrm_QryOrder.Button3Click(Sender: TObject);
var
 i:byte;
begin
  if (listbox3.itemindex<>8) and edtValue.Visible and (trim(edtValue.Text)='') then exit;
  for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then  exit;

  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  if listbox3.itemindex<>8 then
  begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''' ;
  end else begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup1.Items[RadioGroup1.itemindex];
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'='+inttostr(RadioGroup1.itemindex) ;
  end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TFrm_QryOrder.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [1,6,7] ;
  edtValue.Text:='';
  RadioGroup1.Visible:=listbox3.ItemIndex=8;
  Button3.Enabled:=RadioGroup1.Visible;
end;

procedure TFrm_QryOrder.Button4Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrm_QryOrder.SGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;

procedure TFrm_QryOrder.FormCreate(Sender: TObject);
var i:integer;
begin
  v_Field_List_CN := VarArrayOf(['订单编号','客户代码','生产单号','产品编码','产品名称','产品规格','产品类型代码','下单部门代码','产品类别']);
  v_Field_List_EN := VarArrayOf(['WZCP0070.sales_order','Data0010.CUST_CODE','data0492.CUT_NO','Data0008.prod_code','Data0008.product_name','Data0008.product_desc','data0007.PR_GRP_CODE','Data0034.dept_code','data0008.ttype']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;

end;

procedure TFrm_QryOrder.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    if ListBox3.ItemIndex=1 then
    begin
      InputVar.Fields := 'cust_code/客户代码/120,abbr_name/客户简称/250';
      InputVar.Sqlstr :='select rkey,cust_code,abbr_name from data0010 order by 1';
    end else if ListBox3.ItemIndex=6 then
    begin
      InputVar.Fields := 'pr_grp_code/组别代码/120,product_group_name/组别名称/250';
      InputVar.Sqlstr :='select * from data0007 order by 2';
    end else if ListBox3.ItemIndex=7 then begin
      InputVar.Fields := 'dept_code/部门代码/200,dept_name/部门名称/250';
      InputVar.Sqlstr := 'select rkey,dept_code,dept_name from data0034 order by 2';
    end ;

    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if ListBox3.ItemIndex=1 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['cust_code']
      else if ListBox3.ItemIndex=6 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['pr_grp_code']
      else if ListBox3.ItemIndex=7 then
        edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['dept_code'] ;
      Button3.Enabled := true ;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_QryOrder.edtValueChange(Sender: TObject);
begin
  Button3.Enabled:=edtValue.Text<>'';
end;

end.
