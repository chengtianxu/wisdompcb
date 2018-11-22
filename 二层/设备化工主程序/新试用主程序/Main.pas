unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzGroupBar, Menus, ComCtrls, DB, ADODB, ImgList, ActnList,ShellAPI,
  ExtCtrls, RzPanel, RzSplit;

type
  TfrmMain = class(TForm)
    RzGroupBar1: TRzGroupBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    ImageList2: TImageList;
    ImageList3: TImageList;
    ImageList5: TImageList;
    N14: TMenuItem;
    PopupMenu2: TPopupMenu;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Panel1: TPanel;
    ListView1: TListView;
    Panel2: TPanel;
    ListView2: TListView;
    Splitter1: TSplitter;
    ImageList4: TImageList;
    PopupMenu3: TPopupMenu;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N15Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListView1KeyPress(Sender: TObject; var Key: Char);
    procedure ListView2DblClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure ListView2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    hMapFile,hMapFile1: THandle;
    MapFilePointer,MapFilePointer1: Pointer;
    OnLine_App_List:TStringList; //已执行应用程序列表
    procedure Init_Menu_List;
    procedure Free_Init_Group;
    procedure Init_Sub_Items(LevNo,Parent_ptr:integer);//加载子模块到主界面
    procedure ItemClick(Sender:TObject);
    procedure AppClick(Sender:TObject);
    procedure GroupOpen(Sender:TObject);
//    procedure 
    function Load_App_Icon(AppName:string;Image:TImageList):boolean;
    procedure Get_FTP_INFO;
    function Call_Exec(fileName,Dir:string;var ProcessInfo:TProcessInformation):boolean;
    procedure Add_User_App_List();
    function Get_ONLINE_APP:boolean;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
