unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFrmQuery = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Panel2: TPanel;
    StaticText2: TStaticText;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    edtValue: TEdit;
    Button3: TButton;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    Button4: TButton;
    ComboBox1: TComboBox;
    BitBtn7: TBitBtn;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    GroupBox3: TGroupBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
  private
    { Private declarations }
   v_Field_List_CN,v_Field_List_EN:Variant;
   iType2,sRGroup:string;
  public
    { Public declarations }
    iItem:Integer;
  end;

var
  FrmQuery: TFrmQuery;

implementation
uses Pick_Item_Single,ConstVar,common, PasOrderParameter, PasDM;

{$R *.dfm}

procedure TFrmQuery.FormShow(Sender: TObject);
var i:integer;
begin
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['客户代码','本厂编号','客户型号','产品类型','产品属性','销售订单','客订单号','订单类型','工厂代码','订单新旧','加工形式','订单状态','生产标记','产品层数','客物料号','关联原客户','产品阶数','MI状态','评审状态']);
  v_Field_List_EN := VarArrayOf(['Data0010.CUST_CODE','D25.MANU_PART_NUMBER','D25.MANU_PART_DESC','data0008.prod_code','d25.ttype','data0060.sales_order','data0097.po_number','data0060.so_style','data0015.WAREHOUSE_CODE','data0060.so_oldnew','Data0060.so_tp','data0060.status','data0060.prod_rel','d25.LAYERS','d25.ANALYSIS_CODE_2','D25.ORIG_CUSTOMER','d25.CPJS','d25.TSTATUS','data0060.QUOTE_PRICE']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
    BitBtn7.Visible:=True;
    Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  end else ListBox3.ItemIndex:=iItem;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  sRGroup:='=';
end;

procedure TFrmQuery.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var column,row:longint;//右键选择stringgrid控件的方法
begin
  if button=mbright then
  begin
    SGrid1.MouseToCell(x,y,column,row);
    if row<>0 then SGrid1.Row:=row;
  end;
end;

procedure TFrmQuery.ListBox3Click(Sender: TObject);
begin
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3,5,6,8,13,14,15];
  edtValue.Text:='';
  BitBtn7.Visible:=listbox3.ItemIndex in [0,3,8,15];
  edtValue.ReadOnly:=listbox3.ItemIndex in [0,3,8,15];
  ComboBox1.Visible:=listbox3.itemindex in [4,7,9,10,12,16];
  Button3.Enabled:= listbox3.ItemIndex in [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
  RadioGroup1.Visible:=ListBox3.ItemIndex=13;
  GroupBox1.Visible:=listbox3.itemindex=11;
  GroupBox2.Visible:=listbox3.itemindex=17;
  GroupBox3.Visible:=listbox3.itemindex=18;
  case listbox3.ItemIndex of
  7:
  begin
    ComboBox1.Style:=csOwnerDrawFixed;
    ComboBox1.Items.Clear;
    ComboBox1.Items.Append('正式订单');
    ComboBox1.Items.Append('备品订单');
    ComboBox1.ItemIndex:=0;
    iType2:='0';                                                                         
  end;
  9:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csOwnerDrawFixed;
    combobox1.Items.Add('新单');
    combobox1.Items.Add('返单');
    combobox1.Items.Add('样板转生产');
    combobox1.Items.Add('返单有改');
    ComboBox1.ItemIndex:=0;
    iType2:='0';
  end;
  4:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csOwnerDrawFixed;
    ComboBox1.Items.Append('量产');
    ComboBox1.Items.Append('样板');
    ComboBox1.ItemIndex:=0;
    iType2:='0';
  end;

  10:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csOwnerDrawFixed;
    ComboBox1.Items.Append('自制');
    ComboBox1.Items.Append('外发');
    ComboBox1.Items.Append('半制程');
    ComboBox1.ItemIndex:=0;
    iType2:='0';
  end;
  12:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csOwnerDrawFixed;
    ComboBox1.Items.Append('未确认');
    ComboBox1.Items.Append('已确认');
    ComboBox1.Items.Append('已投产');
    ComboBox1.ItemIndex:=0;
    iType2:='1';
  end;
  16:
  begin
    ComboBox1.Items.Clear;
    ComboBox1.Style:=csDropDown;
    dm.aqtmp.Close;
    DM.aqtmp.SQL.Text:='select data0338.tvalue from data0278 inner join data0338 on data0278.Rkey=data0338.parameter_ptr where  data0278.SPEC_RKEY=''js''';
    dm.aqtmp.Open;
    while not dm.aqtmp.Eof do
    begin
      ComboBox1.Items.Add(dm.aqtmp.FieldBYName('tvalue').AsString);
      DM.aqtmp.Next;
    end;
    ComboBox1.ItemIndex:=-1;
  end;
  end;
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  iItem:=listbox3.ItemIndex;
end;

procedure TFrmQuery.Button4Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TFrmQuery.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case listbox3.ItemIndex of
      0:
      begin
        InputVar.Fields := 'cust_code/客户代码/150,customer_name/客户名称/250';
        InputVar.Sqlstr :='select rkey,cust_code,customer_name from data0010 order by cust_code';
        inputvar.KeyField:='cust_code';
      end;
      3:
      begin
        InputVar.Fields := 'PROD_code/产品编号/120,Product_name/产品名称/250';
        InputVar.Sqlstr := 'select rKey,PROD_code,Product_name from data0008 order by PROD_code';
        inputvar.KeyField:='PROD_code';
      end;
      8:
      begin
        inputvar.Fields:='warehouse_code/工厂代码/60,warehouse_name/工厂名称/200,abbr_name/工厂简称/100';
        inputvar.Sqlstr:='select rkey,warehouse_code,warehouse_name,abbr_name from data0015 order by warehouse_code';
        inputvar.KeyField:='warehouse_code';
      end;
      15:
      begin
        InputVar.Fields := 'CUST_CODE/客户代码/120,CUSTOMER_NAME/客户名称/250,abbr_name/客户简称/120';
        InputVar.Sqlstr := 'SELECT CUST_CODE, CUSTOMER_NAME,abbr_name FROM Data0010 WHERE customer_type <> 4 order by CUST_CODE';
        inputvar.KeyField:='CUST_CODE';
      end;
    end;
    InputVar.AdoConn:=dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if listbox3.ItemIndex=0 then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
      if ListBox3.ItemIndex=3 then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['PROD_code']);
      if listbox3.ItemIndex=8 then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['warehouse_code']);
      if ListBox3.ItemIndex=15 then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CUST_CODE']);
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmQuery.Button3Click(Sender: TObject);
var i,j:byte;
    s:string;
