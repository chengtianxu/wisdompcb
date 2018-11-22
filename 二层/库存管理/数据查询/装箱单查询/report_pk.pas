unit report_pk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppProd, ppClass,
  ppReport, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppCache;

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
    ppDB439: TppDBPipeline;
    ppReport1: TppReport;
    ppDB530: TppDBPipeline;
    ppReport2: TppReport;
    ppDBS112: TppDBPipeline;
    ppReport3: TppReport;
    ppReport4: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppDBImage4: TppDBImage;
    ppVariable4: TppVariable;
    ppLabel54: TppLabel;
    ppLine10: TppLine;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLine11: TppLine;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel65: TppLabel;
    ppLabel72: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel55: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppFooterBand4: TppFooterBand;
    raCodeModule4: TraCodeModule;
    ppHeaderBand3: TppHeaderBand;
    ppVariable3: TppVariable;
    ppLabel33: TppLabel;
    ppLine7: TppLine;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLine8: TppLine;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel37: TppLabel;
    ppLabel45: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppDBImage3: TppDBImage;
    ppDetailBand3: TppDetailBand;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLine9: TppLine;
    raCodeModule3: TraCodeModule;
    ppHeaderBand2: TppHeaderBand;
    ppDBImage2: TppDBImage;
    ppVariable2: TppVariable;
    ppLabel16: TppLabel;
    ppLine4: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLine5: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine6: TppLine;
    raCodeModule2: TraCodeModule;
    ppHeaderBand1: TppHeaderBand;
    ppDBImage1: TppDBImage;
    ppVariable1: TppVariable;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine2: TppLine;
    raCodeModule1: TraCodeModule;
    ppDBt112: TppDBPipeline;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure ppReport2PreviewFormCreate(Sender: TObject);
    procedure ppReport3PreviewFormCreate(Sender: TObject);
    procedure ppReport4PreviewFormCreate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation
uses main,packlist,ship_advice,invoice_sql,toolinvoice;
{$R *.dfm}

procedure TForm_report.ppReport1PreviewFormCreate(Sender: TObject);
begin
// ppReport1.PreviewForm.WindowState := wsMaximized;
end;

procedure TForm_report.ppReport2PreviewFormCreate(Sender: TObject);
begin
 ppReport2.PreviewForm.WindowState := wsMaximized;
end;

procedure TForm_report.ppReport3PreviewFormCreate(Sender: TObject);
begin
 ppReport3.PreviewForm.WindowState := wsMaximized;
end;

procedure TForm_report.ppReport4PreviewFormCreate(Sender: TObject);
begin
 ppReport4.PreviewForm.WindowState := wsMaximized;
end;

procedure TForm_report.FormCreate(Sender: TObject);
begin
 adodata0493.Open;
end;

end.
