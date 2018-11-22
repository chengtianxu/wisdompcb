unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Menus, ImgList, ComCtrls, ExtCtrls, Buttons, Db, DBTables,
  Grids, DBGrids, Mask, DBCtrls, ShellAPI,Commctrl,Variants,
  ToolWin, lmdcont, LMDCustomComponent, LMDCustomMMButton,
  LMDMMButton, LMDCustom3DButton, LMD3DEffectButton, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDCustomParentPanel, LMDBackPanel,
  LMDControl, LMDBaseControl, LMDBaseGraphicButton, LMDCustomShapeButton,
  LMDShapeButton,winsock, ScktComp,mmsystem, jpeg, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomLabel, LMDCustomLabelFill, LMDLabelFill, ADODB;

type
  TFrmMainMenu = class(TForm)
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    PopupMenu1: TPopupMenu;
    Color: TMenuItem;
    Caption1: TMenuItem;
    StatusBar1: TStatusBar;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    ImageList3: TImageList;
    Detail1: TMenuItem;
    DetailIcon1: TMenuItem;
    MainMenu1: TMainMenu;
    Option: TMenuItem;
    chgPass: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    Help: TMenuItem;
    HelpAbout: TMenuItem;
    ImageList4: TImageList;
    Panel1: TPanel;
    PageScroller1: TPageScroller;
    LMDBitmapList2: TLMDBitmapList;
    LMDBitmapList1: TLMDBitmapList;
    LMDImageList1: TLMDImageList;
    Panel2: TPanel;
    LMDBackPanel2: TLMDBackPanel;
    ListView2: TListView;
    LMDMMButton2: TLMDMMButton;
    LMDMMButton1: TLMDMMButton;
    ListView1: TListView;
    Panel3: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Image4: TImage;
    Panel4: TPanel;
    ImageList5: TImageList;
    ImageList2: TImageList;
    ImageList1: TImageList;
    SpeedButton1: TSpeedButton;
    Start: TMenuItem;
    SpeedButton2: TSpeedButton;
    N2: TMenuItem;
    N3: TMenuItem;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Image1: TImage;
    LMD3DBtn3: TLMDShapeButton;
    LMD3DBtn4: TLMDShapeButton;
    LMD3DBtn5: TLMDShapeButton;
    LMD3DBtn6: TLMDShapeButton;
    LMD3DBtn7: TLMDShapeButton;
    LMD3DBtn8: TLMDShapeButton;
    LMD3DBtn9: TLMDShapeButton;
    LMD3DBtn10: TLMDShapeButton;
    LMD3DBtn11: TLMDShapeButton;
    LMD3DBtn1: TLMDShapeButton;
    LMD3DBtn2: TLMDShapeButton;
    SpeedButton7: TSpeedButton;
    Timer1: TTimer;
    LMDLabelFill3: TLMDLabelFill;
    LMD3DCaptionButton3: TLMD3DEffectButton;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SpeedButton8: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure DetailIcon1Click(Sender: TObject);
    procedure ListView2KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chgPassClick(Sender: TObject);
    procedure LMD3DBtn1Click(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Panel4DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListView2DblClick(Sender: TObject);
    procedure LMDMMButton1Click(Sender: TObject);
    procedure LMDMMButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Caption1Click(Sender: TObject);
    procedure Detail1Click(Sender: TObject);
    procedure ColorClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure HelpAboutClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    hMapFile,hMapFile1: THandle;
    MapFilePointer,MapFilePointer1: Pointer;
    procedure LoadListview1();
    procedure LoadListview2();
    procedure LoadMenu1();
    procedure LoadMenu2(vitem:TMenuItem);
    procedure LoadMenu3(vitem:TMenuItem);
    procedure LoadMenu4(vitem:TMenuItem);
    procedure Menuonclick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
   server_name:string;  
  end;

var
  FrmMainMenu: TFrmMainMenu;

implementation

uses datamodule, splash, ActiveFiles, About,
ChgPass, ActiveUsers,
Warning;

{$R *.DFM}

procedure TFrmMainMenu.FormCreate(Sender: TObject);
begin
  with DM.ADO0419a do
   begin
    close;
    parameters.ParamByName('@vptr').value:=dm.ADOData0073.fieldbyname('rkey').asinteger;
    open;
   end;
  with DM.ADO0419b do
   begin
    close;
    parameters.ParamByName('@vptr1').value:=dm.ADOData0073.fieldbyname('rkey').asinteger;
    open;
   end;
  with DM.ADO0419c do
   begin
    close;
    parameters.ParamByName('@vptr1').value:=dm.ADOData0073.fieldbyname('rkey').asinteger;
    parameters.ParamByName('@vptr2').value:=dm.ADOData0073.fieldbyname('rkey').asinteger;
    open;
   end;

  LoadMenu1();//加载下拉菜单

  DM.ADO0419a.First ;
  if dm.ADO0419a.recno=1 then
   begin
    dm.ADO0508.Open ;

    if dm.ADO0508.FieldByName('curr_period').asinteger>0 then
      DM.ADO0419b.Filter :='rkey<>2 AND parent_ptr = '+dm.ADO0419a.fieldbyname('rkey').asstring
    else
      DM.ADO0419b.Filter :='parent_ptr = '+dm.ADO0419a.fieldbyname('rkey').asstring;

   loadListview1();
    dm.ADO0508.close;
   end
  else
   if dm.ADO0419a.RecNo =10 then
   begin
    DM.ADO0419b.Filter :='parent_ptr = '+dm.ADO0419a.fieldbyname('rkey').asstring;
    dm.ADO0508.Open ;
    if dm.ADO0508.FieldByName('curr_period').asinteger>0 then
     loadListview1();
    dm.ADO0508.close;
   end
   else
    begin
     DM.ADO0419b.Filter :='parent_ptr = '+dm.ADO0419a.fieldbyname('rkey').asstring;
     loadListview1();
    end;

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

procedure TFrmMainMenu.loadListview1();
var i:integer;
  ListItem: TListItem;
  vstr:string;
begin
  listview1.items.clear;
  listview2.items.clear;
  with ListView1 do
   begin
    DM.ADO0419b.First ;
    for i := 0 to DM.ADO0419b.recordcount-1 do
     begin
      ListItem := Items.Add;
      vstr:= trim(DM.ADO0419B.fieldbyname('description').asstring);
      while pos(' ',vstr)>0 do
        vstr:=trim(copy(vstr,1,pos(' ',vstr)))+#13+trim(copy(vstr,pos(' ',vstr)+1,length(vstr)-pos(' ',vstr)));
      ListItem.Caption := vstr;
      ListItem.ImageIndex := DM.ADO0419b.fieldbyname('image_index').asinteger;
      DM.ADO0419b.Next ;
     end;
   end;

  DM.ADO0419b.First ;
  if not DM.ADO0419b.eof then
   begin
    DM.ADO0419c.Filter :='parent_ptr = '+dm.ADO0419b.fieldbyname('rkey').asstring;
    loadListview2();
   end;
end;

procedure TFrmMainMenu.loadListview2();
var i:integer;
  ListItem: TListItem;
  TheIcon : TIcon;
  vfile:pchar;
  vstr:string;
begin
  imagelist3.Clear ;
  imagelist4.Clear ;
  imagelist3.AddImages(imagelist5);
  imagelist4.AddImages(imagelist5);
  listview2.items.clear;
  with ListView2 do
  begin
    i:=1;
    DM.ADO0419c.First ;
    while not DM.ADO0419c.eof do
    begin
      ListItem := Items.Add;
      vstr:= trim(DM.ADO0419c.fieldbyname('description').asstring);
      while pos(' ',vstr)>0 do
        vstr:=trim(copy(vstr,1,pos(' ',vstr)))+#13+trim(copy(vstr,pos(' ',vstr)+1,length(vstr)-pos(' ',vstr)));
      ListItem.Caption := vstr;
      if DM.ADO0419c.fieldbyname('user_rights').asinteger>0 then
      begin
        vfile:=pchar(trim(DM.ADO0419c.fieldbyname('programe').asstring));
        TheIcon := TIcon.Create;
        TheIcon.Handle := ExtractIcon(hInstance,vfile,0);
        imagelist3.AddIcon(theicon);
        imagelist4.AddIcon(theicon);
        ListItem.ImageIndex := i;
        i:=i+1;
        TheIcon.Free;
      end else
        ListItem.ImageIndex := 0;
      DM.ADO0419c.Next ;
    end;
  end;
end;

procedure TFrmMainMenu.MenuItem1Click(Sender: TObject);
begin
  listview2.ViewStyle:=vsIcon;
end;

procedure TFrmMainMenu.MenuItem2Click(Sender: TObject);
begin
  listview2.ViewStyle:=vsSmallIcon;
end;

procedure TFrmMainMenu.DetailIcon1Click(Sender: TObject);
begin
  listview2.ViewStyle:=vsList;
end;

procedure TFrmMainMenu.ListView2KeyPress(Sender: TObject; var Key: Char);
begin
  if key<>#13 then exit;
  ListView2DblClick(sender);
end;

procedure TFrmMainMenu.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ZAppName: array[0..127] of char;
  vprog: String;
  Found: HWND;
  vj:integer;
  ListItem: TListItem;
  i:integer;
  TheIcon : TIcon;
  vfile:pchar;
  vstr,vstr2:string;
begin
  Application.CreateForm(TFrmActiveFiles, FrmActiveFiles);
  FrmActiveFiles.ListView1.items.clear;
  FrmActiveFiles.imagelist1.Clear ;
  vstr2:=dm.ADO0419c.Filter;
  dm.ADO0419c.Filter:='';
  DM.ADO0419c.First ;
  vprog:='**';
  i:=0;
  for vj:=0 to DM.ADO0419c.recordcount-1  do
  begin
   if trim(DM.ADO0419c.fieldbyname('programe').asstring)<>'' then
    begin
     if vprog=trim(DM.ADO0419c.fieldbyname('programe').asstring) then
      begin
       dm.ADO0419c.Next;
       continue;
      end;
      vprog:=trim(DM.ADO0419c.fieldbyname('programe').asstring);
      strpcopy(ZAppName,copy(vprog,1,length(vprog)-4));
      Found := FindWindow(nil, ZAppName); // 查找窗口
      if Found>0 then
      with FrmActiveFiles.ListView1 do
      begin
        ListItem := Items.Add;

        vstr:= trim(DM.ADO0419c.fieldbyname('description').asstring);
        while pos(' ',vstr)>0 do
          vstr:=trim(copy(vstr,1,pos(' ',vstr)))+#13+trim(copy(vstr,pos(' ',vstr)+1,length(vstr)-pos(' ',vstr)));
        ListItem.Caption := vstr;
        vfile:=pchar(trim(DM.ADO0419c.fieldbyname('programe').asstring));
        TheIcon := TIcon.Create;
        TheIcon.Handle := ExtractIcon(hInstance,vfile,0);
        FrmActiveFiles.imagelist1.AddIcon(theicon);
        ListItem.ImageIndex := i;
        i:=i+1;
        TheIcon.Free;
      end;
    end;
    DM.ADO0419c.Next ;
    if dm.ADO0419c.Eof then break;
  end;
  if FrmActiveFiles.ListView1.items.count>0 then
   begin
    FrmActiveFiles.Showmodal;
    Action := caNone;
    FrmActiveFiles.Free;
    dm.ADO0419c.Filter:=vstr2;
    exit;
   end
  else
   begin
    Action := caFree;
    FrmActiveFiles.Free;
   end;

  with DM.ADO0073 do
   begin
    close;
    parameters.ParamByName('@vptr').Value :=DM.ADOData0073.fieldbyname('rkey').AsInteger ;
    open;
   end;
  DM.ADOData0073.close;
  DM.ADO0073.Edit;
  DM.ADO0073.FieldValues['network_id']:=null;
  DM.ADO0073.FieldValues['computer']:=null;
  dm.ADO0073.FieldValues['LOGIN_IN_TIME']:=null;
  DM.ADO0073.post;
  DM.ADO0073.close;

{  vprog:='EP000';
  StrPCopy(ZAppName, vprog);
  Found := FindWindow(nil, ZAppName);
  if Found=0 then
  else
   begin
    SendMessage(found, WM_close, 0, 0);
   end;
}
end;

procedure TFrmMainMenu.chgPassClick(Sender: TObject);

begin
  Application.CreateForm(TFrmChgPass, FrmChgPass);
  if FrmChgPass.showmodal=mrOk then
   begin
   end;
end;

procedure TFrmMainMenu.LMD3DBtn1Click(Sender: TObject);
var
  index0:integer;
begin
  index0:=strtoint(copy((sender as tLMDShapeButton).Name,9,2));
  if index0<=0 then exit;

  if dm.ADO0419a.RecNo<>index0 then
  begin
    Listview1.Items.Clear ;
    Listview2.Items.Clear ;
    DM.ADO0419a.moveby(index0-dm.ADO0419a.RecNo);
    DM.ADO0419b.Filter :='parent_ptr = '+dm.ADO0419a.fieldbyname('rkey').asstring;
    if index0=1 then
    begin
      dm.ADO0508.Open ;
      if dm.ADO0508.FieldByName('curr_period').asinteger>0 then
        DM.ADO0419b.Filter :='rkey<>2 and parent_ptr = '+dm.ADO0419a.fieldbyname('rkey').asstring;
      loadListview1();
      dm.ADO0508.close;
    end else
    if index0=10 then
    begin
      dm.ADO0508.Open ;
      if dm.ADO0508.FieldByName('curr_period').asinteger>0 then
        loadListview1() else
        messagedlg('尚未开启财务帐务系统',mtinformation,[mbok],0);
      dm.ADO0508.close;
    end else
      loadListview1();
  end;
end;

procedure TFrmMainMenu.ListView1Click(Sender: TObject);
var
  index0:integer;
begin
  index0:=listview1.Items.indexOf(listview1.selected);
  if index0<0 then exit;

  DM.ADO0419b.moveby(index0+1-Dm.ADO0419b.RecNo);

  DM.ADO0419c.Filter :='parent_ptr = '+dm.ADO0419b.fieldbyname('rkey').asstring;
  loadListview2();
end;

procedure TFrmMainMenu.Panel4DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if Source=sender then
    Accept:=true
  else
    Accept:=false;
end;

procedure TFrmMainMenu.ListView1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Source=Panel4) and (Sender=listview1) then
  begin
    Accept:=True;
    Listview1.Width:=Listview1.Width-1;
  end else
    Accept:=false;
  if (Source=Panel4) and (Sender=listview2) then
  begin
    Accept:=True;
    Listview1.Width:=Listview1.Width+1;
  end else
    Accept:=false;
