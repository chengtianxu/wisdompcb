unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, Buttons, Grids, ExtCtrls, ComCtrls, DB,
  ADODB;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    DTPk2: TDateTimePicker;
    DTPk1: TDateTimePicker;
    Edit1: TEdit;
    Button1: TButton;
    BitBtn4: TBitBtn;
    ADOConnection1: TADOConnection;
    ListBox1: TListBox;
    StaticText1: TStaticText;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    DtPk4: TDateTimePicker;
    DtPk3: TDateTimePicker;
    Button2: TButton;
    BitBtn5: TBitBtn;
    Edit2: TEdit;
    RadioGroup1: TRadioGroup;
    RGp2: TRadioGroup;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox3: TListBox;
    StaticText4: TStaticText;
    DTPk6: TDateTimePicker;
    DTPk5: TDateTimePicker;
    Button3: TButton;
    BitBtn6: TBitBtn;
    Edit3: TEdit;
    db_ptr: TLabel;
    vprev: TLabel;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DTPk7: TDateTimePicker;
    Edit4: TEdit;
    ListBox4: TListBox;
    StaticText5: TStaticText;
    DTPk8: TDateTimePicker;
    Button4: TButton;
    BitBtn7: TBitBtn;
    RGp3: TRadioGroup;
    RGp4: TRadioGroup;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DTPk10: TDateTimePicker;
    DTPk9: TDateTimePicker;
    Button5: TButton;
    BitBtn8: TBitBtn;
    ListBox5: TListBox;
    StaticText6: TStaticText;
    Edit5: TEdit;
    GroupBox6: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    DTPk12: TDateTimePicker;
    DTpk11: TDateTimePicker;
    Button6: TButton;
    BitBtn9: TBitBtn;
    ListBox6: TListBox;
    StaticText7: TStaticText;
    Edit6: TEdit;
    BitBtn10: TBitBtn;
    Label_rkey15: TLabel;
    GroupBox7: TGroupBox;
    Label21: TLabel;
    Button7: TButton;
    BitBtn11: TBitBtn;
    ListBox7: TListBox;
    StaticText8: TStaticText;
    Edit7: TEdit;
    ADOserver_date: TADOQuery;
    ADOserver_datedate1: TStringField;
    dttm4: TDateTimePicker;
    dttm3: TDateTimePicker;
    dttm11: TDateTimePicker;
    dttm12: TDateTimePicker;
    dttm9: TDateTimePicker;
    dttm10: TDateTimePicker;
    DTTm1: TDateTimePicker;
    DTTm2: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListBox4Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure RGp4Click(Sender: TObject);
    procedure ListBox5Click(Sender: TObject);
    procedure Edit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn8Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit6KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure ListBox7Click(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private declarations }
    hMapFile: THandle;
    MapFilePointer: Pointer;
    dept_ptr: integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses  inventory, inv_serach, invtype_search, supplier_search,
  warehouse_search, dpment_search, outsql, invt_quan, location_search,
  invtransfer, Employee_search, rec_total, put_total, inv_group,
  rece_put_stock, inv_minxi;
{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 i:byte;
 quantity,total_lucre:double;
begin
 quantity:=0;
 total_lucre:=0;
case radiogroup1.ItemIndex of
0:
begin
if (rgp4.ItemIndex=0) then//材料接收明细
 begin
 if (sgrid1.RowCount=2) then
  messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
 else
  begin
  form2:=tform2.Create(application);
   with form2.ado0022 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do sql.Add(sgrid1.Cells[2,i]);
     sql.Add('order by Data0496.GROUP_NAME,data0017.inv_part_number');
    open;
   end;
   form2.ado0022.DisableControls;
   form2.DataSource1.DataSet:=nil;
   while not form2.ado0022.Eof do
   begin
    quantity:=quantity+form2.ado0022QUANTITY.Value;
    total_lucre:=total_lucre+form2.ado0022DSDesigner5.Value;
    form2.ado0022.Next;
   end;
   form2.ado0022.First;
   form2.DataSource1.DataSet:=form2.ado0022;
   form2.ado0022.EnableControls;

   form2.Edit1.Text:=formatfloat('0.00',quantity);
   form2.Edit2.Text:=formatfloat('0.0000',total_lucre);
  if strtoint(vprev.Caption)<=2 then       //权限
   begin
    form2.Edit2.Visible:=false;
    form2.Label2.Visible:=false;
    form2.DBGrid1.Columns[11].Visible:=false;
    form2.DBGrid1.Columns[13].Visible:=false;
    form2.DBGrid1.Columns[16].Visible:=false;
    form2.DBGrid1.Columns[17].Visible:=false;
    form2.DBGrid1.Columns[18].Visible:=false;
   end;
  form1.Hide;
  form2.ShowModal;
  form2.free;
  end;
 end
else   //查找材料接收汇总数据
 begin
  form6 := tform6.Create(application);
  with form6.adotota22 do
   begin
    close;
    for i := 1 to sgrid1.RowCount-2 do sql.Insert(24,sgrid1.Cells[2,i]);
    open;
   end;
  if strtoint(vprev.Caption)<=2 then       //权限
   begin
    form6.DBGrid1.Columns[8].Visible:=false;
    form6.DBGrid1.Columns[9].Visible:=false;
   end;
  form1.Hide;
  form6.ShowModal;
  form6.Free;
 end;
end;
1:          //材料发放
 begin
 if rgp4.ItemIndex=0 then //发放明细
  begin
  if sgrid1.RowCount=2 then
   messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
  else
  begin
  form3:=tform3.Create(application);
  with form3.ado207 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do sql.Add(sgrid1.Cells[2,i]);
    sql.Add('order by Data0034.DEPT_CODE,data0017.inv_part_number');
    open;
   end;

  form3.ado207.DisableControls;
  form3.DataSource1.DataSet:=nil;
  while not form3.ado207.Eof do
   begin
    quantity:=quantity+form3.ado207QUANTITY.Value;
    total_lucre:=total_lucre+form3.ado207DSDesigner2.Value;
    form3.ado207.Next;
   end;
   form3.ado207.First;
  form3.DataSource1.DataSet:=form3.ado207;
  form3.ado207.EnableControls;

  form3.Edit1.Text:=formatfloat('0.00',quantity);
  form3.edit2.Text:=formatfloat('0.0000',total_lucre);
  if strtoint(vprev.Caption)<=2 then       //权限
  begin
   form3.Label2.Visible:=false;
   form3.Edit2.Visible:=false;
   form3.DBGrid1.Columns[12].Visible:=false;
   form3.DBGrid1.Columns[14].Visible:=false;
   form3.DBGrid1.Columns[15].Visible:=false;
   form3.DBGrid1.Columns[16].Visible:=false;   
  end;
  form1.Hide;
  form3.ShowModal;
  form3.free;
  end;
 end
else  //发放汇总
 begin
  form7 := tform7.Create(application);
  with form7.adotota207 do
   begin
    close;
    for i := 1 to sgrid1.RowCount-2 do sql.Insert(24,sgrid1.Cells[2,i]);
    open;
   end;
  if strtoint(vprev.Caption)<=2 then       //权限
   begin
    form7.DBGrid1.Columns[8].Visible:=false;
    form7.DBGrid1.Columns[9].Visible:=false;
   end;
  form1.Hide;
  form7.ShowModal;
  form7.Free;
 end;
end;
2:
if rgp4.ItemIndex=0 then//材料库存查询明细
 begin
  form9:=tform9.Create(application);
  with form9.ado0022 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
    open;
   end;
  if strtoint(vprev.Caption)<=2 then       //权限
   begin
    form9.DBGrid1.Columns[9].Visible:=false;
    form9.DBGrid1.Columns[10].Visible:=false;
    form9.DBGrid1.Columns[11].Visible:=false;
   end;
  form1.Hide;
  form9.ShowModal;
  form9.free;
 end
else          //库存汇总
 begin
  form4:=tform4.Create(application);
  with form4.ado22 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-5,sgrid1.Cells[2,i]);
    open;
   end;
  if strtoint(vprev.Caption)<=2 then       //权限
   begin
    form4.DBGrid1.Columns[8].Visible:=false;
    form4.DBGrid1.Columns[9].Visible:=false;
    form4.DBGrid1.Columns[10].Visible:=false;
   end;
  form1.Hide;
  form4.ShowModal;
  form4.free;
 end;
