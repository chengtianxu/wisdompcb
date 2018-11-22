unit ECN_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppProd, ppClass,
  ppReport, ppBands, ppStrtch, ppMemo, ppCtrls, ppVar, ppPrnabl, ppCache,
  raide, ppEndUsr;

type
  TForm_report = class(TForm)
    ads273: TADODataSet;
    ads493: TADODataSet;
    ads273DSDesigner: TDateTimeField;
    ads273DSDesigner2: TDateTimeField;
    ads273DSDesigner3: TStringField;
    ads273DSDesigner4: TStringField;
    ads273DSDesigner5: TStringField;
    ads273ECN: TStringField;
    ads273DSDesigner6: TStringField;
    ads273DSDesigner7: TStringField;
    ads273DSDesigner8: TDateTimeField;
    ads273DSDesigner1: TStringField;
    ads273DSDesigner22: TStringField;
    ads273DSDesigner32: TStringField;
    ads273DSDesigner42: TStringField;
    ads273DSDesigner52: TStringField;
    ads273DSDesigner12: TStringField;
    ads273DSDesigner23: TStringField;
    ads273DSDesigner33: TStringField;
    ads273DSDesigner43: TStringField;
    ads273DSDesigner53: TStringField;
    ads273DSDesigner9: TStringField;
    ads273DSDesigner10: TStringField;
    ads273DSDesigner11: TStringField;
    ads273DSDesigner13: TStringField;
    ads273DSDesigner14: TStringField;
    ads273DSDesigner15: TStringField;
    ads273DSDesigner16: TStringField;
    ads273DSDesigner17: TStringField;
    ads273DSDesigner18: TStringField;
    ads273DSDesigner19: TStringField;
    ads273DSDesigner20: TStringField;
    ads273DSDesigner21: TStringField;
    ads273DSDesigner24: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ads493DSDesigner: TStringField;
    ads493DSDesigner2: TStringField;
    ads493DSDesigner3: TStringField;
    ads493DSDesigner4: TStringField;
    ads493DSDesigner5: TBlobField;
    DataSource3: TDataSource;
    ads_ed38: TADODataSet;
    ads273CUSTOMER_PART_PTR: TIntegerField;
    ads_ed38DSDesigner: TSmallintField;
    ads_ed38DSDesigner2: TStringField;
    ads_ed38DSDesigner3: TStringField;
    ads_ed38DSDesigner4: TStringField;
    ads_ed38DSDesigner5: TStringField;
    ads_ed38DSDesigner6: TStringField;
    ppDB273: TppDBPipeline;
    ppDB493: TppDBPipeline;
    ppDB38: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLine2: TppLine;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLine3: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppDBText8: TppDBText;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine4: TppLine;
    ppLabel14: TppLabel;
    ppLine11: TppLine;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine5: TppLine;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine26: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDBMemo2: TppDBMemo;
    ppLabel16: TppLabel;
    ppLabel19: TppLabel;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLine28: TppLine;
    ppSummaryBand1: TppSummaryBand;
    ppLine27: TppLine;
    ppDBMemo1: TppDBMemo;
    ppLabel15: TppLabel;
    ppLine29: TppLine;
    ppLine30: TppLine;
    ppDesigner1: TppDesigner;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses DAMO;

{$R *.dfm}

end.
