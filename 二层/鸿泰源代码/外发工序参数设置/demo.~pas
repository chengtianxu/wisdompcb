unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS34: TADODataSet;
    DataSource1: TDataSource;
    ADS34rkey: TAutoIncField;
    ADS34DEPT_CODE: TStringField;
    ADS34DEPT_NAME: TStringField;
    DataSource2: TDataSource;
    ADSWz308: TADODataSet;
    ADSWz308PARAMETER_NAME: TStringField;
    ADSWz308PARAMETER_DESC: TStringField;
    ADSWz308UNIT_NAME: TStringField;
    ADSWz308Dept_ptr: TIntegerField;
    ADSWz308PARAMETER278_PTR: TIntegerField;
    ADSWz308DATA_TYPE: TStringField;
    ADSWz308CATEGORY_PTR: TStringField;
    ADOQuery1: TADOQuery;
    procedure ADS34AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADS34AfterScroll(DataSet: TDataSet);
begin
  ADSWz308.Close;
  ADSWz308.Parameters[0].Value := ADS34rkey.Value;
  ADSWz308.Open;
end;

end.