3:
 begin
  form5:=tform5.Create(application);
  with form5.ado27 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do
     sql.Insert(19,sgrid1.Cells[2,i]);
    open;
   end;
  if form5.ado27.IsEmpty then
   messagedlg('对不起!没有找到符合条件的数据',mtinformation,[mbok],0)
  else
   begin
    form1.Hide;
    form5.ShowModal;
    form5.free;
   end;
 end;
end;

end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
label2.Caption:=listbox1.Items[listbox1.itemindex];
edit1.Text:='';
button1.Enabled:=false;
rgp2.Visible:=false;
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
1:
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
//  rgp2.Visible:=true;
  bitbtn4.Visible:=true;
  edit1.Visible:=true;
  label3.Visible:=false;
  label4.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
 end;

end;

end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
case listbox1.ItemIndex of
1:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;
  if form_inv.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_inv.free;
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
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_supp.adoquery1code.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_supp.free;
 end;
6:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
  form_wh.free;
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

end;

end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit1.Text)<>'' then
 button1.Enabled:=true
else
 button1.Enabled:=false;
end;

procedure TForm1.Button1Click(Sender: TObject);
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
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0456.GRN_NUMBER LIKE '''+edit1.Text+'%''';
 4:
{  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:= //材料接收长日期格式
   'and  Data0456.ship_DATE>='''+datetostr(dtpk1.date)+''' and Data0456.ship_DATE<='''+datetostr(dtpk2.date+1)+'''';
  end;}
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:= //材料接收长日期格式
   'and  Data0456.ship_DATE>='''+datetostr(dtpk1.date)+
   formatdatetime(' hh:nn:ss',DTtm1.Time)+
   '''and Data0456.ship_DATE<='''+datetostr(dtpk2.date)+
   formatdatetime(' hh:nn:ss',DTtm2.Time)+'''';
  end;
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0023.code LIKE '''+trim(edit1.Text)+'%''';
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0015.warehouse_code LIKE '''+trim(edit1.Text)+'%''';
 7:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0456.DELIVER_NUMBER LIKE '''+trim(edit1.Text)+'%''';
 8:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0019.inv_group_name LIKE '''+trim(edit1.Text)+'%''';
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
 s:string;
begin
  hMapFile := CreateFileMapping ($FFFFFFFF, // 特殊内存映射句柄
    nil, page_ReadWrite, 0,10000, 'coimasp20'); // 文件名
  MapFilePointer := MapViewOfFile (hMapFile,File_Map_All_Access, 0, 0, 0); // 访问整个映象文件
  S := PChar (MapFilePointer);//从共享内存读出内容

  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
bitbtn2click(sender);

if groupbox5.Visible = true then
 groupbox5.Visible := false;
if groupbox6.Visible = true then
 groupbox6.Visible := false;
if groupbox7.Visible = true then
 groupbox7.Visible := false;

rgp4.ItemIndex:=0;
rgp4.Visible:=true;

case radiogroup1.ItemIndex of
0:
 begin
  groupbox1.Visible:=true;
  groupbox2.Visible:=false;
  groupbox3.Visible:=false;
  groupbox4.Visible:=false;

  listbox1.Selected[0]:=true;
  listbox1click(sender);
 end;
1:
 begin
  groupbox1.Visible:=false;
  groupbox3.Visible:=false;
  groupbox2.Visible:=true;
  groupbox4.Visible:=false;

  listbox2.Selected[0]:=true;
  listbox2click(sender);
 end;
2:
 begin
  groupbox1.Visible:=false;
  groupbox3.Visible:=false;
  groupbox7.Visible:=true;
  groupbox2.Visible:=false;
  groupbox4.Visible:=false;

  listbox7.Selected[0]:=true;
//  listbox7click(sender);
 end;
3:
 begin
  groupbox1.Visible:=false;
  groupbox3.Visible:=false;
  groupbox2.Visible:=false;
  groupbox4.Visible:=true;
  rgp4.Visible:=false;
  listbox4.Selected[0]:=true;
  listbox4click(sender);
 end;
end;

end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
label6.Caption:=listbox2.Items[listbox2.itemindex];
edit2.Text:='';
edit2.Visible:=true;
button2.Enabled:=false;
edit2.Enabled:=true;
bitbtn5.Visible:=true;
label5.Visible:=false;
label1.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
dttm3.Visible:=false;
dttm4.Visible:=false;
case listbox2.ItemIndex of
0:bitbtn5.Visible:=false;
1:;
2:;
3:bitbtn5.Visible:=false;
4:;
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
6:;
7:edit2.Enabled:=false;
8:bitbtn5.Visible:=false;
9:;
10:bitbtn5.Visible:=false;
end;

end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
case listbox2.ItemIndex of
1:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_inv.free;
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
4:
 begin
  form_dept:=tform_dept.Create(application);
  if form_dept.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_dept.ADOQuery1dept_code.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_dept.free;
 end;
6:
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
7:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    label_rkey15.Caption := form_wh.ADOQuery1RKEY.AsString;
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   listbox2.SetFocus;
  form_wh.free;
 end;
9:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_supp.adoquery1code.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
  form_supp.free;
 end;

end;

end;

procedure TForm1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit2.Text)<>'' then
 button2.Enabled:=true
