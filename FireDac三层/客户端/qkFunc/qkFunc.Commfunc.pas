unit qkFunc.Commfunc;

interface

//下面这个开关是关闭 Unit 'xxxxxx' is specific to a platform 这个Warning
{$WARN  UNIT_PLATFORM OFF}

{$WARN SYMBOL_PLATFORM OFF}

uses
  System.SysUtils, IdHashMessageDigest, IdGlobal, IdHash, Vcl.Dialogs,
  Winapi.WinSock, Winapi.Windows, Data.DB, System.IniFiles,System.Generics.Collections,
  System.Classes,Vcl.Forms,Vcl.Controls,Vcl.Graphics,IdGlobalProtocols,
  Vcl.Menus,qkFtpFrm, System.DateUtils, Winapi.Messages,Vcl.Grids,DBGridEh,
  qkFunc.FrmExistCheck,

  // --IDFtp
  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, IdFTPList,


  // --FireDac
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,

  //--
  qkSvrIntf.ClientIntf;

type
  TqkVar = record
    LoginIDKey: Int64;
    LoginName: string;//登陆账号
    LoginPsdMD5: string;//
    LoginIP: string;
    LoginTime: string;
    LoginDBName: string;
    LoginSvrIP: string;
    LoginFullName: string;//用户全名

    UserRights: TDictionary<string,TFDMemTable>; //主窗体变量
  end;

  TDownFileCallBackFunc = procedure(AFileName: string; Status: Integer; ANote: string) of object;

  TqkCommfunc = record
    function CloseModTab: Boolean;
    function GetLocalIP: string; // 获取本机IP
    function GetLocalCumputerName: string; // 获得电脑名称
    function Base64_Encode(DecryptedText: string): string;
    function Base64_Decode(a: string): string;
    function MD5Print(AStr: string): string; // 取得MD5
    function IsFileInUse(Afname: string): Boolean; // 文件是否被占用
    function GetFileVersion(FileName: string): String; // 得程序版本号
    function GetFileLastTime(const AFileName: string): TDateTime;//取得文件最后修改时间
    function GetFileSize(AFile: string): Int64;    //取得文件大小
    function GetIniValue(AFile,ASection,AKey: string): string;//取得INI的配置信息
    function DateTimeToStr(ADate: TDateTime): string;
    function StrToDateTime(AStr: string): TDateTime;
    function FloatToString(AValue: Extended): string;//浮点转字符
    procedure ReleaseDsList(ADsList: TList<TFDMemTable>);//消除接口返回的多个Ds

    function CreateDsList: TList<TFDMemTable>;
    function CreateIDKey(AConName: string;ACount: Integer;out AoutID: TArray<Int64>): Boolean;overload; //创建IDKEY最多一次创建99999个
    function CreateIDKey(ACount: Integer;out AoutID: TArray<Int64>): Boolean; overload; //创建IDKEY最多一次创建99999个
    function CreateIDKey: Int64; overload;
    function CreateDS(AOwner: TComponent): TFDMemTable;

    procedure SetFK(ADetailDS: TFDMemTable;AParentIDkey: Int64;AParentPtr: string = 'ParentIDKey');//设置字表主表的FK
    procedure SetAllIDKey(Ads: TFDMemTable);//设置全部IDkEY
    procedure SetToMousePositon(AFrm: TForm);//设置窗体位置
    procedure SetCurrIDKey(Ads: TFDMemTable;APost: Boolean = False);//设置当前IDKey

    function CheckSPRetParam(APms: TFDParams): Boolean; //检测sp返回来的参数
    function CheckErrChar(AStr: string): boolean;//检测字符串中时候包含无效字符

    procedure LoadPictureFromField(Field: TBlobField; Picture: TPicture);//数据库图片显示
    function StrInArr(AStr: string;Arr: TArray<string>): boolean;
    procedure PopMenuEnableSet(AMenu: TPopupMenu;ADataSet: TDataSet);//设置弹出菜单的enable 通用的新增，编辑，删除查看


    // 从FTP下载文件
    function DownLoadFileFromFtp(AFileDS, AFtpList: TDataSet; ACallBack: TDownFileCallBackFunc): Boolean;
    function CreateDownFileDS: TFDMemTable;//只有登陆在用
    function CreateDownFtpDS: TFDMemTable;//只有登陆在用


    function qkUpLoad(AFtpIp,APort,AUserName,APssword,AFtpDir,AFtpFileName,ALocalFile: string): Boolean;overload;
    //qkFtpname：sys_ftp表中
    function qkUpLoad(qkFtpName,AFtpDir,AFtpFileName,ALocalFile: string): Boolean;overload;
    function qkDownLoad(AFtpIp,APort,AUserName,APssword,AFtpDir,AFtpFileName,ALocalFile: string;AutoOpen: Boolean= True): Boolean;overload;
    //qkFtpname：sys_ftp表中
    function qkDownLoad(qkFtpname,AFtpDir,AFtpFileName,ALocalFile: string;AutoOpen: Boolean= True): Boolean;overload;

    //---取得记录的seed
    function GetSeed(ASeedName: string): string;

    //StringGrid 导出到excel
    function ExportSGtoExcel(ASg: TStringGrid): Boolean;
    function ExportEHtoExcel(AEh: TDBGridEh): Boolean;

  end;

  TqkRights = record
    function ModRights(AModID: Int64): TArray<string>;
    function CheckOperatorRight(AModID: int64;ARightID: Integer;BShowMessage: Boolean = True): boolean; //权限检查
  end;

  TqkDialog = record
    function DeleConfig: Boolean;
    function OperConfig: boolean;//是否确认此操作
    procedure DeleSucc;
    procedure NoRights;
    procedure SaveSucc;
    procedure OperSucc;
    function FormExist(AFrm: TForm): Boolean;//编辑show模式窗体，已经打开则提示是否切换还是重新打开;
    procedure CanNotSetParetnNoteToSelf;//树状图设置父亲节点失败
  end;

  TqkConst = record
    const MAINFORMLABLETS = '数据';
    const Right_Enter = 0; //查看主界面数据
    const Right_New = 1;   //新增
    const Right_Edit = 2;  //编辑
    const Right_ViewDetail = 3;//查看细节
    const Right_Dele = 4;  //删除
  end;

  TqkDataIntf = record
    function GetModData(AIDKey: Int64;AChild: Integer;AKeyValue: Int64) : TList<TFDMemTable>;
    /// <summary>
    /// AWhere 直接填写条件，已经有了Where
    /// </summary>
    function GetTableData(AFdMem: TFDMemTable; ATable,AWhere: string): Boolean;
    function DirectSqlOpen(AFdmem: TFDMemTable; ASql: string): Boolean;
    function DirectSqlExec(ASql: string): Boolean;

    function RefreshSqlBuffer(AConDefName: string;out AErrMsg: string): Boolean;overload;
    function RefreshSqlBuffer: Boolean;overload;

    function SqlOpen(AConDefName: string; ASqlName: string; AParams: TFDParams; AList: TList<TFDMemTable>;out AErrMsg: string): Boolean;overload;
    function SqlOpen(ASqlName: string; AParams: TFDParams;bShowErr: Boolean = True): TList<TFDMemTable>; overload;
    //
    function SpOpen(AConDefName,ASpName: string; AParams: TFDParams;AList: TList<TFDMemTable>; out AErrMsg: string): Boolean;overload;
    function SpOpen(ASpName: string; AParams: TFDParams;bShowErr: Boolean = True): TList<TFDMemTable>; overload;

    //存储过程中不能有数据集返回，否则回传参数会null
    function SpExec(AConDefName: string; ASpName: string; AParams: TFDParams; out AErrMsg: string): Boolean;overload;

    function SpExec(ASpName: string; AParams: TFDParams; bShowErr: Boolean = True): Boolean;overload;
    function SpExec(AConDefName: string;ASpName: string; AParams: TFDParams; bShowErr: Boolean = True): Boolean;overload;
    //提交数据
    function  PostDataByTableArr(AConDefName: string; AdsList: TList<TFDMemTable>; ATableArr: string; out AErrMsg: string): Boolean;overload;
    function  PostDataByTableArr(AdsList: TList<TFDMemTable>; ATableArr: string;bShowErr: Boolean = True): Boolean;overload;
    function  PostDataByTableArr(AdsArr: array of TFDMemTable; ATableArr: string;bShowErr: Boolean = True): Boolean;overload;
    function  PostDataByTable(AFireMtDs: TFDMemTable; ATable: string;bShowErr: Boolean = True): Boolean;

    //
    function SqlExec(AConDefName: string; ASqlName: string; AParams: TFDParams; out AErrMsg: string): Boolean;overload;
    function SqlExec(ASqlName: string; AParams: TFDParams;bShowErr: Boolean = True ): Boolean;overload;

    //有效期验证
    function RefreshRegTime(AConDefName: string; out AErrMsg: OleVariant): Boolean;
    function CheckALterRegDate(AConDefName: string; out AErrMsg: OleVariant): Integer;
    function UpdateRegCode(AConDefName: string; key1: string; key2: string; out AErrMsg: OleVariant): Boolean;

  end;

  TqkTmpVar =record
    private
     _mt: TFDMemTable;
     _tmpPms: TFDParams;
    public
    Dslst: TList<TFDMemTable>;
    function Pms: TFDParams;
    procedure ReleaseDsLst;
    procedure Freepms;
    function mt: TFDMemTable;
    procedure mtfree;

    procedure ClearAll;
    function CopyDsLstToMT(AMtArr: array of TFDMemTable): Boolean;
  end;
