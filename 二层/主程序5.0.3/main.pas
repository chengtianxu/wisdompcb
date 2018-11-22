unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ImgList, RzGroupBar, ExtCtrls,ShellAPI,
  ActnList, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, db, TLHelp32, RzPanel, RzSplit, dbcgrids, DBCtrls,StrUtils,
  RzPrgres,IdFTP,IdFTPList,IdFTPCommon,IdAntiFreezeBase, IdAntiFreeze;
type
  TForm_main = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    RzGroupBar1: TRzGroupBar;
    ImageList1: TImageList;
    ImageList2: TImageList;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel1: TPanel;
    ImageList3: TImageList;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    N7: TMenuItem;
    ToolButton5: TToolButton;
    ImageList4: TImageList;
    ImageList5: TImageList;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    PopupMenu2: TPopupMenu;
    N9: TMenuItem;
    Panel2: TPanel;
    ListView1: TListView;
    Panel3: TPanel;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Action6: TAction;
    N10: TMenuItem;
    Label1: TLabel;
    IdFTP1: TIdFTP;
    Timer1: TTimer;
    Panel4: TPanel;
    Panel5: TPanel;
    RzSizePanel1: TRzSizePanel;
    ListView2: TListView;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Action7: TAction;
    Action8: TAction;
    N11: TMenuItem;
    Excel1: TMenuItem;
    RzProgressBar1: TRzProgressBar;
    Splitter1: TSplitter;
    ToolButton10: TToolButton;
    Action9: TAction;
    ToolButton11: TToolButton;
    Action10: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListView2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N9Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action4Execute(Sender: TObject);
    procedure Action5Execute(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView2DblClick(Sender: TObject);
    procedure ListView1KeyPress(Sender: TObject; var Key: Char);
    procedure ListView2KeyPress(Sender: TObject; var Key: Char);
    procedure Action6Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure Action7Execute(Sender: TObject);
    procedure Action8Execute(Sender: TObject);
    procedure Action9Execute(Sender: TObject);
    procedure Action10Execute(Sender: TObject);
  private
    { Private declarations }
   hMapFile,hMapFile1: THandle;
   MapFilePointer,MapFilePointer1: Pointer;
   OnLine_App_List:TStringList;

   procedure Get_FTP_INFO;
   procedure Add_User_App_List();
   function Load_App_Icon(AppName: string; Image: TImageList): boolean;
   procedure Init_Sub_Items(Parent_ptr: integer);
   procedure ItemClick(Sender: TObject);
   procedure execmenuClick(Sender: TObject);
   procedure Init_Menu_List;
   procedure run_exec(exec_name,user_right,program_name: string);
   procedure copytomapfile(rights:string);
   function FindProcess(AFileid:Cardinal;var afilename:string): boolean;
   function Get_ONLINE_APP: boolean;
   function get_online_apphwnd(exec_name:string;var exec_id:Hwnd) :boolean;
   function Get_Fiels_Count(Filter:string):integer;
   procedure Download_fiels(client_Dir:string;vfileMask:string);
   procedure trespass_user();
  public
    { Public declarations }
   star_dialog:boolean;
   password:string;
  end;

var
  Form_main: TForm_main;

implementation

uses damo,common, LogIn, ChgPass,ConstVar, App_List, onlineuser,
  hintdialog, sort_information,Md5, logininformation;

{$R *.dfm}

function TForm_main.Get_Fiels_Count(Filter:string):integer;
var
  i,icount:integer;
  FileName,FileMask:string;
begin
  icount:=0;
  for i:=0 to IdFTP1.DirectoryListing.Count-1 do
   begin
    if IdFTP1.DirectoryListing.Items[i].ItemType = ditDirectory then continue;
    FileName := uppercase(IdFTP1.DirectoryListing.Items[i].FileName);
    if Pos('=',Filter)>0 then //需下载某一类型的文件
     begin
      fileMask:=copy(Filter,Pos('=',Filter)+1,4);
      if FileMask <> '.*' then
       if POS(FileMask,FileName)>0 then//找到
        inc(icount)
       else
      else
       inc(icount);
     end
    else
     if Pos('<>',Filter)>0 then //需下载不包括某一类的所有文件
      begin
       fileMask:=copy(Filter,Pos('<>',Filter)+2,4);
       if FileMask <> '.*' then
        if POS(FileMask,FileName)=0 then//没找到
          inc(icount);
      end;

   end;
  result:=iCount;
end;

procedure TForm_main.Download_fiels(client_Dir:string;vfileMask:string);
var
  fileMask:string;
  i:integer;
  fileName:string;
  File_Srv_Time,File_Local_Time:tdatetime;
begin
   for i:= 0 to IdFTP1.DirectoryListing.Count - 1 do
    begin
      FileName := uppercase(trim(IdFTP1.DirectoryListing.Items[i].FileName));
      if (IdFTP1.DirectoryListing.Items[i].ItemType = ditDirectory) or
         (POS('.EXE',FileName)>0) then continue;

     //idftp1.DirectoryListing.Items[i].
      File_Srv_Time:=strtodatetime(FormatDateTime('yyyy/mm/dd HH:mm:ss',
                        IdFTP1.DirectoryListing.Items[i].ModifiedDate));

      if Pos('=',vfileMask)>0 then //需下载某一类型的文件
       begin
        fileMask:=copy(vFileMask,Pos('=',vFileMask)+1,4);
        if FileMask <> '.*' then
         begin
          if POS(FileMask,FileName)>0 then//找到
          begin

            File_Local_Time:= Get_File_Modify_Time(client_Dir+FileName);

            if File_Srv_Time > File_Local_Time then  //再判断是否日期也不一致，FTP控件有BUG，有些文件只能获取日期无法获得时间
            try
             IdFTP1.Get(FileName,
                        client_Dir+FileName,true,false);
            except
             showmsg('更新失败'+FileName,1);
            end;
            rzprogressbar1.partscomplete:=rzprogressbar1.partscomplete+1;
          end;
         end
        else
        begin

         File_Local_Time:= Get_File_Modify_Time(client_Dir+FileName);

         if File_Srv_Time > File_Local_Time then
          try
          IdFTP1.Get(FileName,
                     client_Dir+FileName,true,false);
          except
           showmsg('更新失败'+FileName,1);
          end;
          rzprogressbar1.partscomplete:=rzprogressbar1.partscomplete+1;
        end;
      end
      else
      if Pos('<>',vfileMask)>0 then //需下载不包括某一类的所有文件
      begin
        fileMask:=copy(vFileMask,Pos('<>',vFileMask)+2,4);
        if FileMask <> '.*' then
        begin
          if POS(FileMask,FileName)=0 then//没找到
          begin

            File_Local_Time:= Get_File_Modify_Time(client_Dir+FileName);

            if File_Srv_Time > File_Local_Time then
             try
             IdFTP1.Get(FileName,
                        client_Dir+FileName,true,false);
             except
              showmsg('更新失败'+FileName,1);
             end;
            rzprogressbar1.partscomplete:=rzprogressbar1.partscomplete+1;
          end;
        end;
      end;
    end;
end;

function TForm_main.FindProcess(AFileid:Cardinal;var afilename:string): boolean;
var
 hSnapshot: THandle;    //用于获得进程列表
 lppe: TProcessEntry32; //用于查找进程
 Found: Boolean;       //用于判断进程遍历是否完成
begin
Result :=False;
hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);//获得系统进程列表
lppe.dwSize := SizeOf(TProcessEntry32); //在调用Process32First API之前，需要初始化lppe记录的大小
Found := Process32First(hSnapshot, lppe);//将进程列表的第一个进程信息读入ppe记录中
while Found do
 begin
