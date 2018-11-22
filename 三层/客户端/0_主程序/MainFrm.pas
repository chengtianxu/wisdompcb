{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,uCommFunc, IdGlobal,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,
  IdFTPList, Vcl.Buttons, Vcl.CategoryButtons, Vcl.ComCtrls, RzGroupBar,
  Vcl.ImgList, System.Generics.Collections, Vcl.Menus, RzTabs, Vcl.XPMan,
  Vcl.ToolWin, Data.SqlExpr, Data.DBXCommon;

type


  TfrmMain = class(TForm)
    tmr1: TTimer;
    idftp1: TIdFTP;
    stat1: TStatusBar;
    il1: TImageList;
    il2: TImageList;
    cds419: TClientDataSet;
    ilItem: TImageList;
    pmCloseMod: TPopupMenu;
    mniCloseMod: TMenuItem;
    pgc1: TRzPageControl;
    tsDeskTop: TRzTabSheet;
    gb1: TRzGroupBar;
    pnl3: TPanel;
    pnl1: TPanel;
    spl1: TSplitter;
    lbl1: TLabel;
    lvLikeItem: TListView;
    lvItems: TListView;
    xpmnfst1: TXPManifest;
    ilLike: TImageList;
    pmLike: TPopupMenu;
    mniAddLike: TMenuItem;
    pmDeleLike: TPopupMenu;
    mniDeleLike: TMenuItem;
    mm1: TMainMenu;
    mniExit: TMenuItem;
    ilTooBar: TImageList;
    mniN1: TMenuItem;
    mniEditPsw: TMenuItem;
    tmr2: TTimer;
    tmr3: TTimer;
    mniChangeSkin: TMenuItem;
    procedure tmr1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvItemsDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mniCloseModClick(Sender: TObject);
    procedure pgc1Close(Sender: TObject; var AllowClose: Boolean);
    procedure pgc1Change(Sender: TObject);
    procedure mniAddLikeClick(Sender: TObject);
    procedure mniMainMenuClick(sender: TObject);
    procedure lvItemsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mniDeleLikeClick(Sender: TObject);
    procedure lvLikeItemMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mniExitClick(Sender: TObject);
    procedure mniEditPswClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmr2Timer(Sender: TObject);
    procedure tmr3Timer(Sender: TObject);
    procedure mniChangeSkinClick(Sender: TObject);
  private
    { Private declarations }
    FBplHandleList: TDictionary<string,THandle>;
    FUpdatetime: TDateTime;
    procedure GroupItemClick(Sender: TObject);
    procedure ChangePswFrmOnClose(Sender: TObject; const Values: array of string; var CanClose: Boolean);
  public
    { Public declarations }
    function UpdateERPLauncher: Boolean;
    function DownLoadErpSysFile(AFileDS,AFtpDS: TDataSet): Boolean;
    function LoadMenu: Boolean;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  Vcl.Themes, uSvrIntf, system.DateUtils;


{$R *.dfm}

procedure TfrmMain.ChangePswFrmOnClose(Sender: TObject;
  const Values: array of string; var CanClose: Boolean);
var
  LCds: TClientDataSet;
begin
  if Values[1] <> Values[2] then
  begin
    ShowMessage('两次输入的密码不同，请确认！！');
    CanClose := False;
    Exit;
  end;
  LCds := TClientDataSet.Create(Self);
  try
    if not gSvrIntf.IntfGetDataBySql('select * from data0073 where rkey = ' + gVar.rkey73,LCds) then
    begin
      ShowMessage('取得原始密码错误');
      CanClose := False;
      Exit;
    end;

    if LCds.IsEmpty then
    begin
      ShowMessage('不存在的用户');
      CanClose := False;
      Exit;
    end;

    if LCds.FieldByName('PASSWORD').AsString.ToUpper <> gSysFunc.MD5Print(Values[0]).ToUpper then
    begin
      ShowMessage('原始密码输入错误');
      CanClose := False;
      Exit;
    end;

    LCds.Edit;
    LCds.FieldByName('PASSWORD').AsString := gSysFunc.MD5Print(Values[1]);
    LCds.Post;

    if not gSvrIntf.IntfPostDataByTable('data0073',LCds.Delta) then
    begin
      ShowMessage('修改密码失败');
      CanClose := False;
    end else
    begin
      ShowMessage('修改密码成功');
    end;
  finally
    LCds.Free;
  end;
end;

function TfrmMain.DownLoadErpSysFile(AFileDS,AFtpDS: TDataSet): Boolean;
var
  LDir: string;
  LBNeedDown: Boolean;
  LBCheckByVer: Boolean;
  LLocalFileName: string;
  LTmpDatetime: TDateTime;
  LTmpStr: string;
  I: Integer;
begin
  AFileDS.First;
  while not AFileDS.Eof do
  begin
    LDir := AFileDS.FieldByName('DestDir').AsString;
    if LDir[Length(LDir)] <> '\' then
    begin
      LDir := LDir + '\';
      AFileDS.Edit;
      AFileDS.FieldByName('DestDir').AsString := LDir;
      AFileDS.Post;
    end;
    AFileDS.Next;
  end;
  AFileDS.First;
  while not AFileDS.Eof do
  begin
    Application.ProcessMessages;
    LBNeedDown := False;
    LBCheckByVer := AFileDS.FieldByName('CheckByVer').AsInteger = 1;
    LLocalFileName := AFileDS.FieldByName('DestDir').AsString +
      AFileDS.FieldByName('DestFileName').AsString;
    if not fileexists(LLocalFileName) then
      LBNeedDown := True;
    if not LBNeedDown then
    begin
      if LBCheckByVer then
      begin
        LBNeedDown := gSysFunc.GetFileVersion(LLocalFileName) <>
          AFileDS.FieldByName('LastVersion').AsString;
      end
      else
      begin
        LTmpDatetime := gSysFunc.GetFileModifyTime(LLocalFileName);
        if LTmpDatetime < AFileDS.FieldByName('LastModifyTime').AsDateTime
        then
          LBNeedDown := True;
      end;
    end;

    if LBNeedDown then
    begin
      if not DirectoryExists(AFileDS.FieldByName('DestDir').AsString) then
        CreateDir(AFileDS.FieldByName('DestDir').AsString);

      {$REGION '判断本地文件是否占用'}
      if gSysFunc.IsFileInUse(AFileDS.FieldByName('DestDir').AsString + AFileDS.FieldByName('DestFileName').AsString) then
      begin
        //sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'InUse';
        AFileDS.Next;
        Continue;
      end;
      {$ENDREGION}

      if not AFtpDS.Locate('FtpID',AFileDS.FieldByName('Ftp_Ptr').AsInteger,[loCaseInsensitive]) then
      begin
        //sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_NotFind';
        AFileDS.Next;
        Continue;
      end;

      {$REGION '连接FTP开始下载'}
      if not idftp1.Connected then
      begin
        idftp1.Host := AFtpDS.FieldByName('FtpIP').AsString;
        idftp1.Port := AFtpDS.FieldByName('FtpPort').AsInteger;
        idftp1.Username := AFtpDS.FieldByName('FtpUserName').AsString;
        idftp1.Password := AFtpDS.FieldByName('FtpPassWord').AsString;
        try
          idftp1.Connect;
        except
          //sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_ConnetError';
        end;
      end else
      begin
        if (idftp1.Host <> AFtpDS.FieldByName('FtpIP').AsString) or
           (idftp1.Port <> AFtpDS.FieldByName('FtpPort').AsInteger) or
           (idftp1.Username <> AFtpDS.FieldByName('FtpUserName').AsString) or
           (idftp1.Password <> AFtpDS.FieldByName('FtpPassWord').AsString)
        then
        begin
          idftp1.Disconnect;
          idftp1.Host := AFtpDS.FieldByName('FtpIP').AsString;
          idftp1.Port := AFtpDS.FieldByName('FtpPort').AsInteger;
          idftp1.Username := AFtpDS.FieldByName('FtpUserName').AsString;
          idftp1.Password := AFtpDS.FieldByName('FtpPassWord').AsString;
          try
            idftp1.Connect;
          except
            //sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_ConnetError';
          end;
        end;
      end;

      if idftp1.Connected then
      begin
        LtmpStr := AFileDS.FieldByName('FtpDir').AsString;
        if LtmpStr <> '' then
        begin
          if LtmpStr[Length(LtmpStr)] = '\' then
            LtmpStr[Length(LtmpStr)] := ' ';
          if Trim(LtmpStr) <> Trim(idftp1.RetrieveCurrentDir) then
          begin
            idftp1.ChangeDir(LtmpStr);
          end;
        end else
        begin
          LtmpStr := AFtpDS.FieldByName('FtpDir').AsString;
          if LtmpStr <> '' then
          begin
            if LtmpStr[Length(LtmpStr)] = '\' then
              LtmpStr[Length(LtmpStr)] := ' ';
            if Trim(LtmpStr) <> Trim(idftp1.RetrieveCurrentDir) then
            begin
              idftp1.ChangeDir(LtmpStr);
            end;
          end;
        end;
        idftp1.List;
        //LBExistInFtp := False;
        for I := 0 to idftp1.DirectoryListing.Count - 1 do
        begin
          if (idftp1.DirectoryListing.Items[I].FileName.ToUpper = AFileDS.FieldByName('FtpFileName').AsString.ToUpper) and
             (idftp1.DirectoryListing.Items[I].ItemType = ditFile)
          then
          begin
            //LBExistInFtp := true;
            try
              idftp1.Get(idftp1.DirectoryListing.Items[I].FileName,AFileDS.FieldByName('DestDir').AsString +
                    AFileDS.FieldByName('DestFileName').AsString,True,False);
              //sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'OK!';
            except
              //sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_DownError';
            end;
          end;
        end;
        //if not LBExistInFtp then
          //sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_FileNoExist';
      end;
      {$ENDREGION}

      //sgUpdateFiles.RowCount := sgUpdateFiles.RowCount + 1;

    end;
    AFileDS.Next;
  end;
  Result := True;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  LCds: TClientDataSet;
begin
  if MessageBox(Handle,'是否退出ERP系统？','提示',MB_YESNO) <> IDYES then
  begin
    Action := caNone;
    Exit;
  end;

  Action := caFree;
  Exit;
  if gVar.FourceEXITCode = 0 then
  begin
    LCds := TClientDataSet.Create(Self);
    try
      if gSvrIntf.IntfGetDataBySql('select * from data0073 where rkey = ' + gVar.rkey73,LCds) then
      begin
        if not LCds.IsEmpty then
        begin
          if (LCds.FieldByName('COMPUTER').AsString = gSysFunc.GetComputerName.ToUpper) then
          begin
            LCds.Edit;
            LCds.FieldByName('COMPUTER').AsString := '';
            LCds.Post;
            gSvrIntf.IntfPostDataByTable('data0073',LCds.Delta);
          end;
        end;
      end;
    finally
      LCds.Free;
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FBplHandleList := TDictionary<string,THandle>.Create;
  gMainFrmModPageCtr := pgc1;
  LoadMenu;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  FBplHandleList.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  Self.Caption := Self.Caption + ' ' + gVar.SvrDB;
  stat1.Panels[0].Text := gVar.SvrIP;
  stat1.Panels[1].Text := gVar.SvrDB;
  stat1.Panels[2].Text := gVar.UserName05;

  tmr1.Enabled := True;
end;

procedure TfrmMain.GroupItemClick(Sender: TObject);
var
  LKey:integer;
  LItem: TListItem;
  LBmp: TBitmap;
  LFile: string;

begin
  lvItems.Clear;
  ilItem.Clear;
  LKey := (sender as TRzGroupItem).Tag;
  cds419.Filter := 'manu_ptr=' + IntToStr(LKey);
  cds419.Filtered := True;
  cds419.First;
  while not cds419.Eof do
  begin
    LItem := lvItems.Items.Add;
    LItem.Caption := cds419.FieldByName('Description').AsString;
    LItem.ImageIndex := ilItem.Count;
    LItem.Data := Pointer(cds419.FieldByName('ModID').AsInteger);

    LFile := ExtractFilePath(ParamStr(0)) + 'ModImages\' + cds419.FieldByName('ModID').AsString + '.bmp';
    if FileExists(LFile) then
    begin
      LBmp := TBitmap.Create;
      try
        LBmp.LoadFromFile(LFile);
        ilItem.Add(LBmp,LBmp);
      except
        LBmp.Free;
      end;
    end else
    begin
      ilItem.Add(nil,nil);
    end;

    cds419.Next;
  end;
end;

function TfrmMain.LoadMenu: Boolean;
var
  LCds1,LCds2,LCdsLike: TClientDataSet;
  LSql1,LSql2,LSql3,LSql4: string;
  tmp_Group:TRzGroup;
  tmp_Item:TRzGroupItem;

  LItem: TListItem;
  LBmp: TBitmap;
  LFile: string;
  top_menu,sec_menu,third_menu: TMenuItem;

begin
  Result := False;
  LCds1 := TClientDataSet.Create(Self);
  LCds2 := TClientDataSet.Create(Self);
  LCdsLike := TClientDataSet.Create(Self);
  try
    //加载一级菜单
    LSql1 := ' SELECT rkey,DESCRIPTION, image_index FROM SYSTEM_MAIN order by seq_no asc';
    LSql2 := ' SELECT RKEY,DESCRIPTION,image_index,main_ptr FROM SYSTEM_MENU order by main_ptr asc ,seq_no asc';
//    LSql3 := ' SELECT d74.FAVORIATE,d419.BPLName,d419.DESCRIPTION,d419.manu_ptr,d419.ModID,d74.FAVORIATE FROM Data0419 d419 ' +
//             ' INNER JOIN Data0074 d74 ON d419.RKEY = d74.FUNCTION_ID ' +
//             ' WHERE d74.USER_PTR = ' + gVar.rkey73 + ' AND ISNULL(d74.AuthList,'''') <> ''''' +
//             ' ORDER BY d419.manu_ptr ASC,d419.SEQ_NO ASC ';
    LSql3 := ' select * from ( SELECT d419.RKEY,d419.BPLName,d419.DESCRIPTION,d419.manu_ptr,d419.ModID,d419.SEQ_NO FROM Tier3_UserModAuthCards ' +
             ' INNER JOIN Tier3_ModAuthCard on Tier3_ModAuthCard.IDKey = Tier3_UserModAuthCards.ModAuthCard_IDKey ' +
              ' INNER JOIN Data0419 d419 ON d419.ModID = Tier3_UserModAuthCards.ModID '+
              ' WHERE Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND D73_Ptr = ' + gVar.rkey73 +
            ' UNION ' +
            ' SELECT d419.RKEY,d419.BPLName,d419.DESCRIPTION,d419.manu_ptr,d419.ModID,d419.SEQ_NO FROM Tier3_UserAddsModOperator ' +
            ' INNER JOIN Tier3_UserModAuthCards on Tier3_UserAddsModOperator.MasterUserCard_IDKey = Tier3_UserModAuthCards.IDKey ' +
            ' INNER JOIN Data0419 d419 ON d419.ModID = Tier3_UserAddsModOperator.ModID ' +
            ' INNER JOIN Tier3_ModAuthCard on Tier3_UserModAuthCards.ModAuthCard_IDKey = Tier3_ModAuthCard.IDKey ' +
            ' WHERE Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND (getdate() BETWEEN BeginTime AND EndTime) ' +
            ' AND Tier3_UserAddsModOperator.D73_Ptr = ' + gVar.rkey73 +
            ' ) as t1 ORDER BY t1.manu_ptr ASC,t1.SEQ_NO ASC ';


    LSql4 := ' SELECT d419.RKEY,d419.BPLName,d419.DESCRIPTION,d419.manu_ptr,d419.ModID FROM Tier3_UserModAuthCards ' +
             ' INNER JOIN Tier3_ModAuthCard on Tier3_ModAuthCard.IDKey = Tier3_UserModAuthCards.ModAuthCard_IDKey ' +
              ' INNER JOIN Data0419 d419 ON d419.ModID = Tier3_UserModAuthCards.ModID '+
              ' INNER JOIN Tier3_Favoriate on Tier3_Favoriate.ModID = d419.ModID AND Tier3_Favoriate.D73_ptr = Tier3_UserModAuthCards.D73_Ptr ' +
              ' WHERE Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND Tier3_UserModAuthCards.D73_Ptr = ' + gVar.rkey73 +
            ' UNION ' +
            ' SELECT d419.RKEY,d419.BPLName,d419.DESCRIPTION,d419.manu_ptr,d419.ModID FROM Tier3_UserAddsModOperator ' +
            ' INNER JOIN Tier3_UserModAuthCards on Tier3_UserAddsModOperator.MasterUserCard_IDKey = Tier3_UserModAuthCards.IDKey ' +
            ' INNER JOIN Data0419 d419 ON d419.ModID = Tier3_UserAddsModOperator.ModID ' +
            ' INNER JOIN Tier3_ModAuthCard on Tier3_UserModAuthCards.ModAuthCard_IDKey = Tier3_ModAuthCard.IDKey ' +
            ' INNER JOIN Tier3_Favoriate on Tier3_Favoriate.ModID = d419.ModID AND Tier3_Favoriate.D73_ptr = Tier3_UserModAuthCards.D73_Ptr ' +
            ' WHERE Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND (getdate() BETWEEN BeginTime AND EndTime) ' +
            ' AND Tier3_UserAddsModOperator.D73_Ptr = ' + gVar.rkey73;

    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql1,lsql2,LSql3,LSql4]),[LCds1,LCds2,cds419,LCdsLike]) then Exit;

    while not LCds1.Eof do  //加载一级菜单
    begin
      tmp_Group := TRzGroup.Create(gb1);
      tmp_Group.Caption := LCds1.fieldbyName('Description').AsString;
      tmp_Group.ItemStyle := isLarge;
      tmp_group.captionimageindex:=LCds1.fieldbyName('Image_Index').Asinteger;
      tmp_Group.Close;

      top_menu:=tmenuitem.Create(self);
      top_menu.Caption:= LCds1.fieldbyName('Description').AsString;
      top_menu.ImageIndex:= LCds1.fieldbyName('Image_Index').Asinteger;
      mm1.Items.Add(top_menu);

      LCds2.Filter:='main_ptr=' + LCds1.fieldbyName('rkey').AsString;
      LCds2.Filtered := True;
      LCds2.First;
      while not LCds2.Eof do    //加载二级菜单
      begin
        tmp_Item:= tmp_Group.Items.Add;
        tmp_Item.Caption := LCds2.fieldbyName('Description').AsString;
        tmp_Item.Tag := LCds2.fieldbyName('rKey').Asinteger;
        tmp_Item.ImageIndex := LCds2.fieldbyName('Image_Index').Asinteger;
        tmp_Item.OnClick:= GroupItemClick;

        sec_menu:=tmenuitem.Create(self);
        sec_menu.Caption:= lcds2.fieldbyName('Description').AsString;
        mm1.Items[mm1.Items.Count-1].Add(sec_menu);

        cds419.Filter := 'manu_ptr=' + IntToStr(tmp_Item.Tag);
        cds419.Filtered := True;
        cds419.First;
        while not cds419.Eof do
        begin
          third_menu:=tmenuitem.Create(self);
          third_menu.Caption:=StringReplace(trim(cds419.FieldByName('DESCRIPTION').AsString),' ','',[rfReplaceAll]);
          third_menu.Tag := cds419.FieldByName('modid').AsInteger;
          third_menu.OnClick := mniMainMenuClick;
          sec_menu.Insert(sec_menu.Count,third_menu);

          cds419.Next;
        end;

        LCds2.Next;
      end;
      gb1.AddGroup(tmp_Group);
      LCds1.Next;
    end;

    //加载收藏菜单
    LCdsLike.First;
    while not LCdsLike.Eof do
    begin
      LItem := lvLikeItem.Items.Add;
      LItem.Caption := LCdsLike.FieldByName('Description').AsString;
      LItem.ImageIndex := ilLike.Count;
      LItem.Data := Pointer(LCdsLike.FieldByName('ModID').AsInteger);

      LFile := ExtractFilePath(ParamStr(0)) + 'ModImages\' + LCdsLike.FieldByName('ModID').AsString + '.bmp';
      if FileExists(LFile) then
      begin
        LBmp := TBitmap.Create;
        try
          LBmp.LoadFromFile(LFile);
          ilLike.Add(LBmp,LBmp);
        except
          LBmp.Free;
        end;
      end else
      begin
        ilLike.Add(nil,nil);
      end;

      LCdsLike.Next;
    end;

    Result := True;
  finally
    LCds1.Free;
    LCds2.Free;
    LCdsLike.Free;
  end;
