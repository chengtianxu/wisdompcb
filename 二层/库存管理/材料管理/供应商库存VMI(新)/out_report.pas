unit out_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppBands, ppCache, ppCtrls, ppPrnabl, ppVar, ppEndUsr;

type
  TForm_outreport = class(TForm)
    ppDB149: TppDBPipeline;
    ppReport1: TppReport;
    DataSource1: TDataSource;
    ADO149: TADOQuery;
    ADO149RKEY: TAutoIncField;
    ADO149GON_PTR: TIntegerField;
    ADO149D0134_PTR: TIntegerField;
    ADO149INVENTORY_PTR: TIntegerField;
    ADO149QUANTITY: TBCDField;
    ADO149RTN_QUANTITY: TBCDField;
    ADO149tax_price: TBCDField;
    ADO149TAX_2: TBCDField;
    ADO149supplier_name: TStringField;
    ADO149BILLING_ADDRESS_1: TStringField;
    ADO149phone: TStringField;
    ADO149CONTACT_NAME_1: TStringField;
    ADO149po_number: TStringField;
    ADO149grn_number: TStringField;
    ADO149PO_DATE: TDateTimeField;
    ADO149quan_ord: TFloatField;
    ADO149unit_name: TStringField;
    ADO149inv_part_number: TStringField;
    ADO149inv_part_description: TStringField;
    ADO149quantity_1: TBCDField;
    ADO149tax_price_1: TBCDField;
    ADO149create_date: TDateTimeField;
    ADO149DSDesigner: TBCDField;
    ADO493: TADOQuery;
    DataSource2: TDataSource;
    ppDB493: TppDBPipeline;
    ADO493Company_Name: TStringField;
    ADO493Company_Name2: TStringField;
    ADO493Company_Name3: TStringField;
    ADO493ship_address: TStringField;
    ADO493Company_Icon: TBlobField;
    ADO493SITE_INFO_ADD_1: TStringField;
    ADO493SITE_INFO_ADD_2: TStringField;
    ADO493SITE_INFO_ADD_3: TStringField;
    ADO493SITE_INFO_PHONE: TStringField;
    ppDB724: TppDBPipeline;
    DataSource3: TDataSource;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLine1: TppLine;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBImage1: TppDBImage;
    ppLabel19: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLine2: TppLine;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel20: TppLabel;
    ppDBText19: TppDBText;
    ppSummaryBand1: TppSummaryBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_outreport: TForm_outreport;

implementation

uses demo, Audit;

{$R *.dfm}

end.