end;

procedure TFrmMainMenu.ListView2DblClick(Sender: TObject);
var
  j: Integer;
  index0:integer;
  vprog0:string;
  vprog:pchar;
  ZAppName: array[0..127] of char;
  Found: HWND;
  vrkey:string;
begin
  with DM.ADO0073 do
   begin
    close;
    parameters.ParamByName('@vptr').Value :=DM.ADOData0073.fieldbyname('rkey').AsInteger ;
    open;
   end;
   
  if DM.ADOData0073.fieldbyname('network_id').asstring
    <>DM.ADO0073.fieldbyname('network_id').asstring then
      close;

  index0:=listview2.Items.indexOf(listview2.selected);
  if index0<0 then exit;

  dm.ADO0419c.MoveBy(index0+1-dm.ADO0419c.RecNo);
  vprog0:=trim(dm.ADO0419c.fieldbyname('programe').asstring);
  j:=length(vprog0);
  if j>0 then
  begin
    vprog:=pchar(vprog0);;
    strpcopy(ZAppName,copy(vprog,1,length(vprog)-4));
    Found := FindWindow(nil, ZAppName); // 查找窗口
    if Found=0 then  begin
      splashForm:=TsplashForm.create(application);
      splashForm.Label5.Caption :=Listview2.Selected.Caption ;
      splashForm.Show;   // Display the splash screen
      splashForm.Update; // Update the splash screen to ensure it gets drawn


       StrCopy (PChar(MapFilePointer),
       PChar(trim(dm.ADOData0073.FieldByName('rkey').asstring)+' '+
       trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ self.server_name));

       StrCopy (PChar(MapFilePointer1),PChar('AA'+
       trim(dm.ADOData0073.FieldByName('employee_ptr').asstring)+' '+
       trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ self.server_name));

      //把用户的指针及权限写入共享内存

      winexec(vprog,sw_normal);

      StrCopy (PChar (MapFilePointer),PChar(''));
      StrCopy (PChar (MapFilePointer1),PChar(''));
      //把用户的指针及权限从共享内存清除

      splashForm.Hide;  // Hide the splash screen
      splashForm.Free;  // Free the splash screen
    end else
    begin
      ShowWindow(Found, SW_SHOWMINIMIZED);
      ShowWindow(Found, SW_SHOWNORMAL);
    end;

    exit;
  end;

  vrkey:=DM.ADO0419c.fieldbyname('rkey').asstring;
  DM.ADO0419c.Filter :='parent_ptr = '+vrkey;
  loadListview2();