var
  qkCommfunc: TqkCommfunc;
  qkDialog: TqkDialog;
  qkConst: TqkConst;
  qkVar: TqkVar;
  qkDataIntf: TqkDataIntf;
  qkTmp: TqkTmpVar;
  qkRight: TqkRights;
implementation

uses
  system.StrUtils, DBGridEhImpExp;

{ TqkCommfunc }
const
  base64 = 'oeJzcNn7YV5ZKv+EhQaC3Xu/WiO24PDylRdqkGjI9TwUFrxL1bMHfpA6gsSt0Bm8';

function mimeencode(w: Integer): string;
begin
  if w >= 0 then
    result := copy(base64, w + 1, 1)
  else
    result := '';
end;

function mimedecode(a: string): Integer;
begin
  if Length(a) = 0 then
  begin
    result := -1;
    Exit;
  end;
  result := pos(a, base64) - 1;
end;

function TqkCommfunc.Base64_Decode(a: string): string;
var
  w1: Integer;
  w2: Integer;
  w3: Integer;
  w4: Integer;
  n: Integer;
  retry: string;
begin
  n := 1;
  while n <= Length(a) do
  begin
    w1 := mimedecode(a[n]);
    w2 := mimedecode(a[n + 1]);
    w3 := mimedecode(a[n + 2]);
    w4 := mimedecode(a[n + 3]);
    if w2 >= 0 then
      retry := retry + Char(((w1 * 4 + Trunc(w2 / 16)) and 255));
    if w3 >= 0 then
      retry := retry + Char(((w2 * 16 + Trunc(w3 / 4)) and 255));
    if w4 >= 0 then
      retry := retry + Char(((w3 * 64 + w4) and 255));
    n := n + 4;
  end;
  result := retry;

end;

function TqkCommfunc.Base64_Encode(DecryptedText: string): string;
var
  c1, c2, c3: Integer;
  w1, w2, w3, w4: Integer;
  n: Integer;
  retry: string;
begin
  n := 1;
  while n <= Length(DecryptedText) do
  begin
    c1 := ord(DecryptedText[n]);
    c2 := ord(DecryptedText[n + 1]);
    c3 := ord(DecryptedText[n + 2]);
    w1 := Trunc(c1 / 4);
    w2 := (c1 and 3) * 16 + Trunc(c2 / 16);
    if (Length(DecryptedText) >= n + 1) then
      w3 := (c2 and 15) * 4 + Trunc(c3 / 64)
    else
      w3 := -1;
    if (Length(DecryptedText) >= n + 2) then
      w4 := c3 and 63
    else
      w4 := -1;
    retry := retry + mimeencode(w1) + mimeencode(w2) + mimeencode(w3) + mimeencode(w4);
    n := n + 3;
  end;
  result := retry;
end;


function TqkCommfunc.CheckErrChar(AStr: string): boolean;
//const
//  ERRCHAR = ['+','-','*','/','%',
//    '=','!','>','<','&','|','||','~'];
  var
    I: Integer;
begin
  Result := False;
  for I := 1 to Length(AStr) do
  begin
    if not CharInSet(AStr[I],['a'..'z','A'..'Z','0'..'9','_']) then
    begin
      ShowMessage('必须是a-z,A-Z,0-9,"_" ,不能包含字符：' + astr[I]);
      Exit;
    end;
  end;
  Result := true;
end;

function TqkCommfunc.CheckSPRetParam(APms: TFDParams): Boolean;
var
  lpm: TFDParam;
begin
  Result := False;
  if not Assigned(APms) then
    Exit;
  lpm := APms.FindParam('@ret');
  if lpm = nil then
    Exit;
  if lpm.Value <> 1 then
  begin
    lpm := APms.FindParam('@errMsg');
    if lpm <> nil then
    begin
      ShowMessage(lpm.Value);
    end;
    Exit;
  end;
  Result := true;
