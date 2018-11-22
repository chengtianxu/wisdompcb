unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Menus,ComObj,Chart,Excel2000,ClipBrd,
  ComCtrls,DB,DateUtils;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    vprev: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label3: TLabel;
    PopupMenu2: TPopupMenu;
    N18: TMenuItem;
    N19: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure find_partloc();
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure dtpk1Change(Sender: TObject);
  private

   v_colwidth: array[0..3] of integer;
   server_date :string ;
     OldGridWnd : TWndMethod;
   precolumn:TColumn;
   procedure NewGridWnd(var Message : TMessage);
    { Private declarations }
  public
    rkey05:integer;
  //  employee_name:string;
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation
uses damo,count_add,count_pro_search,common,
count_search,count_input,reporter_form1,reporter_form2;

{$R *.dfm}
procedure tform1.NewGridWnd(var message:tmessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1);
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.FormShow(Sender: TObject);
var i:byte;
begin
if dm.ADOConnection1.Connected then
begin
  precolumn:=DBGrid1.Columns[0];
  Label1.Caption:=precolumn.Title.Caption;

  vprev.Caption:=common.vprev;


  with dm.ADOQuery1 do  //读取系统时间
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;                       //短日期格式
    dtpk2.Date:=FieldValues['v_dt'];
    dtpk1.Date:= StrToDate(FormatDateTime('yyyy-mm-dd',StartOfTheMonth(dtpk2.Date))) ;
    server_date := datetostr(fieldvalues['v_dt']);
   end;
   dm.ADO0214.Close;
   dm.ado0214.Parameters.ParamByName('date1').Value:= dtpk1.Date;
   dm.ado0214.Parameters.ParamByName('date2').Value:= IncDay(dtpk2.Date,1);
   dm.ADO0214.Open;
   dm.ado0214.Sort:= 'FG_COUNT_CODE';
  //=================获取系统用户和以及指针=====================
   with dm.ADOQuery1 do //查找出系统当前用户名及员工指针
  begin
   close;
   sql.Clear;
   sql.Add('select data0073.employee_ptr,data0005.employee_name from data0005,data0073');
   sql.Add('where data0073.employee_ptr=data0005.rkey and');
   sql.Add('data0073.rkey='+rkey73);
   open;
   rkey05 := fieldvalues['employee_ptr'];
  // employee_name := fieldvalues['employee_name'];
  end;

 //================定义各个单元格的宽===================
  for i:=0 to 3 do
  v_colwidth[i]:=dbgrid1.Columns[i].Width;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
if not app_init_2(dm.ADOConnection1) then
  begin
   ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
   application.Terminate;
  end;
 self.Caption:=application.Title;

{
 rkey73:='1';
 common.vprev:='4';
}
 DateSeparator := '-';
 ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
try
 form_add:=tform_add.Create(application);
 form_add.Edit8.Text:=server_date;
 if form_add.ShowModal=mrok then
 begin
  dm.ado0214.Close;
  dm.ado0214.Open;
 end;
finally
 form_add.Free;
end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
try
 form_add:=tform_add.Create(application);
 form_add.Edit1.Text:=dm.ado0214FG_COUNT_CODE.AsString;
 form_add.Edit1.Enabled:=false;
 form_add.Edit8.text:=server_date;
 form_add.rkey16_1.Caption:=dm.ado0214BEG_LOCCODE_PTR.AsString;
 form_add.rkey16_2.Caption:=dm.ado0214END_LOCCODE_PTR.AsString;
 form_add.rkey07_1.Caption:=dm.ADO0214BEG_CUSTPART_PTR.AsString;
 form_add.rkey07_2.Caption:=dm.ADO0214END_CUSTPART_PTR.AsString;
 find_partloc();
 if form_add.ShowModal=mrok then
  begin
    dm.ADO0214.Close;
    dm.ADO0214.open;
  end;
 finally
  form_add.free;
 end;