end;

procedure TFrmMainMenu.LMDMMButton1Click(Sender: TObject);
begin
  if FrmMainMenu.ActiveControl =Listview1 then
    if Listview1.ItemIndex>0 then
    begin
      Listview1.ItemIndex:=Listview1.ItemIndex-1;
      ListView1Click(sender);
    end else
  else
    if FrmMainMenu.ActiveControl =Listview2 then
    if Listview2.ItemIndex>0 then
      Listview2.ItemIndex:=Listview2.ItemIndex-1;
end;

procedure TFrmMainMenu.LMDMMButton2Click(Sender: TObject);
begin
  if FrmMainMenu.ActiveControl =Listview1 then
    if Listview1.ItemIndex<Listview1.items.Count-1 then
    begin
      Listview1.ItemIndex:=Listview1.ItemIndex+1;
      ListView1Click(sender);
    end else
  else
  if FrmMainMenu.ActiveControl =Listview2 then
    if Listview2.ItemIndex<Listview2.items.Count-1 then
      Listview2.ItemIndex:=Listview2.ItemIndex+1;
end;

procedure TFrmMainMenu.SpeedButton3Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure TFrmMainMenu.FormActivate(Sender: TObject);
begin
  Statusbar1.Panels[3].Text :=dm.ADOData0073.fieldbyname('user_full_name').asstring;
