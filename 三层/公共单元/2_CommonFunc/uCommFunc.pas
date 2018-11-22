{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}


unit uCommFunc;

interface
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

uses
  System.SysUtils,IdHashMessageDigest,IdGlobal, IdHash, Vcl.Dialogs, uSvrIntf, Datasnap.DBClient,
  Vcl.Forms,System.Generics.Collections,RzTabs,DBGridEh, Winapi.ActiveX, System.Win.ComObj,
  Vcl.StdCtrls, Vcl.Controls,System.ZLib,System.Classes, Data.SqlExpr;
const
  AUTODISCONNECTTCPLINK = 5000; //与服务器无通信则自动断开
type
{$REGION '主窗体用结构'}
  TModFrmInfo = record
    ModFrm: TForm;
    ModID: Integer;
    ModTab: TRZTabSheet;
  end;
var
  gMainFrmModPageCtr: TRzPageControl;
  gActiveModList: TDictionary<Integer,TModFrmInfo>;
{$ENDREGION}

type
  TGetDateTimeType = (dtdate,dttime,dtdatetime);

  TGlobVar = record
    rkey05: string;
    UserName05: string;
    rkey73: string;
    LoginName73: string;
    SvrIP: string;
    SvrDB: string;

    //
    FourceEXITCode: Integer;//是否强制退出
    AutoCloseTCPTime: Cardinal;//自动断开的时间
  end;

  TSystemFunc = record
    function GetFourceEXITMsg(var ErrMsg: string): Boolean;//取得强制退出代码
    function GetFileVersion(FileName: string): String; // 得程序版本号
    function GetFileModifyTime(const AFileName: string): TDateTime; //取得文件的修改时间
    function IsFileInUse(Afname: string): Boolean;//判断文件是否占用
    function GetComputerName: string; //取得本机的电脑名
    function GetLocalIP: string; //取得本机的IP

    function Base64_Encode(DecryptedText: string): string;
    function Base64_Decode(a: string): string;
    //MD5
    function MD5Print(AStr: string): string;
  end;

  TCommonFunc = record
    function GetSvrDateTime(AType: TGetDateTimeType = dtdatetime): TDateTime;
    procedure Export_dbGridEH_to_Excel(AEh: TDBGridEh);
    function DateTimeToStr(ADateTime: TDateTime;AFormat: string = 'yyyy-MM-dd HH:mm:ss'): string;
    function StrToDateTime(AStr: string): TDateTime;
    function CreateIDKey: string;
    function GetUserModAuthIDArr(ARkey73,AModID: Integer): TArray<Integer>;
    function CheckUserAuth(AOperatorID: Integer;AModID: Integer;BShowMsg: Boolean = True): Boolean;
    function Get04SeedValue(ATableName: string): string;
    //取得当前模块主窗体关联部分
    function GetModTSData(AModID: Integer): TModFrmInfo;
  end;

  TSvrIntf = record
    function IntfGetDataBySql(ASql: string; out AData: OleVariant;ACompress: Boolean = True): Boolean;overload;
    function IntfPostDataByTable(ATable: string; AData: OleVariant): Boolean;overload;
    function IntfGetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant;ACompress: Boolean = True): Boolean;overload;
    function IntfPostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant): Boolean;overload;
    function IntfPostModData(AEngName: string; AModID: Integer; ADataArr: OleVariant; AChildID: Integer = 0): Boolean;overload;
    function IntfspGetData(AspName: string; AParamArr: OleVariant; out AData: OleVariant;ACompress: Boolean = True): Boolean;overload;
    function IntfspExec(AspName: string;var AParamArr: OleVariant): Boolean;overload;


    function IntfGetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string;ACompress: Boolean = True): Boolean;overload;
    function IntfPostDataByTable(ATable: string; AData: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string): Boolean;overload;
    function IntfGetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string;ACompress: Boolean = True): Boolean;overload;
    function IntfPostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string): Boolean;overload;
    function IntfPostModData(AEngName: string; AModID: Integer; ADataArr: OleVariant; out ErrMsg: string; ADBName: string; AChildID: Integer): Boolean;overload;
    function IntfspGetData(AspName: string; AParamArr: OleVariant; out AData: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string;ACompress: Boolean = True): Boolean;overload;
    function IntfspExec(AspName: string;var AParamArr: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string): Boolean;overload;

    function IntfGetDataBySql(ASql: string; ACds: TClientDataSet;ACompress: Boolean = True): Boolean;overload;
    function IntfGetDataBySqlArr(ASqlArr: OleVariant; ACdsArr: array of TClientDataSet;ACompress: Boolean = True): Boolean;overload;
    function IntfspGetData(AspName: string; AParamArr: OleVariant; ACds: TClientDataSet;ACompress: Boolean = True): Boolean;overload;
  end;

