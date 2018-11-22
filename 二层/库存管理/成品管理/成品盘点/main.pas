unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DBGrids, 
  Menus,ComObj,ExtCtrls,DateUtils, Grids;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
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
    N12: TMenuItem;
    N11: TMenuItem;
    N19: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    N10: TMenuItem;
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure find_partloc();
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
    v_colwidth: array[0..5] of integer;
    server_date : string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);   
  public
    { Public declarations }
    rkey05:integer;
    employee_name:string;
  end;

var
  Form1: TForm1;

implementation
uses damo, addedit_phycount, phy_counts, about_box,
  report_form1, report_form2,common;
{$R *.dfm}

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

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADO214.IsEmpty then
  begin
   n2.Enabled:=false;
   n3.Enabled:=false;
   n4.Enabled:=false;
   n6.Enabled:=false;
   n7.Enabled:=false;
   n12.Enabled:=false;
   n9.Enabled:=false;
   n11.Enabled:=false;
   n10.Enabled:=false;
   n19.Enabled:=false;
  end
 else
  begin
    n3.Enabled:=true;
    n12.Enabled:=true;
    n11.Enabled:=true;
    n10.Enabled:=true;
    n19.Enabled:=true;
   if dm.ADO214STATUS.Value='0' then
    begin
     n2.Enabled:=true;
     n4.Enabled:=true;
     n6.Enabled:=true;
     n7.Enabled:=true;
     n9.Enabled:=true;
   end
   else
    begin
     n2.Enabled:=false;
     n4.Enabled:=false;
     n6.Enabled:=false;
     n7.Enabled:=false;
     n9.Enabled:=false;
    end;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
 try
  form2:=tform2.Create(application);

  if form2.ShowModal=mrok then
   begin
    dm.ADO214.Close;
    dm.ADO214.open;
    dm.ADO215.Close;
    dm.aq53.Close;
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.find_partloc();
begin
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select code,location from data0016');
    sql.Add('where rkey='+dm.ADO214BEG_LOCCODE_PTR.AsString);
    open;
    form2.Edit2.Text:=fieldvalues['code'];
    form2.Label6.Caption:=fieldvalues['location'];
   end;
  with dm.ADOQuery1 do
   begin
    close;
    sql.Clear;
    sql.Add('select code,location from data0016');
    sql.Add('where rkey='+dm.ADO214END_LOCCODE_PTR.AsString);
    open;
    form2.Edit3.Text:=fieldvalues['code'];
    form2.Label7.Caption:=fieldvalues['location'];
   end;
  if dm.ADO214BEG_CUSTPART_PTR.Value>0 then
   begin
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select manu_part_number,manu_part_desc,');
      sql.Add('cust_code,customer_name from data0025 inner join data0010');
      sql.Add('on data0025.customer_ptr=data0010.rkey');
      sql.Add('where data0025.rkey='+dm.ADO214BEG_CUSTPART_PTR.AsString);
      open;
      form2.Edit4.Text:=fieldvalues['cust_code'];
      form2.Edit5.Text:=fieldvalues['customer_name'];
      form2.Edit6.Text:=fieldvalues['manu_part_number'];
      form2.Edit7.Text:=fieldvalues['manu_part_desc'];
