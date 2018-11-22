{*******************************************************}
{                                                       }
{       Chengtx                                         }
{                                                       }
{       版权所有 (C) 2016 5.17                          }
{                                                       }
{*******************************************************}



unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, DM,
     Data.DB;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
    function EngStopCheck(AEngName: string;out ErrMsg: string): Boolean;
  public
    { Public declarations }
    function IntfGetDataBySql(ASql: string; out AData: OleVariant; out ErrMsg: string; ADBName: string;AEngName: string = '';ACompress: Boolean = False): Boolean;
    function IntfPostDataByTable(ATable: string;AData: OleVariant; out ErrMsg: string; ADBName: string;AEngName: string = ''): Boolean;
    function IntfGetDataBySqlArr(ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string; ADBName: string;AEngName: string = '';ACompress: Boolean = False): Boolean;
    function IntfPostDataBySqlArr(ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string; ADBName: string;AEngName: string = ''): Boolean;
    function IntfPostModData(AEngName: string;AModID: Integer; ADataArr: OleVariant; out ErrMsg: string; ADBName: string;AChildID: Integer = 0): Boolean;
    function IntfspGetData(AspName: string;AParamArr: OleVariant; out AData: Olevariant;Out ErrMsg:string; ADBName: string;AEngName: string = '';ACompress: Boolean = False): Boolean;
    function IntfspExec(AspName: string;var AParamArr: OleVariant; out ErrMsg:string; ADBName: string;AEngName: string = ''):boolean;
  end;

implementation

{$R *.dfm}

uses
  System.StrUtils, Winapi.Windows;

{ TServerMethods1 }


function TServerMethods1.EngStopCheck(AEngName: string;
  out ErrMsg: string): Boolean;
var
  Ltmp: Integer;
begin
  Result := False;
  if dm1.FBAllStop then
  begin
    ErrMsg := '服务器服务暂时停止，请稍等几分钟再试';
    Exit;
  end;
  Ltmp := dm1.FEngNameLS.IndexOf(AEngName);
  if dm1.FBEngStop[Ltmp] then
  begin
    ErrMsg := '服务器服务引擎 '+ AEngName + ' 暂时停止，请稍等几分钟再试';
    Exit;
  end;
  Result := True;
end;

function TServerMethods1.IntfGetDataBySql(ASql: string; out AData: OleVariant;
  out ErrMsg: string; ADBName,AEngName : string;ACompress: Boolean): Boolean;
const
  IntfName = 'IntfGetDataBySql';
type
  TPF = function (ASql: string; out AData: OleVariant; out ErrMsg: string; AConStr: string = '';ACompress: Boolean = False): Boolean;stdcall;
var
  LEngHandle: THandle;
  LPF: Pointer;
  LEngName: string;
  LConStr: string;
begin
  Result := False;
  if AEngName = '' then LEngName := dm1.FDefEngName else LEngName := AEngName;
  if not EngStopCheck(LEngName,ErrMsg) then
    Exit;
  LConStr := dm1.GetDBConstr(ADBName);
  if LConStr = '' then
  begin
    ErrMsg := '无效的数据库 ' + ADBName;
    Exit;
  end;
  LEngHandle := dm1.LockGetDllThandle(dm1.FEngGrp.Items[LEngName]);
  if (LEngHandle <> 0) and (LEngHandle <> INVALID_HANDLE_VALUE) then
  begin
    try
      LPF := GetProcAddress(LEngHandle,IntfName);
      if LPF <> nil then
      begin
        Result := TPF(LPF)(ASql,AData,ErrMsg,LConStr,ACompress);
        TMonitor.Enter(dm1.cdsSvrEng);
        try
          if dm1.cdsSvrEng.FindKey([LEngHandle]) then
          begin
            dm1.cdsSvrEng.Edit;
            dm1.cdsSvrEng.FieldByName(IntfName).AsInteger := dm1.cdsSvrEng.FieldByName(IntfName).AsInteger + 1;
            dm1.cdsSvrEng.Post;
            dm1.cdsSvrEng.MergeChangeLog;
          end;
        finally
          TMonitor.Exit(dm1.cdsSvrEng);
        end;
      end;
    finally
      dm1.LockAddDllThandle(dm1.FEngGrp.Items[LEngName],LEngHandle);
    end;
  end else
  begin
    ErrMsg := '当前服务器引擎 ' + LEngName + ' 线程满载，请稍等几分钟再试';
    Result := False;
  end;