end;

function TqkCommfunc.CloseModTab: Boolean;
begin
  PostMessage(Application.MainForm.Handle,WM_USER + 8998,0,0);
  Result := True;
end;

function TqkCommfunc.CreateDownFileDS: TFDMemTable;
var
  LField: TFieldDef;
begin
  Result := TFDMemTable.Create(nil);
  {$REGION ''}
  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'DestDir';
  LField.DataType := ftString;
  LField.Size := 255;

  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'DestFileName';
  LField.DataType := ftString;
  LField.Size := 255;

  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'FtpName';
  LField.DataType := ftString;
  LField.Size := 255;

  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'FtpDir';
  LField.DataType := ftString;
  LField.Size := 255;

  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'FtpFileName';
  LField.DataType := ftString;
  LField.Size := 255;
  {$ENDREGION}
  Result.CreateDataSet;
end;

function TqkCommfunc.CreateDownFtpDS: TFDMemTable;
var
  LField: TFieldDef;
begin
  Result := TFDMemTable.Create(nil);
  {$REGION ''}
  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'FtpName';
  LField.DataType := ftString;
  LField.Size := 255;

  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'FtpIP';
  LField.DataType := ftString;
  LField.Size := 255;

  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'FtpPort';
  LField.DataType := ftString;
  LField.Size := 255;

  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'FtpUserName';
  LField.DataType := ftString;
  LField.Size := 255;

  LField := Result.FieldDefs.AddFieldDef;
  LField.Name := 'FtpPassWord';
  LField.DataType := ftString;
  LField.Size := 255;
  {$ENDREGION}
  Result.CreateDataSet;
end;

function TqkCommfunc.CreateDS(AOwner: TComponent): TFDMemTable;
begin
  Result := TFDMemTable.Create(AOwner);
  Result.CachedUpdates := True;
end;

function TqkCommfunc.CreateDsList: TList<TFDMemTable>;
begin
  Result := TList<TFDMemTable>.Create;
end;

function TqkCommfunc.CreateIDKey: Int64;
var
  Larr: TArray<Int64>;
begin
  if CreateIDKey(1,Larr) then
  begin
    Result := Larr[0];
  end else
    Result := -1;
end;

function TqkCommfunc.CreateIDKey(AConName: string; ACount: Integer;
  out AoutID: TArray<Int64>): Boolean;
const
  SPNAME = 'sys_getid';
var
  Ldslist: TList<TFDMemTable>;
  LErrMsg: string;
  N: string;
  I: Integer;
begin

  Result := False;
  if ACount > 99999 then
  begin
    ShowMessage('一次申请最大不能超过99999个');
    Exit;
  end;

  Ldslist := CreateDsList;
  try
    try
      Result := dmSvrIntf.SpOpen(AConName,SPNAME,nil,Ldslist,LErrMsg);
      if Result then
      begin
        SetLength(AoutID,ACount);
        N := Ldslist[0].Fields[0].AsString;
        for I := 0 to High(AoutID) do
        begin
          AoutID[I] := StrToInt64(N + RightStr('00000' + I.ToString,5));
        end;
      end else
      begin
        ShowMessage(LErrMsg);
      end;
    except
      Result := False;
    end;
  finally
    ReleaseDsList(Ldslist);
  end;

end;

function TqkCommfunc.CreateIDKey(ACount: Integer;
  out AoutID: TArray<Int64>): Boolean;
begin
  Result := CreateIDKey(dmSvrIntf.FDefConName,ACount,AoutID);
end;



// AFileDS：例子
// DestDir: D:\Sjsys\Exec\   (必须带后反斜杠)
// DestFileName: MainApp.exe
// FtpName: Sys  (第二个参数中FtpName列的值)
// FtpDir: \ERP_3_TIER\Tier3      (最后不带后反斜杠)
// FtpFileName： MainApp.Exe
// ----
// AFtpList: 例子
// FtpName:
// FtpIP:
// FtpPort:
// FtpUserName:
// FtpPassWord

function TqkCommfunc.DateTimeToStr(ADate: TDateTime): string;
begin
  Result := FormatDateTime('YYYY-MM-DD hh:mm:ss',ADate);
end;

procedure TqkDialog.CanNotSetParetnNoteToSelf;
begin
  ShowMessage('不能设置上级节点指向自身节点');
end;

function TqkDialog.DeleConfig: Boolean;
begin
  Result := MessageBox(Application.Handle,'是否确认删除？','提示', MB_YESNO) = IDYES;
end;

function TqkCommfunc.DownLoadFileFromFtp(AFileDS, AFtpList: TDataSet; ACallBack: TDownFileCallBackFunc): Boolean;
var
  LtmpStr: string;
  I: Integer;
  LBExistInFtp: Boolean;
  LIDFtp: TIdFTP;
begin
  //result := False;

  LIDFtp := TIdFTP.Create();
  try
    AFileDS.First;
    while not AFileDS.Eof do
    begin
{$REGION '判断是否需要创建路径'}
      if not DirectoryExists(AFileDS.FieldByName('DestDir').AsString) then
      begin
        ForceDirectories(AFileDS.FieldByName('DestDir').AsString);
      end;
{$ENDREGION}
{$REGION '判断本地文件是否占用'}
      if IsFileInUse(AFileDS.FieldByName('DestDir').AsString + AFileDS.FieldByName('DestFileName').AsString) then
      begin
        AFileDS.Next;
        if Assigned(ACallBack) then
          ACallBack(AFileDS.FieldByName('DestFileName').AsString, 0, '占用');
        Continue;
      end;
{$ENDREGION}
      if not AFtpList.Locate('FtpName', AFileDS.FieldByName('FtpName').AsString, [loCaseInsensitive]) then
      begin
        AFileDS.Next;
        if Assigned(ACallBack) then
          ACallBack(AFileDS.FieldByName('DestFileName').AsString, 0, 'FtpName无效');
        Continue;
      end;

