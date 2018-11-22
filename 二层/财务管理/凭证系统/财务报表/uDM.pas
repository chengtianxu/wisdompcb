unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    conn: TADOConnection;
    Qry524: TADOQuery;
    Qry508: TADOQuery;
    Qry524RKEY: TAutoIncField;
    Qry524REPORT_FILE: TStringField;
    Qry110: TADOQuery;
    Qry: TADOQuery;
    Qry524fyear: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