var
  gFunc: TCommonFunc;
  gSysFunc: TSystemFunc;
  gVar: TGlobVar;
  gSvrIntf: TSvrIntf;

implementation

uses
  Winapi.WinSock, Winapi.Windows, System.Variants, System.DateUtils;

const
  base64 = 'oeJzcNn7YV5ZKv+EhQaC3Xu/WiO24PDylRdqkGjI9TwUFrxL1bMHfpA6gsSt0Bm8';


function Connect_Tier3Svr(out ErrMsg: string): Boolean;
begin
  try
    if gSvrConDM.con1.ConnectionState = csStateClosed then
    begin
      gSvrConDM.con1.Close;
      if gSvrConDM.ServerMethods1Client <> nil then
      begin
        gSvrConDM.ServerMethods1Client.Free;
        gSvrConDM.ServerMethods1Client := nil;
      end;
      gSvrConDM.con1.Open;
    end;
    Result := True;
  except
    ErrMsg := '连接服务器失败';
    Result := False;
  end;
end;


procedure CloseConnect;
begin
  gSvrConDM.con1.Close;
  gSvrConDM.ServerMethods1Client.Free;
  gSvrConDM.ServerMethods1Client := nil;
end;

procedure StreamToVariant(Stream: TStream; var V: OLEVariant);
var
  P : Pointer;
begin
  try
    V := VarArrayCreate ([0, Stream.Size - 1], varByte);
    P := VarArrayLock (V);
    Stream.Position := 0;
    Stream.Read (P^, Stream.Size);
    VarArrayUnlock (V);
  except
    Exit;
  end;
end;

procedure VariantToStream(const V: OLEVariant; Stream: TStream);
var
  P: Pointer;
begin
  try
    Stream.Position := 0;
    Stream.Size := VarArrayHighBound (V, 1) - VarArrayLowBound (V, 1) + 1;
    P := VarArrayLock (V);
    Stream.Write (P^, Stream.Size);
    VarArrayUnlock (V);
    Stream.Position := 0;
  except
    Exit;
  end;
end;

function DeCompressData(V: OleVariant): OleVariant;
var
  M, M0: TMemoryStream;
begin
  try
    M := TMemoryStream.Create;
    M0 := TMemoryStream.Create;
    try
      if V = Null then exit;
      VariantToStream(V,M);
      M.Position := 0;
      ZDeCompressStream(M, M0);
      StreamToVariant(M0, V);
    finally
      M.Free;
      M0.Free
    end;
    Result := V;
  except
    Exit;
  end;
end;

function CompressData(V: OleVariant): OleVariant;
var
  M, M0: TMemoryStream;
begin
  try
    M := TMemoryStream.Create;
    M0 := TMemoryStream.Create;
    try
      if V = Null then exit;
      VariantToStream(V,M);
      M.Position := 0;
      ZCompressStream(M, M0,zcFastest);
      StreamToVariant(M0, V);
    finally
      M.Free;
      M0.Free
    end;
    Result := V;
  except
    Exit;
  end;
end;

{ TCommonFunc }

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

function TSystemFunc.Base64_Decode(a: string): string;
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
    if w2 >= 0 then retry := retry + Char(((w1 * 4 + Trunc(w2 / 16)) and 255));
    if w3 >= 0 then retry := retry + Char(((w2 * 16 + Trunc(w3 / 4)) and 255));
    if w4 >= 0 then retry := retry + Char(((w3 * 64 + w4) and 255));
    n := n + 4;
  end;
  result := retry;
