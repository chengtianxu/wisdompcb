unit damo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS415: TDataSource;
    ADS415: TADODataSet;
    ADS415number: TStringField;
    ADS415type: TWordField;
    ADS415status: TWordField;
    ADS415rkey: TAutoIncField;
    ADS415MANU_PART_NUMBER: TStringField;
    ADS415MANU_PART_DESC: TStringField;
    ADS415EMPLOYEE_NAME: TStringField;
    ADS415sys_date: TDateTimeField;
    ADS415quantity: TIntegerField;
    ADS415reference: TStringField;
    ADS415abbr_name10: TStringField;
    ADS415cust_code: TStringField;
    ADS415CUSTOMER_NAME: TStringField;
    aqtmp: TADOQuery;
    ADS415v_type: TStringField;
    ADS415v_status: TStringField;
    AQ04: TADOQuery;
    AQ04RKEY: TAutoIncField;
    AQ04CONTROL_NO_LENGTH: TSmallintField;
    AQ04SEED_MEAN: TStringField;
    AQ04BIG5_SEED_MEAN: TStringField;
    AQ04SEED_VALUE: TStringField;
    AQ04SEED_FLAG: TWordField;
    AQ04table_name: TStringField;
    aqtmp1: TADOQuery;
    ADS415d25rkey: TAutoIncField;
    AQ415: TADOQuery;
    AQ415rkey: TAutoIncField;
    AQ415number: TStringField;
    AQ415type: TWordField;
    AQ415status: TWordField;
    AQ415empl_ptr: TIntegerField;
    AQ415custpart_ptr: TIntegerField;
    AQ415sys_date: TDateTimeField;
    AQ415quantity: TIntegerField;
    AQ415reference: TStringField;
    AQ415auth_empl_ptr: TIntegerField;
    AQ415auth_date: TDateTimeField;
    AQ415qty_received: TIntegerField;
    AQ415rma_ptr: TIntegerField;
    ADS415rma_ptr: TIntegerField;
    AQ415customer_ptr: TIntegerField;
    ADS415so_mianji: TFloatField;
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
