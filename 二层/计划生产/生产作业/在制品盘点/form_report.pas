unit form_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, ppDB, DB, ppComm, ppRelatv,
  ppDBPipe, ppProd, ppClass, ppReport, ppCtrls, ppVar, ppBands, ppPrnabl,
  ppCache, ppEndUsr,raide;

type
  TForm8 = class(TForm)
    ppDB401: TppDBPipeline;
    DataSource1: TDataSource;
    ppDB400: TppDBPipeline;
    ppReport1: TppReport;
    ppDB493: TppDBPipeline;
    DataSource2: TDataSource;
    ppDesigner1: TppDesigner;
    ppDB401ppField11: TppField;
    ppHeaderBand1: TppHeaderBand;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDBText1: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppDBImage1: TppDBImage;
    ppSystemVariable2: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine1: TppLine;
    ppLine4: TppLine;
    ppLabel16: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel15: TppLabel;
    ppDBText14: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppDBText15: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses demo;

{$R *.dfm}

procedure TForm8.ppReport1PreviewFormCreate(Sender: TObject);
begin
// ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
