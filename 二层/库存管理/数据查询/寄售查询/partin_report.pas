unit partin_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport;

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
    ppDB53: TppDBPipeline;
    ppReport1: TppReport;
    ppDB53_in: TppDBPipeline;
    ppReport2: TppReport;
    ppReport3: TppReport;
    ppDB52: TppDBPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppVariable1: TppVariable;
    ppDBImage1: TppDBImage;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLine2: TppLine;
    ppLine1: TppLine;
    ppLabel8: TppLabel;
    ppLabel4: TppLabel;
    ppLabel20: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel34: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    raCodeModule1: TraCodeModule;
    ppHeaderBand2: TppHeaderBand;
    ppLabel9: TppLabel;
    ppVariable2: TppVariable;
    ppDBImage2: TppDBImage;
    ppLine3: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText12: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText29: TppDBText;
    ppLabel35: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel36: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    raCodeModule2: TraCodeModule;
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
    ppLabel19: TppLabel;
    ppDBText9: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel33: TppLabel;
    raCodeModule3: TraCodeModule;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure ppReport2PreviewFormCreate(Sender: TObject);
    procedure ppReport3PreviewFormCreate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation
uses main,part_in,part_out,part_quantity;
{$R *.dfm}

procedure TForm_report.ppReport1PreviewFormCreate(Sender: TObject);
begin
 ppReport1.PreviewForm.WindowState := wsMaximized;
end;

procedure TForm_report.ppReport2PreviewFormCreate(Sender: TObject);
begin
 ppReport2.PreviewForm.WindowState := wsMaximized;
end;

procedure TForm_report.ppReport3PreviewFormCreate(Sender: TObject);
begin
 ppReport3.PreviewForm.WindowState := wsMaximized;
end;

procedure TForm_report.FormCreate(Sender: TObject);
begin
 adodata0493.Open;
end;

end.
