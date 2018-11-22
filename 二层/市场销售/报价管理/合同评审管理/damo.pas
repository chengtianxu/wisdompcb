unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConn: TADOConnection;
    aqTmp: TADOQuery;
    dsBrowse: TDataSource;
    adsBrowse: TADODataSet;
    adsBrowseRKEY: TAutoIncField;
    adsBrowseCust_Id: TStringField;
    adsBrowseCust_Name: TStringField;
    adsBrowseStatus: TWordField;
    adsBrowseTStatus: TStringField;
    adsBrowseCreateName: TStringField;
    adsBrowseCreateDate: TDateTimeField;
    adsBrowseLastModifyName: TStringField;
    adsBrowseLastModifyDate: TDateTimeField;
    adsBrowseAuditName: TStringField;
    adsBrowseAuditDate: TDateTimeField;
    aqGetDate: TADOQuery;
    adsBrowseContractNo: TStringField;
    aqMain: TADOQuery;
    aqMainRKEY: TAutoIncField;
    aqMainContractNo: TStringField;
    aqMainStatus: TWordField;
    aqMainCust_Id: TStringField;
    aqMainCust_Name: TStringField;
    aqMainCust_Addr: TStringField;
    aqMainSalesMan: TStringField;
    aqMainContact: TStringField;
    aqMainTel: TStringField;
    aqMainFax: TStringField;
    aqMainMail: TStringField;
    aqMainContractAmt: TBCDField;
    aqMainCURR_CODE: TStringField;
    aqMainCreateId: TIntegerField;
    aqMainCreateDate: TDateTimeField;
    aqMainLastModifyId: TIntegerField;
    aqMainLastModifyDate: TDateTimeField;
    aqMainAuditId: TIntegerField;
    aqMainAuditDate: TDateTimeField;
    dsMain: TDataSource;
    aqMainNotes: TStringField;
    dsDetail: TDataSource;
    aqDetail: TADOQuery;
    aqDetailRKEY: TAutoIncField;
    aqDetailPARAMETER_PTR: TIntegerField;
    aqDetailFlag: TWordField;
    aqDetailRFQNo: TStringField;
    aqDetailFileName: TStringField;
    aqDetailBoardThick: TStringField;
    aqDetailLayers: TWordField;
    aqDetailSetSize: TStringField;
    aqDetailQnty: TIntegerField;
    aqDetailUPS: TStringField;
    aqDetailPrice: TBCDField;
    aqDetailEngAmount: TBCDField;
    aqDetailFLAmount: TBCDField;
    aqDetailTestAmount: TBCDField;
    aqDetailMakeAmount: TBCDField;
    aqDetailOtherAmount: TBCDField;
    aqDetailTotalAmount: TBCDField;
    aqDetailAftDiscountAmount: TBCDField;
    aqDetailArea: TBCDField;
    aqDetailDueDate: TDateTimeField;
    aqDetailFile_Number: TStringField;
    aqDetailPOType: TWordField;
    aqDetailLAM2: TStringField;
    aqDetailSurfaceDeal: TStringField;
    aqDetailWCCPTH: TStringField;
    aqDetailNCCPTH: TStringField;
    aqDetailVersion: TStringField;
    aqDetailTZFL: TStringField;
    aqDetailStandardPrice: TBCDField;
    aqDetailXS_Add: TBCDField;
    aqDetailPrice_Add: TBCDField;
    aqDetailAfterPrice: TBCDField;
    aqDetailStdEngAmount: TBCDField;
    aqDetailStdEngPrice: TBCDField;
    aqDetailStdArea: TBCDField;
    aqDetailGoldFingerAmount: TBCDField;
    aqDetailUrgentAmount: TBCDField;
    aqDetailAdd_Percent: TBCDField;
    aqDetailAdd_TotalAmount: TBCDField;
    aqDetailDiscount: TBCDField;
    aqDetailUrgentDays: TWordField;
    aqDetailDueDays: TWordField;
    aqDetailNotes: TStringField;
    aqDetailRKEY165: TIntegerField;
    dsRFQParam: TDataSource;
    aqRFQParam: TADOQuery;
    aqRFQParamRKEY: TAutoIncField;
    aqRFQParamPARAMETER_PTR: TIntegerField;
    aqRFQParamGroup_Type: TWordField;
    aqRFQParamGroup_Name: TStringField;
    aqRFQParamSEQ_NO: TSmallintField;
    aqRFQParamParam_ptr: TIntegerField;
    aqRFQParamParam_Value: TStringField;
    aqRFQParamMustInput: TWordField;
    aqParamName: TADOQuery;
    aqParamNameRKEY: TAutoIncField;
    aqParamNamePARAMETER_NAME: TStringField;
    aqParamNamePARAMETER_DESC: TStringField;
    aqParamNameUNIT_NAME: TStringField;
    aqParamNameDATA_TYPE: TWordField;
    aqParamNamemin_value: TFloatField;
    aqParamNamemax_value: TFloatField;
    aqRFQParamPARAMETER_DESC: TStringField;
    aqDtlItem: TADOQuery;
    dsDtlItem: TDataSource;
    aqDtlItemRKEY: TAutoIncField;
    aqDtlItemPARAMETER_PTR: TIntegerField;
    aqDtlItemRKEY165: TIntegerField;
    aqDtlItemRFQNo: TStringField;
    aqDtlItemParam_ptr: TIntegerField;
    aqDtlItemSEQ_NO: TSmallintField;
    aqDtlItemParam_Value: TStringField;
    aqDtlItemNotes: TStringField;
    aqDtlItemAdd_Type: TWordField;
    aqDtlItemAdd_Value: TBCDField;
    aqDtlItemAdd_Time: TStringField;
    aqDtlItemPARAMETER_DESC: TStringField;
    aqDtlItemUNIT_NAME: TStringField;
    dsSetItem: TDataSource;
    aqSetItem: TADOQuery;
    aqSetItemRKEY: TAutoIncField;
    aqSetItemParam_ptr: TIntegerField;
    aqSetItemSEQ_NO: TSmallintField;
    aqSetItemAddType: TWordField;
    aqSetItemNotes: TStringField;
    aqSetItemPARAMETER_NAME: TStringField;
    aqSetItemPARAMETER_DESC: TStringField;
    aqSetItemUNIT_NAME: TStringField;
    acAddModel: TADOCommand;
    dsFindRFQ: TDataSource;
    aqFindRFQ: TADOQuery;
    aqFindRFQRKEY: TAutoIncField;
    aqFindRFQRFQNo: TStringField;
    aqFindRFQStatus: TWordField;
    aqFindRFQCust_Id: TStringField;
    aqFindRFQCust_Name: TStringField;
    aqFindRFQCust_Addr: TStringField;
    aqFindRFQSalesMan: TStringField;
    aqFindRFQTechContact: TStringField;
    aqFindRFQTel: TStringField;
    aqFindRFQMail: TStringField;
    aqFindRFQFileName: TStringField;
    aqFindRFQFilePath: TStringField;
    aqFindRFQPartsId: TStringField;
    aqFindRFQPOType: TStringField;
    aqFindRFQCreateId: TIntegerField;
    aqFindRFQCreateDate: TDateTimeField;
    aqFindRFQLastModifyId: TIntegerField;
    aqFindRFQLastModifyDate: TDateTimeField;
    aqFindRFQAuditId: TIntegerField;
    aqFindRFQAuditDate: TDateTimeField;
    aqFindRFQTPOType: TStringField;
    dsFindCust: TDataSource;
    aqFindCust: TADOQuery;
    aqFindCustCUST_CODE: TStringField;
    aqFindCustCUSTOMER_NAME: TStringField;
    aqFindCustBILLING_ADDRESS_1: TStringField;
    aqFindCustSALES_REP_NAME: TStringField;
    aqFindCustPHONE: TStringField;
    aqFindCustGEN_EMAIL_ADDRESS: TStringField;
    aqFindCustCURR_CODE: TStringField;
    aqFindCustFAX: TStringField;
    aqDetailDueArea: TFloatField;
    aqMainPosition: TStringField;
    aqParamNameUNIT_CODE: TStringField;
    dsParamName: TDataSource;
    aqFindCustCONTACT_NAME_1: TStringField;
    aqFindCustCONT_PHONE_1: TStringField;
    aqDetailPartsId: TStringField;
    dsEngStr: TDataSource;
    aqEngStr: TADOQuery;
    aqEngStrBoardType: TWordField;
    aqEngStrLayer: TWordField;
    aqEngStrEngAmount: TBCDField;
    aqEngStrAddEngAmount: TBCDField;
    aqEngStrstdArea: TBCDField;
    acAudit: TADOCommand;
    aqMainColorTag: TWordField;
    adsBrowseColorTag: TWordField;
    procedure aqMainAfterScroll(DataSet: TDataSet);
    procedure aqDetailAfterScroll(DataSet: TDataSet);
    procedure aqDetailBeforeDelete(DataSet: TDataSet);
    procedure aqMainBeforeClose(DataSet: TDataSet);
    procedure aqMainCURR_CODEChange(Sender: TField);
    procedure aqDetailCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.aqMainAfterScroll(DataSet: TDataSet);
