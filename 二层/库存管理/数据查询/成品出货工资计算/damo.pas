unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ34: TADODataSet;
    AQ34rkey: TIntegerField;
    AQ34DEPT_CODE: TStringField;
    AQ34DEPT_NAME: TStringField;
    ADS38: TADODataSet;
    ADS38dept_ptr: TIntegerField;
    ADS494: TADODataSet;
    ADS494PARAMETER_VALUE: TStringField;
    ADS494rkey25: TIntegerField;
    ADS494rkey34: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
