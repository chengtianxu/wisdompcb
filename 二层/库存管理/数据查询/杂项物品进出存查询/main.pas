unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus, DB, ADODB,
  ClipBrd,DBGrids;

type
  TForm1 = class(TForm)
    RadioGroup1: TRadioGroup;
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    ListBox1: TListBox;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StaticText2: TStaticText;
    sgrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox2: TGroupBox;
    ListBox2: TListBox;
    StaticText3: TStaticText;
    Edit2: TEdit;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Label2: TLabel;
    GroupBox3: TGroupBox;
    StaticText4: TStaticText;
    ListBox3: TListBox;
    Label3: TLabel;
    Edit3: TEdit;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Label4: TLabel;
    dtpk1: TDateTimePicker;
    Label5: TLabel;
    dtpk2: TDateTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    dtpk3: TDateTimePicker;
    dtpk4: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ADOQuery1: TADOQuery;
    ADOQuery1date1: TStringField;
    ADOQuery2: TADOQuery;
    ComboBox2: TComboBox;
    ComboBox1: TComboBox;
    ComboBox3: TComboBox;
    ADOQuery2description: TStringField;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    Label19: TLabel;
    Label20: TLabel;
    BitBtn4: TBitBtn;
    BitBtn11: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure update1_sgrid(sgrid_row:byte);
    procedure update2_sgrid(sgrid_row:byte);
    procedure update3_sgrid(sgrid_row:byte);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
  private
    { Private declarations }
    sql0456 : string;
    sql0457 : string;
    sqlnow  : string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses damo,peopleser_form,supplyser_form,orderser_form,locser_form,
     proin_form,proout_form,pronow_form, deptser_form,common,Pick_Item_Single,ConstVar,
  PasCutoff, ShowCutoff;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin   
  {}if not App_init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title; 

//user_ptr := '3';
//vprev :='4';
//dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
 end;

procedure TForm1.update1_sgrid(sgrid_row: byte);   //入仓更新函数
begin
  if listbox1.ItemIndex=4 then
    sgrid1.Cells[1,sgrid_row]:='从'+datetostr(dtpk1.Date)+'到'+datetostr(dtpk2.Date)
  else if listbox1.itemindex in [0,1,2,7] then
  begin
    if RadioGroup4.ItemIndex=0 then
      sgrid1.Cells[1,sgrid_row]:='like '+edit1.Text
    else
      sgrid1.Cells[1,sgrid_row]:='= '+edit1.Text;
  end else
   sgrid1.Cells[1,sgrid_row]:=edit1.Text;

 case listbox1.ItemIndex of
 0: if RadioGroup4.ItemIndex=0 then
  sgrid1.Cells[2,sgrid_row]:='and data0456.GRN_NUMBER LIKE ''%'+edit1.Text+'%'''
  else
  sgrid1.Cells[2,sgrid_row]:='and data0456.GRN_NUMBER = '''+edit1.Text+'''';
 1: if RadioGroup4.ItemIndex=0 then
  sgrid1.Cells[2,sgrid_row]:='and data0235.goods_name LIKE ''%'+edit1.Text+'%'''
  else
  sgrid1.Cells[2,sgrid_row]:='and data0235.goods_name = '''+edit1.Text+'''';
 2: if RadioGroup4.ItemIndex=0 then
  sgrid1.Cells[2,sgrid_row]:='and data0235.goods_guige LIKE ''%'+edit1.Text+'%'''
  else
  sgrid1.Cells[2,sgrid_row]:='and data0235.goods_guige = '''+edit1.Text+'''';
 3:
  begin
   sgrid1.Cells[1,sgrid_row]:=combobox1.Text;
   sgrid1.Cells[2,sgrid_row]:='and data0235.goods_type LIKE ''%'+trim(combobox1.Text)+'%''';
  end;
 4:
  begin
  sgrid1.Cells[2,sgrid_row]:= 'and Data0456.ship_DATE >= '''+datetostr(dtpk1.date)+
                                      '''and Data0456.ship_DATE <= '''+datetostr(dtpk2.date+1)+'''';
  label19.Caption:=datetostr(dtpk1.date);
  label20.Caption:=datetostr(dtpk2.date);
  end;
 5:
  sgrid1.Cells[2,sgrid_row]:='and data0023.CODE ='''+trim(edit1.Text)+'''';
 6:
  sgrid1.Cells[2,sgrid_row]:='and data0005.EMPL_CODE ='''+trim(edit1.Text)+'''';
 7: if RadioGroup4.ItemIndex=0 then
  sgrid1.Cells[2,sgrid_row]:='and data0070.PO_NUMBER like''%'+trim(edit1.Text)+'%'''
  else
  sgrid1.Cells[2,sgrid_row]:='and data0070.PO_NUMBER ='''+trim(edit1.Text)+'''';
 8:
  sgrid1.Cells[2,sgrid_row]:='and data0015.WAREHOUSE_CODE ='''+trim(edit1.Text)+'''';
 9:
  sgrid1.Cells[2,sgrid_row]:='and data0235.rohs like ''%'+edit1.Text+'%''';
 end;
