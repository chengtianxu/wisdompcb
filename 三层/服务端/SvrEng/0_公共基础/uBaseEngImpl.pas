{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 ChengTX                       }
{                                                       }
{*******************************************************}

unit uBaseEngImpl;

interface
uses
  uEngIntf,Data.DB, System.Classes, Data.Win.ADODB, Datasnap.Provider, Datasnap.DBClient,
  system.SysUtils, System.Variants, Datasnap.DSIntf, System.ZLib, Xml.XMLDoc, Xml.XMLIntf,
  Winapi.Windows;

type

  TBaseEngImpl = class(TInterfacedObject, IEngIntf)
  protected

  protected
    FBCustomerDelePost: Boolean;
    FBDeleErrIgnore: Boolean;
    FCon: TADOConnection;
    FAds: TADODataSet;
    FDsp: TDataSetProvider;
    FCds: TClientDataSet;
    FConstring: string;
    //function SetHiddenField(ADelta: OleVariant; out outDelta: OleVariant;out ErrMsg: string): Boolean;virtual;
    procedure DSPBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);virtual;
    procedure DSPAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);virtual;
    procedure DSPUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);virtual;
  public
    FNowSelfTable: string;
    constructor Create(AConStr: string);
    destructor Destroy; override;
    function GetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string;ACompress: Boolean = False): Boolean;virtual;
    function PostDataByTable(ATable: string;AData: OleVariant; out ErrMsg: string): Boolean;virtual;
    function GetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string;ACompress: Boolean = False): Boolean;virtual;
    function PostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;virtual;
    function spGetData(AspName: string;AParamArr: OleVariant; out AData: Olevariant;Out ErrMsg:string;ACompress: Boolean = False): Boolean;
    function spExec(AspName: string;var AParamArr: OleVariant; out ErrMsg:string):boolean;
  end;

  TBaseModPostEngImpl = class(TBaseEngImpl,IEngIntf)
  protected
    FModID: Integer;
    FModChildID: Integer;
    FNowTableIndex: Integer;
    FNowParentTable: string;
    FNowSelfToParentPtrField: string;
    FNowparentTableKeyField: string;
    FNowSelfToParentIDKeyField: string;
    procedure DSPBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);override;
  public
    constructor Create(AConStr: string; AModID: Integer; AMOdChildID: Integer = 0);
    function PostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;override;
  end;

implementation

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


{ TBaseEngImpl }

constructor TBaseEngImpl.Create(AConStr: string);
begin
  inherited Create();
  FConstring := AConStr;
  FCon := TADOConnection.Create(nil);
  FCon.ConnectionString :=  AConStr;
  FCon.CommandTimeout := 60*5;
  FCon.ConnectionTimeout := 60*5;
  FCon.LoginPrompt := False;
  FCon.KeepConnection := True;

  FAds := TADODataSet.Create(nil);
  FAds.Connection := FCon;
  FAds.MaxRecords := 20*10000;
  FAds.DisableControls;

  FDsp := TDataSetProvider.Create(nil);
  FDsp.DataSet := FAds;
  FDsp.BeforeUpdateRecord := DSPBeforeUpdateRecord;
  FDsp.AfterUpdateRecord := DSPAfterUpdateRecord;
  FDsp.OnUpdateError := DSPUpdateError;

  FCds := TClientDataSet.Create(nil);
  FCds.DisableControls;
  FCds.SetProvider(FDsp);

  try
    FCon.Connected := True;
  Except
  end;
end;

destructor TBaseEngImpl.Destroy;
begin
  FAds.Close;
  FCon.Close;
  FCds.Free;
  FDsp.Free;
  FAds.Free;
  FCon.Free;
  inherited;
end;

procedure TBaseEngImpl.DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin

end;

procedure TBaseEngImpl.DSPBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);

  function ExtractWhereStr(AParams: TParams;AField: TField): string;
  begin
    if VarIsNull(AField.OldValue) then
    begin
      Result := Format(' %s%s%s%1:s is null ',       { Do not localize }
        ['', '', AField.Origin])
    end else
    begin
      Result := Format(' %s%s%s%1:s = ? ',           { Do not localize }
        ['', '', AField.Origin]);
      TParam(AParams.Add).AssignFieldValue(AField, AField.OldValue);
    end;
  end;

const
  ExcludedTypes = [ftDataSet, ftADT, ftArray, ftReference, ftCursor, ftUnknown];
var
  LParams: TParams;
  LField: TField;
  LBAddWhere: Boolean;
  LSql: string;