end;

procedure TFrmMainMenu.Caption1Click(Sender: TObject);
begin
  listview1.ViewStyle:=vsSmallIcon;
end;

procedure TFrmMainMenu.Detail1Click(Sender: TObject);
begin
  listview1.ViewStyle:=vsList;
end;

procedure TFrmMainMenu.ColorClick(Sender: TObject);
begin
  listview1.ViewStyle:=vsIcon;
end;

procedure TFrmMainMenu.LoadMenu1();
var
  item,vitem1:tMenuItem;
  i:integer;
begin
  dm.ADO0508.Open ;
  DM.ADO0419a.First ;
  for i := 0 to DM.ADO0419a.recordcount-1 do
   begin
    if DM.ADO0419a.RecNo=10 then
     if dm.ADO0508.FieldByName('Initialized').asinteger=0 then
      begin
       next;
       continue;
      end;
    item:=TmenuItem.Create(self);
    item.Caption:=trim(DM.ADO0419a.fieldbyname('description').asstring);
    while pos(' ',item.Caption)>0 do
     item.Caption:=
      copy(item.Caption,1,pos(' ',item.Caption)-1)+
      copy(item.Caption,pos(' ',item.Caption)+1,length(item.Caption)-pos(' ',item.Caption));

    item.AutoHotKeys:=maManual;
    Start.Insert(start.count,item);
    vitem1:=item;
    DM.ADO0419b.Filter :='parent_ptr = '+dm.ADO0419a.fieldbyname('rkey').asstring;
    if DM.ADO0419a.RecNo=1 then
      if dm.ADO0508.FieldByName('Initialized').asinteger=1 then
     begin
      DM.ADO0419b.Filter :='rkey<>2 AND parent_ptr = '+dm.ADO0419a.fieldbyname('rkey').asstring;
     end;
    if dm.ADO0419b.RecordCount>0 then
        LoadMenu2(vitem1);
    DM.ADO0419a.Next ;
   end;
