unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, DB, ADODB, ppDB, ppDBPipe, ppBands, ppCtrls, ppVar,
  ppPrnabl, ppClass, ppStrtch, ppMemo, ppCache, ppComm, ppRelatv, ppProd,
  ppReport;

type
  TForm4 = class(TForm)
    ppReport1: TppReport;
    ptlbnd1: TppTitleBand;
    ppDBImage1: TppDBImage;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine19: TppLine;
    phdrbnd1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText14: TppDBText;
    ppLabel15: TppLabel;
    ppDB493: TppDBPipeline;
    ds1: TDataSource;
    ppDBPipeline1: TppDBPipeline;
    pfldDBPipeline1ppField1: TppField;
    pfldDBPipeline1ppField2: TppField;
    pfldDBPipeline1ppField3: TppField;
    pfldDBPipeline1ppField4: TppField;
    pfldDBPipeline1ppField5: TppField;
    pfldDBPipeline1ppField6: TppField;
    pfldDBPipeline1ppField7: TppField;
    pfldDBPipeline1ppField8: TppField;
    pfldDBPipeline1ppField9: TppField;
    pfldDBPipeline1ppField10: TppField;
    pfldDBPipeline1ppField11: TppField;
    pfldDBPipeline1ppField12: TppField;
    pfldDBPipeline1ppField13: TppField;
    pfldDBPipeline1ppField14: TppField;
    pfldDBPipeline1ppField15: TppField;
    ppDBText1: TppDBText;
    ppDBPipeline2: TppDBPipeline;
    pfldDBPipeline1ppField16: TppField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses damo;

{$R *.dfm}

end.
