{*******************************************************}
{                                                       }
{       Chengtx                                         }
{                                                       }
{       版权所有 (C) 2016 5.17                          }
{                                                       }
{*******************************************************}


unit DBImpl;

interface
uses
  DBIntf, Data.DB, System.Classes, Data.Win.ADODB, Datasnap.Provider, Datasnap.DBClient,
  system.SysUtils;

type
  TDataBase = class(TInterfacedObject, IData)
  protected
    FBDeleErrIngro: Boolean;
    FCon: TADOConnection;
    FAds: TADODataSet;
    FDsp: TDataSetProvider;
    FCds: TClientDataSet;
    FConstring: string;
    procedure DSPBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);virtual;
    procedure DSPAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);virtual;
    procedure DSPUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError;
      UpdateKind: TUpdateKind; var Response: TResolverResponse);virtual;
  public
    constructor Create(AConStr: string);
    destructor Destroy; override;
    function GetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string): Boolean;virtual;
    function PostDataBySql(ASql: string;AData: OleVariant; out ErrMsg: string): Boolean;virtual;
    function GetDataBySqlArr(ArrSql: OleVariant; out ADataArr: OleVariant; out ErrMsg: string): Boolean;virtual;
    function PostDataBySqlArr(ArrSql: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;virtual;
  end;

  TModCommon = class(TDataBase, IData)
  protected
    FModID: Integer;
    FI: Integer;
    FMaterKeyValue: string;
    FNowPtrKeyField: string;
    FNowTable: string;
  protected
    procedure DSPBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);override;
    procedure DSPAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);override;
  public
    constructor Create(AModID: Integer; AConStr: string);
    function PostDataBySqlArr(ArrSql: OleVariant; AData: OleVariant; out ErrMsg: string): Boolean;override;
  end;

  //工程MI设计
  TMod119 = class(TModCommon,IData)
  protected
    procedure DSPBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);override;
    procedure DSPAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);override;
  end;



implementation

uses
  System.Variants;


{ TDataBase }

constructor TDataBase.Create(AConStr: string);
begin
  inherited Create();
  FConstring := AConStr;
  FCon := TADOConnection.Create(nil);
  FCon.ConnectionString :=  AConStr;
  FCon.CommandTimeout := 60;
  FCon.ConnectionTimeout := 60;
  FCon.LoginPrompt := False;
  FCon.KeepConnection := True;

  FAds := TADODataSet.Create(nil);
  FAds.Connection := FCon;

  FDsp := TDataSetProvider.Create(nil);
  FDsp.DataSet := FAds;
  FDsp.BeforeUpdateRecord := DSPBeforeUpdateRecord;
  FDsp.AfterUpdateRecord := DSPAfterUpdateRecord;
  FDsp.OnUpdateError := DSPUpdateError;

  FCds := TClientDataSet.Create(nil);
  FCds.SetProvider(FDsp);

  try
    FCon.Connected := True;
  Except
  end;
end;

destructor TDataBase.Destroy;
begin
  FAds.Close;
  FCon.Close;
  FCds.Free;
  FDsp.Free;
  FAds.Free;
  FCon.Free;
  inherited;
end;

procedure TDataBase.DSPUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError;
  UpdateKind: TUpdateKind; var Response: TResolverResponse);
begin
  case UpdateKind of
    ukModify: raise Exception.Create(E.Message);
    ukInsert: raise Exception.Create(E.Message);
    ukDelete:
    begin
      if FBDeleErrIngro then
        Response := rrIgnore
      else
        raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TDataBase.DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin

end;

procedure TDataBase.DSPBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin

end;

function TDataBase.GetDataBySql(ASql: string; out AData: OleVariant;
  out ErrMsg: string): Boolean;
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

function TDataBase.GetDataBySqlArr(ArrSql: OleVariant; out ADataArr: OleVariant;
  out ErrMsg: string): Boolean;
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
  ADataArr := VarArrayCreate([VarArrayLowBound(ArrSql,1),VarArrayHighBound(ArrSql,1)],varVariant);
  for I := VarArrayLowBound(ArrSql,1) to VarArrayHighBound(ArrSql,1) do
  begin
    Result := GetDataBySql(ArrSql[I],LData,ErrMsg);
    if not Result then Exit else ADataArr[I] := LData;
  end;
end;

function TDataBase.PostDataBySql(ASql: string; AData: OleVariant;
  out ErrMsg: string): Boolean;
begin
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
  FAds.CommandText := ASql;
  FCds.Data := AData;
  FCds.SetProvider(FDsp);
  try
    Result := FCds.ApplyUpdates(0) = 0;
  except
    on E: Exception do
    begin
      ErrMsg := E.Message;
      Result := False;
    end;
  end;