end;

procedure TFrmMainMenu.LoadMenu2(vitem:TMenuItem);
var
  item,vitem1:tMenuItem;
  i:integer;
begin
  DM.ADO0419b.First ;
  for i := 0 to DM.ADO0419b.recordcount-1 do
  begin
    item:=TmenuItem.Create(self);
    item.Caption:=trim(DM.ADO0419b.fieldbyname('description').asstring);
    while pos(' ',item.Caption)>0 do
      item.Caption:=copy(item.Caption,1,pos(' ',item.Caption)-1)+copy(item.Caption,pos(' ',item.Caption)+1,length(item.Caption)-pos(' ',item.Caption));
    item.AutoHotKeys:=maManual;
    vitem.Insert(vitem.count,item);
    vitem1:=item;
    DM.ADO0419c.Filter :='parent_ptr = '+dm.ADO0419b.fieldbyname('rkey').asstring;
    if dm.ADO0419c.RecordCount>0 then
        LoadMenu3(vitem1);
    DM.ADO0419b.Next ;
  end;
end;

procedure TFrmMainMenu.LoadMenu3(vitem:TMenuItem);
var
  item,item1,vitem1:tMenuItem;
  i:integer;
begin
  DM.ADO0419c.First ;
  for i := 0 to DM.ADO0419c.recordcount-1 do
  begin
    item:=TmenuItem.Create(self);
    item.Caption:=trim(DM.ADO0419c.fieldbyname('description').asstring);
    while pos(' ',item.Caption)>0 do
      item.Caption:=copy(item.Caption,1,pos(' ',item.Caption)-1)+copy(item.Caption,pos(' ',item.Caption)+1,length(item.Caption)-pos(' ',item.Caption));
    item.AutoHotKeys:=maManual;
    vitem.Insert(vitem.count,item);
    IF DM.ADO0419c.fieldbyname('favoriate').asInteger=1 then
     begin
      item1:=TmenuItem.Create(self);
      item1.Caption:=item.Caption;
      item1.AutoHotKeys:=maManual;
      N4.Insert(n4.count,item1);
     end;

    vitem1:=item;
    if DM.ADO0419c.Fieldbyname('exe_flag').asinteger=0 then
    begin
      with DM.ADO0419e do
      begin
        close;
        parameters.ParamByName('@vptr1').value:=DM.ADO0419c.Fieldbyname('rkey').asinteger;
        parameters.ParamByName('@vptr2').value:=dm.ADOData0073.fieldbyname('rkey').asinteger;
        parameters.ParamByName('@vptr3').value:=DM.ADO0419c.Fieldbyname('rkey').asinteger;
        parameters.ParamByName('@vptr4').value:=dm.ADOData0073.fieldbyname('rkey').asinteger;
        open;
      end;
      if dm.ADO0419e.RecordCount>0 then
          LoadMenu4(vitem1);
    end else
     begin
      item.onclick:=Menuonclick;
      item.Hint :=DM.ADO0419c.fieldbyname('programe').asstring;
      IF DM.ADO0419c.fieldbyname('favoriate').asInteger=1 then
       begin
        item1.onclick:=Menuonclick;
        item1.Hint :=DM.ADO0419c.fieldbyname('programe').asstring;
       end;
     end;
    DM.ADO0419c.Next ;
  end;