begin
  case UpdateKind of
    ukModify: ;
    ukInsert: ;
    ukDelete:
    begin
      if FBCustomerDelePost then
      begin
        LParams := TParams.Create(nil);
        try
          for LField in DeltaDS.Fields do
          begin
            LBAddWhere := not (LField.DataType in ExcludedTypes) and not LField.IsBlob and (LField.FieldKind = fkData);
            if LBAddWhere then
            begin
              if LSql = '' then
                LSql := 'DELETE FROM ' + FNowSelfTable + ' where ' + ExtractWhereStr(LParams,LField)
              else
              if not (pfHidden in LField.ProviderFlags) then
                LSql := LSql + ' and ' + ExtractWhereStr(LParams,LField);
            end;
          end;
          IProviderSupportNG(FAds).PSExecuteStatement(LSql, LParams);
        finally
          LParams.Free;
        end;
        Applied := True;
      end;
    end;
  end;
end;

procedure TBaseEngImpl.DSPUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  case UpdateKind of
    ukModify: raise Exception.Create(E.Message);
    ukInsert: raise Exception.Create(E.Message);
    ukDelete:
    begin
      if FBDeleErrIgnore then
        Response := rrIgnore
      else
        raise Exception.Create(E.Message);
    end;
  end;
end;

function TBaseEngImpl.GetDataBySql(ASql: string; out AData: OleVariant;
  out ErrMsg: string;ACompress: Boolean = False): Boolean;
begin
  ErrMsg := '';
  if not FCon.Connected then
  begin
    ErrMsg := '数据库连接失败';
    Result := False;
    Exit;
  end;
  FAds.Close;
  FAds.CommandText := ASql;
  try
    FAds.Open;
    if ACompress then
      AData := CompressData(FDsp.Data)
    else
      AData := FDsp.Data;
    Result := True;
  except
    on E: Exception do
    begin
      ErrMsg := E.Message;
      Result := False;
    end;
  end;
end;

function TBaseEngImpl.GetDataBySqlArr(ASqlArr: OleVariant;
  out ADataArr: OleVariant; out ErrMsg: string;ACompress: Boolean = False): Boolean;
var
  I: Integer;
  LData: OleVariant;
begin
  Result := True;
  ErrMsg := '';
  if not FCon.Connected then
  begin
    ErrMsg := '数据库连接失败';
    Result := False;
    Exit;
  end;
  ADataArr := VarArrayCreate([VarArrayLowBound(ASqlArr,1),VarArrayHighBound(ASqlArr,1)],varVariant);
  for I := VarArrayLowBound(ASqlArr,1) to VarArrayHighBound(ASqlArr,1) do
  begin
    Result := GetDataBySql(ASqlArr[I],LData,ErrMsg,ACompress);
    if not Result then Exit else ADataArr[I] := LData;
  end;
end;

function TBaseEngImpl.PostDataByTable(ATable: string; AData: OleVariant;
  out ErrMsg: string): Boolean;
var
  LNewData: OleVariant;
  N: Integer;
begin
  FNowSelfTable := ATable;
  if VarType(AData) = varEmpty then
  begin
    Result := True;
    Exit;
  end;
  ErrMsg := '';
  if not FCon.Connected then
  begin
    ErrMsg := '数据库连接失败';
    Result := False;
    Exit;
  end;
  FAds.Close;
  FAds.CommandText := 'SELECT * FROM ' + ATable + ' WHERE 1=0';


  //--无用
//  if not SetHiddenField(AData,LNewData,ErrMsg) then
//  begin
//    Result := False;
//    Exit;
//  end;
  //--


//  FCds.Data := LNewData;
//  FCds.SetProvider(FDsp);
  try
    FDsp.ApplyUpdates(LNewData,0,N);
    //Result := FCds.ApplyUpdates(0) = 0;
    Result := N = 0;
  except
    on E: Exception do
    begin
      ErrMsg := E.Message;
      Result := False;
    end;
  end;
end;



{$REGION '无用'}