uses common,ConstVar,dmcon,Login,App_List,ChgPass;
{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
{  if not App_Init(dmcon.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;}
//  vprev:='4';
  self.Caption :=Application.Title;
  Cur_Dir:=GetCurrentDir+'\';
//  App_Test(dm.ADOConnection1);
  //创建共享内存
  hMapFile := CreateFileMapping ($FFFFFFFF, nil, page_ReadWrite, 0,100,'coimasp20'); // 文件名
  if hMapFile <> 0 then
   MapFilePointer := MapViewOfFile (hMapFile, // 上面映象文件的句柄
    File_Map_All_Access, 0, 0, 0); // 访问整个映象文件

  hMapFile1 := CreateFileMapping ($FFFFFFFF,nil, page_ReadWrite, 0,100, 'xyz2055coimasp20'); // 文件名
  if hMapFile1 <> 0 then        // 特殊内存映射句柄
    MapFilePointer1 := MapViewOfFile (hMapFile1, // 上面映象文件的句柄
    File_Map_All_Access, 0, 0, 0); // 访问整个映象文件

  OnLine_App_List:=TStringList.Create;
  ListView2.Height:= (Panel1.Height-Panel2.Height-Splitter1.Height) div 3;
end;

procedure TfrmMain.Free_Init_Group;
var
  i,j:integer;
begin
{  for i:= 0 to RzGroupBar1.GroupCount-1 do
  begin
    for j := 0 to RzGroupBar1.Groups[i].Items. .Count - 1  do
      RzGroupBar1.Groups[i].Items[j].Free;
    RzGroupBar1.Groups[i].Free;
  end;}
end;

procedure TfrmMain.Init_Menu_List;
var
  sqlstr:string;
  tmp_Group:TRzGroup;
  tmp_Item:TRzGroupItem;
begin
//1.新增1级菜单
  //RzGroupBar1
  with dm do begin
    sqlstr:='select rKey,Description, Seq_No from data0419 where tType =1 order by seq_no';
    adsMenuList.Close;
    adsMenuList.CommandText := sqlstr;
    adsMenuList.Open;
    adsMenuList.First;
    while not adsMenuList.Eof do begin
      tmp_Group := TRzGroup.Create(RzGroupBar1);
      tmp_Group.Caption := trim(adsMenuList.fieldbyName('Description').AsString);
      tmp_Group.Color:= clMoneyGreen;//$00B47D00;//
      tmp_Group.ItemStyle := isLarge;
      tmp_Group.Close;
      sqlstr:='select rKey,Description, Seq_No,Image_Index  from data0419 where tType =2 and Parent_ptr= '+adsMenuList.fieldbyName('rKey').AsString+' order by seq_no';
      adsTmp.Close;
      adsTmp.CommandText := sqlstr;
      adsTmp.Open;
      while not adsTmp.Eof do begin
        tmp_Item:= tmp_Group.Items.Add;
        tmp_Item.Caption := trim(adsTmp.fieldbyName('Description').AsString);
        tmp_Item.Tag := adsTmp.fieldbyName('rKey').Asinteger;
        tmp_Item.ImageIndex := adsTmp.fieldbyName('Image_Index').Asinteger;
        tmp_Item.OnClick:= ItemClick;
        adsTmp.Next;
      end;
//      tmp_Group.OnOpen:=GroupOpen;
      RzGroupBar1.AddGroup(tmp_Group);
      adsMenuList.Next;
    end;
    adsTmp.Close;
    adsMenuList.close;
  end;
  if RzGroupBar1.GroupCount > 0 then
  begin
    if RzGroupBar1.Groups[0].Items.count>0 then
    RzGroupBar1.Groups[0].Items[0].Click;
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  OnLine_App_List.Free;;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
//登入界面
  with TfrmLogin.Create(application)do
  try
    if ShowModal = mrok then
    begin
      Statusbar1.Panels[3].Text :=dm.ADOData0073USER_full_name.Value;
      Statusbar1.Panels[2].Text :=combobox2.Text;
      Statusbar1.Panels[1].Text :=combobox1.Text;
    end;
  finally
    release;
  end;
  if not dm.ADOConnection1.Connected then
  begin
    Application.Terminate;
    exit;
  end;
  Init_Menu_List;
  Get_FTP_INFO;
  with DM do
  begin
    ADO0419c.close;
    ADO0419c.parameters.ParamByName('@vptr1').value:=ADOData0073.fieldbyname('rkey').asinteger;
    ADO0419c.parameters.ParamByName('@vptr2').value:=ADOData0073.fieldbyname('rkey').asinteger;
    ADO0419c.open;

    qry419.Close;
    qry419.Open;
    
  end;
  Add_User_App_List;
end;

procedure TfrmMain.ItemClick(Sender: TObject);
var
  rKey:integer;
begin
  rKey:= (sender as TRzGroupItem).Tag;
  Init_Sub_Items(3,rkey);
end;

function TfrmMain.Load_App_Icon(AppName: string; Image: TImageList): boolean;
var
  Icon:TIcon;
  hAppIcon:HIcon;
begin
  hAppIcon := ExtractIcon(hInstance,    PChar(AppName),   0);
  if hAppIcon > 1 then
  begin
    Icon := TIcon.Create;
    Icon.Handle:=hAppICon;
    Image.AddIcon(Icon);
    result := true;
  end
  else
    result := false;
//  Image.Picture.Icon.Handle := ExtractIcon( Application.Handle, PChar(FileName), 0 )
end;

procedure TfrmMain.ListView1DblClick(Sender: TObject);
var
  fileName,VerNo:string;
  rKey:integer;
  server_name:string;
  Found,Hnd:HWND;
   ProcessInfo:   TProcessInformation;   
begin
  if ListView1.Selected = nil then exit;
  try
    Screen.Cursor:=crAppStart;
    if ListView1.Selected.SubItems[2] = '1' then //可知行文件
    begin
      fileName:= trim(ListView1.Selected.SubItems[0]);
      if not IsFileInUse(Cur_Dir+fileName) then
      begin
        VerNo:=trim(ListView1.Selected.SubItems[1]);
        //判断版本是否和服务器一致，否则从服务器获得最新版本软件
        App_Update(fileName,VerNo);
        //把用户的指针及权限写入共享内存
        server_name:=dm.ADOConnection1.ConnectionString;
        StrCopy (PChar(MapFilePointer),
        PChar(trim(dm.ADOData0073.FieldByName('rkey').asstring)+' '+
        trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ server_name));
        StrCopy (PChar(MapFilePointer1),PChar('AA'+
        trim(dm.ADOData0073.FieldByName('employee_ptr').asstring)+' '+
        trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ server_name));
      //  Hnd:=ShellExecute(0,'open',PChar(Cur_Dir+fileName), '', '' , SW_SHOWNORMAL);
        if OnLine_App_List.IndexOf(filename) < 0 then
          OnLine_App_List.Add(filename);
  {      if Call_Exec(filename,Cur_Dir,ProcessInfo) then
          ListView1.Selected.SubItems[4]:=IntToStr(ProcessInfo.dwProcessId);}
        WinExec(Pchar(fileName),SW_NORMAL);
  //      if Hnd >32 then
  //        ListView1.Selected.SubItems[4]:=IntToStr(Hnd);
        //把用户的指针及权限从共享内存清除
        StrCopy (PChar (MapFilePointer),PChar(''));
        StrCopy (PChar (MapFilePointer1),PChar(''));
      end
      else
      begin
  //      Found:=StrToInt(ListView1.Selected.SubItems[4]);
        Found:=FindWindow(nil, Pchar(copy(fileName,1,Length(fileName)-4))); // 查找窗口
        if Found > 0 then
        begin
          setwindowpos(found,HWND_NOTOPMOST	,0,0,0,0,SWP_NOMOVE)

  //        ShowWindow(Found, SW_SHOWMINIMIZED);
    //      ShowWindow(Found, SW_SHOWNORMAL);
  //        ShowWindow(StrToInt(ListView1.Selected.SubItems[4]),SW_NORMAL);
        end;
      end;
    end //还有子目录
    else
    begin
      rKey:= StrToInt(ListView1.Selected.SubItems[3]);
      Init_Sub_Items(4,rkey);
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TfrmMain.Init_Sub_Items(LevNo, Parent_ptr: integer);
var
  sqlstr:string;
  ListItem:TListItem;
begin
  ListView1.Clear;
  ImageList1.Clear;
  ImageList1.AddImages(ImageList5);
  with dm do begin
  //  rKey:= (sender as TRzGroupItem).Tag;
    sqlstr:=' select rKey,Description, Seq_No,programe,VerNo,Exe_Flag  from data0419 where tType ='+IntToStr(LevNo)+' and Parent_ptr='+IntToStr(Parent_ptr)+
            ' and rkey in (select distinct data0419.rkey from data0074,data0419 where data0074.function_id=data0419.rkey '+
            ' and data0074.user_rights>0 and data0074.user_ptr='+user_ptr+') order by seq_no';
    adsTmp.Close;
    adsTmp.CommandText := sqlstr;
    adsTmp.Open;
    while not adsTmp.Eof do begin
      ListItem := ListView1.Items.Add;
      ListItem.Caption := StringReplace(adsTmp.fieldbyName('Description').AsString,' ','',[]);
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('programe').asstring));
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('VerNo').asstring));
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('Exe_Flag').asstring));
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('rKey').asstring));
      ListItem.SubItems.Add('0');//for app handle value itemIndex=4
  //    ListItem. crHandPoint
      if adsTmp.fieldbyName('Exe_Flag').AsInteger = 1 then
      begin
        if Load_App_Icon(trim(adsTmp.fieldbyName('programe').AsString),ImageList1) then
          ListItem.ImageIndex:=ImageList1.Count-1
        else
          ListItem.ImageIndex:=-1;
      end
      else
        ListItem.ImageIndex :=0;
  //    ListItem.Data :=
      adsTmp.next;
    end;
    adsTmp.Close;
  end;