end;

function TDataBase.PostDataBySqlArr(ArrSql, ADataArr: OleVariant;
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
    for I := VarArrayLowBound(ArrSql,1) to VarArrayHighBound(ArrSql,1) do
    begin
      Result := PostDataBySql(ArrSql[I],ADataArr[I],ErrMsg);
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


{ TModCommon }

constructor TModCommon.Create(AModID: Integer; AConStr: string);
begin
  FModID := AModID;
  inherited Create(AConStr);
end;

procedure TModCommon.DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
var
  Lqry: TADOQuery;
begin
  if FI = 0 then
  begin
    case UpdateKind of
      ukModify: ;
      ukInsert:
      begin
        Lqry := TADOQuery.Create(nil);
        try
          Lqry.Connection := FCon;
          Lqry.SQL.Add('SELECT IDENT_CURRENT( ' + QuotedStr(FNowTable) + ')' + ' as rkey');
          Lqry.Open;
          FMaterKeyValue := Lqry.FieldByName('rkey').AsString;
        finally
          Lqry.Free;
        end;
      end;
      ukDelete: ;
    end;
  end;
end;

procedure TModCommon.DSPBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
begin
  if FI = 0 then
  begin
    case UpdateKind of
      ukModify: ;//FMaterKeyValue := DeltaDS.FieldByName(FNowPtrKeyField).AsString;
      ukInsert: ;
      ukDelete: ;
    end;
  end else
  begin
    case UpdateKind of
      ukModify: ;
      ukInsert:
      begin
        try
          if DeltaDS.FieldByName(FNowPtrKeyField).AsInteger = 0 then
            DeltaDS.FieldByName(FNowPtrKeyField).NewValue := FMaterKeyValue;
        except
        end;
      end;
      ukDelete: ;
    end;
  end;

end;

function TModCommon.PostDataBySqlArr(ArrSql, AData: OleVariant;
  out ErrMsg: string): Boolean;
var
  LCds: TClientDataSet;
  LSql: string;
  LData: OleVariant;
  I: Integer;
begin
  LCds := TClientDataSet.Create(nil);
  LSql := 'select * from sysModuleTables where ModId=' + IntToStr(FModID) + ' order by SeqNo asc';
  try
    Result := GetDataBySql(LSql,LData,ErrMsg);
    if not Result or (VarType(LData) = varEmpty) then Exit;
    LCds.Data := LData;
    LCds.First;
    FI := 0;
    FCon.BeginTrans;
    try
      for I := 0 to LCds.RecordCount - 1 do
      begin
        FI := I;
        FBDeleErrIngro := False;
        FNowPtrKeyField := LCds.FieldByName('PKName').AsString;
        FNowTable := LCds.FieldByName('TableName').AsString;
        Result := PostDataBySql(ArrSql[I],AData[I],ErrMsg);
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



{ TMod119 }

procedure TMod119.DSPAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
  if FI = 0 then //data0025
  begin

  end;
  if FI = 1 then //data0502
  begin
    case UpdateKind of
      ukModify: ;
      ukInsert: ;
      ukDelete: FBDeleErrIngro := True;
    end;
  end;

end;

procedure TMod119.DSPBeforeUpdateRecord(Sender: TObject; SourceDS: TDataSet;
  DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind; var Applied: Boolean);
var
  LQry: TADOQuery;
begin
  if FI = 0 then //data0025
  begin
    case UpdateKind of
      ukModify: ;
      ukInsert:
      begin
        Lqry := TADOQuery.Create(nil);
        try
          Lqry.Connection := FCon;
          Lqry.SQL.Add('select rkey from data0025 where idkey = ' + QuotedStr(DeltaDS.FieldByName('parent_idkey').AsString));
          Lqry.Open;
          if not LQry.IsEmpty then
            DeltaDS.FieldByName('parent_ptr').NewValue := LQry.FieldByName('rkey').AsInteger;
        finally
          Lqry.Free;
        end;
      end;
      ukDelete: ;
    end;
  end;
  if FI = 1 then //data0502
  begin
    case UpdateKind of
      ukModify: ;
      ukInsert:
      begin
        Lqry := TADOQuery.Create(nil);
        try
          Lqry.Connection := FCon;
          Lqry.SQL.Add('select rkey from data0025 where idkey = ' + QuotedStr(DeltaDS.FieldByName('d25_idkey').AsString));
          Lqry.Open;
          if not LQry.IsEmpty then
            DeltaDS.FieldByName('source_ptr').NewValue := LQry.FieldByName('rkey').AsInteger;
        finally
          Lqry.Free;
        end;
      end;
      ukDelete: ;
    end;
  end;
end;

end.
