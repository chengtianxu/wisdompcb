unit Condition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons, Grids, ExtCtrls, ComCtrls, DB,
  ADODB,ComObj, Excel2000,ClipBrd,DBGrids, Menus;

type
  TForm_Condition = class(TForm)
    RadioGroup1: TRadioGroup;
    GroupBox3: TGroupBox;
    Label21: TLabel;
    Button7: TButton;
    BitBtn11: TBitBtn;
    ListBox3: TListBox;
    StaticText8: TStaticText;
    Edit7: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    dttm3: TDateTimePicker;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    DtPk4: TDateTimePicker;
    DtPk3: TDateTimePicker;
    Button2: TButton;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    dttm4: TDateTimePicker;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DTTm1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    DTPk1: TDateTimePicker;
    Button1: TButton;
    BitBtn4: TBitBtn;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    Edit1: TEdit;
    DTTm2: TDateTimePicker;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADOserver_date: TADOQuery;
    ADOserver_datedate1: TStringField;
    BitBtn2: TBitBtn;
    RGp4: TRadioGroup;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit7Click(Sender: TObject);
    procedure Edit7KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Condition: TForm_Condition;

implementation

uses demo, Warehouse, User, Supply, InvGroup, Inventory, InvType, Location,
  SelectIn, SelectOut, SelectAll,common, invt_quan, rec_total, put_total;

{$R *.dfm}

procedure TForm_Condition.FormCreate(Sender: TObject);
begin
DateSeparator := '-';
ShortDateFormat := 'yyyy-mm-dd';
sgrid1.Cells[0,0]:='条件名';
sgrid1.Cells[1,0]:='条件值';
end;

procedure TForm_Condition.FormShow(Sender: TObject);
begin
if  dm.ADOConnection1.Connected then
 begin
  self.ADOserver_date.Open;
  dtpk2.Date:=strtodate(self.ADOserver_datedate1.Value);
  dtpk1.Date:=dtpk2.Date-60;
  dtpk4.Date:=dtpk2.Date;
  dtpk3.Date:=dtpk2.Date-60;
 end;
end;

procedure TForm_Condition.RadioGroup1Click(Sender: TObject);
var
i:byte;
begin
for i:=1 to sgrid1.RowCount-1 do
sgrid1.Rows[i].Clear;
sgrid1.RowCount:=2;
case radiogroup1.ItemIndex of
0:
 begin
  Form_Condition.Caption:='材料VMI入库查询';
  groupbox1.Visible:=true;
  groupbox2.Visible:=false;
  groupbox3.Visible:=false;
  listbox1.Selected[0]:=true;
  listbox1click(sender);
 end;
1:
 begin
 Form_Condition.Caption:='材料VMI出库查询';
  groupbox1.Visible:=false;
  groupbox3.Visible:=false;
  groupbox2.Visible:=true;
  listbox2.Selected[0]:=true;
  listbox2click(sender);
 end;
2:
 begin
 Form_Condition.Caption:='材料VMI库存查询';
 groupbox1.Visible:=false;
 groupbox2.Visible:=false;
 groupbox3.Visible:=true;
 listbox3.Selected[0]:=true;
 listbox3click(sender);
 end;
end;
end;

procedure TForm_Condition.ListBox1Click(Sender: TObject);
begin
label2.Caption:=listbox1.Items[listbox1.itemindex];
edit1.Text:='';
button1.Enabled:=false;
bitbtn4.Visible:=false;
dttm1.Visible:=false;
dttm2.Visible:=false;
case listbox1.ItemIndex of
0:
 begin
  edit1.Visible:=true;
  label3.Visible:=false;
  label4.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
 end;
1,9:
 begin
  bitbtn4.Visible:=true;
  edit1.Visible:=true;
  label3.Visible:=false;
  label4.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
 end;
2:
 begin
  bitbtn4.Visible:=true;
  edit1.Visible:=true;
  label3.Visible:=false;
  label4.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
 end;
3:
 begin
  edit1.Visible:=true;
  label3.Visible:=false;
  label4.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
 end;
4:
 begin
  button1.Enabled:=true;
  edit1.Visible:=false;
  label3.Visible:=true;
  label4.Visible:=true;
  dtpk1.Visible:=true;
  dtpk2.Visible:=true;
  dttm1.Visible:=true;
  dttm2.Visible:=true;
 end;