//if ((UpperCase(ExtractFileName(lppe.szExeFile))=UpperCase(AFileName)) or
//                    (UpperCase(lppe.szExeFile) =UpperCase(AFileName))) then
  if lppe.th32ProcessID= AFileid then
   begin
    afilename:=lppe.szExeFile;
    Result :=True;
    break;
   end;
  Found := Process32Next(hSnapshot, lppe);  //将进程列表的下一个进程信息读入lppe记录中
 end;
end;

function TForm_main.get_online_apphwnd(exec_name:string;var exec_id:Hwnd) :boolean;
var
  i:integer;
  fileName:string;
  AFileid:Cardinal;
begin
result:=false;
for i := 0 to OnLine_App_List.Count - 1 do
 begin
  fileName:='';
  AFileid:=StrToInt64(OnLine_App_List.Strings[i]);
  if FindProcess(AFileid,fileName) then
   if UpperCase(fileName)=UpperCase(exec_name) then
    begin
     exec_id := AFileid;
     result:=true;
     break;
    end;
 end;
end;

function TForm_main.Get_ONLINE_APP: boolean;
var
  i:integer;
  fileName:string;
  ListItem:TListItem;
  AFileid:Cardinal;
begin
  result:=false;
  if OnLine_App_List.Count =0 then
   begin
    result:= true;
   end
  else
   try
    frmApp_List:= TfrmApp_List.Create(self);
    dm.AQ_EXEC.Filter:='';
    for i := 0 to OnLine_App_List.Count - 1 do
     begin
      fileName:='';
      AFileid:=StrToInt64(OnLine_App_List.Strings[i]);
      if FindProcess(AFileid,fileName) then
       begin
        ListItem := frmApp_List.ListView1.Items.Add;
        if dm.AQ_EXEC.Locate('programe',filename,[loCaseInsensitive]) then
         ListItem.Caption := StringReplace(trim(dm.AQ_EXECDESCRIPTION.Value),' ','',[])
        else
         ListItem.Caption := trim(filename);
        if Load_App_Icon(fileName,frmApp_List.ImageList1) then
          ListItem.ImageIndex:=frmApp_List.ImageList1.Count-1
        else
          ListItem.ImageIndex:=-1;
        ListItem.SubItems.Add(OnLine_App_List.Strings[i]);
       end;
     end;
    if frmApp_List.ListView1.Items.Count > 0 then
     frmApp_List.ShowModal
    else
     result:=true;
   finally
    frmApp_List.Free;
   end;
