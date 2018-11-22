unit report_data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ppDB, ppDBPipe, ppEndUsr, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppBands, ppCache, ADODB, ppPrnabl, ppCtrls, ppModule, raCodMod,
  ppMemo, ppStrtch;

type
  TForm_Report = class(TForm)
    ppDesigner1: TppDesigner;
    ppDB723: TppDBPipeline;
    DataSource1: TDataSource;
    ppDB73: TppDBPipeline;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADOQuery1: TADOQuery;
    ppDB493: TppDBPipeline;
    ADOQuery1Company_Name: TStringField;
    ADOQuery1Company_Name2: TStringField;
    ADOQuery1Company_Name3: TStringField;
    ADOQuery1ship_address: TStringField;
    ADOQuery1Company_Icon: TBlobField;
    ADOQuery1SITE_INFO_ADD_1: TStringField;
    ADOQuery1SITE_INFO_ADD_2: TStringField;
    ADOQuery1SITE_INFO_ADD_3: TStringField;
    ADOQuery1SITE_INFO_PHONE: TStringField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBText7: TppDBText;
    ppLabel17: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppLine5: TppLine;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Report: TForm_Report;

implementation

{$R *.dfm}
uses demo;
procedure TForm_Report.FormCreate(Sender: TObject);
begin
adoquery1.Open;
end;

end.
