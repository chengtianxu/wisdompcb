unit Report3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB,
  StdCtrls, ppStrtch, ppMemo, ppEndUsr;

type
  TFrmReport3 = class(TForm)
    ADOData0493: TADOQuery;
    DataSource1: TDataSource;
    DataSource4: TDataSource;
    ppReport1: TppReport;
    Data0493: TppDBPipeline;
    SO_Info: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppDBText22: TppDBText;
    ppLabel19: TppLabel;
    ppLabel21: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel33: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel20: TppLabel;
    ppLabel22: TppLabel;
    ppLabel30: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel18: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText11: TppDBText;
    ppDBText13: TppDBText;
    ppDBText15: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppVariable1: TppVariable;
    ppLine25: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSummaryBand1: TppSummaryBand;
    ppVariable3: TppVariable;
    ppLabel34: TppLabel;
    ppVariable4: TppVariable;
    ppLabel35: TppLabel;
    ppVariable5: TppVariable;
    ppLabel36: TppLabel;
    ppVariable6: TppVariable;
    ppLabel37: TppLabel;
    ppVariable7: TppVariable;
    ppLabel38: TppLabel;
    ppVariable8: TppVariable;
    ppLabel39: TppLabel;
    ppVariable9: TppVariable;
    ppLabel40: TppLabel;
    ppLine26: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc1: TppDBCalc;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine22: TppLine;
    raCodeModule1: TraCodeModule;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport3: TFrmReport3;

implementation

uses uDM;


{$R *.dfm}

procedure TFrmReport3.ppReport1PreviewFormCreate(Sender: TObject);
begin
  ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
