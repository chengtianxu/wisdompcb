unit Ureport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppBands, ppCtrls, ppBarCod, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppEndUsr, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppStrtch, ppMemo, ppModule, raCodMod;

type
  TfrmReport = class(TForm)
    ppDB268: TppDBPipeline;
    ADS268: TADODataSet;
    ADS268rkey: TAutoIncField;
    ADS268DSDesigner: TStringField;
    ADS268DSDesigner2: TDateTimeField;
    ADS268DSDesigner3: TStringField;
    ADS268DSDesigner4: TStringField;
    ADS268DSDesigner5: TDateTimeField;
    ADS268DSDesigner6: TStringField;
    ADS268DSDesigner7: TStringField;
    ADS268DSDesigner8: TStringField;
    ADS268DSDesigner9: TStringField;
    ADS268DSDesigner10: TStringField;
    ADS268DSDesigner11: TDateTimeField;
    ADS468: TADODataSet;
    ADS468DSDesigner: TFloatField;
    ADS468DSDesigner2: TFloatField;
    ADS468DSDesigner3: TStringField;
    ADS468DSDesigner4: TStringField;
    ADS468DSDesigner5: TStringField;
    ADS468DSDesigner6: TStringField;
    ADS468FLOW_NO: TIntegerField;
    ADS468DSDesigner7: TFloatField;
    strngfldADS468DSDesigner8: TStringField;
    ppDesigner1: TppDesigner;
    prprt2: TppReport;
    ppDB468: TppDBPipeline;
    ds268: TDataSource;
    ds468: TDataSource;
    ppTitleBand1: TppTitleBand;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppDBText8: TppDBText;
    ppLabel5: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText9: TppDBText;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    pdbrcd1: TppDBBarCode;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine2: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel6: TppLabel;
    ppLabel13: TppLabel;
    ppLabel11: TppLabel;
    ppLine6: TppLine;
    ppLabel17: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine7: TppLine;
    ppDBText7: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine5: TppLine;
    ppDBText1: TppDBText;
    ppDBText17: TppDBText;
    ppDBText6: TppDBText;
    ppDBText5: TppDBText;
    ppLine11: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel9: TppLabel;
    ppDBText4: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel15: TppLabel;
    ppDBText13: TppDBText;
    ppLabel16: TppLabel;
    ppDBText14: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppReport1: TppReport;
    ppTitleBand2: TppTitleBand;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppDBText15: TppDBText;
    ppLabel24: TppLabel;
    ppDBText16: TppDBText;
    ppLabel25: TppLabel;
    ppDBText18: TppDBText;
    ppLabel26: TppLabel;
    ppDBText19: TppDBText;
    ppLabel27: TppLabel;
    ppDBText20: TppDBText;
    ppLabel28: TppLabel;
    ppDBText21: TppDBText;
    ppDBBarCode1: TppDBBarCode;
    ppHeaderBand2: TppHeaderBand;
    ppShape2: TppShape;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLine18: TppLine;
    ppLabel34: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppLine19: TppLine;
    ppDBText22: TppDBText;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppLine26: TppLine;
    ppFooterBand2: TppFooterBand;
    ppLabel35: TppLabel;
    ppDBText27: TppDBText;
    ppLabel36: TppLabel;
    ppDBText28: TppDBText;
    ppLabel37: TppLabel;
    ppDBText29: TppDBText;
    ppLabel38: TppLabel;
    ppDBText30: TppDBText;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    procedure prprt2PrintingComplete(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ppReport1PrintingComplete(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
    Frkey:string;


  end;

var
  frmReport: TfrmReport;

implementation
    uses udm;
{$R *.dfm}

{ TfrmReport }

procedure TfrmReport.prprt2PrintingComplete(Sender: TObject);
var
  Lsql:string;
begin
   //Prted
   Lsql:='update data0268 set Prted=1 where  rkey='+Frkey;
   dm.execsql(dm.qrytemp,Lsql);
end;

procedure TfrmReport.FormCreate(Sender: TObject);
begin
      SetCurrentDir(extractfilepath(paramstr(0)));
     ppReport1.Template.FileName :=
     stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'Rep268_1.rtm';
end;

procedure TfrmReport.ppReport1PrintingComplete(Sender: TObject);
begin
  //
end;

end.
