unit Report12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppDBPipe, ppEndUsr, ppComm, ppRelatv, ppProd,
  ppClass, ppReport, ppBands, ppCtrls, ppVar, ppPrnabl, ppStrtch, ppMemo,
  ppCache, ppModule, raCodMod, ppSubRpt,raide;



type
  TFrmReport12 = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Aqwz456: TADOQuery;
    Aqwz456rkey: TAutoIncField;
    Aqwz456GRN_NUMBER: TStringField;
    Aqwz456DELIVER_NUMBER: TStringField;
    Aqwz456CODE: TStringField;
    Aqwz456SUPPLIER_NAME: TStringField;
    Aqwz456ABBR_NAME: TStringField;
    Aqwz456ship_DATE: TDateTimeField;
    Aqwz456STATUS: TSmallintField;
    Aqwz456TTYPE: TWordField;
    Aqwz456REF_NUMBER: TStringField;
    Aqwz456PO_NUMBER: TStringField;
    Aqwz456EMPLOYEE_NAME: TStringField;
    Aqwz456EMPL_CODE: TStringField;
    Aqwz456v_status: TStringField;
    Aqwz456v_type: TStringField;
    Aqwz456WAREHOUSE_CODE: TStringField;
    Aqwz456WAREHOUSE_NAME: TStringField;
    Aqwz456ship_BY: TStringField;
    Aqwz456CURR_CODE: TStringField;
    Aqwz456CURR_NAME: TStringField;
    Aqwz456DEPT_NAME: TStringField;
    Aqwz456exch_rate: TBCDField;
    Aqwz22: TADOQuery;
    Aqwz22INV_PART_NUMBER: TStringField;
    Aqwz22INV_NAME: TStringField;
    Aqwz22INV_DESCRIPTION: TStringField;
    Aqwz22LOCATION: TStringField;
    Aqwz22QUANTITY: TBCDField;
    Aqwz22UNIT_NAME: TStringField;
    Aqwz22BARCODE_ID: TStringField;
    Aqwz22EXPIRE_DATE: TDateTimeField;
    Aqwz22PRICE: TBCDField;
    Aqwz22TAX_2: TBCDField;
    Aqwz22amount: TBCDField;
    Aqwz22supplier2: TStringField;
    Aqwz22rohs: TStringField;
    ppDB456: TppDBPipeline;
    ppDB456ppField2: TppField;
    ppDB456ppField3: TppField;
    ppDB456ppField4: TppField;
    ppDB456ppField5: TppField;
    ppDB456ppField6: TppField;
    ppDB456ppField7: TppField;
    ppDB456ppField10: TppField;
    ppDB456ppField11: TppField;
    ppDB456ppField12: TppField;
    ppDB456ppField13: TppField;
    ppDB456ppField14: TppField;
    ppDB456ppField15: TppField;
    ppDB456ppField16: TppField;
    ppDB456ppField17: TppField;
    ppDB456ppField18: TppField;
    ppDB456ppField19: TppField;
    ppDB456ppField20: TppField;
    ppDB456ppField21: TppField;
    ppDB456ppField23: TppField;
    ppDB22: TppDBPipeline;
    ppDB22ppField1: TppField;
    ppDB22ppField2: TppField;
    ppDB22ppField3: TppField;
    ppDB22ppField4: TppField;
    ppDB22ppField5: TppField;
    ppDB22ppField6: TppField;
    ppDB22ppField7: TppField;
    ppDB22ppField8: TppField;
    ppDB22ppField11: TppField;
    ppDB22ppField12: TppField;
    ppDB22ppField9: TppField;
    ppDB22ppField10: TppField;
    ppDB22ppField13: TppField;
    ppReport1: TppReport;
    Aq493: TADOQuery;
    Aq493Company_Name: TStringField;
    Aq493Company_Name2: TStringField;
    Aq493Company_Name3: TStringField;
    Aq493ship_address: TStringField;
    Aq493Company_Icon: TBlobField;
    Aq493SITE_INFO_ADD_1: TStringField;
    Aq493SITE_INFO_ADD_2: TStringField;
    Aq493SITE_INFO_ADD_3: TStringField;
    Aq493SITE_INFO_PHONE: TStringField;
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
    ppDesigner1: TppDesigner;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText11: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText12: TppDBText;
    ppLabel5: TppLabel;
    ppDBText13: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppDBText14: TppDBText;
    ppLabel16: TppLabel;
    ppLabel12: TppLabel;
    ppLabel18: TppLabel;
    ppDBText10: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText19: TppDBText;
    ppDBImage1: TppDBImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel21: TppLabel;
    ppDBText20: TppDBText;
    ppLabel22: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppShape2: TppShape;
    ppLabel8: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText17: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText5: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine18: TppLine;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
    ppLabel15: TppLabel;
    ppDBText16: TppDBText;
    ppShape1: TppShape;
    ppDBCalc1: TppDBCalc;
    ppLabel17: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport12: TFrmReport12;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmReport12.ppReport1PrintingComplete(Sender: TObject);
begin
//
end;

end.
