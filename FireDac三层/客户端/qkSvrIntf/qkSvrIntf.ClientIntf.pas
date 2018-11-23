unit qkSvrIntf.ClientIntf;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient,System.Generics.Collections, System.ZLib,
  qkServerPhysIntf,
  Datasnap.DBClient,

  FireDAC.Phys.DSDef, FireDAC.UI.Intf,
  FireDAC.ConsoleUI.Wait, FireDAC.Comp.UI, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.TDBXBase, FireDAC.Phys.DS, FireDAC.Stan.StorageBin,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  TqkSvrInnerFunc = record
    function qkCopyStream(const AStream: TStream;out AErrMsg: string): TMemoryStream;
    function qkParamToStream(AParams: TFDParams; out AErrMsg: string): TStream;
    function qkStreamToParams(AStream: TStream;out AErrMsg: string): TFDParams;
    function qkCompressStream(InStream,OutStream: TStream;out AErrMsg: string): Boolean;
    function qkDeCompressStream(InStream,OutStream: TStream;out AErrMsg: string): Boolean;
  end;

  TdmSvrIntf = class(TDataModule)
    con1: TSQLConnection;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    FDPhysDSDriverLink1: TFDPhysDSDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleDestroy(Sender: TObject);
  private
    FClient: TSvrMethodsClient;
    function GetClient: TSvrMethodsClient;
  public
    FInnerFunc: TqkSvrInnerFunc;
    FDefConName: string;
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


    property Client: TSvrMethodsClient read GetClient write FClient;
  end;

var
  dmSvrIntf: TdmSvrIntf;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}
uses
  qmsgpack, Vcl.Dialogs, system.Variants;

{$REGION '压缩函数'}

function SetErrMsg(AErrMsg: string): string;
begin
  Result := 'qkSvrIntf Err::' + AErrMsg;
end;

function TqkSvrInnerFunc.qkCopyStream(const AStream: TStream;out AErrMsg: string): TMemoryStream;
const
  LBufSize = $F000;
var
  LBuffer: TBytes;
  LReadLen: Integer;
begin
  Result := nil;
  if AStream = nil then
    Exit;
  Result := TMemoryStream.Create;
  try
    if AStream.Size = -1 then
    begin
      SetLength(LBuffer, LBufSize);
      repeat
        LReadLen := AStream.Read(LBuffer[0], LBufSize);
        if LReadLen > 0 then
          Result.WriteBuffer(LBuffer[0], LReadLen);
        if LReadLen < LBufSize then
          break;
      until LReadLen < LBufSize;
    end
    else
      Result.CopyFrom(AStream, 0);
    Result.Position := 0;
    AStream.Position := 0;
  except
    on E: Exception do
    begin
      AErrMsg := SetErrMsg(e.Message);
      Result.Free;
      Result := nil;
    end;
  end;
end;

function TqkSvrInnerFunc.qkParamToStream(AParams: TFDParams; out AErrMsg: string): TStream;
var
  QMP: TQMsgPack;
  I, Idx, Count: Integer;
begin
  Result := nil;
  QMP := TQMsgPack.Create;
  try
    Count := 0;
    for I := 0 to AParams.Count - 1 do
      if AParams[I].ParamType in AllParamTypes then
        Inc(Count);
    if Count > 0 then
    begin
      Idx := 0;
      for I := 0 to AParams.Count - 1 do
        if AParams[I].ParamType in AllParamTypes then
        begin
          QMP.ForcePath(Idx.ToString).ForcePath('Name').AsString := AParams[I].Name;
          QMP.ForcePath(Idx.ToString).ForcePath('Value').AsVariant := AParams[I].AsString;
          QMP.ForcePath(Idx.ToString).ForcePath('DataType').AsInteger := Ord(AParams[I].DataType);
          QMP.ForcePath(Idx.ToString).ForcePath('ParamType').AsInteger := Ord(AParams[I].ParamType);
          QMP.ForcePath(Idx.ToString).ForcePath('Size').AsInteger := AParams[I].Size;
          QMP.ForcePath(Idx.ToString).ForcePath('Precision').AsInteger := AParams[I].Precision;
          QMP.ForcePath(Idx.ToString).ForcePath('NumericScale').AsInteger := AParams[I].NumericScale;
          Inc(Idx);
        end;
    end;
    try
      Result := TMemoryStream.Create;
      QMP.SaveToStream(Result);
      Result.Position := 0;
    except
      on E: Exception do
      begin
        AErrMsg := SetErrMsg(e.Message);
        if Result <> nil then
          Result.Free;
        Result := nil;
      end;
    end;
  finally
    QMP.Free;
  end;
