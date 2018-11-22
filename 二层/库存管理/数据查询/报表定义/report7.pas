unit report7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppModule, raCodMod, ppCtrls, ppBands, ppClass, ppVar,
  ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB;

type
  TFrmreport7 = class(TForm)
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    DataSource4: TDataSource;
    ppReport3: TppReport;
    ppDesigner3: TppDesigner;
    ppDB52: TppDBPipeline;
    ppHeaderBand3: TppHeaderBand;
    ppDBImage3: TppDBImage;
    ppLabel22: TppLabel;
    ppVariable3: TppVariable;
    ppLine6: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText11: TppDBText;
    ppDBText28: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText10: TppDBText;
    ppLabel21: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText20: TppDBText;
    ppLabel23: TppLabel;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel33: TppLabel;
    raCodeModule3: TraCodeModule;
    ppDB52ppField5: TppField;
    ppDB52ppField27: TppField;
    procedure ppReport3PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmreport7: TFrmreport7;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmreport7.ppReport3PreviewFormCreate(Sender: TObject);
begin
 ppReport3.PreviewForm.WindowState := wsMaximized;
end;

end.
