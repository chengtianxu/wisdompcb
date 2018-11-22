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
    pfldDB62ppField1: TppField;
    pfldDB62ppField2: TppField;
    pfldDB62ppField3: TppField;
    pfldDB6011ppField1: TppField;
    pfldDB60ppField1: TppField;
    pfldDB60ppField2: TppField;
    pfldDB60ppField3: TppField;
    pfldDB60ppField4: TppField;
    pfldDB60ppField5: TppField;
    pfldDB60ppField6: TppField;
    pfldDB60ppField7: TppField;
    pfldDB60ppField8: TppField;
    pfldDB60ppField9: TppField;
    pfldDB60ppField10: TppField;
    pfldDB60ppField11: TppField;
    pfldDB60ppField12: TppField;
    pfldDB60ppField13: TppField;
    pfldDB60ppField14: TppField;
    pfldDB60ppField15: TppField;
    pfldDB60ppField16: TppField;
    pfldDB60ppField17: TppField;
    pfldDB60ppField18: TppField;
    pfldDB60ppField19: TppField;
    pfldDB60ppField20: TppField;
    pfldDB60ppField21: TppField;
    pfldDB60ppField22: TppField;
    pfldDB60ppField23: TppField;
    pfldDB60ppField24: TppField;
    pfldDB60ppField25: TppField;
    pfldDB60ppField26: TppField;
    pfldDB60ppField27: TppField;
    pfldDB60ppField28: TppField;
    pfldDB60ppField29: TppField;
    pfldDB60ppField30: TppField;
    pfldDB60ppField31: TppField;
    pfldDB60ppField32: TppField;
    pfldDB60ppField33: TppField;
    pfldDB60ppField34: TppField;
    pfldDB60ppField35: TppField;
    pfldDB60ppField36: TppField;
    pfldDB60ppField37: TppField;
    pfldDB60ppField38: TppField;
    pfldDB60ppField39: TppField;
    pfldDB60ppField40: TppField;
    pfldDB60ppField41: TppField;
    pfldDB60ppField42: TppField;
    pfldDB60ppField43: TppField;
    ds1: TDataSource;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses
 damo;

{$R *.dfm}

procedure TForm_report.ppReport1PreviewFormCreate(Sender: TObject);
begin
//ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
