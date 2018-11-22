unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs,windows;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADS60: TADODataSet;
    ADOQuery1: TADOQuery;
    ADS63: TADODataSet;
    DataSource2: TDataSource;
    ADS60rkey: TAutoIncField;
    ADS60sales_order: TStringField;
    ADS60status: TWordField;
    ADS60remark: TStringField;
    ADS60EMPLOYEE_NAME: TStringField;
    ADS60DSDesigner: TStringField;
    ADS60ship_method: TStringField;
    ADS60location: TStringField;
    ADS60CONTACT_NAME: TStringField;
    ADS60CONT_PHONE: TStringField;
    ADS60DSDesigner2: TStringField;
    ADS63PROD_CODE: TStringField;
    ADS63PRODUCT_NAME: TStringField;
    ADS63quantity: TBCDField;
    ADS63remark: TStringField;
    ADS63LOCATION: TStringField;
    ADS63CODE: TStringField;
    ADSSB60: TADODataSet;
    ADSSB60rkey: TAutoIncField;
    ADSSB60sales_order: TStringField;
    ADSSB60sales_date: TDateTimeField;
    ADSSB60customer_ptr: TIntegerField;
    ADSSB60type: TWordField;
    ADSSB60status: TWordField;
    ADSSB60ship_method: TStringField;
    ADSSB60location: TStringField;
    ADSSB60SALES_REP_PTR: TIntegerField;
    ADSSB60ent_date: TDateTimeField;
    ADSSB60ent_user_ptr: TIntegerField;
    ADSSB60currency_ptr: TIntegerField;
    ADSSB60exch_rate: TBCDField;
    ADSSB60total_amount: TBCDField;
    ADSSB60CONTACT_NAME: TStringField;
    ADSSB60CONT_PHONE: TStringField;
    ADSSB60TAX_cate: TStringField;
    ADSSB60pay_method: TStringField;
    ADSSB60invoice_ptr: TIntegerField;
    ADSSB60remark: TStringField;
    ADO04: TADOQuery;
    ADO04SEED_VALUE: TStringField;
    ADO04SEED_FLAG: TWordField;
    ADSSB63: TADODataSet;
    ADSSB63so_ptr: TIntegerField;
    ADSSB63prod_ptr: TIntegerField;
    ADSSB63location_ptr: TIntegerField;
    ADSSB63quantity: TBCDField;
    ADSSB63remark: TStringField;
    ADS63qty_onhand: TBCDField;
    ADS60sales_date: TDateTimeField;
    ADS60ent_date: TDateTimeField;
    ADS60ent_user_ptr: TIntegerField;
    ADS60v_status: TWordField;
    ADSSB63sales_date: TDateTimeField;
  private
    { Private declarations }
  public
     { Public declarations }
     function ExistInventory(HD:THandle):Boolean;
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

function TDM.ExistInventory(HD:THandle):Boolean;
begin                          //用于检查是否存在未结的成品盘点记录。彭华于20121101
  Result:=False;
  with ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Text:='select rkey from data0214 where STATUS=0';
    Open;
    if not IsEmpty then
    begin
      MessageBox(HD,'现存在未结的成品盘点记录，请先处理！','错误',MB_ok+MB_iconStop);
      Result:=True;
    end;
    Close;
  end;
end;

end.
