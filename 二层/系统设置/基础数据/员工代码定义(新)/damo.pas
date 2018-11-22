unit damo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ds05: TDataSource;
    aq34: TADOQuery;
    aqtmp: TADOQuery;
    ads05: TADODataSet;
    aq04: TADOQuery;
    aq04CONTROL_NO_LENGTH: TSmallintField;
    aq04SEED_VALUE: TStringField;
    aq04SEED_FLAG: TWordField;
    ads05dept_name: TStringField;
    ads05empl_code: TStringField;
    ads05employee_name: TStringField;
    ads05abbr_name: TStringField;
    ads05employee_id: TIntegerField;
    ads05address_line_1: TStringField;
    ads05state: TStringField;
    ads05zip: TStringField;
    ads05phone: TStringField;
    ads05active_flag: TStringField;
    ads05buyer_flag: TStringField;
    ads05comein_date: TDateTimeField;
    ads05inactive_date: TDateTimeField;
    ads05tpostion: TStringField;
    ads05email: TStringField;
    ads05popedom: TWordField;
    ads05popedom_: TStringField;
    ads05born: TDateTimeField;
    ads05gender: TStringField;
    ads05school_age: TStringField;
    ads05identity_card: TStringField;
    ads05nation: TStringField;
    aq34RKEY: TAutoIncField;
    aq34DEPT_CODE: TStringField;
    aq34DEPT_NAME: TStringField;
    aq34BIG_DEPT_PTR: TIntegerField;
    aq034: TADOQuery;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    ads05LAST_UPDT: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation
uses detail;

{$R *.dfm}

end.