end;

procedure TfrmMain.lvItemsDblClick(Sender: TObject);
const
  INTFFUNCNAME = 'EnterMod';
type
  TPF = procedure (AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
var
  LItem: TListItem;
  LBplHandle: THandle;
  PF: Pointer;
  LModFrm: TForm;
  LTS: TRZTabSheet;
  LModFrmData: TModFrmInfo;

  LBplFIle: string;
begin
  LItem := (sender as TListView).Selected;
  if LItem <> nil then
  begin
    if gActiveModList.TryGetValue(Integer(LItem.Data),LModFrmData) then
    begin
      pgc1.ActivePage := LModFrmData.ModTab;
      Exit;
    end;

    cds419.Filtered := False;
    if cds419.Locate('modid',Integer(LItem.Data),[loCaseInsensitive]) then
    begin
      if not FBplHandleList.TryGetValue(cds419.FieldByName('bplname').AsString,LBplHandle) then
      begin
        LBplFIle := ExtractFilePath(ParamStr(0)) + cds419.FieldByName('bplname').AsString;
        if not FileExists(LBplFIle) then
        begin
          ShowMessage(cds419.FieldByName('bplname').AsString + ' 不存在!');
          Exit;
        end;
        LBplHandle := LoadPackage(LBplFIle);
        FBplHandleList.Add(cds419.FieldByName('bplname').AsString,LBplHandle);
      end;

      PF := GetProcAddress(LBplHandle,INTFFUNCNAME);
      if PF <> nil then
      begin
        LTS := TRZTabSheet.Create(pgc1);
        LTS.PageIndex := pgc1.PageCount;
        LTS.Caption := cds419.FieldByName('DESCRIPTION').AsString;
        LTS.Hint := cds419.FieldByName('DESCRIPTION').AsString;
        LTS.PageControl := pgc1;
        LTS.Tag := Integer(LItem.Data);

        TPF(PF)(LTS,LModFrm,Integer(LItem.Data));
        if LModFrm <> nil then
        begin
          pgc1.ActivePage := LTS;
          LModFrmData.ModFrm := LModFrm;
          LModFrmData.ModID := Integer(LItem.Data);
          LModFrmData.ModTab := LTS;
          gActiveModList.Add(LModFrmData.ModID,LModFrmData);
        end else
        begin
          LTS.Free;
          ShowMessage('加载模块错误');
        end;
      end;
    end;
  end;
end;


procedure TfrmMain.lvItemsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbRight) and (lvItems.GetItemAt(x,Y) <> nil) then
  begin
    pmLike.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TfrmMain.lvLikeItemMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbRight) and (lvLikeItem.GetItemAt(X,Y) <> nil) then
  begin
    pmDeleLike.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