5:
 begin
  bitbtn4.Visible:=true;
  label3.Visible:=false;
  label4.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
  edit1.Visible:=true;
 end;
6:
 begin
  bitbtn4.Visible:=true;
  edit1.Visible:=true;
  label3.Visible:=false;
  label4.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
 end;
7:
 begin
  edit1.Visible:=true;
  label3.Visible:=false;
  label4.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
 end;
8:
 begin
  bitbtn4.Visible:=true;
  edit1.Visible:=true;
  label3.Visible:=false;
  label4.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
 end;

end;

end;

procedure TForm_Condition.ListBox2Click(Sender: TObject);
begin
label6.Caption:=listbox2.Items[listbox2.itemindex];
edit2.Text:='';
button2.Enabled:=false;
bitbtn5.Visible:=false;
dttm3.Visible:=false;
dttm4.Visible:=false;
case listbox2.ItemIndex of
0,10:
begin
edit2.Visible:=true;
label5.Visible:=false;
label1.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
end;
1:
begin
bitbtn5.Visible:=true;
edit2.Visible:=true;
label1.Visible:=false;
label5.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
end;
2:
begin
bitbtn5.Visible:=true;
edit2.Visible:=true;
label1.Visible:=false;
label5.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
end;
3:
begin
bitbtn5.Visible:=true;
edit2.Visible:=true;
label1.Visible:=false;
label5.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
end;
4:
begin
bitbtn5.Visible:=true;
edit2.Visible:=true;
label1.Visible:=false;
label5.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
end;
5:
 begin
  bitbtn5.Visible:=false;
  label5.Visible:=true;
  label1.Visible:=true;
  dtpk3.Visible:=true;
  dtpk4.Visible:=true;
  dttm3.Visible:=true;
  dttm4.Visible:=true;
  button2.Enabled:=true;
  edit2.Visible:=false;
 end;
6:
begin
bitbtn5.Visible:=true;
edit2.Visible:=true;
label1.Visible:=false;
label5.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
end;
7:
begin
bitbtn5.Visible:=true;
edit2.Visible:=true;
label1.Visible:=false;
label5.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
end;
8:
begin
bitbtn5.Visible:=true;
edit2.Visible:=true;
label1.Visible:=false;
label5.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
end;
9:
begin
edit2.Visible:=true;
label5.Visible:=false;
label1.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
end;
end;

end;

procedure TForm_Condition.ListBox3Click(Sender: TObject);
begin
label21.Caption:=listbox3.Items[listbox3.itemindex];
edit7.Text:='';
button7.Enabled:=false;
bitbtn11.Visible:=false;
ComboBox1.Visible:=False;
case listbox3.ItemIndex of
0:
 begin
bitbtn11.Visible:=true;
edit7.Visible:=true;
ComboBox1.Visible:=False;
 end;
1:
 begin
bitbtn11.Visible:=true;
edit7.Visible:=true;
ComboBox1.Visible:=False;
 end;
2:
 begin
bitbtn11.Visible:=true;
edit7.Visible:=true;
ComboBox1.Visible:=False;
 end;
3:
 begin
bitbtn11.Visible:=true;
edit7.Visible:=true;
ComboBox1.Visible:=False;
 end;
4:
 begin
bitbtn11.Visible:=true;
edit7.Visible:=true;
ComboBox1.Visible:=False;
 end;
5:
 begin
bitbtn11.Visible:=true;
edit7.Visible:=true;
ComboBox1.Visible:=False;
 end;
6:
begin
bitbtn11.Visible:=false;
edit7.Visible:=true;
ComboBox1.Visible:=False;
end;
7:
begin
bitbtn11.Visible:=false;
edit7.Visible:=true;
ComboBox1.Visible:=False;
end;
8:
begin
ComboBox1.Visible:=True;
bitbtn11.Visible:=false;
edit7.Visible:=true;
button7.Enabled:=true;
end;
end;
end;

procedure TForm_Condition.BitBtn3Click(Sender: TObject);
begin
close;
end;

procedure TForm_Condition.BitBtn1Click(Sender: TObject);
var
 i:byte;
 quantity,total_lucre,total_notax:double;
begin
screen.Cursor:=crSQLWait;
 quantity:=0;
 total_lucre:=0;
 total_notax:=0;
