unit FM_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls, ppComm, ppRelatv, ppDB, ppDBPipe,
  DB, ppProd, ppClass, ppReport, ADODB, ppCtrls, ppPrnabl, ppBands, ppCache,
  ppVar, ppEndUsr,raide;

type
  TForm_report = class(TForm)
    ADO22: TADOQuery;
    ADO22CODE: TStringField;
    ADO22SUPPLIER_NAME: TStringField;
    ADO22CONTACT_NAME_1: TStringField;
    ADO22BILLING_ADDRESS_1: TStringField;
    ADO22PRICE: TFloatField;
    ADO22WAREHOUSE_CODE: TStringField;
    ADO22WAREHOUSE_NAME: TStringField;
    ADO22QUAN_TO_BE_SHIPPED: TBCDField;
    ADO22QUAN_RETURNED: TBCDField;
    ADO22BARCODE_ID: TStringField;
    ADO22QUANTITY: TFloatField;
    ADO22PHONE: TStringField;
    ADO22FAX: TStringField;
    ADO22TTYPE: TSmallintField;
    ADO22loca_code: TStringField;
    ADO22LOCATION: TStringField;
    ADO22GRN_NUMBER: TStringField;
    ADO22RKEY: TIntegerField;
    ADO22CURR_NAME: TStringField;
    ADO22TAX_2: TBCDField;
    ADO22tax_price: TFloatField;
    ADO22ship_DATE: TDateTimeField;
    ADO22DSDesigner: TStringField;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource4: TDataSource;
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
    ppDB22: TppDBPipeline;
    ppDB22ppField3: TppField;
    ppDB22ppField4: TppField;
    ppDB22ppField5: TppField;
    ppDB22ppField6: TppField;
    ppDB22ppField8: TppField;
    ppDB22ppField9: TppField;
    ppDB22ppField10: TppField;
    ppDB22ppField11: TppField;
    ppDB22ppField12: TppField;
    ppDB22ppField13: TppField;
    ppDB22ppField14: TppField;
    ppDB22ppField15: TppField;
    ppDB22ppField16: TppField;
    ppDB22ppField18: TppField;
    ppDB22ppField19: TppField;
    ppDB22ppField21: TppField;
    ppDB22ppField1: TppField;
    ppDB22ppField2: TppField;
    ppDB22ppField17: TppField;
    ppDB22ppField7: TppField;
    ppDB22ppField20: TppField;
    ppDB95: TppDBPipeline;
    ppDB95ppField2: TppField;
    ppDB95ppField3: TppField;
    ppDB95ppField4: TppField;
    ppDB95ppField5: TppField;
    ppDB95ppField6: TppField;
    ppDB95ppField7: TppField;
    ppDB95ppField8: TppField;
    ppDB95ppField10: TppField;
    ppDB95ppField11: TppField;
    ppDB95ppField12: TppField;
    ppDB95ppField13: TppField;
    ppDB95ppField1: TppField;
    ppDB95ppField9: TppField;
    ppDB95ppField14: TppField;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ADO95: TADOQuery;
    ADO95QUANTITY: TFloatField;
    ADO95SHIPPING_METHOD: TStringField;
    ADO95INV_PART_NUMBER: TStringField;
    ADO95INV_PART_DESCRIPTION: TStringField;
    ADO95EMPLOYEE_NAME: TStringField;
    ADO95TRAN_DATE: TDateTimeField;
    ADO95REFERENCE_NUMBER: TStringField;
    ADO95QUAN_ORD: TFloatField;
    ADO95UNIT_NAME: TStringField;
    ADO95CONVERSION_FACTOR: TFloatField;
    ADO95PO_NUMBER: TStringField;
    ADO95PO_DATE: TDateTimeField;
    ADO95TTYPE: TWordField;
    ADO95PRICE: TFloatField;
    ADO95FloatField: TFloatField;
    ADO95FloatField2: TFloatField;
    ADO95Field: TFloatField;
    ADO95po_price: TFloatField;
    ADO95tax_2: TBCDField;
    ADO95rkey: TIntegerField;
    ADO22SHIPPING_METHOD: TWideStringField;
    ppDB22ppField22: TppField;
    ADO95QUAN_REJD: TFloatField;
    ppDB95ppField15: TppField;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBText5: TppDBText;
    ppLabel6: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel7: TppLabel;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText8: TppDBText;
    ppLabel10: TppLabel;
    ppDBText9: TppDBText;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppLabel15: TppLabel;
    ppDBText14: TppDBText;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    ppLabel17: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppLabel22: TppLabel;
    ppDBText22: TppDBText;
    ppLabel23: TppLabel;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText25: TppDBText;
    ppLabel21: TppLabel;
    ppLabel24: TppLabel;
    ppDBText10: TppDBText;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    procedure ADO95CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses DM;

{$R *.dfm}

procedure TForm_report.ADO95CalcFields(DataSet: TDataSet);
begin

     //ADO95FloatField.Value := ADO95QUANTITY.Value;   //退货数量
     ADO95FloatField.Value := ADO95QUAN_REJD.Value;
     ADO95FloatField2.Value := ADO95QUAN_REJD.Value * ADO95PRICE.Value ; //退货金额
     ADO95Field.Value := ADO95QUAN_REJD.Value * ADO95PRICE.Value * ADO95tax_2.Value * 0.01/(1+ADO95tax_2.Value*0.01) ;//税金
     
end;





end.