end;

function TqkSvrInnerFunc.qkStreamToParams(AStream: TStream;out AErrMsg: string): TFDParams;
var
  QMP: TQMsgPack;
  LParam: TFDParam;
  I: Integer;
begin
  Result := TFDParams.Create;
  if AStream.Size = 0 then Exit;
  QMP := TQMsgPack.Create;
  try
    try
      AStream.Position := 0;
      QMP.LoadFromStream(AStream);
      for I := 0 to QMP.Count - 1 do
      begin
        LParam := Result.Add;
        LParam.Name := QMP.ForcePath(I.ToString).ForcePath('Name').AsString;
        LParam.DataType := TFieldType(QMP.ForcePath(I.ToString).ForcePath('DataType').AsInteger);
        LParam.ParamType := TParamType(QMP.ForcePath(I.ToString).ForcePath('ParamType').AsInteger);
        LParam.Size := QMP.ForcePath(I.ToString).ForcePath('Size').AsInteger;
        LParam.Precision := QMP.ForcePath(I.ToString).ForcePath('Precision').AsInteger;
        LParam.NumericScale := QMP.ForcePath(I.ToString).ForcePath('NumericScale').AsInteger;
        LParam.Value := QMP.ForcePath(I.ToString).ForcePath('Value').AsVariant;
      end;
      AStream.Position := 0;
    except
      on E: Exception do
      begin
        AErrMsg := SetErrMsg(e.Message);
        if Result <> nil then
        begin
          Result.Clear;
          Result.Free;
        end;
        Result := nil;
      end;
    end;
  finally
    QMP.Free;
  end;
end;

function TqkSvrInnerFunc.qkCompressStream(InStream,OutStream: TStream;out AErrMsg: string): Boolean;
begin
  AErrMsg := '';
  InStream.Position := 0;
  try
    ZCompressStream(InStream,OutStream,zcFastest);
    Result := True;
    OutStream.Position := 0;
  except
    on E: Exception do
    begin
      AErrMsg := SetErrMsg(e.Message);
      Result := False;
    end;
  end;
end;

function TqkSvrInnerFunc.qkDeCompressStream(InStream,OutStream: TStream;out AErrMsg: string): Boolean;
begin
  AErrMsg := '';
  InStream.Position := 0;
  try
    ZDecompressStream(InStream,OutStream);
    Result := True;
    OutStream.Position := 0;
  except
    on E: Exception do
    begin
      AErrMsg := SetErrMsg(e.Message);
      Result := False;
    end;
  end;
end;


{$ENDREGION}

function TdmSvrIntf.CheckALterRegDate(AConDefName: string;
  out AErrMsg: OleVariant): Integer;
begin
  Result := Client.Intf_CheckALterRegDate(AConDefName,AErrMsg);
end;

procedure TdmSvrIntf.DataModuleDestroy(Sender: TObject);
begin
  if FClient <> nil then  FClient.Free;
end;

function TdmSvrIntf.GetClient: TSvrMethodsClient;
begin
  Result := nil;
  if con1.ConnectionState <> csStateOpen then
  begin
    try
      con1.Open;
      if FClient <> nil then
      begin
        FreeAndNil(FClient);
      end;
      FClient := TSvrMethodsClient.Create(con1.DBXConnection,False);
      Result := FClient;
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
        Exit;
      end;
    end;
  end else
  begin
    if FClient <> nil then
      Result := FClient
    else
    begin
      FClient := TSvrMethodsClient.Create(con1.DBXConnection,False);
      Result := FClient;
    end;
  end;
end;

function TdmSvrIntf.PostDataByTable(AFireMtDs: TFDMemTable; ATable: string;
  bShowErr: Boolean): Boolean;
  var
  Lds: TList<TFDMemTable>;
