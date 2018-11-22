unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    AQ70: TADOQuery;
    AQ71: TADOQuery;
    DS2: TDataSource;
    DS1: TDataSource;
    AQ70RKEY: TAutoIncField;
    AQ70PO_NUMBER: TStringField;
    AQ70EMPLOYEE_POINTER: TIntegerField;
    AQ70SUPPLIER_POINTER: TIntegerField;
    AQ70SUPP_FAC_ADD_PTR: TIntegerField;
    AQ70WAREHOUSE_POINTER: TIntegerField;
    AQ70PO_DATE: TDateTimeField;
    AQ70SUPPIER_CONTACT: TStringField;
    AQ70CONTACT_PHONE: TStringField;
    AQ70FOB: TStringField;
    AQ70PO_REV_NO: TStringField;
    AQ70supName: TStringField;
    AQ70CODE: TStringField;
    AQ70facName: TStringField;
    AQ71RKEY: TAutoIncField;
    AQ71PO_PTR: TIntegerField;
    AQ71INVT_PTR: TIntegerField;
    AQ71INV_PART_NUMBER: TStringField;
    AQ71INV_NAME: TStringField;
    AQ71QUAN_ORD: TFloatField;
    AQ71REQ_DATE: TDateTimeField;
    AQ71extra_req: TStringField;
    AQ71rohs: TStringField;
    AQ71UNIT_NAME: TStringField;
    AQ71avl_flag: TStringField;
    AQ70employee_name: TStringField;
    AQ71employee_name: TStringField;
    AQ71printed_date: TDateTimeField;
    AQ71CRITICAL_MATL: TStringField;
    AQ71INV_DESCRIPTION: TStringField;
    AQ71QUAN_IN_INSP: TFloatField;
    AQ71QUAN_RECD: TFloatField;
    AQ71IF_CAF: TWideStringField;
  private

  public

  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.

