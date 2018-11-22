unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, MXDB, Mxstore, DBTables, MXTABLES;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
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