end;

procedure TfrmMain.N10Click(Sender: TObject);
begin
  ListView1.ViewStyle := vsList;
end;

procedure TfrmMain.N11Click(Sender: TObject);
begin
  ListView1.ViewStyle := vsSmallIcon;
end;

procedure TfrmMain.N12Click(Sender: TObject);
begin
  ListView1.ViewStyle := vsIcon;
end;

procedure TfrmMain.Get_FTP_INFO;
begin
  with dm do begin
    adsTmp.close;
    adsTmp.CommandText:='select FTP_UserName,FTP_pswd,FTP_SrvIP from data0192';
    adsTmp.open;
    FTP_SRV_IP:=trim(adsTmp.fieldByName('FTP_SrvIP').AsString);
    FTP_User:=trim(adsTmp.fieldByName('FTP_UserName').AsString);
  //  FTP_Pswd:=Base64_Decode(trim(adsTmp.fieldByName('FTP_pswd').AsString));
    FTP_Pswd:=trim(adsTmp.fieldByName('FTP_pswd').AsString);
  end;
end;

procedure TfrmMain.N14Click(Sender: TObject);
var server_name,fileName:string;
Found:HWND;
begin
  if not Get_ONLINE_APP then exit;
  fileName:= 'Ver_Update.EXE';
  if not IsFileInUse(Cur_Dir+fileName) then
  begin
      //把用户的指针及权限写入共享内存
      server_name:=dm.ADOConnection1.ConnectionString;
      StrCopy (PChar(MapFilePointer),
      PChar(server_name));
      StrCopy (PChar(MapFilePointer1),PChar(server_name));
