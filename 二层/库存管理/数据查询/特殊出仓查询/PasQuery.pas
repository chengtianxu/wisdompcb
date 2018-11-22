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
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Label2: TLabel;
    DTPk1: TDateTimePicker;
    DTTm1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Label5: TLabel;
    DTTm2: TDateTimePicker;
    procedure N1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
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
uses Pick_Item_Single,ConstVar,common, main;

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
  v_Field_List_CN := VarArrayOf(['客户代码','出仓单号','本厂编号','客户型号','出仓类型','状态','工厂','仓库名称']);
  v_Field_List_EN := VarArrayOf(['Data0010.CUST_CODE','data0415.number','Data0025.MANU_PART_NUMBER','Data0025.MANU_PART_DESC','data0415.type','data0415.status','data0015.WAREHOUSE_CODE','data0016.CODE','data0016.LOCATION']);
  for i:= VarArrayLowBound(v_Field_List_CN,1) to VarArrayHighBound(v_Field_List_CN,1) do
    listbox3.Items.Add(v_Field_List_CN[i]);
  if (iItem=0) then
  begin
    ListBox3.ItemIndex := 0;
    listbox3.Selected[0]:=true;
  end else ListBox3.ItemIndex:=iItem;
  RadioGroup2.ItemIndex:=0;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
  dtpk2.Date:=date();
  dtpk1.Date:=dtpk2.Date-7;
  Button3.Enabled:=true;
  iTrem:=0;
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
      0:
      begin
        InputVar.Fields := 'cust_code/客户代码/200,customer_name/客户名称/250';
        InputVar.Sqlstr :='select rkey,cust_code,customer_name '+
                          'from data0010 order by cust_code';
        inputvar.KeyField:='cust_code';
      end;
      6:
      begin
        InputVar.Fields := 'WAREHOUSE_CODE/工厂代码/100,WAREHOUSE_NAME/工厂名称/277,'+
                          'ABBR_NAME/工厂简称/100';
        InputVar.Sqlstr := 'select RKEY,WAREHOUSE_CODE,WAREHOUSE_NAME,ABBR_NAME from data0015';
        inputvar.KeyField:='WAREHOUSE_CODE';
      end;
      7:
      begin
        InputVar.Fields := 'CODE/仓库代码/100,LOCATION/仓库名称/277';
        InputVar.Sqlstr := 'select RKEY,CODE,LOCATION from data0016 where location_type=1 order by code';
        inputvar.KeyField:='CODE';
      end;
    end;
    InputVar.AdoConn:=Form1.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if listbox3.ItemIndex in [0] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['cust_code']);
      if ListBox3.ItemIndex in [6] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['WAREHOUSE_CODE']);
      if ListBox3.ItemIndex in [7] then
         edtValue.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['CODE']);
//         lab_rkey15.Caption := frmPick_Item_Single.adsPick.Fieldbyname('WAREHOUSE_CODE').AsString;
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrmQuery.ListBox3Click(Sender: TObject);
begin
  Label8.Caption := listbox3.Items[listbox3.ItemIndex];
  edtValue.Visible := listbox3.ItemIndex in [0,1,2,3,6,7];
  RadioGroup2.Visible:=ListBox3.ItemIndex in [0,1,2,3,6,7];
  BitBtn7.Visible:=listbox3.ItemIndex in [0,6,7];
//  DTPk1.Visible:=ListBox3.ItemIndex in [4];
//  DTPk2.Visible:=ListBox3.ItemIndex in [4];
//  Label4.Visible:=ListBox3.ItemIndex in [4];
//  DTTm1.Visible:=ListBox3.ItemIndex in [4];
//  DTTm2.Visible:=ListBox3.ItemIndex in [4];
  ComboBox3.Visible:=ListBox3.ItemIndex in [5];
  GroupBox1.Visible:=ListBox3.ItemIndex in [4];
  edtValue.Text:='';
  Button3.Enabled:= listbox3.ItemIndex in [0,1,2,3,4,5,6,7];
  iItem:=ListBox3.ItemIndex;
end;

procedure TFrmQuery.Button3Click(Sender: TObject);
var i:Integer;
    Type3:string;