{$REGION '连接FTP开始下载'}
      if not LIDFtp.Connected then
      begin
        LIDFtp.Host := AFtpList.FieldByName('FtpIP').AsString;
        LIDFtp.Port := AFtpList.FieldByName('FtpPort').AsInteger;
        LIDFtp.Username := AFtpList.FieldByName('FtpUserName').AsString;
        LIDFtp.Password := AFtpList.FieldByName('FtpPassWord').AsString;
        try
          LIDFtp.Connect;
        except
          AFileDS.Next;
          if Assigned(ACallBack) then
            ACallBack(AFileDS.FieldByName('DestFileName').AsString, 0, 'Ftp连接失败');
          Continue;
        end;
      end
      else
      begin
        if (LIDFtp.Host <> AFtpList.FieldByName('FtpIP').AsString) or (LIDFtp.Port <> AFtpList.FieldByName('FtpPort').AsInteger) or (LIDFtp.Username <> AFtpList.FieldByName('FtpUserName').AsString) or
          (LIDFtp.Password <> AFtpList.FieldByName('FtpPassWord').AsString) then
        begin
          LIDFtp.Disconnect;
          LIDFtp.Host := AFtpList.FieldByName('FtpIP').AsString;
          LIDFtp.Port := AFtpList.FieldByName('FtpPort').AsInteger;
          LIDFtp.Username := AFtpList.FieldByName('FtpUserName').AsString;
          LIDFtp.Password := AFtpList.FieldByName('FtpPassWord').AsString;
          try
            LIDFtp.Connect;
          except
            AFileDS.Next;
            if Assigned(ACallBack) then
              ACallBack(AFileDS.FieldByName('DestFileName').AsString, 0, 'Ftp连接失败');
            Continue;
          end;
        end;
      end;

      if LIDFtp.Connected then
      begin
        LtmpStr := AFileDS.FieldByName('FtpDir').AsString;
        if LtmpStr <> '' then
        begin
          if LtmpStr[Length(LtmpStr)] = '\' then
            LtmpStr[Length(LtmpStr)] := ' ';
          if Trim(LtmpStr) <> Trim(LIDFtp.RetrieveCurrentDir) then
          begin
            try
              LIDFtp.ChangeDir(LtmpStr);
            except
              AFileDS.Next;
              if Assigned(ACallBack) then
                ACallBack(AFileDS.FieldByName('DestFileName').AsString, 0, 'Ftp更换目录失败');
              Continue;
            end;
          end;
        end
        else
        begin
          LtmpStr := AFtpList.FieldByName('FtpDir').AsString;
          if LtmpStr <> '' then
          begin
            if LtmpStr[Length(LtmpStr)] = '\' then
              LtmpStr[Length(LtmpStr)] := ' ';
            if Trim(LtmpStr) <> Trim(LIDFtp.RetrieveCurrentDir) then
            begin
              try
                LIDFtp.ChangeDir(LtmpStr);
              except
                AFileDS.Next;
                if Assigned(ACallBack) then
                  ACallBack(AFileDS.FieldByName('DestFileName').AsString, 0, 'Ftp更换目录失败');
                Continue;
              end;
            end;
          end;
        end;

        LIDFtp.List;
        LBExistInFtp := False;
        for I := 0 to LIDFtp.DirectoryListing.Count - 1 do
        begin
          if (LIDFtp.DirectoryListing.Items[I].FileName.ToUpper = AFileDS.FieldByName('FtpFileName').AsString.ToUpper) and (LIDFtp.DirectoryListing.Items[I].ItemType = ditFile) then
          begin
            LBExistInFtp := true;
            try
              LIDFtp.Get(LIDFtp.DirectoryListing.Items[I].FileName, AFileDS.FieldByName('DestDir').AsString + AFileDS.FieldByName('DestFileName').AsString, true, False);
              if Assigned(ACallBack) then
                ACallBack(AFileDS.FieldByName('DestFileName').AsString, 1, '完成');
            except
              if Assigned(ACallBack) then
                ACallBack(AFileDS.FieldByName('DestFileName').AsString, 0, '下载失败'); // sgUpdateFiles.Cells[1,sgUpdateFiles.RowCount - 1] := 'Ftp_DownError';
            end;
          end;
        end;
        if not LBExistInFtp then
        begin
          if Assigned(ACallBack) then
            ACallBack(AFileDS.FieldByName('DestFileName').AsString, 0, 'Ftp文件不存在');
        end;
      end;
{$ENDREGION}
      AFileDS.Next;
    end;
    Result := true;
  finally
    LIDFtp.Free;
  end;

end;

function TqkCommfunc.ExportEHtoExcel(AEh: TDBGridEh): Boolean;
var
  Ldlg: TSaveDialog;
begin
  Ldlg := TSaveDialog.Create(nil);
  Ldlg.DefaultExt := 'xlsx';
  Ldlg.Filter := 'Excel 2007文件|*.xlsx|Excel 99-03文件|*.xls';
  try
    if Ldlg.Execute() then
    begin
      if Ldlg.FileName <> '' then
      begin
        ExportDBGridEhToXlsx(AEh,Ldlg.FileName,
        [TDBGridEhExportAsXlsxOption.xlsxColoredEh,TDBGridEhExportAsXlsxOption.xlsxDataAsDisplayText]
        );
      end;
    end;
  finally
    Ldlg.Free;
  end;
  Result := True;
end;

function TqkCommfunc.ExportSGtoExcel(ASg: TStringGrid): Boolean;
var
  LDs: TFDMemTable;
  Leh: TDBGridEh;
  Lds2: TDataSource;
  I,J: Integer;
begin
  LDs := TFDMemTable.Create(nil);
  Leh := TDBGridEh.Create(nil);
  Lds2 := TDataSource.Create(nil);
  try
    for I := 0 to ASg.ColCount - 1 do
    begin

      with LDs.FieldDefs.AddFieldDef do
      begin
        Name := 'FName' + i.ToString;
        DataType := ftString;
      end;

      with Leh.Columns.Add do
      begin
        FieldName := 'FName' + i.ToString;
      end;

    end;
    LDs.CreateDataSet;
    lds.Open;
    for J := 0 to ASg.RowCount - 1 do
    begin
      LDs.Append;
      for I := 0 to asg.ColCount - 1 do
      begin
        lds.FieldByName('FName'+I.ToString).AsString := asg.Cells[I,J];
      end;
      LDs.Post;
    end;
    Leh.DataSource := Lds2;
    Lds2.DataSet := LDs;

    Result := ExportEHtoExcel(Leh);

  finally
    lds.Free;
    Leh.Free;
    lds2.Free;
  end;
end;

function TqkCommfunc.FloatToString(AValue: Extended): string;
begin
  Result := FormatFloat('0.########',AValue);
end;

function TqkCommfunc.GetFileLastTime(const AFileName: string): TDateTime;
  function CovFileDate(AFileTime: TFileTime): TDateTime;
  var
    Tct: TSystemTime;
    Temp: TFileTime;
  begin
    FileTimeToLocalFileTime(AFileTime, Temp);
    FileTimeToSystemTime(Temp, Tct);
    CovFileDate := SystemTimeToDateTime(Tct);
  end;