//      if OnLine_App_List.IndexOf(filename) < 0 then
//        OnLine_App_List.Add(filename);
      WinExec(Pchar(fileName),SW_NORMAL);
      Application.Terminate;
      StrCopy (PChar (MapFilePointer),PChar(''));
      StrCopy (PChar (MapFilePointer1),PChar(''));
    end
    else
    begin
      Found:=FindWindow(nil, Pchar(copy(fileName,1,Length(fileName)-4))); // 查找窗口
      if Found > 0 then
      begin
        setwindowpos(found,HWND_NOTOPMOST	,0,0,0,0,SWP_NOMOVE)
      end;
    end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseHandle(hMapFile);
  CloseHandle(hMapFile1);
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  canclose:=Get_ONLINE_APP;//false;
end;

function TfrmMain.Call_Exec(fileName,Dir: string;
  var ProcessInfo: TProcessInformation): boolean;
var   startupinfo:TStartUpInfo;   
begin    
  FillChar(Startupinfo,Sizeof(TStartupinfo),0);   
  with   StartupInfo   do   
  begin   
    cb   :=   SizeOf(TStartupInfo);   
    dwFlags   :=   STARTF_USESHOWWINDOW;   
    wShowWindow   :=   SW_SHOWNORMAL;   
  end;   
  result:= CreateProcess(nil,   
                         PChar(FileName),         //文件名
                         nil,
                         nil,
                         false,
                         normal_priority_class,
                         nil,
                         PChar(Dir),   //路径
                         Startupinfo,
                         ProcessInfo);
end;

procedure TfrmMain.N15Click(Sender: TObject);
var
  index0,i:integer;
  item:tMenuItem;
