unit URep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, DB, ADODB, ppEndUsr, ppReport, ppSubRpt, ppBands,
  ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppComm,
  ppRelatv, ppDBPipe, Grids, DBGridEh;

type
  TReport_Frm = class(TForm)
    ppDB268: TppDBPipeline;
    ppDB468: TppDBPipeline;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppLabel3: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine5: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDesigner1: TppDesigner;
    DS1: TDataSource;
    DS2: TDataSource;
    ADS268: TADODataSet;
    ADS468: TADODataSet;
    ADS268DSDesigner: TStringField;
    ADS268DSDesigner2: TDateTimeField;
    ADS268DSDesigner3: TStringField;
    ADS268DSDesigner4: TStringField;
    ADS268DSDesigner5: TDateTimeField;
    ADS268DSDesigner6: TStringField;
    ADS268DSDesigner7: TStringField;
    ADS268DSDesigner8: TStringField;
    ADS268DSDesigner10: TStringField;
    ADS268rkey: TAutoIncField;
    ADS468DSDesigner: TFloatField;
    ADS468DSDesigner2: TFloatField;
    ADS468DSDesigner3: TStringField;
    ADS468DSDesigner4: TStringField;
    ADS468DSDesigner5: TStringField;
    ADS468DSDesigner6: TStringField;
    ppLabel1: TppLabel;
    ppDBText8: TppDBText;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText9: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppLabel15: TppLabel;
    ppDBText13: TppDBText;
    ppLabel16: TppLabel;
    ppDBText14: TppDBText;
    ppLabel7: TppLabel;
    ppDBText1: TppDBText;
    ppLabel8: TppLabel;
    ppDBText17: TppDBText;
    ppLabel6: TppLabel;
    ppDBText6: TppDBText;
    ppLabel13: TppLabel;
    ppDBText7: TppDBText;
    ADS468FLOW_NO: TIntegerField;
    ppLabel11: TppLabel;
    ppDBText5: TppDBText;
    ADS468DSDesigner7: TBCDField;
    ADS268DSDesigner9: TStringField;
    ADS468DSDesigner8: TStringField;
    ppDB468ppField9: TppField;
    ppDBText15: TppDBText;
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Report_Frm: TReport_Frm;

implementation

uses DM_u;

{$R *.dfm}

procedure TReport_Frm.ppReport1PrintingComplete(Sender: TObject);
begin
  DM.ADO268.Edit;
  DM.ADO268Prted.AsBoolean:=true;
  DM.ADO268.Post;
end;

end.