// const
// Model='yyyy/mm/dd,hh:mm:ss'; { 设定时间格式 }
var
  Tp: TSearchRec; { 申明Tp为一个查找记录 }
  // T1,T2,T3:string;
begin
  FindFirst(AFileName, faAnyFile, Tp); { 查找目标文件 }
  try
    // T1:=FormatDateTime(Model,CovFileDate(Tp.FindData.ftCreationTime));
    // { 返回文件的创建时间 }
    // T2:=FormatDateTime(Model,CovFileDate(Tp.FindData.ftLastWriteTime));
    // { 返回文件的修改时间 }
    // T3:=FormatDateTime(Model,Now);
    // { 返回文件的当前访问时间 }
    result := CovFileDate(Tp.FindData.ftLastWriteTime);
  finally
    FindClose(Tp.FindHandle);
  end;
end;


function TqkCommfunc.GetFileSize(AFile: string): Int64;
begin
  Result := -1;
  if FileExists(AFile) then
  begin
    Result := FileSizeByName(AFile);
  end;
end;

function TqkCommfunc.GetFileVersion(FileName: string): String;
var
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  VerInfo: ^VS_FIXEDFILEINFO;
begin
  result := '0.0.0.0';
  InfoSize := GetFileVersionInfoSizeW(Pchar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfoW(Pchar(FileName), Wnd, InfoSize, VerBuf) then
      begin
        VerInfo := nil;
        VerQueryValueW(VerBuf, '\', Pointer(VerInfo), Wnd);
        if VerInfo <> nil then
        begin
          result := Format('%d.%d.%d.%d', [VerInfo^.dwFileVersionMS shr 16,
            VerInfo^.dwFileVersionMS and $0000FFFF,
            VerInfo^.dwFileVersionLS shr 16, VerInfo^.dwFileVersionLS and
            $0000FFFF]);
        end;
      end;
    finally
      FreeMem(VerBuf, InfoSize);
    end;
  end;
end;

function TqkCommfunc.GetIniValue(AFile, ASection, AKey: string): string;
var
  Lini: TIniFile;
begin
  Result := '';
  if not fileexists(AFile) then
  begin
    ShowMessage('没有找到ini文件' + AFile);
    Exit;
  end;

  Lini := TIniFile.Create(AFile);
  try
    Result := Lini.ReadString(ASection,AKey,'');
  finally
    Lini.Free;
  end;
end;

function TqkCommfunc.GetLocalIP: string;
var
  HostEnt: PHostEnt;
  IP: String;
  Addr: PAnsiChar;
  Buffer: array [0 .. 63] of AnsiChar;
  WSData: TWSADATA;
begin
  try
    if WSAStartUp($0101, WSData) <> 0 then
      Exit;
    GetHostName(Buffer, SizeOf(Buffer));
    HostEnt := GetHostByName(Buffer);
    if HostEnt = nil then
      Exit;
    Addr := HostEnt^.h_addr_list^;
    IP := Format('%d.%d.%d.%d', [Byte(Addr[0]), Byte(Addr[1]), Byte(Addr[2]), Byte(Addr[3])]);
    result := IP;
  finally
    WSACleanup;
  end;
end;

function TqkCommfunc.GetSeed(ASeedName: string): string;
var
  LDs: TList<TFDMemTable>;
  Lpms: TFDParams;
  lheader,lend: string;
begin
  LDs := nil;
  Lpms := TFDParams.Create;
  with Lpms.Add do
  begin
    Name := 'p1';
    Value := ASeedName;
  end;
  try
    LDs := dmSvrIntf.SqlOpen('14',Lpms);
    if LDs = nil then
    begin
      ShowMessage('取得SEED出错');
      Exit;
    end;
    LDs[1].First;
    while not LDs[1].Eof do
    begin
    lheader := lheader + LDs[1].FieldByName('Value').AsString;
    LDs[1].Next;
    end;
    LDs[2].First;
    while not LDs[2].Eof do
    begin
      lend := lend + LDs[2].FieldByName('value').AsString;
      LDs[2].Next;
    end;
    Result := lheader + LDs[0].FieldByName('seed').AsString + lend;

  finally
    Lpms.Free;
    qkCommfunc.ReleaseDsList(LDs);
  end;
end;

function TqkDataIntf.GetModData(AIDKey: Int64;
  AChild: Integer;AKeyValue: Int64): TList<TFDMemTable>;
const
  SPNAME = 'Sys_GetModData';
var
  Lpms: TFDParams;
  I: Integer;
  LtbArr: TArray<string>;
begin
  Lpms := TFDParams.Create;
  try
    with Lpms.Add do
    begin
      Name := '@IDKey';
      Value := AIDKey;
    end;
    with Lpms.Add do
    begin
      Name := '@ChildID';
      Value := AChild;
    end;
    with Lpms.Add do
    begin
      Name := '@KeyValue';
      Value := AKeyValue;
    end;
    Result := dmSvrIntf.SpOpen(SPNAME,Lpms);
    if Lpms.ParamByName('@ret').AsInteger <> 1 then
    begin
      ShowMessage(Lpms.ParamByName('@errMsg').AsString);
      qkCommfunc.ReleaseDsList(Result);
      Result := nil;
    end else
    if Result <> nil then
    begin
      LtbArr := Lpms.ParamByName('@TableNameArr').AsString.Split([';']);
      for I := 0 to Result.Count - 1 do
      begin
        Result[I].UpdateOptions.UpdateTableName := LtbArr[I];
      end;
    end;
  finally
    Lpms.Free;
  end;
end;

function TqkCommfunc.GetLocalCumputerName: string;
var
  ComputerName: array [0 .. MAX_COMPUTERNAME_LENGTH + 1] of Char; // 保留计算机名的缓冲区
  Buffer: Dword; // 缓冲区大小
begin
  Buffer := MAX_COMPUTERNAME_LENGTH + 1;
  if GetComputerNameW(@ComputerName[0], Buffer) then
  begin
    result := ComputerName;
  end
  else
  begin
    result := '';
  end;
end;

function TqkCommfunc.IsFileInUse(Afname: string): Boolean;
var
  hfileres: hfile;
begin
  result := False;
  if not fileexists(Afname) then
    Exit;
  hfileres := createfile(Pchar(Afname), generic_read or generic_write, 0, nil, open_existing, file_attribute_normal, 0);
  result := (hfileres = invalid_handle_value);
  if not result then
    CloseHandle(hfileres);
end;

procedure TqkCommfunc.LoadPictureFromField(Field: TBlobField;
  Picture: TPicture);
var
  lWICImage: TWICImage;
begin
  if (Field.BlobSize > 0) then
  begin {Assume image}
    lWICImage := TWICImage.Create;
    try
      lWICImage.Assign(Field);
      Picture.Assign(lWICImage);
    finally
      lWICImage.Free;
    end;
  end
  else {Empty}
  begin
    Picture.Assign(nil);
  end;
end;


function TqkCommfunc.MD5Print(AStr: string): string;
var
  LMD5: TIdHashMessageDigest5;
begin
  LMD5 := TIdHashMessageDigest5.Create;
  try
    result := LMD5.HashStringAsHex(AStr);
  finally
    LMD5.Free;
  end;
end;

procedure TqkCommfunc.PopMenuEnableSet(AMenu: TPopupMenu; ADataSet: TDataSet);
var
  //LNew: TMenuItem;
  LEdt: TMenuItem;
  LView: TMenuItem;
  LDele: TMenuItem;
  I: Integer;
begin
  //LNew := nil;
  LEdt := nil;
  LView := nil;
  LDele := nil;
  for I := 0 to AMenu.Items.Count - 1 do
  begin
//    if AMenu.Items[I].Tag = 1 then
//      LNew := AMenu.Items[I];
    if AMenu.Items[I].Tag = 2 then
      LEdt := AMenu.Items[I];
    if AMenu.Items[I].Tag = 3 then
      LView := AMenu.Items[I];
    if AMenu.Items[I].Tag = 4 then
      LDele := AMenu.Items[I];
  end;

  if ADataSet.IsEmpty then
  begin
    if LEdt <> nil then LEdt.Enabled := false;
    if LView <> nil then LView.Enabled := false;
    if LDele <> nil then LDele.Enabled := False;
  end else
  begin
    if LEdt <> nil then LEdt.Enabled := true;
    if LView <> nil then LView.Enabled := true;
    if LDele <> nil then LDele.Enabled := true;
  end;

end;

function TqkCommfunc.qkDownLoad(AFtpIp, APort, AUserName, APssword, AFtpDir,
  AFtpFileName, ALocalFile: string; AutoOpen: Boolean): Boolean;
begin
  Result := qkFtpFrm.qkDownLoad(AFtpIp,APort,AUserName,APssword,AFtpDir,AFtpFileName,ALocalFile,AutoOpen);
end;

function TqkCommfunc.qkUpLoad(AFtpIp, APort, AUserName, APssword, AFtpDir,
  AFtpFileName, ALocalFile: string): Boolean;
begin
  Result := qkFtpFrm.qkUpLoad(AFtpIp,APort,AUserName,APssword,AFtpDir,AFtpFileName,ALocalFile);
end;

procedure TqkCommfunc.ReleaseDsList(ADsList: TList<TFDMemTable>);
var
  I: Integer;
begin
  if ADsList <> nil then
  begin
    for I := 0 to ADsList.Count - 1 do
      ADsList[I].Free;
    ADsList.Clear;
    ADsList.Free;
  end;
end;

procedure TqkCommfunc.SetFK(ADetailDS: TFDMemTable; AParentIDkey: Int64;AParentPtr: string);
var
  LIDKeyArr: TArray<Int64>;
  n: Integer;
begin
  if ADetailDS <> nil then
  begin
    if ADetailDS.State in [dsEdit,dsInsert] then
    begin
      ADetailDS.Post;
    end;
    if not qkCommfunc.CreateIDKey(ADetailDS.RecordCount,LIDKeyArr) then Exit;

    ADetailDS.First;
    n := 0;
    while not ADetailDS.Eof do
    begin
      ADetailDS.Edit;
      if ADetailDS.FieldByName(AParentPtr).AsLargeInt <> AParentIDKey then
      begin
        ADetailDS.FieldByName(AParentPtr).AsLargeInt := AParentIDKey;
      end;
      if ADetailDS.FieldByName('IDKey').AsString = '' then
      begin
        ADetailDS.FieldByName('IDKey').AsLargeInt := LIDKeyArr[n];
        n := n+1;
      end;
      ADetailDS.Post;

      ADetailDS.Next;
    end;
  end;
end;

procedure TqkCommfunc.SetToMousePositon(AFrm: TForm);
begin
  AFrm.Position := TPosition.poDesigned;
  AFrm.Left := Mouse.CursorPos.X-10;
  AFrm.top := Mouse.CursorPos.Y-50;
end;

function TqkCommfunc.StrInArr(AStr: string;Arr: TArray<string>): boolean;
begin
  Result := IndexStr(AStr,Arr) <> -1;
end;

function TqkCommfunc.StrToDateTime(AStr: string): TDateTime;
var
  LFmt: TFormatSettings;
begin
  LFmt := TFormatSettings.Create(LOCALE_USER_DEFAULT);
  LFmt.ShortDateFormat:='yyyy-MM-dd';
  LFmt.DateSeparator:='-';
  //FSetting.TimeSeparator:=':';
  LFmt.LongTimeFormat:='hh:mm:ss';
  Result := StrToDateDef(AStr,0,LFmt);
end;

procedure TqkCommfunc.SetAllIDKey(Ads: TFDMemTable);
var
  LIDKeyArr: TArray<Int64>;
  Ltmp: Integer;
  n:Integer;
begin
  if Ads <> nil then
  begin
    if Ads.State in [dsEdit,dsInsert] then
    begin
      Ads.Post;
    end;
    if not qkCommfunc.CreateIDKey(Ads.RecordCount,LIDKeyArr) then Exit;

    Ads.DisableControls;
    Ltmp := ads.RecNo;
    n := 0;
    try
      Ads.First;
      while not Ads.Eof do
      begin
        if Ads.FieldByName('IDKey').AsString = '' then
        begin
          Ads.Edit;
          Ads.FieldByName('IDKey').Value := LIDKeyArr[n];
          Ads.Post;
          n := n+1;
        end;
        Ads.Next;
      end;
    finally
      ads.RecNo := ltmp;
      Ads.EnableControls;
    end;

  end;
end;

procedure TqkCommfunc.SetCurrIDKey(Ads: TFDMemTable; APost: Boolean = False);
begin
  if not (Ads.State in [dsEdit,dsInsert]) then
  begin
    Ads.Edit;
  end;
  if Ads.FieldByName('IDKey').AsString = '' then
    Ads.FieldByName('IDKey').AsLargeInt := qkCommfunc.CreateIDKey();
  if APost then
    Ads.Post;
end;

procedure TqkDialog.DeleSucc;
begin
  ShowMessage('删除成功');
end;

function TqkDialog.FormExist(AFrm: TForm): Boolean;
var
  LFrm: TfrmqkfuncDialogFrmExistcheck;
begin
  Result := True;
  if AFrm <> nil then
  begin
    LFrm := TfrmqkfuncDialogFrmExistcheck.Create(nil);
    try
      LFrm.ShowModal;
      case LFrm.FRet of
        0: Result := False; //取消
        1: //切换
        begin
          if AFrm.WindowState = wsMinimized then
            AFrm.WindowState := wsNormal;
          AFrm.BringToFront;
          AFrm.SetFocus;
          Result := False;
        end;
        2: //重新打开
        begin
          FreeAndNil(AFrm);
          Result := True;
        end;
      end;
    finally
      LFrm.Free;
    end;
  end else
    Result := True;
end;

procedure TqkDialog.NoRights;
begin
  ShowMessage('账套: ' +  dmSvrIntf.FDefConName + '  当前用户没有该操作权限');
end;

function TqkDialog.OperConfig: boolean;
begin
  Result := MessageBox(Application.Handle,'是否确认此操作？','提示', MB_YESNO) = IDYES;
end;

procedure TqkDialog.OperSucc;
begin
  ShowMessage('操作成功');
end;

procedure TqkDialog.SaveSucc;
begin
  ShowMessage('保存成功.');
end;

function TqkDataIntf.GetTableData(AFdMem: TFDMemTable; ATable,
  AWhere: string): Boolean;
const
  SPNAME = 'Sys_GetTableData';
var
  LPms: TFDParams;
  Lds: TList<TFDMemTable>;
begin
  Result := False;
  Lds := nil;
  LPms := TFDParams.Create;
  try
    with LPms.Add do
    begin
      Name := '@TableName';
      Value := ATable;
    end;
    with LPms.Add do
    begin
      Name := '@Where';
      Value := AWhere;
    end;
    Lds := dmSvrIntf.SpOpen(SPNAME,LPms);
    if Lds = nil then
      Exit;
    if not qkCommfunc.CheckSPRetParam(LPms) then
      Exit;
    AFdMem.Close;
    AFdMem.Data := lds[0].Data;
    AFdMem.MergeChangeLog;
    Result := True;
  finally
    LPms.Free;
    qkCommfunc.ReleaseDsList(Lds);
  end;
end;

function TqkDataIntf.CheckALterRegDate(AConDefName: string;
  out AErrMsg: OleVariant): Integer;
begin
  Result := dmSvrIntf.CheckALterRegDate(AConDefName,AErrMsg);
end;

function TqkDataIntf.PostDataByTable(AFireMtDs: TFDMemTable; ATable: string;
  bShowErr: Boolean): Boolean;
begin
  Result := dmSvrIntf.PostDataByTable(AFireMtDs,ATable,bShowErr);
end;

function TqkDataIntf.PostDataByTableArr(AConDefName: string;
  AdsList: TList<TFDMemTable>; ATableArr: string; out AErrMsg: string): Boolean;
begin
  Result := dmSvrIntf.PostDataByTableArr(AConDefName,AdsList,ATableArr,AErrMsg);
end;

function TqkDataIntf.PostDataByTableArr(AdsList: TList<TFDMemTable>;
  ATableArr: string; bShowErr: Boolean): Boolean;
begin
  Result := dmSvrIntf.PostDataByTableArr(AdsList,ATableArr,bShowErr);
end;

function TqkDataIntf.PostDataByTableArr(AdsArr: array of TFDMemTable;
  ATableArr: string; bShowErr: Boolean): Boolean;
begin
  Result := dmSvrIntf.PostDataByTableArr(AdsArr,ATableArr,bShowErr);
end;

function TqkDataIntf.RefreshRegTime(AConDefName: string;
  out AErrMsg: OleVariant): Boolean;
begin
  Result := dmSvrIntf.RefreshRegTime(AConDefName,AErrMsg);
end;

function TqkDataIntf.RefreshSqlBuffer(AConDefName: string;
  out AErrMsg: string): Boolean;
begin
  Result := dmSvrIntf.RefreshSqlBuffer(AConDefName,AErrMsg);
end;

function TqkDataIntf.RefreshSqlBuffer: Boolean;
begin
  Result := dmSvrIntf.RefreshSqlBuffer;
end;

function TqkDataIntf.SpExec(AConDefName, ASpName: string; AParams: TFDParams;
  out AErrMsg: string): Boolean;
begin
  Result := dmSvrIntf.SpExec(AConDefName,ASpName,AParams,AErrMsg);
end;

function TqkDataIntf.SpExec(ASpName: string; AParams: TFDParams;
  bShowErr: Boolean): Boolean;
begin
  Result := dmSvrIntf.SpExec(ASpName,AParams,bShowErr);
end;

function TqkDataIntf.SpExec(AConDefName, ASpName: string; AParams: TFDParams;
  bShowErr: Boolean): Boolean;
begin
  Result := dmSvrIntf.SpExec(AConDefName,ASpName,AParams,bShowErr);
end;

function TqkDataIntf.SpOpen(ASpName: string; AParams: TFDParams;
  bShowErr: Boolean): TList<TFDMemTable>;
begin
  Result := dmSvrIntf.SpOpen(ASpName,AParams,bShowErr);
end;

function TqkDataIntf.SpOpen(AConDefName, ASpName: string; AParams: TFDParams;
  AList: TList<TFDMemTable>; out AErrMsg: string): Boolean;
begin
  Result := dmSvrIntf.SpOpen(AConDefName,ASpName,AParams,AList,AErrMsg);
end;

function TqkDataIntf.SqlExec(AConDefName, ASqlName: string; AParams: TFDParams;
  out AErrMsg: string): Boolean;
begin
  Result := dmSvrIntf.SqlExec(AConDefName,ASqlName,AParams,AErrMsg);
end;

function TqkDataIntf.SqlExec(ASqlName: string; AParams: TFDParams;
  bShowErr: Boolean): Boolean;
begin
  Result := dmSvrIntf.SqlExec(ASqlName,AParams,bShowErr);
end;

function TqkDataIntf.SqlOpen(AConDefName, ASqlName: string; AParams: TFDParams;
  AList: TList<TFDMemTable>; out AErrMsg: string): Boolean;
begin
  Result := dmSvrIntf.SqlOpen(AConDefName,ASqlName,AParams,AList,AErrMsg);
end;

function TqkDataIntf.SqlOpen(ASqlName: string; AParams: TFDParams;
  bShowErr: Boolean): TList<TFDMemTable>;
begin
  Result := dmSvrIntf.SqlOpen(ASqlName,AParams,bShowErr);
end;

function TqkDataIntf.UpdateRegCode(AConDefName, key1, key2: string;
  out AErrMsg: OleVariant): Boolean;
begin
  Result := dmSvrIntf.UpdateRegCode(AConDefName,key1,key2,AErrMsg);
end;

function TqkDataIntf.DirectSqlExec(ASql: string): Boolean;
const
  SPNAME = 'Sys_OpenSQL';
var
  LPms: TFDParams;
begin
  Result := False;
  LPms := TFDParams.Create;
  try
    with LPms.Add do
    begin
      Name := '@Sqltxt';
      Value := ASql;
    end;
    if not dmSvrIntf.SpExec(SPNAME,LPms) then exit;
    if not qkCommfunc.CheckSPRetParam(LPms) then
      exit;
    Result := True;
  finally
    LPms.Free;
  end;
end;

function TqkDataIntf.DirectSqlOpen(AFdmem: TFDMemTable; ASql: string): Boolean;
const
  SPNAME = 'Sys_OpenSQL';
var
  LPms: TFDParams;
  lds: TList<TFDMemTable>;
begin
  Result := False;
  lds := nil;
  LPms := TFDParams.Create;
  try
    with LPms.Add do
    begin
      Name := '@Sqltxt';
      Value := ASql;
    end;
    lds := dmSvrIntf.SpOpen(SPNAME,LPms);
    if lds = nil then
      Exit;
    if not qkCommfunc.CheckSPRetParam(LPms) then
      exit;
    Result := True;
    AFdmem.Close;
    AFdmem.Data := lds[0].Data;
  finally
    LPms.Free;
    qkCommfunc.ReleaseDsList(lds);
  end;
end;

function TqkCommfunc.qkDownLoad(qkFtpname, AFtpDir, AFtpFileName,
  ALocalFile: string; AutoOpen: Boolean): Boolean;
var
  LtmpDs: TFDMemTable;
begin
  Result := False;
  LtmpDs := TFDMemTable.Create(nil);
  try
    if not qkDataIntf.GetTableData(LtmpDs,'sys_ftp',' FtpName=' + QuotedStr(qkFtpname)) then
      Exit;
    if LtmpDs.IsEmpty then
    begin
      ShowMessage('SYS_FTP表中没有'+ qkFtpname);
      Exit;
    end;

    Result := qkDownLoad(LtmpDs.FieldByName('FtpIP').AsString,
      LtmpDs.FieldByName('FtpPort').AsString,
      LtmpDs.FieldByName('FtpUserName').AsString,
      LtmpDs.FieldByName('FtpPassWord').AsString,
      AFtpDir,AFtpFileName,ALocalFile,AutoOpen
    );
  finally
    LtmpDs.Free;
  end;
end;

function TqkCommfunc.qkUpLoad(qkFtpName, AFtpDir, AFtpFileName,
  ALocalFile: string): Boolean;
var
  LtmpDs: TFDMemTable;
begin
  Result := False;
  LtmpDs := TFDMemTable.Create(nil);
  try
    if not qkDataIntf.GetTableData(LtmpDs,'sys_ftp',' FtpName=' + QuotedStr(qkFtpname)) then
      Exit;
    if LtmpDs.IsEmpty then
    begin
      ShowMessage('SYS_FTP表中没有'+ qkFtpname);
      Exit;
    end;

    Result := qkUpLoad(LtmpDs.FieldByName('FtpIP').AsString,
      LtmpDs.FieldByName('FtpPort').AsString,
      LtmpDs.FieldByName('FtpUserName').AsString,
      LtmpDs.FieldByName('FtpPassWord').AsString,
      AFtpDir,AFtpFileName,ALocalFile
    );
  finally
    LtmpDs.Free;
  end;
end;

{ TqkTmpVar }

procedure TqkTmpVar.ClearAll;
begin
  Freepms;
  ReleaseDsLst;
  mtfree;
end;

function TqkTmpVar.CopyDsLstToMT(AMtArr: array of TFDMemTable): Boolean;
var
  I: Integer;
begin
  Result := False;
  if Dslst.Count <> Length(AMtArr) then
  begin
    ShowMessage('Dslst和AMtArr数据集数量不相等');
    exit;
  end;
  try
    for I := 0 to Length(AMtArr) - 1 do
    begin
      AMtArr[I].Close;
      AMtArr[I].AppendData(DsLst[I].Data);
      AMtArr[I].MergeChangeLog;
    end;
    Result := True;
  except on E: Exception do
  begin
    ShowMessage(e.Message);
    Exit;
  end;
  end;
end;

procedure TqkTmpVar.Freepms;
begin
  if _tmpPms <> nil then
  begin
    _tmpPms.Free;
    _tmpPms := nil;
  end;
end;

procedure TqkTmpVar.ReleaseDsLst;
begin
  qkCommfunc.ReleaseDsList(Dslst);
  Dslst := nil;
end;

function TqkTmpVar.mt: TFDMemTable;
begin
  if _mt = nil then
  begin
    _mt := TFDMemTable.Create(nil);
    _mt.CachedUpdates := true;
    Result := _mt;
  end else
  begin
    Result := _mt;
  end;
end;

procedure TqkTmpVar.mtfree;
begin
  if _mt <> nil then
    FreeAndNil(_mt);
end;

function TqkTmpVar.Pms: TFDParams;
begin
  if _tmpPms <> nil then
  begin
    Result := _tmpPms;
  end else
  begin
    _tmpPms := TFDParams.Create;
    Result := _tmpPms;
  end;
end;

{ TqkRights }

function TqkRights.CheckOperatorRight(AModID: int64; ARightID: Integer;BShowMessage: Boolean = True): boolean;
var
  Lds: TFDMemTable;
  Larr: TArray<string>;
begin
  Result := False;
  if not qkVar.UserRights.TryGetValue(dmSvrIntf.FDefConName,Lds) then
  begin
    if BShowMessage then qkDialog.NoRights;
    Exit;
  end;
  if not Lds.Locate('ModIDKey',AModID,[]) then
  begin
    if BShowMessage then qkDialog.NoRights;
    exit;
  end;

  Larr := Lds.FieldByName('ModRights').AsString.Split([';']);
  if IndexStr(ARightID.ToString,Larr) = -1 then
  begin
    if BShowMessage then qkDialog.NoRights;
    Exit;
  end;

  Result := True;
end;


function TqkRights.ModRights(AModID: Int64): TArray<string>;
var
  Lds: TFDMemTable;
  //Larr: TArray<string>;
begin
  if not qkVar.UserRights.TryGetValue(dmSvrIntf.FDefConName,Lds) then
  begin
    Exit;
  end;
  if not Lds.Locate('ModIDKey',AModID,[]) then
  begin
    exit;
  end;
  Result := Lds.FieldByName('ModRights').AsString.Split([';']);
end;

end.
