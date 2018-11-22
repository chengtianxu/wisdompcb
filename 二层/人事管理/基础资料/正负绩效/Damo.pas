unit Damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    qry1: TADOQuery;
    ds1: TDataSource;
    qry2: TADOQuery;
    ds2: TDataSource;
    qrytemp: TADOQuery;
    ds3: TDataSource;
    qry3: TADOQuery;
    qry1s: TADOQuery;
    ds1s: TDataSource;
    updatemistake: TADOQuery;
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
