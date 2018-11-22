unit Unit_report3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls;

type
  TForm_report3 = class(TForm)
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    SummaryBand1: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr2: TQRExpr;
    PageHeaderBand1: TQRBand;
    QRImage1: TQRImage;
    vdate: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRExpr1: TQRExpr;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRExpr5: TQRExpr;
    PageFooterBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report3: TForm_report3;

implementation
uses damo;

{$R *.dfm}

end.
