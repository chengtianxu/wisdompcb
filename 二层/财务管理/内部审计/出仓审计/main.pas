unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, Grids, DBGrids, ExtCtrls,
  Buttons, DB, ADODB,Excel2000,ClipBrd, ComObj;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    dtpk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    PopupMenu1: TPopupMenu;
    ImageList1: TImageList;
    N1: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ADO457: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADO457EMPLOYEE_NAME: TStringField;
    ADO457DEPT_NAME: TStringField;
    ADO457WAREHOUSE_CODE: TStringField;
    ADO457GON_NUMBER: TStringField;
    ADO457AUDITED_DATE: TDateTimeField;
    ADO457AUDITED_BY: TIntegerField;
    ADO457RECD_BY: TIntegerField;
    ADO457RKEY: TAutoIncField;
    ADO457CREATE_DATE: TDateTimeField;
    ADO457v_emp: TStringField;
    ADO457DSDesigner: TStringField;
    ADO457DSDesigner2: TStringField;
    ADO207: TADOQuery;
    ADO208: TADOQuery;
    ADO207INV_PART_NUMBER: TStringField;
    ADO207INV_NAME: TStringField;
    ADO207rohs: TStringField;
    ADO207PRICE: TBCDField;
    ADO207TAX_2: TBCDField;
    ADO207CURR_NAME: TStringField;
    ADO207UNIT_NAME: TStringField;
    ADO207QUANTITY: TBCDField;
    ADO208QUANTITY: TBCDField;
    ADO208goods_guige: TStringField;
    ADO208goods_name: TStringField;
    ADO208goods_type: TStringField;
    ADO208UNIT_NAME: TStringField;
    ADO208LOCATION: TStringField;
    ADO208rohs: TStringField;
    ADO208state_tax: TBCDField;
    ADO208unit_price: TBCDField;
    ADO457STATUS: TWordField;
    ADO457ttype: TSmallintField;
    BitBtn3: TBitBtn;
    ADO207INV_DESCRIPTION: TStringField;
    ADO457ref_number: TStringField;
    ADO207DSDesigner: TStringField;
    ADO457au_name: TStringField;
    ADO207LOCATION: TStringField;
    ADO208RTN_QUANTITY: TFloatField;
    ADO207RTN_QUANTITY: TFloatField;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ADO457ABBR_NAME: TStringField;
    ADO207ABBR_NAME: TStringField;
    ADO208ABBR_NAME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure CheckBox1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
   v_colwidth,v_colwidth1,v_colwidth2: array of integer;
   dbgrid2_coltotal:integer;
   field_name :string;
   FsSQL:string;
   
   OldGridWnd : TWndMethod;
  procedure CopyDbDataToExcel(Args:array of const);
  procedure NewGridWnd(var Message: TMessage);
    { Private declarations }
  public
  sys_longdate,sys_shortdate:tdatetime;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo, report_form,report2_form, mulprint_form,
