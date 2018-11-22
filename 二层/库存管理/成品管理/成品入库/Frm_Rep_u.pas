unit Frm_Rep_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppDB, ppDBPipe, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, DB, ADODB, ppBands, ppCache, ppPrnabl, ppCtrls, ppVar;

type
  TFrm_Rep = class(TForm)
    ADOQ53: TADOQuery;
    ppDBPipeline1: TppDBPipeline;
    DataSource1: TDataSource;
    ppDesigner1: TppDesigner;
    ADOQ416: TADOQuery;
    ppDBPipeline2: TppDBPipeline;
    DataSource2: TDataSource;
    ADOQ493: TADOQuery;
    ppDBPipeline3: TppDBPipeline;
    DataSource3: TDataSource;
    ppReport2: TppReport;
    ppDesigner2: TppDesigner;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel11: TppLabel;
    ppDBText2: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel12: TppLabel;
    ppLabel21: TppLabel;
    ppDBText3: TppDBText;
    ppLabel22: TppLabel;
    ppDBText4: TppDBText;
    ppLabel23: TppLabel;
    ppDBText5: TppDBText;
    ppLine1: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppDBText20: TppDBText;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppSystemVariable4: TppSystemVariable;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppSummaryBand2: TppSummaryBand;
    ppLabel30: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppHeaderBand2: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText1: TppDBText;
    ppDBImage2: TppDBImage;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText9: TppDBText;
    ppLabel5: TppLabel;
    ppDBText10: TppDBText;
    ppLabel8: TppLabel;
    ppDBText11: TppDBText;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText19: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppDBText16: TppDBText;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel31: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBCalc4: TppDBCalc;
    ppLabel32: TppLabel;

    procedure ppDBText11Print(Sender: TObject);
    procedure ppHeaderBand2BeforePrint(Sender: TObject);
    procedure ppLabel29Print(Sender: TObject);
    procedure ppLabel18Print(Sender: TObject);
  private
    s:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Rep: TFrm_Rep;

implementation

uses DM_u;


{$R *.dfm}

procedure TFrm_Rep.ppDBText11Print(Sender: TObject);
begin
  if s=ADOQ53.Fields[0].AsString then
  begin
    ppDBText12.Visible:=false;
    ppDBText13.Visible:=false;
    ppDBText19.Visible:=false;
  end else begin
    ppDBText12.Visible:=true;
    ppDBText13.Visible:=true;
    ppDBText19.Visible:=true;
    s:=ADOQ53.Fields[0].AsString;
  end;
end;

procedure TFrm_Rep.ppHeaderBand2BeforePrint(Sender: TObject);
begin
  s:='';
end;

procedure TFrm_Rep.ppLabel29Print(Sender: TObject);
begin
  ppLabel29.Caption:=user_Nm;
end;

procedure TFrm_Rep.ppLabel18Print(Sender: TObject);
begin
   ppLabel18.Caption:=user_Nm;
end;

end.