begin
  with aqDetail do
  begin
    Close;
    Parameters.ParamByName('RKEY167').Value:= aqMainRKEY.Value;
    Open;
  end;
end;

procedure Tdm.aqDetailAfterScroll(DataSet: TDataSet);
begin
  with aqDtlItem do
  begin
    if not aqDtlItem.Active then //此处不可省;如数据集已打开,执行Close/Open会造成未保存的数据丢失
    begin
      Close;
      Parameters.ParamByName('PARAMETER_PTR').Value:= aqDetailPARAMETER_PTR.Value;
      Open;
    end;
    Filter:= 'RKEY165 = ' + IntToStr(aqDetailRKEY165.Value);
  end;
  with aqRFQParam do
  begin
    Close;
    Parameters.ParamByName('RKEY165').Value:= aqDetailRKEY165.Value;
    Open;
  end;
end;

procedure Tdm.aqDetailBeforeDelete(DataSet: TDataSet);
begin
  with aqDtlItem do
  begin
    First;
    while not Eof do
    begin
      if ((FieldByName('PARAMETER_PTR').Value = aqDetail.FieldByName('PARAMETER_PTR').Value)
        and (FieldByName('RKEY165').Value = aqDetail.FieldByName('RKEY165').Value))
      then
        Delete
      else
        Next;
    end;
  end;
end;

procedure Tdm.aqMainBeforeClose(DataSet: TDataSet);
begin
  aqDetail.Close;
  aqDtlItem.Close;  //避免已取消不需保存的临时数据在下一次错误保存;
end;

procedure Tdm.aqMainCURR_CODEChange(Sender: TField);
var
  str: string;
begin
  str:= aqMain.FieldByName('CURR_CODE').Value;
  if Pos('_', str) > 0 then
  begin
    aqMain.FieldByName('CURR_CODE').Value:= Copy(str, 1, Pos('_', str)-1);
  end;
end;

procedure Tdm.aqDetailCalcFields(DataSet: TDataSet);
begin
  aqDetail.FieldByName('DueArea').Value:= aqDetail.FieldByName('Qnty').Value*
                                           aqDetail.FieldByName('Area').Value/10000;
end;

end.




