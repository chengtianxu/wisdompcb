unit Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppComm, ppRelatv, ppDB, ppDBPipe, ppEndUsr, ppProd,
  ppClass, ppReport;

type
  TfrmReports = class(TForm)
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
    adsRpt: TADODataSet;
    dsRpt: TDataSource;
    ppDB: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    adsRptDSDesigner: TStringField;
    adsRptDSDesigner2: TDateTimeField;
    adsRptDSDesigner3: TStringField;
    adsRptDSDesigner4: TDateTimeField;
    adsRptDSDesigner5: TStringField;
    adsRptDSDesigner6: TStringField;
    adsRptDSDesigner7: TStringField;
    adsRptDSDesigner8: TStringField;
    adsRptDSDesigner9: TStringField;
    adsRptDSDesigner10: TStringField;
    adsRptDSDesigner11: TStringField;
    adsRptDSDesigner12: TIntegerField;
    adsRptDSDesigner13: TDateTimeField;
    adsRptDSDesigner14: TDateTimeField;
    adsRptDSDesigner15: TIntegerField;
    adsRptDSDesigner16: TStringField;
    adsRptDSDesigner17: TStringField;
    adsRptDSDesigner18: TIntegerField;
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
