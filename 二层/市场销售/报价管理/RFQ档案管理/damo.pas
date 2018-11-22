unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider;

type
  Tdm = class(TDataModule)
    ADOConn: TADOConnection;
    dsRFQ: TDataSource;
    ADSRFQ: TADODataSet;
    ADSRFQRFQNo: TStringField;
    ADSRFQCust_Id: TStringField;
    ADSRFQCust_Name: TStringField;
    ADSRFQFileName: TStringField;
    ADSRFQPOType: TStringField;
    ADSRFQCreateName: TStringField;
    ADSRFQCreateDate: TDateTimeField;
    ADSRFQLastModifyName: TStringField;
    ADSRFQLastModifyDate: TDateTimeField;
    ADSRFQRKEY: TAutoIncField;
    ADSRFQAuditName: TStringField;
    ADSRFQAuditDate: TDateTimeField;
    ADQGetDate: TADOQuery;
    ADSRFQStatus: TWordField;
    ADSRFQTStatus: TStringField;
    AQSetParam: TADOQuery;
    dsSetParam: TDataSource;
    AQSetParamRKEY: TAutoIncField;
    AQSetParamGroup_Type: TWordField;
    AQSetParamGroup_Name: TStringField;
    AQSetParamParam_ptr: TIntegerField;
    AQSetParamSEQ_NO: TSmallintField;
    AQSetParamNeedDisplayConManage: TStringField;
    AQSetParamNeedDisplaySalesCon: TStringField;
    AQSetParamEngDepartNeedSee: TStringField;
    AQSetParamEngDepartMINeed: TStringField;
    dsPrint: TDataSource;
    AQSetParamPARAMETER_NAME: TStringField;
    AQSetParamPARAMETER_DESC: TStringField;
    temp: TADOQuery;
    AQCalcSeqNo: TADOQuery;
    AQCalcSeqNoMax_No: TIntegerField;
    AQ0010: TADOQuery;
    AQ0010CUST_CODE: TStringField;
    AQ0010CUSTOMER_NAME: TStringField;
    AQ0010BILLING_ADDRESS_1: TStringField;
    AQMain: TADOQuery;
    AQMainRKEY: TAutoIncField;
    AQMainRFQNo: TStringField;
    AQMainStatus: TWordField;
    AQMainCust_Id: TStringField;
    AQMainCust_Name: TStringField;
    AQMainCust_Addr: TStringField;
    AQMainSalesMan: TStringField;
    AQMainTechContact: TStringField;
    AQMainTel: TStringField;
    AQMainMail: TStringField;
    AQMainFileName: TStringField;
    AQMainFilePath: TStringField;
    AQMainPartsId: TStringField;
    AQMainPOType: TStringField;
    AQMainCreateId: TIntegerField;
    AQMainCreateDate: TDateTimeField;
    AQMainLastModifyId: TIntegerField;
    AQMainLastModifyDate: TDateTimeField;
    AQMainAuditId: TIntegerField;
    AQMainAuditDate: TDateTimeField;
    AQ0338: TADOQuery;
    AQ0338rkey: TAutoIncField;
    AQ0338PARAMETER_PTR: TIntegerField;
    AQ0338SEQUENCE_NO: TSmallintField;
    AQ0338TVALUE: TStringField;
    AQTempDetail: TADOQuery;
    AQTempDetailRKEY: TAutoIncField;
    AQTempDetailGroup_Type: TWordField;
    AQTempDetailGroup_Name: TStringField;
    AQTempDetailParam_ptr: TIntegerField;
    AQTempDetailSEQ_NO: TSmallintField;
    AQTempDetailNeedDisplayConManage: TStringField;
    AQTempDetailNeedDisplaySalesCon: TStringField;
    AQTempDetailEngDepartNeedSee: TStringField;
    AQTempDetailEngDepartMINeed: TStringField;
    AQTempDetailPARAMETER_NAME: TStringField;
    AQTempDetailPARAMETER_DESC: TStringField;
    AQTempDetailUNIT_NAME: TStringField;
    AQParamName: TADOQuery;
    AQParamNamePARAMETER_NAME: TStringField;
    AQParamNamePARAMETER_DESC: TStringField;
    AQParamNameUNIT_NAME: TStringField;
    AQParamNameRKEY: TAutoIncField;
    tempCONTROL_NO_LENGTH: TSmallintField;
    tempSEED_VALUE: TStringField;
    tempSEED_FLAG: TWordField;
    ASPCopyData: TADOStoredProc;
    ADSRFQTPOType: TStringField;
    AQParamNameDATA_TYPE: TWordField;
    ACAudit: TADOCommand;
    AQEmp: TADOQuery;
    AQParamNamemin_value: TFloatField;
    AQParamNamemax_value: TFloatField;
    AQSetParamMustInput: TWordField;
    AQTempDetailMustInput: TWordField;
    AQ0010SALES_REP_NAME: TStringField;
    AQ0010PHONE: TStringField;
    AQ0010GEN_EMAIL_ADDRESS: TStringField;
    AQPrint: TADOQuery;
    AQPrintRFQNo: TStringField;
    AQPrintCust_Id: TStringField;
    AQPrintCust_Name: TStringField;
    AQPrintCust_Addr: TStringField;
    AQPrintSalesMan: TStringField;
    AQPrintTechContact: TStringField;
    AQPrintTel: TStringField;
    AQPrintMail: TStringField;
    AQPrintFileName: TStringField;
    AQPrintPartsId: TStringField;
    AQPrintTStatus: TStringField;
    AQPrintTPOType: TStringField;
    AQPrintCreateName: TStringField;
    AQPrintCreateDate: TDateTimeField;
    AQPrintLastModifyName: TStringField;
    AQPrintLastModifyDate: TDateTimeField;
    AQPrintAuditName: TStringField;
    AQPrintAuditDate: TDateTimeField;
    AQPrintGroup_Name: TStringField;
    AQPrintSEQ_NO: TSmallintField;
    AQPrintPARAMETER_NAME: TStringField;
    AQPrintPARAMETER_DESC: TStringField;
    AQPrintUNIT_NAME: TStringField;
    AQPrintParam_Value: TStringField;
    AQParamNameUNIT_CODE: TStringField;
    AQ0193: TADOQuery;
    AQ0193RECORD_KEY: TAutoIncField;
    AQ0193CODE: TStringField;
    AQ0193DESCRIPTION: TStringField;
    AQ0193layers_info: TMemoField;
    dsMain: TDataSource;
    AQMainLayers_Info: TMemoField;
    AQPrintLayers_Info: TMemoField;
    ASPCopyData1: TADOStoredProc;
    ADSRFQTIsUP: TStringField;
    ADSRFQIsUP: TBooleanField;
    AQMainIsUP: TBooleanField;
    ADSRFQPartsId: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses RFQ;

{$R *.dfm}

{ Tdm }

end.

