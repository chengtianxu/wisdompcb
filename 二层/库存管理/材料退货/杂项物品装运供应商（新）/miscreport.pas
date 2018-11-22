unit miscreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppEndUsr, ppProd, ppClass, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, DB, ADODB, ppBands, ppCache, ppPrnabl, ppCtrls, ppStrtch,
  ppMemo;

type
  TForm_miscreport = class(TForm)
    Ado493: TADOQuery;
    Ado493Company_Name: TStringField;
    Ado493Company_Name2: TStringField;
    Ado493Company_Name3: TStringField;
    Ado493ship_address: TStringField;
    Ado493Company_Icon: TBlobField;
    Ado493SITE_INFO_ADD_1: TStringField;
    Ado493SITE_INFO_ADD_2: TStringField;
    Ado493SITE_INFO_ADD_3: TStringField;
    Ado493SITE_INFO_PHONE: TStringField;
    DataSource3: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB493ppField1: TppField;
    ppDB493ppField2: TppField;
    ppDB493ppField3: TppField;
    ppDB493ppField4: TppField;
    ppDB493ppField5: TppField;
    ppDB493ppField6: TppField;
    ppDB493ppField7: TppField;
    ppDB493ppField8: TppField;
    ppDB493ppField9: TppField;
    ado209: TADOQuery;
    DataSource1: TDataSource;
    ppDB209: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ado209DSDesigner: TStringField;
    ado209DSDesigner2: TStringField;
    ado209DSDesigner3: TStringField;
    ado209DSDesigner4: TStringField;
    ado209DSDesigner5: TStringField;
    ado209DSDesigner6: TStringField;
    ado209DSDesigner7: TStringField;
    ado209DSDesigner8: TDateTimeField;
    ado209DSDesigner9: TStringField;
    ado209DSDesigner10: TStringField;
    ado209DSDesigner11: TDateTimeField;
    ado209DSDesigner12: TStringField;
    ado209DSDesigner13: TFloatField;
    ado209DSDesigner14: TStringField;
    ado209DSDesigner15: TBCDField;
    ado209DSDesigner16: TBCDField;
    ado209DSDesigner17: TFloatField;
    ado209DSDesigner18: TStringField;
    ado209DSDesigner19: TFloatField;
    ado209DSDesigner20: TStringField;
    ado209DSDesigner21: TWideStringField;
    ado209DSDesigner22: TWideStringField;
    ado209DSDesigner23: TBCDField;
    ado209Rkey: TIntegerField;
    ado209DSDesigner24: TDateTimeField;
    ado209DSDesigner25: TStringField;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppDBText3: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText5: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppDBImage1: TppDBImage;
    ppLabel23: TppLabel;
    ppLabel25: TppLabel;
    ppDBText22: TppDBText;
    ppLabel5: TppLabel;
    ppDBText6: TppDBText;
    ppLabel6: TppLabel;
    ppDBText7: TppDBText;
    ppLabel7: TppLabel;
    ppDBText8: TppDBText;
    ppLabel8: TppLabel;
    ppDBText9: TppDBText;
    ppLabel9: TppLabel;
    ppDBText10: TppDBText;
    ppLabel10: TppLabel;
    ppDBText11: TppDBText;
    ppLabel11: TppLabel;
    ppDBText12: TppDBText;
    ppLabel12: TppLabel;
    ppDBText13: TppDBText;
    ppLabel13: TppLabel;
    ppDBText14: TppDBText;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppDBText16: TppDBText;
    ppLabel16: TppLabel;
    ppDBText17: TppDBText;
    ppLabel17: TppLabel;
    ppDBText18: TppDBText;
    ppLabel18: TppLabel;
    ppDBText19: TppDBText;
    ppLabel19: TppLabel;
    ppDBText20: TppDBText;
    ppLabel20: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel22: TppLabel;
    ppDBText4: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel24: TppLabel;
    ppDBText21: TppDBText;
    ppLabel21: TppLabel;
    ppLabel26: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_miscreport: TForm_miscreport;

implementation

uses damo;

{$R *.dfm}

procedure TForm_miscreport.ppReport1PrintingComplete(Sender: TObject);
begin
    
//  with DM.tmp do
//  begin
//    Close;
//    SQL.Text := 'SELECT Data0209.Rkey , Data0456.PRINTED FROM  Data0209 '+
//    ' INNER JOIN Data0235 ON Data0209.SRCE_PTR = Data0235.RKEY INNER JOIN Data0456 '+
//    ' ON Data0235.GRN_PTR = Data0456.RKEY where Data0209.Rkey='+dm.ADS209Rkey.AsString;
//    Open;
//    Edit;
//    FieldByName('PRINTED').Value:='Y';
//    Post;
//  end;

//ShowMessage(DM.ADS209Rkey.AsString);
end;

end.
