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
    DateTimePicker3: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    procedure Button3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure edtValueKeyPress(Sender: TObject; var Key: Char);
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
  if  ListBox3.ItemIndex in [1,2,4,6] then
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+''''
  else if ListBox3.ItemIndex=7 then
  begin
    if RadioGroup1.ItemIndex=0 then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' < '''+datetostr(DateTimePicker3.Date)+''''
    else if RadioGroup1.ItemIndex=1 then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' > '''+datetostr(DateTimePicker3.Date)+''''
    else
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+datetostr(DateTimePicker3.Date)+'''';
    sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup1.Items[RadioGroup1.ItemIndex]+datetostr(DateTimePicker3.Date);
  end else if ListBox3.ItemIndex=8 then
  begin
    if RadioGroup1.ItemIndex=0 then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' < '+edtValue.Text
    else if RadioGroup1.ItemIndex=1 then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' > '+edtValue.Text
    else
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+edtValue.Text;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup1.Items[RadioGroup1.ItemIndex]+edtValue.Text;
  end else if ListBox3.ItemIndex=5 then
  begin
    if RadioGroup1.ItemIndex=0 then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' =1 '
    else
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' =3 ';
     sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup1.Items[RadioGroup1.ItemIndex];
  end else
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TFrm_QrySet.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  BitBtn7.Visible:=listbox3.ItemIndex in [1,2,4,6] ;
  edtValue.Text:='';

  Button3.Enabled:=listbox3.ItemIndex in [5,7];

  RadioGroup1.Visible:=listbox3.ItemIndex in [5,7,8];
  DateTimePicker3.Visible:=listbox3.ItemIndex=7;
  edtValue.Visible:=(listbox3.ItemIndex<>5) and (listbox3.ItemIndex<>7);
  
  if listbox3.ItemIndex=5 then
  begin
    RadioGroup1.Items.Clear;
    RadioGroup1.Items.Append('PO入库');
    RadioGroup1.Items.Append('直接入库');
    RadioGroup1.ItemIndex:=0;
  end else if listbox3.ItemIndex in [7,8] then
  begin
    RadioGroup1.Items.Clear;
    RadioGroup1.Items.Append('小于<');
    RadioGroup1.Items.Append('大于>');
    RadioGroup1.Items.Append('等于=');
    RadioGroup1.ItemIndex:=0;
  end;
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
  v_Field_List_CN := VarArrayOf(['入库单号','供应商代码','工厂','采购订单','创建人员','入库类别','材料编码','有效期','现有库存']);
  v_Field_List_EN := VarArrayOf(['data0133.Grn_number','Data0023.CODE','Data0015.WAREHOUSE_CODE','Data0070.PO_NUMBER','Data0005.EMPL_CODE','data0133.ttype','Data0017.INV_PART_NUMBER','data0134.expire_date','data0134.Quan_on_hand']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  ListBox3.ItemIndex := 0;
  DateTimePicker1.Date:=date-14; DateTimePicker2.Date:=date;
  DateTimePicker3.Date:=date+30;
end;

procedure TFrm_QrySet.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
  case ListBox3.ItemIndex of
    1:
    begin
      InputVar.Fields := 'CODE/供应商代码/150,SUPPLIER_NAME/供应商名称/200';
      InputVar.Sqlstr :='SELECT RKEY, CODE, SUPPLIER_NAME, ABBR_NAME FROM dbo.Data0023 order by 2';
      inputvar.KeyField:='CODE';
    end;
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
      InputVar.Fields := 'INV_PART_NUMBER/材料编码/150,INV_NAME/材料名称名称/200,INV_DESCRIPTION/材料规格/200';
      InputVar.Sqlstr :='SELECT INV_PART_NUMBER, INV_NAME, INV_DESCRIPTION, RKEY FROM Data0017 order by 1';
      inputvar.KeyField:='INV_PART_NUMBER';
    end;
  end;
  InputVar.AdoConn := DM.ADOCon ;
  frmPick_Item_Single.InitForm_New(InputVar);

    if frmPick_Item_Single.ShowModal=mrok then
    begin
     case ListBox3.ItemIndex of
       1: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['CODE'];
       2: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE'];
       4: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE'];
       6: edtValue.Text := frmPick_Item_Single.adsPick.FieldValues['INV_PART_NUMBER'];
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

procedure TFrm_QrySet.edtValueKeyPress(Sender: TObject; var Key: Char);
begin
 if ListBox3.ItemIndex=8 then
   if not (key in ['0'..'9','.',#8]) or ((key='.') and (pos('.',TEdit(sender).Text)>0)) then abort;
end;

end.
