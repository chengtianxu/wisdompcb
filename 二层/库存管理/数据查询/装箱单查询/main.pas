unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, StdCtrls, Buttons, ComCtrls, ExtCtrls, Menus;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DTPk2: TDateTimePicker;
    DTPk1: TDateTimePicker;
    Button1: TButton;
    BitBtn4: TBitBtn;
    ListBox1: TListBox;
    StaticText4: TStaticText;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    StaticText2: TStaticText;
    SGrid1: TStringGrid;
    RadioGroup1: TRadioGroup;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DTPk4: TDateTimePicker;
    DTPk3: TDateTimePicker;
    Button2: TButton;
    BitBtn5: TBitBtn;
    ListBox2: TListBox;
    StaticText1: TStaticText;
    Edit2: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DTPk6: TDateTimePicker;
    DTPK5: TDateTimePicker;
    Button3: TButton;
    BitBtn6: TBitBtn;
    ListBox3: TListBox;
    StaticText3: TStaticText;
    Edit3: TEdit;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DTPk8: TDateTimePicker;
    DTPk7: TDateTimePicker;
    Button4: TButton;
    BitBtn7: TBitBtn;
    ListBox4: TListBox;
    StaticText5: TStaticText;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    aqtmp: TADOQuery;
    dttm3: TDateTimePicker;
    dttm4: TDateTimePicker;
    RadioGroup6: TRadioGroup;
    RadioGroup2: TRadioGroup;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ListBox4Click(Sender: TObject);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    whouse_ptr:byte;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses packlist, customer_search, part_search, ship_advice, invoice_sql,
  toolinvoice, curr_search,common,pick_item_single,constvar;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
// if self.ADOConnection1.Connected then
//   begin
//      showmessage('程序在开发模式下运行，请在发布前关闭连接后编译！');
//      rkey73:='3';
//      vprev:='2';
//   end
// else

  if not app_init_2(ADOConnection1) then
   begin
    showmsg('程序启动失败，请与系统管理员联系！',1);
    application.Terminate;
   end;

     // rkey73:='1502';
     // user_ptr:='1838';
     // vprev:='2';


 self.Caption:=application.Title;

 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';
 listbox1.Selected[0]:=true;
 dtpk1.Date:=date()-60;
 dtpk2.Date:=date();
 dtpk3.Date:=date()-60;
 dtpk4.Date:=date();
 dtpk5.Date:=date()-60;
 dtpk6.Date:=date();
 dtpk7.Date:=date()-60;
 dtpk8.Date:=date();
 sgrid1.Cells[0,0]:='条件名';
 sgrid1.Cells[1,0]:='条件值';
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i:byte;
    tax_amount,amount,mianji:double;
begin
if sgrid1.RowCount=2 then
 messagedlg('请首先定义查询条件!',mtinformation,[mbok],0)