procedure TfrmMain.mniAddLikeClick(Sender: TObject);
var
  LItem,LItemLike: TListItem;
  LModID: Integer;
  LCdsLike: TClientDataSet;
  LFile: string;
  LBmp: TBitmap;
  LSql: string;
begin
  LItem := lvItems.Selected;
  if LItem <> nil then
  begin
    LModID := Integer(LItem.Data);
    LCdsLike := TClientDataSet.Create(Self);
    try
      LSql := 'select * from Tier3_Favoriate where Modid=' + IntToStr(LModID) + ' and d73_ptr=' + gVar.rkey73;
      if gSvrIntf.IntfGetDataBySql(LSql,LCdsLike) then
      begin
        if LCdsLike.IsEmpty then
        begin
          LCdsLike.Append;
          LCdsLike.FieldByName('ModID').AsInteger := LModID;
          LCdsLike.FieldByName('d73_ptr').AsString := gVar.rkey73;
          LCdsLike.Post;

          if gSvrIntf.IntfPostDataByTable('Tier3_Favoriate',LCdsLike.Delta) then
          begin
            cds419.Filtered := False;
            if cds419.Locate('modid',LModID,[loCaseInsensitive]) then
            begin

              LItemLike := lvLikeItem.Items.Add;
              LItemLike.Caption := LItem.Caption;
              LItemLike.ImageIndex := ilLike.Count;
              LItemLike.Data := LItem.Data;

              LFile := ExtractFilePath(ParamStr(0)) + 'ModImages\' + cds419.FieldByName('ModID').AsString + '.bmp';

              LBmp := TBitmap.Create;
              try
                LBmp.LoadFromFile(LFile);
                ilLike.Add(LBmp,LBmp);
              except
                LBmp.Free;
              end;
            end;
          end;
        end;
      end;
    finally
      LCdsLike.Free;
    end;
  end;
