unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ72: TADOQuery;
    DataSource1: TDataSource;
    AQ235: TADOQuery;
    DataSource2: TDataSource;
    ado95: TADOQuery;
    ado9511: TADOQuery;
    ADOQuery1: TADOQuery;
    aq96: TADOQuery;
    DataSource3: TDataSource;
    AQ72DESCRIPTION: TStringField;
    AQ72GUI_GE: TStringField;
    AQ72DESCRIPTION2: TStringField;
    AQ72QUAN_ORD: TFloatField;
    AQ72QUANTITY_RECEIVED: TFloatField;
    AQ72QUAN_RETN: TFloatField;
    AQ72DEL_DATE: TDateTimeField;
    AQ72UNIT_NAME: TStringField;
    AQ72RKEY: TIntegerField;
    AQ235DATE_RECD: TDateTimeField;
    AQ235QUAN_RECD: TFloatField;
    AQ235QUAN_ON_HAND: TFloatField;
    AQ235quan_to_ship: TFloatField;
    AQ235quan_returned: TFloatField;
    AQ235GRN_NUMBER: TStringField;
    AQ235EMPLOYEE_NAME: TStringField;
    AQ235rkey: TAutoIncField;
    aq96quantity: TFloatField;
    aq96REJECT_DESCRIPTION: TStringField;
    aq96employee_name: TStringField;
    aq96rkey: TIntegerField;
    AQ235D0072_PTR: TIntegerField;
    aq96tdate: TDateTimeField;
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
