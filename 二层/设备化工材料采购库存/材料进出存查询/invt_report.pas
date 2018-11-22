unit invt_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppModule, raCodMod,
  ppBands, ppCtrls, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppEndUsr, daDataModule;

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
