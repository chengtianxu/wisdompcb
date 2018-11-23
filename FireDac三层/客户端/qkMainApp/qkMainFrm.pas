unit qkMainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzButton,System.Generics.Collections,

  qkSvrIntf.ClientIntf, RzTabs, Vcl.ComCtrls, RzGroupBar,
  qkFunc.Commfunc,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param, System.ImageList, Vcl.ImgList, RzLabel,
  Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel, RzSplit, RzListVw, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, system.IniFiles;

type
  TfrmqkMainApp = class(TForm)
    pgc1: TPageControl;
    tsHomePage: TTabSheet;
    stat1: TStatusBar;
    gpLeftTree: TRzGroupBar;
    il2: TImageList;
    pnl1: TPanel;
    pgcWorkSpace: TPageControl;
    tsMod: TTabSheet;
    tsView: TTabSheet;
    lbl1: TLabel;
    lv1: TRzListView;
    lv2: TRzListView;
    spl1: TSplitter;
    lbl2: TRzLabel;
    ilMod: TImageList;
    mtMod: TFDMemTable;
    mtLike: TFDMemTable;
    ilLike: TImageList;
    pm1: TPopupMenu;
    N1: TMenuItem;
    pm2: TPopupMenu;
    MenuItem1: TMenuItem;
    mm1: TMainMenu;
    mniN2: TMenuItem;
    mniChangeDB: TMenuItem;
    mniChangePsw: TMenuItem;
    mniChangeSkin: TMenuItem;
    mniRefreshSvrBuffer: TMenuItem;
    tsWorkSpace: TTabSheet;
    pgc2: TPageControl;
    procedure FormCreate(Sender: TObject);
    procedure RzGroup1Open(Sender: TObject);
    procedure RzGroup1Items0Click(Sender: TObject);
    procedure RzGroup1CanClose(Sender: TObject; var CanClose: Boolean);
    procedure lv1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lv2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure lv1DblClick(Sender: TObject);
    procedure pgc2Close(Sender: TObject; var AllowClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure mniChangeSkinClick(Sender: TObject);
    procedure mniChangeDBClick(Sender: TObject);
    procedure mniChangePswClick(Sender: TObject);
    procedure mniRefreshSvrBufferClick(Sender: TObject);
  private
    FUserRights: TDictionary<string,TFDMemTable>;
    procedure CLoseTabMsg(var Message: TMessage); message WM_USER + 8998;
    procedure mniMainMenuClick(Sender: TObject);
  private
    { Private declarations }
    //FSkinIndex: Integer;
    FHotItem: TListItem;
    FLibList: TDictionary<string,THandle>;
    procedure ChangePswFrmOnClose(Sender: TObject; const Values: array of string; var CanClose: Boolean);
  public
    { Public declarations }
    procedure InitModUI;
    procedure LoadUserRights(ADBname: string);
  end;

var
  frmqkMainApp: TfrmqkMainApp;

implementation

uses
  Vcl.Styles,
  vcl.Themes;

{$R *.dfm}

procedure TfrmqkMainApp.ChangePswFrmOnClose(Sender: TObject;
  const Values: array of string; var CanClose: Boolean);
  var
  LValue: string;
begin
  if Values[0] <> Values[1] then
  begin
    ShowMessage('两次输入的密码不同，请确认！！');
    CanClose := False;
    Exit;
  end;
  LValue := Values[0];

  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := qkVar.LoginIDKey;
  end;
  with qkTmp.Pms.Add do
  begin
    Name := 'p2';
    Value := qkCommfunc.MD5Print(LValue);
  end;
  if not dmSvrIntf.SqlExec('10',qkTmp.Pms) then
  begin
    ShowMessage('修改密码失败');
    CanClose := False;
  end else
  begin
    ShowMessage('修改密码成功');
  end;
  qkTmp.ClearAll;

end;

procedure TfrmqkMainApp.CLoseTabMsg(var Message: TMessage);
begin
  if pgc2.ActivePage <> nil then
    pgc2.ActivePage.Free;
  if pgc2.PageCount = 0 then
    pgc1.ActivePage := tsHomePage;
end;

procedure TfrmqkMainApp.FormCreate(Sender: TObject);
var
  I: Integer;
  Lmn: TMenuItem;
  LIniFile: TIniFile;
  LFileName: string;
  LS: TStringList;
  Lmenu: TMenuItem;

begin
  inherited;
  FUserRights := TDictionary<string,TFDMemTable>.Create();
  qkVar.UserRights := FUserRights;

  pgc1.ActivePageIndex := 0;
  FLibList := TDictionary<string,THandle>.Create;
  InitModUI;
  //加载皮肤
  for I := 0 to Length(TStyleManager.StyleNames) - 1 do
  begin
    Lmn := TMenuItem.Create(mm1);
    Lmn.Caption := TStyleManager.StyleNames[I];
    Lmn.Tag := I;
    Lmn.OnClick := mniChangeSkinClick;
    mniChangeSkin.Add(lmn);
  end;
  //加载主菜单
  LFileName := ExtractFilePath(ParamStr(0)) + 'qkERPLauncher.ini';
  LS := TStringList.Create;
  LIniFile := TIniFile.Create(LFileName);
  try
    LIniFile.ReadSection('DBList',LS);
    for I := 0 to LS.Count - 1 do
    begin
      Lmenu := TMenuItem.Create(mm1);
      Lmenu.Caption := LS[I];
      Lmenu.AutoCheck := True;
      Lmenu.Checked := LS[I] = dmSvrIntf.FDefConName;
      Lmenu.OnClick := mniChangeDBClick;
      Lmenu.RadioItem := True;
      mniChangeDB.Add(Lmenu);
    end;
  finally
    LIniFile.Free;
    LS.Free;
  end;

  //加载用户权限
  LoadUserRights(dmSvrIntf.FDefConName);
end;

procedure TfrmqkMainApp.FormDestroy(Sender: TObject);
begin
  FLibList.Free;
  FUserRights.Free;
end;

procedure TfrmqkMainApp.InitModUI;
  procedure InitLeftTree;
  const
    SPNAME = 'Sys_GetModTree';
  var
    LdsList: TList<TFDMemTable>;
    LPms: TFDParams;
    //I: Integer;
    LtmpGP: TRzGroup;
    Ltmp2: TRzGroupItem;
    LIcon: TIcon;
    LImgFile: string;

    Ltop_menu: TMenuItem;
    Lsec_menu: TMenuItem;
    LThird_menu: TMenuItem;

  begin
    LdsList := nil;
    LPms := TFDParams.Create;
    try
      with LPms.Add do
      begin
        Name := '@LoginName';
        Value := qkVar.LoginName;
      end;
      LdsList := dmSvrIntf.SpOpen(SPNAME,LPms);

      if LdsList = nil then
        Close;
      mtMod.AppendData(LdsList[2].Data);
      mtLike.AppendData(LdsList[2].Data);
      //加载一级菜单
      LdsList[0].First;
      while not LdsList[0].Eof do
      begin
        LtmpGP := TRzGroup.Create(Self);
        LtmpGP.Caption := LdsList[0].FieldByName('ModName').AsString;
        LtmpGP.Color := $00A09E5F;
        LtmpGP.CaptionFont.Size := 9;
        LtmpGP.CaptionFont.Color := clBlack;
        LtmpGP.Font.Charset := GB2312_CHARSET;
        LtmpGP.Font.Style := [];
        LtmpGP.CaptionColor := clSilver;
        LtmpGP.CaptionHeight := 25;
        LtmpGP.CaptionColorStart := clSilver;
        LtmpGP.CaptionColorStop := clSilver;
        LtmpGP.Tag := LdsList[0].FieldByName('IDKey').AsInteger;
        LtmpGP.ItemStyle := isLarge;
        LtmpGP.OnOpen := RzGroup1Open;
        LtmpGP.OnCanClose := RzGroup1CanClose;

        //--加载顶部一级主菜单
        Ltop_menu:=tmenuitem.Create(self);
        Ltop_menu.Caption:= LdsList[0].FieldByName('ModName').AsString;
        //Ltop_menu.ImageIndex:= LCds1.fieldbyName('Image_Index').Asinteger;
        mm1.Items.Add(Ltop_menu);
        //

        {$REGION '加载二级菜单'}
        LdsList[1].Filter := 'ParentIDKey = ' + LtmpGP.Tag.ToString;
        LdsList[1].Filtered := True;
        LdsList[1].First;
        while not LdsList[1].Eof do
        begin
          LIcon := TIcon.Create;
          try
            //--加载顶部二级菜单
            Lsec_menu:=tmenuitem.Create(self);
            Lsec_menu.Caption:= LdsList[1].FieldByName('ModName').AsString;
            mm1.Items[mm1.Items.Count-1].Add(Lsec_menu);
            {$REGION '加载顶部三级菜单'}
            mtMod.Filter := 'ParentIDKey = ' + LdsList[1].FieldByName('IDKey').AsString;
            mtMod.Filtered := True;
            mtMod.First;
            mtMod.DisableControls;
            while not mtMod.Eof do
            begin
              LThird_menu:=tmenuitem.Create(self);
              LThird_menu.Caption:=mtMod.FieldByName('ModName').AsString;
              LThird_menu.Hint := mtMod.FieldByName('IDKey').AsLargeInt.ToString;
              LThird_menu.OnClick := mniMainMenuClick;
              Lsec_menu.Add(LThird_menu);
              mtMod.Next;
            end;
            mtMod.Filtered := False;
            {$ENDREGION}


            //--

            LImgFile := ExtractFilePath(ParamStr(0)) + 'Images\ModTree\' + LdsList[1].FieldByName('ModName').AsString + '.ico';
            if FileExists(LImgFile) then
              LIcon.LoadFromFile(LImgFile);
            Ltmp2 := LtmpGP.Items.Add;
            Ltmp2.Tag := LdsList[1].FieldByName('IDKey').AsInteger;
            Ltmp2.Caption := LdsList[1].FieldByName('ModName').AsString;
            Ltmp2.ImageIndex := il2.AddIcon(LIcon);
            Ltmp2.OnClick := RzGroup1Items0Click;
            LIcon.Free;
          except
            on E: Exception do
            begin
              LIcon.Free;
            end;
          end;

          LdsList[1].Next;
        end;
        {$ENDREGION}

        gpLeftTree.AddGroup(LtmpGP);
        LdsList[0].Next;
      end;
    finally
      qkCommfunc.ReleaseDsList(LdsList);
      LPms.Free;
    end;
  end;
  procedure InitStautsBar;
  begin
    with stat1 do
    begin
      Panels[0].Text := '当前用户：' + qkvar.LoginName;
      Panels[1].Text := '登陆账套：' + qkVar.LoginDBName;
      Panels[2].Text := '登陆时间：' + qkCommfunc.DateTimeToStr(Now);
      Panels[3].Text := '登陆IP： ' + qkvar.LoginSvrIP;
      Panels[4].Text := '计算机名：' + qkCommfunc.GetLocalCumputerName;
    end;
  end;
  procedure LoadLikeMod;
  var
    LImgFile: string;
    LItem: TListItem;
    Lico: TIcon;
  begin
    mtLike.Filter := 'Blike = 1';
    mtLike.Filtered := True;
    mtLike.First;
    while not mtLike.Eof do
    begin
      LItem := lv2.Items.Add;
      LItem.Caption := mtLike.FieldByName('ModName').AsString;
      LItem.Data := Pointer(mtLike.FieldByName('IDKey').AsInteger);
      LImgFile := ExtractFilePath(ParamStr(0)) + 'Images\ModImages\' + mtLike.FieldByName('IDKey').AsString + '.ico';
      if FileExists(LImgFile) then
      begin
        Lico := TIcon.Create;
        try
          Lico.LoadFromFile(LImgFile);
          LItem.ImageIndex := ilLike.AddIcon(Lico);
          Lico.Free;
        except
          Lico.Free;
        end;
      end else
      begin
        ilLike.AddIcon(nil);
      end;
      mtLike.Next;
    end;
  end;
begin
  InitStautsBar;
  InitLeftTree;
  LoadLikeMod;
end;

procedure TfrmqkMainApp.LoadUserRights(ADBname: string);
const
  SPNAME = 'Sys_GetUserRights';
var
  lds: TFDMemTable;
begin
  if FUserRights.ContainsKey(ADBname) then
    Exit;

  qkTmp.ClearAll;
  with qkTmp.Pms.Add do
  begin
    Name := 'p1';
    Value := qkVar.LoginIDKey;
  end;
  try
    qkTmp.Dslst := dmSvrIntf.SqlOpen('6',qkTmp.Pms);
    if qkTmp.Dslst = nil then
      Exit;

    lds := qkCommfunc.CreateDS(Self);
    lds.LogChanges := False;
    lds.AppendData(qktmp.Dslst[0].Data);
    FUserRights.Add(ADBname,lds);
  finally
    qkTmp.ReleaseDsLst;
    qkTmp.Freepms;
  end;
end;

procedure TfrmqkMainApp.lv1DblClick(Sender: TObject);
  type
    TEndterProc = procedure (AParent: TWinControl; AModIDKey: int64); stdcall;
var
  LItem: TListItem;
  LIDKey: int64;
  BFind: Boolean;
  LTS: TTabSheet;
  I: Integer;
  LBplName: string;
  LHandle: THandle;
  LEnter: TEndterProc;
begin
  BFind := False;
  LItem := (sender as TRzListView).Selected;
  if LItem <> nil then
  begin
    LIDKey := Int64(LItem.Data);
    if mtMod.Locate('IDKey',LIDKey,[]) then
    begin
      LBplName := mtMod.FieldByName('LibName').AsString;
      try
        if not FLibList.TryGetValue(LBplName,LHandle) then
        begin
          LHandle := LoadPackage(LBplName);
          FLibList.Add(LBplName,LHandle);
        end;
      except on E: Exception do
        begin
          ShowMessage(e.Message);
          Exit;
        end;
      end;

      pgc1.ActivePageIndex := 1;
      for I := 0 to pgc2.PageCount - 1 do
      begin
        if pgc2.Pages[I].Tag = LIDKey then
        begin
          BFind := True;
          pgc2.ActivePageIndex := I;
          Break;
        end;
      end;
      if not BFind then
      begin
        LTS := TTabSheet.Create(pgc2);
        LTS.PageIndex := pgc2.PageCount;
        LTS.Caption := mtMod.FieldByName('ModName').AsString;
        LTS.PageControl := pgc2;
        LTS.Tag := LIDKey;
        pgc2.ActivePage := LTS;
        try
          LEnter := GetProcAddress(LHandle,'Enter');
          LEnter(LTS,LIDKey);
        except on E: Exception do
          ShowMessage(e.Message);
        end;
      end;
    end;
  end;
end;

procedure TfrmqkMainApp.lv1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FHotItem := lv1.GetItemAt(x,y);
  if (Button = mbRight) and (lv1.GetItemAt(x,Y) <> nil) then
  begin
    pm1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TfrmqkMainApp.lv2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FHotItem := lv2.GetItemAt(x,y);
  if (Button = mbRight) and (lv2.GetItemAt(x,Y) <> nil) then
  begin
    pm2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TfrmqkMainApp.mniChangeDBClick(Sender: TObject);
begin
  dmSvrIntf.FDefConName :=  (Sender as TMenuItem).Caption;
  stat1.Panels[1].Text := dmSvrIntf.FDefConName;
  LoadUserRights(dmSvrIntf.FDefConName);
  ShowMessage('账套已经切换为： ' + dmSvrIntf.FDefConName);
end;

procedure TfrmqkMainApp.mniChangePswClick(Sender: TObject);
var
  LLblArr: array [0..1] of string;
  LPswArr: array [0..1] of string;
begin
  //LLblArr[0] := #30 + '原始密码：';
  LLblArr[0] := #30 + '新密码：';
  LLblArr[1] := #30 + '确认新密码：';
  if InputQuery('修改密码',LLblArr,LPSwArr,ChangePswFrmOnClose) then
  begin


  end;
end;

procedure TfrmqkMainApp.mniChangeSkinClick(Sender: TObject);
begin
//  TStyleManager.SetStyle(TStyleManager.StyleNames[(Sender as TMenuItem).Tag]);
//  if FSkinIndex > Length(TStyleManager.StyleNames) - 1 then
//    FSkinIndex := 1
//  else
//    Inc(FSkinIndex);
//
//  stat1.Panels[2].Text := TStyleManager.StyleNames[FSkinIndex];
end;

procedure TfrmqkMainApp.mniMainMenuClick(Sender: TObject);
  type
    TEndterProc = procedure (AParent: TWinControl; AModIDKey: int64); stdcall;
var
  LItem: TMenuItem;
  LIDKey: int64;
  BFind: Boolean;
  LTS: TTabSheet;
  I: Integer;
  LBplName: string;
  LHandle: THandle;
  LEnter: TEndterProc;
begin
  BFind := False;
  LItem := (sender as TMenuItem);
  if LItem <> nil then
  begin
    LIDKey := StrToInt64(LItem.Hint);
    if mtMod.Locate('IDKey',LIDKey,[]) then
    begin
      LBplName := mtMod.FieldByName('LibName').AsString;
      try
        if not FLibList.TryGetValue(LBplName,LHandle) then
        begin
          LHandle := LoadPackage(LBplName);
          FLibList.Add(LBplName,LHandle);
        end;
      except on E: Exception do
        begin
          ShowMessage(e.Message);
          Exit;
        end;
      end;

      pgc1.ActivePageIndex := 1;
      for I := 0 to pgc2.PageCount - 1 do
      begin
        if pgc2.Pages[I].Tag = LIDKey then
        begin
          BFind := True;
          pgc2.ActivePageIndex := I;
          Break;
        end;
      end;
      if not BFind then
      begin
        LTS := TTabSheet.Create(pgc2);
        LTS.PageIndex := pgc2.PageCount;
        LTS.Caption := mtMod.FieldByName('ModName').AsString;
        LTS.PageControl := pgc2;
        LTS.Tag := LIDKey;
        pgc2.ActivePage := LTS;
        try
          LEnter := GetProcAddress(LHandle,'Enter');
          LEnter(LTS,LIDKey);
        except on E: Exception do
          ShowMessage(e.Message);
        end;
      end;
    end;
  end;
end;

procedure TfrmqkMainApp.mniRefreshSvrBufferClick(Sender: TObject);
begin
  if dmSvrIntf.RefreshSqlBuffer() then
    ShowMessage('ok');
end;

procedure TfrmqkMainApp.N1Click(Sender: TObject);
const
  SQLNAME = 'Sys.ModLike';
  procedure Like(bLike: Integer);
  var
    LPms: TFDParams;
    LItem: TListItem;
    LImgFile: string;
    LIco: TIcon;
    I: Integer;
  begin
    if mtMod.Locate('IDKey',Integer(FHotItem.Data),[loCaseInsensitive]) then
    begin
      if mtMod.FieldByName('Blike').AsInteger = bLike then
        Exit;

      mtMod.Edit;
      mtMod.FieldByName('BLike').AsInteger := bLike;
      mtMod.Post;
      mtMod.MergeChangeLog;
      LPms := TFDParams.Create;
      try

        with LPms.Add do
        begin
          Name := 'p1';
          Value := bLike;
        end;
        with LPms.Add do
        begin
          Name := 'p2';
          Value := mtMod.FieldByName('UserModIDKey').AsLargeInt;
        end;
        if not dmSvrIntf.SqlExec(SQLNAME,LPms) then
        begin
          Exit;
        end else
        begin
          if bLike = 1 then
          begin
            LItem := lv2.Items.Add;
            LItem.Caption := mtMod.FieldByName('ModName').AsString;
            LItem.Data := Pointer(mtMod.FieldByName('IDKey').AsInteger);
            LImgFile := ExtractFilePath(ParamStr(0)) + 'Images\ModImages\' + mtMod.FieldByName('IDKey').AsString + '.ico';
            if FileExists(LImgFile) then
            begin
              LIco := TIcon.Create;
              try
                LIco.LoadFromFile(LImgFile);
                LItem.ImageIndex := ilLike.AddIcon(LIco);
                LIco.Free;
              except
                LIco.Free;
              end;
            end else
            begin
              ilLike.AddIcon(nil);
            end;
          end else
          begin
            for I := 0 to lv2.Items.Count - 1 do
            begin
              if Integer(lv2.Items[I].Data) = mtMod.FieldByName('IDKey').AsInteger then
              begin
                lv2.Items.Delete(I);
                Exit;
              end;
            end;
          end;
        end;
      finally
        LPms.Free;
      end;
    end;
  end;

begin
  if FHotItem <> nil then
  begin
    if (Sender as TMenuItem).Tag = 0 then
      Like(1)
    else
      Like(0);
  end;
end;

procedure TfrmqkMainApp.pgc2Close(Sender: TObject; var AllowClose: Boolean);
begin
  AllowClose := True;
end;

procedure TfrmqkMainApp.RzGroup1CanClose(Sender: TObject;
  var CanClose: Boolean);
begin
  pgcWorkSpace.ActivePageIndex := 1;
end;

procedure TfrmqkMainApp.RzGroup1Items0Click(Sender: TObject);
var
  LImgFile: string;
  LItem: TListItem;
  LIcon: TIcon;
begin
  pgcWorkSpace.ActivePage := tsMod;;
  lv1.Clear;
  ilMod.Clear;
  mtMod.Filter := 'ParentIDKey = ' + (Sender as TRzGroupItem).Tag.ToString;
  mtMod.Filtered := True;
  mtMod.First;
  mtMod.DisableControls;
  while not mtMod.Eof do
  begin
    LItem := lv1.Items.Add;
    LItem.Caption := mtMod.FieldByName('ModName').AsString;
    LItem.Data := Pointer(mtMod.FieldByName('IDKey').AsInteger);
    LImgFile := ExtractFilePath(ParamStr(0)) + 'Images\ModImages\' + mtMod.FieldByName('IDKey').AsString + '.ico';
    if FileExists(LImgFile) then
    begin
      LIcon := TIcon.Create;
      try
        LIcon.LoadFromFile(LImgFile);
        LItem.ImageIndex := ilMod.AddIcon(LIcon);
        LIcon.Free;
      except
        LIcon.Free;
      end;
    end else
    begin
      ilMod.AddIcon(nil);
    end;
    mtMod.Next;
  end;
  mtMod.Filtered := False;
end;

procedure TfrmqkMainApp.RzGroup1Open(Sender: TObject);
begin
  pgcWorkSpace.ActivePageIndex := 1;
end;

end.
