//
// Created by the DataSnap proxy generator.
// 2018/6/20 9:50:39
//

unit qkServerPhysIntf;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TSvrMethodsClient = class(TDSAdminClient)
  private
    FIntf_RefreshSqlBufferCommand: TDBXCommand;
    FIntf_SqlOpenCommand: TDBXCommand;
    FIntf_SpOpenCommand: TDBXCommand;
    FIntf_SqlExecCommand: TDBXCommand;
    FIntf_SpExecCommand: TDBXCommand;
    FIntf_PostDataByTableArrCommand: TDBXCommand;
    FIntf_RefreshRegTimeCommand: TDBXCommand;
    FIntf_CheckALterRegDateCommand: TDBXCommand;
    Fintf_UpdateRegCodeCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function Intf_RefreshSqlBuffer(AConDefName: string; out AErrMsg: OleVariant): Boolean;
    function Intf_SqlOpen(AConDefName: string; ASqlName: string; var AParamSM: TStream; out AOutDataSM: TStream; out AOutDataSizeArr: OleVariant; out AErrMsg: OleVariant): Boolean;
    function Intf_SpOpen(AConDefName: string; ASpName: string; var AParamSM: TStream; out AOutDataSM: TStream; out AOutDataSizeArr: OleVariant; out AErrMsg: OleVariant): Boolean;
    function Intf_SqlExec(AConDefName: string; ASqlName: string; var AParamSM: TStream; out AErrMsg: OleVariant): Boolean;
    function Intf_SpExec(AConDefName: string; ASpName: string; var AParamSM: TStream; out AErrMsg: OleVariant): Boolean;
    function Intf_PostDataByTableArr(AConDefName: string; var ADeltaSM: TStream; ADeltaSMSizeArr: string; ATableArr: string; out AErrMsg: OleVariant): Boolean;
    function Intf_RefreshRegTime(AConDefName: string; out AErrMsg: OleVariant): Boolean;
    function Intf_CheckALterRegDate(AConDefName: string; out AErrMsg: OleVariant): Integer;
    function intf_UpdateRegCode(AConDefName: string; key1: string; key2: string; out AErrMsg: OleVariant): Boolean;
  end;

implementation

function TSvrMethodsClient.Intf_RefreshSqlBuffer(AConDefName: string; out AErrMsg: OleVariant): Boolean;
begin
  if FIntf_RefreshSqlBufferCommand = nil then
  begin
    FIntf_RefreshSqlBufferCommand := FDBXConnection.CreateCommand;
    FIntf_RefreshSqlBufferCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntf_RefreshSqlBufferCommand.Text := 'TSvrMethods.Intf_RefreshSqlBuffer';
    FIntf_RefreshSqlBufferCommand.Prepare;
  end;
  FIntf_RefreshSqlBufferCommand.Parameters[0].Value.SetWideString(AConDefName);
  FIntf_RefreshSqlBufferCommand.ExecuteUpdate;
  AErrMsg := FIntf_RefreshSqlBufferCommand.Parameters[1].Value.AsVariant;
  Result := FIntf_RefreshSqlBufferCommand.Parameters[2].Value.GetBoolean;
end;

function TSvrMethodsClient.Intf_SqlOpen(AConDefName: string; ASqlName: string; var AParamSM: TStream; out AOutDataSM: TStream; out AOutDataSizeArr: OleVariant; out AErrMsg: OleVariant): Boolean;
begin
  if FIntf_SqlOpenCommand = nil then
  begin
    FIntf_SqlOpenCommand := FDBXConnection.CreateCommand;
    FIntf_SqlOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntf_SqlOpenCommand.Text := 'TSvrMethods.Intf_SqlOpen';
    FIntf_SqlOpenCommand.Prepare;
  end;
  FIntf_SqlOpenCommand.Parameters[0].Value.SetWideString(AConDefName);
  FIntf_SqlOpenCommand.Parameters[1].Value.SetWideString(ASqlName);
  FIntf_SqlOpenCommand.Parameters[2].Value.SetStream(AParamSM, FInstanceOwner);
  FIntf_SqlOpenCommand.ExecuteUpdate;
  AParamSM := FIntf_SqlOpenCommand.Parameters[2].Value.GetStream(FInstanceOwner);
  AOutDataSM := FIntf_SqlOpenCommand.Parameters[3].Value.GetStream(FInstanceOwner);
  AOutDataSizeArr := FIntf_SqlOpenCommand.Parameters[4].Value.AsVariant;
  AErrMsg := FIntf_SqlOpenCommand.Parameters[5].Value.AsVariant;
  Result := FIntf_SqlOpenCommand.Parameters[6].Value.GetBoolean;