else
 button2.Enabled:=false;
end;

procedure TForm1.Button2Click(Sender: TObject);
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
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0457.GON_NUMBER LIKE '''+edit2.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0017.INV_PART_NUMBER LIKE '''+edit2.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0496.GROUP_NAME LIKE '''+edit2.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0468.CUT_NO LIKE '''+edit2.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0034.DEPT_code LIKE '''+edit2.Text+'%''';
 5:
 { begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=               //材料发放长日期格式
   'and  Data0207.tdate>='''+datetostr(dtpk3.date)+'''and Data0207.tdate<='''+datetostr(dtpk4.date+1)+'''';
  end;}
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=               //材料发放长日期格式
   'and  Data0207.TDATE>='''+datetostr(dtpk3.date)+
   formatdatetime(' hh:nn:ss',self.Dttm3.Time)+
   '''and Data0207.TDATE<='''+datetostr(dtpk4.date)+
   formatdatetime(' hh:nn:ss',self.Dttm4.Time)+'''';
  end;
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0019.inv_group_name LIKE '''+trim(edit2.Text)+'%''';
 7:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0456.WareHOUSE_PTR='+label_rkey15.Caption;
 8:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0457.ref_number LIKE ''%'+edit2.Text+'%''';
 9:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0023.code LIKE '''+trim(edit2.Text)+'%''';
10:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0022.BARCODE_ID LIKE ''%'+edit2.Text+'%''';
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if listbox1.ItemIndex=8 then
if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
 abort
else
 if key = chr(46) then      //判断是否重复输入小数点'.'
  if pos('.',edit1.Text)>0
   then abort;
end;

procedure TForm1.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin
 label9.Caption:=listbox3.Items[listbox3.itemindex];
 label7.Visible:=false;
 label8.Visible:=false;
 dtpk5.Visible:=false;
 dtpk6.Visible:=false;
 edit3.Text:='';
 edit3.Visible:=true;
 bitbtn6.Visible:=true;
 button3.Enabled:=false;
case listbox3.ItemIndex of
 0:;
 1:;
 2:;
 3:;
 4:
 begin
  label7.Visible:=true;
  label8.Visible:=true;
  dtpk5.Visible:=true;
  dtpk6.Visible:=true;
  edit3.Visible:=false;
  bitbtn6.Visible:=false;
  button3.Enabled:=true;
 end;
 5:;
 6:;
 7:bitbtn6.Visible:=false;
end;

end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
case listbox3.ItemIndex of
0:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_inv.free;
 end;
1:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_invtype.free;
 end;
2:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_wh.free;
 end;
3:
 begin
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_lo.ADOQuery1.FieldValues['code']);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_lo.free;
 end;
5:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_supp.adoquery1code.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_supp.free;
 end;
6:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_invgroup.Free;
 end;
end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox3.Items[listbox3.itemindex]  then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit3.Text;
 case listbox3.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0017.INV_PART_NUMBER LIKE ''%'+trim(edit3.Text)+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0496.GROUP_NAME LIKE '''+trim(edit3.Text)+'%''';
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015.warehouse_code LIKE '''+trim(edit3.Text)+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0016.code LIKE '''+trim(edit3.Text)+'%''';
 4:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk5.date)+'到'+datetostr(dtpk6.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and  Data0022.expire_date>='''+datetostr(dtpk5.date)+'''and Data0022.expire_date<='''+datetostr(dtpk6.date)+'''';
  end;
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0023.code LIKE '''+trim(edit3.Text)+'%''';
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0019.inv_group_name LIKE '''+trim(edit3.Text)+'%''';
 7:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0017.INV_PART_description LIKE ''%'+trim(edit3.Text)+'%''';
 end;

 sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
if not ADOConnection1.Connected then
 begin
  if trim(vprev.Caption)='' then  close;
  adoconnection1.ConnectionString := db_ptr.Caption;
  Adoconnection1.Connected := true;
  listbox1.Selected[0]:=true;

  self.ADOserver_date.Open;
  
  dtpk2.Date:=strtodate(self.ADOserver_datedate1.Value);
  dtpk1.Date:=dtpk2.Date-60;
  dtpk4.Date:=dtpk2.Date;
  dtpk3.Date:=dtpk2.Date-60;
  dtpk6.Date:=dtpk2.Date;
  dtpk5.Date:=dtpk2.Date-60;
  dtpk8.Date:=dtpk2.Date;
  dtpk7.Date:=dtpk2.Date-60;
  dtpk10.Date:=dtpk2.Date;
  dtpk9.Date:=dtpk2.Date-30;
  dtpk12.Date:=dtpk2.Date;
  dtpk11.Date:=dtpk2.Date-30;
 end;
end;

procedure TForm1.ListBox4Click(Sender: TObject);
begin
 edit4.Text:='';
 edit4.Visible:=true;
 button4.Enabled:=false;
 bitbtn7.Visible:=true;
 label10.Visible:=false;
 label11.Visible:=false;
 dtpk7.Visible:=false;
 dtpk8.Visible:=false;
 rgp3.Visible:=false;
 label12.Caption:=listbox4.Items[listbox4.itemindex];
 case listbox4.ItemIndex of
 0:;
 1:
 begin
  label10.Visible:=true;
  label11.Visible:=true;
  dtpk7.Visible:=true;
  dtpk8.Visible:=true;
  edit4.Visible:=false;
  bitbtn7.Visible:=false;
  button4.Enabled:=true;
 end;
 2:
  begin
   rgp3.Visible:=true;
   bitbtn7.Visible:=false;
  end;
 3:;
 4:begin
    bitbtn7.Visible:=false;
   end;
 5:;
 6:;
 end;
end;

procedure TForm1.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if listbox4.ItemIndex=2 then
if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
 abort
else
 if key = chr(46) then      //判断是否重复输入小数点'.'
  if pos('.',edit4.Text)>0
   then abort;
end;

procedure TForm1.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit4.Text)<>'' then
 button4.Enabled:=true
else
 button4.Enabled:=false;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
case listbox4.ItemIndex of
0:
 try
  frmempl:=tfrmempl.Create(application);
  if frmempl.ShowModal=mrok then
   begin
    edit4.Text:=frmempl.ADOQuery1employee_name.Value;
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
   edit4.SetFocus;
 finally
  frmempl.free;
 end;
 3:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit4.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
   edit4.SetFocus;
  form_inv.free;
 end;
 5,6:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit4.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
   edit4.SetFocus;
  form_wh.free;
 end;
end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i] = listbox4.Items[listbox4.itemindex] then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;
 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox4.Items[listbox4.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit4.Text;
 case listbox4.ItemIndex of
 0: sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0005.employee_name LIKE '''+trim(edit4.Text)+'%''';
 1:
 begin
  sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk7.date)+'到'+datetostr(dtpk8.date);
  sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and  Data0027.TDATE>='''+datetostr(dtpk7.date)+''' and Data0027.TDATE<='''+datetostr(dtpk8.date)+'''';
 end;
 2:
  case rgp3.ItemIndex of
   0:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0027.quantity >'+trim(edit4.Text)+'';
   1:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0027.quantity ='+trim(edit4.Text)+'';
   2:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0027.quantity <'+trim(edit4.Text)+'';
  end;
 3:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0017.inv_part_number LIKE '''+trim(edit4.Text)+'%''';
 4:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0022.barcode_id LIKE '''+trim(edit4.Text)+'%''';
 5:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015_1.warehouse_code LIKE '''+trim(edit4.Text)+'%''';
 6:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015_2.warehouse_code LIKE '''+trim(edit4.Text)+'%''';
 end;
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.RGp4Click(Sender: TObject);
begin
bitbtn2click(sender);
if radiogroup1.ItemIndex=0 then//接收
 if rgp4.ItemIndex=0 then     //接收明细
  begin
   groupbox1.Visible:=true;
   groupbox5.Visible:=false;
  end
 else                        //接收汇总
  begin
   groupbox1.Visible:=false;
   groupbox5.Visible:=true;
   listbox5.Selected[0]:=true;
   listbox5click(sender);
  end
