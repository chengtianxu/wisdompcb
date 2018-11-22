unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs,Variants;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    wzdata300: TADOQuery;
    DataSource1: TDataSource;
    adowz300: TADOQuery;
    DataSource2: TDataSource;
    ADO301: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery1: TADOQuery;
    wzdata300rkey: TAutoIncField;
    wzdata300status: TWordField;
    wzdata300DEPT_NAME: TStringField;
    wzdata300DEPT_CODE: TStringField;
    wzdata300CODE: TStringField;
    wzdata300SUPPLIER_NAME: TStringField;
    wzdata300ABBR_NAME: TStringField;
    wzdata300WAREHOUSE_CODE: TStringField;
    wzdata300WAREHOUSE_NAME: TStringField;
    wzdata300warehouse_abbname: TStringField;
    wzdata300ent_data: TDateTimeField;
    wzdata300EMPL_CODE: TStringField;
    wzdata300EMPLOYEE_NAME: TStringField;
    wzdata300CURR_CODE: TStringField;
    wzdata300CURR_NAME: TStringField;
    wzdata300auth_code: TStringField;
    wzdata300PURCHASE_APPROV_DESC: TStringField;
    adowz300rkey: TAutoIncField;
    adowz300status: TWordField;
    adowz300supp_ptr: TIntegerField;
    adowz300dept_ptr: TIntegerField;
    adowz300empl_ptr: TIntegerField;
    adowz300ent_data: TDateTimeField;
    adowz300refer_date: TDateTimeField;
    adowz300warehouse_ptr: TIntegerField;
    adowz300auth_ptr: TIntegerField;
    adowz300currency_ptr: TIntegerField;
    adowz300CONTACT_NAME: TStringField;
    adowz300CONT_PHONE: TStringField;
    adowz300TAX_cate: TStringField;
    adowz300pay_method: TStringField;
    adowz300deli_address: TStringField;
    adowz300SHIPPING_METHOD: TStringField;
    adowz300remark: TStringField;
    ADO301RKEY: TAutoIncField;
    ADO301EPIBOLY_PTR: TIntegerField;
    ADO301CUSTPART_PTR: TIntegerField;
    ADO301QUANTITY: TIntegerField;
    ADO301RECEVIED_QTY: TIntegerField;
    ADO301UNIT_NAME: TStringField;
    ADO301STANDARD: TStringField;
    ADO301AREA_SQM: TBCDField;
    ADO301AREA_SQF: TBCDField;
    ADO301LAYER: TWordField;
    ADO301THINK: TBCDField;
    ADO301MIN_aperture: TBCDField;
    ADO301REQ_DATE: TDateTimeField;
    ADO301REMARTK: TStringField;
    wzdata300v_status: TStringField;
    wzdata300refer_date: TDateTimeField;
    wzdata300AUTH_ptr: TIntegerField;
    ADOwz302: TADOQuery;
    ADOwz302ranking: TWordField;
    ADOwz302auth_flag: TStringField;
    wzdata300epiboly_number: TStringField;
    adowz300epiboly_number: TStringField;
    Aqwz302: TADOQuery;
    Aqwz302user_id: TStringField;
    Aqwz302user_full_name: TStringField;
    Aqwz302auth_date: TDateTimeField;
    Aqwz302ranking: TWordField;
    Aqwz302remark: TStringField;
    Aqwz302auth_flag: TStringField;
    DataSource4: TDataSource;
    wzdata300auth_date: TDateTimeField;
    wzdata300remark: TStringField;
    ADOwz302auth_date: TDateTimeField;
    ADOwz302remark: TStringField;
    wzdata300auth_flag: TStringField;
    wzdata300ranking: TWordField;
    adowz300exch_rate: TBCDField;
    ADO301RETURN_QTY: TIntegerField;
    ADO301MANU_PART_NUMBER: TStringField;
    ADO301MANU_PART_DESC: TStringField;
    wzdata300type: TWordField;
    adowz300type: TWordField;
    ADO301PRICE: TBCDField;
    ADO301AMOUNT: TBCDField;
    procedure wzdata300CalcFields(DataSet: TDataSet);
    procedure ADO301CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.wzdata300CalcFields(DataSet: TDataSet);
begin
  if self.wzdata300auth_date.AsVariant=null then
    wzdata300v_status.Value := 'Œ¥…Û≈˙'
  else
    wzdata300v_status.Value := '“—…Û≈˙';
end;

procedure TDM.ADO301CalcFields(DataSet: TDataSet);
begin
  ADO301.FieldByName('AMOUNT').AsCurrency:=ADO301.FieldByName('QUANTITY').AsCurrency*ADO301.FieldByName('PRICE').AsCurrency;
end;

end.
