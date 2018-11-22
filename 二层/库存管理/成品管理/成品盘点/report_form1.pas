unit report_form1;

interface

uses
  Classes, Controls, Forms,
  ppReport, 
  DB, ppDBPipe, ppVar, ppCtrls, ppBands, 
  ppEndUsr,Raide, ppPrnabl, ppClass, ppCache, ppProd, ppDB, ppComm,
  ppRelatv;

type
  TForm_report = class(TForm)
    ppDB214: TppDBPipeline;
    DataSource1: TDataSource;
    ppDB215: TppDBPipeline;
    DataSource2: TDataSource;
    ppDB439: TppDBPipeline;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppTitleBand1: TppTitleBand;
    ppLine1: TppLine;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppDBText4: TppDBText;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel14: TppLabel;
    ppDesigner1: TppDesigner;
    pdbtxt1: TppDBText;
    pdbtxt2: TppDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

{$R *.dfm}

end.
