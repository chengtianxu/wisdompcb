unit produrce;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, DB, ppDB, ppComm, ppRelatv, ppDBPipe, ADODB;

type
  Tfrm_Procedure = class(TForm)
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
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    ppDB493ppField8: TppField;
    ppDB493ppField9: TppField;
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
    ads38: TADODataSet;
    ads38DSDesigner: TStringField;
    ads38DSDesigner2: TStringField;
    ads38DSDesigner3: TStringField;
    ads38DSDesigner4: TStringField;
    ads38DSDesigner5: TBCDField;
    ads38DSDesigner6: TStringField;
    ads38DSDesigner7: TSmallintField;
    ads38DSDesigner8: TStringField;
    DataSource2: TDataSource;
    ppDB38: TppDBPipeline;
    ppDB38ppField1: TppField;
    ppDB38ppField2: TppField;
    ppDB38ppField3: TppField;
    ppDB38ppField4: TppField;
    ppDB38ppField5: TppField;
    ppDB38ppField6: TppField;
    ppDB38ppField7: TppField;
    ppDB38ppField8: TppField;
    ppDB25: TppDBPipeline;
    ppDB25ppField1: TppField;
    ppDB25ppField2: TppField;
    ppDB25ppField3: TppField;
    ppDB25ppField4: TppField;
    ppDB25ppField5: TppField;
    ppDB25ppField6: TppField;
    ppDB25ppField7: TppField;
    ppDB25ppField8: TppField;
    ppDB25ppField9: TppField;
    ppDB25ppField10: TppField;
    ppDB25ppField11: TppField;
    ppDB25ppField12: TppField;
    ppDB25ppField13: TppField;
    ppDB25ppField14: TppField;
    ppDB25ppField15: TppField;
    ppDB25ppField16: TppField;
    ppDB25ppField17: TppField;
    ppDB25ppField18: TppField;
    ppDB25ppField19: TppField;
    ppDB25ppField20: TppField;
    ppDB25ppField21: TppField;
    ppDB25ppField22: TppField;
    ppDB25ppField23: TppField;
    ppDB25ppField24: TppField;
    ppDB25ppField25: TppField;
    ppDB25ppField26: TppField;
    ppDB25ppField27: TppField;
    ppDB25ppField28: TppField;
    ppDB25ppField29: TppField;
    ppDB25ppField30: TppField;
    ppDB25ppField31: TppField;
    ppDB25ppField32: TppField;
    ppDB25ppField33: TppField;
    ppDB25ppField34: TppField;
    ppDB25ppField35: TppField;
    ppDB25ppField36: TppField;
    ppDB25ppField37: TppField;
    ppDB25ppField38: TppField;
    ppReport1: TppReport;
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
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDesigner1: TppDesigner;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Procedure: Tfrm_Procedure;

implementation

{$R *.dfm}

end.