end;

procedure TForm_main.copytomapfile(rights: string);
var
 server_name:string;
begin
  server_name:=dm.ADOConnection1.ConnectionString;
  StrCopy (PChar(MapFilePointer),     //把用户的指针及权限写入共享内存
  PChar(trim(dm.ADOData0073RKEY.asstring)+' '+
  rights+'/'+Statusbar1.Panels[1].Text+','+ server_name));

  StrCopy (PChar(MapFilePointer1),PChar('AA'+
  trim(dm.ADOData0073EMPLOYEE_PTR.asstring)+' '+
  rights+'/'+Statusbar1.Panels[1].Text+','+ server_name));
end;

function TForm_main.Load_App_Icon(AppName: string; Image: TImageList): boolean;
var
  Icon:TIcon;
  hAppIcon:HIcon;
begin
  hAppIcon := ExtractIcon(hInstance,PChar(AppName),0);
  if hAppIcon > 1 then
   begin
    Icon := TIcon.Create;
    Icon.Handle:=hAppICon;
    Image.AddIcon(Icon);
    result := true;
   end
  else
    result := false;
end;

procedure TForm_main.Init_Sub_Items(Parent_ptr: integer);
var
  ListItem:TListItem;
begin
  ListView1.Clear;
  ImageList3.Clear;

  with dm do begin
    AQ_EXEC.Filter:='manu_ptr='+inttostr(Parent_ptr);
    AQ_EXEC.First;
    while not AQ_EXEC.Eof do begin
      ListItem := ListView1.Items.Add;
      ListItem.Caption := StringReplace(AQ_EXEC.fieldbyName('Description').AsString,' ','',[]);
      ListItem.SubItems.Add(trim(AQ_EXEC.fieldbyName('programe').asstring));
      ListItem.SubItems.Add(trim(AQ_EXEC.fieldbyName('VerNo').asstring));
      ListItem.SubItems.Add(trim(AQ_EXEC.fieldbyName('USER_RIGHTS').asstring));
      ListItem.SubItems.Add(trim(AQ_EXEC.fieldbyName('rKey').asstring));

      if Load_App_Icon(trim(AQ_EXEC.fieldbyName('programe').AsString),ImageList3) then
       ListItem.ImageIndex:=ImageList3.Count-1
      else
       ListItem.ImageIndex:=-1;

      AQ_EXEC.next;
    end;
  end;
end;

procedure TForm_main.ItemClick(Sender: TObject);
var
  rKey:integer;
begin
  rKey:= (sender as TRzGroupItem).Tag;
  Init_Sub_Items(rkey);
end;

procedure TForm_main.Init_Menu_List;
var
  tmp_Group:TRzGroup;
  tmp_Item:TRzGroupItem;
  top_menu,second_menu,exec_menu:tmenuitem;
  info:TFileInfo;
