unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADS221: TADODataSet;
    ADS221type: TWordField;
    ADS221status: TWordField;
    ADS221EMPLOYEE_NAME: TStringField;
    ADS221QUTH_EMPLNAME: TStringField;
    ADS221sys_date: TDateTimeField;
    ADS221auth_date: TDateTimeField;
    ADS221quantity: TIntegerField;
    ADS221reference: TStringField;
    ADS221rkey: TAutoIncField;
    ADS221c_type: TStringField;
    ADS221c_status: TStringField;
    DataSource2: TDataSource;
    ADS222: TADODataSet;
    ADS222INV_PART_NUMBER: TStringField;
    ADS222INV_NAME: TStringField;
    ADS222INV_DESCRIPTION: TStringField;
    ADS222LOCATION_NAME: TStringField;
    ADS222ABBR_NAME: TStringField;
    ADS222QUANTITY: TIntegerField;
    ADS222OH_degree: TWordField;
    ADOQuery1: TADOQuery;
    ADS222reference: TStringField;
    ADS221auth_empl_ptr: TIntegerField;
    ADS221number: TStringField;
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