//      form2.Edit8.Text:=fieldvalues['cp_rev'];
     end;
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select manu_part_number,manu_part_desc,');
      sql.Add('cust_code,customer_name from data0025 inner join data0010');
      sql.Add('on data0025.customer_ptr=data0010.rkey');
      sql.Add('where data0025.rkey='+dm.ADO214end_CUSTPART_PTR.AsString);
      open;
      form2.Edit9.Text:=fieldvalues['cust_code'];
      form2.Edit10.Text:=fieldvalues['customer_name'];
      form2.Edit11.Text:=fieldvalues['manu_part_number'];
      form2.Edit12.Text:=fieldvalues['manu_part_desc'];
 //     form2.Edit13.Text:=fieldvalues['cp_rev'];
     end;
   end
  else
   begin
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select cust_code,customer_name from data0010');
      sql.Add('where data0010.rkey='+dm.ADO214BEG_CUST_PTR.AsString);
      open;
      form2.Edit4.Text:=fieldvalues['cust_code'];
      form2.Edit5.Text:=fieldvalues['customer_name'];
     end;
    with dm.ADOQuery1 do
     begin
      close;
      sql.Clear;
      sql.Add('select cust_code,customer_name from data0010');
      sql.Add('where data0010.rkey='+dm.ADO214end_CUST_PTR.AsString);
      open;
      form2.Edit9.Text:=fieldvalues['cust_code'];
      form2.Edit10.Text:=fieldvalues['customer_name'];
     end;
   end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
 try
  form2:=tform2.Create(application);
  form2.Edit14.Text:=dm.ADO214FG_COUNT_CODE.Value;
  form2.Edit14.Enabled:=false;
  form2.rkey15.Caption:=dm.ADO214WAREHOUSE_PTR.AsString;
  form2.Edit1.Text:=dm.ADO214warehouse_code.Value;
  form2.Edit1.Font.Color:=clwindowtext;
  form2.Label3.Caption:=dm.ADO214abbr_name.Value;
  form2.rkey16_1.Caption:=dm.ADO214BEG_LOCCODE_PTR.AsString;
  form2.rkey16_2.Caption:=dm.ADO214END_LOCCODE_PTR.AsString;
  form2.rkey10_1.Caption:=dm.ADO214BEG_CUST_PTR.AsString;
  form2.rkey10_2.Caption:=dm.ADO214END_CUST_PTR.AsString;
  form2.rkey50_1.Caption:=dm.ADO214BEG_CUSTPART_PTR.AsString;
  form2.rkey50_2.Caption:=dm.ADO214END_CUSTPART_PTR.AsString;
  find_partloc();
  if form2.ShowModal=mrok then
   begin
    dm.ADO214.Close;
    dm.ADO214.open;
    dm.ADO215.Close;
    dm.aq53.Close;
   end;
 finally
  form2.free;
 end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);
  form2.Edit14.Text:=dm.ADO214FG_COUNT_CODE.Value;
  form2.Edit14.Enabled:=false;
  form2.BitBtn1.Visible:=false;
  form2.BitBtn2.Left:=10;
  form2.Button1.Visible:=false;
  form2.Edit1.Text:=dm.ADO214warehouse_code.Value;
  form2.Edit1.Font.Color:=clwindowtext;
  form2.Label3.Caption:=dm.ADO214abbr_name.Value;
  form2.Edit1.Enabled:=false;
  form2.Edit2.Enabled:=false;
  form2.Edit3.Enabled:=false;
  form2.BitBtn3.Enabled:=false;
  form2.BitBtn4.Enabled:=false;
  form2.BitBtn5.Enabled:=false;
  find_partloc();
  form2.ShowModal;
 finally
  form2.free;
 end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
try
 form4:=tform4.Create(application);
 form4.ShowModal;
finally
 form4.free;
end;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
 if messagedlg('你确认要删除此盘点清单吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   with dm.ADOQuery1 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0214 where rkey='+dm.ADO214RKEY.AsString);
     open;
     delete;
     dm.ADO214.Close;
     dm.ADO214.Open;
    end;
  end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0);
  exit;
 end;