begin
  Lds := TList<TFDMemTable>.Create;
  try
    Lds.Add(AFireMtDs);
    Result := PostDataByTableArr(Lds,ATable,bShowErr);
  finally
    Lds.Clear;
    Lds.Free;
  end;
end;

function TdmSvrIntf.PostDataByTableArr(AdsArr: array of TFDMemTable;
  ATableArr: string; bShowErr: Boolean): Boolean;
var
  Lds: TList<TFDMemTable>;
  I: Integer;
begin
  if Length(AdsArr) <> Length(ATableArr.Split([';'])) then
  begin
    ShowMessage('PostDatabyTableArr  DsArr.Len <> TableArr.Len');
    Result := False;
    Exit;
  end;
  Lds := TList<TFDMemTable>.Create;
  try
    for I := 0 to Length(AdsArr) - 1 do
      Lds.Add(AdsArr[I]);
    Result := PostDataByTableArr(Lds,ATableArr,bShowErr);
  finally
    Lds.Clear;
    Lds.Free;
  end;
end;

function TdmSvrIntf.PostDataByTableArr(AdsList: TList<TFDMemTable>;
  ATableArr: string;bShowErr: Boolean = True): Boolean;
var
  LErr: string;
begin
  Result := PostDataByTableArr(FDefConName,AdsList,ATableArr,LErr);
  if not Result then
  begin
    if bShowErr then
      ShowMessage(LErr);
  end;
end;

function TdmSvrIntf.SpExec(AConDefName: string;ASpName: string; AParams: TFDParams;
  bShowErr: Boolean = True): Boolean;
var
  LerrMsg: string;
  LdsList: TList<TFDMemTable>;
  I: Integer;
begin
  LdsList := TList<TFDMemTable>.Create;
  try
    Result := SpExec(AConDefName,ASpName,AParams,LerrMsg);
    if not Result and bShowErr then
      ShowMessage(LerrMsg);
  finally
    for I := 0 to LdsList.Count - 1 do
      LdsList[I].Free;
    LdsList.Free;
  end;
end;

function TdmSvrIntf.PostDataByTableArr(AConDefName: string;
  AdsList: TList<TFDMemTable>; ATableArr: string; out AErrMsg: string): Boolean;
var
  LSM1: TStream;
  LSM2: TStream;
  LSM3: TStream;
  Lds: TFDMemTable;
  I: Integer;
  LtmpTbArr: TArray<string>;
  LSzArr: string;
  LTbArr: string;

  Lerr: OleVariant;
begin
  Result := False;
  LSM1 := nil;
  LSM2 := nil;
  LSM3 := nil;
  LtmpTbArr := ATableArr.Split([';']);
  if Length(LtmpTbArr) <> AdsList.Count then
  begin
    AErrMsg := 'PostArr: Table Arr <> AdsList count';
    Exit;
  end;
  for I := 0 to AdsList.Count - 1 do
  begin
    if AdsList[I].State in [dsEdit,dsInsert] then
      AdsList[I].Post;
  end;

  Lds := TFDMemTable.Create(Self); //need free
  LSM2 := TMemoryStream.Create; //need free;
  try
    try
      for I := 0 to AdsList.Count - 1 do
      begin
        if AdsList[I].State in [dsEdit, dsInsert] then
          AdsList[I].Post;
        if AdsList[I].ChangeCount > 0 then
        begin
          LSM1 := TMemoryStream.Create;
          Lds.Close;
          Lds.Data := AdsList[I].Delta;
          Lds.SaveToStream(LSM1,sfBinary);
          LSM1.Position := 0;
          LSM2.CopyFrom(LSM1,LSM1.Size);
          if LSzArr = '' then
            LSzArr := LSM1.Size.ToString
          else
            LSzArr := LSzArr + ';' + LSM1.Size.ToString;
          if LTbArr = '' then
            LTbArr := LtmpTbArr[I]
          else
            LTbArr := LTbArr + ';' + LtmpTbArr[I];
          LSM1.Free;
        end;
      end;

      if LTbArr <> '' then
      begin
        LSM2.Position := 0;
        LSM3 := TMemoryStream.Create;
        if not FInnerFunc.qkCompressStream(lsm2,lsm3,AErrMsg) then
        begin
          LSM3.Free;
          Exit;
        end;
        LSM3.Position := 0;
        Result := Client.Intf_PostDataByTableArr(AConDefName,LSM3,LSzArr,LTbArr,Lerr);
        AErrMsg := VarToStr(Lerr);
        if Result then
        begin
          for I := 0 to AdsList.Count - 1 do
            AdsList[I].MergeChangeLog;
        end;
      end else
      begin
        Result := True;
        Exit;
      end;
    except on E: Exception do
      begin
        con1.Close;
        AErrMsg := AErrMsg + '#13' + e.Message;
        Result := False;
      end;
    end;
  finally
    if LSM3 <> nil then
          LSM3.Free;
    Lds.Free;
    if LSM1 <> nil then
      LSM1.Free;
    if LSM2 <> nil then
      LSM2.Free;
  end;
