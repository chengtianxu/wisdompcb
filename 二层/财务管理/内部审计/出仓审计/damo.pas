unit damo;

interface
//Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=True;User ID=sa;Initial Catalog=sj_v20_sample;Data Source=kmerp_wz;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=W119;Use Encryption for Data=False;Tag with column collation when possible=False
uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQ: TADOQuery;
    ADO457: TADOQuery;
    ADO457RKEY: TAutoIncField;
    ADO457GON_NUMBER: TStringField;
    ADO457warehouse_ptr: TIntegerField;
    ADO457dept_ptr: TIntegerField;
    ADO457TTYPE: TSmallintField;
    ADO457STATUS: TWordField;
    ADO457CREATE_DATE: TDateTimeField;
    ADO457CREATE_BY: TIntegerField;
    ADO457RECD_BY: TIntegerField;
    ADO457AUDITED_BY: TIntegerField;
    ADO457AUDITED_DATE: TDateTimeField;
    ADO457REF_NUMBER: TStringField;
    ADO457GL_DEALT_BY: TIntegerField;
    ADO457GL_DEALT_DATE: TDateTimeField;
    ADO457Cut_NO: TStringField;
    ADO457gl_ptr: TIntegerField;
    ADOC457: TADOQuery;
    ADOC207: TADOQuery;
    ADOC208: TADOQuery;
    ADOC457EMPLOYEE_NAME: TStringField;
    ADOC457DEPT_NAME: TStringField;
    ADOC457WAREHOUSE_CODE: TStringField;
    ADOC457ABBR_NAME: TStringField;
    ADOC457GON_NUMBER: TStringField;
    ADOC457AUDITED_DATE: TDateTimeField;
    ADOC457AUDITED_BY: TIntegerField;
    ADOC457RECD_BY: TIntegerField;
    ADOC457RKEY: TAutoIncField;
    ADOC457CREATE_DATE: TDateTimeField;
    ADOC457v_emp: TStringField;
    ADOC457STATUS: TWordField;
    ADOC457ttype: TSmallintField;
    ADOC457v_type: TStringField;
    ADOC457v_status: TStringField;
    ADOC207INV_PART_NUMBER: TStringField;
    ADOC207INV_PART_DESCRIPTION: TStringField;
    ADOC207INV_NAME: TStringField;
    ADOC207rohs: TStringField;
    ADOC207LOCATION_PTR_FROM: TIntegerField;
    ADOC207PRICE: TBCDField;
    ADOC207TAX_2: TBCDField;
    ADOC207CURR_NAME: TStringField;
    ADOC207UNIT_NAME: TStringField;
    ADOC207QUANTITY: TBCDField;
    ADOC457ref_number: TStringField;
    ADOC208QUANTITY: TBCDField;
    ADOC208goods_guige: TStringField;
    ADOC208goods_name: TStringField;
    ADOC208goods_type: TStringField;
    ADOC208UNIT_NAME: TStringField;
    ADOC208LOCATION: TStringField;
    ADOC208rohs: TStringField;
    ADOC208state_tax: TBCDField;
    ADOC208unit_price: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
