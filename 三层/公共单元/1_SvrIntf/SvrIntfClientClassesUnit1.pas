//
// Created by the DataSnap proxy generator.
// 2017-1-17 10:52:06
//

unit SvrIntfClientClassesUnit1;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FIntfGetDataBySqlCommand: TDBXCommand;
    FIntfPostDataByTableCommand: TDBXCommand;
    FIntfGetDataBySqlArrCommand: TDBXCommand;
    FIntfPostDataBySqlArrCommand: TDBXCommand;
    FIntfPostModDataCommand: TDBXCommand;
    FIntfspGetDataCommand: TDBXCommand;
    FIntfspExecCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function IntfGetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string; ACompress: Boolean): Boolean;
    function IntfPostDataByTable(ATable: string; AData: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string): Boolean;
    function IntfGetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string; ACompress: Boolean): Boolean;
    function IntfPostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string): Boolean;
    function IntfPostModData(AEngName: string; AModID: Integer; ADataArr: OleVariant; out ErrMsg: string; ADBName: string; AChildID: Integer): Boolean;
    function IntfspGetData(AspName: string; AParamArr: OleVariant; out AData: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string; ACompress: Boolean): Boolean;
    function IntfspExec(AspName: string; var AParamArr: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string): Boolean;
  end;

implementation

function TServerMethods1Client.IntfGetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string; ACompress: Boolean): Boolean;
begin
  if FIntfGetDataBySqlCommand = nil then
  begin
    FIntfGetDataBySqlCommand := FDBXConnection.CreateCommand;
    FIntfGetDataBySqlCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntfGetDataBySqlCommand.Text := 'TServerMethods1.IntfGetDataBySql';
    FIntfGetDataBySqlCommand.Prepare;
  end;
  FIntfGetDataBySqlCommand.Parameters[0].Value.SetWideString(ASql);
  FIntfGetDataBySqlCommand.Parameters[3].Value.SetWideString(ADBName);
  FIntfGetDataBySqlCommand.Parameters[4].Value.SetWideString(AEngName);
  FIntfGetDataBySqlCommand.Parameters[5].Value.SetBoolean(ACompress);
  FIntfGetDataBySqlCommand.ExecuteUpdate;
  AData := FIntfGetDataBySqlCommand.Parameters[1].Value.AsVariant;
  ErrMsg := FIntfGetDataBySqlCommand.Parameters[2].Value.GetWideString;
  Result := FIntfGetDataBySqlCommand.Parameters[6].Value.GetBoolean;
end;

function TServerMethods1Client.IntfPostDataByTable(ATable: string; AData: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string): Boolean;
begin
  if FIntfPostDataByTableCommand = nil then
  begin
    FIntfPostDataByTableCommand := FDBXConnection.CreateCommand;
    FIntfPostDataByTableCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntfPostDataByTableCommand.Text := 'TServerMethods1.IntfPostDataByTable';
    FIntfPostDataByTableCommand.Prepare;
  end;
  FIntfPostDataByTableCommand.Parameters[0].Value.SetWideString(ATable);
  FIntfPostDataByTableCommand.Parameters[1].Value.AsVariant := AData;
  FIntfPostDataByTableCommand.Parameters[3].Value.SetWideString(ADBName);
  FIntfPostDataByTableCommand.Parameters[4].Value.SetWideString(AEngName);
  FIntfPostDataByTableCommand.ExecuteUpdate;
  ErrMsg := FIntfPostDataByTableCommand.Parameters[2].Value.GetWideString;
  Result := FIntfPostDataByTableCommand.Parameters[5].Value.GetBoolean;
end;

function TServerMethods1Client.IntfGetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string; ACompress: Boolean): Boolean;
begin
  if FIntfGetDataBySqlArrCommand = nil then
  begin
    FIntfGetDataBySqlArrCommand := FDBXConnection.CreateCommand;
    FIntfGetDataBySqlArrCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntfGetDataBySqlArrCommand.Text := 'TServerMethods1.IntfGetDataBySqlArr';
    FIntfGetDataBySqlArrCommand.Prepare;
  end;
  FIntfGetDataBySqlArrCommand.Parameters[0].Value.AsVariant := ASqlArr;
  FIntfGetDataBySqlArrCommand.Parameters[3].Value.SetWideString(ADBName);
  FIntfGetDataBySqlArrCommand.Parameters[4].Value.SetWideString(AEngName);
  FIntfGetDataBySqlArrCommand.Parameters[5].Value.SetBoolean(ACompress);
  FIntfGetDataBySqlArrCommand.ExecuteUpdate;
  ADataArr := FIntfGetDataBySqlArrCommand.Parameters[1].Value.AsVariant;
  ErrMsg := FIntfGetDataBySqlArrCommand.Parameters[2].Value.GetWideString;
  Result := FIntfGetDataBySqlArrCommand.Parameters[6].Value.GetBoolean;
end;