else
case radiogroup1.ItemIndex of
 0:
 begin  
  form2:=tform2.Create(application);
  with form2.ado439 do
   begin
    close;
    if (StrToInt(vprev)=4) then
     LockType:=ltOptimistic
    else
     LockType:=ltReadOnly;
    for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
    if (vprev='1') or (vprev='3') then
    begin
      sql.Insert(sql.count-1,' and dbo.Data0439.CUSTOMER_PTR in (SELECT CUSTOMER_PTR '+#13+
                             '                                    FROM   dbo.DATA0100 '+#13+
                             '                                    WHERE  (CSI_PTR ='+rkey73+'))');
    end;
    Prepared;
    open;
   end;
  if form2.ADO439.IsEmpty then
   messagedlg('对不起没有找到符合条件的数据!',mtinformation,[mbok],0)
  else
   begin
    amount:=0;
    tax_amount:=0;
    mianji:=0;

    if RadioGroup2.ItemIndex=0 then
     form2.DBGrid1.Columns[32].FieldName:='mianji'
    else
     form2.DBGrid1.Columns[32].FieldName:='mianji_bb';   //含板边

    form2.ADO439.DisableControls;
    while not form2.ADO439.Eof do
     begin
      amount:=amount+form2.ADO439amount.Value;//不含税金额本位币
      tax_amount:=tax_amount+form2.ADO439tax_amount.Value;//含税金额本位币
      if RadioGroup2.ItemIndex=0 then
       mianji:=mianji+form2.ADO439mianji.Value
      else
       mianji:=mianji+form2.ADO439mianji_bb.Value;
      form2.ADO439.Next;
     end;
    form2.ADO439.EnableControls;

    form2.Edit1.Text:=formatfloat('0.000',amount);
    form2.Edit2.Text:=formatfloat('0.000',mianji);
    form2.Edit3.Text:=formatfloat('0.000',tax_amount);

    if strtoint(vprev)<=2 then       //无银码权限
     begin
      form2.DBGrid1.Columns[23].Visible:=false;
      form2.DBGrid1.Columns[24].Visible:=false;
      form2.DBGrid1.Columns[25].Visible:=false;
      form2.DBGrid1.Columns[26].Visible:=false;
      form2.DBGrid1.Columns[27].Visible:=false;
      form2.DBGrid1.Columns[28].Visible:=false;
      form2.DBGrid1.Columns[29].Visible:=false;
      form2.DBGrid1.Columns[30].Visible:=false;
      form2.Label1.Visible:=false;
      form2.Edit1.Visible:=false;
      form2.Label3.Visible:=false;
      form2.Edit3.Visible:=false;
     end;
    hide;
    form2.ShowModal;
    form2.free;
   end;
 end;
 1:
 begin
  form3:=tform3.Create(application);
  with form3.ado530 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do  sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
    if (vprev='1') or (vprev='3') then
    begin
      sql.Insert(sql.count-1,' and dbo.Data0439.CUSTOMER_PTR in (SELECT CUSTOMER_PTR '+#13+
                             '                                    FROM   dbo.DATA0100 '+#13+
                             '                                    WHERE  (CSI_PTR ='+rkey73+'))');
    end;
   open;
  end;
 if form3.ADO530.IsEmpty then
  messagedlg('对不起没有找到符合条件的数据!',mtinformation,[mbok],0)
 else
  begin
   if strtoint(vprev)<=2 then       //权限
    begin
     form3.ADO530part_price.Visible:=false;
     form3.ADO530amount.Visible:=false;
    end;
   hide;
   form3.ShowModal;
   form3.free;
  end;
 end;
 2:
 begin
  form4:=tform4.Create(application);
  with form4.ado112 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
    if (vprev='1') or (vprev='3') then
    begin
      sql.Insert(sql.count-1,' and dbo.Data0112.CUSTOMER_PTR in (SELECT CUSTOMER_PTR '+#13+
                             '                                    FROM   dbo.DATA0100 '+#13+
                             '                                    WHERE  (CSI_PTR ='+rkey73+'))');
    end;
   open;
  end;
  {应加入权限判断}//没有加入权限判继发票的查询都可以查询金额
 if form4.ADO112.IsEmpty then
   messagedlg('对不起没有找到符合条件的数据!',mtinformation,[mbok],0)
 else
  begin
   hide;
   form4.ShowModal;
   form4.free;
  end;
 end;
 3:
 begin
  form5:=tform5.Create(application);
  with form5.ado112 do
  begin
   close;
   for i:=1 to sgrid1.RowCount-2 do sql.Insert(sql.Count-1,sgrid1.Cells[2,i]);
    if (vprev='1') or (vprev='3') then
    begin
      sql.Insert(sql.count-1,' and dbo.Data0112.CUSTOMER_PTR in (SELECT CUSTOMER_PTR '+#13+
                             '                                    FROM   dbo.DATA0100 '+#13+
                             '                                    WHERE  (CSI_PTR ='+rkey73+'))');
    end;
   open;
  end;
  {应加入权限判断}
  if form5.ADO112.IsEmpty then
   messagedlg('对不起没有找到符合条件的数据!',mtinformation,[mbok],0)
 else
  begin
   hide;
   form5.ShowModal;
   form5.free;
  end;
 end;
