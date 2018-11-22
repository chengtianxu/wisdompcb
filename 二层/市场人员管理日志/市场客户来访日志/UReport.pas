unit UReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppModule, raCodMod, ppBands, ppClass, ppVar, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppCache, ppProd, ppReport, ppDB, ppComm,
  ppRelatv, ppDBPipe, DB, ADODB, jpeg;

type
  TReport_Form = class(TForm)
    ADS722: TADODataSet;
    DataSource1: TDataSource;
    ppDB722: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ADS722rkey: TIntegerField;
    ADS722DSDesigner: TStringField;
    ADS722DSDesigner2: TStringField;
    ADS722DSDesigner3: TDateTimeField;
    ADS722DSDesigner4: TStringField;
    ADS722DSDesigner5: TStringField;
    ADS722DSDesigner6: TStringField;
    ADS722DSDesigner7: TStringField;
    ADS722PCB: TStringField;
    ADS722DSDesigner8: TStringField;
    ADS722DSDesigner9: TStringField;
    ADS722DSDesigner10: TStringField;
    ADS722DSDesigner11: TStringField;
    ADS722DSDesigner12: TStringField;
    ADS722DSDesigner13: TStringField;
    ADS722isUpdate: TBooleanField;
    ADS722status: TIntegerField;
    ADS722ReportID: TIntegerField;
    ADS722DSDesigner14: TDateTimeField;
    ADS722AuditID: TIntegerField;
    ADS722DSDesigner15: TStringField;
    ADS722DSDesigner16: TDateTimeField;
    ADS722status_c: TStringField;
    ADS722DSDesigner17: TStringField;
    ADS722USER_LOGIN_NAME: TStringField;
    ADS722USER_FULL_NAME_A: TStringField;
    ADS722USER_LOGIN_NAME_A: TStringField;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine3: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel21: TppLabel;
    ppLabel13: TppLabel;
    ppDBText1: TppDBText;
    ppLabel14: TppLabel;
    ppDBText3: TppDBText;
    ppLabel15: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText7: TppDBText;
    ppLabel22: TppLabel;
    ppDBText8: TppDBText;
    ppLine8: TppLine;
    ppLabel18: TppLabel;
    ppDBText4: TppDBText;
    ppLabel19: TppLabel;
    ppDBText9: TppDBText;
    ppLine9: TppLine;
    ppLine25: TppLine;
    ppLabel20: TppLabel;
    ppLabel23: TppLabel;
    ppLabel30: TppLabel;
    ppDBText10: TppDBText;
    ppLabel31: TppLabel;
    ppDBText11: TppDBText;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppDBText13: TppDBText;
    ppLabel34: TppLabel;
    ppDBText14: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel4: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppLabel35: TppLabel;
    ppLabel42: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText12: TppDBText;
    ppDBImage1: TppDBImage;
    ppDBMemo1: TppDBMemo;
    DataSource2: TDataSource;
    ppDB493: TppDBPipeline;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Report_Form: TReport_Form;

implementation

uses Udm;

{$R *.dfm}

procedure TReport_Form.FormCreate(Sender: TObject);
var j:integer;
    procedure crtLab(s:string);
    var i:integer;
        str:string;
        Lb: TComponent;
    begin
      str:=s;
      if str<>'' then
      begin
        i:=pos('&',str);
        while i<>0 do
        begin
          Lb:=FindComponent('ppLabel'+inttostr(j));
          if Lb<>nil then TppLabel(Lb).Caption:=copy(str,1,i-1);
          str:=copy(str,i+1,length(str)-i);
          inc(j);
          i:=pos('&',str);
          //showmessage(str);
        end;
        TppLabel(FindComponent('ppLabel'+inttostr(j))).Caption:=str;
      end;
    end;
begin
  ADS722.Close;
  ADS722.Parameters[0].Value:=DM.ADO722rkey.Value;
  ADS722.Open;
  j:=24;
  crtLab(ADS722.fieldbyname('来访人员').AsString);
  j:=36;
  crtLab(ADS722.fieldbyname('接待人员').AsString);
end;
end.
