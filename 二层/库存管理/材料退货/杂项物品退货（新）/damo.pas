unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADS235: TADODataSet;
    DataSource1: TDataSource;
    ADS235goods_name: TStringField;
    ADS235goods_guige: TStringField;
    ADS235goods_type: TStringField;
    ADS235ABBR_NAME: TStringField;
    ADS235LOCATION: TStringField;
    ADS235QUAN_RECD: TBCDField;
    ADS235QUAN_ON_HAND: TBCDField;
    ADS235quan_to_ship: TFloatField;
    ADS235quan_returned: TFloatField;
    ADS235UNIT_NAME: TStringField;
    ADS235ship_DATE: TDateTimeField;
    ADS235REF_NUMBER: TStringField;
    ADS235CODE: TStringField;
    ADS235SUPPLIER_NAME: TStringField;
    ADS235PO_NUMBER: TStringField;
    ADS235CONFIRMATION_NUMBER: TStringField;
    ADS235PO_DATE: TDateTimeField;
    ADS235GRN_NUMBER: TStringField;
    ADS235WAREHOUSE_CODE: TStringField;
    ADS235RKEY: TAutoIncField;
    tmp: TADOQuery;
    ADS235DESCRIPTION2: TStringField;
    Ado849s: TADOQuery;
    Ado849sRkey: TAutoIncField;
    Ado849sD419_ptr: TIntegerField;
    Ado849sD073_ptr: TIntegerField;
    Ado849sFormName: TStringField;
    Ado849sGridName: TStringField;
    Ado849sFieldName: TStringField;
    Ado849sFieldCaption: TStringField;
    Ado849sFieldOrder: TIntegerField;
    Ado849sFieldWidth: TIntegerField;
    Ado849sIsDisplay: TBooleanField;
    Ado0849: TADOQuery;
    Ado0849Sel: TBooleanField;
    Ado0849Rkey: TAutoIncField;
    Ado0849D419_ptr: TIntegerField;
    Ado0849D073_ptr: TIntegerField;
    Ado0849FormName: TStringField;
    Ado0849GridName: TStringField;
    Ado0849FieldName: TStringField;
    Ado0849FieldCaption: TStringField;
    Ado0849FieldOrder: TIntegerField;
    Ado0849FieldWidth: TIntegerField;
    Ado0849IsDisplay: TBooleanField;
    DSP2: TDataSetProvider;
    CDS2: TClientDataSet;
    ADS235D0072_PTR: TIntegerField;
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