case radiogroup1.ItemIndex of
0://材料入库清单
 if RGp4.ItemIndex=0 then
 begin
 if (sgrid1.RowCount=2) then
  messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
 else
  begin
  form_selectin:=tform_selectin.Create(application);
  with form_selectin.ADOQuery1 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do sql.Add(sgrid1.Cells[2,i]);
     sql.Add('order by Data0496.GROUP_NAME,data0017.inv_part_number');
     Prepared;
    open;
   end;
   Form_SelectIn.PopupMenu1.Tag:=strtoint(vprev);
   while not Form_SelectIn.ADOQuery1.Eof do
   begin
    quantity:=quantity+Form_SelectIn.ADOQuery1DSDesigner11.Value;
    total_lucre:=total_lucre+Form_SelectIn.ADOQuery1DSDesigner19.Value;
    total_notax:=total_notax+form_selectin.ADOQuery1DSDesigner28.Value;
    Form_SelectIn.ADOQuery1.Next;
   end;
   
   Form_SelectIn.ADOQuery1.First;
   form_selectin.ADOQuery1.DisableControls;
   form_selectin.DataSource1.DataSet:=nil;
   form_selectin.DataSource1.DataSet:=form_selectin.ADOQuery1;
   form_selectin.ADOQuery1.EnableControls;
   form_selectin.PopupMenu1.Tag:=strtoint(vprev);
   Form_SelectIn.DataSource1.DataSet:=Form_SelectIn.ADOQuery1;
   Form_SelectIn.ADOQuery1.EnableControls;

   Form_SelectIn.Edit1.Text:=formatfloat('0.00',quantity);
   Form_SelectIn.Edit2.Text:=formatfloat('0.0000',total_lucre);
   Form_SelectIn.Edit4.Text:=formatfloat('0.0000',total_notax);
  if strtoint(vprev)<=2 then       //权限
  begin
  for i:=14 to 18 do form_selectin.DBGrid1.Columns[i].Visible:=false;
  Form_SelectIn.Edit2.Visible:=false;
  Form_SelectIn.Label2.Visible:=false;
  Form_SelectIn.Edit4.Visible:=false;
  Form_SelectIn.Label4.Visible:=false;
  end;
  form_selectin.ShowModal;
  form_selectin.free;
  end;
 end
 else //材料入库汇总
 begin
   if (sgrid1.RowCount=2) then
   messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
   else
   begin
   form6 := tform6.Create(application);
   with form6.adotota22 do
   begin
   close;
   for i := 1 to sgrid1.RowCount-2 do sql.Insert(21,sgrid1.Cells[2,i]);
   open;
//   ShowMessage('123');
   end;
   if strtoint(vprev)<=2 then       //权限
   begin
   form6.DBGrid1.Columns[8].Visible:=false;
   form6.DBGrid1.Columns[9].Visible:=false;
   end;
   Form_Condition.Hide;
   form6.ShowModal;
   form6.Free;
  end;
 end;
 1:
 if RGp4.ItemIndex=0 then //材料出库清单
 begin
  if sgrid1.RowCount=2 then
   messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
  else
  begin
  form_selectout:=tform_selectout.Create(application);
  with form_selectout.ADOQuery1 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do sql.Add(sgrid1.Cells[2,i]);
    sql.Add('order by data0017.inv_part_number');
    Prepared;
    open;
   end;
  form_selectout.ADOQuery1.DisableControls;
  form_selectout.DataSource1.DataSet:=nil;
  form_selectout.DataSource1.DataSet:=form_selectout.ADOQuery1;
  form_selectout.ADOQuery1.EnableControls;
  form_selectout.PopupMenu1.Tag:=strtoint(vprev);
   while not Form_SelectOut.ADOQuery1.Eof do
   begin
    quantity:=quantity+Form_Selectout.ADOQuery1QUANTITY.Value;
    total_lucre:=total_lucre+Form_Selectout.ADOQuery1DSDesigner6.Value;
    total_notax:=total_notax+Form_Selectout.ADOQuery1DSDesigner5.Value;
    Form_Selectout.ADOQuery1.Next;
   end;
   Form_SelectOut.Edit1.Text:=formatfloat('0.00',quantity);
   Form_SelectOut.Edit2.Text:=formatfloat('0.0000',total_lucre);
   Form_SelectOut.Edit4.Text:=formatfloat('0.0000',total_notax);
  if strtoint(vprev)<=2 then       //权限
  begin
  form_selectout.Edit2.Visible:=false;
  form_selectout.Label2.Visible:=false;
  form_selectout.Edit4.Visible:=false;
  form_selectout.Label4.Visible:=false;
  for i:=13 to 17 do form_selectout.DBGrid1.Columns[i].Visible:=false;
  end;
  form_selectout.ShowModal;
  form_selectout.free;
  end;
 end
 else  //材料出库汇总
 begin
  if sgrid1.RowCount=2 then
   messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
  else
  begin
   form7 := tform7.Create(application);
   with form7.adotota207 do
   begin
    close;
    for i := 1 to sgrid1.RowCount-2 do sql.Insert(24,sgrid1.Cells[2,i]);
    open;
   end;
   if strtoint(vprev)<=2 then       //权限
   begin
    form7.DBGrid1.Columns[8].Visible:=false;
    form7.DBGrid1.Columns[9].Visible:=false;
   end;
   Form_Condition.Hide;
   form7.ShowModal;
   form7.Free;
  end;
 end;
