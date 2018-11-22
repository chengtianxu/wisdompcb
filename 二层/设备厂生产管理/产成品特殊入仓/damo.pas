unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, Menus;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ416: TADOQuery;
    DataSource1: TDataSource;
    AQ416number: TStringField;
    AQ416SALES_ORDER: TStringField;
    AQ416EMPLOYEE_NAME: TStringField;
    AQ416sys_date: TDateTimeField;
    AQ416type: TWordField;
    AQ416rkey: TAutoIncField;
    AQ416C_type: TStringField;
    ADOQuery1: TADOQuery;
    ADOT16: TADOTable;
    ADO416: TADOQuery;
    aq50: TADOQuery;
    AQ416so_ptr: TIntegerField;
    AQ416quantity: TBCDField;
    AQ416WAREHOUSE_CODE: TStringField;
    AQ416WAREHOUSE_NAME: TStringField;
    ADO416rkey: TAutoIncField;
    ADO416number: TStringField;
    ADO416type: TWordField;
    ADO416warehouse_ptr: TIntegerField;
    ADO416empl_ptr: TIntegerField;
    ADO416sys_date: TDateTimeField;
    ADO416quantity: TBCDField;
    ADO416reference: TStringField;
    ADO416so_ptr: TIntegerField;
    aq50rkey: TIntegerField;
    aq50PROD_CODE: TStringField;
    aq50PRODUCT_NAME: TStringField;
    aq50unit_name: TStringField;
    ADOSupdate: TADOStoredProc;
    ADO416dept_ptr: TIntegerField;
    aq50PRODUCT_DESC: TStringField;
    AQ416dept_code: TStringField;
    AQ416dept_name: TStringField;
    qrywzcp0001: TADOQuery;
    qrydata0008: TADOQuery;
    qrydata0053: TADOQuery;
    qry98: TADOQuery;
    ds98: TDataSource;
    qry98RKEY: TAutoIncField;
    qry98RMA_NUMBER: TStringField;
    qry98RMA_DATE: TDateTimeField;
    qry98Putaway_date: TDateTimeField;
    qry98sys_date: TDateTimeField;
    qry98CUST_CODE: TStringField;
    qry98CUSTOMER_NAME: TStringField;
    qry98RMA_STATUS: TSmallintField;
    qry98TStatus: TStringField;
    qry98TNOTE_PAD_PTR: TStringField;
    qry98TGLPTR_STATUS: TStringField;
    qry98sales_order: TStringField;
    qry98DSDesigner: TStringField;
    qry98EMPLOYEE_NAME: TStringField;
    qry98ANALYSIS_CODE_1: TWideStringField;
    qry98QTY_AUTH: TBCDField;
    qry98QTY_RECD: TBCDField;
    qry98QTY_CRED: TBCDField;
    qry98srce_ptr: TIntegerField;
    qry98SO_SHIP_PTR: TIntegerField;
    qry98dept_code: TStringField;
    qry98dept_name: TStringField;
    qry98rkey34: TAutoIncField;
    qry98DSDesigner2: TDateTimeField;
    qry98rkey08: TAutoIncField;
    qry98prod_code: TStringField;
    qry98product_name: TStringField;
    qry98product_desc: TStringField;
    qry98unit_name: TStringField;
    qry98price: TBCDField;
    qry98status70: TWordField;
    qry98rkey70: TAutoIncField;
    qry98sales_order70: TStringField;
    ADO416rma_ptr: TIntegerField;
    AQ416rma_number: TStringField;
    AQ416customer_name: TStringField;
    AQ416cust_code: TStringField;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    AQ416rkey98: TIntegerField;
    AQ416SO_SHIP_PTR: TIntegerField;
    AQ416rkey70: TIntegerField;
    qry98_1: TADOQuery;
    AutoIncField1: TAutoIncField;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField2: TStringField;
    StringField3: TStringField;
    SmallintField1: TSmallintField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    WideStringField1: TWideStringField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField10: TStringField;
    StringField11: TStringField;
    AutoIncField2: TAutoIncField;
    DateTimeField4: TDateTimeField;
    AutoIncField3: TAutoIncField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    BCDField4: TBCDField;
    WordField1: TWordField;
    AutoIncField4: TAutoIncField;
    StringField16: TStringField;
    procedure AQ416CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.AQ416CalcFields(DataSet: TDataSet);
begin
 case self.AQ416type.Value of
  1:self.AQ416C_type.Value:='直接入仓';
  2:self.AQ416C_type.Value:='生产入仓';
  4:self.AQ416C_type.Value:='退货入仓';
 end;
end;

end.