else
 if radiogroup1.ItemIndex=1 then //发放
  if rgp4.ItemIndex=0 then //发放明细
  begin
   groupbox2.Visible:=true;
   groupbox6.Visible:=false;
  end
  else                 //发放汇总
  begin
   groupbox2.Visible:=false;
   groupbox6.Visible:=true;
   listbox6.Selected[0]:=true;
   listbox6click(sender);
  end
 else  //库存
  if radiogroup1.ItemIndex=2 then //发放
  if rgp4.ItemIndex=0 then
  begin
   groupbox7.Visible:=true;
   groupbox3.Visible:=false;
  end
  else
  begin
   groupbox7.Visible:=false;
   groupbox3.Visible:=true;
   listbox3.Selected[0]:=true;
   listbox3click(sender);
  end
end;

procedure TForm1.ListBox5Click(Sender: TObject);
begin
label15.Caption:=listbox5.Items[listbox5.itemindex];
edit5.Text:='';
edit5.Visible:=true;
edit5.Enabled:=true;
button5.Enabled:=false;
bitbtn8.Visible:=true;
label13.Visible:=false;
label14.Visible:=false;
dtpk9.Visible:=false;
dtpk10.Visible:=false;
dttm9.Visible:=false;
dttm10.Visible:=false;
case listbox5.ItemIndex of
0:
 begin

 end;
