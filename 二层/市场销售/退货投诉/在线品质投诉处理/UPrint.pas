unit UPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, DB, ADODB, ppDB, ppDBPipe, ppStrtch, ppMemo, ppBands,
  myChkBox, ppCtrls, ppPrnabl, ppClass, ppVar, ppCache, ppComm, ppRelatv,
  ppProd, ppReport;

type
  TfrmPrint = class(TForm)
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    BaseInfo: TppDBPipeline;
    BaseInfoppField1: TppField;
    BaseInfoppField2: TppField;
    BaseInfoppField3: TppField;
    BaseInfoppField4: TppField;
    BaseInfoppField5: TppField;
    BaseInfoppField6: TppField;
    BaseInfoppField7: TppField;
    BaseInfoppField8: TppField;
    BaseInfoppField9: TppField;
    BaseInfoppField10: TppField;
    BaseInfoppField11: TppField;
    BaseInfoppField12: TppField;
    BaseInfoppField13: TppField;
    BaseInfoppField14: TppField;
    BaseInfoppField15: TppField;
    BaseInfoppField16: TppField;
    BaseInfoppField17: TppField;
    BaseInfoppField18: TppField;
    BaseInfoppField19: TppField;
    BaseInfoppField20: TppField;
    BaseInfoppField21: TppField;
    BaseInfoppField22: TppField;
    BaseInfoppField23: TppField;
    BaseInfoppField24: TppField;
    BaseInfoppField25: TppField;
    BaseInfoppField26: TppField;
    BaseInfoppField27: TppField;
    CompanyInfo: TppDBPipeline;
    CompanyInfoppField1: TppField;
    CompanyInfoppField2: TppField;
    CompanyInfoppField3: TppField;
    CompanyInfoppField4: TppField;
    CompanyInfoppField5: TppField;
    CompanyInfoppField6: TppField;
    CompanyInfoppField7: TppField;
    CompanyInfoppField8: TppField;
    CompanyInfoppField9: TppField;
    CompanyInfoppField10: TppField;
    CompanyInfoppField11: TppField;
    DataSource1: TDataSource;
    TCompanyInfo: TADOQuery;
    TCompanyInfoCompany_Name: TStringField;
    TCompanyInfoCompany_name2: TStringField;
    TCompanyInfoCompany_name3: TStringField;
    TCompanyInfoship_address: TStringField;
    TCompanyInfoCompany_Icon: TBlobField;
    TCompanyInfoSITE_INFO_ADD_1: TStringField;
    TCompanyInfoSITE_INFO_ADD_2: TStringField;
    TCompanyInfoSITE_INFO_ADD_3: TStringField;
    TCompanyInfoSITE_INFO_PHONE: TStringField;
    TCompanyInfoGenParam1: TWideStringField;
    TCompanyInfoGenParam2: TWideStringField;
    Defects: TppDBPipeline;
    DefectsppField1: TppField;
    DefectsppField2: TppField;
    DefectsppField3: TppField;
    DefectsppField4: TppField;
    DefectsppField5: TppField;
    DefectsppField6: TppField;
    DefectsppField7: TppField;
    DefectsppField8: TppField;
    DefectsppField9: TppField;
    ADOQALL2: TADOQuery;
    ADOQALL2RKEY: TAutoIncField;
    ADOQALL2LOG_NUMBER: TStringField;
    ADOQALL2CUSTOMER_PART_PTR: TIntegerField;
    ADOQALL2CSI_USER_PTR: TIntegerField;
    ADOQALL2CUSTOMER_PTR: TIntegerField;
    ADOQALL2LOG_DATE: TDateTimeField;
    ADOQALL2SHIP_DATE: TDateTimeField;
    ADOQALL2QTY: TFloatField;
    ADOQALL2EFFECT_TP: TStringField;
    ADOQALL2ANALYSIS: TStringField;
    ADOQALL2AFTER_ACTION: TStringField;
    ADOQALL2STATUS: TSmallintField;
    ADOQALL2CLOSED_BY_PTR: TIntegerField;
    ADOQALL2CLOSED_DATE: TDateTimeField;
    ADOQALL2DEALT_BY_PTR: TIntegerField;
    ADOQALL2DEALT_DATE: TDateTimeField;
    ADOQALL2LOSS_AMT: TIntegerField;
    ADOQALL2RESULT: TStringField;
    ADOQALL2CONTENT: TStringField;
    ADOQALL2CUST_CODE: TStringField;
    ADOQALL2CUSTOMER_NAME: TStringField;
    ADOQALL2MANU_PART_NUMBER: TStringField;
    ADOQALL2MANU_PART_DESC: TStringField;
    ADOQALL2Mystatus: TStringField;
    ADOQALL2Close_EMPLOYEE_NAME: TStringField;
    ADOQALL2Dealt_EMPLOYEE_NAME: TStringField;
    ADOQALL2Ent_EMPLOYEE_NAME: TStringField;
    ADOQ0118: TADOQuery;
    ADOQ0118RKEY: TAutoIncField;
    ADOQ0118SOURCE_PTR: TIntegerField;
    ADOQ0118defect_ptr: TIntegerField;
    ADOQ0118RESP_DEPT_PTR: TIntegerField;
    ADOQ0118MyREJ_CODE: TStringField;
    ADOQ0118MyREJECT_DESCRIPTION: TStringField;
    ADOQ0118MyDEPT_CODE: TStringField;
    ADOQ0118MyDEPT_NAME: TStringField;
    ADOQ0118FLAG: TBooleanField;
    ADOQ34: TADOQuery;
    ADOQ34RKEY: TIntegerField;
    ADOQ34DEPT_CODE: TStringField;
    ADOQ34DEPT_NAME: TStringField;
    ADOQ39: TADOQuery;
    ADOQ39RKEY: TIntegerField;
    ADOQ39REJ_CODE: TStringField;
    ADOQ39REJECT_DESCRIPTION: TStringField;
    ppDesigner1: TppDesigner;
    prprt_Test: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppShape3: TppShape;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppDBImage2: TppDBImage;
    ppLabel21: TppLabel;
    ppDBText5: TppDBText;
    ppLabel22: TppLabel;
    ppDBText19: TppDBText;
    ppLabel23: TppLabel;
    ppDBText20: TppDBText;
    ppLabel24: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppLabel25: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLabel26: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel27: TppLabel;
    ppDBText27: TppDBText;
    ppLabel28: TppLabel;
    ppDBText28: TppDBText;
    ppLabel29: TppLabel;
    ppDBText29: TppDBText;
    ppLabel30: TppLabel;
    ppDBText30: TppDBText;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppShape5: TppShape;
    ppDetailBand2: TppDetailBand;
    ppDBText31: TppDBText;
    myDBCheckBox2: TmyDBCheckBox;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    ppShape6: TppShape;
    ppDBText32: TppDBText;
    ppLabel34: TppLabel;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppShape2: TppShape;
    ppLabel12: TppLabel;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppDBText6: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText11: TppDBText;
    ppLabel5: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel6: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLabel7: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel8: TppLabel;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppLabel11: TppLabel;
    ppDBText10: TppDBText;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppShape1: TppShape;
    ppDetailBand1: TppDetailBand;
    ppDBText4: TppDBText;
    myDBCheckBox1: TmyDBCheckBox;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppShape4: TppShape;
    ppLabel15: TppLabel;
    ppDBText18: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel18: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBMemo3: TppDBMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrint: TfrmPrint;

implementation
    uses  UDM;
{$R *.dfm}

procedure TfrmPrint.FormCreate(Sender: TObject);
begin
//  if not ADOQ39.Active  then ADOQ39.Open;
//  if not ADOQ34.Active  then ADOQ34.Open;
end;

end.
