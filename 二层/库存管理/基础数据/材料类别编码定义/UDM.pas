unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    qry594: TADOQuery;
    qry594rkey593: TIntegerField;
    qry594rec_no: TIntegerField;
    qry594type_name: TStringField;
    qry594type_code: TStringField;
    qry594filter_name: TStringField;
    ds594: TDataSource;
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
