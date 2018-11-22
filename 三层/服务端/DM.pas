{*******************************************************}
{                                                       }
{       Chengtx                                         }
{                                                       }
{       版权所有 (C) 2016 5.17                          }
{                                                       }
{*******************************************************}



unit DM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, System.Generics.Collections;



type
  Tdm1 = class(TDataModule)
    cdsSvrEng: TClientDataSet;
    dsSvrEng: TDataSource;
    strngfldSvrEngEngName: TStringField;
    lrgntfldSvrEngCallCount: TLargeintField;
    intgrfldSvrEngIntfGetDataBySql: TIntegerField;
    intgrfldSvrEngIntfPostDataByTable: TIntegerField;
    intgrfldSvrEngIntfGetDataBySqlArr: TIntegerField;
    intgrfldSvrEngIntfPostDataBySqlArr: TIntegerField;
    intgrfldSvrEngIntfPostModData: TIntegerField;
    intgrfldSvrEngIntfspGetDataByID: TIntegerField;
    intgrfldSvrEngIntfspExecByID: TIntegerField;
    intgrfldSvrEngHandle: TIntegerField;
    cdsUser: TClientDataSet;
    dsUser: TDataSource;
    intgrfldUserPConObj: TIntegerField;
    strngfldUserIP: TStringField;
    intgrfldUserPort: TIntegerField;
    strngfldUserProtocol: TStringField;
    dtmfldUserConTime: TDateTimeField;
    cdsUserAlive: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FMaxConCount: Integer; //最大连接数
    FBAllStop: Boolean;     //引擎全部停止
    FBEngStop: array of Boolean;
    FDefEngName: string;
    FEngNameLS: TStringList;
    FEngGrp: TDictionary<string,TList<THandle>>;

    //配置文件中的数据库连接列表
    FDBConStrList: TDictionary<string,string>;
    procedure LoadAllEng;
    procedure UnLoadAllEng;
    procedure LoadEng(AEngName: string);
    procedure LockAddDllThandle(AEngList: TList<THandle>;AHandle: THandle);
    function LockGetDllThandle(AEngList: TList<THandle>): THandle;
    procedure UnloadEng(AEngName: string);

    //取得对应的数据库连接
    function GetDBConstr(ADBName: string): string;
  end;

var
  dm1: Tdm1;

implementation

uses
  Winapi.Windows, Vcl.Dialogs, System.IniFiles;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm1.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  FMaxConCount := 200;
  FDBConStrList := TDictionary<string,string>.Create;
  FDefEngName := '公共基础';

  FEngNameLS := TStringList.Create;
  FEngNameLS.Add('公共基础');
  FEngNameLS.Add('市场销售');
  FEngNameLS.Add('工程设计');
  FEngNameLS.Add('计划生产');
  FEngNameLS.Add('品质控制');
  FEngNameLS.Add('物料采购');
  FEngNameLS.Add('库存管理');
  FEngNameLS.Add('人事管理');
  FEngNameLS.Add('成本核算');
  FEngNameLS.Add('财务管理');
  FEngNameLS.Add('系统设置');

  SetLength(FBEngStop,FEngNameLS.Count);
  for I := 0 to High(FBEngStop) do
    FBEngStop[I] := False;

  FEngGrp := TDictionary<string,TList<THandle>>.Create;
  for I := 0 to FEngNameLS.Count - 1 do
    FEngGrp.Add(FEngNameLS[I],TList<THandle>.Create);

  cdsSvrEng.CreateDataSet;
  cdsUser.CreateDataSet;
end;

procedure Tdm1.DataModuleDestroy(Sender: TObject);
var
  LLst: TList<THandle>;
begin
  for LLst in FEngGrp.Values do
    LLst.Free;
  FEngGrp.Free;
  FEngNameLS.Free;
end;


function Tdm1.GetDBConstr(ADBName: string): string;
var
  LFileName: string;
  LIniFile: Tinifile;
  LDBServer,LDBName,LDBUser,LDBPswd,LDBDesc: string;
