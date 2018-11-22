unit ufrmGl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppBands, ppCache, ppClass, ppProd, ppReport, ppEndUsr, ppComm,
  ppRelatv, ppDB, ppDBPipe, DB, ADODB, ppPrnabl, ppCtrls, ppVar;

type
  TfrmGL = class(TForm)
    DB519: TppDBPipeline;
    ppDesigner1: TppDesigner;
    DataSource1: TDataSource;
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField2: TppField;
    ppDBPipeline1ppField3: TppField;
    ppDBPipeline1ppField4: TppField;
    ppDBPipeline1ppField5: TppField;
    ppDBPipeline1ppField6: TppField;
    ppDBPipeline1ppField7: TppField;
    ppDBPipeline1ppField8: TppField;
    ds519: TADODataSet;
    ds519RKEY: TAutoIncField;
    ds519GL_ACC_NUMBER: TStringField;
    ds519GL_DESCRIPTION: TStringField;
    ds519PERIOD: TStringField;
    ds519SUMMARIZE: TStringField;
    ds519DEBIT: TBCDField;
    ds519CREDIT: TBCDField;
    ds519DB_CR: TStringField;
    ds519BALANCE: TBCDField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppSystemVariable1: TppSystemVariable;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel10: TppLabel;
    ppLine18: TppLine;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine6: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine7: TppLine;
    ppLine19: TppLine;
    ppDBText8: TppDBText;
    ppLine1: TppLine;
    ppLine5: TppLine;
    ppLine2: TppLine;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSystemVariable2: TppSystemVariable;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppPageStyle1: TppPageStyle;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    procedure ppReport1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGL: TfrmGL;

implementation

uses damo;

{$R *.dfm}

procedure TfrmGL.ppReport1BeforePrint(Sender: TObject);
begin
 if ds519.Active =false then
   ds519.Open ;
end;

end.