end;

end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
 bitbtn4.Visible:=false;
 label9.Caption:=listbox1.Items[listbox1.itemindex];
 edit1.Text:='';
 edit1.Visible:=true;
 label7.Visible:=false;
 label8.Visible:=false;
 dtpk1.Visible:=false;
 dtpk2.Visible:=false;
 dttm3.Visible:=false;
 dttm4.Visible:=false;
 button1.Enabled:=false;
 combobox1.Visible:=false;
 RadioGroup6.Visible:=False;

 case listbox1.ItemIndex of
 0:;
 1:bitbtn4.Visible:=true;
 2:
 begin
 edit1.Visible:=false;
 label7.Visible:=true;
 label8.Visible:=true;
 dtpk1.Visible:=true;
 dtpk2.Visible:=true;
 button1.Enabled:=true;
 end;
 3:;
 4:bitbtn4.Visible:=true;
 5:;
 6:;
 7:
  begin
   edit1.Visible:=false;
   combobox1.Visible:=true;
   combobox1.Items.Clear;
   combobox1.Items.Add('自制');
   combobox1.Items.Add('发外');
   combobox1.Items.Add('半制程');
   combobox1.ItemIndex:=0;
   button1.Enabled:=true;
  end;
 8:bitbtn4.Visible:=true;  //工厂代码
 9,10,11:
  begin
   edit1.Visible:=false;
   combobox1.Visible:=true;
   combobox1.Items.Clear;
   combobox1.Items.Add('是');
   combobox1.Items.Add('否');
   combobox1.ItemIndex:=0;
   button1.Enabled:=true;
  end;
 12:
 begin
 edit1.Visible:=false;
 label7.Visible:=true;
 label8.Visible:=true;
 dtpk1.Visible:=true;
 dtpk2.Visible:=true;
 dttm3.Visible:=true;
 dttm4.Visible:=true;
 button1.Enabled:=true;
 end;
 13:
 begin
  Edit1.Visible:=True;
  RadioGroup6.Visible:=True;
 end;
end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
var inputvar: PDlgInput;
begin
case listbox1.ItemIndex of
 1:
 try
  form_customer:=tform_customer.Create(application);
  if form_customer.ShowModal=mrok then
   begin
    edit1.Text:=form_customer.ADOQuery1cust_code.Value;
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  form_customer.free;
 end;
 4:
 try
  form_custpart:=tform_custpart.Create(application);
  if form_custpart.ShowModal=mrok then
   begin
    edit1.Text:=form_custpart.ADOQuery1manu_part_number.Value;
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  form_custpart.free;
 end;
 8:
 try
 frmpick_item_single:=Tfrmpick_item_single.Create(application);
 inputvar.Fields:='warehouse_code/工厂代码/130,warehouse_name/工厂名称/240';
 inputvar.Sqlstr:='select rkey,warehouse_code,warehouse_name from data0015 order by warehouse_code';
 inputvar.KeyField:='warehouse_code';
 inputvar.InPut_value:=edit1.Text;
 inputvar.AdoConn:=ADOConnection1;
 frmpick_item_single.InitForm_New(inputvar);
 if frmpick_item_single.ShowModal=mrok then
 begin
   edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['warehouse_code']);
   whouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
   button1.SetFocus;
 end
 else edit1.SetFocus;
 finally
   frmpick_item_single.adsPick.Close;
   frmpick_item_single.Free;
 end;
end;  //end case
end;