end;

var
  gSkinIndex: Integer = 0;
procedure TfrmMain.mniChangeSkinClick(Sender: TObject);
begin
  if gSkinIndex > Length(TStyleManager.StyleNames) - 1 then
    gSkinIndex := 1
  else
    Inc(gSkinIndex);
  TStyleManager.SetStyle(TStyleManager.StyleNames[gSkinIndex]);
  stat1.Panels[2].Text := TStyleManager.StyleNames[gSkinIndex];
end;

procedure TfrmMain.mniCloseModClick(Sender: TObject);
var
  LModFrmData: TModFrmInfo;
begin
  if gActiveModList.TryGetValue(pgc1.ActivePage.Tag,LModFrmData) then
  begin
    LModFrmData.ModFrm.Close;
    LModFrmData.ModTab.Free;
    pgc1.ActivePageIndex := 0;
    gActiveModList.Remove(LModFrmData.ModID);
  end;
end;

procedure TfrmMain.mniDeleLikeClick(Sender: TObject);
var
  LItem: TListItem;
  LCdsLike: TClientDataSet;
  LModID: Integer;
  LSql: string;
begin
  LItem := lvLikeItem.Selected;
  if LItem <> nil then
  begin
    LModID := Integer(LItem.Data);
    LCdsLike := TClientDataSet.Create(Self);
    try
      LSql := 'select * from Tier3_Favoriate where Modid=' + IntToStr(LModID) + ' and d73_ptr=' + gVar.rkey73;
      if gSvrIntf.IntfGetDataBySql(LSql,LCdsLike) then
      begin
        while not LCdsLike.IsEmpty do
        begin
          LCdsLike.Delete;
        end;
        if LCdsLike.ChangeCount > 0 then
          gSvrIntf.IntfPostDataByTable('Tier3_Favoriate',LCdsLike.Delta);
      end;
      lvLikeItem.DeleteSelected;
    finally
      LCdsLike.Free;
    end;
  end;
