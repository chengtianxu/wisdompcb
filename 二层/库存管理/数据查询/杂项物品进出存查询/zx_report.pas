unit zx_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, daDataModule, ppModule, raCodMod, ppCtrls, ppBands,
  ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm,
  ppRelatv, ppDBPipe, DB, ADODB;

type
  TForm_report = class(TForm)
    ADOdata0493: TADOQuery;
    ADOdata0493Company_Name: TStringField;
    ADOdata0493ship_address: TStringField;
    ADOdata0493Company_Icon: TBlobField;
    ADOdata0493SITE_INFO_ADD_1: TStringField;
    ADOdata0493SITE_INFO_ADD_2: TStringField;
    ADOdata0493SITE_INFO_ADD_3: TStringField;
    ADOdata0493SITE_INFO_PHONE: TStringField;
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppDB456: TppDBPipeline;
    v_type: TppField;
    ppHeaderBand2: TppHeaderBand;
    ppVariable2: TppVariable;
    ppDBImage2: TppDBImage;
    ppLine13: TppLine;
    ppLabel10: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel30: TppLabel;
    ppDBText11: TppDBText;
    ppLabel18: TppLabel;
    ppDBText17: TppDBText;
    ppLabel20: TppLabel;
    ppLabel19: TppLabel;
    ppLabel24: TppLabel;
    ppLabel1: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine25: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText8: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel11: TppLabel;
    ppLabel14: TppLabel;
    ppLine17: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel21: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppLabel22: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppLine18: TppLine;
    ppLabel7: TppLabel;
    ppDBText7: TppDBText;
    ppDBText16: TppDBText;
    ppLabel23: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine15: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel13: TppLabel;
    ppLine14: TppLine;
    ppDBCalc2: TppDBCalc;
    raCodeModule2: TraCodeModule;
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

end.