begin
 with dm do
  begin
    adsMenuList.Close;
    adsMenuList.CommandText :='SELECT rkey,DESCRIPTION, image_index'+#13+
        'FROM SYSTEM_MAIN'+#13+
        'order by seq_no';
    adsMenuList.Open;

    adsTmp.Close;
    adsTmp.SQL.Text :='SELECT RKEY,DESCRIPTION,image_index,main_ptr'+#13+
          'FROM SYSTEM_MENU' +#13+
          'order by main_ptr,seq_no';
    adsTmp.Open;

    AQ_EXEC.Close;
    AQ_EXEC.Parameters.ParamValues['rkey73']:=rkey73;
    AQ_EXEC.Open;

    while not adsMenuList.Eof do  //加载一级菜单
     begin
      tmp_Group := TRzGroup.Create(RzGroupBar1);
      tmp_Group.Caption := adsMenuList.fieldbyName('Description').AsString;
      tmp_Group.Color:= clSkyBlue;
      tmp_Group.ItemStyle := isLarge;
      tmp_group.SmallImages:=imagelist1;
      tmp_group.captionimageindex:=adsMenuList.fieldbyName('Image_Index').Asinteger;
      tmp_Group.Close;

      top_menu:=tmenuitem.Create(self);
      top_menu.Caption:= adsMenuList.fieldbyName('Description').AsString;
      top_menu.ImageIndex:= adsMenuList.fieldbyName('Image_Index').Asinteger;
      self.MainMenu1.Items.Add(top_menu);

      adstmp.Filter:='main_ptr='+adsMenuList.fieldbyName('rkey').AsString;
      adstmp.First;
      while not adsTmp.Eof do  //加载二级菜单
       begin
        tmp_Item:= tmp_Group.Items.Add;
        tmp_Item.Caption := adsTmp.fieldbyName('Description').AsString;
        tmp_Item.Tag := adsTmp.fieldbyName('rKey').Asinteger;
        tmp_Item.ImageIndex := adsTmp.fieldbyName('Image_Index').Asinteger;
        tmp_Item.OnClick:= ItemClick;

        second_menu:=tmenuitem.Create(self);
        second_menu.Caption:= adsTmp.fieldbyName('Description').AsString;
        self.MainMenu1.Items[mainmenu1.Items.Count-1].Add(second_menu);

        AQ_EXEC.Filter:='manu_ptr='+adsTmp.fieldbyName('rKey').AsString;
        AQ_EXEC.First;
        while not aq_exec.Eof do    //加载三级菜单
         begin
          exec_menu:=tmenuitem.Create(self);
          exec_menu.Caption:=StringReplace(trim(AQ_EXECDESCRIPTION.Value),' ','',[rfReplaceAll]);
          exec_menu.Hint:=trim(AQ_EXECPROGRAME.Value)+';'+
                          AQ_EXECUSER_RIGHTS.AsString+'-'+
                          AQ_EXECVerNo.Value;
          exec_menu.OnClick:=execmenuClick;
          second_menu.Insert(second_menu.Count,exec_menu);

          GetVerInfo(Cur_Dir + trim(AQ_EXECPROGRAME.Value),info);

         if uppercase(Info.FileVersion) <>
            uppercase(AQ_EXECVerNo.Value) then
           try
            if not idftp1.Connected then idftp1.Connect;
            IdFTP1.ChangeDir('/EXEC');
            IdFTP1.Get(trim(AQ_EXECPROGRAME.Value),
                       Cur_Dir+trim(AQ_EXECPROGRAME.Value), true, false);
           except
           end;
          aq_exec.Next;
         end;
        adsTmp.Next;
      end;

      RzGroupBar1.AddGroup(tmp_Group);
      adsMenuList.Next;
    end;
    adsTmp.Filter:='';
    adsTmp.Close;
    adsMenuList.close;
  end;  //with dm do end

  if RzGroupBar1.GroupCount > 0 then
   begin
    if RzGroupBar1.Groups[0].Items.count>0 then
    RzGroupBar1.Groups[0].Items[0].Click;
   end;
   
end;

procedure TForm_main.Add_User_App_List();
var
  ListItem:TListItem;
begin
  with dm do
  begin
    ListView2.Clear;
    ImageList4.Clear;
    dm.adsTmp.close;
    dm.adsTmp.SQL.Text :=
    'SELECT Data0419.DESCRIPTION, Data0419.PROGRAME,data0074.USER_RIGHTS,'+#13+
    'Data0419.VerNo, Data0419.manu_ptr, Data0419.RKEY'+#13+
    'FROM Data0419 INNER JOIN'+#13+
          'Data0074 ON Data0419.RKEY = Data0074.FUNCTION_ID INNER JOIN'+#13+
          'system_menu on Data0419.manu_ptr=system_menu.rkey inner join'+#13+
          'system_main on system_menu.main_ptr=system_main.rkey'+#13+
    'WHERE data0074.FAVORIATE=1'+#13+
    ' and Data0074.USER_PTR = '+rkey73+#13+
    'ORDER BY system_main.seq_no,system_menu.SEQ_NO,Data0419.SEQ_NO';

    dm.adsTmp.Open;
    while not adsTmp.Eof do begin
      ListItem := ListView2.Items.Add;
      ListItem.Caption := StringReplace(adsTmp.fieldbyName('Description').AsString,' ','',[]);
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('programe').asstring));
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('VerNo').asstring));
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('USER_RIGHTS').asstring));
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('rKey').asstring));
      if Load_App_Icon(trim(adsTmp.fieldbyName('programe').AsString),ImageList4) then
       ListItem.ImageIndex:=ImageList4.Count-1
      else
       ListItem.ImageIndex:=-1;

      dm.adsTmp.Next;
    end;
    adsTmp.Close;
  end;
end;

procedure TForm_main.Get_FTP_INFO;
begin
  with dm do begin
   adsTmp.close;
   adsTmp.SQL.Text:='select ep000,ENG_MI_FILE_NO from data0192';
   adsTmp.open;
   timer1.Interval := adsTmp.fieldByName('ep000').AsInteger*1000;
  end;
end;

procedure TForm_main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 dm.AQ_EXEC.Close;
 dm.ADOData0073.Close;
 dm.ADOData0073.Open;
 if dm.ADOData0073COMPUTER.Value <> '' then
 begin
   dm.ADOData0073.Edit;
   dm.ADOData0073NETWORK_ID.Value:='';
   dm.ADOData0073COMPUTER.Value:='';
   dm.ADOData0073LOGIN_IN_TIME.AsVariant:=null;
   dm.ADOData0073.Post;
 end;
 dm.ADOData0073.Close;
 ModalResult:=mrCancel;
end;

procedure TForm_main.Action1Execute(Sender: TObject);
begin
if Get_ONLINE_APP then
 begin
  close;
 end;
end;

procedure TForm_main.N8Click(Sender: TObject);
var
 sql_text:string;