begin
  if Listview1.Selected = nil then exit;
  for i:=0 to n16.Count-1 do
    if n16.Items[i].Tag = StrToInt(Listview1.Selected.SubItems[3]) then exit; //DM.ADO0419c.fieldbyname('programe').asstring then exit;

  with dm.ADO0074 do
  begin
    close;
    parameters.ParamByName('vptr1').Value :=dm.ADOData0073.fieldbyname('rkey').asinteger;
    parameters.ParamByName('vptr2').Value :=StrToInt(Listview1.Selected.SubItems[3]);
    open;
  end;
  dm.ADO0074.Edit ;
  dm.ADO0074.FieldByName('favoriate').AsInteger :=1;
  dm.ADO0074.Post;
  item:=TmenuItem.Create(self);
  item.Caption:=Listview1.Selected.Caption ;
  while pos(' ',item.Caption)>0 do
    item.Caption:=copy(item.Caption,1,pos(' ',item.Caption)-1)+
    copy(item.Caption,pos(' ',item.Caption)+1,length(item.Caption)-pos(' ',item.Caption));
  item.AutoHotKeys:=maManual;
  n16.Insert(n16.count,item);
  item.onclick:=AppClick;
  item.Hint :=Listview1.Selected.SubItems[0];
  item.Tag:=StrToInt(Listview1.Selected.SubItems[3]);

  Add_User_App_List;
end;

procedure TfrmMain.n4Click(Sender: TObject);
begin
  with TFrmChgPass.Create(self)do
  try
    showmodal;
  finally
    release;
  end;
end;

procedure TfrmMain.N17Click(Sender: TObject);
var
  vfile:pchar;
begin
  vfile:=pchar('helpprj.hlp');
  ShellExecute(0,
               'open',
               vfile,
               nil,
               nil,
               SW_SHOWNORMAL);
end;

procedure TfrmMain.ListView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if mbRight=Button then
  if Listview1.Selected = nil then
    Listview1.PopupMenu := PopupMenu1
  else
    Listview1.PopupMenu := PopupMenu2;
end;

procedure TfrmMain.AppClick(Sender: TObject);
var
  fileName,VerNo:string;
  rKey:integer;
  server_name:string;
  Found,Hnd:HWND;
   ProcessInfo:   TProcessInformation;   
begin
//  if ListView1.Selected = nil then exit;
  rkey:=(Sender AS TMenuItem).Tag;
  if not dm.qry419.Locate('rKey',rKey,[loCaseInsensitive]) then exit;
  if dm.qry419.FieldByName('Exe_Flag').AsInteger=1 then
//  if ListView1.Selected.SubItems[2] = '1' then //可知行文件
  begin
    fileName:= trim(dm.qry419.FieldByName('programe').Asstring);//trim(ListView1.Selected.SubItems[0]);
    if not IsFileInUse(Cur_Dir+fileName) then                    //
    begin
      VerNo:=trim(dm.qry419.FieldByName('VerNo').Asstring);
      //判断版本是否和服务器一致，否则从服务器获得最新版本软件
      App_Update(fileName,VerNo);
      //把用户的指针及权限写入共享内存
      server_name:=dm.ADOConnection1.ConnectionString;
      StrCopy (PChar(MapFilePointer),
      PChar(trim(dm.ADOData0073.FieldByName('rkey').asstring)+' '+
      trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ server_name));
      StrCopy (PChar(MapFilePointer1),PChar('AA'+
      trim(dm.ADOData0073.FieldByName('employee_ptr').asstring)+' '+
      trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ server_name));
    //  Hnd:=ShellExecute(0,'open',PChar(Cur_Dir+fileName), '', '' , SW_SHOWNORMAL);
      if OnLine_App_List.IndexOf(filename) < 0 then
        OnLine_App_List.Add(filename);
{      if Call_Exec(filename,Cur_Dir,ProcessInfo) then
        ListView1.Selected.SubItems[4]:=IntToStr(ProcessInfo.dwProcessId);}
      WinExec(Pchar(fileName),SW_NORMAL);
//      if Hnd >32 then
//        ListView1.Selected.SubItems[4]:=IntToStr(Hnd);
      //把用户的指针及权限从共享内存清除
      StrCopy (PChar (MapFilePointer),PChar(''));
      StrCopy (PChar (MapFilePointer1),PChar(''));
    end
    else
    begin