end;

procedure TfrmMain.mniEditPswClick(Sender: TObject);
var
  LLblArr: array [0..2] of string;
  LPswArr: array [0..2] of string;
begin
  LLblArr[0] := #30 + '原始密码：';
  LLblArr[1] := #30 + '新密码：';
  LLblArr[2] := #30 + '确认新密码：';
  if InputQuery('修改密码',LLblArr,LPSwArr,ChangePswFrmOnClose) then
  begin


  end;
end;

procedure TfrmMain.mniExitClick(Sender: TObject);
begin
  if MessageBox(Handle,'是否退出ERP系统','提示',MB_YESNO) = IDYES then
    Close;
end;

procedure TfrmMain.mniMainMenuClick(sender: TObject);
const
  INTFFUNCNAME = 'EnterMod';
type
  TPF = procedure (AParent: TWinControl; out outModMainFrm: TForm; AModID: Integer);stdcall;
var
  LItem: TMenuItem;
  LBplHandle: THandle;
  PF: Pointer;
  LModFrm: TForm;
  LTS: TRZTabSheet;
  LModFrmData: TModFrmInfo;

  LBplFIle: string;
begin
  LItem := (sender as TMenuItem);
  if LItem <> nil then
  begin
    if gActiveModList.TryGetValue(Integer(LItem.Tag),LModFrmData) then
    begin
      pgc1.ActivePage := LModFrmData.ModTab;
      Exit;
    end;

    cds419.Filtered := False;
    if cds419.Locate('modid',Integer(LItem.Tag),[loCaseInsensitive]) then
    begin
      if not FBplHandleList.TryGetValue(cds419.FieldByName('bplname').AsString,LBplHandle) then
      begin
        LBplFIle := ExtractFilePath(ParamStr(0)) + cds419.FieldByName('bplname').AsString;
        if not FileExists(LBplFIle) then
        begin
          ShowMessage(cds419.FieldByName('bplname').AsString + ' 不存在!');
          Exit;
        end;
        LBplHandle := LoadPackage(LBplFIle);
        FBplHandleList.Add(cds419.FieldByName('bplname').AsString,LBplHandle);
      end;

      PF := GetProcAddress(LBplHandle,INTFFUNCNAME);
      if PF <> nil then
      begin
        LTS := TRZTabSheet.Create(pgc1);
        LTS.PageIndex := pgc1.PageCount;
        LTS.Caption := cds419.FieldByName('DESCRIPTION').AsString;
        LTS.Hint := cds419.FieldByName('DESCRIPTION').AsString;
        LTS.PageControl := pgc1;
        LTS.Tag := Integer(LItem.Tag);

        TPF(PF)(LTS,LModFrm,Integer(LItem.Tag));
        if LModFrm <> nil then
        begin
          pgc1.ActivePage := LTS;
          LModFrmData.ModFrm := LModFrm;
          LModFrmData.ModID := Integer(LItem.Tag);
          LModFrmData.ModTab := LTS;
          gActiveModList.Add(LModFrmData.ModID,LModFrmData);
        end else
        begin
          LTS.Free;
          ShowMessage('加载模块错误');
        end;
      end;
    end;
  end;
