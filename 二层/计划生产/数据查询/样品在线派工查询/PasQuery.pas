unit PasQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Buttons, ComCtrls,DateUtils, ExtCtrls;

type
  TFrmQuery = class(TForm)
    GroupBox6: TGroupBox;
    Label8: TLabel;
    Label7: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lab_rkey15: TLabel;
    ComboBox2: TComboBox;
    DTTm1: TDateTimePicker;
    DTPk1: TDateTimePicker;
    edtValue: TEdit;
    Button3: TButton;
    BitBtn7: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    DTPk2: TDateTimePicker;
    DTTm2: TDateTimePicker;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    RadioGroup2: TRadioGroup;
    rgType: TRadioGroup;
    ComboBox4: TComboBox;
    GroupBox3: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
  private
    { Private declarations }
   v_Field_List_CN,v_Field_List_EN:Variant;
   iType,iType2,iType3,iTrem:Integer;
  public
    { Public declarations }
    iItem:Integer;
  end;

var
  FrmQuery: TFrmQuery;

implementation
uses Pick_Item_Single,ConstVar,common, PasDM;

{$R *.dfm}

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

procedure TFrmQuery.FormShow(Sender: TObject);
var i:integer;
begin
  listbox3.Items.Clear;
  v_Field_List_CN := VarArrayOf(['投产工厂','产品属性','本厂编号','作业单状态','加工形式','在线小时','作业单号','配料单号','销售单号','订单状态','投产日期','当前工厂','工序代码','内外层','客户代码','客户型号','在线天数','计划完工时间','关联原客户']);
  v_Field_List_EN := VarArrayOf(['data0492.WHOUSE_PTR','D25.ttype','D25.MANU_PART_NUMBER','D06.PROD_STATUS','data0060.so_tp','data0056.intime','d06.work_order_number','data0492.CUT_NO','data0060.SALES_ORDER','data0060.STATUS','D06.ENT_DATETIME','data0056.LOC_PTR','D34.DEPT_CODE','D25.parent_ptr','Data0010.CUST_CODE','D25.MANU_PART_DESC','Data0056.INTIME','D06.SCH_COMPL_DATE','data0060.ORIG_CUSTOMER']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
  end else ListBox3.ItemIndex:=iItem;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  dtpk2.Date:=date();
  dtpk1.Date:=dtpk2.Date-15;
  Button3.Enabled:=true;
  iTrem:=0;
  iType:=1;   
end;

procedure TFrmQuery.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case listbox3.ItemIndex of
      14:
      begin
        InputVar.Fields := 'cust_code/客户代码/120,customer_name/客户名称/280';
        InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                          'from data0010 order by cust_code';
        inputvar.KeyField:='cust_code';
      end;
      12:
      begin
        InputVar.Fields := 'DEPT_CODE/工序代码/200,DEPT_NAME/工序名称/250';
        InputVar.Sqlstr :='select Rkey,DEPT_CODE,DEPT_NAME from dbo.data0034 where TType=1 order by DEPT_CODE';
        inputvar.KeyField:='DEPT_CODE';
      end;
      11:
      begin
        InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/277,'+
                          'ABBR_NAME/工厂简称/100';
        InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015';
        inputvar.KeyField:='WAREHOUSE_CODE';
      end;
      0:
      begin
        InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/277,'+
                          'ABBR_NAME/工厂简称/100';
        InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015';
        inputvar.KeyField:='WAREHOUSE_CODE';
      end;
      18:
      begin
        InputVar.Fields := 'cust_code/客户代码/120,ABBR_NAME/客户名称/280';
        InputVar.Sqlstr :='select rkey,cust_code,ABBR_NAME '+
                          'from data0010 order by cust_code';
        inputvar.KeyField:='cust_code';
      end;
    end;
    InputVar.AdoConn:=dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if listbox3.ItemIndex in [14] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
      if ListBox3.ItemIndex in [12] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['DEPT_CODE']);
      if ListBox3.ItemIndex in [0,11] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
         lab_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsString;
      if listbox3.ItemIndex in [18] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['ABBR_NAME']);
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmQuery.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Visible := listbox3.ItemIndex in [0,2,5,6,7,8,11,12,14,15,16,18];
  RadioGroup2.Visible:=ListBox3.ItemIndex in [2,6,7,8,15,18];
  BitBtn7.Visible:=listbox3.ItemIndex in [0,11,12,14,18];
  DTPk1.Visible:=ListBox3.ItemIndex in [10,17];
  DTPk2.Visible:=ListBox3.ItemIndex in [10,17];
  Label3.Visible:=ListBox3.ItemIndex in [10];
  Label4.Visible:=ListBox3.ItemIndex in [10];
  DTTm1.Visible:=ListBox3.ItemIndex in [10];
  DTTm2.Visible:=ListBox3.ItemIndex in [10];
  Label7.Visible:=ListBox3.ItemIndex in [5,16];
  Label1.Visible:=ListBox3.ItemIndex in [5,16];
  ComboBox2.Visible:=ListBox3.ItemIndex in [9];
  ComboBox1.Visible:=ListBox3.ItemIndex in [1];
  ComboBox3.Visible:=ListBox3.ItemIndex in [13];
  GroupBox3.Visible:=ListBox3.ItemIndex in [3];
  ComboBox4.Visible:=ListBox3.ItemIndex in [4];

  if (ListBox3.ItemIndex in [4]) then
  begin
    Label1.Caption:='天';
  end;
  if (ListBox3.ItemIndex in [5]) then
  begin
    Label1.Caption:='小时';
  end;
  edtValue.Text:='';
  Button3.Enabled:= listbox3.ItemIndex in [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18];
  iItem:=ListBox3.ItemIndex;
