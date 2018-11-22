unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Menus, ComCtrls, StdCtrls,ComObj,Excel2000,
  Buttons, ExtCtrls,DateUtils,db;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    N1: TMenuItem;
    procedure N5Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
   grid_colwith:integer;
   v_colwidth1: array of integer;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd(var Message: TMessage);
   function return_rkey15(rkey06:integer):Integer;
  public
    { Public declarations }
    v_employee,rej_ptr:integer;
    v_date:tdatetime;
    employee_name,mrb_no,REJECT_DESC:string;
  end;

var
  Form1: TForm1;

implementation

uses demo, wip_code, put_wip, form_report, divergent, help,
wip_divergent,common;

{$R *.dfm}
procedure tform1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);
  if form2.ShowModal=mrok then
   begin
    dm.ADP400.Close;
    dm.ADP400.Open;
   end
 finally
  form2.Free;
 end;
end;

function TForm1.return_rkey15(rkey06: integer): Integer;
begin
 DM.ADOQuery2.Close;
 dm.ADOQuery2.SQL.Text :='select WHOUSE_PTR from data0006 where rkey='+inttostr(rkey06);
 dm.ADOQuery2.Open;
 if not dm.ADOQuery2.IsEmpty then
 Result:=dm.ADOQuery2.fieldbyname('WHOUSE_PTR').AsInteger
 else
 Result:=1;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 messagedlg('对不起,您只有本程序的只读权限!',mtinformation,[mbok],0)