end;

procedure TFrmMainMenu.LoadMenu4(vitem:TMenuItem);
var
  item,item1:tMenuItem;
  i:integer;
begin
  DM.ADO0419e.First ;
  for i := 0 to DM.ADO0419e.recordcount-1 do
  begin
    item:=TmenuItem.Create(self);
    item.Caption:=trim(DM.ADO0419e.fieldbyname('description').asstring);
    while pos(' ',item.Caption)>0 do
      item.Caption:=copy(item.Caption,1,pos(' ',item.Caption)-1)+copy(item.Caption,pos(' ',item.Caption)+1,length(item.Caption)-pos(' ',item.Caption));
    item.AutoHotKeys:=maManual;
    item.onclick:=Menuonclick;
    item.Hint :=DM.ADO0419e.fieldbyname('programe').asstring;
    vitem.Insert(vitem.count,item);
    IF DM.ADO0419e.fieldbyname('favoriate').asInteger=1 then
    begin
      item1:=TmenuItem.Create(self);
      item1.Caption:=item.Caption;
      item1.AutoHotKeys:=maManual;
      item1.onclick:=Menuonclick;
      item1.Hint :=DM.ADO0419e.fieldbyname('programe').asstring;
      N4.Insert(n4.count,item1);
    end;
    DM.ADO0419e.Next ;
  end;
end;

