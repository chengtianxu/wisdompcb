unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADO127A: TADODataSet;
    ADO127: TADODataSet;
    ADO73: TADODataSet;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADO127Arkey: TAutoIncField;
    ADO127Ainvoice_number: TStringField;
    ADO127Ainvoice_no: TStringField;
    ADO127Asupp_ptr: TIntegerField;
    ADO127Ainvoice_date: TDateTimeField;
    ADO127Aaccount_date: TDateTimeField;
    ADO127Amatl_year: TSmallintField;
    ADO127Amatl_month: TSmallintField;
    ADO127AMATL_amount: TBCDField;
    ADO127Atax_amount: TBCDField;
    ADO127Atax: TBCDField;
    ADO127AINV_TOTAL: TBCDField;
    ADO127Aremark: TStringField;
    ADO127AGL_HEADER_PTR: TIntegerField;
    ADO127AGLPTR_STATUS: TBooleanField;
    ADO127Auser_ptr: TIntegerField;
    ADO127rkey: TAutoIncField;
    ADO127invoice_number: TStringField;
    ADO127invoice_no: TStringField;
    ADO127supp_ptr: TIntegerField;
    ADO127CODE: TStringField;
    ADO127SUPPLIER_NAME: TStringField;
    ADO127ANALYSIS_CODE1: TStringField;
    ADO127invoice_date: TDateTimeField;
    ADO127account_date: TDateTimeField;
    ADO127matl_year: TSmallintField;
    ADO127matl_month: TSmallintField;
    ADO127MATL_amount: TBCDField;
    ADO127tax_amount: TBCDField;
    ADO127tax: TBCDField;
    ADO127INV_TOTAL: TBCDField;
    ADO127remark: TStringField;
    ADO127GL_HEADER_PTR: TIntegerField;
    ADO127VOUCHER: TStringField;
    ADO127GLPTR_STATUS: TBooleanField;
    ADO127user_ptr: TIntegerField;
    ADO127employee_name: TStringField;
    ADO127GLPTR_STATUS1: TStringField;
    ADO73employee_ptr: TIntegerField;
    ADOQuery2: TADOQuery;
    ADO127Aent_date: TDateTimeField;
    ADO127Awarehouse_ptr: TIntegerField;
    ADO127warehouse_code: TStringField;
    ADO127warehouse_name: TStringField;
    ADO127abbr_name: TStringField;
    ADO127ent_date: TDateTimeField;
    ADO127warehouse_ptr: TIntegerField;
    qryTmp: TADOQuery;
    ADO127goods_name: TStringField;
    ADO127tax_number: TStringField;
    ADO127total_matl_amount: TBCDField;
    ADO127total_tax_amount: TBCDField;
    ADO127pause_matl_amount: TBCDField;
    ADO127pause_tax_amount: TBCDField;
    ADO127Agoods_name: TStringField;
    ADO127Atax_number: TStringField;
    ADO127Atotal_matl_amount: TBCDField;
    ADO127Atotal_tax_amount: TBCDField;
    ADO127Apause_matl_amount: TBCDField;
    ADO127Apause_tax_amount: TBCDField;
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
