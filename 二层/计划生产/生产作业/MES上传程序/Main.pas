unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, ComCtrls,IniFiles,
  Menus,db,TranDataThread,ShellAPI;
const
WM_NID = WM_USER + 1000;
type
  TFrmMain = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BtQry: TBitBtn;
    DBGridEh1: TDBGridEh;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    BitBtn7: TBitBtn;
    BitBtn5: TBitBtn;
    Timer2: TTimer;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtQryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure IconServerClick(var message : TMessage); message WM_NID;
    procedure N3Click(Sender: TObject);

private
{ Private declarations }
public
{ Public declarations }
//procedure WMNID(var msg:TMessage);message WM_NID;
procedure item_click(sender: TObject);
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;
  Threadbool:boolean=false;
  Threadbool1:boolean=false;
  NotifyIcon:TNotifyIconData;
implementation

uses Pick_Item_Single,ConstVar,Common,Dm,DataTransSet, Query,
  BackupDataThread;

{$R *.dfm}

procedure TfrmMain.item_click(sender: TObject);
var
  i:byte;
begin

  (Sender as tmenuItem).Checked := not ((Sender as tmenuItem).Checked);
  if (Sender as tmenuItem).Checked then
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (Sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := true;
      break;
    end;
  end
  else
  begin
    for i := 0 to dbgrideh1.FieldCount - 1 do
    if dbgrideh1.Columns[i].Title.Caption = (Sender as tmenuItem).Caption then
    begin
      dbgrideh1.Columns[i].Visible := false;
      break;
    end;
  end;
end;

procedure TFrmMain.Timer1Timer(Sender: TObject);
var SqlStr:String; i:integer;StrList:TStringList;inifile:Tinifile;Filename:String;
begin
Filename:=ExtractFilePath(Paramstr(0))+'ProgramSet.ini';
inifile:=Tinifile.Create(filename);
if inifile.readstring('数据上传设定','生效日期','')='' then
begin
inifile.Free;
exit;
end;
if (strtodatetime(inifile.readstring('数据上传设定','生效日期',''))>now()) or (inifile.readstring('数据上传设定','数据上传状态','')='false')  then
   begin
     FrmMain.StatusBar1.Panels[2].Text:='数据上传状态：不能自动上传数据';
     exit;
   end
else
   begin
     FrmMain.StatusBar1.Panels[2].Text:='上传状态：可自动上传数据';
   end;
StrList:=TStringList.Create;
inifile.readsection('上传时间段设置',StrList);
for i:=0 to  StrList.Count-1 do
  begin
    if (inifile.readstring('上传时间段设置',StrList.Strings[i],'')='true') and (StrList.Strings[i]=formatdatetime('hh:mm',now))   then
      begin
        if  Threadbool=false then
          with TranData.Create(True) do
          Resume;
          Threadbool:=true;
          break;
      end;
   end;

//SqlStr:='insert into Y1408 select * from OpenRowSet('+QuotedStr('Microsoft.Jet.OLEDB.4.0')+','+QuotedStr(';database=D:/vss_work/Wisdomdata/WZPR1408.mdb')+','+QuotedStr('select * from WZPRData')+')';
end;

procedure TFrmMain.BitBtn1Click(Sender: TObject);
begin
if MessageDlg('真的要退出系统吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
application.Terminate;
end;

procedure TFrmMain.DBGridEh1TitleClick(Column: TColumnEh);
var i:integer;
begin
for i:=0 to DbGridEh1.Columns.Count-1 do
DbGridEh1.Columns[i].Title.Color:=clBtnFace;
Column.Title.Color:=clred;
if column.Title.SortMarker=smdowneh then
 begin
  if Column.Field.FieldKind=fkLookup then
  FrmDm.ADOSqlData.Sort:=Column.Field.KeyFields
  else
  FrmDm.ADOSqlData.Sort :=column.FieldName;
 end
 else
 begin
  if Column.Field.FieldKind=fkLookup then
  FrmDm.ADOSqlData.Sort:=Column.Field.KeyFields+ ' DESC'
  else
  FrmDm.ADOSqlData.Sort :=column.FieldName+ ' DESC';
 end;

end;

procedure TFrmMain.BitBtn2Click(Sender: TObject);
begin
FrmDataTransSet:=TFrmDataTransSet.Create(Self);
try
FrmDataTransSet.ShowModal;
finally
FrmDataTransSet.Free;
end;
end;

procedure TFrmMain.BtQryClick(Sender: TObject);
begin
FrmQuery:=TFrmQuery.Create(Application);
 try
  FrmQuery.ShowModal;
   finally
    FrmQuery.Free;
 end;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var i,CurRecord:Integer;
  item:TMenuItem;
  St:String;
begin
 FrmDM.ADOSqlData.Close;
 FrmDM.ADOSqlData.CommandText:='select * from Y1408 Where COMPUTER_IP='+QuotedStr(TranDataThread.GetHostIP)+' order by Y1417_RKEY,ccd_code,Y1406_Rkey desc,Panel_id';
 FrmDM.ADOSqlData.Open;
 if rKEY73='' then exit;
 FrmDm.ADOData0849.Close;
 FrmDm.ADOData0849.CommandText:='select * from Data0849 where D073_ptr='+rkey73+' and D419_ptr=691';
 FrmDm.ADOData0849.Open ;
 if  FrmDm.ADOData0849.RecordCount=0 then
 begin
  for i:=0 to  DBGrideh1.Columns.Count-1 do
    begin
      FrmDm.ADOData0849.Append;
      FrmDm.ADOData0849.FieldByName('D419_ptr').AsInteger:=691;
      FrmDm.ADOData0849.FieldByName('D073_ptr').AsInteger:=strtoint(rkey73);
      FrmDm.ADOData0849.FieldByName('FormName').AsString:=FrmMain.Name;
      FrmDm.ADOData0849.FieldByName('Gridname').AsString:='DBGridEh1';
      FrmDm.ADOData0849.FieldByName('FieldName').AsString:=DbGridEh1.Columns[i].FieldName;
      FrmDm.ADOData0849.FieldByName('FieldCaption').AsString:=DbGridEh1.Columns[i].Title.Caption;
      FrmDm.ADOData0849.FieldByName('Fieldorder').AsInteger:=i;
      FrmDm.ADOData0849.FieldByName('Fieldwidth').AsInteger:=DbGridEh1.Columns[i].Width ;
      FrmDm.ADOData0849.FieldByName('IsDisplay').AsBoolean:=true;
      FrmDm.ADOData0849.Open ;
      item := TmenuItem.Create(self) ;
      item.Caption:=DbGridEh1.Columns[i].Title.Caption;
      item.Checked:=true;
      DBGrideh1.Columns[i].Visible:=true;
      item.OnClick := item_click ;
      self.PopupMenu1.Items.Add(item) ;
    end;
 end
 else
  begin
  DBGrideh1.Update; 
  for i:=0 to DBGrideh1.Columns.Count-1 do
   begin
    item := TmenuItem.Create(self) ;
    FrmDm.ADOData0849.Locate('FieldCaption',DBGrideh1.Columns[i].Title.Caption,[]);
    item.Caption:=FrmDm.ADOData0849.FieldByName('FieldCaption').AsString;
    item.Checked:=FrmDm.ADOData0849.FieldByName('IsDisplay').AsBoolean;
    DBGrideh1.Columns[i].Visible:=FrmDm.ADOData0849.FieldByName('IsDisplay').AsBoolean;
    DBGrideh1.Columns[i].Width:=FrmDm.ADOData0849.FieldByName('FieldWidth').AsInteger ;
    item.OnClick := item_click ;
    self.PopupMenu1.Items.Add(item) ;
   end;
   end;
CurRecord:=FrmDM.ADOSqlData.RecNo;
if FrmDM.ADOSqlData.RecNo<0 then
CurRecord:=0;
FrmMain.StatusBar1.Panels[0].Text:='当前记录'+IntToStr(CurRecord)+'/'+ '总记录数:'+ IntToStr(FrmDM.ADOSqlData.RecordCount);


end;

procedure TFrmMain.BitBtn6Click(Sender: TObject);
begin
Popupmenu1.Popup(Mouse.CursorPos.x,Mouse.CursorPos.y);
end;

procedure TFrmMain.Edit1Change(Sender: TObject);
var  StrSql:String;
begin

      FrmDm.ADOSqlData.Close;
      StrSql:='select * from Y1408 where Y1406_Rkey IN (select RKEY from Y1406 where WORK_ORDER_NUMBER like'+'''%'+Trim(Edit1.Text)+'%'''+')';
      FrmDm.ADOSqlData.CommandText:=StrSql;
      FrmDm.ADOSqlData.Open ;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
//FrmDm.ADOConnection1.Open;
//FrmDm.ADOConnection2.Open;
rkey73:= '3165';
with NotifyIcon do
begin
cbSize:=SizeOf(TNotifyIconData);
Wnd:=Handle;
uID:=1;
uFlags:=NIF_ICON or NIF_MESSAGE or NIF_TIP;
uCallBackMessage:=WM_NID;
hIcon:=Application.Icon.Handle;
szTip:='上传及数据备份程序';
end;
Application.ShowMainForm := False;
Shell_NotifyIcon(NIM_ADD,@NotifyIcon);


end;
procedure TFrmMain.BitBtn4Click(Sender: TObject);
begin
 Export_dbGridEH_to_Excel(DBGridEh1,'生产线数据追踪数据表')
end;

procedure TFrmMain.BitBtn7Click(Sender: TObject);
begin
if Messagedlg('确定要上传数据吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 with TranData.Create(True) do
          Resume;
end;

procedure TFrmMain.BitBtn3Click(Sender: TObject);
var
SqlDataRkey:integer;
begin
 SqlDataRkey:=FrmDM.ADOSqlDataRkey.Value;
 Frmdm.ADOSqlData.Close;
 Frmdm.ADOSqlData.Prepared;
 Frmdm.ADOSqlData.Open;
 if SqlDataRkey>0 then
 Frmdm.ADOSqlData.Locate('Rkey', SqlDataRkey,[]);

end;

procedure TFrmMain.BitBtn5Click(Sender: TObject);
var TimeStr:String;
begin
 if Messagedlg('确定备份数据吗?',mtConfirmation,[mbyes,mbno],0)=mryes then
 with BackupThread.Create(True) do
          Resume;
//CopyFile(pchar('D:\vss_work\WisdomData\WZPR1408.mdb'),pchar('d:\111111111111111111111111111111111111111'+'.mdb'),False);
//CopyFile(pchar('D:\vss_work\WisdomData\WZPR1408.mdb'), pchar('d:\11.mdb'),false);
end;

procedure TFrmMain.Timer2Timer(Sender: TObject);
var  inifile2:Tinifile;Filename:String;i:integer; StrList1:TStringList;
begin
Filename:=ExtractFilePath(Paramstr(0))+'ProgramSet.ini';
inifile2:=Tinifile.Create(filename);
if inifile2.readstring('备份数据生效时间设置','生效日期','')='' then
begin
inifile2.Free;
exit;
end;
if (strtodatetime(inifile2.readstring('备份数据生效时间设置','生效日期',''))>now()) or (inifile2.readstring('启动备份','备份','')='false')  then
   begin
     FrmMain.StatusBar1.Panels[3].Text:='备份状态：不能自动备份数据';
     inifile2.Free;
     exit;
   end;
if (inifile2.readstring('数据清理','清理','')='true')   then
FrmMain.StatusBar1.Panels[3].Text:='备份状态：可自动备份数据'+'(同时删除已上传数据)'
else if (inifile2.readstring('数据清理','清理','')='false')  then
FrmMain.StatusBar1.Panels[3].Text:='备份状态：可自动备份数据'+'(不删除已上传数据)';
StrList1:=TStringList.Create;
inifile2.readsection('备份周期设置',StrList1);
for i:=0 to  StrList1.Count-1 do
  begin

   // ShowMessage((StrList1.Strings[i]+' '+inifile2.readstring('备份时间设置','备份时间','')));
   // ShowMessage(formatdatetime('MM-DD H:MM:SS',now));
    if (inifile2.readstring('备份周期设置',StrList1.Strings[i],'')='true') and ((StrList1.Strings[i]+' '+inifile2.readstring('备份时间设置','备份时间',''))=formatdatetime('M-D H:MM:SS',now))  then
      begin
        if  Threadbool1=false then
          with BackupThread.Create(True) do
          Resume;
          Threadbool1:=true;
          break;
      end;
   end;


end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
 Shell_NotifyIcon(NIM_DELETE,@NotifyIcon);
end;

procedure TFrmMain.IconServerClick(var message: TMessage);
var P: Tpoint;
begin
if message.LParam = WM_RButtonUP then   // 按下鼠标右键:
begin
SetForegroundWindow(FrmMain.Handle); // 弹出菜单不会自动隐藏
GetCursorPos(P);
PopupMenu2.Popup(P.x, P.y);
end;
   if message.LParam = WM_LButtonUP then
   begin
     if FrmMain.Showing then
       FrmMain.Hide
     else if not FrmMain.Showing then
       FrmMain.Show;
   end;
end;




procedure TFrmMain.N3Click(Sender: TObject);
begin
 if MessageDlg('真的要退出系统吗?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
 begin
 Shell_NotifyIcon(NIM_DELETE,@NotifyIcon);
 Application.Terminate;
 end;
end;
end.
