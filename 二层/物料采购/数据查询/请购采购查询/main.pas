unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DB, ADODB, Menus,
  ComObj, Excel2000,ClipBrd,DBGrids, DBGridEh;

type
  TForm1 = class(TForm)
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    SGrid1: TStringGrid;
    StaticText2: TStaticText;
    groupbox1: TGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    ListBox1: TListBox;
    StaticText3: TStaticText;
    DtPk2: TDateTimePicker;
    DtPk1: TDateTimePicker;
    Button2: TButton;
    BitBtn5: TBitBtn;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RGp2: TRadioGroup;
    RGp3: TRadioGroup;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ListBox2: TListBox;
    StaticText1: TStaticText;
    DTpk4: TDateTimePicker;
    DTPk3: TDateTimePicker;
    Button1: TButton;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    ADOConnection1: TADOConnection;
    ComboBox1: TComboBox;
    ADOQuery1: TADOQuery;
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
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ListBox4: TListBox;
    StaticText5: TStaticText;
    DTPk8: TDateTimePicker;
    DTPk7: TDateTimePicker;
    Button4: TButton;
    BitBtn7: TBitBtn;
    Edit4: TEdit;
    ComboBox2: TComboBox;
    RadioGroup2: TRadioGroup;
    DataSource5: TDataSource;
    ADOS276: TADOStoredProc;
    ADOS276USER_ID: TStringField;
    ADOS276auth_date: TDateTimeField;
    ADOS276USER_FULL_NAME: TStringField;
    ADOS276user_ptr: TIntegerField;
    ADOS276ranking: TWordField;
    ADOS276auth_flag: TStringField;
    BitBtn8: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ComboBox6: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    ComboBox5: TGroupBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    ComboBox3: TGroupBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckBox18: TCheckBox;
    CheckBox19: TCheckBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox29: TCheckBox;
    ComboBox4: TGroupBox;
    CheckBox22: TCheckBox;
    CheckBox23: TCheckBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    CheckBox26: TCheckBox;
    CheckBox27: TCheckBox;
    CheckBox28: TCheckBox;
    CheckBox30: TCheckBox;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGp2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RGp3Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox4Click(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure Edit4KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    function getstatus(Grp:TGroupBox):string;
  public
    { Public declarations }
    procedure CopyDbDataToExcel(Args:array of const;caption_:string); 
  end;

var
  Form1: TForm1;

implementation

uses inv_serach, dpment_search, Employee_search, warehouse_search,
  supplier_search, standpr, micpr, empl_search, standpo, micpo,
  rece_put_stock, standpo_subtotal, standpo_whtotal,common,
  Pick_Item_Single,ConstVar;

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
 if not app_init_2(ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
  self.Caption:=application.Title;


 { user_ptr:='3';
  rkey73:='5';
  vprev:='4';
  ADOConnection1.Open; }

  
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  listbox1.Selected[0]:=true;
  dtpk1.Date:=date()-30;
  dtpk2.Date:=date();
  dtpk3.Date:=date()-30;
  dtpk4.Date:=date();
  dtpk5.Date:=date()-30;
  dtpk6.Date:=date();
  dtpk7.Date:=date()-30;
  dtpk8.Date:=date();
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';
end;

procedure TForm1.CopyDbDataToExcel(Args:array of const;caption_:string);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
 I: Integer;
begin
 Screen.Cursor := crHourGlass;
 if not VarIsEmpty(XLApp) then
 begin
   XLApp.DisplayAlerts := False;
   XLApp.Quit;
   VarClear(XLApp);
 end;
 try
   XLApp := CreateOleObject('Excel.Application');
 except
   Screen.Cursor := crDefault;
   Exit;
 end;
 XLApp.WorkBooks.Add;
 XLApp.SheetsInNewWorkbook := High(Args) + 1;

 for I := Low(Args) to High(Args) do
 begin
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := caption_;
   Sheet := XLApp.Workbooks[1].WorkSheets[caption_];
   if not TDBGridEh(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGridEh(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGridEh(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGridEh(Args[I].VObject).Columns.Count - 1 do
    if TDBGridEh(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGridEh(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGridEh(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGridEh(Args[I].VObject).Columns.Count - 1 do
      if TDBGridEh(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGridEh(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGridEh(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGridEh(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin

 application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
 sgrid1.RowCount:=2;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
label6.Caption:=listbox1.Items[listbox1.itemindex];
edit1.Text:='';
edit1.Visible:=true;
button2.Enabled:=false;

bitbtn5.Visible:=true;
label5.Visible:=false;
label1.Visible:=false;
dtpk1.Visible:=false;
dtpk2.Visible:=false;
combobox5.Visible:=false;
case listbox1.ItemIndex of
 0:bitbtn5.Visible:=false;
 1:;
 2:begin
   bitbtn5.Visible:=false;
   edit1.Visible:=false;
   label5.Visible:=true;
   label1.Visible:=true;
   dtpk1.Visible:=true;
   dtpk2.Visible:=true;
   button2.Enabled:=true;
 end;
 3:;
 4:;
 5:;
 6:;
 7:bitbtn5.Visible:=false;
 8:
 begin
  bitbtn5.Visible:=false;
  combobox5.Visible:=true;
  edit1.Visible:=false;
  button2.Enabled:=true;
 end;
end;

end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit1.Text)<>'' then
 button2.Enabled:=true
else
 button2.Enabled:=false;
end;

procedure TForm1.RGp2Click(Sender: TObject);
begin
bitbtn2click(sender);
if rgp2.ItemIndex=0 then
 begin
  groupbox1.Visible:=true;
  groupbox2.Visible:=false;
  listbox1.Selected[0]:=true;
  listbox1click(sender);
 end
else
 begin
  groupbox1.Visible:=false;
  groupbox2.Visible:=true;
  listbox2.Selected[0]:=true;
  listbox2click(sender);
 end;
end;


procedure TForm1.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit2.Text)<>'' then
 button1.Enabled:=true
else
 button1.Enabled:=false;
end;

procedure TForm1.ListBox2Click(Sender: TObject);
begin
label3.Caption:=listbox2.Items[listbox2.itemindex];
edit2.Text:='';
edit2.Visible:=true;
button1.Enabled:=false;
combobox1.Visible:=false;
combobox1.ItemIndex:=-1;

bitbtn4.Visible:=true;
label2.Visible:=false;
label4.Visible:=false;
dtpk3.Visible:=false;
dtpk4.Visible:=false;
combobox6.Visible:=false;
case listbox2.ItemIndex of
 0,7,8:bitbtn4.Visible:=false;
 1:;
 2:begin
   bitbtn4.Visible:=false;
   edit2.Visible:=false;
   label2.Visible:=true;
   label4.Visible:=true;
   dtpk3.Visible:=true;
   dtpk4.Visible:=true;
   button1.Enabled:=true;
 end;
 3:;
 4:;
 5:begin
    combobox1.Visible:=true;
    bitbtn4.Visible:=false;
    edit2.Visible:=false;
   end;
 6:;
 9:
 begin
  bitbtn4.Visible:=false;
  combobox6.Visible:=true;
  edit2.Visible:=false;
  button1.Enabled:=true;
 end;

end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
bitbtn2click(sender);
if radiogroup1.ItemIndex=0 then
 begin
  rgp2.Enabled:=true;
  if rgp2.ItemIndex=0 then
   groupbox1.Visible:=true
  else
   groupbox2.Visible:=true;
  if rgp3.ItemIndex=0 then
   groupbox3.Visible:=false
  else
   groupbox4.Visible:=false;
  rgp3.Enabled:=false;
 end
else
 begin
  rgp2.Enabled:=false;
  rgp3.Enabled:=true;
  if rgp3.ItemIndex=0 then
   begin
    groupbox3.Visible:=true;
    listbox3.Selected[0]:=true;
   end
  else
   groupbox4.Visible:=true;
  if rgp2.ItemIndex=0 then
   groupbox1.Visible:=false
  else
   groupbox2.Visible:=false;
 end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
case listbox1.ItemIndex of
1:
 begin
  form_dept:=tform_dept.create(application);
  if form_dept.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_dept.ADOQuery1dept_code.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit1.SetFocus;
  form_dept.Free;
 end;
3:
 begin
  frmempl:=tfrmempl.Create(application);
  if frmempl.ShowModal=mrok then
   begin
    edit1.Text:=trim(frmempl.ADOQuery1employee_name.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit1.SetFocus;
  frmempl.free;
 end;
4:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit1.SetFocus;
  form_wh.free;
 end;
5:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit1.Text);
  form_inv.ADOQuery1.Open;
  if form_inv.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_inv.ADOQuery1INV_PART_NUMBER.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
   edit1.SetFocus;
  form_inv.free;
 end;
6:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit1.Text:=trim(form_supp.ADOQuery1CODE.Value);
    button2.Enabled:=true;
    button2.SetFocus;
   end
  else
  edit1.SetFocus;
  form_supp.free;
 end;
end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin

if ADOConnection1.Connected then
 begin

  adoquery1.Open;
  while not adoquery1.Eof do
   begin
    combobox1.Items.Add(adoquery1.FieldValues['DESCRIPTION']);
    combobox2.Items.Add(adoquery1.FieldValues['DESCRIPTION']);
    adoquery1.Next;
   end;
  adoquery1.Close;

 end;


end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
case listbox2.ItemIndex of
1:
 begin
  form_dept:=tform_dept.create(application);
  if form_dept.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_dept.ADOQuery1dept_code.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit2.SetFocus;
  form_dept.Free;
 end;
3:
 begin
  frmempl:=tfrmempl.Create(application);
  if frmempl.ShowModal=mrok then
   begin
    edit2.Text:=trim(frmempl.ADOQuery1employee_name.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit2.SetFocus;
  frmempl.free;
 end;
4:
 begin
  form_wh:=tform_wh.Create(application);
  if form_wh.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_wh.ADOQuery1WAREHOUSE_CODE.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
   edit2.SetFocus;
  form_wh.free;
 end;
6:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit2.Text:=trim(form_supp.ADOQuery1CODE.Value);
    button1.Enabled:=true;
    button1.SetFocus;
   end
  else
  edit2.SetFocus;
  form_supp.free;
 end;
end;
end;

procedure TForm1.Button2Click(Sender: TObject);
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
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0068.po_req_number LIKE ''%'+edit1.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0068.department_name LIKE ''%'+edit1.Text+'%''';
 2:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.date)+'到'+datetostr(dtpk2.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and  Data0068.req_date>='''+datetostr(dtpk1.date)+''' and Data0068.req_date<='''+datetostr(dtpk2.date)+''''
  end;
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0005.EMPLOYEE_NAME LIKE ''%'+edit1.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015.WAREHOUSE_code = '''+edit1.Text+'''';
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0017.inv_part_number LIKE ''%'+edit1.Text+'%''';
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0023.code LIKE ''%'+edit1.Text+'%''';
 7:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0017.inv_part_description LIKE ''%'+edit1.Text+'%''';
 8:
  begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0068.status '+getstatus(combobox5);// inttostr(combobox5.ItemIndex+1);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=getstatus(combobox5);
  end;
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var
 i:byte;
 quantity,total_lucre:double;
begin
quantity:=0;
total_lucre:=0;
screen.Cursor:=crsqlwait;

if radiogroup1.ItemIndex=0 then  //请购
 begin
  if rgp2.ItemIndex=0 then   //标准请购
   begin
    if sgrid1.RowCount=2 then
    begin
     messagedlg('请首先定义查询条件!',mtinformation,[mbok],0);
     screen.Cursor:=crdefault;
    end
   else
   begin
   form2:=tform2.Create(application);
   with form2.adoquery1 do
   begin
    close;
    for i:=1 to sgrid1.RowCount-2 do sql.Add(sgrid1.Cells[2,i]);
    case radiogroup2.ItemIndex of
     0:sql.Add('and data0069.o_i_flag=0');
     1:sql.Add('and data0069.o_i_flag=1');
    end;
    sql.Add('order by data0068.po_req_number');
    Prepared;
    open;
   end;

   if form2.ADOQuery1.IsEmpty then
    begin
     messagedlg('对不起，没有找到符合条件的记录!',mtinformation,[mbok],0);
     screen.Cursor:=crdefault;
    end
   else
    begin
   while not form2.adoquery1.Eof do
   begin
    quantity:=quantity+form2.adoquery1QUANTITY.Value;
    total_lucre:=total_lucre+form2.adoquery1total.Value;
    form2.adoquery1.Next;
   end;
   form2.adoquery1.First;
   form2.Edit1.Text:=formatfloat('0.00',quantity);
   form2.Edit2.Text:=formatfloat('0.0000',total_lucre);
   form2.DBGrid1.Columns[0].Width:=80;
   form2.DBGrid1.Columns[1].Width:=55;
   form2.DBGrid1.Columns[2].Width:=80;
   form2.DBGrid1.Columns[3].Width:=80;
   form2.DBGrid1.Columns[5].Width:=90;
   if strtoint(vprev)<=2 then    //权限
    begin
     form2.Edit2.Visible := false;
     form2.Label2.Visible := false;
     form2.DBGrid1.Columns[14].Visible := false;
     form2.DBGrid1.Columns[15].Visible := false;
    end;
   form2.DBGrid1.Columns[7].Width := 200;
   form1.Hide;
   form2.ShowModal;
   form2.free;
   screen.Cursor:=crdefault;
  end;
  end;
  end
 else    //杂项请购
  begin
   if sgrid1.RowCount = 2 then
    begin
     messagedlg('请首先定义查询条件!',mtinformation,[mbok],0);
     screen.Cursor := crdefault;
    end
   else
    begin
     form3 := tform3.Create(application);
     with form3.adoquery1 do
     begin
      close;
      for i:=1 to sgrid1.RowCount-2 do sql.Add(sgrid1.Cells[2,i]);
      case radiogroup2.ItemIndex of
       0:sql.Add('and data0204.o_i_flag=0');
       1:sql.Add('and data0204.o_i_flag=1');
      end;
      sql.Add('order by data0068.po_req_number');
      Prepared;
      open;
     end;

    if form3.ADOQuery1.IsEmpty then
     begin
      messagedlg('对不起，没有找到符合条件的记录!',mtinformation,[mbok],0);
      screen.Cursor:=crdefault;
     end
   else
    begin
     while not form3.adoquery1.Eof do
      begin
       quantity := quantity+form3.ADOQuery1QUANTITY_REQUIRED.Value;
       total_lucre := total_lucre+form3.adoquery1total.Value;
       form3.adoquery1.Next;
      end;
     form3.adoquery1.First;
     form3.Edit1.Text := formatfloat('0.00',quantity);
     form3.Edit2.Text := formatfloat('0.0000',total_lucre);
     if strtoint(vprev) <= 2 then    //权限
      begin
       form3.Edit2.Visible := false;
       form3.Label2.Visible := false;
       form3.DBGrid1.Columns[16].Visible := false;
       form3.DBGrid1.Columns[17].Visible := false;
      end;
     form3.DBGrid1.Columns[7].Width := 200;
     form1.Hide;
     form3.ShowModal;
     form3.free;
     screen.Cursor:=crdefault;
    end;
   end;
  end;
 end
else      //采购
 begin
  if rgp3.ItemIndex=0 then //标准 采购
   begin
    if sgrid1.RowCount=2 then
     begin
      messagedlg('请首先定义查询条件!',mtinformation,[mbok],0);
      screen.Cursor:=crdefault;
     end
    else
     begin
   form4:=tform4.Create(application);
    with form4.adoquery1 do
     begin
      close;
      for i:=1 to sgrid1.RowCount-2 do sql.Add(sgrid1.Cells[2,i]);
      case radiogroup2.ItemIndex of
       0:sql.Add('and data0070.DISCOUNT2_DAYS=0');
       1:sql.Add('and data0070.DISCOUNT2_DAYS=1');
      end;
      Prepared;
      open;
      Sort := 'po_number';
     end;

   if form4.ADOQuery1.IsEmpty then
    begin
     messagedlg('对不起，没有找到符合条件的记录!',mtinformation,[mbok],0);
     screen.Cursor:=crdefault;
    end
   else
    begin
     while not form4.adoquery1.Eof do
      begin
       quantity:=quantity+form4.ADOQuery1QUAN_ord.Value;
       total_lucre:=total_lucre+form4.adoquery1total.Value;
       form4.adoquery1.Next;
      end;
     form4.adoquery1.First;
     form4.Edit1.Text:=formatfloat('0.00',quantity);
     form4.Edit2.Text:=formatfloat('0.0000',total_lucre);
     if strtoint(vprev)<=2 then    //权限
      begin
       form4.Edit2.Visible:=false;
       form4.Label2.Visible:=false;
       form4.DBGrid1.Columns[12].visible:=false;
       form4.DBGrid1.Columns[13].visible:=false;
       form4.DBGrid1.Columns[17].Visible:=false;
      end;
     form1.Hide;
     form4.ShowModal;
     form4.free;
     screen.Cursor:=crdefault;
    end;
   end;
  end
  else //杂项采购
   begin

  if sgrid1.RowCount=2 then
   begin
    messagedlg('请首先定义查询条件!',mtinformation,[mbok],0);
    screen.Cursor:=crdefault;
   end
  else
   begin
    form5:=tform5.Create(application);
    with form5.adoquery1 do
     begin
      close;
      for i:=1 to sgrid1.RowCount-2 do sql.Add(sgrid1.Cells[2,i]);
      case radiogroup2.ItemIndex of
       0:sql.Add('and data0070.DISCOUNT2_DAYS=0');
       1:sql.Add('and data0070.DISCOUNT2_DAYS=1');
      end;
      Prepared;
      open;
      Sort := 'po_number';
     end;
    if form5.ADOQuery1.IsEmpty then
     begin
      messagedlg('对不起，没有找到符合条件的记录!',mtinformation,[mbok],0);
      screen.Cursor:=crdefault;
     end
    else
     begin
      while not form5.adoquery1.Eof do
       begin
        quantity:=quantity+form5.ADOQuery1QUAN_ord.Value;
        total_lucre:=total_lucre+form5.adoquery1total.Value;
        form5.adoquery1.Next;
       end;
      form5.adoquery1.First;
      form5.Edit1.Text:=formatfloat('0.00',quantity);
      form5.Edit2.Text:=formatfloat('0.0000',total_lucre);
      if strtoint(vprev)<=2 then    //权限
       begin
        form5.Edit2.Visible:=false;
        form5.Label2.Visible:=false;
        form5.DBGrid1.Columns[14].visible:=false;
        form5.DBGrid1.Columns[15].Visible:=false;
        form5.DBGrid1.Columns[16].Visible:=false;        
       end;
      form1.Hide;
      form5.ShowModal;
      form5.free;
      screen.Cursor:=crdefault;
     end;
   end;
  end;
 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
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
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0068.po_req_number LIKE ''%'+edit2.Text+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0068.department_name LIKE ''%'+edit2.Text+'%''';
 2:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk3.date)+'到'+datetostr(dtpk4.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and  Data0068.req_date>='''+datetostr(dtpk3.date)+''' and Data0068.req_date<='''+datetostr(dtpk4.date)+''''
  end;
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0005.EMPLOYEE_NAME LIKE '''+edit2.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015.WAREHOUSE_code = '''+edit2.Text+'''';
 5:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text;
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0204.description_2 LIKE '''+trim(combobox1.Text)+'%''';
  end;
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0023.code LIKE ''%'+edit2.Text+'%''';
 7:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0204.description_1 LIKE ''%'+edit2.Text+'%''';
 8:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0204.gui_ge LIKE ''%'+edit2.Text+'%''';
 9:
  begin
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0068.status '+getstatus(combobox6);//+inttostr(combobox6.ItemIndex+1);
   sgrid1.Cells[1,sgrid1.RowCount-1]:=getstatus(combobox6);
  end;
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
begin
 if trim(combobox1.Text)<>'' then
  button1.Enabled:=true;
end;

procedure TForm1.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=8 then button1.Enabled:=false;
end;

procedure TForm1.RGp3Click(Sender: TObject);
begin
bitbtn2click(sender);
if rgp3.ItemIndex=0 then
 begin
  groupbox3.Visible:=true;
  groupbox4.Visible:=false;
  listbox3.Selected[0]:=true;
  listbox3click(sender);
 end
else
 begin
  groupbox3.Visible:=false;
  groupbox4.Visible:=true;
  listbox4.Selected[0]:=true;
  listbox4click(sender);
 end;
end;

procedure TForm1.ListBox3Click(Sender: TObject);
begin
label8.Caption:=listbox3.Items[listbox3.itemindex];
edit3.Text:='';
edit3.Visible:=true;
button3.Enabled:=false;

bitbtn6.Visible:=true;
label7.Visible:=false;
label9.Visible:=false;
dtpk5.Visible:=false;
dtpk6.Visible:=false;
combobox3.Visible:=false;
case listbox3.ItemIndex of
 0:bitbtn6.Visible:=false;
 1:begin
    bitbtn6.Visible:=false;
   edit3.Visible:=false;
   label7.Visible:=true;
   label9.Visible:=true;
   dtpk5.Visible:=true;
   dtpk6.Visible:=true;
   button3.Enabled:=true;
   end;
 2:begin
   end;
 3:bitbtn6.Visible:=false;
 4:;
 5:;
 6:bitbtn6.Visible:=false;
 7:
  begin
   combobox3.Visible:=true;
   bitbtn6.Visible:=false;
   edit3.Visible:=false;
   button3.Enabled:=true;
  end;
 8:;
 9:;
end;
end;

procedure TForm1.Edit3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit3.Text)<>'' then
 button3.Enabled:=true
else
 button3.Enabled:=false;
end;

procedure TForm1.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=8 then button4.Enabled:=false;
end;

procedure TForm1.ListBox4Click(Sender: TObject);
begin
label11.Caption:=listbox4.Items[listbox4.itemindex];
edit4.Text:='';
edit4.Visible:=true;
button4.Enabled:=false;
combobox2.Visible:=false;
combobox2.ItemIndex:=-1;

bitbtn7.Visible:=true;
label12.Visible:=false;
label10.Visible:=false;
dtpk7.Visible:=false;
dtpk8.Visible:=false;
combobox4.Visible:=false;
case listbox4.ItemIndex of
 0:bitbtn7.Visible:=false;
 1:begin
   bitbtn7.Visible:=false;
   edit4.Visible:=false;
   label12.Visible:=true;
   label10.Visible:=true;
   dtpk7.Visible:=true;
   dtpk8.Visible:=true;
   button4.Enabled:=true;
  end;
 2:begin
   end;
 3:bitbtn7.Visible:=false;
 4:begin
    combobox2.Visible:=true;
    bitbtn7.Visible:=false;
    edit4.Visible:=false;
  end;
 5:begin
   end;
 6:bitbtn7.Visible:=false;
 7:bitbtn7.Visible:=false;
 8:begin
  combobox4.Visible:=true;
  bitbtn7.Visible:=false;
  button4.Enabled:=true;
  edit4.Visible:=false;
 end;
end;

end;

procedure TForm1.ComboBox2Click(Sender: TObject);
begin
 if trim(combobox2.Text)<>'' then
  button4.Enabled:=true;
end;

procedure TForm1.Edit4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit4.Text)<>'' then
 button4.Enabled:=true
else
 button4.Enabled:=false;
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
case listbox3.ItemIndex of
2:
 begin
  form_employee:=tform_employee.Create(application);
  if form_employee.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_employee.ADOQuery1EMPL_CODE.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
   edit3.SetFocus;
  form_employee.free;
 end;
4:
 begin
  form_inv:=tform_inv.Create(application);
  form_inv.ADOQuery1.Close;
  form_inv.ADOQuery1.Parameters[1].Value:=trim(edit3.Text);
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
5:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit3.Text:=trim(form_supp.ADOQuery1CODE.Value);
    button3.Enabled:=true;
    button3.SetFocus;
   end
  else
  edit3.SetFocus;
  form_supp.free;
 end;
8:
 begin
try
 frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
 InputVar.Fields := 'group_name/类型代码/160,group_desc/类型名称/230';
 InputVar.Sqlstr := 'select RKEY,group_name,group_desc from data0496 '+
                    'order by group_name';
 InputVar.AdoConn := self.ADOConnection1;
 inputvar.KeyField:='group_name';
 inputvar.InPut_value:=edit3.Text;
 frmPick_Item_Single.InitForm_New(InputVar)  ;
if frmPick_Item_Single.ShowModal=mrok then
 begin
  edit3.Text := frmPick_Item_Single.adsPick.FieldValues['group_name'];
  button3.Enabled:=true;
  button3.SetFocus;
 end;
finally
 frmPick_Item_Single.adsPick.Close;
 frmPick_Item_Single.Free ;
end;
 end;
9:
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
end;

end;

procedure TForm1.BitBtn7Click(Sender: TObject);
begin
case listbox4.ItemIndex of
2:
 begin
  form_employee:=tform_employee.Create(application);
  if form_employee.ShowModal=mrok then
   begin
    edit4.Text:=trim(form_employee.ADOQuery1EMPL_CODE.Value);
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
   edit4.SetFocus;
  form_employee.free;
 end;
5:
 begin
  form_supp:=tform_supp.Create(application);
  if form_supp.ShowModal=mrok then
   begin
    edit4.Text:=trim(form_supp.ADOQuery1CODE.Value);
    button4.Enabled:=true;
    button4.SetFocus;
   end
  else
  edit4.SetFocus;
  form_supp.free;
 end;
9:
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
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and po_number LIKE '''+edit3.Text+'%''';
 1:begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk5.date)+'到'+datetostr(dtpk6.date);
   sgrid1.Cells[2,sgrid1.RowCount-1]:=
   'and  po_date>='''+datetostr(dtpk5.date)+''' and po_date<='''+datetostr(dtpk6.date)+''''
  end;
 2:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0005_1.EMPL_CODE LIKE ''%'+edit3.Text+'%''';
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and fob LIKE '''+edit3.Text+'%''';
 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0017.inv_part_number LIKE ''%'+trim(edit3.Text)+'%''';
 5:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0023.code LIKE ''%'+edit3.Text+'%''';
 6:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0017.inv_part_description LIKE ''%'+trim(edit3.Text)+'%''';
 7:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:=getstatus(combobox3);//combobox3.Items[combobox3.itemindex];
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0070.STATUS '+getstatus(combobox3);//+inttostr(combobox3.itemindex+1)+'';
  end;
 8:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0496.group_name = '''+edit3.Text+'''';
 9:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015.WAREHOUSE_code = '''+edit3.Text+'''';
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
 i:byte;
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
  0:
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and po_number LIKE ''%'+edit4.Text+'%''';
  1:begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk7.date)+'到'+datetostr(dtpk8.date);
    sgrid1.Cells[2,sgrid1.RowCount-1]:=
    'and  po_date>='''+datetostr(dtpk7.date)+''' and po_date<='''+datetostr(dtpk8.date)+''''
    end;
  2:
   sgrid1.Cells[2,sgrid1.RowCount-1] := 'and Data0005_1.EMPL_CODE LIKE ''%'+trim(edit4.Text)+'%''';
  3:
   sgrid1.Cells[2,sgrid1.RowCount-1] := 'and fob LIKE '''+trim(edit4.Text)+'%''';
  4:
   begin
    sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox2.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1] := 'and description2 LIKE '''+trim(combobox2.Text)+'%''';
   end;
  5:
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0023.code LIKE ''%'+trim(edit4.Text)+'%''';
  6:
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0072.DESCRIPTION LIKE ''%'+trim(edit4.Text)+'%''';
  7:
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0072.gui_ge LIKE ''%'+trim(edit4.Text)+'%''';
  8:
  begin
   sgrid1.Cells[1,sgrid1.RowCount-1]:=getstatus(combobox4);//combobox4.Items[combobox4.itemindex];
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0070.STATUS '+getstatus(combobox4);//inttostr(combobox4.itemindex+1)+'';
  end;
  9:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0015.WAREHOUSE_code = '''+edit4.Text+'''';
 end;
 sgrid1.RowCount:=sgrid1.RowCount+1;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
begin
  try
  form_date:=tform_date.Create(application);
  if form_date.ShowModal=mrok then
   begin
    if form_date.radiogroup1.itemindex=0 then   //采购数量分析
    try
    form7:=tform7.Create(application);
    form7.ADOQuery1.Parameters[3].Value:=form_date.DTpk1.Date;
    form7.ADOQuery1.Parameters[4].Value:=form_date.DTPk2.Date;

    if form_date.ComboBox1.ItemIndex<>form_date.ComboBox1.Items.Count-1 then
     begin
      form7.ADOQuery1.Parameters[1].Value:=1;
      form7.ADOQuery1.Parameters[2].Value:=form_date.ADO15rkey.value;
     end;
    form7.ADOQuery1.Prepared;
    form7.ADOQuery1.Open;

    if not form7.adoquery1.isempty then
     begin
      form7.adoanalysis.close;
      form7.adoanalysis.Parameters[1].Value:=form_date.DTpk1.Date;
      form7.adoanalysis.Parameters[2].Value:=form_date.DTPk2.Date;
      if form_date.ComboBox1.ItemIndex<>form_date.ComboBox1.Items.Count-1 then
       begin
        form7.adoanalysis.Parameters[3].Value:=1;   //带工厂
        form7.adoanalysis.Parameters[4].Value:=form_date.ADO15rkey.value;
       end
      else
       form7.adoanalysis.Parameters[3].Value:=0; //不带工厂
      form7.ADOanalysis.Prepared;
      FORM7.ADOanalysis.Open;
      form7.ADOanalysis.first;

      form7.adobalan.close;                 //对比数据
      form7.adobalan.Parameters[1].Value:=form_date.DTpk1.Date;
      form7.adobalan.Parameters[2].Value:=form_date.DTPk2.Date;
      if form_date.ComboBox1.ItemIndex<>form_date.ComboBox1.Items.Count-1 then
       begin
        form7.adobalan.Parameters[3].Value:=1;   //带工厂
        form7.adobalan.Parameters[5].Value:=form_date.ADO15rkey.value;
       end;
      form7.ADObalan.Prepared;
      form7.adobalan.open;

      form7.aq19.open;
      while not form7.aq19.eof do
       begin
        form7.combobox3.Items.Add(trim(form7.Aq19inv_group_name.value)
        +trim(form7.Aq19inv_group_desc.value));
        form7.aq19.next;
       end;
      form7.combobox3.ItemIndex:=0;
      form7.aq19.first;

      form7.adogroup_balan.close;                 //对比数据
      form7.adogroup_balan.Parameters[1].Value:=form_date.DTpk1.Date;
      form7.adogroup_balan.Parameters[2].Value:=form_date.DTPk2.Date;
      form7.adogroup_balan.Parameters[4].Value:=form7.aq19rkey.value;
      if form_date.ComboBox1.ItemIndex<>form_date.ComboBox1.Items.Count-1 then
       begin
        form7.adogroup_balan.Parameters[3].Value:=1;   //带工厂
        form7.adogroup_balan.Parameters[5].Value:=form_date.ADO15rkey.value;
       end;
      form7.ADOgroup_balan.Prepared; 
      form7.adogroup_balan.open;

      form7.ShowModal;
     end
     else
     showmessage('请不起，没有找到可以分析的数据');
    finally
     form7.Free;
    end
    else                //以仓库入库数量为准分析
    try
     Form_whdate:=tForm_whdate.create(application);
     Form_whdate.ADOQuery1.Parameters[3].Value:=form_date.DTpk1.Date;
     Form_whdate.ADOQuery1.Parameters[4].Value:=form_date.DTPk2.Date;

     if form_date.ComboBox1.ItemIndex<>form_date.ComboBox1.Items.Count-1 then
     begin
      Form_whdate.ADOQuery1.Parameters[1].Value:=1;
      Form_whdate.ADOQuery1.Parameters[2].Value:=form_date.ADO15rkey.value;
     end;
     Form_whdate.ADOQuery1.Prepared;
     Form_whdate.ADOQuery1.Open;

    if not Form_whdate.adoquery1.isempty then
     begin
      Form_whdate.adoanalysis.close;
      Form_whdate.adoanalysis.Parameters[1].Value:=form_date.DTpk1.Date;
      Form_whdate.adoanalysis.Parameters[2].Value:=form_date.DTPk2.Date;
      if form_date.ComboBox1.ItemIndex<>form_date.ComboBox1.Items.Count-1 then
       begin
        Form_whdate.adoanalysis.Parameters[3].Value:=1;   //带工厂
        Form_whdate.adoanalysis.Parameters[4].Value:=form_date.ADO15rkey.value;
       end
      else
       Form_whdate.adoanalysis.Parameters[3].Value:=0; //不带工厂
      Form_whdate.ADOanalysis.Prepared;
      Form_whdate.ADOanalysis.Open;
      Form_whdate.ADOanalysis.first;

      Form_whdate.adobalan.close;                 //对比数据
      Form_whdate.adobalan.Parameters[1].Value:=form_date.DTpk1.Date;
      Form_whdate.adobalan.Parameters[2].Value:=form_date.DTPk2.Date;
      if form_date.ComboBox1.ItemIndex<>form_date.ComboBox1.Items.Count-1 then
       begin
        Form_whdate.adobalan.Parameters[3].Value:=1;   //带工厂
        Form_whdate.adobalan.Parameters[5].Value:=form_date.ADO15rkey.value;
       end;
      Form_whdate.adobalan.Prepared;
      Form_whdate.adobalan.open;

       Form_whdate.aq19.open;
      while not Form_whdate.aq19.eof do
       begin
        Form_whdate.combobox3.Items.Add(trim(Form_whdate.Aq19inv_group_name.value)
        +trim(Form_whdate.Aq19inv_group_desc.value));
        Form_whdate.aq19.next;
       end;
      Form_whdate.combobox3.ItemIndex:=0;
      Form_whdate.aq19.first;

      Form_whdate.adogroup_balan.close;                 //对比数据
      Form_whdate.adogroup_balan.Parameters[1].Value:=form_date.DTpk1.Date;
      Form_whdate.adogroup_balan.Parameters[2].Value:=form_date.DTPk2.Date;
      Form_whdate.adogroup_balan.Parameters[4].Value:=Form_whdate.aq19rkey.value;
      if form_date.ComboBox1.ItemIndex<>form_date.ComboBox1.Items.Count-1 then
       begin
        Form_whdate.adogroup_balan.Parameters[3].Value:=1;   //带工厂
        Form_whdate.adogroup_balan.Parameters[5].Value:=form_date.ADO15rkey.value;
       end;
      Form_whdate.adogroup_balan.Prepared; 
      Form_whdate.adogroup_balan.open;

      Form_whdate.ShowModal;
     end
     else
     showmessage('请不起，没有找到可以分析的数据');

    finally
     Form_whdate.free;
    end;


   end;
  finally
   form_date.Free;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i]:=sgrid1.Rows[i+1];
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

procedure TForm1.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;//右键选择stringgrid控件的方法
begin
if button=mbright then
 begin
   sgrid1.MouseToCell(x,y,column,row);
   if (row>0)  then
    begin
     sgrid1.Row:=row;
    end;
 end;
end;

function TForm1.getstatus(Grp: TGroupBox): string;
var i:integer;
begin
  result:=' in (-1';
  for i:=0 to Grp.ControlCount-1 do
  begin
    if TCheckBox(Grp.Controls[i]).Checked then
    result:=result+','+inttostr(TCheckBox(Grp.Controls[i]).Tag) ;
  end;
  result:=result+')';
end;

end.
