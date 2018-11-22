unit PasDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    adsMain: TADODataSet;
    dsMain: TDataSource;
    adoTmp: TADOQuery;
    qryPost: TADOQuery;
    qryPostaccount_type: TWordField;
    qryPostempcard: TStringField;
    qryPostempcode: TStringField;
    qryPostcard_time: TDateTimeField;
    qryPostpayed: TBCDField;
    qryPostdev_id: TStringField;
    qryPoststrmeal_type: TStringField;
    qryPoststrcompany: TWideStringField;
    qrySTOR: TADOQuery;
    spPost: TADOStoredProc;
    qryPostinport_time: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecSql(AQry: TADOQuery; ASql: string): Boolean;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function TDM.ExecSql(AQry: TADOQuery; ASql: string): Boolean;
begin
  Result:=True;
  AQry.Close;
  AQry.SQL.Text:=ASql;
  try
    AQry.ExecSQL;
  except
    Result:=False;
  end;
end;

end.
