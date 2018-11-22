unit invt_report;

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
    ppDB22: TppDBPipeline;
    ppReport1: TppReport;
    ppDB0022: TppDBPipeline;
    ppReport2: TppReport;
    ppDB207: TppDBPipeline;
    ppReport3: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppVariable3: TppVariable;
    ppSystemVariable7: TppSystemVariable;
    ppDBImage3: TppDBImage;
    ppLine16: TppLine;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel28: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText24: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText26: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText16: TppDBText;
    ppLabel17: TppLabel;
    ppDBText17: TppDBText;
    ppLabel18: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBCalc5: TppDBCalc;
    ppLabel29: TppLabel;
    ppDBCalc6: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppDBText18: TppDBText;
    ppLabel19: TppLabel;
    ppDBText21: TppDBText;
    ppLabel20: TppLabel;
    ppLabel27: TppLabel;
    ppDBText25: TppDBText;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLine17: TppLine;
    ppLabel21: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLine18: TppLine;
    raCodeModule3: TraCodeModule;
    ppHeaderBand2: TppHeaderBand;
    ppVariable2: TppVariable;
    ppDBImage2: TppDBImage;
    ppLine13: TppLine;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel14: TppLabel;
    ppSystemVariable6: TppSystemVariable;
    ppSystemVariable5: TppSystemVariable;
    ppLabel30: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText7: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText8: TppDBText;
    ppLabel7: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine15: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel13: TppLabel;
    ppLine14: TppLine;
    ppDBCalc2: TppDBCalc;
    raCodeModule2: TraCodeModule;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppVariable1: TppVariable;
    ppDBImage1: TppDBImage;
    ppSystemVariable1: TppSystemVariable;
    ppLine1: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine19: TppLine;
    ppLabel31: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine2: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine20: TppLine;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppFooterBand1: TppFooterBand;
    raCodeModule1: TraCodeModule;
    ppLabel32: TppLabel;
    ppLine21: TppLine;
    ppLine22: TppLine;
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
uses main,inventory,outsql,invt_quan;
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
