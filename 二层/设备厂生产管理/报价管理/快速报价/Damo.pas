unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AqDcp60: TADODataSet;
    AqDcp60sales_order: TStringField;
    AqDcp60CUST_CODE: TStringField;
    AqDcp60CUSTOMER_NAME: TStringField;
    AqDcp60ABBR_NAME: TStringField;
    AqDcp60CURR_CODE: TStringField;
    AqDcp60CURR_NAME: TStringField;
    AqDcp60exch_rate: TBCDField;
    AqDcp60total_amount: TBCDField;
    AqDcp60REP_CODE: TStringField;
    AqDcp60SALES_REP_NAME: TStringField;
    AqDcp60status: TWordField;
    AqDcp60sales_date: TDateTimeField;
    AqDcp60rkey: TAutoIncField;
    DataSource1: TDataSource;
    AqDcp60v_status: TStringField;
    ADO04: TADOQuery;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    ADOQuery1: TADOQuery;
    ADODCP60: TADODataSet;
    ADODCP60rkey: TAutoIncField;
    ADODCP60sales_order: TStringField;
    ADODCP60sales_date: TDateTimeField;
    ADODCP60customer_ptr: TIntegerField;
    ADODCP60status: TWordField;
    ADODCP60ship_method: TStringField;
    ADODCP60location: TStringField;
    ADODCP60SALES_REP_PTR: TIntegerField;
    ADODCP60ent_date: TDateTimeField;
    ADODCP60ent_user_ptr: TIntegerField;
    ADODCP60currency_ptr: TIntegerField;
    ADODCP60exch_rate: TBCDField;
    ADODCP60total_amount: TBCDField;
    ADODCP60CONTACT_NAME: TStringField;
    ADODCP60CONT_PHONE: TStringField;
    ADODCP60TAX_cate: TStringField;
    ADODCP60pay_method: TStringField;
    ADODCP60invoice_ptr: TIntegerField;
    ADODCP60remark: TStringField;
    ADODcp63: TADODataSet;
    ADODcp63so_ptr: TIntegerField;
    ADODcp63prod_ptr: TIntegerField;
    ADODcp63location_ptr: TIntegerField;
    ADODcp63quantity: TBCDField;
    ADODcp63price: TBCDField;
    ADODcp63tax_rate: TBCDField;
    ADODcp63remark: TStringField;
    AqD63: TADODataSet;
    DataSource2: TDataSource;
    AqD63PROD_CODE: TStringField;
    AqD63PRODUCT_NAME: TStringField;
    AqD63CODE: TStringField;
    AqD63quantity: TBCDField;
    AqD63price: TBCDField;
    AqD63tax_rate: TBCDField;
    AqD63remark: TStringField;
    AqD63UNIT_NAME: TStringField;
    AqDcp60customer_ptr: TIntegerField;
    AqDcp60currency_ptr: TIntegerField;
    AqDcp60SALES_REP_PTR: TIntegerField;
    AqDcp60ship_method: TStringField;
    AqDcp60location: TStringField;
    AqDcp60ent_date: TDateTimeField;
    AqDcp60ent_user_ptr: TIntegerField;
    AqDcp60CONTACT_NAME: TStringField;
    AqDcp60CONT_PHONE: TStringField;
    AqDcp60TAX_cate: TStringField;
    AqDcp60pay_method: TStringField;
    AqDcp60invoice_ptr: TIntegerField;
    AqDcp60remark: TStringField;
    DataSource3: TDataSource;
    AQD493: TADODataSet;
    AQD493Company_Name: TStringField;
    AQD493Company_Name2: TStringField;
    AQD493Company_Name3: TStringField;
    AQD493ship_address: TStringField;
    AQD493Company_Icon: TBlobField;
    AqDcp60DSDesigner: TStringField;
    procedure AqDcp60CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AqDcp60CalcFields(DataSet: TDataSet);
begin
 case AqDcp60status.Value of
  1 : AqDcp60v_status.Value := '未提交';
  2 : AqDcp60v_status.Value := '待审核';
  3 : AqDcp60v_status.Value := '已审核';
  4 : AqDcp60v_status.Value := '已记帐';
  5 : AqDcp60v_status.Value := '已付款';
  6 : AqDcp60v_status.Value := '被退回';
 end;
end;

end.