function TServerMethods1Client.IntfPostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string): Boolean;
begin
  if FIntfPostDataBySqlArrCommand = nil then
  begin
    FIntfPostDataBySqlArrCommand := FDBXConnection.CreateCommand;
    FIntfPostDataBySqlArrCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntfPostDataBySqlArrCommand.Text := 'TServerMethods1.IntfPostDataBySqlArr';
    FIntfPostDataBySqlArrCommand.Prepare;
  end;
  FIntfPostDataBySqlArrCommand.Parameters[0].Value.AsVariant := ATableArr;
  FIntfPostDataBySqlArrCommand.Parameters[1].Value.AsVariant := ADataArr;
  FIntfPostDataBySqlArrCommand.Parameters[3].Value.SetWideString(ADBName);
  FIntfPostDataBySqlArrCommand.Parameters[4].Value.SetWideString(AEngName);
  FIntfPostDataBySqlArrCommand.ExecuteUpdate;
  ErrMsg := FIntfPostDataBySqlArrCommand.Parameters[2].Value.GetWideString;
  Result := FIntfPostDataBySqlArrCommand.Parameters[5].Value.GetBoolean;
end;

function TServerMethods1Client.IntfPostModData(AEngName: string; AModID: Integer; ADataArr: OleVariant; out ErrMsg: string; ADBName: string; AChildID: Integer): Boolean;
begin
  if FIntfPostModDataCommand = nil then
  begin
    FIntfPostModDataCommand := FDBXConnection.CreateCommand;
    FIntfPostModDataCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntfPostModDataCommand.Text := 'TServerMethods1.IntfPostModData';
    FIntfPostModDataCommand.Prepare;
  end;
  FIntfPostModDataCommand.Parameters[0].Value.SetWideString(AEngName);
  FIntfPostModDataCommand.Parameters[1].Value.SetInt32(AModID);
  FIntfPostModDataCommand.Parameters[2].Value.AsVariant := ADataArr;
  FIntfPostModDataCommand.Parameters[4].Value.SetWideString(ADBName);
  FIntfPostModDataCommand.Parameters[5].Value.SetInt32(AChildID);
  FIntfPostModDataCommand.ExecuteUpdate;
  ErrMsg := FIntfPostModDataCommand.Parameters[3].Value.GetWideString;
  Result := FIntfPostModDataCommand.Parameters[6].Value.GetBoolean;
end;

function TServerMethods1Client.IntfspGetData(AspName: string; AParamArr: OleVariant; out AData: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string; ACompress: Boolean): Boolean;
begin
  if FIntfspGetDataCommand = nil then
  begin
    FIntfspGetDataCommand := FDBXConnection.CreateCommand;
    FIntfspGetDataCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntfspGetDataCommand.Text := 'TServerMethods1.IntfspGetData';
    FIntfspGetDataCommand.Prepare;
  end;
  FIntfspGetDataCommand.Parameters[0].Value.SetWideString(AspName);
  FIntfspGetDataCommand.Parameters[1].Value.AsVariant := AParamArr;
  FIntfspGetDataCommand.Parameters[4].Value.SetWideString(ADBName);
  FIntfspGetDataCommand.Parameters[5].Value.SetWideString(AEngName);
  FIntfspGetDataCommand.Parameters[6].Value.SetBoolean(ACompress);
  FIntfspGetDataCommand.ExecuteUpdate;
  AData := FIntfspGetDataCommand.Parameters[2].Value.AsVariant;
  ErrMsg := FIntfspGetDataCommand.Parameters[3].Value.GetWideString;
  Result := FIntfspGetDataCommand.Parameters[7].Value.GetBoolean;
end;

function TServerMethods1Client.IntfspExec(AspName: string; var AParamArr: OleVariant; out ErrMsg: string; ADBName: string; AEngName: string): Boolean;
begin
  if FIntfspExecCommand = nil then
  begin
    FIntfspExecCommand := FDBXConnection.CreateCommand;
    FIntfspExecCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FIntfspExecCommand.Text := 'TServerMethods1.IntfspExec';
    FIntfspExecCommand.Prepare;
  end;
  FIntfspExecCommand.Parameters[0].Value.SetWideString(AspName);
  FIntfspExecCommand.Parameters[1].Value.AsVariant := AParamArr;
  FIntfspExecCommand.Parameters[3].Value.SetWideString(ADBName);
  FIntfspExecCommand.Parameters[4].Value.SetWideString(AEngName);
  FIntfspExecCommand.ExecuteUpdate;
  AParamArr := FIntfspExecCommand.Parameters[1].Value.AsVariant;
  ErrMsg := FIntfspExecCommand.Parameters[2].Value.GetWideString;
  Result := FIntfspExecCommand.Parameters[5].Value.GetBoolean;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FreeAndNil(FIntfGetDataBySqlCommand);
  FreeAndNil(FIntfPostDataByTableCommand);
  FreeAndNil(FIntfGetDataBySqlArrCommand);
  FreeAndNil(FIntfPostDataBySqlArrCommand);
  FreeAndNil(FIntfPostModDataCommand);
  FreeAndNil(FIntfspGetDataCommand);
  FreeAndNil(FIntfspExecCommand);
  inherited;
end;

end.