1:
 begin

 end;
2:
 begin
  edit5.Visible:=false;
  button5.Enabled:=true;
  bitbtn8.Visible:=false;
  label13.Visible:=true;
  label14.Visible:=true;
  dtpk9.Visible:=true;
  dtpk10.Visible:=true;
  dttm9.Visible:=true;
  dttm10.Visible:=true;
 end;
3:
 begin

 end;
4:;
5:edit5.Enabled:=false;
end;

end;

procedure TForm1.Edit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit5.Text)<>'' then
 button5.Enabled:=true
else
 button5.Enabled:=false;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
case listbox5.ItemIndex of
0:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   edit5.SetFocus;
  form_inv.free;
 end;
1:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   edit5.SetFocus;
  form_invtype.free;
 end;
3:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_supp.adoquery1code.Value);
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   edit5.SetFocus;
  form_supp.free;
 end;
4:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   edit5.SetFocus;
  form_invgroup.Free;
 end;
5:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit5.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    label_rkey15.Caption := form_wh.ADOQuery1RKEY.AsString;
    button5.Enabled:=true;
    button5.SetFocus;
   end
  else
   listbox5.SetFocus;
  form_wh.free;
 end;
end;
end;

procedure TForm1.Button5Click(Sender: TObject);//材料汇总
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox5.Items[listbox5.itemindex]  then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox5.Items[listbox5.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit5.Text;
 case listbox5.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0017.INV_PART_NUMBER LIKE '''+edit5.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0496.GROUP_NAME LIKE '''+edit5.Text+'%''';
 2:
{  begin
   sgrid1.Cells[1,sgrid1.RowCount-1] := '从'+datetostr(dtpk9.date)+'到'+datetostr(dtpk10.date);
   sgrid1.Cells[2,sgrid1.RowCount-1] :=                  //材料接收日期为长格式
   'and  data0456.ship_date >= '''+datetostr(dtpk9.date)+''' and data0456.ship_date <= '''+datetostr(dtpk10.date+1)+'''';
  end;}
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1] := '从'+datetostr(dtpk9.date)+'到'+datetostr(dtpk10.date);
   sgrid1.Cells[2,sgrid1.RowCount-1] :=                  //材料接收日期为长格式
   'and  data0456.ship_date >= '''+datetostr(dtpk9.date)+
   formatdatetime(' hh:nn:ss',self.Dttm9.Time)+
   ''' and data0456.ship_date <= '''+datetostr(dtpk10.date)+
   formatdatetime(' hh:nn:ss',self.Dttm10.Time)+'''';
  end;
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0023.code LIKE '''+edit5.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0019.inv_group_name LIKE '''+trim(edit5.Text)+'%''';
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0456.warehouse_ptr='+label_rkey15.Caption;
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.Edit6KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit6.Text)<>'' then
 button6.Enabled:=true
else
 button6.Enabled:=false;
end;

procedure TForm1.ListBox6Click(Sender: TObject);
begin
label18.Caption:=listbox6.Items[listbox6.itemindex];
edit6.Text:='';
edit6.Visible:=true;
edit6.Enabled:=true;
button6.Enabled:=false;
bitbtn9.Visible:=true;
label16.Visible:=false;
label17.Visible:=false;
dtpk11.Visible:=false;
dtpk12.Visible:=false;
dttm11.Visible:=false;
dttm12.Visible:=false;
case listbox6.ItemIndex of
0:
 begin

 end;
1:
 begin

 end;
2:
 begin
  edit6.Visible:=false;
  button6.Enabled:=true;
  bitbtn9.Visible:=false;
  label16.Visible:=true;
  label17.Visible:=true;
  dtpk11.Visible:=true;
  dtpk12.Visible:=true;
  dttm11.Visible:=true;
  dttm12.Visible:=true;
 end;
3:
 begin

 end;
4:;
5:edit6.Enabled:=false;
6:edit6.Enabled:=false;
end;

end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
case listbox6.ItemIndex of
0:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
  form_inv.free;
 end;
1:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
  form_invtype.free;
 end;
3:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_supp.adoquery1code.Value);
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
  form_supp.free;
 end;