forpro_form,nopro_form,common;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
if not app_init(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:= application.Title;



 //user_ptr := '550';
 //vprev := '4';
 //dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;
procedure Tform1.CopyDbDataToExcel(Args:array of const);
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
   XLApp.WorkBooks[1].WorkSheets[I+1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrid(Args[I].VObject).DataSource.DataSet.Active then
    begin
     Screen.Cursor := crDefault;
     Exit;
    end;
   TDBGrid(Args[I].VObject).DataSource.DataSet.DisableControls;
   TDBGrid(Args[I].VObject).DataSource.DataSet.first;

   v_cloumn:=0;
   for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
    if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
     Sheet.Cells[1, iCount + 1 - v_cloumn] :=
     TDBGrid(Args[I].VObject).Columns.Items[iCount].Title.Caption
    else
     inc(v_cloumn);

   jCount := 1;
   while not TDBGrid(Args[I].VObject).DataSource.DataSet.Eof do
   begin
     v_cloumn:=0;
     for iCount := 0 to TDBGrid(Args[I].VObject).Columns.Count - 1 do
      if TDBGrid(Args[I].VObject).Columns.Items[iCount].Visible=true then
       Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
       TDBGrid(Args[I].VObject).Columns.Items[iCount].Field.AsString
      else
       inc(v_cloumn);
     Inc(jCount);
     TDBGrid(Args[I].VObject).DataSource.DataSet.Next;
   end;

   XlApp.Visible := True;
   TDBGrid(Args[I].VObject).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:byte;
begin

  dm.ADOQ.Close;
  dm.ADOQ.SQL.Text:='select rkey,abbr_name from data0015' ;
  dm.ADOQ.Open;
  while not dm.ADOQ.Eof do
  begin
    ComboBox1.Items.Append(dm.ADOQ.Fields[1].asstring);
    dm.ADOQ.Next;
  end;
  FsSQL:=ADO457.CommandText;

   self.field_name:='GON_NUMBER';
   dbgrid2_coltotal:=dbgrid1.Width;

   with dm.ADOQ do
   begin
    close;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    open;
    sys_longdate := fieldvalues['v_dt']; //长格式
    sys_shortdate:=strtodate(datetostr(sys_longdate));
   end;

  dtpk2.Date := sys_shortdate;
  dtpk1.Date := dtpk2.Date - 5;

  self.ADO457.Close;
  self.ADO457.Parameters[3].Value:=dtpk1.Date;
  self.ADO457.Parameters[4].Value:=dtpk2.Date+1;
  self.ADO457.Open;
  
  self.ADO207.Open;
  self.ADO208.Open;

 setlength(v_colwidth,dbgrid1.FieldCount);
 setlength(v_colwidth1,dbgrid2.FieldCount);
 setlength(v_colwidth2,dbgrid3.FieldCount);
 for i:=0 to high(v_colwidth) do v_colwidth[i] := dbgrid1.Columns[i].Width;
 for i:=0 to high(v_colwidth1) do v_colwidth1[i] := dbgrid2.Columns[i].Width;
 for i:=0 to high(v_colwidth2) do v_colwidth2[i] := dbgrid3.Columns[i].Width;
end;

procedure TForm1.DataSource1DataChange(Sender: TObject; Field: TField);
begin
if (self.ADO457ttype.Value=1) or (self.ADO457ttype.Value=2)or
   (self.ADO457ttype.Value=3) or (self.ADO457ttype.Value=4) then
  self.DBGrid2.BringToFront
 else
     self.DBGrid3.BringToFront;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
self.ADO457.Close;
if not checkbox1.Checked then
  self.ADO457.Parameters[0].Value:=0
 else
  self.ADO457.Parameters[0].Value:=9;
if not checkbox2.Checked then
 self.ADO457.Parameters[1].Value:=1
 else
  self.ADO457.Parameters[1].Value:=9;
if not checkbox3.Checked then
 self.ADO457.Parameters[2].Value:=2
 else
  self.ADO457.Parameters[2].Value:=9;
 self.ADO457.Open;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
 if (self.ADO457ttype.Value=5) or (ADO457ttype.Value=6) then
begin
 form_report2:=Tform_report2.Create(application);
 form_report2.aq457.Close;
 form_report2.aq457.Parameters[0].Value:=self.ADO457RKEY.Value;
 form_report2.aq457.Open;
 form_report2.ado208.Open;
 form_report2.aq493.Open;

 form_report2.ppReport2.Reset;
 form_report2.ppReport2.Template.FileName:=
   StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_miscreport.rtm';
 form_report2.ppReport2.Template.LoadFromFile;
 form_report2.ppReport2.SaveAsTemplate:=False;

 form_report2.ppReport2.Print;
 form_report2.Free;
end
else
 begin
  form_report1:=Tform_report1.Create(application);
  form_report1.aq457.Close;
  form_report1.aq457.Parameters[0].Value:=self.ADO457RKEY.Value;
  form_report1.aq457.Open;
  form_report1.ado207.Open;
  form_report1.aq493.Open;
  form_report1.ppReport1.Reset;
  form_report1.ppReport1.Template.FileName:=
   StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_invtreport.rtm';
  form_report1.ppReport1.Template.LoadFromFile;
  form_report1.ppReport1.SaveAsTemplate:=False;
  form_report1.ppReport1.Print;

  form_report1.Free;
 end;
end;

procedure TForm1.N5Click(Sender: TObject);
var
 i:integer;
begin
 try
  form_mulprint:=tForm_mulprint.Create(application);
  if form_mulprint.ShowModal=mrok then
  for i:=1 to form_mulprint.StG2.RowCount-2 do
  begin
  with dm.ADO457 do
  begin
   close;
   parameters[0].Value:=strtoint(form_mulprint.StG2.Cells[2,i]);
   open;
  end;
  if (dm.ADO457TTYPE.Value=1) or (dm.ADO457TTYPE.Value=2)or
     (dm.ADO457TTYPE.Value=3) or (dm.ADO457TTYPE.Value=4) then
  begin
  try
   form_report1:=tform_report1.Create(application);

   form_report1.aq457.Close;
   form_report1.aq457.Parameters[0].Value:=strtoint(form_mulprint.StG2.Cells[2,i]);
   form_report1.aq457.Open;
   form_report1.ADO207.Open;
   form_report1.Aq493.Open;
   form_report1.ppReport1.Reset;
   form_report1.ppReport1.Template.FileName:=
    StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_invtreport.rtm';
   form_report1.ppReport1.Template.LoadFromFile;
   form_report1.ppReport1.SaveAsTemplate:=False;
   form_report1.ppReport1.DeviceType:='printer';
   form_report1.ppReport1.ShowPrintDialog:=false;
   form_report1.ppReport1.Print;
  finally
   form_report1.Free;
  end;
 end
else
  begin
   try
    form_report2:=tform_report2.Create(application);

    form_report2.aq457.Close;
    form_report2.aq457.Parameters[0].Value:=strtoint(form_mulprint.StG2.Cells[2,i]);
    form_report2.aq457.Open;
    form_report2.ADO208.Open;
    form_report2.Aq493.Open;
     form_report2.ppReport2.Reset;
     form_report2.ppReport2.Template.FileName:=
       StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'putout_miscreport.rtm';
     form_report2.ppReport2.Template.LoadFromFile;
     form_report2.ppReport2.SaveAsTemplate:=False;
    form_report2.ppReport2.DeviceType:='printer';
    form_report2.ppReport2.ShowPrintDialog:=false;
    form_report2.ppReport2.Print;
   finally
    form_report2.Free;
   end;
  end;
 end;//对应for语句中的begin
 finally
  form_mulprint.Free;
 end;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 i:byte;
 bm:tbookmark;
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0)
else
  try
    self.ADO457.DisableControls;
    bm:=dbgrid1.DataSource.DataSet.GetBookmark;
    for  i:=0 to dbgrid1.SelectedRows.Count-1 do
    begin
    dbgrid1.DataSource.DataSet.Bookmark :=dbgrid1.SelectedRows.Items[i];
    dm.ADO457.Close;
    dm.ADO457.Parameters[0].Value:=self.ADO457RKEY.Value;
    dm.ADO457.Open;
    dm.ADO457.Edit;
     if dm.ADO457STATUS.Value=0 then
     begin
      dm.ADO457STATUS.Value:=1;
      dm.ADO457AUDITED_BY.AsString:=user_ptr;
      dm.ADO457AUDITED_DATE.Value:=self.sys_shortdate;
     end;
     dm.ADO457.Post;
    end;
   dbgrid1.DataSource.DataSet.GotoBookmark(bm);
    dbgrid1.DataSource.DataSet.FreeBookmark(bm);
    self.ADO457.EnableControls;
  finally
    self.ADO457.Close;
    self.ADO457.Open;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var
 i:byte;
 bm:tbookmark;
begin
 if (strtoint(vprev)<>4) then
  messagedlg('对不起!您没有该程序的取消权限',mtinformation,[mbok],0)
 else
  if messagedlg('你确定要取消审核吗？',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
  try
    self.ADO457.DisableControls;
    bm:=dbgrid1.DataSource.DataSet.GetBookmark;
  for  i:=0 to dbgrid1.SelectedRows.Count-1 do
  begin
    dbgrid1.DataSource.DataSet.Bookmark :=dbgrid1.SelectedRows.Items[i];
    dm.ADO457.Close;
    dm.ADO457.Parameters[0].Value:=self.ADO457RKEY.Value;
    dm.ADO457.Open;
    dm.ADO457.Edit;
     if dm.ADO457STATUS.Value=1 then
     begin
      dm.ADO457STATUS.Value:=0;
      dm.ADO457AUDITED_BY.AsString:='';
      dm.ADO457AUDITED_DATE.AsString:='';
     end;
     dm.ADO457.Post;
    end;
  dbgrid1.DataSource.DataSet.GotoBookmark(bm);
  finally
    dbgrid1.DataSource.DataSet.FreeBookmark(bm);
    self.ADO457.EnableControls;
    self.ADO457.Close;
    self.ADO457.Open;
  end;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dbgrid1.SelectedRows.Count>1 then
 begin
   n1.Enabled:=true;
   n2.Enabled:=true;
   n3.Enabled:=false;
   n4.Enabled:=false;
   n5.Enabled:=false;
 end
 else
 begin
  if dbgrid1.SelectedRows.Count=0 then
  dbgrid1.SelectedRows.CurrentRowSelected:=true;
 if self.ADO457.IsEmpty then
 begin
  n1.Enabled:=false;
  n2.Enabled:=false;
  n3.Enabled:=false;
  n4.Enabled:=false;
  n5.Enabled:=false;
 end
 else
  begin
  n1.Enabled:=true;
  n2.Enabled:=true;
  n3.Enabled:=true;
  n4.Enabled:=true;
  n5.Enabled:=true;
   case
   self.ADO457STATUS.Value of
   0 : n2.Enabled:=false;
   1 : n1.Enabled:=false;
   end;
  end;
 end;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 self.ADO457.Close;
 self.ADO457.Parameters[3].Value:=self.dtpk1.Date;
 self.ADO457.Parameters[4].Value:=self.DTPk2.Date+1;
 self.ADO457.Open;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if (self.ADO457ttype.Value=1) or (self.ADO457ttype.Value=2)or
   (self.ADO457ttype.Value=3) or (self.ADO457ttype.Value=4) then
 begin
  try
   form_forpro:=tform_forpro.Create(application);
   dm.ADOC457.Close;
   dm.ADOC457.Parameters[0].Value:=self.ADO457RKEY.Value;
   dm.ADOC457.Open;
   dm.ADOC207.Close;
   dm.ADOC207.Parameters[0].Value:=self.ADO457RKEY.Value;
   dm.ADOC207.Open;
   form_forpro.Edit1.Text:=dm.ADOC457GON_NUMBER.Value;
   form_forpro.Edit2.Text:=dm.ADOC457EMPLOYEE_NAME.Value;
   form_forpro.Edit3.Text:=dm.ADOC457CREATE_DATE.AsString;
   form_forpro.Edit4.Text:=dm.ADOC457ABBR_NAME.AsString;
   form_forpro.Edit5.Text:=dm.ADOC457DEPT_NAME.Value;
   form_forpro.Edit6.Text:=DM.ADOC457v_type.Value;
   form_forpro.Edit7.Text:=dm.ADOC457v_status.Value;
   form_forpro.Edit8.Text:=dm.ADOC457ref_number.Value;
   form_forpro.Edit9.Text:=dm.ADOC457v_emp.Value;
   form_forpro.ShowModal;
  finally
   form_forpro.Free;
  end;
 end
else
  begin
  try
   form_nopro:=tform_nopro.Create(application);
   dm.ADOC457.Close;
   dm.ADOC457.Parameters[0].Value:=self.ADO457RKEY.Value;
   dm.ADOC457.Open;
   dm.ADOC208.Close;
   dm.ADOC208.Parameters[0].Value:=self.ADO457RKEY.Value;
   dm.ADOC208.Open;
   form_nopro.Edit1.Text:=dm.ADOC457GON_NUMBER.Value;
   form_nopro.Edit2.Text:=dm.ADOC457EMPLOYEE_NAME.Value;
   form_nopro.Edit3.Text:=dm.ADOC457CREATE_DATE.AsString;
   form_nopro.Edit4.Text:=dm.ADOC457ABBR_NAME.AsString;
   form_nopro.Edit5.Text:=dm.ADOC457DEPT_NAME.Value;
   form_nopro.Edit6.Text:=DM.ADOC457v_type.Value;
   form_nopro.Edit7.Text:=dm.ADOC457v_status.Value;
   form_nopro.Edit8.Text:=dm.ADOC457ref_number.Value;
   form_nopro.Edit9.Text:=dm.ADOC457v_emp.Value;
   form_nopro.ShowModal;
  finally
   form_nopro.Free;
  end;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 self.ADO457.Close;
 self.ADO457.Open;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
  self.ADO457.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
 self.ADO457.filter := '';
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (column.FieldName<>self.ADO457.IndexFieldNames) then
 self.ADO457.IndexFieldNames:=column.FieldName;

if (field_name<>column.FieldName)and (column.ReadOnly) then
 begin
  label1.Caption:=column.Title.Caption;
  self.field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;

end;


procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth) to high(v_colwidth) do
 dbgrid1.Columns[i].Width:=v_colwidth[i]+
  round((dbgrid1.Width-dbgrid2_coltotal)*v_colwidth[i]/(dbgrid2_coltotal-28));
{for i:=low(v_colwidth1) to high(v_colwidth1) do
 dbgrid2.Columns[i].Width:=v_colwidth1[i]+
  round((dbgrid2.Width-dbgrid2_coltotal)*v_colwidth1[i]/(dbgrid2_coltotal-28));
for i:=low(v_colwidth2) to high(v_colwidth2) do
 dbgrid3.Columns[i].Width:=v_colwidth2[i]+
  round((dbgrid3.Width-dbgrid2_coltotal)*v_colwidth2[i]/(dbgrid2_coltotal-28));}
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  ADO457.Close;
 if ComboBox1.ItemIndex=0 then
   ADO457.CommandText:=FsSQL
  else
   ADO457.CommandText:=FsSQL+' and data0015.abbr_name='''+ComboBox1.Text+'''';
 ADO457.Open;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in  Shift) and (key=86)  then
   showmessage(ADO457.CommandText);
end;

end.
