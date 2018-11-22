{ :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
  :: QuickReport 3.0 for Delphi 3.0/4.0/5.0                  ::
  ::                                                         ::
  :: Simple report for print the contents of a stringlist    ::
  ::                                                         ::
  :: Copyright (c) 1995-1999 QuSoft AS                       ::
  :: All Rights Reserved                                     ::
  ::                                                         ::
  :: web: http://www.qusoft.com  fax: +47 22 41 74 91        ::
  ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: }
unit Report3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, DB, ADODB, StdCtrls;

type
  TFrmReport3 = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    Company_Icon: TQRImage;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel7: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel13: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel25: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel26: TQRLabel;
    QRExpr4: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport3: TFrmReport3;

implementation

{$R *.dfm}
uses main5;
end.
