unit Datamodule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    DS0508: TADODataSet;
    DS0105: TADODataSet;
    ADOQ: TADOQuery;
    ds0110: TADOQuery;
    ds0103: TADOQuery;
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