end;

function TSystemFunc.Base64_Encode(DecryptedText: string): string;
var
  c1, c2, c3: integer;
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
    else w3 := -1;
    if (Length(DecryptedText) >= n + 2) then w4 := c3 and 63
    else w4 := -1;
    retry := retry + mimeencode(w1) + mimeencode(w2) + mimeencode(w3) + mimeencode(w4);
    n := n + 3;
  end;
  result := retry;
end;


function TSystemFunc.MD5Print(AStr: string): string;
var
  LMD5: TIdHashMessageDigest5;
begin
  LMD5 := TIdHashMessageDigest5.Create;
  try
    Result := LMD5.HashStringAsHex(AStr);
  finally
    LMD5.Free;
  end;
end;

{ TCommonFunc }

function TCommonFunc.CheckUserAuth(AOperatorID, AModID: Integer;BShowMsg: Boolean = True): Boolean;
var
  LArr: TArray<Integer>;
  I: Integer;
begin
  Result := False;
  LArr := GetUserModAuthIDArr(StrToInt(gvar.rkey73),AModID);
  for I := 0 to Length(LArr) - 1 do
  begin
    if AOperatorID = LArr[I] then
    begin
      Result := True;
      Break;
    end;
  end;
  if not Result and BShowMsg then
    ShowMessage('您没有当前操作的权限');
end;

function TCommonFunc.CreateIDKey: string;
var
  LGUID: TGUID;
begin
  CreateGUID(LGUID);
  Result := GUIDToString(LGUID);
end;

function TCommonFunc.DateTimeToStr(ADateTime: TDateTime; AFormat: string): string;
begin
  Result := FormatDateTime(AFormat,ADateTime);
end;

procedure TCommonFunc.Export_dbGridEH_to_Excel(AEh: TDBGridEh);
var
  iCount, jCount, v_cloumn: Integer;
  XLApp: Variant;
  Sheet: Variant;
begin
  if not AEh.DataSource.DataSet.Active then exit;
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
  try
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := 'sheet1';
  Sheet := XLApp.Workbooks[1].WorkSheets['sheet1'];
  AEh.DataSource.DataSet.DisableControls;
  AEh.DataSource.DataSet.first;

  v_cloumn := 0;
  for iCount := 0 to AEh.Columns.Count - 1 do
    if (AEh.Columns.Items[iCount].Visible = true) and (AEh.Columns.Items[iCount].FieldName <> '') then
      Sheet.Cells[1, iCount + 1 - v_cloumn] :=
        AEh.Columns[iCount].Title.Caption
    else
      inc(v_cloumn);

  jCount := 1;
  while not AEh.DataSource.DataSet.Eof do
  begin
    v_cloumn := 0;
    for iCount := 0 to AEh.Columns.Count - 1 do
      if (AEh.Columns[iCount].Visible = true)and (AEh.Columns.Items[iCount].FieldName <> '') then
        Sheet.Cells[jCount + 1, iCount + 1 - v_cloumn] :=
          AEh.Columns[iCount].Field.AsString
      else
        inc(v_cloumn);
    Inc(jCount);
    AEh.DataSource.DataSet.Next;
  end;

  XlApp.Visible := True;
  Screen.Cursor := crDefault;
  AEh.DataSource.DataSet.First;
  AEh.DataSource.DataSet.EnableControls;
  finally
    Screen.Cursor := crDefault;
  end;
end;

function TCommonFunc.Get04SeedValue(ATableName: string): string;
var
  LCds: TClientDataSet;
begin
  LCds := TClientDataSet.Create(nil);
  try
    gSvrIntf.IntfGetDataBySql('select seed_value from data0004 where table_name = ' + QuotedStr(ATableName),LCds);
    if not LCds.IsEmpty then
      Result := LCds.FieldByName('seed_value').AsString;
  finally
    LCds.Free;
  end;
end;