2://材料库存清单
 if RGp4.ItemIndex=0 then
 begin
  form_selectall:=tform_selectall.Create(application);
  with form_selectall.ADOQuery1 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
    Prepared;
    open;
   end;
   form_selectall.PopupMenu1.Tag:=strtoint(vprev);
  while not Form_SelectAll.ADOQuery1.Eof do
  begin
    quantity:=quantity+Form_SelectAll.ADOQuery1QUAN_ON_HAND.Value;
    total_lucre:=total_lucre+Form_SelectAll.ADOQuery1amount_tax.Value;
    total_notax:=total_notax+Form_SelectAll.ADOQuery1amount_notax.Value;
    Form_SelectAll.ADOQuery1.Next;
  end;
  Form_SelectAll.ADOQuery1.First;
  Form_SelectAll.DataSource1.DataSet:=Form_SelectAll.ADOQuery1;
  Form_SelectAll.ADOQuery1.EnableControls;

  Form_SelectAll.Edit1.Text:=formatfloat('0.00',quantity);
  Form_SelectAll.edit2.Text:=formatfloat('0.0000',total_lucre);
  Form_SelectAll.edit4.Text:=formatfloat('0.0000',total_notax);

   if strtoint(vprev)<=2 then       //权限
   begin
    for i:=9 to 13 do form_selectall.DBGrid1.Columns[i].Visible:=false;
    Form_SelectAll.Label2.Visible:=false;
    Form_SelectAll.Edit2.Visible:=false;
    Form_SelectAll.Label4.Visible:=false;
    Form_SelectAll.Edit4.Visible:=false;
   end;
   form_selectall.ShowModal;
   form_selectall.Free;
 end
 else          //库存汇总
 begin
 form4:=tform4.Create(application);
  with form4.ado22 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do
   sql.Insert(sql.Count-7,sgrid1.Cells[2,i]);
   open;
  end;
  if strtoint(vprev)<=2 then       //权限
  begin
   form4.DBGrid1.Columns[9].Visible:=false;
   form4.DBGrid1.Columns[10].Visible:=false;
   form4.DBGrid1.Columns[11].Visible:=false;
  end;
  Form_Condition.Hide;
  form4.ShowModal;
  form4.free;
 end;
end;
 screen.Cursor:=crDefault;
end;