end;

procedure TFrmQuery.Button3Click(Sender: TObject);
var i:Integer;
    Type3:string;
    sTp:string;
begin
  if (RadioGroup2.ItemIndex=0) then iTrem:=0;
  if (RadioGroup2.ItemIndex=1) then iTrem:=1;
  if ListBox3.ItemIndex in [2,6,7,8,12,14,15,18] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=edtValue.Text;
      if (iTrem=0) then
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+''''
      else
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
      Exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    if (iTrem=0) then
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+''''
    else
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' like ''%'+edtValue.Text+'%''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end else
  if ListBox3.ItemIndex in [5,16] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=edtValue.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' > '+edtValue.Text+'';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' > '+edtValue.Text+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [9] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=ComboBox2.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+IntToStr(iType)+'';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox2.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+IntToStr(iType)+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [10] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
       sgrid1.Cells[1,i]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
       sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' >= '''+datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',DTtm1.Time)
       +''' and '+v_Field_List_EN[ListBox3.ItemIndex]+' <= '''+datetostr(dtpk2.date)+
       formatdatetime(' hh:nn:ss',DTtm2.Time)+'''';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' >= '''+datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',DTtm1.Time)
   +''' and '+v_Field_List_EN[ListBox3.ItemIndex]+' <= '''+datetostr(dtpk2.date)+
   formatdatetime(' hh:nn:ss',DTtm2.Time)+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [0,11] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=edtValue.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+SELF.lab_rkey15.Caption+'';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+SELF.lab_rkey15.Caption+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [1] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=ComboBox1.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+IntToStr(iType2)+'';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+IntToStr(iType2)+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [13] then
  begin
    Type3:='';
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=ComboBox3.Text;
      if (ComboBox3.ItemIndex=0) then
        sgrid1.Cells[2,i]:=' and IsNull('+v_Field_List_EN[ListBox3.ItemIndex]+',0) = '+IntToStr(iType3)+''
      else if (ComboBox3.ItemIndex=1) then
        sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' <> '''+Type3+'''';
      exit;
    end;
    if (ComboBox3.ItemIndex=0) then
    begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox3.Text;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and IsNull('+v_Field_List_EN[ListBox3.ItemIndex]+',0) = '+IntToStr(iType3)+'';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end else if (ComboBox3.ItemIndex=1) then
    begin
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox3.Text;
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' <> '''+Type3+'''';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end;
  end;
  if ListBox3.ItemIndex in [3] then
  begin
    sTp:='';
    for i:=0 to GroupBox3.ControlCount-1 do
      if TCheckBox(GroupBox3.Controls[i]).Checked then
       sTp:=sTp+inttostr(TCheckBox(GroupBox3.Controls[i]).Tag)+',';
    if sTp<>'' then
    begin
      for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
      begin
        sgrid1.Cells[1,i]:=copy(sTp,1,length(sTp)-1);
        sgrid1.Cells[2,i]:=' and D06.PROD_STATUS in ('+sTp+'159)';
        exit;
      end;
      sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
      sgrid1.Cells[1,sgrid1.RowCount-1]:=copy(sTp,1,length(sTp)-1);
      sgrid1.Cells[2,sgrid1.RowCount-1]:=' and D06.PROD_STATUS in ('+sTp+'159)';
      sgrid1.RowCount:=sgrid1.RowCount+1;
    end;
  end;
  if (ListBox3.ItemIndex=4) then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=ComboBox4.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[listbox3.ItemIndex]+' = '+inttostr(combobox4.ItemIndex)+'';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox4.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[listbox3.ItemIndex]+' = '+inttostr(combobox4.ItemIndex)+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [17] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
       sgrid1.Cells[1,i]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
       sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' >= '''+datetostr(dtpk1.date)
       +''' and '+v_Field_List_EN[ListBox3.ItemIndex]+' <= '''+datetostr(dtpk2.date)+'''';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' >= '''+datetostr(dtpk1.date)
   +''' and '+v_Field_List_EN[ListBox3.ItemIndex]+' <= '''+datetostr(dtpk2.date)+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
end;

procedure TFrmQuery.ComboBox2Change(Sender: TObject);
begin
  if (ComboBox2.ItemIndex=0) then iType:=1; //有效
  if (ComboBox2.ItemIndex=1) then iType:=2; //暂缓
  if (ComboBox2.ItemIndex=2) then iType:=3; // 关闭
  if (ComboBox2.ItemIndex=3) then iType:=4; //完成
  if (ComboBox2.ItemIndex=4) then iType:=5; //取消
  if (ComboBox2.ItemIndex=5) then iType:=6; //未提交
end;

procedure TFrmQuery.ComboBox1Change(Sender: TObject);
begin
  if (ComboBox1.ItemIndex=0) then iType2:=0; //量板
  if (ComboBox1.ItemIndex=1) then iType2:=1; //样板
end;

procedure TFrmQuery.ComboBox3Change(Sender: TObject);
begin
  if (ComboBox3.ItemIndex=0) then iType3:=0; //外层
  if (ComboBox3.ItemIndex=1) then iType3:=1; //内层
end;

procedure TFrmQuery.RadioGroup2Click(Sender: TObject);
begin
  if (RadioGroup2.ItemIndex=0) then iTrem:=0;
  if (RadioGroup2.ItemIndex=1) then iTrem:=1;
end;

end.