begin
  TMonitor.Enter(FDBConStrList);
  try
    if FDBConStrList.ContainsKey(UpperCase(ADBName)) then
    begin
      FDBConStrList.TryGetValue(UpperCase(ADBName),Result);
    end else
    begin
      LFileName := ExtractFilePath(Paramstr(0))+'SvrConfig.ini';
      if FileExists(LFileName) then
      begin
        LIniFile:=Tinifile.Create(LFileName);
        try
          if LIniFile.SectionExists(ADBName) then
          begin
            //LogonMax:=LIniFile.ReadInteger('LogonCtrl','LogonMax',0);  //连接数最大
            LDBServer:=LIniFile.ReadString(ADBName,'Server','');  //数据库服务器名
            LDBName:=LIniFile.ReadString(ADBName,'DBName','');    //数据库名称
            LDBUser:=LIniFile.ReadString(ADBName,'User','');    //数据库用户
            LDBPswd:=LIniFile.ReadString(ADBName,'Pswd','');  //数据库密码
            LDBDesc:=LIniFile.ReadString(ADBName,'DBDesc','');  //数据库描述
            Result := 'Provider=SQLOLEDB.1;Password='+LDBPswd+
                          ';Persist Security Info=True;User ID='+LDBUser+
                          ';Initial Catalog='+LDBName+';Data Source='+LDBServer;
            FDBConStrList.Add(UpperCase(ADBName),Result);
          end;
        finally
          LIniFile.Free;
        end;
      end else
        Result := '';
    end;
  finally
    TMonitor.Exit(FDBConStrList);
  end;
end;

procedure Tdm1.LoadAllEng;
var
  LEng: string;
begin
  for LEng in FEngNameLS do
    LoadEng(LEng);
end;

procedure Tdm1.LoadEng(AEngName: string);
var
  LFiledName: string;
  I: Integer;
  LHandle: THandle;
begin
  for I := 0 to 100 do
  begin
    if I = 0 then
      LFiledName := ExtractFilePath(ParamStr(0)) + '\EngDll\' + AEngName + '\' + AEngName  + '.dll'
    else
      LFiledName := ExtractFilePath(ParamStr(0)) + '\EngDll\' + AEngName + '\' + AEngName + IntToStr(I) + '.dll';
    if FileExists(LFiledName) then
    begin
      LHandle := LoadLibrary(PWideChar(LFiledName));
      if (LHandle <> INVALID_HANDLE_VALUE) and (LHandle <> 0) then
      begin
        if FEngGrp.Items[AEngName].IndexOf(LHandle) = -1 then
        begin
          LockAddDllThandle(FEngGrp.Items[AEngName],LHandle);
          //添加到svreng
          cdsSvrEng.Append;
          cdsSvrEng.FieldByName('EngName').AsString := ExtractFileName(LFiledName);
          cdsSvrEng.FieldByName('Handle').AsInteger := LHandle;
          cdsSvrEng.Post;
          cdsSvrEng.MergeChangeLog;
        end;
      end;
    end else
      Break;
  end;
end;

procedure Tdm1.LockAddDllThandle(AEngList: TList<THandle>;AHandle: THandle);
begin
  TMonitor.Enter(AEngList);
  try
    AEngList.Add(AHandle);
  finally
    TMonitor.Exit(AEngList);
  end;
end;

function Tdm1.LockGetDllThandle(AEngList: TList<THandle>): THandle;
begin
  TMonitor.Enter(AEngList);
  try
    if AEngList.Count > 0 then
    begin
      Result := AEngList.Items[0];
      AEngList.Delete(0);
    end else
      Result := INVALID_HANDLE_VALUE;
  finally
    TMonitor.Exit(AEngList);
  end;
end;

procedure Tdm1.UnLoadAllEng;
var
  LEng: string;
begin
  for LEng in FEngNameLS do
    UnloadEng(LEng);
end;

procedure Tdm1.UnloadEng(AEngName: string);
var
  LLst: TList<THandle>;
  LtmpLst: TList<THandle>;
  LHandle: THandle;
begin
  LLst := FEngGrp.Items[AEngName];
  LtmpLst := TList<THandle>.Create;
  TMonitor.Enter(LLst);
  try
    for LHandle in LLst do
    begin
      if (LHandle <> 0) and (LHandle <> INVALID_HANDLE_VALUE) then
      begin
        if FreeLibrary(LHandle) then
        begin
          LtmpLst.Add(LHandle);
          if cdsSvrEng.FindKey([LHandle]) then
          begin
            cdsSvrEng.Delete;
            cdsSvrEng.MergeChangeLog;
          end;
        end;
      end;
    end;
    for LHandle in LtmpLst do
      LLst.Remove(LHandle);
  finally
    TMonitor.Exit(LLst);
    LtmpLst.Free;
  end;
end;

end.