begin
  if ListBox3.ItemIndex in [0,1,2,3,7] then
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
  if ListBox3.ItemIndex in [5] then
  begin
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=ComboBox3.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+IntToStr(iType)+'';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox3.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' = '+IntToStr(iType)+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
//  if ListBox3.ItemIndex in [4] then
//  begin
//    for i:=1 to sgrid1.RowCount-2 do
//      if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
//    begin
//       sgrid1.Cells[1,i]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
//       sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' >= '''''+datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',DTtm1.Time)
//       +''''' and '+v_Field_List_EN[ListBox3.ItemIndex]+' <= '''''+datetostr(dtpk2.date)+
//       formatdatetime(' hh:nn:ss',DTtm2.Time)+'''''';
//      exit;
//    end;
//    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
//   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
//   sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' >= '''''+datetostr(dtpk1.date)+formatdatetime(' hh:nn:ss',DTtm1.Time)
//   +''''' and '+v_Field_List_EN[ListBox3.ItemIndex]+' <= '''''+datetostr(dtpk2.date)+
//   formatdatetime(' hh:nn:ss',DTtm2.Time)+'''''';
//    sgrid1.RowCount:=sgrid1.RowCount+1;
//  end;
  if ListBox3.ItemIndex in [6] then
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
  if ListBox3.ItemIndex in [4] then
  begin
    if (CheckBox1.Checked) then
    begin
      sTpe1:='1';
      sTpess:=CheckBox1.Caption;
    end else sTpe1:='-1';
    if (CheckBox2.Checked) then
    begin
      sTpe2:='2';
      if (sTpe1='1') then sTpe1:=sTpe1+','+sTpe2 else sTpe1:=sTpe2;
      sTpess:=sTpess+CheckBox2.Caption;
    end else if (sTpe1='1') then sTpe1:=sTpe1 else sTpe1:='-1';
    if (CheckBox3.Checked) then
    begin
      sTpe3:='3';
      if (sTpe1<>'-1') then sTpe1:=sTpe1+','+sTpe3 else sTpe1:=sTpe3;
      sTpess:=sTpess+CheckBox3.Caption;
    end else if (sTpe1<>'-1') then sTpe1:=sTpe1 else sTpe1:='-1';
    if (CheckBox4.Checked) then
    begin
      sTpe4:='4';
      if (sTpe1<>'-1') then sTpe1:=sTpe1+','+sTpe4 else sTpe1:=sTpe4;
      sTpess:=sTpess+CheckBox4.Caption;
    end else if (sTpe1<>'-1') then sTpe1:=sTpe1 else sTpe1:='-1';
    edtValue.Text:=sTpess;
    sTpess:='('+sTpe1+')';
    for i:=1 to sgrid1.RowCount-2 do
    if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex] then
    begin
      sgrid1.Cells[1,i]:=edtValue.Text;
      sgrid1.Cells[2,i]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in '+sTpess+'';
      exit;
    end;
    sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edtValue.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=' and '+v_Field_List_EN[ListBox3.ItemIndex]+' in '+sTpess+'';
    sgrid1.RowCount:=sgrid1.RowCount+1;
  end;
end;

procedure TFrmQuery.ComboBox3Change(Sender: TObject);
begin
  if (ComboBox3.ItemIndex=0) then iType:=1; //待提交
  if (ComboBox3.ItemIndex=1) then iType:=2; //待出仓
  if (ComboBox3.ItemIndex=2) then iType:=3; //已出仓
  if (ComboBox3.ItemIndex=3) then iType:=4; //已检视
  if (ComboBox3.ItemIndex=4) then iType:=5; //被退回
end;

procedure TFrmQuery.RadioGroup2Click(Sender: TObject);
begin
  if (RadioGroup2.ItemIndex=0) then iTrem:=0;
  if (RadioGroup2.ItemIndex=1) then iTrem:=1;
end;

procedure TFrmQuery.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) then sTpe1:=CheckBox1.Caption else sTpe1:='';
end;

procedure TFrmQuery.CheckBox2Click(Sender: TObject);
begin
  if (CheckBox2.Checked) then sTpe2:=CheckBox2.Caption else sTpe2:='';
end;

procedure TFrmQuery.CheckBox3Click(Sender: TObject);
begin
  if (CheckBox3.Checked) then sTpe3:=CheckBox3.Caption else sTpe3:='';
end;

procedure TFrmQuery.CheckBox4Click(Sender: TObject);
begin
  if (CheckBox4.Checked) then sTpe4:=CheckBox4.Caption else sTpe4:='';
end;

end.