procedure TForm_Condition.Button1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox1.Items[listbox1.itemindex]  then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox1.Items[listbox1.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit1.Text;
 case listbox1.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0070.PO_NUMBER LIKE '''+edit1.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0017.INV_PART_NUMBER LIKE '''+edit1.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0496.GROUP_NAME LIKE '''+edit1.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0133.GRN_NUMBER LIKE '''+edit1.Text+'%''';
 4:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:= //材料接收长日期格式
   'and  Data0133.create_DATE>='''+datetostr(dtpk1.date)+
   formatdatetime(' hh:nn:ss',DTtm1.Time)+
   '''and Data0133.create_DATE<='''+datetostr(dtpk2.date)+
   formatdatetime(' hh:nn:ss',DTtm2.Time)+'''';
  end;
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0023.code LIKE '''+trim(edit1.Text)+'%''';
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0015.warehouse_code LIKE '''+trim(edit1.Text)+'%''';
 7:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0133.DELIVER_NUMBER LIKE '''+trim(edit1.Text)+'%''';
 8:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0019.inv_group_name LIKE '''+trim(edit1.Text)+'%''';
 9:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0016.code LIKE ''%'+trim(edit1.Text)+'%''';
end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TForm_Condition.BitBtn4Click(Sender: TObject);
begin
case listbox1.ItemIndex of
1:
 begin
  form_inventory:=tform_inventory.Create(application);
  form_inventory.ADOQuery1.Close;
  form_inventory.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inventory.ADOQuery1.Open;
  if form_inventory.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_inventory.ADOQuery1INV_PART_NUMBER.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_inventory.free;
 end;
2:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_invtype.free;
 end;
5:
 begin
  form_supply:=tform_supply.Create(application);
  if form_supply.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_supply.adoquery1code.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_supply.free;
 end;
6:
 begin
  form_warehouse:=tform_warehouse.Create(application);
  if form_warehouse.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_warehouse.ADOQuery1WAREHOUSE_CODE.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_warehouse.free;
 end;
8:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_invgroup.Free;
 end;

 9:
 begin
  form_location:=Tform_location.Create(application);
  if form_location.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_location.ADOQuery1CODE.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_location.free;
 end;
end;

end;

procedure TForm_Condition.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_Condition.BitBtn5Click(Sender: TObject);
begin
case listbox2.ItemIndex of
1:
 begin
  form_inventory:=tform_inventory.Create(application);
  form_inventory.ADOQuery1.Close;
  form_inventory.ADOQuery1.Parameters[1].Value:=trim(edit2.Text);
  form_inventory.ADOQuery1.Open;
  if form_inventory.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_inventory.ADOQuery1INV_PART_NUMBER.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_inventory.free;
 end;
2:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_invtype.free;
 end;
3:
 begin
  form_warehouse:=Tform_warehouse.Create(application);
  if form_warehouse.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_warehouse.ADOQuery1WAREHOUSE_CODE.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_warehouse.free;
 end;
4:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_invgroup.Free;
 end;
6:
 begin
  form_location:=Tform_location.Create(application);
  if form_location.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_location.ADOQuery1CODE.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_location.free;
 end;
7:
 begin
  Form_user:=TForm_user.Create(application);
  if Form_user.ShowModal=mrok then
   begin
    edit2.Text:=trim(Form_user.ADOQuery1EMPL_CODE.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  Form_user.free;
 end;
8:
 begin
  form_supply:=tform_supply.Create(application);
  if form_supply.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_supply.adoquery1code.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_supply.free;
 end;
 end;
end;


procedure TForm_Condition.Button2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox2.Items[listbox2.itemindex]  then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit2.Text;
 case listbox2.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0724.GON_NUMBER LIKE '''+edit2.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0017.INV_PART_NUMBER LIKE '''+edit2.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0496.GROUP_NAME LIKE '''+edit2.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0015.warehouse_code like'''+edit2.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0019.inv_group_name LIKE '''+trim(edit2.Text)+'%''';
 5: begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=               //材料出库长日期格式
   'and  Data0724.CREATE_DATE>='''+datetostr(dtpk3.date)+
   formatdatetime(' hh:nn:ss',self.Dttm3.Time)+
   '''and Data0724.CREATE_DATE<='''+datetostr(dtpk4.date)+
   formatdatetime(' hh:nn:ss',self.Dttm4.Time)+'''';
  end;
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0016.code LIKE ''%'+trim(edit2.Text)+'%''';
 7:
  sgrid1.Cells[2,sgrid1.RowCount-1]:= 'and Data0005.EMPL_CODE LIKE '''+trim(edit2.Text)+'%''';
 8:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0023.code LIKE ''%'+edit2.Text+'%''';
 9:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0070.PO_NUMBER LIKE '''+edit2.Text+'%''';
10:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0133.GRN_NUMBER LIKE ''%'+edit2.Text+'%''';

end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TForm_Condition.Button7Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=label21.Caption;
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit7.Text;

 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0017.INV_PART_NUMBER LIKE ''%'+edit7.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0019.inv_GROUP_NAME LIKE '''+edit7.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0496.GROUP_NAME LIKE ''%'+edit7.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0023.code LIKE ''%'+edit7.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0015.WAREHOUSE_CODE LIKE ''%'+trim(edit7.Text)+'%''';
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0016.CODE LIKE ''%'+trim(edit7.Text)+'%''';
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0017.INV_DESCRIPTION LIKE ''%'+trim(edit7.Text)+'%''';
 7:
 sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0070.PO_NUMBER LIKE '''+trim(edit7.Text)+'%''';
 8:
 begin
  sgrid1.Cells[1,sgrid1.RowCount-1]:=ComboBox1.Text;
  case combobox1.ItemIndex of
   0: sgrid1.Cells[2,sgrid1.RowCount-1] := ' and  dbo.Data0134.EXPIRE_DATE is not null and DATEDIFF(day, GETDATE(), dbo.Data0134.EXPIRE_DATE)>= 0  and DATEDIFF(day,dbo.Data0133.ship_date, GETDATE())<335 ';  //有效
   1: sgrid1.Cells[2,sgrid1.RowCount-1] := ' and  dbo.Data0134.EXPIRE_DATE is not null and DATEDIFF(day, GETDATE(), dbo.Data0134.EXPIRE_DATE)< 0';        //过期
   2: sgrid1.Cells[2,sgrid1.RowCount-1] := ' and  DATEDIFF(day,dbo.Data0133.ship_date, GETDATE())>=365 ';        //呆滞
   3: sgrid1.Cells[2,sgrid1.RowCount-1] :=' and ((DATEDIFF(day,dbo.Data0133.ship_date, GETDATE())>=335 and  DATEDIFF(day,dbo.Data0133.ship_date, GETDATE())<365)  '+    //快过期 +快呆滞
                        ' or (dbo.Data0134.EXPIRE_DATE is not null and DATEDIFF(day, GETDATE(), dbo.Data0134.EXPIRE_DATE)>0 and  DATEDIFF(day, GETDATE(), dbo.Data0134.EXPIRE_DATE)<=30 ))'
  end;
  end;
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm_Condition.BitBtn11Click(Sender: TObject);
begin
case listbox3.ItemIndex of
0:
 begin
  form_inventory:=tform_inventory.Create(application);
  form_inventory.ADOQuery1.Close;
  form_inventory.ADOQuery1.Parameters[1].Value:=trim(edit7.Text);
  form_inventory.ADOQuery1.Open;
  if form_inventory.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_inventory.ADOQuery1INV_PART_NUMBER.Value);
    button7.Enabled:=true;
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_inventory.free;
 end;
