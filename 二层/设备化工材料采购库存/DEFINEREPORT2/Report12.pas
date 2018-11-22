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
    Aqwz456EXCHANGE_RATE: TFloatField;
    Aqwz456DEPT_NAME: TStringField;
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
    Aqwz22EXCHANGE_RATE: TBCDField;
    Aqwz22CURR_CODE: TStringField;
    Aqwz22CURR_NAME: TStringField;
    Aqwz22amount: TBCDField;
    ppDB456: TppDBPipeline;
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
    ppDB22ppField13: TppField;
    ppDB22ppField14: TppField;
    ppDB22ppField15: TppField;
    ppDB22ppField9: TppField;
    ppReport1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
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
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText14: TppDBText;
    ppLabel16: TppLabel;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppDBText17: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel15: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel17: TppLabel;
    ppDesigner1: TppDesigner;
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

end.
