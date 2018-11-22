unit report1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, ppCtrls, ppBands, ppPrnabl,
  ppClass, ppDB, ppCache, ppEndUsr, ppProd, ppReport, ppComm, ppRelatv,
  ppDBPipe, DB,raide;

type
  TForm_report1 = class(TForm)
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB93: TppDBPipeline;
    ppDB92: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppTitleBand1: TppTitleBand;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLine1: TppLine;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLine2: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppShape1: TppShape;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppDB93ppField17: TppField;
    ppDB93ppField18: TppField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report1: TForm_report1;

implementation
uses damo;

{$R *.dfm}

end.
