unit Report14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB,
  StdCtrls, ppEndUsr,Raide;

type
  TFrmReport14 = class(TForm)
    DataSource3: TDataSource;
    ppReport1: TppReport;
    ppColumnHeaderBand1: TppColumnHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppShape4: TppShape;
    Barcode_Id: TppVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    IQC_Flag: TppVariable;
    ppColumnFooterBand1: TppColumnFooterBand;
    raCodeModule1: TraCodeModule;
    ADOQuery1: TADOQuery;
    ADOQuery1barcode_id: TStringField;
    ADOQuery1inv_part_number: TStringField;
    ADOQuery1inv_part_description: TStringField;
    ADOQuery1inspect: TStringField;
    ADOQuery1unit_code: TStringField;
    ADOQuery1tdate: TDateTimeField;
    ADOQuery1expire_date: TDateTimeField;
    ADOQuery1code: TStringField;
    ADOQuery1quantity: TFloatField;
    ppDBPipeline1: TppDBPipeline;
    ppDesigner1: TppDesigner;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport14: TFrmReport14;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmReport14.ppReport1PreviewFormCreate(Sender: TObject);
begin
  ppReport1.PreviewForm.WindowState := wsMaximized;
end;

end.
