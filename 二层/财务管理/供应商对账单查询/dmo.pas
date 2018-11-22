unit dmo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConn: TADOConnection;
    ADODataSet1: TADODataSet;
    ADOQuery1: TADOQuery;
    ADODataSet2: TADODataSet;
    ADODataSet3: TADODataSet;
    ADODataSet4: TADODataSet;
    ADODataSet5: TADODataSet;
    ADODataSet2rkey: TAutoIncField;
    ADODataSet2CODE: TStringField;
    ADODataSet2ABBR_NAME: TStringField;
    ADODataSet2SUPPLIER_NAME: TStringField;
    ADODataSet2INVOICE_NO: TStringField;
    ADODataSet2CURR_CODE: TStringField;
    ADODataSet2EX_RATE: TFloatField;
    ADODataSet2INV_DATE: TDateTimeField;
    ADODataSet2INV_TOTAL: TBCDField;
    ADODataSet2amount_paid: TBCDField;
    ADODataSet2amt_payable: TBCDField;
    ADODataSet2INV_PART_NUMBER: TStringField;
    ADODataSet2INV_PART_DESCRIPTION: TStringField;
    ADODataSet2INV_DESCRIPTION: TStringField;
    ADODataSet2QUANTITY: TBCDField;
    ADODataSet2PRICE: TBCDField;
    ADODataSet2TAX_2: TBCDField;
    ADODataSet2tax_price: TBCDField;
    ADODataSet2Rec_amount: TBCDField;
    ADODataSet2tax_invoice_amt: TBCDField;
    ADODataSet2tax_invoice_date: TDateTimeField;
    ADODataSet2GLPTR_STATUS: TStringField;
    ADODataSet2tax_invoice_ref: TStringField;
    ADODataSet2TType: TStringField;
    ADODataSet3rkey: TAutoIncField;
    ADODataSet3CODE: TStringField;
    ADODataSet3ABBR_NAME: TStringField;
    ADODataSet3SUPPLIER_NAME: TStringField;
    ADODataSet3INVOICE_NO: TStringField;
    ADODataSet3CURR_CODE: TStringField;
    ADODataSet3EX_RATE: TFloatField;
    ADODataSet3INV_DATE: TDateTimeField;
    ADODataSet3INV_TOTAL: TBCDField;
    ADODataSet3amount_paid: TBCDField;
    ADODataSet3amt_payable: TBCDField;
    ADODataSet3INV_PART_NUMBER: TStringField;
    ADODataSet3INV_PART_DESCRIPTION: TStringField;
    ADODataSet3INV_DESCRIPTION: TStringField;
    ADODataSet3QUANTITY: TIntegerField;
    ADODataSet3PRICE: TIntegerField;
    ADODataSet3TAX_2: TIntegerField;
    ADODataSet3tax_price: TIntegerField;
    ADODataSet3Rec_amount: TIntegerField;
    ADODataSet3tax_invoice_amt: TBCDField;
    ADODataSet3tax_invoice_date: TDateTimeField;
    ADODataSet3GLPTR_STATUS: TStringField;
    ADODataSet3tax_invoice_ref: TStringField;
    ADODataSet3TType: TStringField;
    ADODataSet4rkey: TIntegerField;
    ADODataSet4CODE: TStringField;
    ADODataSet4ABBR_NAME: TStringField;
    ADODataSet4SUPPLIER_NAME: TStringField;
    ADODataSet4INVOICE_NO: TStringField;
    ADODataSet4CURR_CODE: TStringField;
    ADODataSet4EX_RATE: TBCDField;
    ADODataSet4INV_DATE: TDateTimeField;
    ADODataSet4INV_TOTAL: TBCDField;
    ADODataSet4amount_paid: TIntegerField;
    ADODataSet4amt_payable: TIntegerField;
    ADODataSet4INV_PART_NUMBER: TStringField;
    ADODataSet4INV_PART_DESCRIPTION: TStringField;
    ADODataSet4INV_DESCRIPTION: TStringField;
    ADODataSet4QUANTITY: TFloatField;
    ADODataSet4PRICE: TBCDField;
    ADODataSet4TAX_2: TBCDField;
    ADODataSet4tax_price: TBCDField;
    ADODataSet4Rec_amount: TFloatField;
    ADODataSet4tax_invoice_amt: TBCDField;
    ADODataSet4tax_invoice_date: TIntegerField;
    ADODataSet4GLPTR_STATUS: TStringField;
    ADODataSet4tax_invoice_ref: TStringField;
    ADODataSet4TType: TStringField;
    ADODataSet5rkey: TAutoIncField;
    ADODataSet5CODE: TStringField;
    ADODataSet5ABBR_NAME: TStringField;
    ADODataSet5SUPPLIER_NAME: TStringField;
    ADODataSet5INVOICE_NO: TStringField;
    ADODataSet5CURR_CODE: TStringField;
    ADODataSet5EX_RATE: TBCDField;
    ADODataSet5INV_DATE: TDateTimeField;
    ADODataSet5INV_TOTAL: TBCDField;
    ADODataSet5amount_paid: TIntegerField;
    ADODataSet5amt_payable: TIntegerField;
    ADODataSet5INV_PART_NUMBER: TStringField;
    ADODataSet5INV_PART_DESCRIPTION: TStringField;
    ADODataSet5INV_DESCRIPTION: TStringField;
    ADODataSet5QUANTITY: TIntegerField;
    ADODataSet5PRICE: TIntegerField;
    ADODataSet5TAX_2: TIntegerField;
    ADODataSet5tax_price: TIntegerField;
    ADODataSet5Rec_amount: TIntegerField;
    ADODataSet5tax_invoice_amt: TBCDField;
    ADODataSet5tax_invoice_date: TStringField;
    ADODataSet5GLPTR_STATUS: TStringField;
    ADODataSet5tax_invoice_ref: TStringField;
    ADODataSet5TType: TStringField;
    ADODataSet1rkey: TAutoIncField;
    ADODataSet1CODE: TStringField;
    ADODataSet1ABBR_NAME: TStringField;
    ADODataSet1SUPPLIER_NAME: TStringField;
    ADODataSet1INVOICE_NO: TStringField;
    ADODataSet1CURR_CODE: TStringField;
    ADODataSet1EX_RATE: TFloatField;
    ADODataSet1INV_DATE: TDateTimeField;
    ADODataSet1INV_TOTAL: TBCDField;
    ADODataSet1amount_paid: TBCDField;
    ADODataSet1amt_payable: TBCDField;
    ADODataSet1INV_PART_NUMBER: TStringField;
    ADODataSet1INV_PART_DESCRIPTION: TStringField;
    ADODataSet1INV_DESCRIPTION: TStringField;
    ADODataSet1QUANTITY: TFloatField;
    ADODataSet1PRICE: TBCDField;
    ADODataSet1TAX_2: TBCDField;
    ADODataSet1tax_price: TBCDField;
    ADODataSet1Rec_amount: TFloatField;
    ADODataSet1tax_invoice_amt: TBCDField;
    ADODataSet1tax_invoice_date: TDateTimeField;
    ADODataSet1GLPTR_STATUS: TStringField;
    ADODataSet1tax_invoice_ref: TStringField;
    ADODataSet1TType: TStringField;
    ADODataSet1GRN_NUMBER: TStringField;
    ADODataSet1DELIVER_NUMBER: TStringField;
    ADODataSet1PO_NUMBER: TStringField;
    ADODataSet2GRN_NUMBER: TStringField;
    ADODataSet2DELIVER_NUMBER: TStringField;
    ADODataSet2PO_NUMBER: TStringField;
    ADODataSet4GRN_NUMBER: TStringField;
    ADODataSet4DELIVER_NUMBER: TStringField;
    ADODataSet4PO_NUMBER: TStringField;
    ADODataSet3GRN_NUMBER: TStringField;
    ADODataSet3DELIVER_NUMBER: TStringField;
    ADODataSet3PO_NUMBER: TStringField;
    ADODataSet5GRN_NUMBER: TStringField;
    ADODataSet5DELIVER_NUMBER: TStringField;
    ADODataSet5PO_NUMBER: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

end.
