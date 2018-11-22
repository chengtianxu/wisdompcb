unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,windows, DBClient, Provider,mask,Dialogs,StrUtils;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    tmp: TADOQuery;
    DS1: TDataSource;
    DS2: TDataSource;
    ADO70: TADOQuery;
    ADO71: TADOQuery;
    ADO70rkey: TAutoIncField;
    ADO70sales_order: TStringField;
    ADO70sales_date: TDateTimeField;
    ADO70customer_ptr: TIntegerField;
    ADO70type: TWordField;
    ADO70status: TWordField;
    ADO70ship_method: TStringField;
    ADO70location: TStringField;
    ADO70SALES_REP_PTR: TIntegerField;
    ADO70ent_date: TDateTimeField;
    ADO70ent_user_ptr: TIntegerField;
    ADO70currency_ptr: TIntegerField;
    ADO70exch_rate: TBCDField;
    ADO70total_amount: TBCDField;
    ADO70entrust_deptptr: TIntegerField;
    ADO70produce_deptptr: TIntegerField;
    ADO70CONTACT_NAME: TStringField;
    ADO70CONT_PHONE: TStringField;
    ADO70TAX_cate: TStringField;
    ADO70pay_method: TStringField;
    ADO70CONF_BY_EMPL_PTR: TIntegerField;
    ADO70CONF_DATE: TDateTimeField;
    ADO70remark: TStringField;
    ADO70CUST_CODE: TStringField;
    ADO70CUSTOMER_NAME: TStringField;
    ADO70REP_CODE: TStringField;
    ADO70EMPL_CODE: TStringField;
    ADO70EMPLOYEE_NAME: TStringField;
    ADO70DEPT_CODE: TStringField;
    ADO70DEPT_NAME: TStringField;
    ADO70CURR_CODE: TStringField;
    ADO70CURR_NAME: TStringField;
    ADO70status_c: TStringField;
    ADO70sales_rep_name: TStringField;
    ADO70DEPT_NAME_t: TStringField;
    ADO70EMPL_CODE_c: TStringField;
    ADO70EMPLOYEE_NAME_c: TStringField;
    ADO70dept_code_t: TStringField;
    ADO70type_c: TStringField;
    ADO71rkey: TIntegerField;
    ADO71so_ptr: TIntegerField;
    ADO71prod_ptr: TIntegerField;
    ADO71quantity: TBCDField;
    ADO71price: TBCDField;
    ADO71tax_rate: TBCDField;
    ADO71QTY_PLANED: TBCDField;
    ADO71PARTS_SHIPPED: TBCDField;
    ADO71returen_qty: TBCDField;
    ADO71complete_date: TDateTimeField;
    ADO71remark: TStringField;
    ADO71PROD_CODE: TStringField;
    ADO71PRODUCT_NAME: TStringField;
    ADO71PRODUCT_desc: TStringField;
    ADO71UNIT_NAME: TStringField;
    procedure ADO70AfterScroll(DataSet: TDataSet);
  private

  public    

  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO70AfterScroll(DataSet: TDataSet);
begin
  ADO71.Close;
  ADO71.Parameters[0].Value:=DataSet.FieldValues['rkey'];
  ADO71.Open;
end;



end.
