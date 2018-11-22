unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO04: TADODataSet;
    DataSource1: TDataSource;
    ADO04RKEY: TAutoIncField;
    ADO04CONTROL_NO_LENGTH: TSmallintField;
    ADO04SEED_MEAN: TStringField;
    ADO04SEED_FLAG: TWordField;
    ADO04SEED_VALUE: TStringField;
    ADO04table_name: TStringField;
    ADO04seed_flag1: TStringField;
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