//      Found:=StrToInt(ListView1.Selected.SubItems[4]);
      Found:=FindWindow(nil, Pchar(copy(fileName,1,Length(fileName)-4))); // 查找窗口
      if Found > 0 then
      begin
        setwindowpos(found,HWND_NOTOPMOST	,0,0,0,0,SWP_NOMOVE)

      end;
    end;
  end //还有子目录
  else
  begin
//    rKey:= StrToInt(rKey);
    Init_Sub_Items(4,rkey);
  end;
end;

procedure TfrmMain.Add_User_App_List();
var
  sqlstr:string;
  item:tMenuItem;
  ListItem:TListItem;
begin
  N16.Clear;
  with dm do begin
    ListView2.Clear;
    ImageList4.Clear;
    sqlstr:=' select D419.Description,D419.rKey as rKey419,D419.programe,D419.VerNo,D419.Exe_Flag,D419.rKey from data0074 D74 inner join Data0419 D419 on D74.Function_Id=D419.rKey '+
            ' where Favoriate =1 and D74.User_ptr= '+dm.ADOData0073.FieldByName('rkey').asstring;
    dm.adsTmp.close;
    dm.adsTmp.CommandText := sqlstr;
    dm.adsTmp.Open;
    while not adsTmp.Eof do begin
      item:=TmenuItem.Create(self);
      item.Caption:=dm.adsTmp.fieldbyName('Description').AsString;
      item.Hint:=dm.adsTmp.fieldbyName('programe').AsString;
      item.Tag:= dm.adsTmp.fieldbyName('rKey').Asinteger;
      item.onclick:=AppClick;
      item.AutoHotKeys:=maManual;
      N16.Add(Item);
      ListItem := ListView2.Items.Add;
      ListItem.Caption := StringReplace(adsTmp.fieldbyName('Description').AsString,' ','',[]);
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('programe').asstring));
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('VerNo').asstring));
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('Exe_Flag').asstring));
      ListItem.SubItems.Add(trim(adsTmp.fieldbyName('rKey').asstring));
      ListItem.SubItems.Add('0');//for app handle value itemIndex=4
      if adsTmp.fieldbyName('Exe_Flag').AsInteger = 1 then
      begin
        if Load_App_Icon(trim(adsTmp.fieldbyName('programe').AsString),ImageList4) then
          ListItem.ImageIndex:=ImageList4.Count-1
        else
          ListItem.ImageIndex:=-1;
      end
      else
        ListItem.ImageIndex :=0;
    
      dm.adsTmp.Next;
    end;
    adsTmp.Close;
  end;
end;

procedure TfrmMain.GroupOpen(Sender: TObject);
begin
  if (Sender As TRzGroup).Items.Count > 0 then
    (Sender As TRzGroup).Items[0].Click;
end;

function TfrmMain.Get_ONLINE_APP: boolean;
var
  i:integer;
  fileName:string;
  Found:HWND;
  ListItem:TListItem;
begin
  result:=false;
  if OnLine_App_List.Count =0 then
  begin
    result:= true;
    exit;
  end;
  try
    frmApp_List:= TfrmApp_List.Create(self);
    for i := 0 to OnLine_App_List.Count - 1 do
    begin
      fileName:=OnLine_App_List.Strings[i];
      if IsFileInUse(filename) then
      begin
        ListItem := frmApp_List.ListView1.Items.Add;
        if dm.qry419.Locate('programe',filename,[loCaseInsensitive]) then
          ListItem.Caption := trim(dm.qry419.fieldByName('Description').AsString)
        else
          ListItem.Caption := trim(filename);

        if Load_App_Icon(fileName,frmApp_List.ImageList1) then
          ListItem.ImageIndex:=frmApp_List.ImageList1.Count-1
        else
          ListItem.ImageIndex:=-1;
        ListItem.SubItems.Add(trim(filename));

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

procedure TfrmMain.ListView1KeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    ListView1DblClick(sender);
end;