end;

function TServerMethods1.IntfGetDataBySqlArr(ASqlArr: OleVariant;
  out ADataArr: OleVariant; out ErrMsg: string; ADBName,AEngName: string;ACompress: Boolean): Boolean;
const
  IntfName = 'IntfGetDataBySqlArr';
type
  TPF = function (ASqlArr: OleVariant; out ADataArr: OleVariant; out ErrMsg: string; AConStr: string = '';ACompress: Boolean = False): Boolean;stdcall;
var
  LEngHandle: THandle;
  LPF: Pointer;
  LEngName: string;
  LConStr: string;
begin
  Result := False;
  if AEngName = '' then LEngName := dm1.FDefEngName else LEngName := AEngName;
  if not EngStopCheck(LEngName,ErrMsg) then
    Exit;
  LConStr := dm1.GetDBConstr(ADBName);
  if LConStr = '' then
  begin
    ErrMsg := '无效的数据库 ' + ADBName;
    Exit;
  end;
  LEngHandle := dm1.LockGetDllThandle(dm1.FEngGrp.Items[LEngName]);
  if (LEngHandle <> 0) and (LEngHandle <> INVALID_HANDLE_VALUE) then
  begin
    try
      LPF := GetProcAddress(LEngHandle,IntfName);
      if LPF <> nil then
      begin
        Result := TPF(LPF)(ASqlArr,ADataArr,ErrMsg,LConStr,ACompress);
        TMonitor.Enter(dm1.cdsSvrEng);
        try
          if dm1.cdsSvrEng.FindKey([LEngHandle]) then
          begin
            dm1.cdsSvrEng.Edit;
            dm1.cdsSvrEng.FieldByName(IntfName).AsInteger := dm1.cdsSvrEng.FieldByName(IntfName).AsInteger + 1;
            dm1.cdsSvrEng.Post;
            dm1.cdsSvrEng.MergeChangeLog;
          end;
        finally
          TMonitor.Exit(dm1.cdsSvrEng);
        end;
      end;
    finally
      dm1.LockAddDllThandle(dm1.FEngGrp.Items[LEngName],LEngHandle);
    end;
  end else
  begin
    ErrMsg := '当前服务器引擎 ' + LEngName + ' 线程满载，请稍等几分钟再试';
    Result := False;
  end;
end;

function TServerMethods1.IntfPostDataByTable(ATable: string; AData: OleVariant;
  out ErrMsg: string; ADBName,AEngName: string): Boolean;
const
  IntfName = 'IntfPostDataByTable';
type
  TPF = function (ATable: string;AData: OleVariant; out ErrMsg: string; AConStr: string = ''): Boolean;stdcall;
var
  LEngHandle: THandle;
  LPF: Pointer;
  LEngName: string;
  LConStr: string;
begin
  Result := False;
  if AEngName = '' then LEngName := dm1.FDefEngName else LEngName := AEngName;
  if not EngStopCheck(LEngName,ErrMsg) then
    Exit;
  LConStr := dm1.GetDBConstr(ADBName);
  if LConStr = '' then
  begin
    ErrMsg := '无效的数据库 ' + ADBName;
    Exit;
  end;
  LEngHandle := dm1.LockGetDllThandle(dm1.FEngGrp.Items[LEngName]);
  if (LEngHandle <> 0) and (LEngHandle <> INVALID_HANDLE_VALUE) then
  begin
    try
      LPF := GetProcAddress(LEngHandle,IntfName);
      if LPF <> nil then
      begin
        Result := TPF(LPF)(ATable,AData,ErrMsg,LConStr);
        TMonitor.Enter(dm1.cdsSvrEng);
        try
          if dm1.cdsSvrEng.FindKey([LEngHandle]) then
          begin
            dm1.cdsSvrEng.Edit;
            dm1.cdsSvrEng.FieldByName(IntfName).AsInteger := dm1.cdsSvrEng.FieldByName(IntfName).AsInteger + 1;
            dm1.cdsSvrEng.Post;
            dm1.cdsSvrEng.MergeChangeLog;
          end;
        finally
          TMonitor.Exit(dm1.cdsSvrEng);
        end;
      end;
    finally
      dm1.LockAddDllThandle(dm1.FEngGrp.Items[LEngName],LEngHandle);
    end;
  end else
  begin
    ErrMsg := '当前服务器引擎 ' + LEngName + ' 线程满载，请稍等几分钟再试';
    Result := False;
  end;