end;

function TdmSvrIntf.SpExec(AConDefName, ASpName: string;
  AParams: TFDParams; out AErrMsg: string): Boolean;
var
  //调用前
  LParamSM: TStream;
  LParams: TFDParams;
  //调用后
  LtmpSM: TStream;
  ltmpParams: TFDParams;

  Lerr: OleVariant;
begin
  LtmpSM := nil;
  Result := False;
  ltmpParams := nil;
  LParams := TFDParams.Create(); //需要释放
  if AParams <> nil then
  begin
    LParams.Assign(AParams);
  end;
  LParamSM := FInnerFunc.qkParamToStream(LParams,AErrMsg);
  if LParamSM = nil then Exit;
  LParamSM.Position := 0;
  try
    try
      Result := Client.Intf_SpExec(AConDefName,ASpName,LParamSM,Lerr);
      AErrMsg := VarToStr(Lerr);
      if Result then
      begin
        //参数
        LParamSM.Position := 0;
        LtmpSM := FInnerFunc.qkCopyStream(LParamSM,AErrMsg);//需要释放
        if LtmpSM = nil then Exit;
        LtmpSM.Position := 0;
        ltmpParams := FInnerFunc.qkStreamToParams(LtmpSM,AErrMsg);//需要释放
        if ltmpParams = nil then Exit;
        if AParams <> nil then
        begin
          AParams.Clear;
          AParams.Assign(ltmpParams);
        end;
      end;
    except
      on E: Exception do
      begin
        con1.Close;
        AErrMsg := e.Message + ' #13 ' + VarToStr(Lerr);
        Result := False;
      end;
    end;
  finally
    if LParamSM <> nil then
      LParamSM.Free;
    if LtmpSM <> nil then
      LtmpSM.Free;
    if ltmpParams <> nil then
      ltmpParams.Free;
    if LParams <> nil then
    begin
      LParams.Clear;
      LParams.Free;
    end;
  end;
end;

function TdmSvrIntf.SpOpen(AConDefName, ASpName: string;
  AParams: TFDParams; AList: TList<TFDMemTable>;
  out AErrMsg: string): Boolean;
var
  //调用前
  LParamSM: TStream;
  LParams: TFDParams;
  LOutDataSM: TStream;
  LOutDataSZArr: string;
  //调用后
  LtmpSM: TStream;
  ltmpParams: TFDParams;
  LDataSizeArr: TArray<string>;
  ltmpDecSM: TMemoryStream;
  ltmpCopySM: TMemoryStream;
  I: Integer;
  LMemSM: TMemoryStream;
  LMt: TFDMemTable;
  J: Integer;
  //
  LoleErr: OleVariant;
  LoleOutDataSize: OleVariant;