function TCommonFunc.GetModTSData(AModID: Integer): TModFrmInfo;
begin
  Result.ModFrm := nil;
  Result.ModID := -1;
  Result.ModTab := nil;
  gActiveModList.TryGetValue(AModID,Result);
end;

function TCommonFunc.GetSvrDateTime(AType: TGetDateTimeType = dtdatetime): TDateTime;
var
  LCds: TClientDataSet;
begin
  Result := Now;
  LCds := TClientDataSet.Create(nil);
  try
    gSvrIntf.IntfGetDataBySql('select getdate() as nowtime ',LCds);
    case AType of
      dtdate: Result := DateOf(LCds.FieldByName('nowtime').AsDateTime);
      dttime: Result := TimeOf(LCds.FieldByName('nowtime').AsDateTime);
      dtdatetime: Result := LCds.FieldByName('nowtime').AsDateTime;
    end;
  finally
    LCds.Free;
  end;
end;


function TCommonFunc.GetUserModAuthIDArr(ARkey73,
  AModID: Integer): TArray<Integer>;
var
  LCds: TClientDataSet;
  LSql: string;
begin
  LCds := TClientDataSet.Create(nil);
  LSql := ' SELECT OperatorID FROM Tier3_UserModAuthCards ' +
          ' INNER JOIN Tier3_ModAuthCard on Tier3_ModAuthCard.IDKey = Tier3_UserModAuthCards.ModAuthCard_IDKey ' +
          ' INNER JOIN Tier3_ModAuthCardOperators on Tier3_ModAuthCardOperators.ModAuthCard_IDKey = Tier3_UserModAuthCards.ModAuthCard_IDKey ' +
          ' INNER JOIN Tier3_ModOperators on Tier3_ModOperators.IDKey = ModOperator_IDKey ' +
          ' WHERE Tier3_UserModAuthCards.ModID = ' + IntToStr(AModID) + ' AND D73_Ptr = ' + gVar.rkey73 + ' AND Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 ' +
          ' UNION ' +
          ' SELECT OperatorID FROM Tier3_UserAddsModOperator ' +
          ' INNER JOIN Tier3_UserModAuthCards on Tier3_UserAddsModOperator.MasterUserCard_IDKey = Tier3_UserModAuthCards.IDKey ' +
          ' INNER JOIN Tier3_ModAuthCard on Tier3_UserModAuthCards.ModAuthCard_IDKey = Tier3_ModAuthCard.IDKey ' +
          ' INNER JOIN Tier3_ModAuthCardOperators on Tier3_ModAuthCard.IDKey = Tier3_ModAuthCardOperators.ModAuthCard_IDKey ' +
          ' INNER JOIN Tier3_ModOperators on Tier3_ModAuthCardOperators.ModOperator_IDKey = Tier3_ModOperators.IDKey AND Tier3_UserAddsModOperator.ModOperator_IDKey = Tier3_ModOperators.IDKey ' +
          ' WHERE Tier3_UserModAuthCards.Status = 1 AND Tier3_ModAuthCard.Status = 1 AND (getdate() BETWEEN BeginTime AND EndTime) AND ' +
          ' Tier3_UserAddsModOperator.ModID = ' + IntToStr(AModID) + ' AND Tier3_UserAddsModOperator.D73_Ptr = ' + gVar.rkey73;
  try
    if gSvrIntf.IntfGetDataBySql(LSql,LCds) then
    begin
      SetLength(Result,LCds.RecordCount);
      while not LCds.Eof do
      begin
        Result[LCds.RecNo-1] := LCds.FieldByName('OperatorID').AsInteger;
        lcds.Next;
      end;
    end;
  finally
    LCds.Free;
  end;
end;

function TCommonFunc.StrToDateTime(AStr: string): TDateTime;
var
  LSetting : TFormatSettings;
begin
  LSetting := TFormatSettings.Create();
  LSetting.DateSeparator := '-';
  LSetting.TimeSeparator := ':';
  Result := System.SysUtils.StrToDateTime(AStr,LSetting);
end;

{ TSvrIntf }