procedure TFrmMainMenu.Menuonclick(Sender: TObject);
var
  j: Integer;
  vprog0:string;
  vprog:pchar;
  ZAppName: array[0..127] of char;
  Found: HWND;
begin
  vprog0:=trim((Sender as TmenuItem).Hint);
  j:=length(vprog0);
  if j>0 then
  begin
    vprog:=pchar(vprog0);;
    strpcopy(ZAppName,copy(vprog,1,length(vprog)-4));
    Found := FindWindow(nil, ZAppName); // 查找窗口
    if Found=0 then  begin
      splashForm:=TsplashForm.create(application);
      splashForm.Label5.Caption :=(Sender as TmenuItem).Caption;
      splashForm.Show;   // Display the splash screen
      splashForm.Update; // Update the splash screen to ensure it gets drawn

       StrCopy (PChar (MapFilePointer),PChar(trim(dm.ADOData0073.FieldByName('rkey').asstring)+' '+
        trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ self.server_name));

        StrCopy (PChar (MapFilePointer1),PChar('AA'+
        trim(dm.ADOData0073.FieldByName('employee_ptr').asstring)+' '+
        trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ self.server_name));

      //把用户的指针及权限写入共享内存

      winexec(vprog,sw_normal);

      StrCopy (PChar (MapFilePointer),PChar(''));
      StrCopy (PChar (MapFilePointer1),PChar(''));
      //把用户的指针及权限从共享内存清除

      splashForm.Hide;  // Hide the splash screen
      splashForm.Free;  // Free the splash screen
    end else
    begin
      ShowWindow(Found, SW_SHOWMINIMIZED);
      ShowWindow(Found, SW_SHOWNORMAL);
    end;

    exit;
  end;
end;

procedure TFrmMainMenu.SpeedButton1Click(Sender: TObject);
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

procedure TFrmMainMenu.N3Click(Sender: TObject);
var
  ListItem: TListItem;
begin
  Application.CreateForm(TFrmActiveUsers, FrmActiveUsers);
  FrmActiveUsers.ListView1.items.clear;
  DM.ADOUserList.Close;
  DM.ADOUserList.Open;
  with DM.ADOUserList do
   while not eof do
    begin
      with FrmActiveUsers.ListView1 do
       begin
        ListItem := Items.Add;
        ListItem.Caption:= inttostr(FrmActiveUsers.ListView1.Items.Count)+'   '
        +trim(DM.ADOUserList.fieldbyname('employee_name').asstring)
        +'  ['+Dm.ADOUserList.fieldbyname('user_login_name').asstring
        +']    登录时间：'+Dm.ADOUserList.fieldbyname('login_in_time').asstring
        +'  计算机:'+Dm.ADOUserList.fieldbyname('computer').asstring;

        if trim(Dm.ADOUserList.fieldbyname('network_id').asstring)='' then
         ListItem.ImageIndex :=1
        else
         ListItem.ImageIndex :=0;
       end;
      next;
    end;
  DM.ADOUserList.Close ;
  FrmActiveUsers.Showmodal;
  FrmActiveUsers.Free;
end;

procedure TFrmMainMenu.SpeedButton6Click(Sender: TObject);
var
  ZAppName: array[0..127] of char;
  vprog: String;
  Found: HWND;
begin
  vprog:='EP000';
  StrPCopy(ZAppName, vprog);
  Found := FindWindow(nil, ZAppName);
  if Found=0 then
  else
   begin
    showwindow(found,sw_RESTORE);
   end;
end;

procedure TFrmMainMenu.SpeedButton7Click(Sender: TObject);
var
  vprog:pchar;
begin
  vprog:=pchar('CALC.EXE');
  winexec(vprog,sw_normal);
end;

procedure TFrmMainMenu.N6Click(Sender: TObject);
var
  index0,i:integer;
  item:tMenuItem;
