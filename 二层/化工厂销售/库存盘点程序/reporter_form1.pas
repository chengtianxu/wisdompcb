unit reporter_form1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppCtrls, ppPrnabl, ppClass, ppBands, ppCache, ppDB, ppEndUsr,
  ppProd, ppReport, DB, ppComm, ppRelatv, ppDBPipe, ppVar, ppStrtch,
  ppSubRpt;

type
  TForm_reporter1 = class(TForm)
    ppDB214: TppDBPipeline;
    ppDB215: TppDBPipeline;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ppDB493: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppDesigner1: TppDesigner;
    ppDBText4: TppDBText;
    ppLabel3: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppShape1: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel10: TppLabel;
    ppLabel9: TppLabel;
    ppLabel8: TppLabel;
    ppLabel7: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppDBImage1: TppDBImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_reporter1: TForm_reporter1;

implementation
uses damo;

{$R *.dfm}

end.
