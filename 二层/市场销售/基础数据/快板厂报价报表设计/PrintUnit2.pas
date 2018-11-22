unit PrintUnit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseUnit1, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppBands, ppCache, ppPrnabl, ppCtrls, ppMemo, ppModule,
  ppStrtch, ppSubRpt, ppVar, DB, ADODB, raCodMod, ppEndUsr
   ;

type
  TPrintForm2 = class(TBaseForm1)
    ppReport1: TppReport;
    ppDBPipeline3: TppDBPipeline;
    ppDBPipeline4: TppDBPipeline;
    ppDBPipeline5: TppDBPipeline;
    ADOData0085: TADOQuery;
    DataSource1: TDataSource;
    ppDBPdata0085: TppDBPipeline;
    ppDBPdata0493: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    ADOQuery2: TADOQuery;
    DataSource3: TDataSource;
    ppDBPipeline2: TppDBPipeline;
    ADOQuery3: TADOQuery;
    DataSource4: TDataSource;
    ppDBPipeline6: TppDBPipeline;
    ADOQuery4: TADOQuery;
    DataSource5: TDataSource;
    ppDBPipeline7: TppDBPipeline;
    ADOQuery1AMOUNT: TFloatField;
    ADOQuery1FREE_AMOUNT: TFloatField;
    ADOQuery2AMOUNT: TFloatField;
    ADOQuery2FREE_AMOUNT: TFloatField;
    ADOQuery3AMOUNT: TFloatField;
    ADOQuery3FREE_AMOUNT: TFloatField;
    ADOQuery4AMOUNT: TFloatField;
    ADOQuery4FREE_AMOUNT: TFloatField;
    ppTitleBand3: TppTitleBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppLabel28: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppDBText6: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel21: TppLabel;
    ppLabel49: TppLabel;
    ppLabel45: TppLabel;
    ppLabel7: TppLabel;
    ppDBText26: TppDBText;
    ppDBText12: TppDBText;
    ppDBText11: TppDBText;
    ppDBText30: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText9: TppDBText;
    ppLabel51: TppLabel;
    ppDBText10: TppDBText;
    ppLabel50: TppLabel;
    ppLabel20: TppLabel;
    ppDBText32: TppDBText;
    ppLine30: TppLine;
    ppDBText4: TppDBText;
    ppLabel10: TppLabel;
    ppDBText15: TppDBText;
    ppLabel17: TppLabel;
    ppLabel19: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel29: TppLabel;
    ppDBText17: TppDBText;
    ppLabel9: TppLabel;
    ppVariable1: TppVariable;
    ppDBText16: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppVariable2: TppVariable;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppShape5: TppShape;
    ppLine1: TppLine;
    ppLabel14: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLine2: TppLine;
    ppDetailBand3: TppDetailBand;
    ppShape1: TppShape;
    ppLine3: TppLine;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppShape2: TppShape;
    ppDBCalc1: TppDBCalc;
    ppLabel4: TppLabel;
    ppLine4: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape3: TppShape;
    ppLabel5: TppLabel;
    ppLine6: TppLine;
    ppLabel11: TppLabel;
    ppLabel8: TppLabel;
    ppLine5: TppLine;
    ppLabel16: TppLabel;
    ppLine17: TppLine;
    ppDetailBand2: TppDetailBand;
    ppShape4: TppShape;
    ppDBText2: TppDBText;
    ppLine7: TppLine;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine9: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppShape6: TppShape;
    ppDBCalc2: TppDBCalc;
    ppLabel6: TppLabel;
    ppLine8: TppLine;
    ppDBCalc3: TppDBCalc;
    ppLine16: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable3: TppSystemVariable;
    ppLabel18: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppDBText28: TppDBText;
    ppLine18: TppLine;
    ppLabel12: TppLabel;
    ppMemo1: TppMemo;
    raCodeModule1: TraCodeModule;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm2: TPrintForm2;

implementation

uses
    DMUnit1 ;
{$R *.dfm}

end.
