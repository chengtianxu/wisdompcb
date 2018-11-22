unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADS416: TADODataSet;
    ADS53: TADODataSet;
    tmp: TADOQuery;
    ADS416number: TStringField;
    ADS416type: TWordField;
    ADS416empl_ptr: TIntegerField;
    ADS416sys_date: TDateTimeField;
    ADS416quantity: TIntegerField;
    ADS416reference: TStringField;
    ADS416EMPLOYEE_NAME: TStringField;
    ADS53MANU_PART_NUMBER: TStringField;
    ADS53MANU_PART_DESC: TStringField;
    ADS53WORK_ORDER_NUMBER: TStringField;
    ADS53ABBR_NAME: TStringField;
    ADS53LOCATION: TStringField;
    ADS53QTY_ON_HAND: TFloatField;
    ADS53MFG_DATE: TDateTimeField;
    ADS53RMA_PTR: TIntegerField;
    ADS53REFERENCE_NUMBER: TStringField;
    ADS416rkey: TIntegerField;
    ADS53spec_place: TStringField;
    ADS53rkey58: TIntegerField;
    ADS53CUST_PART_PTR: TIntegerField;
    ADS53rkey: TIntegerField;
    ADS53vQTY_ON_HAND: TIntegerField;
    ADS53NPAD_PTR: TIntegerField;
    ADS53QUANTITY: TFloatField;
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