4:
 begin
  form_invgroup:=tform_invgroup.Create(application);
  if form_invgroup.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_invgroup.ADOQuery1inv_group_name.Value);
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   edit6.SetFocus;
  form_invgroup.Free;
 end;
5:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    label_rkey15.Caption := form_wh.ADOQuery1RKEY.AsString;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   listbox6.SetFocus;
  form_wh.free;
 end;
6:
 begin
  form_dept:=tform_dept.Create(application);
  if form_dept.ShowModal=mrok then
   begin
    edit6.Text:=trim(form_dept.ADOQuery1dept_code.Value);
    dept_ptr:=form_dept.ADOQuery1rkey.Value;
    button6.Enabled:=true;
    button6.SetFocus;
   end
  else
   listbox6.SetFocus;
  form_dept.free;
 end;

end;

end;

procedure TForm1.Button6Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox6.Items[listbox6.itemindex]  then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox6.Items[listbox6.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit6.Text;
 case listbox6.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0017.INV_PART_NUMBER LIKE '''+edit6.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0496.GROUP_NAME LIKE '''+edit6.Text+'%''';
 2:
{  begin
   sgrid1.Cells[1,sgrid1.RowCount-1] := '从'+datetostr(dtpk11.date)+'到'+datetostr(dtpk12.date);
   sgrid1.Cells[2,sgrid1.RowCount-1] := //材料接收日期为长格式
   'and Data0207.tdate >= '''+datetostr(dtpk11.date)+'''and Data0207.tdate <= '''+datetostr(dtpk12.date+1)+'''';
  end;}
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1] := '从'+datetostr(dtpk11.date)+'到'+datetostr(dtpk12.date);
   sgrid1.Cells[2,sgrid1.RowCount-1] := //材料接收日期为长格式
   'and Data0207.TDATE >= '''+datetostr(dtpk11.date)+
   formatdatetime(' hh:nn:ss',self.Dttm11.Time)+
   '''and Data0207.TDATE <= '''+datetostr(dtpk12.date)+
   formatdatetime(' hh:nn:ss',self.Dttm12.Time)+'''';
  end;
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0023.code LIKE '''+edit6.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0019.inv_group_name LIKE '''+trim(edit6.Text)+'%''';
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0456.WareHOUSE_PTR='+label_rkey15.Caption;
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0207.dept_PTR='+inttostr(dept_ptr);
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
begin
 form1.Hide;
 form_date:=tform_date.Create(application);
 form_date.ShowModal;
 form_date.Free;
end;

procedure TForm1.ListBox7Click(Sender: TObject);
begin
label21.Caption:=listbox7.Items[listbox7.itemindex];
edit7.Text:='';
button7.Enabled:=false;
bitbtn11.Visible:=true;
case listbox7.ItemIndex of
0:
 begin

 end;
1:
 begin
  bitbtn11.Visible:=false;
 end;
2:
 begin

 end;
3:
 begin

 end;
4:;
5:;
6:bitbtn11.Visible:=false;
end;
end;

procedure TForm1.Edit7Change(Sender: TObject);
begin
if trim(edit7.Text)<>'' then
 button7.Enabled := true
else
 button7.Enabled := false;
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
case listbox7.ItemIndex of
0:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;  
  if form_inv.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_inv.free;
 end;
1:;
2:
 begin
  form_invtype:=tform_invtype.Create(application);
  if form_invtype.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_invtype.ADOQuery1GROUP_NAME.Value);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_invtype.free;
 end;
3:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_supp.adoquery1code.Value);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_supp.free;
 end;

4:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_wh.free;
 end;

5:
 begin
  form_lo:=tform_lo.Create(application);
  if form_lo.ShowModal=mrok then
   begin
    edit7.Text:=trim(form_lo.ADOQuery1.FieldValues['code']);
    button7.SetFocus;
   end
  else
   edit7.SetFocus;
  form_lo.free;
 end;
6:
 begin

 end;
end;

end;

procedure TForm1.Button7Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox7.Items[listbox7.itemindex]  then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;

 sgrid1.Cells[0,sgrid1.RowCount-1]:=label21.Caption;
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit7.Text;

 case listbox7.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0017.INV_PART_NUMBER LIKE ''%'+edit7.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0017.INV_NAME LIKE ''%'+edit7.Text+'%''';
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0496.GROUP_NAME LIKE '''+edit7.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0023.code LIKE ''%'+edit7.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0015.WAREHOUSE_CODE LIKE ''%'+trim(edit7.Text)+'%''';
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and data0016.CODE LIKE ''%'+trim(edit7.Text)+'%''';
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0017.INV_DESCRIPTION LIKE ''%'+trim(edit7.Text)+'%''';
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

end.