function TSvrIntf.IntfGetDataBySql(ASql: string; out AData: OleVariant;
  out ErrMsg: string; ADBName, AEngName: string;ACompress: Boolean = True): Boolean;
var
  LData: OleVariant;
begin
  gVar.AutoCloseTCPTime := GetTickCount;

  if gSysFunc.GetFourceEXITMsg(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  if not Connect_Tier3Svr(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  try
    Result := gSvrConDM.ServerMethods1Client.IntfGetDataBySql(ASql,LData,ErrMsg,ADBName,AEngName,ACompress);
    if ACompress then
      AData := DeCompressData(LData)
    else
      AData := LData;
  except
    on E: EXCEPTION do
    begin
      ErrMsg := e.Message;
      Result := False;
      CloseConnect;
    end;
  end;
end;

function TSvrIntf.IntfGetDataBySql(ASql: string;
  out AData: OleVariant;ACompress: Boolean = True): Boolean;
var
  LErrMsg: string;
begin
  Result := gSvrIntf.IntfGetDataBySql(ASql,AData,LErrMsg,gVar.SvrDB,'',ACompress);
  if not Result then
  begin
    ShowMessage(LErrMsg);
  end;
end;

function TSvrIntf.IntfGetDataBySqlArr(ASqlArr: OleVariant;
  out ADataArr: OleVariant;ACompress: Boolean = True): Boolean;
var
  LErrMsg: string;
begin
  Result := IntfGetDataBySqlArr(ASqlArr,ADataArr,LErrMsg,gVar.SvrDB,'',ACompress);
  if not Result then
  begin
    ShowMessage(LErrMsg);
  end;
end;

function TSvrIntf.IntfGetDataBySqlArr(ASqlArr: OleVariant;
  out ADataArr: OleVariant; out ErrMsg: string; ADBName,
  AEngName: string;ACompress: Boolean = True): Boolean;
var
  LData: OleVariant;
  I: Integer;
begin
  gVar.AutoCloseTCPTime := GetTickCount;

  if gSysFunc.GetFourceEXITMsg(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  if not Connect_Tier3Svr(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  try
    Result := gSvrConDM.ServerMethods1Client.IntfGetDataBySqlArr(ASqlArr,LData,ErrMsg,ADBName,AEngName,ACompress);

    ADataArr := VarArrayCreate([VarArrayLowBound(LData,1),VarArrayHighBound(LData,1)],varVariant);
    for I := VarArrayLowBound(LData,1) to VarArrayHighBound(LData,1) do
    begin
      if ACompress then
        ADataArr[I] := DeCompressData(LData[I])
      else
        ADataArr[I] := LData[I];
    end;
  except
    on E: EXCEPTION do
    begin
      ErrMsg := e.Message;
      Result := False;
      CloseConnect;
    end;
  end;

end;

function TSvrIntf.IntfPostDataBySqlArr(ATableArr, ADataArr: OleVariant;
  out ErrMsg: string; ADBName, AEngName: string): Boolean;
begin
  gVar.AutoCloseTCPTime := GetTickCount;

  if gSysFunc.GetFourceEXITMsg(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  if not Connect_Tier3Svr(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  try
    Result := gSvrConDM.ServerMethods1Client.IntfPostDataBySqlArr(ATableArr,ADataArr,ErrMsg,ADBName,AEngName);
  except
    on E: EXCEPTION do
    begin
      ErrMsg := e.Message;
      Result := False;
      CloseConnect;
    end;
  end;
end;

function TSvrIntf.IntfPostDataBySqlArr(ATableArr,
  ADataArr: OleVariant): Boolean;
var
  LErrMsg: string;
begin
  Result := IntfPostDataBySqlArr(ATableArr,ADataArr,LErrMsg,gVar.SvrDB,'');
  if not Result then
  begin
    ShowMessage(LErrMsg);
  end;
end;

function TSvrIntf.IntfPostDataByTable(ATable: string; AData: OleVariant;
  out ErrMsg: string; ADBName, AEngName: string): Boolean;
begin
  gVar.AutoCloseTCPTime := GetTickCount;

  if gSysFunc.GetFourceEXITMsg(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  if not Connect_Tier3Svr(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  try
    Result := gSvrConDM.ServerMethods1Client.IntfPostDataByTable(ATable,AData,ErrMsg,ADBName,AEngName);
  except
    on E: EXCEPTION do
    begin
      ErrMsg := e.Message;
      Result := False;
      CloseConnect;
    end;
  end;

end;

function TSvrIntf.IntfPostDataByTable(ATable: string;
  AData: OleVariant): Boolean;
var
  LErrMsg: string;
begin
  Result := IntfPostDataByTable(ATable,AData,LErrMsg,gVar.SvrDB,'');
  if not Result then
  begin
    ShowMessage(LErrMsg);
  end;
end;

function TSvrIntf.IntfPostModData(AEngName: string; AModID: Integer;
  ADataArr: OleVariant; out ErrMsg: string; ADBName: string;
  AChildID: Integer): Boolean;
begin
  gVar.AutoCloseTCPTime := GetTickCount;

  if gSysFunc.GetFourceEXITMsg(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  if not Connect_Tier3Svr(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  try
    Result := gSvrConDM.ServerMethods1Client.IntfPostModData(AEngName,AModID,ADataArr,ErrMsg,ADBName,AChildID);
  except
    on E: EXCEPTION do
    begin
      ErrMsg := e.Message;
      Result := False;
      CloseConnect;
    end;
  end;
end;

function TSvrIntf.IntfPostModData(AEngName: string; AModID: Integer;
  ADataArr: OleVariant; AChildID: Integer): Boolean;
var
  LErrMsg: string;
begin
  Result := IntfPostModData(AEngName,AModID,ADataArr,LErrMsg,gVar.SvrDB,AChildID);
  if not Result then
  begin
    ShowMessage(LErrMsg);
  end;
end;

function TSvrIntf.IntfspExec(AspName: string;var AParamArr: OleVariant): Boolean;
var
  LErrMsg: string;
begin
  Result := IntfspExec(AspName,AParamArr,LErrMsg,gVar.SvrDB,'');
  if not Result then
  begin
    ShowMessage(LErrMsg);
  end;
end;

function TSvrIntf.IntfspExec(AspName: string;var AParamArr: OleVariant;
  out ErrMsg: string; ADBName, AEngName: string): Boolean;
begin
 gVar.AutoCloseTCPTime := GetTickCount;

  if gSysFunc.GetFourceEXITMsg(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  if not Connect_Tier3Svr(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  try
    Result := gSvrConDM.ServerMethods1Client.IntfspExec(AspName,AParamArr,ErrMsg,ADBName,AEngName);
  except
    on E: EXCEPTION do
    begin
      ErrMsg := e.Message;
      Result := False;
      CloseConnect;
    end;
  end;
end;

function TSvrIntf.IntfspGetData(AspName: string; AParamArr: OleVariant;
  ACds: TClientDataSet;ACompress: Boolean = True): Boolean;
var
  LData: OleVariant;
begin
  Result := IntfspGetData(AspName,AParamArr,LData,ACompress);
  if Result then
  begin
    ACds.Data := LData;
  end;
end;

function TSvrIntf.IntfspGetData(AspName: string; AParamArr: OleVariant;
  out AData: OleVariant;ACompress: Boolean = True): Boolean;
var
  LErrMsg: string;
begin
  Result := IntfspGetData(AspName,AParamArr,AData,LErrMsg,gVar.SvrDB,'',ACompress);
  if not Result then
  begin
    ShowMessage(LErrMsg);
  end;
end;

function TSvrIntf.IntfspGetData(AspName: string; AParamArr: OleVariant;
  out AData: OleVariant; out ErrMsg: string; ADBName,
  AEngName: string;ACompress: Boolean = True): Boolean;
var
  LData: OleVariant;
begin
  gVar.AutoCloseTCPTime := GetTickCount;

  if gSysFunc.GetFourceEXITMsg(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  if not Connect_Tier3Svr(ErrMsg) then
  begin
    Result := False;
    CloseConnect;
    Exit;
  end;

  try
    Result := gSvrConDM.ServerMethods1Client.IntfspGetData(AspName,AParamArr,LData,ErrMsg,ADBName,AEngName,ACompress);
    if Result then
    begin
      if ACompress then
        AData := DeCompressData(LData)
      else
        AData := LData;
    end;
  except
    on E: EXCEPTION do
    begin
      ErrMsg := e.Message;
      Result := False;
      CloseConnect;
    end;
  end;
end;

function TSvrIntf.IntfGetDataBySql(ASql: string; ACds: TClientDataSet;ACompress: Boolean = True): Boolean;
var
  LData: OleVariant;
begin
  Result := IntfGetDataBySql(ASql,LData,ACompress);
  if Result then
  begin
    ACds.Data := LData;
  end;
end;

function TSvrIntf.IntfGetDataBySqlArr(ASqlArr: OleVariant;
  ACdsArr: array of TClientDataSet;ACompress: Boolean = True): Boolean;
var
  LDataArr: OleVariant;
  I: Integer;
begin
  Result := IntfGetDataBySqlArr(ASqlArr,LDataArr,ACompress);
  if Result then
  begin
    for I := VarArrayLowBound(LDataArr,1) to VarArrayHighBound(LDataArr,1) do
    begin
      ACdsArr[I].Data := LDataArr[I];
    end;
  end;
end;

{ TSystemFunc }

function TSystemFunc.GetFileModifyTime(const AFileName: string): TDateTime;
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
    System.SysUtils.FindClose(Tp);
  end;
end;


function TSystemFunc.GetFileVersion(FileName: string): String;
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

function TSystemFunc.GetFourceEXITMsg(var ErrMsg: string): Boolean;
begin
  Result := False;
  ErrMsg := '';
  case gVar.FourceEXITCode of
    0: ;
    1:
    begin
      Result := True;
      ErrMsg  := '系统已在其他电脑登陆，请退出当前系统';
    end;
    2:
    begin
      Result := True;
      ErrMsg := '系统登录异常，请退出当前系统';
    end;
  end;
end;

function TSystemFunc.IsFileInUse(Afname: string): Boolean;
var
  hfileres: hfile;
begin
  Result := False;
  if not fileexists(Afname) then
    Exit;
  hfileres := createfile(Pchar(Afname), generic_read or generic_write, 0, nil,
    open_existing, file_attribute_normal, 0);
  result := (hfileres = invalid_handle_value);
  if not result then
    CloseHandle(hfileres);
end;


function TSystemFunc.GetComputerName: string;
var
  ComputerName: array [0 .. MAX_COMPUTERNAME_LENGTH + 1] of Char; // 保留计算机名的缓冲区
  Buffer: Dword; // 缓冲区大小
begin
  Buffer := MAX_COMPUTERNAME_LENGTH + 1;
  if GetComputerNameW(@ComputerName[0], Buffer) then
  begin
    Result := ComputerName;
  end
  else
  begin
    Result := '';
  end;
end;

function TSystemFunc.GetLocalIP: string;
var
  HostEnt: PHostEnt;
  IP: String;
  Addr: PAnsiChar;
  Buffer: array [0..63] of AnsiChar;
  WSData: TWSADATA;
begin
  try
    if WSAStartUp($0101, WSData) <> 0 then exit;
    GetHostName(Buffer, SizeOf(Buffer));
    HostEnt := GetHostByName(Buffer);
    if HostEnt = nil then exit;
    Addr := HostEnt^.h_addr_list^;
    IP := Format( '%d.%d.%d.%d', [ Byte(Addr[0]), Byte(Addr[1]),Byte(Addr[2]), Byte(addr[3]) ]);
    result := Ip;
  finally
    WSACleanup;
  end;
end;

initialization
  gActiveModList := TDictionary<Integer,TModFrmInfo>.Create;
  gVar.FourceEXITCode := 0;
  gVar.AutoCloseTCPTime := GetTickCount;
finalization
  gActiveModList.Free;
end.
