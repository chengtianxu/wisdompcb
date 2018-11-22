unit DAMO;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    adoMain: TADODataSet;
    adoTime: TADOQuery;
    DataSource1: TDataSource;
    adoAux: TADODataSet;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    adoField: TADOQuery;
    adoTmp: TADOQuery;
    adoPO: TADODataSet;
    DataSource4: TDataSource;
    adoPORKEY: TAutoIncField;
    adoPOINVT_PTR: TIntegerField;
    adoPOPO_NUMBER: TStringField;
    adoPOINV_PART_NUMBER: TStringField;
    adoPOCODE: TStringField;
    adoPOABBR_NAME: TStringField;
    adoPOINV_NAME: TStringField;
    adoPOINV_DESCRIPTION: TStringField;
    adoPOQUAN_ORD: TFloatField;
    adoPONotCheck: TFloatField;
    adoPOREQ_DATE: TDateTimeField;
    adoPOextra_req: TStringField;
    adoPOCAP: TStringField;
    adoPOrohs: TStringField;
    adoPOUNIT_NAME: TStringField;
    adoPOSGS_NO: TStringField;
    adoPOTestDate: TDateTimeField;
    adoPOhalogen: TIntegerField;
    adoPOHaTong: TStringField;
    adoPOimp: TStringField;
    adoPOmurgency: TBooleanField;
    adoPOhourwork: TStringField;
    adoMainrkey: TAutoIncField;
    adoMainiqc_number: TStringField;
    adoMainPO_NUMBER: TStringField;
    adoMainINV_NAME: TStringField;
    adoMainINV_DESCRIPTION: TStringField;
    adoMainIES_PARAMETER_VALUE2: TStringField;
    adoMainIES_PARAMETER_VALUE3: TStringField;
    adoMainIES_PARAMETER_VALUE4: TStringField;
    adoMainIES_PARAMETER_VALUE8: TStringField;
    adoMainCODE: TStringField;
    adoMainABBR_NAME: TStringField;
    adoMainsupplier_model: TStringField;
    adoMainsgs_no: TStringField;
    adoMainsgs_date: TDateTimeField;
    adoMainrece_qty: TBCDField;
    adoMainiqc_qty: TBCDField;
    adoMainbarch_no: TStringField;
    adoMainappl_user_ptr: TIntegerField;
    adoMainappl_date: TDateTimeField;
    adoMainappr_user_ptr: TIntegerField;
    adoMainappr_date: TDateTimeField;
    adoMainauth_user_ptr: TIntegerField;
    adoMainauth_date: TDateTimeField;
    adoMainif_halogen: TStringField;
    adoMainappearance: TStringField;
    adoMainpart_size: TStringField;
    adoMainpart_thickness: TStringField;
    adoMaintong_thickness: TBCDField;
    adoMainthick_tolerance: TStringField;
    adoMainht_remark: TStringField;
    adoMainif_standard: TWideStringField;
    adoMainextrl_date: TDateTimeField;
    adoMainjudge_result: TStringField;
    adoMainremark: TStringField;
    adoMainstatus: TIntegerField;
    adoMainhalogen: TStringField;
    adoPOGroup_ptr: TIntegerField;
    adoPOIES_PARAMETER_VALUE2: TStringField;
    adoPOIES_PARAMETER_VALUE3: TStringField;
    adoPOIES_PARAMETER_VALUE4: TStringField;
    adoMainemployee_name: TStringField;
    adoMainuser_appr: TStringField;
    adoMainuser_auth: TStringField;
    adoPOhalogen_cn: TStringField;
    adoMainrkey71: TIntegerField;
    adoMainINV_PART_NUMBER: TStringField;
    adoMainGROUP_PTR: TIntegerField;
    adoPOeff_Date: TIntegerField;
    adoMainunit_name: TStringField;
    adoMainpurchase_name: TStringField;
    adoPOpurchase_name: TStringField;
    adoMainmanufacture_TDATE: TDateTimeField;
    adoMainpackage_qualified: TBooleanField;
    adoMainpackage: TStringField;
    adoMainqty_qualified: TBooleanField;
    adoMainqty: TStringField;
    adoMainhasheepreport: TBooleanField;
    adoMainhaReport: TStringField;
    adoMainGROUP_DESC: TStringField;
    adoMainreason: TStringField;
    adoMainreq_name: TStringField;
    adoMainextra_req: TStringField;
    adoMainAUDIUSER: TStringField;
    adoMainIF_CAF: TWideStringField;
    adoBadRecord: TADODataSet;
    dsBadRecord: TDataSource;
    adoBadRecordrkey: TAutoIncField;
    adoBadRecordrkey23: TIntegerField;
    adoBadRecordrkey17: TIntegerField;
    adoBadRecordDiscoverDate: TDateTimeField;
    adoBadRecordBatchNO: TStringField;
    adoBadRecordBadQuantity: TBCDField;
    adoBadRecordBadRemark: TStringField;
    adoBadRecordResult: TStringField;
    adoBadRecordIsReport: TBooleanField;
    adoBadRecordIsClose: TBooleanField;
    adoBadRecordStatus: TWordField;
    adoBadRecordTrancertMen: TIntegerField;
    adoBadRecordModiDate: TDateTimeField;
    adoBadRecordSUPPLIER_NAME: TStringField;
    adoBadRecordCODE: TStringField;
    adoBadRecordINV_PART_NUMBER: TStringField;
    adoBadRecordINV_PART_DESCRIPTION: TStringField;
    adoBadRecordUSER_FULL_NAME: TStringField;
    adoBadRecordUSER_LOGIN_NAME: TStringField;
    adoBadRecordstr_status: TStringField;
    adoBadRecordabbr_name: TStringField;
    adoMainstrStatus: TStringField;
    adoMainrkey17: TIntegerField;
    adoMainINV_PART_DESCRIPTION: TStringField;
    adoMainSUPPLIER_NAME: TStringField;
    adoMainSUPPLIER_POINTER: TIntegerField;
    adoMainstrstock: TStringField;
    adoMainstock_over: TBooleanField;
    adoAuxrkey: TIntegerField;
    adoAuxquantity: TBCDField;
    adoAuxquan_on_hang: TBCDField;
    adoAuxbatchno: TStringField;
    adoAuxmanufacture_TDATE: TDateTimeField;
    adoAuxextrl_date: TDateTimeField;
    adoAuxrkey391: TIntegerField;
    procedure adoFieldBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.adoFieldBeforeInsert(DataSet: TDataSet);
begin
  abort;
end;

end.