begin
  LtmpSM := nil;
  ltmpParams := nil;
  ltmpCopySM := nil;
  ltmpDecSM := nil;
  LMemSM := nil;
  LMt := nil;
  Result := False;
  if AList = nil then
  begin
    AErrMsg := 'Param: DSList IS NULL';
    Exit;
  end;
  LParams := TFDParams.Create(); //需要释放
  if AParams <> nil then
  begin
    LParams.Assign(AParams);
  end;
  LParamSM := FInnerFunc.qkParamToStream(LParams,AErrMsg);
  if LParamSM = nil then Exit;
  LParamSM.Position := 0;
  try
  try
    Result := Client.Intf_SpOpen(AConDefName,ASpName,LParamSM,LOutDataSM,LoleOutDataSize,LoleErr);
    AErrMsg := VarToStr(LoleErr);
    LOutDataSZArr := VarToStr(LoleOutDataSize);
    if Result then
    begin
      //参数
      LParamSM.Position := 0;
      LtmpSM := FInnerFunc.qkCopyStream(LParamSM,AErrMsg);//需要释放
      if LtmpSM = nil then Exit;
      LtmpSM.Position := 0;
      ltmpParams := FInnerFunc.qkStreamToParams(LtmpSM,AErrMsg);//需要释放
      if ltmpParams = nil then Exit;
      if AParams <> nil then
      begin
        AParams.Clear;
        AParams.Assign(ltmpParams);
      end;

      //数据
      LDataSizeArr := loutdataSZArr.Split([';']);
      LOutDataSM.Position := 0;
      ltmpCopySM := FInnerFunc.qkCopyStream(LOutDataSM,AErrMsg);//需要释放
      if ltmpCopySM = nil then exit;
      ltmpCopySM.Position := 0;
      ltmpDecSM := TMemoryStream.Create; //需要释放
      if not FInnerFunc.qkDeCompressStream(ltmpCopySM,ltmpDecSM,AErrMsg) then
      begin
        Exit;
      end;
      ltmpDecSM.Position := 0;

      for I := 0 to Length(LDataSizeArr) - 1 do
      begin
        LMemSM := TMemoryStream.Create; //需要释放
        LMemSM.CopyFrom(ltmpDecSM,StrToInt(ldatasizearr[i]));//拷贝后源postion会变
        LMemSM.Position := 0;
        LMt := TFDMemTable.Create(nil); //异常释放
        LMt.CachedUpdates := True;
        LMt.LoadFromStream(LMemSM,sfBinary);
        AList.Add(LMt);
        FreeAndNil(LMemSM);
        LMt := nil;
      end;
    end;

  except
    on E: Exception do
    begin
      con1.Close;
      AErrMsg := e.Message + ' #13 ' + VarToStr(LoleErr);
      for J := 0 to AList.Count - 1 do
        AList[J].Free;
      AList.Clear;
      Result := False;
    end;
  end;
  finally
    if LParamSM <> nil then
      LParamSM.Free;
    if LOutDataSM <> nil then
      LOutDataSM.Free;
    if LtmpSM <> nil then
      LtmpSM.Free;
    if ltmpParams <> nil then
      ltmpParams.Free;
    if ltmpCopySM <> nil then
      ltmpCopySM.Free;
    if ltmpDecSM <> nil then
      ltmpDecSM.Free;
    if LMemSM <> nil then
      LMemSM.Free;
    if LMt <> nil then
      LMt.Free;
    if LParams <> nil then
    begin
      LParams.Clear;
      LParams.Free;
    end;
  end;
end;

function TdmSvrIntf.RefreshRegTime(AConDefName: string;
  out AErrMsg: OleVariant): Boolean;
begin
  Result := Client.Intf_RefreshRegTime(AConDefName,AErrMsg);
end;

function TdmSvrIntf.RefreshSqlBuffer: Boolean;
var
  LErrMsg: string;
begin
  Result := RefreshSqlBuffer(FDefConName,LErrMsg);
  if not Result then
    ShowMessage(LErrMsg);
end;

function TdmSvrIntf.SpExec(ASpName: string; AParams: TFDParams;
  bShowErr: Boolean): Boolean;
begin
  Result := SpExec(FDefConName,ASpName,AParams);
end;

function TdmSvrIntf.SpOpen(ASpName: string; AParams: TFDParams;
  bShowErr: Boolean = True): TList<TFDMemTable>;
var
  LRet: TList<TFDMemTable>;
  LErrMsg: string;
  I: Integer;