begin
  index0:=listview2.Items.indexOf(listview2.selected);
  if index0<0 then exit;
  for i:=0 to n4.Count-1 do
    if n4.Items[i].Hint =DM.ADO0419c.fieldbyname('programe').asstring then exit;

  dm.ADO0419c.MoveBy(index0+1-dm.ADO0419c.RecNo);
  with dm.ADO0074 do
  begin
    close;
    parameters.ParamByName('vptr1').Value :=dm.ADOData0073.fieldbyname('rkey').asinteger;
    parameters.ParamByName('vptr2').Value :=dm.ADO0419c.fieldbyname('rkey').asinteger;
    open;
  end;
  dm.ADO0074.Edit ;
  dm.ADO0074.FieldByName('favoriate').AsInteger :=1;
  dm.ADO0074.Post;
  item:=TmenuItem.Create(self);
  item.Caption:=trim(DM.ADO0419c.fieldbyname('description').asstring);
  while pos(' ',item.Caption)>0 do
    item.Caption:=copy(item.Caption,1,pos(' ',item.Caption)-1)+copy(item.Caption,pos(' ',item.Caption)+1,length(item.Caption)-pos(' ',item.Caption));
  item.AutoHotKeys:=maManual;
  N4.Insert(n4.count,item);
  item.onclick:=Menuonclick;
  item.Hint :=DM.ADO0419c.fieldbyname('programe').asstring;
end;

procedure TFrmMainMenu.PopupMenu2Popup(Sender: TObject);
var
  j: Integer;
  index0:integer;
  vprog0:string;
begin
  index0:=listview2.Items.indexOf(listview2.selected);
  if index0<0 then exit;
  dm.ADO0419c.MoveBy(index0+1-dm.ADO0419c.RecNo);
  vprog0:=trim(dm.ADO0419c.fieldbyname('programe').asstring);
  j:=length(vprog0);
  if j=0 then
    n6.Enabled :=false
  else
    n6.Enabled :=true;
end;

procedure TFrmMainMenu.SpeedButton8Click(Sender: TObject);
begin
  if messagedlg('是否确认要清空收藏夹？',mtconfirmation,[mbyes,mbno],0)=mrYes
  then begin
    with dm.ADOdata0074 do
    begin
      close;
      parameters.ParamByName('vptr1').Value :=dm.ADOData0073.fieldbyname('rkey').asinteger;
      open;
    end;
    with dm.ADOdata0074 do
    while not eof do
    begin
      edit;
      Fieldbyname('favoriate').AsInteger :=0;
      post;
      next;
    end;
    dm.ADOdata0074.Close;
    messagedlg('收藏夹已经清空！',mtinformation,[mbok],0);
    N4.Clear ; 
  end;
end;

procedure TFrmMainMenu.Timer1Timer(Sender: TObject);
var
  vprog0:string;
  vprog:pchar;
  ZAppName: array[0..127] of char;
begin
  timer1.Enabled :=false;
//  IF database_ptr.Caption='3' then exit;
  speedbutton6.Enabled :=true;
  vprog0:='EP000.EXE';
  vprog:=pchar(vprog0);;
  strpcopy(ZAppName,copy(vprog,1,length(vprog)-4));
  StrCopy (PChar (MapFilePointer),PChar(trim(dm.ADOData0073.FieldByName('rkey').asstring)+' '+
  trim(dm.ADO0419c.FieldByName('user_rights').asstring)+','+ self.server_name));
  winexec(vprog,sw_normal);
  StrCopy (PChar (MapFilePointer),PChar(''));
end;

procedure TFrmMainMenu.HelpAboutClick(Sender: TObject);
begin
  Application.CreateForm(TAboutBox, AboutBox);
  AboutBox.showmodal;
  AboutBox.free;
end;

procedure TFrmMainMenu.FormDestroy(Sender: TObject);
var
  ZAppName: array[0..127] of char;
  vprog: String;
  Found: HWND;
begin
{  with DM.ADO0073 do
   begin
    close;
    parameters.ParamByName('@vptr').Value :=DM.ADOData0073.fieldbyname('rkey').AsInteger ;
    open;
   end;
  DM.ADOData0073.close;
  DM.ADO0073.Edit;
  DM.ADO0073.fieldbyname('network_id').asstring:='';
  DM.ADO0073.fieldbyname('computer').asstring:='';
  DM.ADO0073.post;
  DM.ADO0073.close;
}
  vprog:='EP000';
  StrPCopy(ZAppName, vprog);
  Found := FindWindow(nil, ZAppName);
  if Found=0 then
  else
   begin
    SendMessage(found, WM_close, 0, 0);
   end;
end;

end.
