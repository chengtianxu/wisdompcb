{*******************************************************}
{                                                       }
{       DBTable通用单元                                 }
{                                                       }
{       作者：ChengTX                                   }
{                                                       }
{       时间：2012-06-18 17:31:14                       }
{                                                       }
{*******************************************************}


unit gDBTableBase;

interface

uses
  Classes, Generics.Collections, SysUtils, gADODB, Windows, DBClient;

const
  IID_DBTableBase = '{06713B9A-BF3E-48E6-8AE3-23C8F2EA6385}';
  IID_DBCustomTable = '{828499C5-D17C-44A5-8C96-450A2BDADE7E}';

type
  TOPType = (opInsert, opUpdate, opDelete);

  TFieldType = (tpInt, tpStr);

  TTableParam = record
    Field: string;
    Value: string;
    FType: TFieldType;
    AlasName: string;
  end;

  PTableParam = ^TTableParam;

  { ===扩展时候使用===
    IObserver = interface
    procedure Update();
    end;

    ISubject = interface(IObserver)
    procedure AddFans();
    procedure DeleFans();
    procedure Notify;
    end;
    }

  IDBTableBase = interface
  ['{06713B9A-BF3E-48E6-8AE3-23C8F2EA6385}']
    function Insert(ATableName: string): gErrcode;
    function Update(ATableName: string; AWhere: string): gErrcode;
    function Delete(ATableName: string; AWhere: string): gErrcode;
    function Select(ATableName: string; AWhere: string;
      out outData: OleVariant): gErrcode; overload;
    function Select(ATableName: string; AWhere: string;
      out outDS: TClientDataSet): gErrcode; overload;
    procedure AddParam(AParam: TTableParam);
    procedure ClearParam;
  end;

  TDBTableBase = class(TADOSQL, IDBTableBase, IADOSQL)
  private
    FParamList: TList<TTableParam>;
    FCON: IADOCON;
  protected
    function Insert(ATableName: string): gErrcode;
    function Update(ATableName: string; AWhere: string): gErrcode;
    function Delete(ATableName: string; AWhere: string): gErrcode;
    function Select(ATableName: string; AWhere: string;
      out outData: OleVariant): gErrcode; overload;
    function Select(ATableName: string; AWhere: string;
      out outDS: TClientDataSet): gErrcode; overload;
    procedure AddParam(AParam: TTableParam);
    procedure ClearParam;
  public
    constructor Create(ACON: IADOCON);
    destructor Destroy; override;
  end;

  IDBCustomTable = interface
  ['{828499C5-D17C-44A5-8C96-450A2BDADE7E}']
  function GetTableName: string;
  procedure SetTableName(const ATableName: string);
  function Insert: gErrcode;
  function Update(AWhere: string): gErrcode;
  function Delete(AWhere: string): gErrcode;
  function Select(AWhere: string; out outData: OleVariant): gErrcode; overload;
  function Select(AWhere: string; out outDS: TClientDataSet): gErrcode; overload;
  procedure AddParam(AParam: TTableParam);
  procedure ClearParam;
  end;

  TDBCustomTable = class(TDBTableBase, IDBCustomTable, IDBTableBase, IADOSQL)
  private
    FTableName: string;
    function GetTableName: string;
    procedure SetTableName(const ATableName: string);
    function Insert: gErrcode;
    function Update(AWhere: string): gErrcode;
    function Delete(AWhere: string): gErrcode;
    function Select(AWhere: string; out outData: OleVariant): gErrcode; overload;
    function Select(AWhere: string; out outDS: TClientDataSet): gErrcode; overload;
  public
    constructor Create(ACON: IADOCON; ATableName: string);
  end;


implementation

uses
  Dialogs, gFun;

{ TDBTableBase }

procedure TDBTableBase.AddParam(AParam: TTableParam);
begin
  FParamList.Add(AParam);
end;

procedure TDBTableBase.ClearParam;
begin
  FParamList.Clear;
end;

constructor TDBTableBase.Create(ACON: IADOCON);
begin
  inherited Create();
  FParamList := TList<TTableParam>.Create;
  FCON := ACON;
end;

function TDBTableBase.Delete(ATableName, AWhere: string): gErrcode;
var
  LS: TStringList;
  tmp1: Integer;
begin
  LS := TStringList.Create;
  try
    LS.Add('DELETE FROM ' + ATableName);
    LS.Add('WHERE');
    LS.Add(AWhere);
    try
      if FCON <> nil then
      begin
        Result := (Self as IADOSQL).SQLExec(FCON, LS, tmp1);
      end
      else
        Result := 2;
    except
      on e: Exception do Result := SysErrShow(e);
    end;
  finally
    LS.Free;
  end;