end;
procedure TForm1.find_partloc();
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select code,location from data0016');
    sql.Add('where rkey='+dm.ADO0214BEG_LOCCODE_PTR.AsString);
    open;
    form_add.Edit2.Text:=fieldvalues['code'];
    form_add.Label8.Caption:=fieldvalues['location'];
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select code,location from data0016');
    sql.Add('where rkey='+dm.ADO0214END_LOCCODE_PTR.AsString);
    open;
    form_add.Edit3.Text:=fieldvalues['code'];
    form_add.Label9.Caption:=fieldvalues['location'];
   end;
  if dm.ADO0214BEG_CUSTPART_PTR.Value>0 then
   begin
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select PR_GRP_CODE,PRODUCT_GROUP_NAME,RKEY');
      SQL.Add('from data0007') ;
      sql.Add('where rkey='+dm.ado0214BEG_CUSTPART_PTR.AsString);
      open;
      form_add.Edit4.Text:=fieldvalues['PR_GRP_CODE'];
      form_add.Edit5.Text:=fieldvalues['PRODUCT_GROUP_NAME'];
      form_add.rkey07_1.Caption:=fieldbyname('rkey').AsString;
     end;
   end;
    if dm.ADO0214END_CUSTPART_PTR.Value>0 then
   begin
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
     sql.Add('select PR_GRP_CODE,PRODUCT_GROUP_NAME,RKEY');
     SQL.Add('from data0007') ;
     sql.Add('where rkey='+dm.ado0214END_CUSTPART_PTR.AsString);
     open;
      form_add.Edit6.Text:=fieldvalues['PR_GRP_CODE'];
      form_add.Edit7.Text:=fieldvalues['PRODUCT_GROUP_NAME'];
      form_add.rkey07_2.Caption:=fieldbyname('rkey').AsString;
     end;
   end ;
end;
procedure TForm1.N3Click(Sender: TObject);
begin
 try
  form_add:=tform_add.Create(application);
  form_add.Edit1.Text:=dm.ado0214FG_COUNT_CODE.AsString;
  form_add.Edit8.Text:=server_date;
  form_add.rkey16_1.Caption:=dm.ado0214BEG_LOCCODE_PTR.AsString;
  form_add.rkey16_2.Caption:=dm.ado0214END_LOCCODE_PTR.AsString;
  form_add.rkey07_1.Caption:=dm.ADO0214BEG_CUSTPART_PTR.AsString;
  form_add.rkey07_2.Caption:=dm.ADO0214END_CUSTPART_PTR.AsString;
  form_add.Edit1.Enabled:=false;
  form_add.Edit2.Enabled:=false;
  form_add.Edit3.Enabled:=false;
  form_add.Edit4.Enabled:=false;
  form_add.Edit5.Enabled:=false;
  form_add.Edit6.Enabled:=false;
  form_add.Edit7.Enabled:=false;
  form_add.BitBtn1.Enabled:=false;
  form_add.Edit8.Enabled:=false;
  form_add.BitBtn3.Enabled:=false;
  form_add.BitBtn4.Enabled:=false;
  form_add.BitBtn5.Enabled:=false;
  form_add.BitBtn6.Enabled:=false;
  find_partloc();
  form_add.ShowModal;
 finally
  form_add.free;
 end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
 if messagedlg('你确认要删除此盘点清单吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0214 where rkey='+dm.ADO0214RKEY.AsString);
     open;
     if not IsEmpty then delete;
     dm.ADO0214.Close;
     dm.ADO0214.Open;
    end;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
 try
  form_input:=tform_input.Create(application);
  form_input.Showmodal ;
 finally
  form_input.Free;
 end;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
begin
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0);
 exit;
end;
//=============================判断是否输入了盘点数据=================================
 with dm.ADOData0215 do
 begin
  close;
  dm.ADOData0215.Parameters[0].Value:=dm.ado0214RKEY.Value;
  open;
 end;
 while not dm.ADOData0215.Eof do
 begin
 if dm.ADOData0215.FieldByName('quantity').Value<0 then
 begin
  messagedlg('您还没有输入产成品盘点数量,请先输入盘点数量!',mtinformation,[mbok],0);
  exit;
 end;
 dm.ADOData0215.Next;
 end;

