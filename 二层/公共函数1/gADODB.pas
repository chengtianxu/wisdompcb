{*******************************************************}
{                                                       }
{       ADODB接口单元                                   }
{                                                       }
{       作者：ChengTX                                   }
{                                                       }
{       时间：2012-06-20 9:34:08                        }
{                                                       }
{*******************************************************}

//ClientDataSet版本

unit gADODB;

interface
uses
  DB, ADODB, Classes, DBClient, SysUtils;


const
  IID_ADOCON = '{65532C11-CE1F-4761-8A43-B07296F8A1E6}';
  IID_ADOSQL = '{526B74A0-9AF4-4B38-9F4C-10CF5F66B22D}';


type
  gErrCode = Integer;

  IADOCON = interface
  ['{65532C11-CE1F-4761-8A43-B07296F8A1E6}']
  function ConOpen(const AConstr: string): gErrCode;overload;
  function ConOpen: gErrCode;overload;
  function ConClose(): gErrCode;
  function Connected: Boolean;
  function ConObj: TADOConnection;
  function BeginTran: gErrCode;
  function CommitTran: gErrCode;
  function RollBackTran: gErrCode;
  function InTran: Boolean;
  end;

  IADOSQL = interface
  ['{526B74A0-9AF4-4B38-9F4C-10CF5F66B22D}']
  function SQLGetData(ACon: IADOCON; ASQL: string; out outData: OleVariant): gErrCode;overload;
  function SQLGetData(ACon: IADOCON; ASQL: TStringList; out outData: OleVariant): gErrCode;overload;
  function SQLGetData(ACon: IADOCON; ASQL: TStringList; out outDS: TClientDataSet): gErrCode;overload;
  function SQLGetData(ACon: IADOCON; ASQL: string; out outDS: TClientDataSet): gErrCode;overload;
  function SQLExec(ACon: IADOCON; ASQL: string; out outRowCount: Integer): gErrCode;overload;
  function SQLExec(ACon: IADOCON; ASQL: TStringList; out outRowCount: Integer): gErrCode;overload;
  end;



  TADOCON = class(TInterfacedObject, IADOCON)
  private
    FCON: TADOConnection;
    FCONStr: string;
    function ConOpen(const AConstr: string): gErrCode;overload;
    function ConOpen: gErrCode;overload;
    function ConClose(): gErrCode;
    function Connected: Boolean;
    function ConObj: TADOConnection;
    function BeginTran: gErrCode;
    function CommitTran: gErrCode;
    function RollBackTran: gErrCode;
    function InTran: Boolean;
  public
    constructor Create(AConstr: string);overload;
    destructor Destroy; override;
  end;


  TADOSQL = class(TInterfacedObject, IADOSQL)
  private
    function SQLGetData(ACon: IADOCON; ASQL: string; out outData: OleVariant): gErrCode;overload;
    function SQLGetData(ACon: IADOCON; ASQL: TStringList; out outData: OleVariant): gErrCode;overload;
    function SQLGetData(ACon: IADOCON; ASQL: TStringList; out outDS: TClientDataSet): gErrCode;overload;
    function SQLGetData(ACon: IADOCON; ASQL: string; out outDS: TClientDataSet): gErrCode;overload;
    function SQLExec(ACon: IADOCON; ASQL: string; out outRowCount: Integer): gErrCode;overload;
    function SQLExec(ACon: IADOCON; ASQL: TStringList; out outRowCount: Integer): gErrCode;overload;
  end;

implementation

uses
  Dialogs, Provider, gFun;

{ TADOCON }

function TADOCON.BeginTran: gErrCode;
begin
  try
    if Assigned(FCON) then
    begin
      Result := ConOpen();
      if Result = 1 then
        if FCON.Connected then
          if not FCON.InTransaction then
          begin
            FCON.BeginTrans;
            Result := 1;
          end
          else
            Result := 4
        else
          Result := 3
      else
        Exit;
    end
    else
      Result := 2 ;
  except
    on e: Exception do Result := SysErrShow(e);
  end;
end;

function TADOCON.CommitTran: gErrCode;
begin
  try
    if Assigned(FCON) then
      if FCON.InTransaction then
      begin
        FCON.CommitTrans;
        //FCON.Close;
        Result := 1;
      end else
        Result := 5
    else
      Result := 2;
  except
    on e: Exception do Result := SysErrShow(e);
  end;
end;

function TADOCON.ConClose: gErrCode;
begin
  try
    if Assigned(FCON) then
    begin
      FCON.Close;
      Result := 1;
    end
    else
      Result := 2;
  except
    on e: Exception do Result := SysErrShow(e);
  end;
end;

function TADOCON.Connected: Boolean;
begin
  if Assigned(FCON) then
    Result := FCON.Connected
  else
    Result := False;
end;

function TADOCON.ConObj: TADOConnection;
begin
  Result := FCON;
end;

