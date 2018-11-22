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
    edtValue: TEdit;
    Button3: TButton;
    BitBtn7: TBitBtn;
    ListBox3: TListBox;
    StaticText7: TStaticText;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ComboBox3: TComboBox;
    RadioGroup2: TRadioGroup;
    DTPk1: TDateTimePicker;
    DTTm1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    DTTm2: TDateTimePicker;
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   v_Field_List_CN,v_Field_List_EN:Variant;
   iType:Integer;
   sTpe1,sTpe2,sTpe3,sTpe4,sTpess:string;
  public
    { Public declarations }
    iItem,iTrem:Integer;
  end;

var
  FrmQuery: TFrmQuery;

implementation
uses Pick_Item_Single,ConstVar,common, main, damo;

{$R *.dfm}

procedure TFrmQuery.N1Click(Sender: TObject);
var i:byte;
begin
  if sgrid1.RowCount <= 2 then
  begin
    sgrid1.rows[1].clear;
    exit;
  end;
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
  v_Field_List_CN := VarArrayOf(['入库单号','采购定单','供应商代码','物品名称','物品类别','物品规格','工厂','送货日期']);
  v_Field_List_EN := VarArrayOf(['Data0456.GRN_NUMBER','data0070.PO_NUMBER','Data0023.CODE','Data0235.goods_name','data0235.goods_type','data0235.goods_guige','Data0015.WAREHOUSE_CODE','Data0456.ship_DATE']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
  end
  else
  ListBox3.ItemIndex:=iItem;
  RadioGroup2.ItemIndex:=1;
  iTrem:=1;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  dtpk2.Date:=date();
  dtpk1.Date:=dtpk2.Date-7;
  Button3.Enabled:=true;
  sTpe1:='';
  sTpe2:='';
  sTpe3:='';
  sTpe4:='';
end;

procedure TFrmQuery.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    case listbox3.ItemIndex of
      2:
      begin
        InputVar.Fields := 'CODE/供应商代码/250,ABBR_NAME/供应商名称/200';
        InputVar.Sqlstr :='select rkey,CODE,ABBR_NAME '+
                          'from data0023 order by CODE';
        inputvar.KeyField:='CODE';
      end;
      6:
      begin
        InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/277,'+
                          'ABBR_NAME/工厂简称/100';
        InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015';
        inputvar.KeyField:='WAREHOUSE_CODE';
      end;
    end;
    InputVar.AdoConn:=dm.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if listbox3.ItemIndex in [2] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
      if ListBox3.ItemIndex in [6] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmQuery.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3,4,5,6];
  RadioGroup2.Visible:=ListBox3.ItemIndex in [0,1,3,4,5];
  BitBtn7.Visible:=listbox3.ItemIndex in [2,6];
  DTPk1.Visible:=ListBox3.ItemIndex in [7];
  DTPk2.Visible:=ListBox3.ItemIndex in [7];
  Label4.Visible:=ListBox3.ItemIndex in [7];
  DTTm1.Visible:=ListBox3.ItemIndex in [7];
  DTTm2.Visible:=ListBox3.ItemIndex in [7];
//  ComboBox3.Visible:=ListBox3.ItemIndex in [5];
//  GroupBox1.Visible:=ListBox3.ItemIndex in [4];
  edtValue.Text:='';
  Button3.Enabled:= listbox3.ItemIndex in [0,1,2,3,4,5,6,7];
  iItem:=ListBox3.ItemIndex;
end;

procedure TFrmQuery.Button3Click(Sender: TObject);
var i:Integer;
    Type3:string;
begin
  if ListBox3.ItemIndex in [0,1,3,4,5] then
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
  end;
//  if ListBox3.ItemIndex in [5] then
//  begin
//    for i:=1 to sgrid1.RowCount-2 do
//    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
//    begin
//      sgrid1.Cells[1,i]:=ComboBox3.Text;
//      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+IntToStr(iType)+'';
//      exit;
//    end;
//    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
//    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox3.Text;
//    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+IntToStr(iType)+'';
//    sgrid1.RowCount:=sgrid1.RowCount+1;
//  end;
  if ListBox3.ItemIndex in [2,6] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=edtValue.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '''+edtValue.Text+'''';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
  if ListBox3.ItemIndex in [7] then
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
//  if ListBox3.ItemIndex in [4] then
//  begin
//    if (CheckBox1.Checked) then
//    begin
//      sTpe1:='1';
//      sTpess:=CheckBox1.Caption;
//    end else sTpe1:='-1';
//    if (CheckBox2.Checked) then
//    begin
//      sTpe2:='2';
//      if (sTpe1='1') then sTpe1:=sTpe1+','+sTpe2 else sTpe1:=sTpe2;
//      sTpess:=sTpess+CheckBox2.Caption;
//    end else if (sTpe1='1') then sTpe1:=sTpe1 else sTpe1:='-1';
//    if (CheckBox3.Checked) then
//    begin
//      sTpe3:='3';
//      if (sTpe1<>'-1') then sTpe1:=sTpe1+','+sTpe3 else sTpe1:=sTpe3;
//      sTpess:=sTpess+CheckBox3.Caption;
//    end else if (sTpe1<>'-1') then sTpe1:=sTpe1 else sTpe1:='-1';
//    if (CheckBox4.Checked) then
//    begin
//      sTpe4:='4';
//      if (sTpe1<>'-1') then sTpe1:=sTpe1+','+sTpe4 else sTpe1:=sTpe4;
//      sTpess:=sTpess+CheckBox4.Caption;
//    end else if (sTpe1<>'-1') then sTpe1:=sTpe1 else sTpe1:='-1';
//    edtValue.Text:=sTpess;
//    sTpess:='('+sTpe1+')';
//    for i:=1 to sgrid1.RowCount-2 do
//    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
//    begin
//      sgrid1.Cells[1,i]:=edtValue.Text;
//      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in '+sTpess+'';
//      exit;
//    end;
//    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
//    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
//    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in '+sTpess+'';
//    sgrid1.RowCount:=sgrid1.RowCount+1;
//  end;
end;

procedure TFrmQuery.RadioGroup2Click(Sender: TObject);
begin
  if (RadioGroup2.ItemIndex=0) then iTrem:=0;
  if (RadioGroup2.ItemIndex=1) then iTrem:=1;
end;

procedure TFrmQuery.FormCreate(Sender: TObject);
begin
  iItem:=0;
end;

end.
