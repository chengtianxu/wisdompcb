unit DMUnit1;

//


//Provider=SQLOLEDB.1;Password=WZtopcberp_1077;Persist Security Info=True;User ID=wzsp;Initial Catalog=WISDOMPCB;Data Source=172.16.1.57;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=W119;Use Encryption for Data=False;Tag with column collation when possible=False

//Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=True;User ID=sa;Initial Catalog=sj_v20_sample;Data Source=172.16.0.8
//Provider=SQLOLEDB.1;Password=123789;Persist Security Info=True;User ID=sa;Initial Catalog=WISDOMPCB;Data Source=W206

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    qwzpr85_1: TADOStoredProc;
    DataSource1: TDataSource;
    qwzpr85_2: TADOStoredProc;
    qwzpr85_3: TADOStoredProc;
    qwzpr85_4: TADOStoredProc;
    qwzpr85_5: TADOStoredProc;
    qwzpr85_6: TADOStoredProc;
    qwzpr85_7: TADOStoredProc;
    qwzpr85_8: TADOStoredProc;
    qwzpr85_8ROW_NAME: TStringField;
    qwzpr85_8ADDER_NAME: TStringField;
    qwzpr85_8DEFT_SELECTED: TBooleanField;
    DataSource85_8: TDataSource;
    qwzpr85_11: TADOStoredProc;
    qwzpr85_8MyAmount: TFloatField;
    qwzpr85_8D0348_PTR: TIntegerField;
    qwzpr85_8seq_no: TIntegerField;
    qwzpr85_8D0346_PTR: TIntegerField;
    qwzpr85_12: TADOStoredProc;
    ADOQuery3: TADOQuery;
    ADODate: TADOQuery;
    ADOQuery7: TADOQuery;
    ADODatevdt: TDateTimeField;
    ADOQuery3tnumber: TStringField;
    ADOQuery7RKEY: TIntegerField;
    ADOQuery7CONTROL_NO_LENGTH: TSmallintField;
    ADOQuery7SEED_MEAN: TStringField;
    ADOQuery7BIG5_SEED_MEAN: TStringField;
    ADOQuery7SEED_VALUE: TStringField;
    ADOQuery7SEED_FLAG: TWordField;
    ADOQuery7table_name: TStringField;
    qwzpr85_21: TADOStoredProc;
    qwzpr85_22: TADOStoredProc;
    qwzpr85_22RKEY: TIntegerField;
    qwzpr85_22ROW_NAME: TStringField;
    qwzpr85_22ROW_VALUE: TFloatField;
    qwzpr85_12RKEY: TIntegerField;
    qwzpr85_12TTYPE: TSmallintField;
    qwzpr85_12ADDER_NAME: TStringField;
    qwzpr85_12SELECTED: TSmallintField;
    qwzpr85_12PCENTS: TWordField;
    qwzpr85_12DFT_SELECTED: TWordField;
    qwzpr85_12SPEC_RKEY: TStringField;
    qwzpr85_12selectit: TBooleanField;
    qwzpr85_23: TADOStoredProc;
    qwzpr85_23RKEY: TIntegerField;
    qwzpr85_23QTE_PTR: TIntegerField;
    qwzpr85_23SOURCE_PTR: TIntegerField;
    qwzpr85_23AMOUNT: TFloatField;
    qwzpr85_23ADDL_CAT_PTR: TIntegerField;
    qwzpr85_23FREE_AMOUNT: TFloatField;
    qwzpr85_23TAX_FLAG: TStringField;
    qwzpr85_23TypeMark: TIntegerField;
    qwzpr85_24: TADOStoredProc;
    qwzpr85_24RKEY: TAutoIncField;
    qwzpr85_24DATA_TYPE: TWordField;
    qwzpr85_24PARAMETER_NAME: TStringField;
    qwzpr85_24PARAMETER_DESC: TStringField;
    qwzpr85_25: TADOStoredProc;
    qwzpr85_25RKEY: TAutoIncField;
    qwzpr85_25ENG_TABLE_NAME: TStringField;
    qwzpr85_25DATA_TYPE: TIntegerField;
    qwzpr85_autocal85: TADOStoredProc;
    qwzpr85_autocal85tvalue: TStringField;
    qwzpr85_12FORMULA: TMemoField;
    qwzpr85_12MIN_VALUE: TMemoField;
    qwzpr85_12MAX_VALUE: TMemoField;
    qwzpr85_1RKEY: TAutoIncField;
    qwzpr85_1TTYPE: TSmallintField;
    qwzpr85_1TNUMBER: TStringField;
    qwzpr85_1CUST_NAME: TStringField;
    qwzpr85_1CUST_ADD1: TStringField;
    qwzpr85_1CUST_STATE: TStringField;
    qwzpr85_1CUST_ZIP: TStringField;
    qwzpr85_1CUST_PHONE: TStringField;
    qwzpr85_1CUST_FAX: TStringField;
    qwzpr85_1CUST_CONTACT: TStringField;
    qwzpr85_1CUST_CONTACT_PHONE: TStringField;
    qwzpr85_1CUST_RFQ: TStringField;
    qwzpr85_1CUST_PTR: TIntegerField;
    qwzpr85_1CUST_QTE_FACTOR: TFloatField;
    qwzpr85_1CURR_PTR: TIntegerField;
    qwzpr85_1SREP_PTR: TIntegerField;
    qwzpr85_1QBY_EMPL_PTR: TIntegerField;
    qwzpr85_1PROMISE_SAMP_DATE: TDateTimeField;
    qwzpr85_1PROMISE_DATE: TDateTimeField;
    qwzpr85_1CUST_PART_PTR: TIntegerField;
    qwzpr85_1CUST_PART_NO: TStringField;
    qwzpr85_1CUST_PART_DESC: TStringField;
    qwzpr85_1REF_PART_NO: TStringField;
    qwzpr85_1MATL_COST: TFloatField;
    qwzpr85_1MARKUP: TFloatField;
    qwzpr85_1CURR_RATE: TFloatField;
    qwzpr85_1ENGR_ROUTE_PTR: TIntegerField;
    qwzpr85_1PROD_ROUTE_PTR: TIntegerField;
    qwzpr85_1PROD_CODE_PTR: TIntegerField;
    qwzpr85_1SHIPPING_CHARGE: TFloatField;
    qwzpr85_1QUOTE_TYPE: TSmallintField;
    qwzpr85_1SALES_ORDERS_ENTERED: TSmallintField;
    qwzpr85_1EMAIL: TStringField;
    qwzpr85_1APPRV_BY_PTR: TIntegerField;
    qwzpr85_1AUDITED_STATUS: TWordField;
    qwzpr85_1NOTE_INFO: TStringField;
    qwzpr85_1UPANEL: TIntegerField;
    qwzpr85_1USHEET: TBCDField;
    qwzpr85_1QTE_USHEET: TBCDField;
    qwzpr85_1QTE_UNIT_PTR: TIntegerField;
    qwzpr85_1QTE_UNITS: TFloatField;
    qwzpr85_1PAYMENT: TStringField;
    qwzpr85_1SALES_DISCOUNT: TBCDField;
    qwzpr85_1appd_by: TIntegerField;
    qwzpr85_1UNIT_LEN: TFloatField;
    qwzpr85_1UNIT_WTH: TFloatField;
    qwzpr85_1TUSAGE: TBCDField;
    qwzpr85_1TUNITS: TIntegerField;
    qwzpr85_1BASE_PRICE: TFloatField;
    qwzpr85_1QTE_CONTROL5: TStringField;
    qwzpr85_1ttype2: TWordField;
    qwzpr85_1ovhd_cost: TFloatField;
    qwzpr85_1base_pcscost: TFloatField;
    qwzpr85_1total_cost: TFloatField;
    qwzpr85_1comm_cost: TFloatField;
    qwzpr85_1vatax: TBCDField;
    qwzpr85_1quote_price: TFloatField;
    qwzpr85_1quote_taxprice: TFloatField;
    qwzpr85_26: TADOStoredProc;
    qwzpr85_26rkey: TIntegerField;
    qwzpr85_26PARAMETER_PTR: TIntegerField;
    qwzpr85_26SEQUENCE_NO: TSmallintField;
    qwzpr85_26TVALUE: TStringField;
    qwzpr85_11RKEY: TIntegerField;
    qwzpr85_11PARAMETER_NAME: TStringField;
    qwzpr85_11PARAMETER_DESC: TStringField;
    qwzpr85_11DATA_TYPE: TWordField;
    qwzpr85_1rej_info: TMemoField;
    qwzpr85_1ENTER_DATE: TDateTimeField;
    qwzpr85_1QTE_DATE: TDateTimeField;
    qwzpr85_1EXPIRATION_DATE: TDateTimeField;
    qwzpr85_1APPRV_DATE: TDateTimeField;
    qwzpr85_21RKEY: TAutoIncField;
    qwzpr85_21TTYPE: TSmallintField;
    qwzpr85_21ADDER_NAME: TStringField;
    qwzpr85_21FORMULA: TMemoField;
    qwzpr85_21SELECTED: TSmallintField;
    qwzpr85_21PCENTS: TWordField;
    qwzpr85_21MIN_VALUE: TMemoField;
    qwzpr85_21MAX_VALUE: TMemoField;
    qwzpr85_21DFT_SELECTED: TWordField;
    qwzpr85_21SPEC_RKEY: TStringField;
    qwzpr85_21selectit: TBooleanField;
    qwzpr85_29: TADOStoredProc;
    qwzpr85_29RKEY: TIntegerField;
    qwzpr85_29TTYPE: TSmallintField;
    qwzpr85_29ADDER_NAME: TStringField;
    qwzpr85_29FORMULA: TMemoField;
    qwzpr85_29SELECTED: TSmallintField;
    qwzpr85_29PCENTS: TWordField;
    qwzpr85_29MIN_VALUE: TMemoField;
    qwzpr85_29MAX_VALUE: TMemoField;
    qwzpr85_29DFT_SELECTED: TWordField;
    qwzpr85_29SPEC_RKEY: TStringField;
    qwzpr85_29selectit: TBooleanField;
    TDATA0493: TADOQuery;
    DataSource0493: TDataSource;
    TDATA0493Company_Name: TStringField;
    TDATA0493Company_Name2: TStringField;
    TDATA0493Company_Name3: TStringField;
    TDATA0493ship_address: TStringField;
    TDATA0493Company_Icon: TBlobField;
    TDATA0493SITE_INFO_ADD_1: TStringField;
    TDATA0493SITE_INFO_ADD_2: TStringField;
    TDATA0493SITE_INFO_ADD_3: TStringField;
    TDATA0493SITE_INFO_PHONE: TStringField;
    qwzpr85_24SPEC_RKEY: TStringField;
    qwzpr85_1CRP_EST_QUANTITY: TBCDField;
    qwzpr85_1QuoteType: TIntegerField;
    DataSource23: TDataSource;
    qwzpr85_2RKEY: TIntegerField;
    qwzpr85_2CURR_CODE: TStringField;
    qwzpr85_2CURR_NAME: TStringField;
    qwzpr85_3RKEY: TIntegerField;
    qwzpr85_3EMPLOYEE_NAME: TStringField;
    qwzpr85_4RKEY: TIntegerField;
    qwzpr85_4PROD_CODE: TStringField;
    qwzpr85_4PRODUCT_NAME: TStringField;
    qwzpr85_5RKEY: TIntegerField;
    qwzpr85_5REP_CODE: TStringField;
    qwzpr85_5SALES_REP_NAME: TStringField;
    qwzpr85_5ABBR_NAME: TStringField;
    qwzpr85_6RKEY: TIntegerField;
    qwzpr85_6CUST_CODE: TStringField;
    qwzpr85_6CUSTOMER_NAME: TStringField;
    qwzpr85_6ABBR_NAME: TStringField;
    qwzpr85_7RKEY: TIntegerField;
    qwzpr85_7TTYPE: TSmallintField;
    qwzpr85_1MyCURR_CODE: TStringField;
    qwzpr85_1MyCURR_NAME: TStringField;
    qwzpr85_1MyQteEMPLOYEE_NAME: TStringField;
    qwzpr85_1MyPROD_CODE: TStringField;
    qwzpr85_1MyPRODUCT_NAME: TStringField;
    qwzpr85_1MySALES_REP_NAME: TStringField;
    qwzpr85_1MyCUST_CODE: TStringField;
    qwzpr85_1MyCUSTOMER_NAME: TStringField;
    ADOQPrint1: TADOQuery;
    DSADOQPrint1: TDataSource;
    ADOQPrint2: TADOQuery;
    DSADOQPrint2: TDataSource;
    ado04: TADOQuery;
    ado04RKEY: TAutoIncField;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    ado04table_name: TStringField;
    ado04CONTROL_NO_LENGTH: TSmallintField;
    ado04SEED_MEAN: TStringField;
    ado04BIG5_SEED_MEAN: TStringField;
    qwzpr85_1MyType_2: TStringField;
    DS85: TADODataSet;
    ads274: TADOQuery;
    Qery: TADOQuery;
    DataSource2: TDataSource;
    qwzpr85_1MyAUDITED_STATUS: TStringField;
    DS85RKEY: TAutoIncField;
    DS85TTYPE: TSmallintField;
    DS85TNUMBER: TStringField;
    DS85CUST_NAME: TStringField;
    DS85CUST_ADD1: TStringField;
    DS85cust_add2: TStringField;
    DS85CUST_STATE: TStringField;
    DS85CUST_ZIP: TStringField;
    DS85CUST_PHONE: TStringField;
    DS85CUST_FAX: TStringField;
    DS85CUST_CONTACT: TStringField;
    DS85CUST_CONTACT_PHONE: TStringField;
    DS85CUST_RFQ: TStringField;
    DS85CUST_PTR: TIntegerField;
    DS85CUST_QTE_FACTOR: TFloatField;
    DS85CURR_PTR: TIntegerField;
    DS85SREP_PTR: TIntegerField;
    DS85QBY_EMPL_PTR: TIntegerField;
    DS85PROMISE_SAMP_DATE: TDateTimeField;
    DS85ENTER_DATE: TDateTimeField;
    DS85QTE_DATE: TDateTimeField;
    DS85PROMISE_DATE: TDateTimeField;
    DS85CUST_PART_PTR: TIntegerField;
    DS85CUST_PART_NO: TStringField;
    DS85CUST_PART_DESC: TStringField;
    DS85REF_PART_NO: TStringField;
    DS85MATL_COST: TFloatField;
    DS85MARKUP: TFloatField;
    DS85CURR_RATE: TFloatField;
    DS85ENGR_ROUTE_PTR: TIntegerField;
    DS85PROD_ROUTE_PTR: TIntegerField;
    DS85PROD_CODE_PTR: TIntegerField;
    DS85SHIPPING_CHARGE: TBCDField;
    DS85QUOTE_TYPE: TSmallintField;
    DS85SALES_ORDERS_ENTERED: TSmallintField;
    DS85EXPIRATION_DATE: TDateTimeField;
    DS85CRP_EST_QUANTITY: TBCDField;
    DS85EMAIL: TStringField;
    DS85APPRV_BY_PTR: TIntegerField;
    DS85APPRV_DATE: TDateTimeField;
    DS85AUDITED_STATUS: TWordField;
    DS85NOTE_INFO: TStringField;
    DS85rej_info: TMemoField;
    DS85UPANEL: TIntegerField;
    DS85USHEET: TBCDField;
    DS85QTE_USHEET: TBCDField;
    DS85QTE_UNIT_PTR: TIntegerField;
    DS85QTE_UNITS: TFloatField;
    DS85PAYMENT: TStringField;
    DS85SALES_DISCOUNT: TBCDField;
    DS85appd_by: TIntegerField;
    DS85UNIT_LEN: TFloatField;
    DS85UNIT_WTH: TFloatField;
    DS85TUSAGE: TBCDField;
    DS85TUNITS: TIntegerField;
    DS85BASE_PRICE: TFloatField;
    DS85QTE_CONTROL5: TStringField;
    DS85ttype2: TWordField;
    DS85ovhd_cost: TFloatField;
    DS85base_pcscost: TFloatField;
    DS85total_cost: TFloatField;
    DS85comm_cost: TFloatField;
    DS85vatax: TBCDField;
    DS85quote_price: TFloatField;
    DS85quote_taxprice: TFloatField;
    DS85QuoteType: TIntegerField;
    DS85auth_flag: TStringField;
    DS85EMPLOYEE_NAME: TStringField;
    DS85BackEMP: TStringField;
    DS85MyCURR_CODE: TStringField;
    DS85MyCURR_NAME: TStringField;
    DS85MyType_2: TStringField;
    DS85MyAUDITED_STATUS: TStringField;
    DS85auth_date: TDateTimeField;
    ads274rkey: TAutoIncField;
    ads274qte_ptr: TIntegerField;
    ads274user_ptr: TIntegerField;
    ads274auth_date: TDateTimeField;
    ads274auth_flag: TStringField;
    ads274ranking: TWordField;
    DS85ranking: TWordField;
    qwzpr85_23MyADDER_NAME: TStringField;
    qwzpr85_11UNIT_PTR: TIntegerField;
    Qwzpr85_31: TADOStoredProc;
    Qwzpr85_31RKEY: TIntegerField;
    Qwzpr85_31UNIT_CODE: TStringField;
    Qwzpr85_31UNIT_NAME: TStringField;
    Qwzpr85_31myunit: TStringField;
    qwzpr85_33: TADOStoredProc;
    qwzpr85_33RKEY: TAutoIncField;
    qwzpr85_33QUOTE_PTR: TIntegerField;
    qwzpr85_33STD_INVENT_PTR: TIntegerField;
    qwzpr85_33QTY: TFloatField;
    qwzpr85_33price: TFloatField;
    qwzpr85_33D0028_PTR: TIntegerField;
    qwzpr85_33D0028_PRICE: TFloatField;
    qwzpr85_33MyINV_PART_NUMBER: TStringField;
    qwzpr85_33MyINV_PART_DESCRIPTION: TStringField;
    qwzpr85_34: TADOStoredProc;
    qwzpr85_34INV_PART_NUMBER: TStringField;
    qwzpr85_34INV_PART_DESCRIPTION: TStringField;
    qwzpr85_1BasePricePtr: TIntegerField;
    qwzpr85_7MANU_PART_NUMBER: TStringField;
    qwzpr85_7MANU_PART_DESC: TStringField;
    procedure qwzpr85_8BeforePost(DataSet: TDataSet);
    procedure qwzpr85_1CalcFields(DataSet: TDataSet);
    procedure DS85CalcFields(DataSet: TDataSet);
    procedure qwzpr85_23CalcFields(DataSet: TDataSet);
    procedure qwzpr85_33CalcFields(DataSet: TDataSet);

  private
    { Private declarations }
    vPEditDATA0351:boolean;
    function get_PEditDATA0351: BOOLEAN;
    procedure set_PEditDATA0351(const Value: BOOLEAN);

  public
    { Public declarations }

    property PEditDATA0351:BOOLEAN READ get_PEditDATA0351 WRITE set_PEditDATA0351;
  end;