if messagedlg('你确认要用输入的数量替换系统原库存数量吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  dm.ADOConnection1.BeginTrans;
  try
   with dm.ADOQuery1 do
   begin                              //更新0113
    close;
    sql.clear;
    sql.Add('select * from data0113 where rkey is null');
    open;
   end;
   dm.ADOupdate1.close;          //更新用
   dm.ADOupdate1.Parameters[0].Value := dm.ADO214RKEY.Value;
   dm.ADOupdate1.open;
   dm.ADOdivergent.Close;         //打印差异报表时用
   dm.ADOdivergent.Parameters[0].Value := dm.ADO214RKEY.Value;
   dm.ADOdivergent.Open;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  while not dm.ADOupdate1.Eof do
  begin
   dm.ADOupdate1.Edit;
   dm.ADOupdate1status.Value := 2;     //215已更新
//   if dm.ADOupdate1qty_on_hand.Value = 0 then//更新53 (如是在盘点过程中直接入仓的)
//    dm.ADOupdate1quantity53.value := dm.ADOupdate1quantity.Value; //53=215(入库数量为零)
   if dm.ADOupdate1divergent.Value<>0 then
    begin
     dm.ADOupdate1qty_on_hand.Value := dm.ADOupdate1quantity.Value; //53库存现有数量
     with dm.ADOQuery1 do
     begin                              //更新0113
      append;
      fieldvalues['tran_type']:=3;      //代表盘点所形成的差异
      fieldvalues['dest_ptr'] := dm.ADOupdate1custpart_batch_ptr.Value;//53.rkey
      fieldvalues['CSI_USER_PTR'] := dm.ADOupdate1entered_by_user_ptr.value;
      fieldvalues['EMPL_PTR'] := dm.ADOupdate1entered_by_ptr.Value;
      fieldbyname('tdate').AsString := server_date;
      fieldvalues['quantity'] := dm.ADOupdate1divergent.Value;
      post;
     end;
     
     dm.ado25.Parameters.ParamValues['divergent']:=dm.ADOupdate1divergent.Value;
     dm.ado25.Parameters.ParamValues['custpart_ptr']:=dm.ADOupdate1custpart_ptr.Value;
     dm.ado25.Execute;                  //更新25当前总库存

    end;
   dm.ADOupdate1.Post;
   dm.ADOupdate1.Next;
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 with dm.ADOQuery2 do           //更新0215
  begin
   close;
   sql.Clear;
   sql.Add('select rkey from data0215 where status=0 and ');
   sql.Add('fg_list_ptr='+dm.ADO214RKEY.AsString);
   open;
  end;
 if dm.ADOQuery2.IsEmpty then
  begin
   dm.ADO214.Edit;
   dm.ADO214STATUS.Value:='1';
   dm.ADO214OVER_DATE.Value:=getsystem_date(dm.ADOQuery2,0);//更新完成时间
   dm.ADO214.Post;
  end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  dm.ADOConnection1.CommitTrans;
  dm.ADOQuery1.Close;
  dm.ADOupdate1.Close;
  showmessage('更新操作成功!');
 except
  dm.ADOConnection1.RollbackTrans;
  showmessage('对不起，数据更新遇到错误，更新操作没有成功!');
  exit;
 end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 try
  form_report1:=tform_report1.Create(application);

   Form_report1.ppReport1.Reset;
   Form_report1.ppReport1.Template.FileName :=
         StringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
         'fgphycount_divergent.rtm';
   Form_report1.ppReport1.Template.LoadFromFile;

  form_report1.ppReport1.PrintReport;
 finally
  form_report1.free;
  dm.ADOdivergent.Close;
 end;
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
end;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  dm.aq215.Close;
  dm.aq215.Parameters[1].Value:=dm.ADO214RKEY.Value;
  dm.aq215.Open;

  Form_report.ppReport1.Reset;
  Form_report.ppReport1.Template.FileName :=
       StringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'fgphycount_list.rtm';
  Form_report.ppReport1.Template.LoadFromFile;
  
  form_report.ppReport1.PrintReport;
 finally
  dm.aq215.Close;
  form_report.free;
 end;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
try
 form_report1:=tform_report1.Create(application);
 dm.ADOdivergent.Close;
 dm.ADOdivergent.Parameters[0].Value:=dm.ADO214RKEY.Value;
 dm.ADOdivergent.Open;

 Form_report1.ppReport1.Reset;
 Form_report1.ppReport1.Template.FileName :=
       StringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'fgphycount_divergent.rtm';
 Form_report1.ppReport1.Template.LoadFromFile;
  
 form_report1.ppReport1.PrintReport;
 
finally
 form_report1.free;
 dm.ADOdivergent.Close;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
 if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序启动失败,请与管理员联系!',1);
  application.Terminate;
 end;
 self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;

end;

procedure TForm1.FormShow(Sender: TObject);
var
 I:byte;
begin
if dm.ADOConnection1.Connected then
 begin

  with dm.ADOQuery2 do  //读取系统时间
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;                       //短日期格式
    server_date := datetostr(fieldvalues['v_dt']);
    dtpk2.Date:= dateof(fieldvalues['v_dt']);
    dtpk1.Date:= dtpk2.Date-dayof(dtpk2.Date)+1;
   end;
  dtpk1Exit(sender);
  with dm.ADOQuery1 do //查找出系统当前用户名及员工指针
  begin
   close;
   sql.Clear;
   sql.Add('select data0073.employee_ptr,data0005.employee_name from data0005,data0073');
   sql.Add('where data0073.employee_ptr=data0005.rkey and');
   sql.Add('data0073.rkey='+rkey73);
   open;
   rkey05 := fieldvalues['employee_ptr'];
   employee_name := fieldvalues['employee_name'];
  end;

 end;
 for i:=0 to 5 do
  self.v_colwidth[i]:=dbgrid1.Columns[i].Width;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 I:byte;
begin
for i:=0 to 5 do
  dbgrid1.Columns[i].Width:=v_colwidth[i]+round((dbgrid1.Width-678)*v_colwidth[i]/654);
end;

procedure TForm1.N11Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
   dm.ADOQuery3.Open;
   if dm.ADOQuery3.IsEmpty then exit;
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

 XLApp.WorkBooks[1].WorkSheets[1].Name := '盘点代码'+dm.ADO214FG_COUNT_CODE.Value;
 Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];

 for iCount := 0 to dm.ADOQuery3.FieldCount-2 do
  Sheet.Cells[1, iCount + 1 ] :=dm.ADOQuery3.Fields[icount].DisplayLabel;

   for jcount :=1 to dm.ADOQuery3.RecordCount do
    begin
     for iCount := 0 to dm.ADOQuery3.FieldCount-2 do
      Sheet.Cells[jCount + 1, iCount + 1] := dm.ADOQuery3.Fields[icount].AsString;
     dm.ADOQuery3.Next;
    end;
   XlApp.Visible := True;
   Screen.Cursor := crDefault;
  dm.ADOQuery3.Close; 
