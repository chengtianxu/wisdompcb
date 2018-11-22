unit frm_ProcedureReport1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, DB, ppDB, ppComm, ppRelatv, ppDBPipe, ADODB, ppModule,
  daDataModule, raCodMod;

type
  Tfrm_ProcedureReport = class(TForm)
    ads493: TADODataSet;
    ads493Company_Name: TStringField;
    ads493Company_Name2: TStringField;
    ads493Company_Name3: TStringField;
    ads493ship_address: TStringField;
    ads493Company_Icon: TBlobField;
    ads493SITE_INFO_ADD_1: TStringField;
    ads493SITE_INFO_ADD_2: TStringField;
    ads493SITE_INFO_ADD_3: TStringField;
    ads493SITE_INFO_PHONE: TStringField;
    DataSource3: TDataSource;
    ppDB493: TppDBPipeline;
    DataSource1: TDataSource;
    ADS25: TADODataSet;
    ADS25RKEY: TIntegerField;
    ADS25DSDesigner: TStringField;
    ADS25DSDesigner2: TStringField;
    ADS25DSDesigner3: TStringField;
    ADS25DSDesigner4: TStringField;
    ADS25DSDesigner5: TStringField;
    ADS25DSDesigner6: TStringField;
    ADS25DSDesigner7: TStringField;
    ADS25DSDesigner8: TStringField;
    ADS25DSDesigner9: TDateTimeField;
    ADS25DSDesigner10: TStringField;
    ADS25DSDesigner11: TDateTimeField;
    ADS25DSDesigner12: TStringField;
    ADS25DSDesigner13: TDateTimeField;
    ADS25DSDesigner14: TStringField;
    ADS25DSDesigner15: TStringField;
    ADS25DSDesigner16: TWordField;
    ADS25SET: TStringField;
    ADS25PCS: TStringField;
    ADS25SPEL: TStringField;
    ADS25PCS2: TFloatField;
    ADS25SET2: TFloatField;
    ADS25SPEL2: TFloatField;
    ADS25DSDesigner17: TMemoField;
    ADS25DSDesigner18: TMemoField;
    ADS25DSDesigner19: TStringField;
    ADS25DSDesigner20: TFloatField;
    ADS25DSDesigner21: TIntegerField;
    ADS25DSDesigner22: TSmallintField;
    ADS25DSDesigner23: TSmallintField;
    ADS25DSDesigner24: TStringField;
    ADS25g: TBCDField;
    ADS25DSDesigner25: TIntegerField;
    ADS25DSDesigner26: TStringField;
    ADS25DSDesigner27: TStringField;
    ADS25DSDesigner28: TStringField;
    ADS25DSDesigner29: TStringField;
    ADS25DSDesigner30: TStringField;
    ads31: TADODataSet;
    DataSource2: TDataSource;
    ppDB31: TppDBPipeline;
    ppDB25: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppLabel10: TppLabel;
    ppDBImage1: TppDBImage;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ads31SOURCE_PTR: TIntegerField;
    ads31DSDesigner: TSmallintField;
    ads31DEPT_PTR: TIntegerField;
    ads31DSDesigner2: TStringField;
    ads31DSDesigner3: TStringField;
    ads31DSDesigner4: TStringField;
    ads31DSDesigner5: TStringField;
    ads31DSDesigner6: TStringField;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    ADS25DSDesigner31: TStringField;
    ADS25DSDesigner32: TStringField;
    ppLabel12: TppLabel;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppDBText13: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_ProcedureReport: Tfrm_ProcedureReport;

implementation

uses demo;

{$R *.dfm}

end.