end;

function TSvrMethodsClient.Intf_SpOpen(AConDefName: string; ASpName: string; var AParamSM: TStream; out AOutDataSM: TStream; out AOutDataSizeArr: OleVariant; out AErrMsg: OleVariant): Boolean;
begin
  if FIntf_SpOpenCommand = nil then
  begin
    FIntf_SpOpenCommand := FDBXConnection.CreateCommand;
    FIntf_SpOpenCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntf_SpOpenCommand.Text := 'TSvrMethods.Intf_SpOpen';
    FIntf_SpOpenCommand.Prepare;
  end;
  FIntf_SpOpenCommand.Parameters[0].Value.SetWideString(AConDefName);
  FIntf_SpOpenCommand.Parameters[1].Value.SetWideString(ASpName);
  FIntf_SpOpenCommand.Parameters[2].Value.SetStream(AParamSM, FInstanceOwner);
  FIntf_SpOpenCommand.ExecuteUpdate;
  AParamSM := FIntf_SpOpenCommand.Parameters[2].Value.GetStream(FInstanceOwner);
  AOutDataSM := FIntf_SpOpenCommand.Parameters[3].Value.GetStream(FInstanceOwner);
  AOutDataSizeArr := FIntf_SpOpenCommand.Parameters[4].Value.AsVariant;
  AErrMsg := FIntf_SpOpenCommand.Parameters[5].Value.AsVariant;
  Result := FIntf_SpOpenCommand.Parameters[6].Value.GetBoolean;
end;

function TSvrMethodsClient.Intf_SqlExec(AConDefName: string; ASqlName: string; var AParamSM: TStream; out AErrMsg: OleVariant): Boolean;
begin
  if FIntf_SqlExecCommand = nil then
  begin
    FIntf_SqlExecCommand := FDBXConnection.CreateCommand;
    FIntf_SqlExecCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntf_SqlExecCommand.Text := 'TSvrMethods.Intf_SqlExec';
    FIntf_SqlExecCommand.Prepare;
  end;
  FIntf_SqlExecCommand.Parameters[0].Value.SetWideString(AConDefName);
  FIntf_SqlExecCommand.Parameters[1].Value.SetWideString(ASqlName);
  FIntf_SqlExecCommand.Parameters[2].Value.SetStream(AParamSM, FInstanceOwner);
  FIntf_SqlExecCommand.ExecuteUpdate;
  AParamSM := FIntf_SqlExecCommand.Parameters[2].Value.GetStream(FInstanceOwner);
  AErrMsg := FIntf_SqlExecCommand.Parameters[3].Value.AsVariant;
  Result := FIntf_SqlExecCommand.Parameters[4].Value.GetBoolean;
end;

function TSvrMethodsClient.Intf_SpExec(AConDefName: string; ASpName: string; var AParamSM: TStream; out AErrMsg: OleVariant): Boolean;
begin
  if FIntf_SpExecCommand = nil then
  begin
    FIntf_SpExecCommand := FDBXConnection.CreateCommand;
    FIntf_SpExecCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntf_SpExecCommand.Text := 'TSvrMethods.Intf_SpExec';
    FIntf_SpExecCommand.Prepare;
  end;
  FIntf_SpExecCommand.Parameters[0].Value.SetWideString(AConDefName);
  FIntf_SpExecCommand.Parameters[1].Value.SetWideString(ASpName);
  FIntf_SpExecCommand.Parameters[2].Value.SetStream(AParamSM, FInstanceOwner);
  FIntf_SpExecCommand.ExecuteUpdate;
  AParamSM := FIntf_SpExecCommand.Parameters[2].Value.GetStream(FInstanceOwner);
  AErrMsg := FIntf_SpExecCommand.Parameters[3].Value.AsVariant;
  Result := FIntf_SpExecCommand.Parameters[4].Value.GetBoolean;
end;