else
 if messagedlg('你确认要删除此盘点清单吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
  begin
   dm.ado402.close;    //临时记录被删除的在线工单
   dm.ado402.Parameters[0].Value := dm.ADP400rkey.Value;
   dm.ADO402.Open;
   while not dm.ADO402.Eof do
    begin
     dm.adoquery1.close;
     dm.ADOQuery1.Parameters[0].Value := null;
     dm.ADOQuery1.Open;
     dm.ADOQuery1.Append; //增加在线工单data0056
     dm.ADOQuery1WO_PTR.Value := dm.ADO402wo_ptr.Value;
     dm.ADOQuery1DEPT_PTR.Value := dm.ADO402dept_ptr.Value;
     dm.ADOQuery1FLOW_NO.Value := 0;
     dm.ADOQuery1STEP.Value := dm.ADO402step.Value;
     dm.ADOQuery1EMPLOYEE_PTR.Value := form1.v_employee;
     dm.ADOQuery1QTY_BACKLOG.Value := dm.ADO402system_quan.Value;
     dm.ADOQuery1INTIME.Value := form1.v_date;//接收日日期
     dm.ADOQuery1PANELS.Value := dm.ADO402panels.Value; //新增字段 0529
     dm.ADOQuery1TO_BE_STOCKED.Value := 0;
     dm.ADOQuery1TDATE.Value:=common.getsystem_date(dm.ADOQuery2,0); //系统日期
     dm.ADOQuery1LOC_PTR.Value:=return_rkey15(dm.ADO402wo_ptr.Value); //在线工厂
     dm.ADOQuery1.Post;
     dm.ADO402.Next;
    end;
   with dm.ADOQuery2 do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0400 where rkey='+dm.ADP400rkey.AsString);
     open;
     delete;
     dm.Adp400.Close;
     dm.ADp400.Open;
    end;
  end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 try
  form2:=tform2.Create(application);
  form2.Edit1.Text:=dm.ADP400wip_code.Value;
  form2.Edit3.Text:=dm.ADP400serial_no.Value;
  form2.Edit2.Text:=dm.ADP400WAREHOUSE_CODE.Value;
  form2.Label4.Caption:=dm.ADP400WAREHOUSE_NAME.Value;
  form2.Edit1.Enabled:=false;
  if form2.ShowModal=mrok then
   begin
    dm.ADP400.Close;
    dm.ADP400.Open;
   end
 finally
  form2.Free;
 end;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
 rej_ptr:=0;
 with dm.ADOQuery2 do
  begin
   active:=false;
   sql.Clear;
   sql.Add('select custfedship,REJECT_DESCRIPTION from data0192 inner join data0039');
   sql.Add('on custfedship=data0039.rkey');
   active:=true;
   if not IsEmpty then
    begin
     rej_ptr := fieldvalues['custfedship'];
     self.REJECT_DESC := fieldvalues['reject_description'];
    end;
  end;
 if rej_ptr=0 then
  begin
   messagedlg('请在控制开关程序中设置报废原因!',mtinformation,[mbok],0);
   application.Terminate;
  end;
 with dm.ADOQuery2 do
  begin                  //查找系统用户的员工指针
   active:=false;
   sql.Clear;
   sql.Add('select employee_ptr,employee_name from data0005,data0073');
   sql.Add('where data0073.employee_ptr=data0005.rkey and');
   sql.Add('data0073.rkey='+rkey73);
   active:=true;
   v_employee := fieldvalues['employee_ptr'];
   employee_name:= fieldvalues['employee_name'];
  end;
end;

procedure TForm1.N10Click(Sender: TObject); //输入盘点数量
begin
try
 form3:=tform3.Create(application);
 if form3.ShowModal=mrok then
  begin
   dm.ADO401.close;
   if dm.ADOQuery1.Active=true then
    dm.ADOQuery1.Active:=false;
  end;
finally
 form3.Free;
end;
end;

procedure TForm1.N11Click(Sender: TObject);

begin
with dm.ADOQuery2 do
 begin
  close;
  sql.Clear;
  sql.Add('select rkey from data0401');
  sql.Add('where status=0  and');
  sql.Add('header_ptr='+dm.ADP400rkey.AsString);
  open;
 end;

if not dm.ADOQuery2.IsEmpty then
 messagedlg('该次盘点的盘点清单没有处理完成',mtinformation,[mbok],0)
else
if messagedlg('你确认要用输入的数量替换系统原库存数量吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
 begin
  if not dm.ADOConnection1.InTransaction then dm.ADOConnection1.BeginTrans;
  dm.ADO58.Close; //报废
  dm.ADO58.Open;
  dm.ADOupdate1.Close;        //打开差异更新表
  dm.ADOupdate1.Parameters[0].Value := dm.ADP400rkey.Value;
  dm.ADOupdate1.Open;
  dm.ADOQuery3.Close;         //打开差异报表数据
  dm.ADOQuery3.Parameters[0].Value := dm.ADP400rkey.Value;
  dm.ADOQuery3.Open;
  dm.ado402.close;            //临时记录被删除的在线工单
  dm.ado402.Parameters[0].Value:=dm.ADP400rkey.Value;
  dm.ADO402.Open;

  while not dm.ADOupdate1.Eof do
   begin
    dm.ADOupdate1.Edit;              //更新在线WIP数量
    dm.ADOupdate1status.Value:=2;     //表示该条盘点记录已更新系统401
    if (dm.ADOupdate1divergent.Value<>0) or (dm.ADOupdate1divergent_pan.Value<>0) then
     begin  //在线数量等到于清点数量
      if (dm.ADOupdate1divergent.Value<>0) then
       begin
        dm.ADOupdate1QTY_BACKLOG.Value := dm.ADOupdate1physical_count_qty.Value;  //56
        with dm.ado0006 do              //更新pcs
         begin
          close;
          Parameters[0].Value:=dm.ADOupdate1wo_ptr.Value;
          open;
          edit;
          dm.ado0006QUAN_REJ.Value:=dm.ado0006QUAN_REJ.Value+dm.ADOupdate1divergent.Value;  //06
          if dm.ado0006quan_sch.Value-dm.ado0006QUAN_REJ.Value-dm.ado0006quan_prod.Value=0 then
           dm.ado0006PROD_STATUS.Value:=9;         //已完成                                //06
          dm.ado0006QTY_REJECT.Value:=dm.ado0006QTY_REJECT.Value+dm.ADOupdate1divergent.AsInteger;//492
          dm.ado0006WIP_QTY.Value:=dm.ado0006WIP_QTY.Value-dm.ADOupdate1divergent.AsInteger;//492
          post;
         end;
       end;

      if (dm.ADOupdate1divergent_pan.Value<>0) then
       begin
        dm.ADOupdate1PANELS56.Value := dm.ADOupdate1count_pan.Value;//56

       end;

      dm.ADO58.Append;//对盘点差异进行报废处理
      dm.ADO58MRB_NO.Value := self.mrb_no;
      dm.ADO58WO_PTR.Value := dm.ADOupdate1wo_ptr.Value;
      dm.ADO58DEPT_PTR.Value := dm.ADOupdate1dept_ptr.Value;
      dm.ADO58RESP_DEPT_PTR.Value := dm.ADOupdate1dept_ptr.Value;
      if dm.ADOupdate1reject_ptr.AsVariant<>null then
       dm.ADO58REJECT_PTR.Value := dm.ADOupdate1reject_ptr.Value
      else
       dm.ADO58REJECT_PTR.Value := self.rej_ptr;
      dm.ADO58QTY_ORG_REJ.Value := dm.ADOupdate1divergent.AsInteger;
      dm.ADO58QTY_REJECT.Value := dm.ADOupdate1divergent.Value;
      dm.ADO58PANELS.Value := dm.ADOupdate1divergent_pan.Value;
      dm.ADO58STEP.Value := dm.ADOupdate1wip_ptr.Value;
      dm.ADO58EMPL_PTR.Value := dm.ADOupdate1count_ptr.Value;
      dm.ADO58TDATETIME.Value := dm.ADOupdate1ent_date.Value;
      dm.ADO58warehouse_ptr.Value := dm.ADP400whouse_ptr.Value; //工厂指针
      dm.ADO58TTYPE.Value:=1;//盘点报废
     try
      dm.ado58.Post;
     except
      showmessage('出错了!记录号:'+dm.adoupdate1rkey.asstring+' '+dm.ADOupdate1wo_ptr.AsString);
      exit;
     end;

    end;
    dm.ADOupdate1.Post;
    dm.ADOupdate1.Next;
   end;

   with dm.ADOQuery2 do
    begin
     close;
     sql.Text:='delete data0056 where QTY_BACKLOG=0';
     ExecSQL;
    end;

   while not dm.ADO402.Eof do  dm.ADO402.Delete;//对已经删除的在线工单作处理
   dm.ADP400.Edit;
   dm.ADP400status.Value := 1;
   dm.ADP400update_date.Value := getsystem_date(dm.ADOQuery2,0);
   dm.ADP400.Post;

  try
   dm.ADOConnection1.CommitTrans;
   messagedlg('该次盘点所有数据更新系统成功!!!',mtinformation,[mbok],0);
  except
   dm.ADOConnection1.RollbackTrans;
   messagedlg('该次盘点数据更新系统产生了错误!!!',mtError,[mbcancel],0);
   exit;
  end;

  form9 := tform9.Create(application);
  dm.ADO493.Open;
  form9.QuickRep1.Preview;
  dm.ADO493.Close;
  dm.ADOQuery3.Close;
 end;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
 try
  form8:=tform8.Create(application);
  dm.ADP401.Close;
  dm.ADP401.Parameters[1].Value:=dm.ADP400rkey.Value;
  dm.ADP401.Open;
  dm.ADO493.Open;

   form8.ppReport1.Reset;
  form8.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'wip_list.rtm';          //R:\nierp\report\wip_list.rtm
  form8.ppReport1.Template.LoadFromFile;
  form8.ppReport1.SaveAsTemplate:=false;

  form8.ppReport1.Print;
  dm.ADO493.Close;
  dm.ADP401.Close;
 finally
  form8.free;
 end;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
 try
  form9:=tform9.Create(application);
  dm.ADOQuery3.Close;
  dm.ADOQuery3.Parameters[0].Value:=dm.ADP400rkey.Value;
  dm.ADOQuery3.Open;
  dm.ADO493.Open;
  form9.QuickRep1.Preview;
  dm.ADO493.Close;
  dm.ADOQuery3.Close;
 finally
  form9.free;
 end;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
 if dm.ADP400.IsEmpty then
  begin
   n6.Enabled:=false;
   n8.Enabled:=false;
   n10.Enabled:=false;
   n11.Enabled:=false;
   n13.Enabled:=false;
   n14.Enabled:=false;
   n16.Enabled:=false;
   n17.Enabled:=false;
   n1.Enabled:=false;
  end
 else
  begin
   n16.Enabled:=true;
   n14.Enabled:=true;
   n17.Enabled:=true;
   n1.Enabled:=true;   
   if dm.ADP400status.Value=0 then
    begin
     n6.Enabled:=true;
     n8.Enabled:=true;
     n10.Enabled:=true;
     n11.Enabled:=true;
     n13.Enabled:=true;
    end
   else
    begin
     n6.Enabled:=false;
     n8.Enabled:=false;
     n10.Enabled:=false;
     n11.Enabled:=false;
     n13.Enabled:=false;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);

begin
if not app_init_2(dm.ADOConnection1) then
 begin
  showmsg('程序起动失败,请联系管理员!',1);
  application.Terminate;
 end;
 self.Caption:=application.Title;


//  rkey73:='1215';
//  user_ptr := '100';
//  vprev:='4';

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

  OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd; 
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:integer;
begin
if  dm.ADOConnection1.Connected then
 begin
  with dm.ADOQuery2 do  //读取系统时间
   begin
    active:=false;
    sql.Clear;
    sql.Add('select getdate() as v_dt');
    active:=true;
    v_date := fieldvalues['v_dt'];     //长格式
    mrb_no := datetostr(fieldvalues['v_dt']); //短日期格式
    dtpk2.Date:= dateof(fieldvalues['v_dt']);
    dtpk1.Date:= dtpk2.Date-dayof(dtpk2.Date)+1;
   end;
  dtpk1Exit(sender);

  grid_colwith:=dbgrid1.Width;
  setlength(v_colwidth1,DBGrid1.FieldCount);
  for i:=0 to high(v_colwidth1) do v_colwidth1[i] := DBGrid1.Columns[i].Width;
 end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:integer;
begin
for i:=low(v_colwidth1) to high(v_colwidth1) do
 DBGrid1.Columns[i].Width:=v_colwidth1[i]+
  round((DBGrid1.Width-grid_colwith)*v_colwidth1[i]/(grid_colwith-28));
end;

procedure TForm1.N16Click(Sender: TObject);
begin
form11:=tform11.Create(application);
dm.ADOQuery3.Close;
dm.ADOQuery3.Parameters[0].Value:=dm.ADP400rkey.Value;
dm.ADOQuery3.Open;
form11.ShowModal;
form11.Free;
end;

procedure TForm1.N17Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
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
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := '盘点代码'+dm.ADP400wip_code.Value;
  Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];
  dm.ADOQuery4.Open;

  for iCount := 0 to dm.ADOQuery4.FieldCount-2 do
   Sheet.Cells[1, iCount + 1 ] :=dm.ADOQuery4.Fields[icount].DisplayLabel;

  for jcount :=1 to dm.ADOQuery4.RecordCount do
   begin
    for iCount := 0 to dm.ADOQuery4.FieldCount-2 do
    begin
     if (dm.ADOQuery4.Fields[icount].DataType = ftString) or
        (dm.ADOQuery4.Fields[icount].DataType = ftWideString) then
    Sheet.Cells[jCount + 1, iCount + 1].NumberFormatLocal:='@';
    Sheet.Cells[jCount + 1, iCount + 1] := dm.ADOQuery4.Fields[icount].AsString;
    end;
    dm.ADOQuery4.Next;
   end;
  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dm.ADOQuery4.Close;
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

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 application.Terminate;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
 try
  form8:=tform8.Create(application);

   form8.ppReport1.Reset;
  form8.ppReport1.Template.FileName :=
    stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
      'wip_list.rtm';          //R:\nierp\report\wip_list.rtm
  form8.ppReport1.Template.LoadFromFile;
  form8.ppReport1.SaveAsTemplate:=True;

  form8.ppDesigner1.ShowModal;
 finally
  form8.free;
 end;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