var
  DM: TDM;

implementation


{$R *.dfm}



function TDM.get_PEditDATA0351: BOOLEAN;
begin
  result := vPEditDATA0351 ;
end;

procedure TDM.set_PEditDATA0351(const Value: BOOLEAN);
begin
  vPEditDATA0351 := value ;
end;

procedure TDM.qwzpr85_8BeforePost(DataSet: TDataSet);
begin
    {if vPEditDATA0351 then //在刚打开时不处理此事件,只是在更改它的时候再处理
        begin
            if self.qwzpr85_8DEFT_SELECTED.Value  then
                 showmessage('1')
            else
                 showmessage('0');
        end ;{}
end;

procedure TDM.qwzpr85_1CalcFields(DataSet: TDataSet);
begin
    if qwzpr85_1.Active then
         begin
             if self.qwzpr85_1TTYPE.Value  = 2 then
                  self.qwzpr85_1MyType_2.Value  := '样板报价'
             else if self.qwzpr85_1TTYPE.Value = 3 then
                  self.qwzpr85_1MyType_2.Value := '批量板报价';

             if self.qwzpr85_1AUDITED_STATUS.Value  = 0 then
                  self.qwzpr85_1myAUDITED_STATUS.Value  := '未提交'
             else if self.qwzpr85_1AUDITED_STATUS.Value  = 1 then
                  self.qwzpr85_1myAUDITED_STATUS.Value  := '待审批'
             else if self.qwzpr85_1AUDITED_STATUS.Value  = 2 then
                  self.qwzpr85_1myAUDITED_STATUS.Value  := '已过期'
             else if self.qwzpr85_1AUDITED_STATUS.Value  = 3 then
                  self.qwzpr85_1myAUDITED_STATUS.Value  := '已审批'
             else if self.qwzpr85_1AUDITED_STATUS.Value  = 4 then
                  self.qwzpr85_1myAUDITED_STATUS.Value  := '被退加';
                  
         end ;
end;

procedure TDM.DS85CalcFields(DataSet: TDataSet);
begin
    if DS85.Active then
         begin
             if self.DS85TTYPE.Value  = 2 then
                  self.DS85MyType_2.Value  := '样板报价'
             else if self.DS85TTYPE.Value = 3 then
                  self.DS85MyType_2.Value := '批量板报价';

             if self.DS85AUDITED_STATUS.Value  = 0 then
                  self.DS85myAUDITED_STATUS.Value  := '未提交'
             else if self.DS85AUDITED_STATUS.Value  = 1 then
                  self.DS85myAUDITED_STATUS.Value  := '待审批'
             else if self.DS85AUDITED_STATUS.Value  = 2 then
                  self.DS85myAUDITED_STATUS.Value  := '已过期'
             else if self.DS85AUDITED_STATUS.Value  = 3 then
                  self.DS85myAUDITED_STATUS.Value  := '已审批'
             else if self.DS85AUDITED_STATUS.Value  = 4 then
                  self.DS85myAUDITED_STATUS.Value  := '被退加';
                  
         end ;
end;

procedure TDM.qwzpr85_23CalcFields(DataSet: TDataSet);
begin
   if qwzpr85_23.Active then
       begin
            if not (qwzpr85_29.Active) then qwzpr85_29.Open ;
            qwzpr85_29.Locate('rkey',qwzpr85_23SOURCE_PTR.Value,[]);
            qwzpr85_23MyADDER_NAME.Value := qwzpr85_29ADDER_NAME.Value ;
       end ;
end;

procedure TDM.qwzpr85_33CalcFields(DataSet: TDataSet);
begin
    if qwzpr85_33.Active then
        if not qwzpr85_33.IsEmpty then
            begin
                if qwzpr85_34.Active then qwzpr85_34.Close ;
                qwzpr85_34.Parameters.ParamValues['@rkey0017'] := self.qwzpr85_33STD_INVENT_PTR.Value ;
                qwzpr85_34.Prepared ;
                qwzpr85_34.Open ;
                if not(qwzpr85_34.IsEmpty) then
                    begin
                        self.qwzpr85_33MyINV_PART_NUMBER.Value := self.qwzpr85_34INV_PART_NUMBER.Value ;
                        self.qwzpr85_33MyINV_PART_DESCRIPTION.Value := self.qwzpr85_34INV_PART_DESCRIPTION.Value ;
                    end ;
                qwzpr85_34.Close;
            end ; {}
end;

end.