function TADOCON.ConOpen: gErrCode;
begin
  Result := ConOpen(FCONStr);
end;

function TADOCON.ConOpen(const AConstr: string): gErrCode;
begin
  if Assigned(FCON) then
  begin
    Result := ConClose;
    if Result <> 1 then Exit;
  end else
  begin
    FCON := TADOConnection.Create(nil);
    FCON.LoginPrompt := False;
  end;

  try
    FCON.ConnectionString := AConstr;
    FCON.Connected := True;
    Result := 1;
  except
    on e: Exception do Result := SysErrShow(e);
  end;
end;

constructor TADOCON.Create(AConstr: string);
begin
  inherited Create;
  FCON := TADOConnection.Create(nil);
  FCON.LoginPrompt := False;
  FCONStr := AConstr;
end;

destructor TADOCON.Destroy;
begin
  FreeAndNil(FCON);
  inherited;
end;

function TADOCON.InTran: Boolean;
begin
  if Assigned(FCON) then
    Result := FCON.InTransaction
  else
    Result :=  False;
end;

function TADOCON.RollBackTran: gErrCode;
begin
  try
    try
      if Assigned(FCON) then
        if FCON.Connected then
          if FCON.InTransaction then
          begin
            FCON.RollbackTrans;
            Result := 1;
          end
          else
            Result := 5
        else
          Result := 3
      else
        Result := 2 ;
    except
      on e: Exception do Result := SysErrShow(e);
    end;
  finally
    //if Assigned(FCON) then FCON.Close;
  end;
end;

{ TADOSQL }

function TADOSQL.SQLExec(ACon: IADOCON; ASQL: string;
  out outRowCount: Integer): gErrCode;
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  try
    LS.Add(ASQL);
    Result := SQLExec(ACon,LS,outRowCount);
  finally
    LS.Free;
  end;
end;

function TADOSQL.SQLExec(ACon: IADOCON; ASQL: TStringList;
  out outRowCount: Integer): gErrCode;
var
  LQry: TADOQuery;
begin
  LQry := TADOQuery.Create(nil);
  LQry.Prepared := True;
  try
    try
      if ACon <> nil then
      begin
        if not ACon.Connected then
        begin
          Result := ACon.ConOpen();
          if Result <> 1 then Exit;
        end;
        if ACon.Connected then
        begin
          LQry.Connection := ACon.ConObj;
          LQry.SQL.Clear;
          LQry.SQL.Assign(ASQL);
          outRowCount := LQry.ExecSQL;
          Result := 1;
        end else
          Result := 3;
      end else
        Result := 2;
    except
      on e: Exception do
      begin
        ShowLS(asql);
        Result := SysErrShow(e);
      end;
    end;
  finally
    LQry.Close;
    LQry.Free;
//    if (ACon <> nil) and (not ACon.InTran) then
//      ACon.ConClose;
  end;
end;

function TADOSQL.SQLGetData(ACon: IADOCON; ASQL: string;
  out outDS: TClientDataSet): gErrCode;
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  try
    LS.Add(ASQL);
    Result := SQLGetData(ACon,LS,outDS);
  finally
    LS.Free;
  end;
end;

function TADOSQL.SQLGetData(ACon: IADOCON; ASQL: string;
  out outData: OleVariant): gErrCode;
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  try
    LS.Add(ASQL);
    Result := SQLGetData(ACon,LS,outData);
  finally
    LS.Free;
  end;
end;

function TADOSQL.SQLGetData(ACon: IADOCON; ASQL: TStringList;
  out outData: OleVariant): gErrCode;
var
  LQry: TADOQuery;
  LPre: TDataSetProvider;
begin
  LQry := TADOQuery.Create(nil);
  LQry.Prepared := True;
  LPre := TDataSetProvider.Create(nil);
  LPre.DataSet := LQry;
  try
    try
      if ACon <> nil then
      begin
        if not ACon.Connected then
        begin
          Result := ACon.ConOpen();
          if Result <> 1 then Exit;
        end;
        if ACon.Connected then
        begin
          LQry.Connection := ACon.ConObj;
          LQry.SQL.Clear;
          LQry.SQL.Assign(ASQL);
          LQry.Open;
          outData := LPre.Data;
          Result := 1;
        end else
          Result := 3;
      end else
        Result := 2;
    except
      on e: Exception do Result := SysErrShow(e);
    end;
  finally
    LQry.Close;
    LQry.Free;
    LPre.Free;
//    if (ACon <> nil) and (not ACon.InTran) then
//      ACon.ConClose;
  end;
end;

function TADOSQL.SQLGetData(ACon: IADOCON; ASQL: TStringList;
  out outDS: TClientDataSet): gErrCode;
var
  tmpData: OleVariant;
begin
  Result := SQLGetData(ACon,ASQL,tmpData);
  if Result = 1 then
  begin
    outDS.Filtered := False;
    outDS.Data := tmpData;
  end;
end;

end.