if messagedlg('你确认要用输入的数量替换系统原库存数量吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
 try
//================================更新表Data0113===========================
 with dm.ADOQuery1 do
  begin
  close;
  sql.Clear;
  sql.Add('select * from data0215');
  sql.Add('where (status=1) and fg_list_ptr='+dm.ado0214RKEY.AsString);
  open;
 end;
   dm.ADO0113.CLOSE;
   dm.ADO0113.Parameters[0].Value:= dm.ado0214RKEY.Value;
   dm.ADO0113.Open;
  while not dm.ADOQuery1.Eof do
  begin
   if dm.ADOQuery1.FieldValues['quantity']<>dm.ADOQuery1.FieldValues['old_quantity'] then
   with dm.ADO0113 do
   begin
    append;
    dm.ADO0113.FieldByName('tran_type').AsInteger:=3;
    dm.ADO0113.FieldByName('srce_ptr').Value:=dm.ado0214RKEY.Value;
    dm.ADO0113.FieldByName('dest_ptr').AsInteger:=dm.ADOQuery1.FieldValues['rkey'];
    dm.ADO0113.FieldByName('EMPL_PTR').AsInteger:=self.rkey05;
    dm.ADO0113.FieldByName('CSI_USER_PTR').AsInteger:=strtoint(rkey73);
    dm.ADO0113.FieldByName('tdate').Value:=dm.ado0214DATE_CREATED.Value;
    dm.ADO0113.FieldByName('quantity').Value:=(dm.ADOQuery1.FieldValues['quantity']-dm.ADOQuery1.FieldValues['old_quantity']);
    post;
   end;
   dm.ADOQuery1.Next;
  end;

//=============================更新Data0215表=====================================
 with dm.ADOData0215 do
 begin
  close;
  dm.ADOData0215.Parameters[0].Value:=dm.ado0214RKEY.Value;
  open;
 end;
 if (not dm.ADOData0215.IsEmpty )then dm.ADOData0215.First;
 while not dm.ADOData0215.Eof do
 begin
  dm.ADOData0215.Edit;
  dm.ADOData0215.FieldByName('status').Value:=2;
  dm.ADOData0215.Post;
  dm.ADOData0215.Next;
  end;
//=========================更新Data0214表========================================
 with dm.ado0214 do
 begin
  edit;
  dm.ado0214STATUS.Value:=1;
  post;
  close;
  open;
 end;
 dm.ADOConnection1.CommitTrans;
  messagedlg('数据已经成功提交！',mtinformation,[mbok],0);
 except

  on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
  end;

 end;
 end;
end;

procedure TForm1.N10Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
  dm.checkout.Close;
  dm.checkout.Parameters[0].Value:=dm.ado0214RKEY.Value;
  dm.checkout.Open;
  if dm.checkout.IsEmpty then
  begin
  messagedlg('没有数据可以被导出，请检查是否输入盘点数据！',mtinformation,[mbok],0);
  exit;
  end;
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
 XLApp.SheetsInNewWorkbook := 1;

 XLApp.WorkBooks[1].WorkSheets[1].Name := '盘点代码'+dm.ADO0214FG_COUNT_CODE.Value;
 Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];

 for iCount := 0 to dm.checkout.FieldCount-3 do
  Sheet.Cells[1, iCount + 1 ] :=dm.checkout.Fields[icount].DisplayLabel;

   for jcount :=1 to dm.checkout.RecordCount do
    begin
     for iCount := 0 to dm.checkout.FieldCount-3 do
      Sheet.Cells[jCount + 1, iCount + 1] := dm.checkout.Fields[icount].AsString;
     dm.checkout.Next;
    end;
   XlApp.Visible := True;
   Screen.Cursor := crDefault;
  dm.checkout.Close;
end;

procedure TForm1.N11Click(Sender: TObject);
var
   col, row: Integer;
   sline: String;
   mem: TStringList;
   ExcelApp: Variant;
 begin
    dm.difference.Close;
    dm.difference.Parameters[0].Value:=dm.ADO0214RKEY.Value;
    dm.difference.Open;
    if dm.difference.IsEmpty then
    begin
    messagedlg('没有数据可以被导出,请检查是否已输入盘点数据！',mtinformation,[mbok],0);
    exit;
    end;
    Screen.Cursor := crHourglass;
    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to dm.difference.FieldCount-1 do
      sline := sline + dm.difference.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to dm.difference.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to dm.difference.FieldCount-1 do
        sline := sline + dm.difference.Fields[col].AsString + #9;
      mem.Add(sline);
      dm.difference.Next;
    end;

    // we copy the data to the clipboard
    clipboard.Clear;
    Clipboard.AsText:=mem.Text;

    // if needed, send it to Excel
    // if not, we already have it in the clipboard
    ExcelApp.Workbooks[1].WorkSheets[Caption].Paste;
    ExcelApp.Visible := true;
    mem.Free;
    clipboard.Clear;
  //  FreeAndNil(ExcelApp);
    Screen.Cursor := crDefault;
    dm.difference.Close;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  rkey:Integer;