function TSvrMethodsClient.Intf_PostDataByTableArr(AConDefName: string; var ADeltaSM: TStream; ADeltaSMSizeArr: string; ATableArr: string; out AErrMsg: OleVariant): Boolean;
begin
  if FIntf_PostDataByTableArrCommand = nil then
  begin
    FIntf_PostDataByTableArrCommand := FDBXConnection.CreateCommand;
    FIntf_PostDataByTableArrCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntf_PostDataByTableArrCommand.Text := 'TSvrMethods.Intf_PostDataByTableArr';
    FIntf_PostDataByTableArrCommand.Prepare;
  end;
  FIntf_PostDataByTableArrCommand.Parameters[0].Value.SetWideString(AConDefName);
  FIntf_PostDataByTableArrCommand.Parameters[1].Value.SetStream(ADeltaSM, FInstanceOwner);
  FIntf_PostDataByTableArrCommand.Parameters[2].Value.SetWideString(ADeltaSMSizeArr);
  FIntf_PostDataByTableArrCommand.Parameters[3].Value.SetWideString(ATableArr);
  FIntf_PostDataByTableArrCommand.ExecuteUpdate;
  ADeltaSM := FIntf_PostDataByTableArrCommand.Parameters[1].Value.GetStream(FInstanceOwner);
  AErrMsg := FIntf_PostDataByTableArrCommand.Parameters[4].Value.AsVariant;
  Result := FIntf_PostDataByTableArrCommand.Parameters[5].Value.GetBoolean;
end;

function TSvrMethodsClient.Intf_RefreshRegTime(AConDefName: string; out AErrMsg: OleVariant): Boolean;
begin
  if FIntf_RefreshRegTimeCommand = nil then
  begin
    FIntf_RefreshRegTimeCommand := FDBXConnection.CreateCommand;
    FIntf_RefreshRegTimeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntf_RefreshRegTimeCommand.Text := 'TSvrMethods.Intf_RefreshRegTime';
    FIntf_RefreshRegTimeCommand.Prepare;
  end;
  FIntf_RefreshRegTimeCommand.Parameters[0].Value.SetWideString(AConDefName);
  FIntf_RefreshRegTimeCommand.ExecuteUpdate;
  AErrMsg := FIntf_RefreshRegTimeCommand.Parameters[1].Value.AsVariant;
  Result := FIntf_RefreshRegTimeCommand.Parameters[2].Value.GetBoolean;
end;

function TSvrMethodsClient.Intf_CheckALterRegDate(AConDefName: string; out AErrMsg: OleVariant): Integer;
begin
  if FIntf_CheckALterRegDateCommand = nil then
  begin
    FIntf_CheckALterRegDateCommand := FDBXConnection.CreateCommand;
    FIntf_CheckALterRegDateCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntf_CheckALterRegDateCommand.Text := 'TSvrMethods.Intf_CheckALterRegDate';
    FIntf_CheckALterRegDateCommand.Prepare;
  end;
  FIntf_CheckALterRegDateCommand.Parameters[0].Value.SetWideString(AConDefName);
  FIntf_CheckALterRegDateCommand.ExecuteUpdate;
  AErrMsg := FIntf_CheckALterRegDateCommand.Parameters[1].Value.AsVariant;
  Result := FIntf_CheckALterRegDateCommand.Parameters[2].Value.GetInt32;
end;

function TSvrMethodsClient.intf_UpdateRegCode(AConDefName: string; key1: string; key2: string; out AErrMsg: OleVariant): Boolean;
begin
  if Fintf_UpdateRegCodeCommand = nil then
  begin
    Fintf_UpdateRegCodeCommand := FDBXConnection.CreateCommand;
    Fintf_UpdateRegCodeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    Fintf_UpdateRegCodeCommand.Text := 'TSvrMethods.intf_UpdateRegCode';
    Fintf_UpdateRegCodeCommand.Prepare;
  end;
  Fintf_UpdateRegCodeCommand.Parameters[0].Value.SetWideString(AConDefName);
  Fintf_UpdateRegCodeCommand.Parameters[1].Value.SetWideString(key1);
  Fintf_UpdateRegCodeCommand.Parameters[2].Value.SetWideString(key2);
  Fintf_UpdateRegCodeCommand.ExecuteUpdate;
  AErrMsg := Fintf_UpdateRegCodeCommand.Parameters[3].Value.AsVariant;
  Result := Fintf_UpdateRegCodeCommand.Parameters[4].Value.GetBoolean;
end;

constructor TSvrMethodsClient.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TSvrMethodsClient.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TSvrMethodsClient.Destroy;
begin
  FIntf_RefreshSqlBufferCommand.DisposeOf;
  FIntf_SqlOpenCommand.DisposeOf;
  FIntf_SpOpenCommand.DisposeOf;
  FIntf_SqlExecCommand.DisposeOf;
  FIntf_SpExecCommand.DisposeOf;
  FIntf_PostDataByTableArrCommand.DisposeOf;
  FIntf_RefreshRegTimeCommand.DisposeOf;
  FIntf_CheckALterRegDateCommand.DisposeOf;
  Fintf_UpdateRegCodeCommand.DisposeOf;
  inherited;
end;

end.