begin
  Result := nil;
  LRet := TList<TFDMemTable>.Create;
  if SpOpen(FDefConName,ASpName,AParams,LRet,LErrMsg) then
  begin
    Result := LRet;
  end else
  begin
    for I := 0 to LRet.Count - 1 do
      LRet[I].Free;
    LRet.Free;
    if bShowErr then
    begin
      ShowMessage(LErrMsg);
    end;
  end;
end;

function TdmSvrIntf.SqlExec(ASqlName: string; AParams: TFDParams;
  bShowErr: Boolean): Boolean;
var
  Lerr: string;
begin
  Result := SqlExec(FDefConName,ASqlName,AParams,Lerr);
  if not Result and bShowErr then
  begin
    ShowMessage(Lerr);
  end;
end;

function TdmSvrIntf.SqlOpen(ASqlName: string; AParams: TFDParams;
  bShowErr: Boolean): TList<TFDMemTable>;
var
  LRet: TList<TFDMemTable>;
  LErrMsg: string;
  I: Integer;
begin
  Result := nil;
  LRet := TList<TFDMemTable>.Create;
  if SqlOpen(FDefConName,ASqlName,AParams,LRet,LErrMsg) then
  begin
    Result := LRet;
  end else
  begin
    for I := 0 to LRet.Count - 1 do
      LRet[I].Free;
    LRet.Free;
    if bShowErr then
    begin
      ShowMessage(LErrMsg);
    end;
  end;
end;

function TdmSvrIntf.UpdateRegCode(AConDefName, key1, key2: string;
  out AErrMsg: OleVariant): Boolean;
begin
  Result := Client.intf_UpdateRegCode(AConDefName,key1,key2,AErrMsg);
end;

function TdmSvrIntf.SqlOpen(AConDefName, ASqlName: string; AParams: TFDParams;
  AList: TList<TFDMemTable>; out AErrMsg: string): Boolean;
var
  //调用前
  LParamSM: TStream;
  LParams: TFDParams;
  LOutDataSM: TStream;
  LOutDataSZArr: string;
  //调用后
  LtmpSM: TStream;
  ltmpParams: TFDParams;
  LDataSizeArr: TArray<string>;
  ltmpDecSM: TMemoryStream;
  ltmpCopySM: TMemoryStream;
  I: Integer;
  LMemSM: TMemoryStream;
  LMt: TFDMemTable;
  J: Integer;

  LErr: OleVariant;
  LoleDataSZArr: OleVariant;
begin
  LtmpSM := nil;
  ltmpParams := nil;
  ltmpCopySM := nil;
  ltmpDecSM := nil;
  LMemSM := nil;
  LMt := nil;
  Result := False;
  if AList = nil then
  begin
    AErrMsg := 'Param: DSList IS NULL';
    Exit;
  end;
  LParams := TFDParams.Create(); //需要释放
  if AParams <> nil then
  begin
    LParams.Assign(AParams);
  end;
  LParamSM := FInnerFunc.qkParamToStream(LParams,AErrMsg);
  if LParamSM = nil then Exit;
  LParamSM.Position := 0;
  try
  try
    Result := Client.Intf_SqlOpen(AConDefName,ASqlName,LParamSM,LOutDataSM,LoleDataSZArr,LErr);
    LOutDataSZArr := VarToStr(LoleDataSZArr);
    AErrMsg := VarToStr(LErr);
    if Result then
    begin
      //参数
      LParamSM.Position := 0;
      LtmpSM := FInnerFunc.qkCopyStream(LParamSM,AErrMsg);//需要释放
      if LtmpSM = nil then Exit;
      LtmpSM.Position := 0;
      ltmpParams := FInnerFunc.qkStreamToParams(LtmpSM,AErrMsg);//需要释放
      if ltmpParams = nil then Exit;
      if AParams <> nil then
      begin
        AParams.Clear;
        AParams.Assign(ltmpParams);
      end;

      //数据
      LDataSizeArr := loutdataSZArr.Split([';']);
      LOutDataSM.Position := 0;
      ltmpCopySM := FInnerFunc.qkCopyStream(LOutDataSM,AErrMsg);//需要释放
      if ltmpCopySM = nil then exit;
      ltmpCopySM.Position := 0;
      ltmpDecSM := TMemoryStream.Create; //需要释放
      if not FInnerFunc.qkDeCompressStream(ltmpCopySM,ltmpDecSM,AErrMsg) then
      begin
        Exit;
      end;
      ltmpDecSM.Position := 0;

      for I := 0 to Length(LDataSizeArr) - 1 do
      begin
        LMemSM := TMemoryStream.Create; //需要释放
        LMemSM.CopyFrom(ltmpDecSM,StrToInt(ldatasizearr[i]));//拷贝后源postion会变
        LMemSM.Position := 0;
        LMt := TFDMemTable.Create(nil); //异常释放
        LMt.CachedUpdates := True;
        LMt.LoadFromStream(LMemSM,sfBinary);
        AList.Add(LMt);
        FreeAndNil(LMemSM);
        LMt := nil;
      end;
    end;

  except
    on E: Exception do
    begin
      con1.Close;
      AErrMsg := e.Message + ' #13 ' + VarToStr(LErr);
      for J := 0 to AList.Count - 1 do
        AList[J].Free;
      AList.Clear;
      Result := False;
    end;
  end;
  finally
    if LParamSM <> nil then
      LParamSM.Free;
    if LOutDataSM <> nil then
      LOutDataSM.Free;
    if LtmpSM <> nil then
      LtmpSM.Free;
    if ltmpParams <> nil then
      ltmpParams.Free;
    if ltmpCopySM <> nil then
      ltmpCopySM.Free;
    if ltmpDecSM <> nil then
      ltmpDecSM.Free;
    if LMemSM <> nil then
      LMemSM.Free;
    if LMt <> nil then
      LMt.Free;
    if LParams <> nil then
    begin
      LParams.Clear;
      LParams.Free;
    end;
  end;
