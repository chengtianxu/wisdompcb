unit damo;

interface

uses
  Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource_cx: TDataSource;
    ADOTMP: TADOQuery;
    ADOTMP_DEL: TADOQuery;
    adotmp2: TADOQuery;
    ds2: TDataSource;
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
