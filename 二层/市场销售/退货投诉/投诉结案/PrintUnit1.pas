unit PrintUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppDBPipe, ppModule, raCodMod, ppStrtch, ppMemo,
  ppBands, ppCtrls, ppPrnabl, ppClass, ppVar, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, myChkBox, ppEndUsr;

type
  TPrintForm1 = class(TForm)
    DataSource3: TDataSource;
    DataSource4: TDataSource;
    ppReport1: TppReport;
    BaseInfo: TppDBPipeline;
    CompanyInfo: TppDBPipeline;
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
    ADOQ34: TADOQuery;
    ADOQ34RKEY: TIntegerField;
    ADOQ34DEPT_CODE: TStringField;
    ADOQ34DEPT_NAME: TStringField;
    ADOQ39: TADOQuery;
    ADOQ39RKEY: TIntegerField;
    ADOQ39REJ_CODE: TStringField;
    ADOQ39REJECT_DESCRIPTION: TStringField;
    myDBCheckBox1: TmyDBCheckBox;
    ppDesigner1: TppDesigner;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm1: TPrintForm1;

implementation

uses
    DmUnit1 ;
{$R *.dfm}

end.