procedure TForm1.Button1Click(Sender: TObject);
var i:byte;
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
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0439.delivery_no LIKE ''%'+trim(edit1.Text)+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010.cust_code LIKE ''%'+trim(edit1.Text)+'%''';
 2:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and data0439.date_sailing>='''+datetostr(dtpk1.date)+''' and data0439.date_sailing<='''+datetostr(dtpk2.date)+'''';
  end;
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.sales_order LIKE ''%'+trim(edit1.Text)+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.manu_part_number LIKE ''%'+trim(edit1.Text)+'%''';
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0097.po_number LIKE ''%'+trim(edit1.Text)+'%''';
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0112.invoice_number LIKE ''%'+trim(edit1.Text)+'%''';
 7:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.so_tp = '+inttostr(combobox1.ItemIndex);
  end;
  8:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0060.ship_reg_tax_id='+inttostr(whouse_ptr);
 9:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
   if combobox1.ItemIndex=0 then
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0439.invoice_ptr is not null'
   else
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0439.invoice_ptr is null';
  end;
 10:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
   if combobox1.ItemIndex=0 then
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0064.GLPTR_STATUS =1 '
   else
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0064.GLPTR_STATUS =0 ';
  end;
 11:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
   if combobox1.ItemIndex=0 then
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0064.GLPTR_STAUTS2 = 1'
   else
    sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0064.GLPTR_STAUTS2 = 0' ;
  end;
