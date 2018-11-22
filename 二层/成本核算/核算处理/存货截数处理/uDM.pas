unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    Qery192: TADOQuery;
    Qery5: TADOQuery;
    QeryDate: TADOQuery;
    Qery445: TADOQuery;
    Qery449: TADOQuery;
    Qery448: TADOQuery;
    DS444: TADODataSet;
    Qery: TADOQuery;
    QeryDatevdt: TDateTimeField;
    QeryDatevd: TDateTimeField;
    AD462: TADODataSet;
    DataSource1: TDataSource;
    AD462DEPT_CODE: TStringField;
    AD462DEPT_NAME: TStringField;
    AD462INV_PART_NUMBER: TStringField;
    AD462INV_NAME: TStringField;
    AD462INV_DESCRIPTION: TStringField;
    AD462QUAN: TFloatField;
    AD462STD_PRICE: TFloatField;
    AD462UNIT_NAME: TStringField;
    AD462amount: TFloatField;
    AD462RKEY: TAutoIncField;
    AD462D0443_PTR: TIntegerField;
    AD462DEPT_PTR: TIntegerField;
    AD462INVENT_PTR: TIntegerField;
    wzpr444_7: TADOStoredProc;
    wzpr444_7rkey: TAutoIncField;
    wzpr444_7cut_date: TDateTimeField;
    DS444RKEY: TAutoIncField;
    DS444CUT_DATE: TDateTimeField;
    DS444MATL_DATE: TDateTimeField;
    DS444WIP_DATE: TDateTimeField;
    DS444SFG_DATE: TDateTimeField;
    DS444FG_DATE: TDateTimeField;
    DS444TDATE: TDateTimeField;
    DS444CUT_BY: TIntegerField;
    DS444MATL_CST_IN_STOCK_CLOSED: TBCDField;
    DS444MATL_CST_IN_DEPT_CLOSED: TBCDField;
    DS444MATL_CST_IN_WIP_CLOSED: TBCDField;
    DS444MATL_CST_IN_SFG_CLOSED: TBCDField;
    DS444MATL_CST_IN_FG_CLOSED: TBCDField;
    DS444OVHD_CST_IN_WIP_CLOSED: TBCDField;
    DS444OVHD_CST_IN_SFG_CLOSED: TBCDField;
    DS444OVHD_CST_IN_FG_CLOSED: TBCDField;
    DS444CLOSED: TStringField;
    DS444early_ptr: TIntegerField;
    DS444employee_name: TStringField;
    AD462warehouse_code: TStringField;
    AD462abbr_name: TStringField;
    AD462warehouse_ptr: TIntegerField;
    ADOtemp: TADOQuery;
    ADOtempSTD_PRICE: TFloatField;
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
