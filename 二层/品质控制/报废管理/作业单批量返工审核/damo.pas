unit damo;

interface

uses
  SysUtils, Classes, ADODB, DB,Variants;

type
  TDM = class(TDataModule)
    DataSource1: TDataSource;
    DataSource3: TDataSource;
    ads252: TADODataSet;
    DataSource4: TDataSource;
    ads239: TADODataSet;
    DataSource2: TDataSource;
    ads260: TADODataSet;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ads260rkey203: TIntegerField;
    ads260dept_ptr: TIntegerField;
    ads260dept_name: TStringField;
    ads260user_ptr: TIntegerField;
    ads260employee_name: TStringField;
    ads260auth_date: TDateTimeField;
    ads260PUTH_INFO: TStringField;
    ads260seq_no: TIntegerField;
    ADS203: TADODataSet;
    ADS203rkey203: TAutoIncField;
    ADS203return_code: TStringField;
    ADS203user_ptr_203: TIntegerField;
    ADS203employee_name: TStringField;
    ADS203ENT_DATE: TDateTimeField;
    ADS203submit: TDateTimeField;
    ADS203CUST_PART_PTR: TIntegerField;
    ADS203manu_part_number: TStringField;
    ADS203dept_ptr: TIntegerField;
    ADS203dept_name: TStringField;
    ADS203v_ttype: TStringField;
    ADS203vttyperemark: TWideStringField;
    ADS203status: TWordField;
    ADS203t_status: TStringField;
    ADS203WTYPE_step: TIntegerField;
    ADS203describe: TWideStringField;
    ADS203reason: TWideStringField;
    ADS203scheme: TWideStringField;
    ADS203panel_qty: TIntegerField;
    ADS203pcs_qty: TIntegerField;
    ads239rkey203: TIntegerField;
    ads239DEPT_PTR: TIntegerField;
    ads239DEF_ROUT_INST: TStringField;
    ads239STEP_NUMBER: TSmallintField;
    ads239tooling_rev: TStringField;
    ads239TOOL_REMARK: TStringField;
    ads239Old_Step_NO: TIntegerField;
    ads239dept_name: TStringField;
    ADS203auth_flag: TBooleanField;
    ADS203auth_date: TDateTimeField;
    ADS203seq_no: TIntegerField;
    ads260auth_flag: TBooleanField;
    ADS203user_ptr260: TIntegerField;
    ADS203puth_info: TStringField;
    qry1: TADOQuery;
    ads252DSDesigner: TStringField;
    ads252DSDesigner2: TStringField;
    ads252DSDesigner3: TIntegerField;
    ads252DSDesigner4: TStringField;
    ads252DSDesigner5: TIntegerField;
    ads252DSDesigner6: TIntegerField;
    ads252DSDesigner7: TStringField;
    ads252DSDesigner8: TStringField;
    ads252DSDesigner9: TIntegerField;
    ads252DSDesigner10: TSmallintField;
    ads252DSDesigner11: TSmallintField;
    ads252PCS: TFloatField;
    ads252pan: TIntegerField;
    ads252DSDesigner12: TDateTimeField;
    ads252DSDesigner13: TFloatField;
    ads252DSDesigner14: TDateTimeField;
    ads252DSDesigner15: TIntegerField;
    ads252DSDesigner16: TStringField;
    ads252DSDesigner17: TSmallintField;
    ads252DSDesigner18: TStringField;
    ads252PNL: TIntegerField;
    ads252DSDesigner19: TWordField;
    ads252DSDesigner20: TBooleanField;
    ads252DSDesigner21: TDateTimeField;
    ads252DSDesigner22: TStringField;
    ads252rkey: TAutoIncField;
    ADOQuery3: TADOQuery;
    ADOQuery4: TADOQuery;
    ADOQuery4rkey203: TIntegerField;
    ADOQuery4dept_ptr: TIntegerField;
    ADOQuery4user_ptr: TIntegerField;
    ADOQuery4auth_date: TDateTimeField;
    ADOQuery4PUTH_INFO: TStringField;
    ADOQuery4seq_no: TIntegerField;
    ADOQuery4auth_flag: TBooleanField;
    ADOQuery4Information: TIntegerField;
    ads260Information: TIntegerField;
    ADO239: TADOQuery;
    qry2: TADOQuery;
    del: TADOQuery;
    delPHONE: TStringField;
    delEMPLOYEE_NAME: TStringField;
    delRKEY: TAutoIncField;
    tmp: TADOQuery;
    tmp1: TADOQuery;
  
  private
    { Private declarations }
  public
    { Public declarations }
    qte_type:byte;
  end;

var
  DM: TDM;

implementation

uses auth_info;

{$R *.dfm}


end.