end;

function TServerMethods1.IntfPostDataBySqlArr(ATableArr, ADataArr: OleVariant;
  out ErrMsg: string; ADBName,AEngName: string): Boolean;
const
  IntfName = 'IntfPostDataBySqlArr';
type
  TPF = function (ATableArr: OleVariant; ADataArr: OleVariant; out ErrMsg: string; AConStr: string = ''): Boolean;stdcall;
var
  LEngHandle: THandle;
  LPF: Pointer;
  LEngName: string;
  LConStr: string;
begin
  Result := False;
  if AEngName = '' then LEngName := dm1.FDefEngName else LEngName := AEngName;
  if not EngStopCheck(LEngName,ErrMsg) then
    Exit;
  LConStr := dm1.GetDBConstr(ADBName);
  if LConStr = '' then
  begin
    ErrMsg := '无效的数据库 ' + ADBName;
    Exit;
  end;
  LEngHandle := dm1.LockGetDllThandle(dm1.FEngGrp.Items[LEngName]);
  if (LEngHandle <> 0) and (LEngHandle <> INVALID_HANDLE_VALUE) then
  begin
    try
      LPF := GetProcAddress(LEngHandle,IntfName);
      if LPF <> nil then
      begin
        Result := TPF(LPF)(ATableArr,ADataArr,ErrMsg,LConStr);
        TMonitor.Enter(dm1.cdsSvrEng);
        try
          if dm1.cdsSvrEng.FindKey([LEngHandle]) then
          begin
            dm1.cdsSvrEng.Edit;
            dm1.cdsSvrEng.FieldByName(IntfName).AsInteger := dm1.cdsSvrEng.FieldByName(IntfName).AsInteger + 1;
            dm1.cdsSvrEng.Post;
            dm1.cdsSvrEng.MergeChangeLog;
          end;
        finally
          TMonitor.Exit(dm1.cdsSvrEng);
        end;
      end;
    finally
      dm1.LockAddDllThandle(dm1.FEngGrp.Items[LEngName],LEngHandle);
    end;
  end else
  begin
    ErrMsg := '当前服务器引擎 ' + LEngName + ' 线程满载，请稍等几分钟再试';
    Result := False;
  end;
end;

function TServerMethods1.IntfPostModData(AEngName: string; AModID: Integer;
  ADataArr: OleVariant; out ErrMsg: string; ADBName: string;AChildID: Integer): Boolean;
const
  IntfName = 'IntfPostModData';
type
  TPF = function (AModID: Integer; ADataArr: OleVariant; out ErrMsg: string;AConStr: string = '';AChildID: Integer = 0): Boolean;stdcall;
var
  LEngHandle: THandle;
  LPF: Pointer;
  LEngName: string;
  LConStr: string;
begin
  Result := False;
  if AEngName = '' then LEngName := dm1.FDefEngName else LEngName := AEngName;
  if not EngStopCheck(LEngName,ErrMsg) then
    Exit;
  LConStr := dm1.GetDBConstr(ADBName);
  if LConStr = '' then
  begin
    ErrMsg := '无效的数据库 ' + ADBName;
    Exit;
  end;
  LEngHandle := dm1.LockGetDllThandle(dm1.FEngGrp.Items[LEngName]);
  if (LEngHandle <> 0) and (LEngHandle <> INVALID_HANDLE_VALUE) then
  begin
    try
      LPF := GetProcAddress(LEngHandle,IntfName);
      if LPF <> nil then
      begin
        Result := TPF(LPF)(AModID,ADataArr,ErrMsg,LConStr,AChildID);
        TMonitor.Enter(dm1.cdsSvrEng);
        try
          if dm1.cdsSvrEng.FindKey([LEngHandle]) then
          begin
            dm1.cdsSvrEng.Edit;
            dm1.cdsSvrEng.FieldByName(IntfName).AsInteger := dm1.cdsSvrEng.FieldByName(IntfName).AsInteger + 1;
            dm1.cdsSvrEng.Post;
            dm1.cdsSvrEng.MergeChangeLog;
          end;
        finally
          TMonitor.Exit(dm1.cdsSvrEng);
        end;
      end;
    finally
      dm1.LockAddDllThandle(dm1.FEngGrp.Items[LEngName],LEngHandle);
    end;
  end else
  begin
    ErrMsg := '当前服务器引擎 ' + LEngName + ' 线程满载，请稍等几分钟再试';
    Result := False;
  end;