begin
  rkey:=dm.ado0214RKEY.Value;
  dm.ado0214.close;
  dm.ado0214.Open;
  if rkey>0 then
    dm.ado0214.Locate('rkey',rkey,[]);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADO0214.IsEmpty then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
   n6.Enabled:=false;
   n8.Enabled:=false;
   n10.Enabled:=false;
   n11.Enabled:=false;
   n12.Enabled:=false;
   n13.Enabled:=false;
  end
 else
  begin
    n3.Enabled:=true;
    n10.Enabled:=true;
    n11.Enabled:=true;
    n12.Enabled:=true;
    n13.Enabled:=true;
   if dm.ADO0214STATUS.AsInteger=0 then
    begin
     n2.Enabled:=true;
     n4.Enabled:=true;
     n6.Enabled:=true;
     n8.Enabled:=true;
     n9.Enabled:=true;
   end
   else
    begin
     n2.Enabled:=false;
     n4.Enabled:=false;
     n6.Enabled:=false;
     n8.Enabled:=false;
     n9.Enabled:=false;
    end;
  end;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
 try
  Form_reporter1:= tForm_reporter1.Create(application);
  dm.checkout.Close;
  dm.checkout.Parameters[0].Value:=dm.ado0214RKEY.Value;
  dm.checkout.Open;
  dm.ADO493.Open;
  if dm.checkout.IsEmpty then
   begin
    messagedlg('没有数据可以被打印！',mtinformation,[mbok],0);
    exit;
   end; 
   Form_reporter1.ppReport1.PrintReport;
   finally
    dm.checkout.Close;
    dm.ADO493.Close;
     Form_reporter1.Free;
  end;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  try
  Form_reporter2:= tForm_reporter2.Create(application);
  dm.difference.Close;
  dm.difference.Parameters[0].Value:=dm.ado0214RKEY.Value;
  dm.difference.Open;
  dm.ADO493.Open;
  if dm.difference.IsEmpty then
  begin
   messagedlg('没有数据可以被打印，请检查是否已输入盘点数据！',mtinformation,[mbok],0);
   exit;
   end;
   Form_reporter2.ppReport1.PrintReport;
   finally
    dm.difference.Close;
    dm.ADO493.Close;
   Form_reporter2.Free;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
var i:byte;
begin
 for i:=0 to 1 do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-684)*v_colwidth[i]/300);
end;

procedure TForm1.N15Click(Sender: TObject);
begin
if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
 try
  form_reporter1:=tform_reporter1.Create(application);
  form_reporter1.ppDesigner1.ShowModal;
 finally
  form_reporter1.free;
 end;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
 if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
try
 form_reporter2:=tform_reporter2.Create(application);
 form_reporter2.ppDesigner1.ShowModal;
finally
 form_reporter2.free;
end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
   PopupMenu2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TForm1.N18Click(Sender: TObject);
begin
  if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
   messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
  else
   try
    form_reporter1:=tform_reporter1.Create(application);
    form_reporter1.ppDesigner1.ShowModal;
   finally
    form_reporter1.free;
   end;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
   if (strtoint(vprev.Caption)=1) or (strtoint(vprev.Caption)=3) then
   messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
  else
  try
   form_reporter2:=tform_reporter2.Create(application);
   form_reporter2.ppDesigner1.ShowModal;
  finally
   form_reporter2.free;
  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.DBGrid1TitleClick(Column: TColumn);
begin
  if (Column.Title.Caption <> preColumn.Title.Caption)
      and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Label1.Caption:= Column.Title.Caption;
    Column.Title.Color:= clRed;
    precolumn.Title.Color:= clBtnFace;
    Edit1.SetFocus;
    preColumn:=Column;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if Edit1.Text<>'' then
  begin
    dm.ado0214.Filtered:=False;
    dm.ado0214.Filter:= precolumn.FieldName + ' like ''%' + Trim(Edit1.Text)+ '%''' ;
    dm.ado0214.Filtered:= True;
  end
  else
    dm.ado0214.Filter:='';
end;

procedure TForm1.dtpk1Change(Sender: TObject);
begin
  with dm.ado0214 do
  begin
    Close;
    Parameters[0].Value:=dtpk1.Date;
    Parameters[1].Value:=IncDay(dtpk2.Date,1);
    Open;
    Sort:= 'FG_COUNT_CODE';
  end;
end;

end.