procedure TfrmMain.ListView2DblClick(Sender: TObject);
var
  fileName,VerNo:string;
  rKey:integer;
  server_name:string;
  Found,Hnd:HWND;
  ProcessInfo:   TProcessInformation;   
begin
  if ListView2.Selected = nil then exit;
  try
    Screen.Cursor:=crAppStart;
    if ListView2.Selected.SubItems[2] = '1' then //可知行文件
    begin
      fileName:= trim(ListView2.Selected.SubItems[0]);
      if not IsFileInUse(Cur_Dir+fileName) then
      begin
        VerNo:=trim(ListView2.Selected.SubItems[1]);
        //判断版本是否和服务器一致，否则从服务器获得最新版本软件
        App_Update(fileName,VerNo);
        //把用户的指针及权限写入共享内存
        server_name:=dm.ADOConnection1.ConnectionString;
        StrCopy (PChar(MapFilePointer),
        PChar(trim(dm.ADOData0073.FieldByName('rkey').asstring)+' '+
        trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ server_name));
        StrCopy (PChar(MapFilePointer1),PChar('AA'+
        trim(dm.ADOData0073.FieldByName('employee_ptr').asstring)+' '+
        trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ server_name));
      //  Hnd:=ShellExecute(0,'open',PChar(Cur_Dir+fileName), '', '' , SW_SHOWNORMAL);
        if OnLine_App_List.IndexOf(filename) < 0 then
          OnLine_App_List.Add(filename);
  {      if Call_Exec(filename,Cur_Dir,ProcessInfo) then
          ListView1.Selected.SubItems[4]:=IntToStr(ProcessInfo.dwProcessId);}
        WinExec(Pchar(fileName),SW_NORMAL);
  //      if Hnd >32 then
  //        ListView1.Selected.SubItems[4]:=IntToStr(Hnd);
        //把用户的指针及权限从共享内存清除
        StrCopy (PChar (MapFilePointer),PChar(''));
        StrCopy (PChar (MapFilePointer1),PChar(''));
      end
      else
      begin
  //      Found:=StrToInt(ListView1.Selected.SubItems0[4]);
        Found:=FindWindow(nil, Pchar(copy(fileName,1,Length(fileName)-4))); // 查找窗口
        if Found > 0 then
        begin
          setwindowpos(found,HWND_NOTOPMOST	,0,0,0,0,SWP_NOMOVE)

  //        ShowWindow(Found, SW_SHOWMINIMIZED);
    //      ShowWindow(Found, SW_SHOWNORMAL);
  //        ShowWindow(StrToInt(ListView1.Selected.SubItems[4]),SW_NORMAL);
        end;
      end;
    end //还有子目录
    else
    begin
      rKey:= StrToInt(ListView2.Selected.SubItems[3]);
      Init_Sub_Items(4,rkey);
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TfrmMain.N6Click(Sender: TObject);
var
  sqlstr:string;
begin
  if ListView2.Selected = nil then exit;
  sqlstr:='update data0074 set Favoriate=0 from data0074 D74 inner join Data0419 D419 on D74.Function_Id=D419.rKey '+
          'where Favoriate =1 and D74.User_ptr= '+dm.ADOData0073.FieldByName('rkey').asstring+' and D419.rKey='+ListView2.Selected.SubItems[3];
  try
    dm.qryTmp.Close;
    dm.qryTmp.SQL.Text:=sqlstr;
    dm.qryTmp.ExecSQL;
  except
    ShowMsg('删除失败,请检查！',1);
  end;
  Add_User_App_List;
end;

procedure TfrmMain.ListView2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if mbRight=Button then
    if Listview2.Selected <> nil then
      Listview2.PopupMenu:=PopupMenu3
    else
      Listview2.PopupMenu:=nil;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  ListView2.Height:= (Panel1.Height-Panel2.Height-Splitter1.Height) div 3;
end;

procedure