end;

var
  i: integer = 1;

procedure TfrmMain.pgc1Change(Sender: TObject);
begin
  pgc1.ShowCloseButtonOnActiveTab := pgc1.ActivePageIndex <> 0;
end;

procedure TfrmMain.pgc1Close(Sender: TObject; var AllowClose: Boolean);
var
  LModFrmData: TModFrmInfo;
begin
  if pgc1.ActivePageIndex = 0 then
    AllowClose := False
  else
  begin
    if gActiveModList.TryGetValue(pgc1.ActivePage.Tag,LModFrmData) then
    begin
      LModFrmData.ModFrm.Close;
    end;
  end;
end;

procedure TfrmMain.tmr1Timer(Sender: TObject);
begin
{$IFNDEF DEBUG}
  if HoursBetween(Now(),FUpdatetime) >= 1 then
  begin
    FUpdatetime := Now();
    UpdateERPLauncher;
  end;
//  tmr1.Enabled := False;
{$ENDIF}
end;

procedure TfrmMain.tmr2Timer(Sender: TObject);
begin
  Exit;
  if GetTickCount - gVar.AutoCloseTCPTime > AUTODISCONNECTTCPLINK then
  begin
    if gSvrConDM.con1.ConnectionState = csStateOpen then
    begin
      gSvrConDM.con1.Close;
      if gSvrConDM.ServerMethods1Client <> nil then
      begin
        gSvrConDM.ServerMethods1Client.Free;
        gSvrConDM.ServerMethods1Client := nil;
      end;
    end;
  end;