end;

destructor TDBTableBase.Destroy;
begin
  ClearParam;
  FParamList.Free;
  inherited;
end;

function TDBTableBase.Insert(ATableName: string): gErrcode;
var
  LS: TStringList;
  tmp1: Integer;
  tmpP: TTableParam;
begin
  LS := TStringList.Create;
  try
    LS.Add('INSERT INTO ' + ATableName + ' VALUES(');
    for tmpP in FParamList do
    begin
      if tmpP.FType = tpInt then
        LS.Add(tmpP.Value);
      if tmpP.FType = tpStr then
        LS.Add(QuotedStr(tmpP.Value));
      LS.Add(',');
    end;
    if LS[LS.Count - 1] = ',' then
      LS.Delete(LS.Count - 1);
    LS.Add(')');
    try
      if FCON <> nil then
      begin
        Result := (Self as IADOSQL).SQLExec(FCON, LS, tmp1);
      end
      else
        Result := 2;
    except
      on e: Exception do Result := SysErrShow(e);
    end;
  finally
    LS.Free;
  end;
end;

function TDBTableBase.Select(ATableName: string; AWhere: string;
  out outData: OleVariant): gErrcode;
var
  LS: TStringList;
  tmpP: TTableParam;
begin
  LS := TStringList.Create;
  try
    LS.Add('SELECT ');
    for tmpP in FParamList do
    begin
      LS.Add(tmpP.Field);
      if tmpP.AlasName <> '' then
        LS.Add('AS ' + tmpP.AlasName);
      LS.Add(',');
    end;
    if LS[LS.Count - 1] = ',' then
      LS.Delete(LS.Count - 1);
    LS.Add('FROM ' + ATableName);
    LS.Add('WHERE');
    LS.Add(AWhere);
    try
      if FCON <> nil then
      begin
        Result := (Self as IADOSQL).SQLGetData(FCON, LS, outData);
      end
      else
        Result := 2;
    except
      on e: Exception do Result := SysErrShow(e);
    end;
  finally
    LS.Free;
  end;
end;

function TDBTableBase.Select(ATableName: string; AWhere: string;
  out outDS: TClientDataSet): gErrcode;
var
  d: OleVariant;
begin
  Result := Select(ATableName, AWhere, d);
  if Result = 1 then
    outDS.Data := d;
end;

function TDBTableBase.Update(ATableName: string; AWhere: string): gErrcode;
var
  LS: TStringList;
  tmpP: TTableParam;
  tmp1: Integer;
begin
  LS := TStringList.Create;
  try
    LS.Add('UPDATE ' + ATableName + ' SET ');
    for tmpP in FParamList do
    begin
      if tmpP.FType = tpInt then
        LS.Add(tmpP.Field + '=' + tmpP.Value);
      if tmpP.FType = tpStr then
        LS.Add(tmpP.Field + '=' + QuotedStr(tmpP.Value));
      LS.Add(',');
    end;
    if LS[LS.Count - 1] = ',' then
      LS.Delete(LS.Count - 1);
    LS.Add('WHERE');
    LS.Add(AWhere);
    try
      if FCON <> nil then
      begin
        Result := (Self as IADOSQL).SQLExec(FCON, LS, tmp1);
      end
      else
        Result := 2;
    except
      on e: Exception do Result := SysErrShow(e);
    end;
  finally
    LS.Free;
  end;
end;

{ TDBCustomTable }

constructor TDBCustomTable.Create(ACON: IADOCON; ATableName: string);
begin
  inherited Create(ACON);
  FTableName := ATableName;
end;

function TDBCustomTable.Delete(AWhere: string): gErrcode;
begin
  Result := (Self as IDBTableBase).Delete(FTableName, AWhere);
end;

function TDBCustomTable.GetTableName: string;
begin
  Result := FTableName;
end;

function TDBCustomTable.Insert: gErrcode;
begin
  Result := (Self as IDBTableBase).Insert(FTableName);
end;

function TDBCustomTable.Select(AWhere: string;
  out outData: OleVariant): gErrcode;
begin
  Result := (Self as IDBTableBase).Select(FTableName, AWhere, outData);
end;

function TDBCustomTable.Select(AWhere: string;
  out outDS: TClientDataSet): gErrcode;
begin
  Result := (Self as IDBTableBase).Select(FTableName, AWhere, outDS);
end;

procedure TDBCustomTable.SetTableName(const ATableName: string);
begin
  FTableName := ATableName;
end;

function TDBCustomTable.Update(AWhere: string): gErrcode;
begin
  Result := (Self as IDBTableBase).Update(FTableName, AWhere);
end;

end.
