unit Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppProd, ppClass, ppReport, ppDB, DB, ADODB, ppRelatv,
  ppDBPipe, ppComm, ppBands, ppCache, ppModule, daDataModule;

type
  TfrmReports = class(TForm)
    ppDesigner1: TppDesigner;
    dsRpt167: TDataSource;
    ppDB493: TppDBPipeline;
    dsRpt493: TDataSource;
    adsRpt493: TADODataSet;
    adsRpt493Company_Name: TStringField;
    adsRpt493Company_Name2: TStringField;
    adsRpt493Company_Name3: TStringField;
    adsRpt493ship_address: TStringField;
    adsRpt493Company_Icon: TBlobField;
    adsRpt493SITE_INFO_ADD_1: TStringField;
    adsRpt493SITE_INFO_ADD_2: TStringField;
    adsRpt493SITE_INFO_ADD_3: TStringField;
    adsRpt493SITE_INFO_PHONE: TStringField;
    adsRpt167: TADODataSet;
    ppReport1: TppReport;
    ppDB167: TppDBPipeline;
    ppDBProd: TppDBPipeline;
    adsProd: TADODataSet;
    dsProd: TDataSource;
    ppReport2: TppReport;
    ppDesigner2: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    daDataModule1: TdaDataModule;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReports: TfrmReports;

implementation

uses damo;

{$R *.dfm}





end.
