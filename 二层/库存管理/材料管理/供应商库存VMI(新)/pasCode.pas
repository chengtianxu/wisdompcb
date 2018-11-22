unit pasCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, DB, ADODB, ppDB, ppDBPipe, ppBands, ppStrtch, ppMemo,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport;

type
  TfrmCode = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Get2DCodeBmp(AText: string;APic: TPicture);
  end;

var
  frmCode: TfrmCode;

implementation

uses demo,qrcode;

{$R *.dfm}

{ TfrmCode }

procedure TfrmCode.Get2DCodeBmp(AText: string; APic: TPicture);
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

end.
