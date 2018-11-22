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
    ppDB740: TppDBPipeline;
    DataSource3: TDataSource;
    ppDB493: TppDBPipeline;
    DataSource4: TDataSource;
    ppDB738: TppDBPipeline;
    ppTitleBand1: TppTitleBand;
    ppDBImage1: TppDBImage;
    ppDBText2: TppDBText;
    ppLine1: TppLine;
    ppLine19: TppLine;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine5: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine9: TppLine;
    ppDBText1: TppDBText;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine14: TppLine;
    ppLine18: TppLine;
    ppFooterBand1: TppFooterBand;
    ppDesigner1: TppDesigner;
    aq493: TADOQuery;
    aq493Company_Name: TStringField;
    aq493Company_Name2: TStringField;
    aq493Company_Name3: TStringField;
    aq493ship_address: TStringField;
    aq493Company_Icon: TBlobField;
    aq493SITE_INFO_ADD_1: TStringField;
    aq493SITE_INFO_ADD_2: TStringField;
    aq493SITE_INFO_ADD_3: TStringField;
    aq493SITE_INFO_PHONE: TStringField;
    DataSource1: TDataSource;
    aq740: TADOQuery;
    aq738: TADOQuery;
    aq738DSDesigner: TStringField;
    aq738DSDesigner2: TStringField;
    aq738DSDesigner3: TStringField;
    ppLabel10: TppLabel;
    ppLabel1: TppLabel;
    ppDBText3: TppDBText;
    ppLabel2: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppDBText9: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel7: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLine4: TppLine;
    ppLine6: TppLine;
    aq005: TADOQuery;
    DataSource2: TDataSource;
    ppDB0005: TppDBPipeline;
    aq005EMPLOYEE_NAME: TStringField;
    aq740DSDesigner: TStringField;
    aq740DSDesigner2: TStringField;
    aq740DSDesigner3: TWideStringField;
    aq740DSDesigner4: TWideStringField;
    aq740FA: TWideStringField;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses uDM,uMain;

{$R *.dfm}

procedure TForm_report.ppReport1PreviewFormCreate(Sender: TObject);
begin
//ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
