unit so_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, QuickRpt, QRCtrls, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppDB, ppDBPipe, DB, ppBands, ppCtrls, ppPrnabl, ppCache,
  ppStrtch, ppMemo, ppVar, ADODB, ppEndUsr;

type
  TForm_report = class(TForm)
    ppReport1: TppReport;
    ppDB0060: TppDBPipeline;
    ppDB493: TppDBPipeline;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADO25: TADOQuery;
    ADO25ENG_NOTE: TStringField;
    ppDB25: TppDBPipeline;
    ppDB90: TppDBPipeline;
    ADO62: TADOQuery;
    DataSource4: TDataSource;
    ADO62CATEGORY: TStringField;
    ADO62AMOUNT: TFloatField;
    ADO62free_amount: TFloatField;
    ppDB62: TppDBPipeline;
    ADO6011: TADOQuery;
    DataSource5: TDataSource;
    ppDB6011: TppDBPipeline;
    ADO25set_qty: TIntegerField;
    ADO25REMARK: TMemoField;
    ADO25DSDesigner: TStringField;
    ADO25DSDesigner2: TStringField;
    ADO25DSDesigner3: TStringField;
    ADO25DSDesigner4: TStringField;
    ADO25DSDesigner5: TMemoField;
    ADO6011DSDesigner: TMemoField;
    ppTitleBand1: TppTitleBand;
    ppMemo2: TppMemo;
    ppMemo1: TppMemo;
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
    ppHeaderBand1: TppHeaderBand;
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
    ppLine9: TppLine;
    ppDBText1: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDBText14: TppDBText;
    ppLabel15: TppLabel;
    ppDesigner1: TppDesigner;
    ppDB60: TppDBPipeline;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses damo;

{$R *.dfm}

procedure TForm_report.ppReport1PreviewFormCreate(Sender: TObject);
begin
//ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