1:
begin
form_invGroup:=tform_invGroup.Create(application);
if form_invgroup.ShowModal=mrok then
begin
edit7.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
button7.Enabled:=true;
button7.SetFocus;
end
else
edit7.SetFocus;
form_invgroup.Free;
end;
2:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button7.Enabled:=true;
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_invtype.free;
 end;
3:
 begin
  form_supply:=tform_supply.Create(application);
  if form_supply.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_supply.adoquery1code.Value);
    button7.Enabled:=true;
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_supply.free;
 end;

4:
 begin
  form_warehouse:=tform_warehouse.Create(application);
  if form_warehouse.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_warehouse.ADOQuery1WAREHOUSE_CODE.Value);
    button7.Enabled:=true;
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_warehouse.free;
 end;

5:
 begin
  form_location:=tform_location.Create(application);
  if form_location.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_location.ADOQuery1.FieldValues['code']);
    button7.Enabled:=true;
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_location.free;
 end;
6:
 begin

 end;
end;

end;

procedure TForm_Condition.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
 sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm_Condition.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

procedure TForm_Condition.Edit1Change(Sender: TObject);
begin
  if trim(edit1.Text)<>'' then
    button1.Enabled:=true
  else
    button1.Enabled:=false;
end;

procedure TForm_Condition.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit1.Text)<>'' then
 button1.Enabled:=true
else
 button1.Enabled:=false;
end;

procedure TForm_Condition.Edit2Click(Sender: TObject);
begin
if trim(edit2.Text)<>'' then
 button2.Enabled:=true
else
 button2.Enabled:=false;
end;

procedure TForm_Condition.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit2.Text)<>'' then
 button2.Enabled:=true
else
 button2.Enabled:=false;
end;

procedure TForm_Condition.Edit7Click(Sender: TObject);
begin
if trim(edit7.Text)<>'' then
 button7.Enabled:=true
else
 button7.Enabled:=false;
end;

procedure TForm_Condition.Edit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit7.Text)<>'' then
 button7.Enabled:=true
else
 button7.Enabled:=false;
end;
end.