end;

procedure TfrmMain.tmr3Timer(Sender: TObject);
var
  LCds: TClientDataSet;
  LErrMsg: string;
begin
  exit;
  UpdateERPLauncher;
  Exit;
{$IFNDEF DEBUG}
  LCds := TClientDataSet.Create(Self);
  try
    if gVar.FourceEXITCode = 0 then
    begin
      if gSvrIntf.IntfGetDataBySql('select COMPUTER from data0073 where rkey = ' + gVar.rkey73,LCds) then
      begin
        if LCds.IsEmpty then
        begin
          gVar.FourceEXITCode := 2;
          gSysFunc.GetFourceEXITMsg(LErrMsg);
          ShowMessage(LErrMsg);
        end else
        begin
          if LCds.FieldByName('COMPUTER').AsString <> gSysFunc.GetComputerName.ToUpper then
          begin
            gvar.FourceEXITCode := 1;
            gSysFunc.GetFourceEXITMsg(LErrMsg);
            ShowMessage(LErrMsg);
          end;
        end;
      end;
    end;
  finally
    LCds.Free;
  end;
{$ENDIF}
end;

function TfrmMain.UpdateERPLauncher: Boolean;
var
  LSql1,lsql2: string;
  LCdsFtp: TClientDataSet;
  LCdsFile: TClientDataSet;
begin
  Result := False;
  LCdsFtp := TClientDataSet.Create(Self);
  LCdsFile := TClientDataSet.Create(Self);
  try
    //取得ftp列表
    LSql1 := 'select * from Tier3_FtpList';

    //取得文件
    LSql2 := 'SELECT * FROM Tier3_SysFiles WHERE FileName IN (''ERPLauncher.exe'',''ERPLauncher.ini'')';

    if not gSvrIntf.IntfGetDataBySqlArr(VarArrayOf([LSql1,lsql2]),[LCdsFtp,LCdsFile]) then
      Exit;

    if LCdsFtp.IsEmpty then Exit;
    DownLoadErpSysFile(LCdsFile,LCdsFtp);

  finally
    LCdsFtp.Free;
    LCdsFile.Free;
  end;
end;


end.
