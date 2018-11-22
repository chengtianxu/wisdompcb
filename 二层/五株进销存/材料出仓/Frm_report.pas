unit Frm_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB,
  ADODB, ppCtrls, ppPrnabl, ppBands, ppCache, ppEndUsr;

type
  Treport_issue = class(TForm)
    DataSource1: TDataSource;
    ppDB1: TppDBPipeline;
    ppReport1: TppReport;
    DataSource3: TDataSource;
    ADO493: TADOQuery;
    ppDB493: TppDBPipeline;
    ADO493DSDesigner1: TStringField;
    ADO493DSDesigner2: TStringField;
    ADO493DSDesigner3: TStringField;
    ADO493DSDesigner: TStringField;
    ADO493DSDesigner4: TBlobField;
    ADO493DSDesigner12: TStringField;
    ADO493DSDesigner22: TStringField;
    ADO493DSDesigner32: TStringField;
    ADO493DSDesigner5: TStringField;
    ppDesigner1: TppDesigner;
    DataSource2: TDataSource;
    ppDB2: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppFooterBand1: TppFooterBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  report_issue: Treport_issue;

implementation

uses DM_u, Frm_main_u;

{$R *.dfm}

end.