//
//function TBaseEngImpl.SetHiddenField(ADelta: OleVariant; out outDelta: OleVariant; out ErrMsg: string): Boolean;
//var
//  LDSBase: IDSBase;
//  LDSPack: TDataPacket;
//  LProp: DSProps;
//  LFieldArr: array of DSFLDDesc;
//  I: Integer;
//  LFieldName: string;
//
//  LValue: Integer;
//  LProPName: Pointer;
//  M: TMarshaller;
//  LOutDsPack: TDataPacket;
//begin
//  Result := False;
//  try
//  {$REGION '取得IDSBASE接口'}
//  CreateDbClientObject(CLSID_DSBase, IDSBase, LDSBase);
//  LDSBase.SetProp(dspropANSICODEPAGE, DefaultSystemCodePage);
//  LDSBase.SetProp(dspropUTF8METADATA, NativeUInt(True));
//  LDSBase.SetProp(dspropUTF8ERRORMSG, NativeUInt(True));
//  if not Assigned(LDSBase) then
//  begin
//    ErrMsg := 'LDSBase.AppendData Error';
//    Exit;
//  end;
//
//  {$ENDREGION}
//
//  {$REGION '添加数据到IDSBASE'}
//  LDSPack := VarToDataPacket(ADelta);
//  if LDSBase.AppendData(LDSPack,True) <> 0 then
//  begin
//    ErrMsg := 'LDSBase.AppendData Error';
//    Exit;
//  end;
//  {$ENDREGION}
//
//  {$REGION '设置字段的HIDDEN属性'}
//  FAds.Open;
//
//  if LDSBase.GetProps(LProp) <> 0 then
//  begin
//    ErrMsg := 'LDSBase.GetProps Error';
//    Exit;
//  end;
//  SetLength(LFieldArr,LProp.iFields);
//  ZeroMemory(@LFieldArr[0],SizeOf(LFieldArr));
//  if LDSBase.GetFieldDescs(@LFieldArr[0]) <> 0 then
//  begin
//    ErrMsg := 'LDSBase.GetFieldDesc Error';
//    Exit;
//  end;
//
//  for I := 0 to Length(LFieldArr) - 1  do
//  begin
//    LFieldName := string(LFieldArr[I].szName);
//    if LFieldName <> '' then
//    begin
//      if FAds.FindField(LFieldName) = nil then
//      begin
//        LValue := 8;
//        LProPName := M.AsUTF8(szPROVFLAGS).ToPointer;
//        if LDSBase.AddOptParameter(lfieldarr[I].iFieldID,LProPName,2147549188,4,@LValue) <> 0 then
//        begin
//          ErrMsg := 'LDSBase.AddOptParameter Error';
//          Exit;
//        end;
//      end;
//    end;
//  end;
//
//  {$ENDREGION}
//
//
//  {$REGION '重新获取数据'}
//  LDSBase.StreamDS(LOutDsPack);
//  DataPacketToVariant(LOutDsPack,outDelta);
//  {$ENDREGION}
//
//  Result := True;
//  except
//    on E: Exception do
//    begin
//      ErrMsg := e.Message;
//      Result := False;
//    end;
//  end;
//end;
//
//



{$ENDREGION}



function TBaseEngImpl.PostDataBySqlArr(ATableArr, ADataArr: OleVariant;
  out ErrMsg: string): Boolean;
var
  I: Integer;
begin
  Result := True;
  ErrMsg := '';
  if not FCon.Connected then
  begin
    ErrMsg := '数据库连接失败';
    Result := False;
    Exit;
  end;
  FCon.BeginTrans;
  try
    FBCustomerDelePost := True;
    for I := VarArrayLowBound(ATableArr,1) to VarArrayHighBound(ATableArr,1) do
    begin
      Result := PostDataByTable(ATableArr[I],ADataArr[I],ErrMsg);
      if not Result then Exit;
    end;
    FCon.CommitTrans;
  finally
    if FCon.InTransaction then
    begin
      FCon.RollbackTrans;
      Result := False;
    end;
  end;
end;


function TBaseEngImpl.spExec(AspName: string;var AParamArr: OleVariant;
  out ErrMsg: string): boolean;
var
  LSp: TADOStoredProc;
  I: Integer;
begin
  ErrMsg := '';
  if not FCon.Connected then
  begin
    ErrMsg := '数据库连接失败';
    Result := False;
    Exit;
  end;
  LSp := TADOStoredProc.Create(nil);
  try
    try
      LSp.Connection := FCon;
      LSp.ProcedureName := AspName;
      LSp.Parameters.Refresh;
      for I := VarArrayLowBound(AParamArr,1) to VarArrayHighBound(AParamArr,1) do
      begin
        LSp.Parameters[I].Value := AParamArr[I];
      end;
      LSp.ExecProc;
      AParamArr[0] := LSp.Parameters[0].Value;
      Result := True;
    except
      on E: Exception do
      begin
        ErrMsg := E.Message;
        Result := False;
      end;
    end;
  finally
    LSp.Free;
  end;
