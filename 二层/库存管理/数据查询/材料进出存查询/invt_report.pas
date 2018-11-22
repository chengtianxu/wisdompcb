unit invt_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppEndUsr, daDataModule, ppStrtch, ppMemo;

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
    ppDesigner1: TppDesigner;
    ppDesigner3: TppDesigner;
    ppDesigner2: TppDesigner;
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
    ppLabel32: TppLabel;
    ppLine21: TppLine;
    ppLine2: TppLine;
    ppLabel33: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine20: TppLine;
    ppLine22: TppLine;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDBCalc7: TppDBCalc;
    raCodeModule1: TraCodeModule;
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
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
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
    daDataModule1: TdaDataModule;
    pfldDB0022ppField32: TppField;
    ppHeaderBand3: TppHeaderBand;
    ppVariable3: TppVariable;
    ppSystemVariable7: TppSystemVariable;
    ppDBImage3: TppDBImage;
    pln1: TppLine;
    ppSystemVariable8: TppSystemVariable;
    ppSystemVariable9: TppSystemVariable;
    pdbtxtABBR_NAME: TppDBText;
    plbl15: TppLabel;
    plbl14: TppLabel;
    pdbtxtcode: TppDBText;
    plbl16: TppLabel;
    plbl17: TppLabel;
    plbl21: TppLabel;
    ppDetailBand3: TppDetailBand;
    pdbtxtDEPT_NAME: TppDBText;
    pdbtxtGON_NUMBER: TppDBText;
    pdbtxtTDATE: TppDBText;
    pdbtxtQUANTITY: TppDBText;
    pdbtxttax_PRICE: TppDBText;
    pdbtxtTAX_2: TppDBText;
    pdbtxttotal_price: TppDBText;
    plbl11: TppLabel;
    pdbtxtnote_info: TppDBText;
    pdbtxtPO_NUMBER: TppDBText;
    pftrbnd1: TppFooterBand;
    pgrp1: TppGroup;
    pgrphdrbnd1: TppGroupHeaderBand;
    pln4: TppLine;
    plbl10: TppLabel;
    plbl5: TppLabel;
    plbl4: TppLabel;
    plbl1: TppLabel;
    plbl2: TppLabel;
    plbl3: TppLabel;
    plbl6: TppLabel;
    plbl8: TppLabel;
    plbl7: TppLabel;
    plbl9: TppLabel;
    pgrpftrbnd1: TppGroupFooterBand;
    ppDBCalc11: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppLabel17: TppLabel;
    ppLine16: TppLine;
    plbl13: TppLabel;
    pln3: TppLine;
    pgrp2: TppGroup;
    pgrphdrbnd2: TppGroupHeaderBand;
    pdbtxtINV_DESCRIPTION: TppDBText;
    plbl18: TppLabel;
    plbl19: TppLabel;
    pdbtxtinv_name: TppDBText;
    pln5: TppLine;
    pgrpftrbnd2: TppGroupFooterBand;
    pln6: TppLine;
    plbl20: TppLabel;
    ppDBCalc12: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    raCodeModule3: TraCodeModule;
    ppReportCode: TppReport;
    ppHeaderBand5: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppLabel237: TppLabel;
    ppLabel241: TppLabel;
    ppDBText67: TppDBText;
    ppLabel242: TppLabel;
    ppLabel239: TppLabel;
    ppDBText65: TppDBText;
    ppLabel238: TppLabel;
    ppLabel240: TppLabel;
    ppDBText64: TppDBText;
    ppDBText66: TppDBText;
    ppDBText63: TppDBText;
    ppLabel244: TppLabel;
    ppDBText71: TppDBText;
    ppLabel245: TppLabel;
    ppDBText72: TppDBText;
    ppLabel246: TppLabel;
    ppDBText70: TppDBText;
    ppImage1: TppImage;
    ppDBMemo16: TppDBMemo;
    ppFooterBand5: TppFooterBand;
    ppDBPipelineCode: TppDBPipeline;
    ppDBPipelineCodeppField2: TppField;
    ppDBPipelineCodeppField3: TppField;
    ppDBPipelineCodeppField4: TppField;
    ppDBPipelineCodeppField5: TppField;
    ppDBPipelineCodeppField6: TppField;
    ppDBPipelineCodeppField7: TppField;
    ppDBPipelineCodeppField8: TppField;
    ppDBPipelineCodeppField9: TppField;
    ppDBPipelineCodeppField10: TppField;
    ppDBPipelineCodeppField11: TppField;
    ppDBPipelineCodeppField12: TppField;
    ppDBPipelineCodeppField13: TppField;
    ppDBPipelineCodeppField14: TppField;
    ppDBPipelineCodeppField15: TppField;
    ppDBPipelineCodeppField16: TppField;
    ppDBPipelineCodeppField17: TppField;
    ppDBPipelineCodeppField18: TppField;
    ppDBPipelineCodeppField19: TppField;
    ppDBPipelineCodeppField20: TppField;
    ppDBPipelineCodeppField21: TppField;
    ppDBPipelineCodeppField22: TppField;
    ppDBPipelineCodeppField23: TppField;
    ppDBPipelineCodeppField24: TppField;
    ppDBPipelineCodeppField25: TppField;
    ppDBPipelineCodeppField26: TppField;
    ppDBPipelineCodeppField27: TppField;
    ppDBPipelineCodeppField28: TppField;
    ppDBPipelineCodeppField29: TppField;
    ppDBPipelineCodeppField30: TppField;
    ppDBPipelineCodeppField32: TppField;
    ppDBPipelineCodeppField1: TppField;
    ppDBPipelineCodeppField31: TppField;
    ppDBPipelineCodeppField33: TppField;
    dsCode: TDataSource;
    qryCode: TADOQuery;
    qryCodeDSDesigner2: TStringField;
    qryCodeDSDesigner3: TStringField;
    qryCodeDSDesigner4: TDateTimeField;
    qryCodeIQC: TStringField;
    qryCodeDSDesigner5: TStringField;
    qryCodeDSDesigner6: TStringField;
    qryCodeDSDesigner7: TStringField;
    qryCodeDSDesigner8: TStringField;
    qryCodeDSDesigner9: TStringField;
    qryCodeDSDesigner10: TStringField;
    qryCodeDSDesigner11: TStringField;
    qryCodeSGS: TStringField;
    qryCodeSGS2: TDateTimeField;
    qryCodeDSDesigner12: TBCDField;
    qryCodeDSDesigner13: TBCDField;
    qryCodeDSDesigner14: TStringField;
    qryCodeDSDesigner15: TDateTimeField;
    qryCodeIQC2: TDateTimeField;
    qryCodeIQC3: TDateTimeField;
    qryCodeDSDesigner16: TStringField;
    qryCodeDSDesigner17: TWideStringField;
    qryCodeDSDesigner18: TStringField;
    qryCodeDSDesigner19: TStringField;
    qryCodeDSDesigner20: TBCDField;
    qryCodeDSDesigner22: TWideStringField;
    qryCodeDSDesigner23: TWideStringField;
    qryCodeDSDesigner24: TWideStringField;
    qryCodeDSDesigner25: TStringField;
    qryCodeCAF: TWideStringField;
    qryCodeDSDesigner21: TStringField;
    qryCodeDSDesigner: TAutoIncField;
    qryCodeDSDesigner26: TStringField;
    qryCodeDSDesigner27: TStringField;
    ppDesignerCode: TppDesigner;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure ppReport2PreviewFormCreate(Sender: TObject);
    procedure ppReport3PreviewFormCreate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppDBPipelineCodeNext(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure Get2DCodeBmp(AText: string;APic: TPicture);
  end;

var
  Form_report: TForm_report;

implementation
uses main,inventory,outsql,invt_quan,qrcode;
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

procedure TForm_report.Get2DCodeBmp(AText: string; APic: TPicture);
var
  LCode2d: TQRCodeGraphic;
  LbtMap: TGraphic;
begin
  LCode2d := TQRCodeGraphic.Create();
  try
    LCode2d.Margin := 3;
    LCode2d.BlockSize := 2;
    LCode2d.Text := AText;
    APic.Assign(LCode2d);
  finally
    LCode2d.Free;
  end;
end;

procedure TForm_report.ppDBPipelineCodeNext(Sender: TObject);
var
  Img2DBar: TppImage;
  I,J: Integer;
  LText: string;
begin
  ppReportCode.ObjectByName(I,J,'ppImage1');
  Img2DBar := ppReportCode.Bands[I].Objects[J] as TppImage;
  LText := qryCode.fieldbyname('ÌõÂë±àºÅ').AsString;
  Get2DCodeBmp(LText,Img2DBar.Picture);
end;

end.