12:
  begin
     sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk1.date);
     sgrid1.Cells[2,sgrid1.RowCount-1]:=
     'and Data0064.DATE_assign>='''+datetostr(dtpk1.date)+
     formatdatetime(' hh:nn:ss',dttm3.Time)+
     ''' and Data0064.DATE_assign<='''+datetostr(dtpk2.date)+
     formatdatetime(' hh:nn:ss',dttm4.Time)+'''';
  end;
  13:
  begin
     if RadioGroup6.ItemIndex=0 then
       sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.LAYERS='+edit1.Text
     else if RadioGroup6.ItemIndex=1 then
       sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.LAYERS<>'+edit1.Text
     else
       sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.LAYERS>'+edit1.Text;
     sgrid1.Cells[1,sgrid1.RowCount-1]:=RadioGroup6.Items[RadioGroup6.ItemIndex]+edit1.Text;
  end;
 end; //end case
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
 bitbtn2click(sender);
 groupbox1.Visible:=radiogroup1.ItemIndex=0;
 groupbox2.Visible:=radiogroup1.ItemIndex=1;
 groupbox3.Visible:=radiogroup1.ItemIndex=2;
 groupbox4.Visible:=radiogroup1.ItemIndex=3;
 case radiogroup1.ItemIndex of
  0:
  begin
  listbox1.Selected[0]:=true;
  listbox1click(sender);
  RadioGroup2.Visible:=true;
  end;
  1:
  begin
   listbox2.Selected[0]:=true;
   listbox2click(sender);
   RadioGroup2.Visible:=false;
  end;
  2:
  begin
   listbox3.Selected[0]:=true;
   listbox3click(sender);
   RadioGroup2.Visible:=false;
  end;
  3:
  begin
   listbox4.Selected[0]:=true;
   listbox4click(sender);
   RadioGroup2.Visible:=false;
  end;
 end;  //end case
end;

procedure TForm1.Edit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if trim(edit2.Text)<>'' then
   button2.Enabled:=true
 else button2.Enabled:=false;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
case listbox2.ItemIndex of
 2:
 try
  form_customer:=tform_customer.Create(application);
  if form_customer.ShowModal=mrok then
   begin
    edit2.Text:=form_customer.ADOQuery1cust_code.Value;
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  form_customer.free;
 end;
 5:
 try
  form_custpart:=tform_custpart.Create(application);
  if form_custpart.ShowModal=mrok then
   begin
    edit2.Text:=form_custpart.ADOQuery1manu_part_number.Value;
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit2.SetFocus;
 finally
  form_custpart.free;
 end;
end;

end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
 bitbtn5.Visible:=false;
 label3.Caption:=listbox2.Items[listbox2.itemindex];
 edit2.Text:='';
 edit2.Visible:=true;
 label1.Visible:=false;
 label2.Visible:=false;
 dtpk3.Visible:=false;
 dtpk4.Visible:=false;
 button2.Enabled:=false;

 case listbox2.ItemIndex of
 0:;
 1:;
 2:bitbtn5.Visible:=true;
 3:
  begin
 edit2.Visible:=false;
 label1.Visible:=true;
 label2.Visible:=true;
 dtpk3.Visible:=true;
 dtpk4.Visible:=true;
 button2.Enabled:=true;
 end;
 4:;
 5:bitbtn5.Visible:=true;
 6:;
 7:;
 8:;
 9:;
 end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var i:byte;
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
 0:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0529.MAWB_NO LIKE ''%'+trim(edit2.Text)+'%''';
 1:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0439.delivery_no LIKE ''%'+trim(edit2.Text)+'%''';
 2:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010.cust_code LIKE ''%'+trim(edit2.Text)+'%''';
 3:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and Data0529.DEPA_DATE>='''+datetostr(dtpk3.date)+''' and Data0529.DEPA_DATE<='''+datetostr(dtpk4.date)+'''';
  end;
 4:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.sales_order LIKE ''%'+trim(edit2.Text)+'%''';
 5:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0025.manu_part_number LIKE ''%'+trim(edit2.Text)+'%''';
 6:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0097.po_number LIKE ''%'+trim(edit2.Text)+'%''';
 7:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0112.invoice_number LIKE ''%'+trim(edit2.Text)+'%''';
 8:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0529.shipadvice_no LIKE ''%'+trim(edit2.Text)+'%''';
 9:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0529.FLIGHT_NO LIKE ''%'+trim(edit2.Text)+'%''';
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.Edit3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if trim(edit3.Text)<>'' then
  button3.Enabled:=true
 else button3.Enabled:=false;
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin
 bitbtn6.Visible:=false;
 label6.Caption:=listbox3.Items[listbox3.itemindex];
 edit3.Text:='';
 edit3.Visible:=true;
 label4.Visible:=false;
 label5.Visible:=false;

 dtpk5.Visible:=false;
 dtpk6.Visible:=false;
 button3.Enabled:=false;

 case listbox3.ItemIndex of
 0:;
 1:;
 2:bitbtn6.Visible:=true;
 3:
 begin
  edit3.Visible:=false;
  label4.Visible:=true;
  label5.Visible:=true;
  dtpk5.Visible:=true;
  dtpk6.Visible:=true;
  button3.Enabled:=true;
 end;
 4:bitbtn6.Visible:=true;
 end;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
 case listbox3.ItemIndex of
 2:
 try
  form_customer:=tform_customer.Create(application);
  if form_customer.ShowModal=mrok then
   begin
    edit3.Text:=form_customer.ADOQuery1cust_code.Value;
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
 finally
  form_customer.free;
 end;
 4:
 try
  form_empl:=tform_empl.Create(application);
  if form_empl.ShowModal=mrok then
   begin
    edit3.Text:=form_empl.ADOQuery1EMPL_CODE.Value;
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
 finally
  form_empl.free;
 end;
 end;

end;

