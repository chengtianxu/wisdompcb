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
unit Report2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, DB, ADODB, StdCtrls;

type
  TFrmReport2 = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    ADO1: TADOQuery;
    ColumnHeaderBand1: TQRBand;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel14: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel25: TQRLabel;
    QRSysData1: TQRSysData;
    QRDBImage1: TQRDBImage;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport2: TFrmReport2;

implementation

{$R *.dfm}
uses main;

procedure TFrmReport2.FormCreate(Sender: TObject);
begin
  ADO1.Open ;
end;

end.
