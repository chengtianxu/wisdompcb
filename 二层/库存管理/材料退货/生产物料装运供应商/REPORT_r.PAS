unit REPORT_r;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, QRCtrls, ppComm, ppRelatv, ppDB, ppDBPipe,
  DB, ppProd, ppClass, ppReport, ADODB, ppCtrls, ppPrnabl, ppBands, ppCache,
  ppVar, ppEndUsr,raide;

type
  TForm_report = class(TForm)
    DataSource1: TDataSource;
    ppDB493: TppDBPipeline;
    ppReport1: TppReport;
    ADO22: TADOQuery;
    DataSource2: TDataSource;
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
    ppDB22: TppDBPipeline;
    DataSource3: TDataSource;
    ppDB2211: TppDBPipeline;
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
    DataSource4: TDataSource;
    ppDB95: TppDBPipeline;
    ADO22CURR_NAME: TStringField;
    ppDB22ppField1: TppField;
    ADO95PRICE: TFloatField;
    ADO95FloatField: TFloatField;
    ADO95FloatField2: TFloatField;
    ADO95po_price: TFloatField;
    ppDB95ppField9: TppField;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
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
    ppDBText10: TppDBText;
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
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppDBText20: TppDBText;
    ppLabel21: TppLabel;
    ppDBText21: TppDBText;
    ADO22TAX_2: TBCDField;
    ADO22tax_price: TFloatField;
    ppDB22ppField2: TppField;
    ppDB22ppField17: TppField;
    ADO95tax_2: TBCDField;
    ADO95Field: TFloatField;
    ppDB95ppField14: TppField;
    ADO95TTYPE: TWordField;
    ADO22ship_DATE: TDateTimeField;
    ppDB22ppField7: TppField;
    ADO22DSDesigner: TStringField;
    ppDB22ppField20: TppField;
    procedure ADO95CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation
 uses damo;
{$R *.dfm}

procedure TForm_report.ADO95CalcFields(DataSet: TDataSet);
begin

  ADO95FloatField.Value := ADO95QUANTITY.Value;   //退货数量
  ADO95FloatField2.Value := ADO95QUANTITY.Value*    //退货金额
          ADO95PRICE.Value;

ADO95Field.Value:=ADO95QUANTITY.Value*ADO95PRICE.Value*ADO95tax_2.Value*0.01/
(1+ADO95tax_2.Value*0.01);//税金

end;

end.
