{*******************************************************}
{                                                       }
{       ChengTX                                         }
{                                                       }
{       版权所有 (C) 2016 5.17                          }
{                                                       }
{*******************************************************}


unit BPL7SvrIntf;

interface
uses
  DBIntf, DBImpl, Datasnap.DBClient, System.SysUtils, System.Variants, Winapi.Windows,
  System.Classes;

function IntfGetDataBySql(AConStr: string; ASql: string; out AData: OleVariant; out ErrMsg: string): Boolean;stdcall;
function IntfPostDataBySql(AConStr: string;ASql: string;AData: OleVariant; out ErrMsg: string): Boolean;stdcall;
function IntfGetDataBySqlArr(AConStr: string;ArrSql: OleVariant; out ADataArr: OleVariant; out ErrMsg: string): Boolean; stdcall;
function IntfPostDataBySqlArr(AConStr: string;ArrSql: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;stdcall;
function IntfPostModData(AConStr: string;AModID: Integer; ASqlArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;stdcall;
function IntfGetModData(AConStr: string;AModID: Integer; AKeyArr: OleVariant; out ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string): Boolean;stdcall;

exports
  IntfGetDataBySql,
  IntfPostDataBySql,
  IntfGetDataBySqlArr,
  IntfPostDataBySqlArr,
  IntfPostModData,
  IntfGetModData;

implementation
var
  gGetDataEvent: THandle = 0;
  gOperList: TStringList;
  gOperLockSection:TRTLCriticalSection;


function IntfGetDataBySql(AConStr: string; ASql: string; out AData: OleVariant; out ErrMsg: string): Boolean;stdcall;
var
  LIntf: IData;
begin
  LIntf := TDataBase.Create(AConStr);
  EnterCriticalSection(gOperLockSection);
  try
    gOperList.Add('1');
  finally
    LeaveCriticalSection(gOperLockSection);
  end;
  try
    if WaitForSingleObject(gGetDataEvent,INFINITE) = WAIT_OBJECT_0 then
    begin

      Result := LIntf.GetDataBySql(ASql,AData,ErrMsg);
    end else
      Result := False;
  finally
    EnterCriticalSection(gOperLockSection);
    try
      if gOperList.Count > 0 then
      begin
        gOperList.Delete(0);
        if gOperList.Count > 0 then
        begin
          PulseEvent(gGetDataEvent);
        end else
          SetEvent(gGetDataEvent);
      end;
    finally
      LeaveCriticalSection(gOperLockSection);
    end;
  end;
end;

function IntfPostDataBySql(AConStr: string;ASql: string;AData: OleVariant; out ErrMsg: string): Boolean;stdcall;
var
  LIntf: IData;
begin
  LIntf := TDataBase.Create(AConStr);
  EnterCriticalSection(gOperLockSection);
  try
    gOperList.Add('1');
  finally
    LeaveCriticalSection(gOperLockSection);
  end;
  try
    if WaitForSingleObject(gGetDataEvent,INFINITE) = WAIT_OBJECT_0 then
    begin

      Result := LIntf.PostDataBySql(ASql,AData,ErrMsg);
    end else
      Result := False;
  finally
    EnterCriticalSection(gOperLockSection);
    try
      if gOperList.Count > 0 then
      begin
        gOperList.Delete(0);
        if gOperList.Count > 0 then
        begin
          PulseEvent(gGetDataEvent);
        end else
          SetEvent(gGetDataEvent);
      end;
    finally
      LeaveCriticalSection(gOperLockSection);
    end;
  end;
end;

function IntfGetDataBySqlArr(AConStr: string;ArrSql: OleVariant; out ADataArr: OleVariant; out ErrMsg: string): Boolean; stdcall;
var
  LIntf: IData;
begin
  LIntf := TDataBase.Create(AConStr);
  EnterCriticalSection(gOperLockSection);
  try
    gOperList.Add('1');
  finally
    LeaveCriticalSection(gOperLockSection);
  end;
  try
    if WaitForSingleObject(gGetDataEvent,INFINITE) = WAIT_OBJECT_0 then
    begin

      Result := LIntf.GetDataBySqlArr(ArrSql,ADataArr,ErrMsg);
    end else
      Result := False;
  finally
    EnterCriticalSection(gOperLockSection);
    try
      if gOperList.Count > 0 then
      begin
        gOperList.Delete(0);
        if gOperList.Count > 0 then
        begin
          PulseEvent(gGetDataEvent);
        end else
          SetEvent(gGetDataEvent);
      end;
    finally
      LeaveCriticalSection(gOperLockSection);
    end;
  end;
end;

function IntfPostDataBySqlArr(AConStr: string;ArrSql: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;stdcall;
var
  LIntf: IData;
begin
  LIntf := TDataBase.Create(AConStr);

  EnterCriticalSection(gOperLockSection);
  try
    gOperList.Add('1');
  finally
    LeaveCriticalSection(gOperLockSection);
  end;
  try
    if WaitForSingleObject(gGetDataEvent,INFINITE) = WAIT_OBJECT_0 then
    begin
      Result := LIntf.PostDataBySqlArr(ArrSql,ADataArr,ErrMsg);
    end else
      Result := False;
  finally
    EnterCriticalSection(gOperLockSection);
    try
      if gOperList.Count > 0 then
      begin
        gOperList.Delete(0);
        if gOperList.Count > 0 then
        begin
          PulseEvent(gGetDataEvent);
        end else
          SetEvent(gGetDataEvent);
      end;
    finally
      LeaveCriticalSection(gOperLockSection);
    end;
  end;
end;

function IntfPostModData(AConStr: string;AModID: Integer; ASqlArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string): Boolean;stdcall;
var
  LIntf: IData;
begin
  case AModID of
    0:;
    119: LIntf := TMod119.Create(AModID,AConStr);//工程产品MI设计
  else
    LIntf := TModCommon.Create(AModID,AConStr);
  end;

  EnterCriticalSection(gOperLockSection);
  try
    gOperList.Add('1');
  finally
    LeaveCriticalSection(gOperLockSection);
  end;
  try
    if WaitForSingleObject(gGetDataEvent,INFINITE) = WAIT_OBJECT_0 then
    begin
      Result := LIntf.PostDataBySqlArr(ASqlArr,ADataArr,ErrMsg);
    end else
      Result := False;
  finally
    EnterCriticalSection(gOperLockSection);
    try
      if gOperList.Count > 0 then
      begin
        gOperList.Delete(0);
        if gOperList.Count > 0 then
        begin
          PulseEvent(gGetDataEvent);
        end else
          SetEvent(gGetDataEvent);
      end;
    finally
      LeaveCriticalSection(gOperLockSection);
    end;
  end;
end;

function IntfGetModData(AConStr: string;AModID: Integer; AKeyArr: OleVariant; out ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string): Boolean;stdcall;
var
  LtmpIntf: IData;
  LCds: TClientDataSet;
  LSql: string;
  LData: OleVariant;
  I: Integer;
  LIntf: IData;
begin

  EnterCriticalSection(gOperLockSection);
  try
    gOperList.Add('1');
  finally
    LeaveCriticalSection(gOperLockSection);
  end;

  try
    if WaitForSingleObject(gGetDataEvent,INFINITE) = WAIT_OBJECT_0 then
    begin
      LtmpIntf := TDataBase.Create(AConStr);
      LSql := 'select * from sysModuleTables where ModId=' + IntToStr(AModID) + ' order by SeqNo asc';
      Result := LtmpIntf.GetDataBySql(LSql,LData,ErrMsg);
      if Result then
      begin
        LCds := TClientDataSet.Create(nil);
        try
          LCds.Data := LData;
          if LCds.IsEmpty then Exit;
          ASqlArr := VarArrayCreate([0,LCds.RecordCount - 1],varVariant);
          LCds.First;
          for I := 0 to LCds.RecordCount - 1 do
          begin
            case AModID of
              0:;
            else
              ASqlArr[I] := 'select * from ' + LCds.FieldByName('tablename').AsString + ' where ' + LCds.FieldByName('PKName').AsString + ' = ' + AKeyArr[0];
            end;
            LCds.Next;
          end;
        finally
          LCds.Free;
        end;

        case AModID of
          0:;
        else
          LIntf := TModCommon.Create(AModID,AConStr);
        end;
        Result := LIntf.GetDataBySqlArr(ASqlArr,ADataArr,ErrMsg);
      end;
    end else
      Result := False;
  finally
    EnterCriticalSection(gOperLockSection);
    try
      if gOperList.Count > 0 then
      begin
        gOperList.Delete(0);
        if gOperList.Count > 0 then
        begin
          PulseEvent(gGetDataEvent);
        end else
          SetEvent(gGetDataEvent);
      end;
    finally
      LeaveCriticalSection(gOperLockSection);
    end;
  end;
end;

initialization
  gOperList := TStringList.Create;
  gGetDataEvent := CreateEvent(nil,False,True,nil);
  InitializeCriticalSection(gOperLockSection);
finalization
  gOperList.Free;
  if gGetDataEvent <> 0 then
    CloseHandle(gGetDataEvent);
  DeleteCriticalSection(gOperLockSection);

end.
