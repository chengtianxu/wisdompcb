unit report_comein;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppCtrls, ppPrnabl,
  ppClass, ppBands, ppCache, ppProd, ppReport, ppEndUsr;

type
  TF_partin_report = class(TForm)
    aq416: TADOQuery;
    DataSource1: TDataSource;
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
    DataSource2: TDataSource;
    ppDB493: TppDBPipeline;
    DataSource3: TDataSource;
    aq53: TADOQuery;
    ppDB53: TppDBPipeline;
    ppReport1: TppReport;
    ppDB416: TppDBPipeline;
    aq416rkey: TIntegerField;
    aq416DSDesigner: TStringField;
    aq416DSDesigner2: TStringField;
    aq416DSDesigner3: TStringField;
    aq416DSDesigner4: TDateTimeField;
    aq416DSDesigner5: TBCDField;
    aq416DSDesigner6: TStringField;
    aq416DSDesigner7: TStringField;
    aq416DSDesigner8: TStringField;
    aq416DSDesigner9: TStringField;
    aq416DSDesigner10: TStringField;
    aq416DSDesigner11: TStringField;
    ppDesigner1: TppDesigner;
    aq416DSDesigner12: TStringField;
    aq53DSDesigner: TStringField;
    aq53DSDesigner2: TStringField;
    aq53DSDesigner3: TStringField;
    aq53DSDesigner4: TStringField;
    aq53DSDesigner5: TStringField;
    aq53DSDesigner6: TBCDField;
    aq53DSDesigner7: TStringField;
    aq53DSDesigner8: TStringField;
    aq53DSDesigner9: TStringField;
    pfldDB53ppField9: TppField;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    plbl1: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    pdbtxt1: TppDBText;
    ppFooterBand1: TppFooterBand;
    procedure aq416CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_partin_report: TF_partin_report;

implementation

uses damo;

{$R *.dfm}

procedure TF_partin_report.aq416CalcFields(DataSet: TDataSet);
begin
 {case self.AQ416type.Value of
  1:self.AQ416C_type.Value:='直接入仓';
  2:self.AQ416C_type.Value:='过数入仓';
  3:self.AQ416C_type.Value:='委外入仓';
  4:self.AQ416C_type.Value:='退货入仓';
  5:self.AQ416C_type.Value:='转换入仓';
  6:self.AQ416C_type.Value:='盘点入仓';
 end;}
end;

end.
