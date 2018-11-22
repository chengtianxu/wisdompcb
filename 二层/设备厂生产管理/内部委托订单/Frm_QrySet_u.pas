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

uses common,DM_u,Pick_Item_Single,ConstVar;
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
  if UpperCase(v_Field_List_EN[ListBox3.ItemIndex])<>'DATA0008.PROD_CODE' then
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%'''
  else
    sgrid1.Cells[2,sgrid1.RowCount-1]:=
      ' and exists(select 1 from WZCP0071 inner join Data0008 on WZCP0071.prod_ptr=Data0008.RKEY'+#13+
                 'where WZCP0071.so_ptr=WZCP0070.rkey and Data0008.PROD_CODE like '+'''%'+edtValue.Text+'%'')';
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TFrm_QrySet.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [1,2,3,4] ;
  edtValue.Text:='';
  Button3.Enabled:=false;
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
  v_Field_List_CN := VarArrayOf(['订单编号','生产部门代码','委托部门代码','输入员代码','工程编码']);
  v_Field_List_EN := VarArrayOf(['wzcp0070.sales_order','Data0034.DEPT_CODE','Data0034_1.DEPT_CODE','Data0005.EMPL_CODE','Data0008.PROD_CODE']);
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
    1,2:
    begin
      InputVar.Fields := 'Dept_code/部门编码/200,dept_name/部门名称/250';
      InputVar.Sqlstr :='select rkey,dept_code,dept_name '+
                        'from data0034 where (ttype in (4,5) or is_cost_dept=1)'+
                        'and (ACTIVE_FLAG=0) order by 1';
      inputvar.KeyField:='Dept_code';
    end;
    3:
    begin
      InputVar.Fields := 'EMPL_CODE/输入员代码/200,EMPLOYEE_NAME/输入员名称/250';
      InputVar.Sqlstr :='SELECT RKEY, EMPL_CODE, EMPLOYEE_NAME FROM Data0005 order by 2';
      inputvar.KeyField:='EMPL_CODE';
    end;
    4:
    begin
      InputVar.Fields := 'PROD_CODE/产品编码/90,PRODUCT_NAME/产品名称/160,PRODUCT_DESC/产品规格/250';
      InputVar.Sqlstr :='select rkey,PROD_CODE,PRODUCT_NAME,PRODUCT_DESC from data0008 ';
      inputvar.KeyField:='PROD_CODE';
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);

    if frmPick_Item_Single.ShowModal=mrok then
    begin
     case ListBox3.ItemIndex of
       1,2: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['Dept_code'];
       3: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE'];
       4: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['PROD_CODE'];
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
