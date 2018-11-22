unit packreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppProd, ppClass, ppReport, ppDB, DB, ppComm, ppRelatv, ppDBPipe,
  ADODB, ppCtrls, ppBands, ppPrnabl, ppCache, Grids, DBGrids, ppBarCod,
  ppEndUsr;

type
  Tpackreport_Form = class(TForm)
    ADS699: TADODataSet;
    ADS699DSDesigner: TSmallintField;
    ADS699DSDesigner2: TStringField;
    ADS699DSDesigner3: TStringField;
    ADS699DSDesigner4: TStringField;
    ADS699DSDesigner5: TStringField;
    ADS699DSDesigner6: TIntegerField;
    ADS699DSDesigner7: TStringField;
    ADS699DSDesigner8: TStringField;
    ADS699DSDesigner9: TStringField;
    ADS699DSDesigner10: TStringField;
    ADS699DSDesigner11: TStringField;
    DB699: TppDBPipeline;
    DataSource1: TDataSource;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLabel4: TppLabel;
    ppLine5: TppLine;
    ppLabel5: TppLabel;
    ppLine6: TppLine;
    ppLabel6: TppLabel;
    ppLine7: TppLine;
    ppDBText4: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLine8: TppLine;
    ppLabel9: TppLabel;
    ppLine9: TppLine;
    ppLabel10: TppLabel;
    ppLine10: TppLine;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppColumnFooterBand1: TppColumnFooterBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBBarCode1: TppDBBarCode;
    ppReport2: TppReport;
    ppDesigner2: TppDesigner;
    ppTitleBand2: TppTitleBand;
    ppHeaderBand2: TppHeaderBand;
    ppColumnHeaderBand2: TppColumnHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppShape2: TppShape;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    ppDBText10: TppDBText;
    ppLabel13: TppLabel;
    ppDBText11: TppDBText;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLabel14: TppLabel;
    ppLine15: TppLine;
    ppLabel15: TppLabel;
    ppLine16: TppLine;
    ppLabel16: TppLabel;
    ppLine17: TppLine;
    ppDBText12: TppDBText;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLine18: TppLine;
    ppLabel19: TppLabel;
    ppLine19: TppLine;
    ppLabel20: TppLabel;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppColumnFooterBand2: TppColumnFooterBand;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand2: TppSummaryBand;
    ppPageStyle1: TppPageStyle;
    ADS699DSDesigner12: TDateTimeField;
    ADS699DSDesigner698: TStringField;
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  packreport_Form: Tpackreport_Form;

implementation

uses DAMO;

{$R *.dfm}

procedure Tpackreport_Form.ppReport1PrintingComplete(Sender: TObject);
begin
if not dm.ADS698v_print.Value then
begin
  dm.ADS698.Edit;
  dm.ADS698v_print.Value:=true;
  dm.ADS698.Post;
end;
end;

end.