end;

function TBaseEngImpl.spGetData(AspName: string; AParamArr: OleVariant;
  out AData: Olevariant; out ErrMsg: string;ACompress: Boolean = False): Boolean;
var
  LSp: TADOStoredProc;
  I: Integer;
begin
  ErrMsg := '';
  if not FCon.Connected then
  begin
    ErrMsg := '数据库连接失败';
    Result := False;
    Exit;
  end;
  LSp := TADOStoredProc.Create(nil);
  try
    try
      LSp.Connection := FCon;
      FDsp.DataSet := LSp;
      LSp.ProcedureName := AspName;
      LSp.Parameters.Refresh;
      for I := VarArrayLowBound(AParamArr,1) to VarArrayHighBound(AParamArr,1) do
      begin
        LSp.Parameters[I+1].Value := AParamArr[I];
      end;
      LSp.Open;
      if ACompress then
        AData := CompressData(FDsp.Data)
      else
        AData := FDsp.Data;
      Result := True;
    except
      on E: Exception do
      begin
        ErrMsg := E.Message;
        Result := False;
      end;
    end;
  finally
    LSp.Free;
  end;
end;

{ TBaseModPostEngImpl }

constructor TBaseModPostEngImpl.Create(AConStr: string; AModID,
  AMOdChildID: Integer);
begin
  FModID := AModID;
  FModChildID := AMOdChildID;
  inherited Create(AConStr);
end;


procedure TBaseModPostEngImpl.DSPBeforeUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind;
  var Applied: Boolean);
var
  LQry: TADOQuery;
begin
  case UpdateKind of
    ukModify: ;
    ukInsert:
      if FNowParentTable <> '' then
      begin
        if DeltaDS.FieldByName(FNowSelfToParentPtrField).AsInteger = 0 then
        begin
          LQry := TADOQuery.Create(nil);
          try
            LQry.Connection := FCon;
            LQry.SQL.Add('SELECT ' + FNowparentTableKeyField + ' FROM ' + FNowParentTable + ' WHERE IDKEY = ' + QuotedStr(DeltaDS.FieldByName(FNowSelfToParentIDKeyField).AsString));
            LQry.Open;
            if not LQry.IsEmpty then
            begin
              DeltaDS.FieldByName(FNowSelfToParentPtrField).NewValue := LQry.FieldByName(FNowparentTableKeyField).AsInteger;
            end;
          finally
            LQry.Free;
          end;
        end;
      end;
    ukDelete: inherited;
  end;
end;


function TBaseModPostEngImpl.PostDataBySqlArr(ATableArr, ADataArr: OleVariant;
  out ErrMsg: string): Boolean;
var
  LCds: TClientDataSet;
  LData: OleVariant;
  LSql: string;
begin
  LCds := TClientDataSet.Create(nil);
  try
    LSql := 'select * from Tier3_ModTablesForPostData where MODID = ' + IntToStr(FModID) +
            ' and ChildID = ' + IntToStr(FModChildID) + ' order by seqno asc';
    Result := GetDataBySql(LSql,LData,ErrMsg);
    if not Result then Exit;
    if VarType(LData) = varEmpty then
    begin
      Result := False;
      ErrMsg := 'Tier3_ModTablesForPostData模块表结果为空';
      Exit;
    end;
    LCds.Data := LData;
    LCds.First;
    FCon.BeginTrans;
    try
      FBCustomerDelePost := True;
      while not LCds.Eof do
      begin
        FBDeleErrIgnore := False;
        FNowTableIndex := LCds.FieldByName('SeqNo').AsInteger;
        FNowSelfTable := LCds.FieldByName('SelfTable').AsString;
        FNowParentTable := LCds.FieldByName('ParentTable').AsString;
        FNowparentTableKeyField := LCds.FieldByName('ParentTableKeyField').AsString;
        FNowSelfToParentPtrField := LCds.FieldByName('SelfToParent_PtrField').AsString;
        FNowSelfToParentIDKeyField := LCds.FieldByName('PerentIDKeyField').AsString;
        Result := PostDataByTable(FNowSelfTable,ADataArr[FNowTableIndex],ErrMsg);
        if not Result then Exit;
        LCds.Next;
      end;
      FCon.CommitTrans;
    finally
      if FCon.InTransaction then
      begin
        FCon.RollbackTrans;
        Result := False;
      end;
    end;
  finally
    LCds.Free;
  end;
end;

end.