begin
 sql_text:='select rkey from data0074'+#13+
           'where USER_PTR='+rkey73+#13+                       //rkey73
           'and FUNCTION_ID='+Listview1.Selected.SubItems[3]+#13+ //rkey419
           'and FAVORIATE=1';
 OpenQuery(dm.adsTmp,sql_text);
 if dm.adsTmp.IsEmpty then
  begin
   sql_text:='update data0074'+#13+
             'set FAVORIATE=1'+#13+
            'where USER_PTR='+rkey73+#13+                       //rkey73
            'and FUNCTION_ID='+Listview1.Selected.SubItems[3]; //rkey419
   if ExecSql(dm.adsTmp,sql_text) then
    self.Add_User_App_List();
  end
 else
  ShowMsg(listview1.Selected.Caption+'已经是收藏的程序了!','提示',1);
end;

procedure TForm_main.ListView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if mbRight=Button then
  if Listview1.Selected = nil then
    Listview1.PopupMenu := nil
  else
    Listview1.PopupMenu :=PopupMenu1;
end;

procedure TForm_main.ListView2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if mbRight=Button then
  if Listview2.Selected = nil then
    Listview2.PopupMenu := nil
  else
    Listview2.PopupMenu := PopupMenu2;
end;

procedure TForm_main.N9Click(Sender: TObject);
var
 sql_text:string;
begin
 sql_text:='update data0074'+#13+
           'set FAVORIATE=0'+#13+
          'where USER_PTR='+rkey73+#13+                       //rkey73
          'and FUNCTION_ID='+Listview2.Selected.SubItems[3]; //rkey419
 if ExecSql(dm.adsTmp,sql_text) then
  self.Add_User_App_List();
end;

procedure TForm_main.Action2Execute(Sender: TObject);
begin
with TFrmChgPass.Create(application)do
 try
  if showmodal=mrok then
   password:=trim(Edit3.text);
 finally
  free;
 end;
end;

procedure TForm_main.Action3Execute(Sender: TObject);
begin
with TForm_onlineuser.Create(application)do
 try
  showmodal;
 finally
  free;
 end;
end;

procedure TForm_main.Action4Execute(Sender: TObject);
Var
 LS:TStringList;
begin
if Msg_Dlg_Ask('更新系统文件前需要退出本地已打开的程序继续吗?','提示',1) then
begin
 try
  if not idftp1.Connected then idftp1.Connect;
  IdFTP1.ChangeDir('/EXEC');
  LS := TStringList.Create;
  IdFTP1.List(LS);              //一定要先LIST下
  RzProgressBar1.visible:=true;
  rzprogressbar1.TotalParts:=self.Get_Fiels_Count('<>.EXE');
  self.Download_fiels(Cur_Dir,'<>.EXE');
  showmsg('更新成功!',1);
  RzProgressBar1.PartsComplete:=0;
  RzProgressBar1.visible:=false;
 except
  RzProgressBar1.PartsComplete:=0;
  RzProgressBar1.visible:=false;
 end;
end;
end;

procedure TForm_main.Action7Execute(Sender: TObject);
Var
 LS: TStringList;
 client_dir:string;