end;

procedure TForm1.update2_sgrid(sgrid_row: byte);     //出仓更新函数
begin
  if listbox2.ItemIndex=5 then
    sgrid1.Cells[1,sgrid_row]:='从'+datetostr(dtpk3.Date)+'到'+datetostr(dtpk4.Date)
  else if listbox2.itemindex in [0,1,2,9] then
  begin
    if RadioGroup3.ItemIndex=0 then
      sgrid1.Cells[1,sgrid_row]:='like '+edit2.Text
    else
      sgrid1.Cells[1,sgrid_row]:='= '+edit2.Text;
  end else
    sgrid1.Cells[1,sgrid_row]:=edit2.Text;

  case listbox2.ItemIndex of
 0: if RadioGroup3.ItemIndex=0 then
   sgrid1.Cells[2,sgrid_row]:='and data0457.GON_NUMBER LIKE ''%'+edit2.Text+'%'''
  else
   sgrid1.Cells[2,sgrid_row]:='and data0457.GON_NUMBER = '''+edit2.Text+'''';
 1: if RadioGroup3.ItemIndex=0 then
    sgrid1.Cells[2,sgrid_row]:='and data0235.goods_name LIKE ''%'+edit2.Text+'%'''
    else
    sgrid1.Cells[2,sgrid_row]:='and data0235.goods_name = '''+edit2.Text+'''';
 2: if RadioGroup3.ItemIndex=0 then
  sgrid1.Cells[2,sgrid_row]:='and data0235.goods_guige LIKE ''%'+edit2.Text+'%'''
  else
  sgrid1.Cells[2,sgrid_row]:='and data0235.goods_guige = '''+edit2.Text+'''';
 3:
  begin
   sgrid1.Cells[1,sgrid_row]:=combobox2.Text;
   sgrid1.Cells[2,sgrid_row]:='and data0235.goods_type LIKE ''%'+trim(combobox2.Text)+'%''';
  end;
 4:
  sgrid1.Cells[2,sgrid_row]:='and data0034.DEPT_CODE LIKE ''%'+edit2.Text+'%''';

 5:
  sgrid1.Cells[2,sgrid_row]:='and Data0457.create_date >= '''+datetostr(dtpk3.date)+
                            '''and Data0457.create_date <= '''+datetostr(dtpk4.date+1)+'''';
 6:
  sgrid1.Cells[2,sgrid_row]:='and data0005.EMPL_CODE = '''+trim(edit2.Text)+'''';
 7:
  sgrid1.Cells[2,sgrid_row]:='and data0015.WAREHOUSE_CODE ='''+trim(edit2.Text)+'''';
 8:
 sgrid1.Cells[2,sgrid_row]:='and data0235.rohs like ''%'+trim(edit2.Text)+'%''';
 9:if RadioGroup3.ItemIndex=0 then
  sgrid1.Cells[2,sgrid_row]:='and data0457.ref_number LIKE ''%'+edit2.Text+'%'''
  else
  sgrid1.Cells[2,sgrid_row]:='and data0457.ref_number = '''+edit2.Text+'''';
 10:if RadioGroup3.ItemIndex=0 then
  sgrid1.Cells[2,sgrid_row]:='and data0457.cut_no492 LIKE ''%'+edit2.Text+'%'''
  else
  sgrid1.Cells[2,sgrid_row]:='and data0457.cut_no492 = '''+edit2.Text+'''';
 end;
end;

procedure TForm1.update3_sgrid(sgrid_row: byte);   //当前库存情况更新函数
begin
  if listbox3.ItemIndex in [0,2,5] then
   begin
    if RadioGroup2.ItemIndex=0 then
      sgrid1.Cells[1,sgrid_row]:='Like '+edit3.Text
    else
      sgrid1.Cells[1,sgrid_row]:='= '+edit3.Text;
   end
  else
   if listbox3.ItemIndex=1 then
    sgrid1.Cells[1,sgrid_row]:=combobox3.Text
   else
    sgrid1.Cells[1,sgrid_row]:=edit3.Text;

 case listbox3.ItemIndex of
 0: if RadioGroup2.ItemIndex=0 then
      sgrid1.Cells[2,sgrid_row]:='and data0235.goods_name LIKE ''%'+edit3.Text+'%'''
    else
      sgrid1.Cells[2,sgrid_row]:='and data0235.goods_name = '''+edit3.Text+'''';

 1:
   sgrid1.Cells[2,sgrid_row]:='and data0235.goods_type LIKE ''%'+trim(combobox3.Text)+'%''';

 2: if RadioGroup2.ItemIndex=0 then
      sgrid1.Cells[2,sgrid_row]:='and data0235.goods_guige LIKE ''%'+edit3.Text+'%'''
    else
      sgrid1.Cells[2,sgrid_row]:='and data0235.goods_guige = '''+edit3.Text+'''';
 3:
   sgrid1.Cells[2,sgrid_row]:='and data0015.WAREHOUSE_CODE = '''+trim(edit3.Text)+'''';
 4:
   sgrid1.Cells[2,sgrid_row]:='and data0023.CODE = '''+trim(edit3.Text)+'''';

 5: if RadioGroup2.ItemIndex=0 then
      sgrid1.Cells[2,sgrid_row]:='and data0070.PO_NUMBER LIKE ''%'+edit3.Text+'%'''
    else
      sgrid1.Cells[2,sgrid_row]:='and data0070.PO_NUMBER = '''+edit3.Text+'''';
 6:
   sgrid1.Cells[2,sgrid_row]:='and data0016.CODE = '''+trim(edit3.Text)+'''';
 end;
end;


procedure TForm1.BitBtn2Click(Sender: TObject);
var
 i: byte;
begin
  for i:=1 to self.sgrid1.RowCount-2 do
  if (sgrid1.Cells[0,i]=listbox1.Items[listbox1.ItemIndex])and (sgrid1.Cells[1,i]<>listbox1.Items[listbox1.ItemIndex]) then
  begin
    self.update1_sgrid(i);
    exit;
  end;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox1.Items[listbox1.itemindex];
  self.update1_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;


procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
begin
  if (sgrid1.RowCount <= 2) or (sgrid1.Row=sgrid1.RowCount-1) then exit;
  for i:=sgrid1.Row to sgrid1.RowCount-2 do sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin

case listbox1.ItemIndex of
5:
 begin
 try
 form_supplyser:=tform_supplyser.Create(application);
 form_supplyser.Edit1.Text:=edit1.Text;
 if form_supplyser.ShowModal=mrok then
  begin
   edit1.Text:=trim(form_supplyser.ADOQuery1CODE.Value);
   self.BitBtn2.Enabled:=true;
   self.BitBtn2.SetFocus;
  end;
 finally
  form_supplyser.Free;
 end;
 end;
6:
begin
 try
 form_peopleser:=tform_peopleser.Create(application);
 form_peopleser.Edit1.Text:=edit1.Text;
 if form_peopleser.ShowModal=mrok then
  begin
   edit1.Text:=trim(form_peopleser.ADOQuery1EMPL_CODE.Value);
   self.BitBtn2.Enabled:=true;
   self.BitBtn2.SetFocus;
  end;
 finally
  form_peopleser.Free;
 end;
 end;
 7:
  begin
 try
 form_orderser:=tform_orderser.Create(application);
 form_orderser.Edit1.Text:=edit1.Text;
 if form_orderser.ShowModal=mrok then
  begin
   edit1.Text:=trim(form_orderser.ADOQUERY1PO_NUMBER.Value);
   self.BitBtn2.Enabled:=true;
   self.BitBtn2.SetFocus;
  end;
 finally
  form_orderser.Free;
 end;
 end;
8:
 begin
 try
 form_locser:=tform_locser.Create(application);
 form_locser.Edit1.Text:=edit1.Text;
 if form_locser.ShowModal=mrok then
  begin
   edit1.Text:=trim(form_locser.ADOQuery1WAREHOUSE_CODE.Value);
   self.BitBtn2.Enabled:=true;
   self.BitBtn2.SetFocus;
  end;
 finally
  form_locser.Free;
 end;
 end;


end;

end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  bitbtn2.Enabled:= trim(edit1.Text)<>'';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 i:byte;
quantity,total_lucre:double;   //总库存和总金额
begin
 quantity:=0;
 total_lucre:=0;
case radiogroup1.ItemIndex of
//================================== 入仓明细查询===============================
0:
begin
 if (sgrid1.RowCount=2) then
  messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
 else
 begin
 try
  form_proin:=tform_proin.Create(application);
  with dm.ADO0456 do
   begin
    Close;
    sql.Text:=self.sql0456;
    for i:=1 to sgrid1.RowCount-2  do
    begin
    SQL.Add(sgrid1.Cells[2,i]);
     if sgrid1.Cells[0,i]='收货日期' then
     begin
     Form_proin.stardate:=self.Label19.Caption;
     Form_proin.enddate:=self.Label20.Caption;
     end;
    end;
    sql.Add('order by data0456.GRN_NUMBER');
    Prepared;
    Open;
  end;
  while not dm.ADO0456.Eof do
   begin
    quantity:=quantity+dm.ADO0456QUAN_RECD.Value;
    total_lucre:=total_lucre+dm.ADO0456unit_price.Value*dm.ADO0456QUAN_RECD.Value;
    dm.ADO0456.Next;
   end;
   dm.ADO0456.First;
   form_proin.Label4.Caption:=formatfloat('0.00',quantity);
   form_proin.Label5.Caption:=formatfloat('0.0000',total_lucre);
  finally
   form_proin.ShowModal;
   form_proin.Free;
  end;
 end;
 end;
//==================================出仓明细查询================================
1:
 begin
  if sgrid1.RowCount=2 then
   messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
  else
  begin
  try
  form_proout:=tform_proout.Create(application);
  with dm.ADO0457 do
   begin
    Close;
    SQL.Text:=self.sql0457;
    for i:=1 to sgrid1.RowCount-2 do SQL.Add(sgrid1.Cells[2,i]);
    sql.Add('order by data0457.GON_NUMBER');
    Prepared;
    Open;
   end;
  while not dm.ADO0457.Eof do
   begin
    quantity:=quantity+dm.ADO0457QUANTITY.Value;
    total_lucre:=total_lucre+dm.ADO0457DSDesigner5.Value;
    dm.ADO0457.Next;
   end;
  dm.ADO0457.First;
  form_proout.Label4.Caption:=formatfloat('0.00',quantity);
  form_proout.Label5.Caption:=formatfloat('0.0000',total_lucre);
  finally
   form_proout.ShowModal;
   form_proout.Free;
  end;
 end;
end;

//==================================当前库存状况================================
2:
 begin
  if sgrid1.RowCount=2 then
   messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
  else
  begin
  try
  form_pronow:=tform_pronow.Create(application);
  with dm.ADOnow do
   begin
    close;
    sql.Text:=self.sqlnow;
    for i:=1 to sgrid1.RowCount-2 do sql.Add(sgrid1.Cells[2,i]);
    dm.ADOnow.Prepared;
    open;
   end;
  finally
   form_pronow.ShowModal;
   form_pronow.Free;
  end;
 end;
 end;

 end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
bitbtn5click(sender);
case radiogroup1.ItemIndex of
0:
 begin
  groupbox1.Visible:=true;
  groupbox2.Visible:=false;
  groupbox3.Visible:=false;
  listbox1.Selected[0]:=true;
  listbox1click(sender);
 end;
1:
 begin
  groupbox1.Visible:=false;
  groupbox2.Visible:=true;
  groupbox3.Visible:=false;
  listbox2.Selected[0]:=true;
  listbox2click(sender);
 end;
2:
 begin
  groupbox1.Visible:=false;
  groupbox2.Visible:=false;
  groupbox3.Visible:=true;
 listbox3.Selected[0]:=true;
 listbox3click(sender);
 end;
end;

end;

procedure TForm1.BitBtn5Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
label1.Visible:=true;
 label1.Caption:=listbox1.Items[listbox1.itemindex];
 label4.Visible:=false;
 label5.Visible:=false;
 dtpk1.Visible:=false;
 dtpk2.Visible:=false;
 edit1.Text:='';
 edit1.Visible:=true;
 combobox1.Visible:=false;
 bitbtn1.Visible:=false;
 bitbtn2.Enabled:=false;
 RadioGroup4.Visible:= listbox1.itemindex in [0,1,2,7];
case listbox1.ItemIndex of
 3:
 begin
  edit1.Visible:=false;
  combobox1.Visible:=true;
 end;
 4:
 begin
  label1.Visible:=false;
  label4.Visible:=true;
  label5.Visible:=true;
  dtpk1.Visible:=true;
  dtpk2.Visible:=true;
  edit1.Visible:=false;
  bitbtn1.Visible:=false;
  bitbtn2.Enabled:=true;
 end;
 5,6,7,8:
 bitbtn1.Visible:=true;
end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
var
 i:byte;
begin
  for i:=1 to sgrid1.RowCount-2 do
  if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and (sgrid1.Cells[1,i]<>listbox2.Items[listbox2.ItemIndex]) then
  begin
    update2_sgrid(i);
    exit;
  end;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
  update2_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  bitbtn8.Enabled:=trim(edit2.Text)<>'';
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
case listbox2.ItemIndex of
4:
 begin
 try
 form_deptser:=tform_deptser.Create(application);
 form_deptser.Edit1.Text:=edit2.Text;
 if form_deptser.ShowModal=mrok then
  begin
   edit2.Text:=trim(form_deptser.ADOQuery1DEPT_CODE.Value);
   self.BitBtn8.Enabled:=true;
   self.BitBtn8.SetFocus;
  end;
 finally
  form_deptser.Free;
 end;
 end;
6:
begin
 try
 form_peopleser:=tform_peopleser.Create(application);
 form_peopleser.Edit1.Text:=edit2.Text;
 if form_peopleser.ShowModal=mrok then
  begin
   edit2.Text:=trim(form_peopleser.ADOQuery1EMPL_CODE.Value);
   self.BitBtn8.Enabled:=true;
   self.BitBtn8.SetFocus;
  end;
 finally
  form_peopleser.Free;
 end;
 end;
 7:
 begin
 try
 form_locser:=tform_locser.Create(application);
 form_locser.Edit1.Text:=edit2.Text;
 if form_locser.ShowModal=mrok then
  begin
   edit2.Text:=trim(form_locser.ADOQuery1WAREHOUSE_CODE.Value);
   self.BitBtn8.Enabled:=true;
   self.BitBtn8.SetFocus;
  end;
 finally
  form_locser.Free;
 end;
 end;

end;
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
 label2.Visible:=true;
 label2.Caption:=listbox2.Items[listbox2.itemindex];
 label6.Visible:=false;
 label7.Visible:=false;
 dtpk3.Visible:=false;
 dtpk4.Visible:=false;
 edit2.Text:='';
 edit2.Visible:=true;
 combobox2.Visible:=false;
 bitbtn7.Visible:=false;
 bitbtn8.Enabled:=false;
 RadioGroup3.Visible:= listbox2.itemindex in [0,1,2,9,10];
case listbox2.ItemIndex of
 3:
  begin
   combobox2.Visible:=true;
   edit2.Visible:=false;
  end;
 5:
 begin
  label2.Visible:=false;
  label6.Visible:=true;
  label7.Visible:=true;
  dtpk3.Visible:=true;
  dtpk4.Visible:=true;
  edit2.Visible:=false;
  bitbtn7.Visible:=false;
  bitbtn8.Enabled:=true;
 end;
 4,6,7:
 bitbtn7.Visible:=true;
end;
end;

procedure TForm1.BitBtn10Click(Sender: TObject);
var
 i:byte;
begin
  for i:=1 to self.sgrid1.RowCount-2 do
  if (sgrid1.Cells[0,i]=listbox3.Items[listbox3.ItemIndex]) and (sgrid1.Cells[1,i]<>listbox3.Items[listbox3.ItemIndex]) then
  begin
    update3_sgrid(i);
    exit;
  end;
  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox3.Items[listbox3.itemindex];
  update3_sgrid(sgrid1.RowCount-1);
  sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
  var InputVar: PDlgInput ;
begin
case listbox3.ItemIndex of
3:
 begin
 try
 form_locser:=tform_locser.Create(application);
 form_locser.Edit1.Text:=edit3.Text;
 if form_locser.ShowModal=mrok then
  begin
   edit3.Text:=trim(form_locser.ADOQuery1WAREHOUSE_CODE.Value);
   self.BitBtn10.Enabled:=true;
   self.BitBtn10.SetFocus;
  end;
 finally
  form_locser.Free;
 end;
 end;

4:
 begin
   try
   form_supplyser:=tform_supplyser.Create(application);
   form_supplyser.Edit1.Text:=edit3.Text;
   if form_supplyser.ShowModal=mrok then
    begin
     edit3.Text:=trim(form_supplyser.ADOQuery1CODE.Value);
     self.BitBtn10.Enabled:=true;
     self.BitBtn10.SetFocus;
    end;
   finally
    form_supplyser.Free;
   end;
 end;
6:
 begin
  try

   frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
   InputVar.Fields := 'CODE/仓库代码/200,LOCATION/仓库名称/250';
   InputVar.Sqlstr :='SELECT RKEY,CODE,LOCATION FROM Data0016 where location_type=0 ORDER BY CODE';
   inputvar.KeyField:='CODE';
   InputVar.AdoConn := dm.ADOConnection1 ;
   frmPick_Item_Single.InitForm_New(InputVar);
   if frmPick_Item_Single.ShowModal=mrok then
    begin
     edit3.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['code']);
     BitBtn10.Enabled:=true;
     BitBtn10.SetFocus;
    end
   else
    Edit3.SetFocus;
  finally
   frmPick_Item_Single.Free ;
  end;
 end;
end;
end;

procedure TForm1.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  bitbtn10.Enabled:=edit3.Text<>'' ;
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin
 label3.Visible:=true;
 label3.Caption:=listbox3.Items[listbox3.itemindex];
 edit3.Text:='';
 edit3.Visible:=true;
 combobox3.Visible:=false;
 bitbtn9.Visible:=false;
 bitbtn10.Enabled:=false;
 RadioGroup2.Visible:= listbox3.itemindex in [0,2,5];
 case listbox3.ItemIndex of
 1:
  begin
   combobox3.Visible:=true;
   edit3.Visible:=false;
  end;
 3,4,6: bitbtn9.Visible:=true;
end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  adoquery1.Open;
  adoquery2.Open;
 //===============取得各个数据集中数据的初始值=================
  sql0456:=dm.ADO0456.SQL.Text;
  sql0457:=dm.ADO0457.SQL.Text;
  sqlnow:=dm.ADOnow.SQL.Text;
 //================对查询界面初始化============================
  listbox1.Selected[0]:=true;
  groupbox2.Visible:=false;
  groupbox3.Visible:=false;
  bitbtn2.Enabled:=false;
  bitbtn8.Enabled:=false;
  bitbtn10.Enabled:=false ;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

  dtpk2.Date:=strtodate(self.ADOQuery1date1.Value);
  dtpk1.Date:=dtpk2.Date-60;
  dtpk4.Date:=dtpk2.Date;
  dtpk3.Date:=dtpk2.Date-60;

  while not adoquery2.Eof do
  begin
   combobox1.Items.Add(self.ADOQuery2description.Value);
   combobox2.Items.Add(self.ADOQuery2description.Value);
   combobox3.Items.Add(self.ADOQuery2description.Value);
   adoquery2.Next;
  end;
end;

procedure TForm1.sgrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
CanSelect:=(ARow>0) and (ARow<SGrid1.RowCount-1);
end;
//============================判断所选择的属性列================================
procedure TForm1.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if (row>0)and (row<sgrid1.RowCount-1) then SGrid1.Row:=row;
 end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  bitbtn2.Enabled:= combobox1.Text<>'' ;
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin
  bitbtn10.Enabled:= combobox3.Text<>'';
end;

procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  bitbtn8.Enabled:=combobox2.Text<>'';
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
  if (strtoint(vprev) in [2,3,4]) then
   begin
     frmCutoff:=TfrmCutoff.Create(nil);
     frmCutoff.ShowModal;
      frmCutoff.Free ;
   end
  else
   begin
      ShowMessage('权限不足!无法截数!');
   end;


end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
   if (strtoint(vprev) in [2,3,4]) then
     begin
       frmShowCutoff:=TfrmShowCutoff.Create(nil);
       frmShowCutoff.ShowModal;
       frmShowCutoff.Free ;
     end
   else
    begin
      ShowMessage('权限不足!无法截数!');
    end;

end;

end.