end;


procedure TForm1.N19Click(Sender: TObject);
 var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;

 begin
    dm.ADOdivergent.Close;
    dm.ADOdivergent.Parameters[0].Value:=dm.ADO214RKEY.Value;
    dm.ADOdivergent.Open;
    if dm.ADOdivergent.IsEmpty then exit;

    Screen.Cursor := crHourglass;

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

 XLApp.WorkBooks[1].WorkSheets[1].Name := dm.ADO214FG_COUNT_CODE.Value+'数量差异';
 Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];

 for iCount := 0 to dm.ADOdivergent.FieldCount-2 do
  Sheet.Cells[1, iCount + 1 ] :=dm.ADOdivergent.Fields[icount].DisplayLabel;

   for jcount :=1 to dm.ADOdivergent.RecordCount do
    begin
     for iCount := 0 to dm.ADOdivergent.FieldCount-2 do
      Sheet.Cells[jCount + 1, iCount + 1] := dm.ADOdivergent.Fields[icount].AsString;
     dm.ADOdivergent.Next;
    end;
   XlApp.Visible := True;
    Screen.Cursor := crDefault;
    dm.ADOdivergent.Close;
{    // create the Excel object
     ExcelApp := CreateOleObject('Excel.Application');
     ExcelApp.WorkBooks.Add(xlWBatWorkSheet);
     ExcelApp.WorkBooks[1].WorkSheets[1].Name := Caption;

    // First we send the data to a memo
    // works faster than doing it directly to Excel
    mem := TStringList.Create;
    sline := '';

    // add the info for the column names
    for col := 0 to dm.ADOdivergent.FieldCount-1 do
      sline := sline + dm.ADOdivergent.Fields[col].DisplayLabel + #9;
    mem.Add(sline);

    // get the data into the memo
    for row := 0 to dm.ADOdivergent.RecordCount-1 do
    begin
      sline := '';
      for col := 0 to dm.ADOdivergent.FieldCount-1 do
        sline := sline + dm.ADOdivergent.Fields[col].AsString + #9;
      mem.Add(sline);
      dm.ADOdivergent.Next;
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
}

  end;


procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 try
  form_report:=tform_report.Create(application);
  Form_report.ppReport1.Reset;
  Form_report.ppReport1.Template.FileName :=
       StringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'fgphycount_list.rtm';
  Form_report.ppReport1.Template.LoadFromFile;
  Form_report.ppReport1.SaveAsTemplate:=True;
  form_report.ppDesigner1.ShowModal;

//  form13.ppReport1.Template.FileName :=
//      stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
 //       'much_Asoreport.rtm';

 finally
  
  form_report.free;
 end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
try                                              //盘点差异报表定义
 form_report1:=tform_report1.Create(application);
 Form_report1.ppReport1.Reset;
 Form_report1.ppReport1.Template.FileName :=
       StringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
       'fgphycount_divergent.rtm';
 Form_report1.ppReport1.Template.LoadFromFile;
 Form_report1.ppReport1.SaveAsTemplate:=True;
 form_report1.ppDesigner1.ShowModal;
finally
 form_report1.free;
 dm.ADOdivergent.Close;
end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
try
 aboutbox:=taboutbox.Create(application);
 aboutbox.ShowModal;
finally
 aboutbox.free;
end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
dm.ADO214.Close;
if checkbox1.Checked then
 dm.ADO214.Parameters.ParamValues['v1']:=9
else
 dm.ADO214.Parameters.ParamValues['v1']:=0;
if checkbox2.Checked then
 dm.ADO214.Parameters.ParamValues['v2']:=9
else
 dm.ADO214.Parameters.ParamValues['v2']:=1;
dm.ADO214.Open;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 dm.ADO214.Close;
 dm.ADO214.Parameters.ParamValues['dtpk1']:=dtpk1.Date;
 dm.ADO214.Parameters.ParamValues['dtpk2']:=dtpk2.Date+1;
 dm.ADO214.Open;
end;

procedure TForm1.N10Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin

 dm.ADOQuery1.Close;
 dm.ADOQuery1.SQL.Text:=
  'SELECT     TOP (100) PERCENT dbo.Data0025.MANU_PART_NUMBER AS 本厂编号,'+#13+
  'dbo.Data0025.MANU_PART_DESC AS 客户型号,'+#13+
  'dbo.Data0008.PRODUCT_NAME AS 产品类型, dbo.Data0010.ABBR_NAME AS 客户简称,'+#13+
  'SUM(dbo.Data0215.old_quantity) AS 系统库存,'+#13+
  'SUM(dbo.Data0215.QUANTITY) AS 盘点库存,'+#13+
  'SUM(dbo.Data0215.QUANTITY * dbo.Data0025.unit_sq) AS 盘点面积'+#13+
'FROM         dbo.Data0215 INNER JOIN'+#13+
  'dbo.Data0025 ON dbo.Data0215.CUSTPART_PTR = dbo.Data0025.RKEY INNER JOIN'+#13+
  'dbo.Data0010 ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY INNER JOIN'+#13+
  'dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY'+#13+
'WHERE     (dbo.Data0215.FG_LIST_PTR = '+dm.ADO214RKEY.AsString+')'+#13+
'GROUP BY dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC,'+#13+
'dbo.Data0008.PRODUCT_NAME, dbo.Data0010.ABBR_NAME'+#13+
'ORDER BY 本厂编号';

 dm.ADOQuery1.Prepared;
 dm.ADOQuery1.Open;
 if dm.ADOQuery1.IsEmpty then exit;

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

 XLApp.WorkBooks[1].WorkSheets[1].Name := '盘点清单汇总表_'+dm.ADO214FG_COUNT_CODE.Value;
 Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];

 for iCount := 0 to dm.ADOQuery1.FieldCount-1 do
  Sheet.Cells[1, iCount + 1 ] :=dm.ADOQuery1.Fields[icount].DisplayLabel;
 for jcount :=1 to dm.ADOQuery1.RecordCount do
  begin
    for iCount := 0 to dm.ADOQuery1.FieldCount-1 do
     Sheet.Cells[jCount + 1, iCount + 1] := dm.ADOQuery1.Fields[icount].AsString;
    dm.ADOQuery1.Next;
  end;
   XlApp.Visible := True;
   Screen.Cursor := crDefault;
  dm.ADOQuery1.Close;
 
end;



end.