end;

function TdmSvrIntf.SqlExec(AConDefName, ASqlName: string; AParams: TFDParams;
  out AErrMsg: string): Boolean;
var
  //调用前
  LParamSM: TStream;
  LParams: TFDParams;
  //调用后
  LtmpSM: TStream;
  ltmpParams: TFDParams;

  Lerr: OleVariant;
begin
  LtmpSM := nil;
  LParams := nil;
  ltmpParams := nil;
  Result := False;
  LParams := TFDParams.Create(); //需要释放
  if AParams <> nil then
  begin
    LParams.Assign(AParams);
  end;
  LParamSM := FInnerFunc.qkParamToStream(LParams,AErrMsg);
  if LParamSM = nil then Exit;
  LParamSM.Position := 0;
  try
  try
    Result := Client.Intf_SqlExec(AConDefName,ASqlName,LParamSM,Lerr);
    AErrMsg := VarToStr(Lerr);
    if Result then
    begin
      //参数
      LParamSM.Position := 0;
      LtmpSM := FInnerFunc.qkCopyStream(LParamSM,AErrMsg);//需要释放
      if LtmpSM = nil then Exit;
      LtmpSM.Position := 0;
      ltmpParams := FInnerFunc.qkStreamToParams(LtmpSM,AErrMsg);//需要释放
      if ltmpParams = nil then Exit;
      if AParams <> nil then
      begin
        AParams.Clear;
        AParams.Assign(ltmpParams);
      end;
    end;
  except
    on E: Exception do
    begin
      con1.Close;
      AErrMsg := e.Message + ' #13 ' + AErrMsg;
      Result := False;
    end;
  end;
  finally
    if LParamSM <> nil then
      LParamSM.Free;
    if LtmpSM <> nil then
      LtmpSM.Free;
    if ltmpParams <> nil then
      ltmpParams.Free;
    if LParams <> nil then
    begin
      LParams.Clear;
      LParams.Free;
    end;
  end;
end;

function TdmSvrIntf.RefreshSqlBuffer(AConDefName: string;
  out AErrMsg: string): Boolean;
var
  LErr: OleVariant;
begin
  try
    Result := Client.Intf_RefreshSqlBuffer(AConDefName,LErr);
    AErrMsg := VarToStr(LErr);
  except
    on E: Exception do
    begin
      AErrMsg := e.Message + ' #13 ' + VarToStr(LErr);
      Result := False;
      con1.Close;
    end;
  end;
end;

end.