begin
if Msg_Dlg_Ask('更新系统文件前需要退出本地已打开的程序报表,您确定?','提示',1) then
begin
 try
  if not idftp1.Connected then idftp1.Connect;
  IdFTP1.ChangeDir('/' + 'NIERP\REPORT');
  LS := TStringList.Create;
  IdFTP1.List(LS);

  RzProgressBar1.visible:=true;
  rzprogressbar1.TotalParts:=self.Get_Fiels_Count('=.*');

  client_dir:= stringReplace(Cur_Dir,'EXEC\','',[rfReplaceAll]);

  if not DirectoryExists(client_dir+'NIERP\') then
   Createdir(client_dir+'NIERP\');

  if not DirectoryExists(client_dir+'NIERP\REPORT\') then
   Createdir(client_dir+'NIERP\REPORT\');

  self.Download_fiels(client_dir+'NIERP\REPORT\','=.*');

  showmsg('更新成功!',1);
  RzProgressBar1.PartsComplete:=0;
  RzProgressBar1.visible:=false;

 except
  RzProgressBar1.PartsComplete:=0;
  RzProgressBar1.visible:=false;
 end;

end;
end;

procedure TForm_main.Action8Execute(Sender: TObject);
Var
 LS: TStringList;
 client_dir:string; 
begin
if Msg_Dlg_Ask('更新系统文件前需要退出本地已打开的财务报表,您确定?','提示',1) then
begin
 try
  if not idftp1.Connected then idftp1.Connect;
  IdFTP1.ChangeDir('/' + 'KMERP\DATA');
  LS := TStringList.Create;
  IdFTP1.List(LS);

  RzProgressBar1.visible:=true;
  rzprogressbar1.TotalParts:=self.Get_Fiels_Count('=.*');

  client_dir:= stringReplace(Cur_Dir,'EXEC\','',[rfReplaceAll]);
  if not DirectoryExists(client_dir+'KMERP\') then
   Createdir(client_dir+'KMERP\');
  if not directoryexists(client_dir+'KMERP\DATA\') then
   createdir(client_dir+'KMERP\DATA\');
  self.Download_fiels(client_dir+'KMERP\DATA\','=.*');

  showmsg('更新成功!',1);
  RzProgressBar1.PartsComplete:=0;
  RzProgressBar1.visible:=false;

 except
  RzProgressBar1.PartsComplete:=0;
  RzProgressBar1.visible:=false;
 end;

end;
end;

procedure TForm_main.Action5Execute(Sender: TObject);
begin
if dialog<>0 then
 begin
  closewindow(dialog);
  dbctrlgrid1.Visible:=false;
 end;
with TForm_information.Create(application)do
 try
  self.star_dialog:=true;
  showmodal;
 finally
  free;
  star_dialog:=false;
 end;
end;

procedure TForm_main.Action9Execute(Sender: TObject);
var
  StartInfo : TStartupInfo;
  FProcessInfo : TProcessInformation;
begin
  FillChar(StartInfo,Sizeof(StartInfo),#0);
  StartInfo.cb := Sizeof(StartInfo);
  StartInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartInfo.wShowWindow := SW_SHOW;

  if CreateProcess(NIL,
              pchar('calc.exe'),
              nil,
              nil,
              False,
              0,
              nil,
              nil,
              StartInfo,
              FProcessInfo) then
    begin

    end;
end;

procedure TForm_main.trespass_user;
var
 rkey14:integer;
begin
   with dm.adsTmp do
    begin
     close;
     sql.Clear;
     sql.Add('select * from data0014 where rkey is null');
     open;
     append;
     fieldvalues['MESSAGE'] := '非法用法进入系统!'+
     dm.ADOData0073NETWORK_ID.Value+
     dm.ADOData0073COMPUTER.Value+
     dm.ADOData0073LOGIN_IN_TIME.AsString;
     fieldvalues['whosend']:= rkey73;
     post;
     rkey14:=fieldvalues['rkey'];
    end;

    with dm.adsTmp do
     begin
      close;
      sql.Clear;
      sql.Text:='insert into data0314 (emp_ptr,d14_ptr) '+
      'values (1,'+inttostr(rkey14)+' )';
      ExecSQL;
     end;
end;

procedure TForm_main.execmenuClick(Sender: TObject);
var
  fileName,USER_RIGHTS,programe_name:string;
  StartInfo : TStartupInfo;
  FProcessInfo : TProcessInformation;
  FAppHandle : Hwnd;
  info:TFileInfo;
begin
 try
  dm.ADOData0073.Close;
  dm.ADOData0073.Open;
  if dm.ADOData0073COMPUTER.Value='' then
   begin
    ShowMsg('您被系统用户弹出,请尽快退出系统!!!',1);
    exit;
   end;
  if (MD5Print(MD5String(password)) <> trim(dm.adodata0073PASSWORD.value))
     and (trim(dm.ADOData0073PASSWORD.value)<>'') then
   begin
    trespass_user;
    Messagedlg('非法系统用户,你的操作系统已自动记录!',mtinformation,[mbOk],0);
    exit;
   end;
  Screen.Cursor:=crAppStart;
  programe_name:= (Sender AS TMenuItem).Caption;

  fileName:= copy(trim((Sender AS TMenuItem).Hint),1,
                  pos(';',(Sender AS TMenuItem).Hint)-1);

  if GetVerInfo(Cur_Dir + fileName,info) then
  if  Info.FileDescription<>programe_name then
   begin
    trespass_user;
    Messagedlg('非法系统程序,你的操作系统已自动记录!',mtinformation,[mbOk],0);
    exit;
   end;
  USER_RIGHTS:=copy(trim((Sender AS TMenuItem).Hint),
                      pos(';',(Sender AS TMenuItem).Hint)+1,1);

  if get_online_apphwnd(fileName,FAppHandle) then
   begin
    application.ProcessMessages;
    ShowMsg('同一程序不能在同一数据库中启动两次!',1);
    exit;
   end;

  self.copytomapfile(USER_RIGHTS); //把用户的指针及权限写入共享内存

  FillChar(StartInfo,Sizeof(StartInfo),#0);
  StartInfo.cb := Sizeof(StartInfo);
  StartInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartInfo.wShowWindow := SW_SHOW;

  if CreateProcess(nil , // app name
                     pchar(fileName), { pointer to command line string }
                     nil, { pointer to process securityattributes }
                     nil, { pointer to thread security attributes }
                     false, { handle inheritance flag }
                     CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, { creation flags }
                     nil, { pointer to new environment block }
                     nil, { pointer to current directory name }
                     StartInfo, { pointer to STARTUPINFO }
                     FProcessInfo) then
    begin
     sleep(2000);
     OnLine_App_List.Add(inttostr(FProcessInfo.dwProcessId));
     StrCopy (PChar(MapFilePointer), '');
     StrCopy (PChar(MapFilePointer1), '');
    end;

  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TForm_main.run_exec(exec_name,user_right,program_name: string);
var                           //程序名，权限，     程序说明
  StartInfo : TStartupInfo;
  FProcessInfo : TProcessInformation;
  FAppHandle : Hwnd;
  info:TFileInfo;
begin
 try
  dm.ADOData0073.Close;
  dm.ADOData0073.Open;
  if trim(dm.ADOData0073COMPUTER.Value)='' then
   begin
    ShowMsg('您被系统用户弹出,请尽快退出系统!',1);
    exit;
   end;
  if (MD5Print(MD5String(password)) <> trim(dm.adodata0073PASSWORD.value))
     and (trim(dm.ADOData0073PASSWORD.value)<>'') then
   begin
    trespass_user;
    Messagedlg('非法系统用户,你的操作系统已自动记录!',mtinformation,[mbOk],0);
    exit;
   end;
  if GetVerInfo(Cur_Dir + exec_name,info) then
  if Info.FileDescription<>program_name then
   begin
    trespass_user;
    Messagedlg('非法系统程序,你的操作系统已自动记录!',mtinformation,[mbOk],0);
    exit;
   end;

  Screen.Cursor:=crAppStart;
  if get_online_apphwnd(exec_name,FAppHandle) then
   begin
    application.ProcessMessages;
    ShowMsg('同一程序不能在同一数据库中启动两次!',1);
    exit;
   end;

  self.copytomapfile(user_right);//把用户的指针及权限写入共享内存
  FillChar(StartInfo,Sizeof(StartInfo),#0);
  StartInfo.cb := Sizeof(StartInfo);
  StartInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartInfo.wShowWindow := SW_SHOW;

  if CreateProcess(nil , // app name
                     pchar(exec_name), { pointer to command line string }
                     nil, { pointer to process securityattributes }
                     nil, { pointer to thread security attributes }
                     false, { handle inheritance flag }
                     CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, { creation flags }
                     nil, { pointer to new environment block }
                     nil, { pointer to current directory name }
                     StartInfo, { pointer to STARTUPINFO }
                     FProcessInfo) then
    begin
     sleep(2000);
     OnLine_App_List.Add(inttostr(FProcessInfo.dwProcessId));
     StrCopy (PChar(MapFilePointer), '');
     StrCopy (PChar(MapFilePointer1), '');
    end;

 finally
  Screen.Cursor:=crDefault;
 end;
end;

procedure TForm_main.ListView1DblClick(Sender: TObject);
begin
 if listview1.Selected=nil then
 else
   run_exec(trim(listview1.Selected.SubItems[0]),trim(listview1.Selected.SubItems[2]),
                listview1.Selected.Caption);
end;

procedure TForm_main.ListView2DblClick(Sender: TObject);
begin
 if listview2.Selected=nil then
 else
  run_exec(trim(listview2.Selected.SubItems[0]),trim(listview2.Selected.SubItems[2]),
                   listview2.Selected.Caption);
end;

procedure TForm_main.ListView1KeyPress(Sender: TObject; var Key: Char);
begin
if listview1.Selected=nil then
else
if key=#13 then
  run_exec(trim(listview1.Selected.SubItems[0]),trim(listview1.Selected.SubItems[2]),
                   listview1.Selected.Caption);
end;

procedure TForm_main.ListView2KeyPress(Sender: TObject; var Key: Char);
begin
if listview2.Selected=nil then
else
if key=#13 then
  run_exec(trim(listview2.Selected.SubItems[0]),trim(listview2.Selected.SubItems[2]),
                    listview2.Selected.Caption);
end;

procedure TForm_main.Action6Execute(Sender: TObject);
var
  FileName: string;
 // Local_Ver_Info: PFile_Ver_INfo;
  info:TFileInfo;
begin
if Msg_Dlg_Ask('您确定要将本地文件版本信息更新到数据库吗?','提示',1) then
  try
    dm.ADOConnection1.BeginTrans;
    RzProgressBar1.visible:=true;
    screen.Cursor:=crHourGlass;
    dm.adstmp.Close;
    dm.adstmp.SQL.Text:='select rkey,programe,verNo,DESCRIPTION from data0419'+#13+
                         'where manu_ptr>0';
    dm.adstmp.Open;
    RzProgressBar1.TotalParts:=dm.adsTmp.RecordCount;
    while not dm.adstmp.eof do
     begin
      fileName := dm.adstmp.fieldbyname('programe').asstring;
//      Local_Ver_Info := GetFileVersion(Cur_Dir + fileName);
      if GetVerInfo(Cur_Dir + fileName,info) then
      if (Info.FileVersion <>
           DM.adsTmp.fieldbyname('verNo').asstring) or
         (Info.FileDescription<>
           dm.adstmp.FieldByName('DESCRIPTION').AsString) then
       begin
        dm.adstmp.Edit;
        dm.adstmp.FieldByName('VerNo').AsString := Info.FileVersion;
        dm.adstmp.FieldByName('DESCRIPTION').AsString := Info.FileDescription;
        dm.adstmp.Post;
       end;
     RzProgressBar1.PartsComplete:=dm.adsTmp.RecNo;
     dm.adstmp.next;
    end;
   dm.ADOConnection1.CommitTrans;
   screen.Cursor:=crDefault;
   showmsg('更新数据库文件版本成功!',1);
   dm.adsTmp.Close;
   RzProgressBar1.PartsComplete:=0;
   RzProgressBar1.visible:=false;
  except
    dm.ADOConnection1.RollbackTrans;
    screen.Cursor:=crDefault;    
  end;
end;

procedure TForm_main.FormDestroy(Sender: TObject);
begin
 OnLine_App_List.free;
 CloseHandle(hMapFile);
 CloseHandle(hMapFile1); 
end;

procedure TForm_main.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 canclose:=Get_ONLINE_APP;
end;

procedure TForm_main.Timer1Timer(Sender: TObject);
begin
  dm.ADOData0073.Close;
  dm.ADOData0073.Open;
  if dm.ADOData0073COMPUTER.Value='' then
   begin
    ShowMsg('您被系统用户弹出,请尽快退出系统!!!',1);
    exit;
   end;

if (Action5.Enabled) and (not star_dialog) then
 begin
  dm.ADS314.Close;
  dm.ADS314.Open;
  if (not dm.ADS314.IsEmpty) then
   begin
    dbctrlgrid1.Visible:=true;
    if dialog=0 then
     begin
      form_dialog:=tform_dialog.Create(application);
      dialog:= form_dialog.Handle;
      form_dialog.Show;
     end
    else
     ShowWindow(dialog, SW_SHOWNORMAL);
   end
  else
   begin
    closewindow(dialog);
    dbctrlgrid1.Visible:=false;
   end;
 end;
end;

procedure TForm_main.DBCtrlGrid1Click(Sender: TObject);
begin
if dm.ADS314rkey.Value > 0 then
begin
star_dialog:=true;
if dialog<>0 then
 begin
  closewindow(dialog);
  dbctrlgrid1.Visible:=false;
 end;
with TForm_information.Create(application)do
 try
  ADS314.Locate('rkey',dm.ADS314rkey.Value,[]);
  showmodal;
 finally
  free;
  star_dialog:=false;
 end;
end;
end;

procedure TForm_main.FormShow(Sender: TObject);
var
 youxiao:tdatetime;
begin
  if (MD5Print(MD5String(password)) <> trim(dm.adodata0073PASSWORD.value))
     and (trim(dm.ADOData0073PASSWORD.value)<>'') then
   begin
    trespass_user;
    Messagedlg('非法系统用户,你的操作系统已自动记录!',mtinformation,[mbOk],0);
    self.Close;
    application.Terminate;
   end;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  Get_FTP_INFO;      //读取短信查询时间间隔及主程序有效期
  youxiao:=StrToDate(dm.adsTmp.fieldByName('ENG_MI_FILE_NO').asstring);
  if getsystem_date(dm.adsTmp,1) > youxiao then
   begin
    Messagedlg('主程序已过有效期,请与软件供应商联系!',mtinformation,[mbOk],0);
    self.Close;
    application.Terminate;
   end;

  dialog:=0;
  idftp1.Host := FTP_SRV_IP;      //ftp主机
  idftp1.Username := FTP_User;    //ftp用户
  idftp1.Password := FTP_Pswd;    //ftp密码
  OnLine_App_List:=TStringList.Create;
  Screen.Cursor:=crAppStart;

  Init_Menu_List;    //主菜单初始化
  Add_User_App_List; //已收藏的程序初始化
  Screen.Cursor:=crDefault;
  self.Action5.Enabled:=dm.ADOData0073message_flag.Value;
  panel5.Visible:=dm.ADOData0073message_flag.Value;
  star_dialog:=false;
  timer1.Enabled:=true;
end;

procedure TForm_main.FormCreate(Sender: TObject);
begin
  //创建共享内存
  hMapFile := CreateFileMapping ($FFFFFFFF, nil, page_ReadWrite, 0,100,'coimasp20'); // 文件名
  if hMapFile <> 0 then
   MapFilePointer := MapViewOfFile (hMapFile, // 上面映象文件的句柄
    File_Map_All_Access, 0, 0, 0); // 访问整个映象文件

  hMapFile1 := CreateFileMapping ($FFFFFFFF,nil, page_ReadWrite, 0,100, 'xyz2055coimasp20'); // 文件名
  if hMapFile1 <> 0 then        // 特殊内存映射句柄
    MapFilePointer1 := MapViewOfFile (hMapFile1, // 上面映象文件的句柄
    File_Map_All_Access, 0, 0, 0); // 访问整个映象文件
end;


procedure TForm_main.Action10Execute(Sender: TObject);
begin
with TForm_logininformation.Create(application) do
 try
  showmodal;
 finally
  free;
 end;
end;

end.
