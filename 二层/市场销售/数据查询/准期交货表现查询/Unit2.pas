unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, TeeProcs, TeEngine, Chart, DbChart, QRTEE,
  QRCtrls, DB, ADODB, Series;

type
  TFrmReport3 = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    ADOQuery1: TADOQuery;
    QRDBImage1: TQRDBImage;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel2: TQRLabel;
    QRChart1: TQRChart;
    QRDBChart1: TQRDBChart;
    Series1: TBarSeries;
    PageFooterBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRSysData2: TQRSysData;
    Series2: TBarSeries;
    QRLabel10: TQRLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport3: TFrmReport3;

implementation

USES MAIN,Totals;
{$R *.dfm}

procedure TFrmReport3.FormCreate(Sender: TObject);
begin
  Adoquery1.Open ;
end;

end.
