unit BzReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ppEndUsr, ppBands, ppCtrls, ppClass, ppVar, ppStrtch,
  ppMemo, ppPrnabl, ppCache, ppComm, ppRelatv, ppProd, ppReport, ADODB,
  ppDB, ppDBPipe, ppBarCod;

type
  TForm_BzReport = class(TForm)
    ADO493: TADOQuery;
    ADO493Company_Name: TStringField;
    ADO493Company_Name2: TStringField;
    ADO493Company_Name3: TStringField;
    ADO493ship_address: TStringField;
    ADO493Company_Icon: TBlobField;
    ADO493SITE_INFO_ADD_1: TStringField;
    ADO493SITE_INFO_ADD_2: TStringField;
    ADO493SITE_INFO_ADD_3: TStringField;
    ADO493SITE_INFO_PHONE: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBImage1: TppDBImage;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppDBBarCode1: TppDBBarCode;
    ppShape6: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBMemo3: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDesigner1: TppDesigner;
    ADO22: TADOQuery;
    ADO22DSDesigner: TStringField;
    ADO22DSDesigner2: TStringField;
    ADO22DSDesigner3: TStringField;
    ADO22DSDesigner4: TStringField;
    ADO22DSDesigner5: TStringField;
    ADO22DSDesigner6: TStringField;
    ADO22DSDesigner7: TStringField;
    ADO22DSDesigner8: TFloatField;
    ADO22DSDesigner10: TStringField;
    ADO22rkey17: TAutoIncField;
    ADO22rkey23: TAutoIncField;
    ADO22FloatField: TFloatField;
    ppDB493: TppDBPipeline;
    ppDBP493ppField1: TppField;
    ppDBP493ppField2: TppField;
    ppDBP493ppField3: TppField;
    ppDBP493ppField4: TppField;
    ppDBP493ppField5: TppField;
    ppDBP493ppField6: TppField;
    ppDBP493ppField7: TppField;
    ppDBP493ppField8: TppField;
    ppDBP493ppField9: TppField;
    ADOQuery1: TADOQuery;
    ADOQuery1qty: TBCDField;
    ppDB22: TppDBPipeline;
    ppDB22ppField1: TppField;
    ppDB22ppField2: TppField;
    ppDB22ppField3: TppField;
    ppDB22ppField4: TppField;
    ppDB22ppField5: TppField;
    ppDB22ppField6: TppField;
    ppDB22ppField7: TppField;
    ppDB22ppField8: TppField;
    ppDB22ppField9: TppField;
    ppDB22ppField12: TppField;
    procedure ADO22CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_BzReport: TForm_BzReport;

implementation

uses main;


{$R *.dfm}

procedure TForm_BzReport.ADO22CalcFields(DataSet: TDataSet);
begin
 with ADOQuery1 do
 begin
  Close;
  Parameters[0].Value:=ADO22rkey17.Value;
  Parameters[1].Value:=ADO22rkey23.Value;
  Open;
 end;
 ADO22FloatField.Value:=ADOQuery1qty.Value;
end;

end.