begin
  if (edtValue.Visible and (trim(edtValue.Text)='')) then exit;
  if ListBox3.ItemIndex in [1,2,5,6,14] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=edtValue.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''''%'+edtValue.Text+'%''''';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' LIKE ''''%'+edtValue.Text+'%''''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox3.ItemIndex in [0,3,8,15] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=edtValue.Text;
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'= '''''+edtValue.Text+'''''';
        exit;
      end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+'= '''''+edtValue.Text+'''''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox3.ItemIndex in [4,7,10,12] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=ComboBox1.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+iType2+'';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+iType2+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox3.ItemIndex=11 then
  begin
    s:='';
    for i:=0 to GroupBox1.ControlCount-1 do
      if TCheckBox(GroupBox1.Controls[i]).Checked then
       s:=s+inttostr(TCheckBox(GroupBox1.Controls[i]).Tag)+',';
    if s<>'' then
    begin
      for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=copy(s,1,length(s)-1);
        sgrid1.Cells[2,i]:=' and data0060.status in ('+s+'159)';
        exit;
      end;
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:=copy(s,1,length(s)-1);
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and data0060.status in ('+s+'159)';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end;
  end else
 if ListBox3.ItemIndex in [13] then
 begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=RadioGroup1.Items[RadioGroup1.ItemIndex]+edtValue.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+sRGroup+edtValue.Text;
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup1.Items[RadioGroup1.ItemIndex]+edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+sRGroup+edtValue.Text;
    sgrid1.RowCount:=sgrid1.RowCount+1;
 end else
  if ListBox3.ItemIndex in [9,16] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=ComboBox1.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''''+combobox1.Items[ComboBox1.ItemIndex]+'''''';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''''+combobox1.Items[ComboBox1.ItemIndex]+'''''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox3.ItemIndex=17 then
  begin
    s:='';
    for i:=0 to GroupBox2.ControlCount-1 do
      if TCheckBox(GroupBox2.Controls[i]).Checked then
       s:=s+inttostr(TCheckBox(GroupBox2.Controls[i]).Tag)+',';
    if s<>'' then
    begin
      for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=copy(s,1,length(s)-1);
        sgrid1.Cells[2,i]:=' and d25.TSTATUS in ('+s+'159)';
        exit;
      end;
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:=copy(s,1,length(s)-1);
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and d25.TSTATUS in ('+s+'159)';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end;
  end else
  if ListBox3.ItemIndex=18 then
  begin
    s:='';
    for i:=0 to GroupBox3.ControlCount-1 do
      if TCheckBox(GroupBox3.Controls[i]).Checked then
       s:=s+inttostr(TCheckBox(GroupBox3.Controls[i]).Tag)+',';
    if s<>'' then
    begin
      for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=copy(s,1,length(s)-1);
        sgrid1.Cells[2,i]:=' and data0060.QUOTE_PRICE in ('+s+'159)';
        exit;
      end;
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:=copy(s,1,length(s)-1);
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and data0060.QUOTE_PRICE in ('+s+'159)';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end;
  end;
end;

procedure TFrmQuery.ComboBox3Change(Sender: TObject);
begin
  case listbox3.ItemIndex of
  4:
  begin
    if ComboBox1.ItemIndex=0 then iType2:='0';
    if ComboBox1.ItemIndex=1 then iType2:='1';
  end;
  7:
  begin
    if ComboBox1.ItemIndex=0 then iType2:='0';
    if ComboBox1.ItemIndex=1 then iType2:='1';
  end;

  10:
  begin
    if ComboBox1.ItemIndex=0 then iType2:='0';
    if ComboBox1.ItemIndex=1 then iType2:='1';
    if ComboBox1.ItemIndex=2 then iType2:='2';
  end;
  12:
  begin
    if ComboBox1.ItemIndex=0 then iType2:='1';
    if ComboBox1.ItemIndex=1 then iType2:='2';
    if ComboBox1.ItemIndex=2 then iType2:='3';
  end;
  end;
end;

procedure TFrmQuery.RadioGroup1Click(Sender: TObject);
begin
  if (RadioGroup1.ItemIndex=0) then sRGroup:='=';
  if (RadioGroup1.ItemIndex=1) then sRGroup:='>';
  if (RadioGroup1.ItemIndex=2) then sRGroup:='<';
end;

procedure TFrmQuery.edtValueChange(Sender: TObject);
begin
  if (Trim(edtValue.Text)<>'') then Button3.Enabled:=True;
end;

end.