dm.ADp400.Close;
if checkbox1.Checked then
 dm.ADp400.Parameters.ParamValues['@v1']:=9
else
 dm.ADp400.Parameters.ParamValues['@v1']:=0;
if checkbox2.Checked then
 dm.ADp400.Parameters.ParamValues['@v2']:=9
else
 dm.ADp400.Parameters.ParamValues['@v2']:=1;
dm.ADp400.Open;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 dm.ADp400.Close;
 dm.ADp400.Parameters.ParamValues['@dtpk1']:=dtpk1.Date;
 dm.ADp400.Parameters.ParamValues['@dtpk2']:=dtpk2.Date+1;
 dm.ADp400.Open;
end;

procedure TForm1.N1Click(Sender: TObject);
var
 iCount, jCount: Integer;
 XLApp: Variant;
 Sheet: Variant;
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
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := '盘点代码'+dm.ADP400wip_code.Value;
  Sheet := XLApp.Workbooks[1].WorkSheets[XLApp.WorkBooks[1].WorkSheets[1].Name];
  dm.ADOQuery5.Open;
  for iCount := 0 to dm.ADOQuery5.FieldCount-1 do
   Sheet.Cells[1, iCount + 1 ] :=dm.ADOQuery5.Fields[icount].DisplayLabel;
  for jcount :=1 to dm.ADOQuery5.RecordCount do
   begin
    for iCount := 0 to dm.ADOQuery5.FieldCount-1 do
     begin
      if dm.ADOQuery5.Fields[iCount].DataType in [ftString,ftWideString] then
      Sheet.Cells[jCount + 1, iCount + 1].NumberFormatLocal:='@';
      Sheet.Cells[jCount + 1, iCount + 1] := dm.ADOQuery5.Fields[icount].AsString;
     end;
    dm.ADOQuery5.Next;
   end;
  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  dm.adoquery5.close;
end;


end.