end;

function TServerMethods1.IntfspExec(AspName: string;var AParamArr: OleVariant;
  out ErrMsg: string; ADBName,AEngName: string): boolean;
const
  IntfName = 'IntfspExec';
type
  TPF = function (AspName: string;var AParamArr: OleVariant; out ErrMsg:string; AConStr: string = ''):boolean;stdcall;
var
  LEngHandle: THandle;
  LPF: Pointer;
  LEngName: string;
  LConStr: string;
begin
  Result := False;
  if AEngName = '' then LEngName := dm1.FDefEngName else LEngName := AEngName;
  if not EngStopCheck(LEngName,ErrMsg) then
    Exit;
  LConStr := dm1.GetDBConstr(ADBName);
  if LConStr = '' then
  begin
    ErrMsg := '无效的数据库 ' + ADBName;
    Exit;
  end;
  LEngHandle := dm1.LockGetDllThandle(dm1.FEngGrp.Items[LEngName]);
  if (LEngHandle <> 0) and (LEngHandle <> INVALID_HANDLE_VALUE) then
  begin
    try
      LPF := GetProcAddress(LEngHandle,IntfName);
      if LPF <> nil then
      begin
        Result := TPF(LPF)(AspName,AParamArr,ErrMsg,LConStr);
        TMonitor.Enter(dm1.cdsSvrEng);
        try
          if dm1.cdsSvrEng.FindKey([LEngHandle]) then
          begin
            dm1.cdsSvrEng.Edit;
            dm1.cdsSvrEng.FieldByName(IntfName).AsInteger := dm1.cdsSvrEng.FieldByName(IntfName).AsInteger + 1;
            dm1.cdsSvrEng.Post;
            dm1.cdsSvrEng.MergeChangeLog;
          end;
        finally
          TMonitor.Exit(dm1.cdsSvrEng);
        end;
      end;
    finally
      dm1.LockAddDllThandle(dm1.FEngGrp.Items[LEngName],LEngHandle);
    end;
  end else
  begin
    ErrMsg := '当前服务器引擎 ' + LEngName + ' 线程满载，请稍等几分钟再试';
    Result := False;
  end;
end;

function TServerMethods1.IntfspGetData(AspName: string;
  AParamArr: OleVariant; out AData: Olevariant; out ErrMsg: string; ADBName,AEngName: string;ACompress: Boolean): Boolean;
const
  IntfName = 'IntfspGetData';
type
  TPF = function (AspName: string;AParamArr: OleVariant; out AData: Olevariant;Out ErrMsg:string; AConStr: string = '';ACompress: Boolean = False): Boolean;stdcall;
var
  LEngHandle: THandle;
  LPF: Pointer;
  LEngName: string;
  LConStr: string;
begin
  Result := False;
  if AEngName = '' then LEngName := dm1.FDefEngName else LEngName := AEngName;
  if not EngStopCheck(LEngName,ErrMsg) then
    Exit;
  LConStr := dm1.GetDBConstr(ADBName);
  if LConStr = '' then
  begin
    ErrMsg := '无效的数据库 ' + ADBName;
    Exit;
  end;
  LEngHandle := dm1.LockGetDllThandle(dm1.FEngGrp.Items[LEngName]);
  if (LEngHandle <> 0) and (LEngHandle <> INVALID_HANDLE_VALUE) then
  begin
    try
      LPF := GetProcAddress(LEngHandle,IntfName);
      if LPF <> nil then
      begin
        Result := TPF(LPF)(AspName,AParamArr,AData,ErrMsg,LConStr,ACompress);
        TMonitor.Enter(dm1.cdsSvrEng);
        try
          if dm1.cdsSvrEng.FindKey([LEngHandle]) then
          begin
            dm1.cdsSvrEng.Edit;
            dm1.cdsSvrEng.FieldByName(IntfName).AsInteger := dm1.cdsSvrEng.FieldByName(IntfName).AsInteger + 1;
            dm1.cdsSvrEng.Post;
            dm1.cdsSvrEng.MergeChangeLog;
          end;
        finally
          TMonitor.Exit(dm1.cdsSvrEng);
        end;
      end;
    finally
      dm1.LockAddDllThandle(dm1.FEngGrp.Items[LEngName],LEngHandle);
    end;
  end else
  begin
    ErrMsg := '当前服务器引擎 ' + LEngName + ' 线程满载，请稍等几分钟再试';
    Result := False;
  end;
end;


end.

