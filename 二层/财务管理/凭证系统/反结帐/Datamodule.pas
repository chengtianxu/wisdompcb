unit Datamodule;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    DS0508: TADODataSet;
    ADOQ: TADOQuery;
    DS0105: TADODataSet;
    ds0110: TADOQuery;
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