procedure TForm1.Button3Click(Sender: TObject);
var i:byte;
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
 0:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0112.invoice_number LIKE ''%'+trim(edit3.Text)+'%''';
 1:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0439.delivery_no LIKE ''%'+trim(edit3.Text)+'%''';
 2:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010.cust_code LIKE ''%'+trim(edit3.Text)+'%''';
 3:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk5.date)+'到'+datetostr(dtpk6.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and Data0112.INVOICE_DATE>='''+datetostr(dtpk5.date)+''' and Data0112.INVOICE_DATE<='''+datetostr(dtpk6.date)+'''';
  end;
 4:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0005.empl_code LIKE ''%'+trim(edit3.Text)+'%''';
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.ListBox4Click(Sender: TObject);
begin
 bitbtn7.Visible:=false;
 label12.Caption:=listbox4.Items[listbox4.itemindex];
 edit4.Text:='';
 edit4.Visible:=true;

 label10.Visible:=false;
 label11.Visible:=false;
 dtpk7.Visible:=false;
 dtpk8.Visible:=false;
 button4.Enabled:=false;

 case listbox4.ItemIndex of
 0:;
 1:bitbtn7.Visible:=true;
 2:
 begin
  edit4.Visible:=false;
  label10.Visible:=true;
  label11.Visible:=true;
  dtpk7.Visible:=true;
  dtpk8.Visible:=true;
  button4.Enabled:=true;
 end;
 3:;
 4:bitbtn7.Visible:=true;
 5:;
 end;

end;

procedure TForm1.Edit4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
 if trim(edit4.Text)<>'' then
  button4.Enabled:=true
 else button4.Enabled:=false;
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
 case listbox4.ItemIndex of
 1:
 try
  form_customer:=tform_customer.Create(application);
  if form_customer.ShowModal=mrok then
   begin
    edit4.Text:=form_customer.ADOQuery1cust_code.Value;
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
   edit4.SetFocus;
 finally
  form_customer.free;
 end;
 4:
 try
  form_custpart:=tform_custpart.Create(application);
  if form_custpart.ShowModal=mrok then
   begin
    edit4.Text:=form_custpart.ADOQuery1manu_part_number.Value;
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
   edit4.SetFocus;
 finally
  form_custpart.free;
 end;
end;

end;

procedure TForm1.Button4Click(Sender: TObject);
var i:byte;
begin
 for i:=1 to sgrid1.RowCount-2 do
  if sgrid1.Cells[0,i]=listbox4.Items[listbox4.itemindex]  then
   begin
    messagedlg('同一个条件项目不能增加两次!',mtinformation,[mbok],0);
    exit;
   end;
 sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox4.Items[listbox4.itemindex];
 sgrid1.Cells[1,sgrid1.RowCount-1]:=edit4.Text;
 case listbox4.ItemIndex of
  0:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0112.invoice_number LIKE ''%'+trim(edit4.Text)+'%''';
  1:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0010.cust_code LIKE ''%'+trim(edit4.Text)+'%''';
  2:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk7.date)+'到'+datetostr(dtpk8.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and Data0112.INVOICE_DATE>='''+datetostr(dtpk7.date)+''' and Data0112.INVOICE_DATE<='''+datetostr(dtpk8.date)+'''';
  end;
  3:sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0060.sales_order LIKE ''%'+trim(edit4.Text)+'%''';
  4:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0050.customer_part_number LIKE ''%'+trim(edit4.Text)+'%''';
  5:sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0097.po_number LIKE ''%'+trim(edit4.Text)+'%''';
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if  ADOConnection1.Connected then
 begin

 end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(edit1.Text)<>'' then
 begin
   button1.Enabled:=true;
   if listbox1.ItemIndex=8 then
   begin
     aqtmp.Close;
     aqtmp.SQL.Text:='select isnull(rkey,0) from data0015 where warehouse_code='''+edit1.text+'''';
     aqtmp.Open;
     whouse_ptr:=aqtmp.Fields[0].AsInteger;
   end;
 end
 else button1.Enabled:=false;
end;

procedure TForm1.N1Click(Sender: TObject);
var i:byte;
begin
  for i:=sgrid1.Row to sgrid1.RowCount-2 do
    sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key=#13) and (button1.Enabled=true) then
    button1.SetFocus;
  if Self.ListBox1.ItemIndex=13 then
  begin
     if not (key in ['0'..'9','.',#8,#13]) then  //判断是否输入数字
     abort;
  end;
end;

end.
