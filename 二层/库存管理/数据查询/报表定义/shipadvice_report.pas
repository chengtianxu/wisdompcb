unit shipadvice_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppProd, ppClass, ppReport, ppDB, ppComm, ppRelatv,
  ppDBPipe, ppBands, ppCtrls, ppVar, ppPrnabl, ppCache,raide, ppEndUsr,
  ppModule, raCodMod;

type
  TForm_shipadvice = class(TForm)
    ADO529: TADOQuery;
    ADO439: TADOQuery;
    ADO493: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ADO493Company_Name: TStringField;
    ADO493Company_Name2: TStringField;
    ADO493Company_Name3: TStringField;
    ADO493ship_address: TStringField;
    ADO493Company_Icon: TBlobField;
    ADO493SITE_INFO_ADD_1: TStringField;
    ADO493SITE_INFO_ADD_2: TStringField;
    ADO493SITE_INFO_ADD_3: TStringField;
    ADO493SITE_INFO_PHONE: TStringField;
    ADO529shipadvice_no: TStringField;
    ADO529ATTN: TStringField;
    ADO529ATTN1: TStringField;
    ADO529ATTN_CC: TStringField;
    ADO529ADV_FROM: TStringField;
    ADO529ADV_FROM_CC: TStringField;
    ADO529SHIP_FROM: TStringField;
    ADO529TO_PORT: TStringField;
    ADO529SHIP_TO_PHONE: TStringField;
    ADO529FAX_NO: TStringField;
    ADO529FAX_TO: TStringField;
    ADO529TDATE: TDateTimeField;
    ADO529MAWB_NO: TStringField;
    ADO529HAWB_NO: TStringField;
    ADO529FLIGHT_NO: TStringField;
    ADO529DEPA_DATE: TDateTimeField;
    ADO529LOCATION: TStringField;
    ADO529CUST_CODE: TStringField;
    ADO529CUSTOMER_NAME: TStringField;
    ADO529EMPL_CODE: TStringField;
    ADO529EMPLOYEE_NAME: TStringField;
    ADO439QUAN_SHIPPED: TIntegerField;
    ADO439ovsh_qty: TIntegerField;
    ADO439quantity: TIntegerField;
    ADO439remark: TStringField;
    ADO439REPORT_UNIT_VALUE1: TFloatField;
    ADO439unit_sq: TFloatField;
    ADO439weight: TFloatField;
    ADO439SALES_ORDER: TStringField;
    ADO439FOB: TStringField;
    ADO439REFERENCE_NUMBER: TStringField;
    ADO439TOTAL_ADD_L_PRICE: TFloatField;
    ADO439CP_REV: TStringField;
    ADO439CUSTOMER_PART_DESC: TStringField;
    ADO439CUSTOMER_PART_NUMBER: TStringField;
    ADO439ANALYSIS_CODE_1: TStringField;
    ADO439ANALYSIS_CODE_2: TStringField;
    ADO439part_price: TFloatField;
    ADO439set_x_qty: TIntegerField;
    ADO439set_y_qty: TIntegerField;
    ADO439CATALOG_NUMBER: TStringField;
    ADO439PO_NUMBER: TStringField;
    ADO439PO_DATE: TDateTimeField;
    ADO439NOTE_PAD_LINE_1: TStringField;
    ADO439NOTE_PAD_LINE_2: TStringField;
    ADO439NOTE_PAD_LINE_3: TStringField;
    ADO439NOTE_PAD_LINE_4: TStringField;
    ADO439DATE_SHIPPED: TDateTimeField;
    ADO439SHIPMENT_NO: TSmallintField;
    ADO439delivery_no: TStringField;
    ADO439cartons_no: TIntegerField;
    ADO439weight439: TFloatField;
    ADO439net_weight: TFloatField;
    ADO439date_sailing: TDateTimeField;
    ADO439charge: TFloatField;
    ADO439fob439: TStringField;
    ADO439reference_num439: TStringField;
    ADO439remark439: TStringField;
    ADO439CURR_CODE: TStringField;
    ADO439CURR_NAME: TStringField;
    ADO439invoice_number: TStringField;
    ppDB439: TppDBPipeline;
    ppDB529: TppDBPipeline;
    ppDB493: TppDBPipeline;
    ppReport1: TppReport;
    ppReport2: TppReport;
    ppDesigner1: TppDesigner;
    ppDesigner2: TppDesigner;
    ppTitleBand1: TppTitleBand;
    ppDBImage1: TppDBImage;
    ppLine7: TppLine;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppLabel27: TppLabel;
    ppDBText28: TppDBText;
    ppLabel1: TppLabel;
    ppDBText29: TppDBText;
    ppLabel2: TppLabel;
    ppDBText30: TppDBText;
    ppLabel3: TppLabel;
    ppDBText31: TppDBText;
    ppLabel4: TppLabel;
    ppDBText32: TppDBText;
    ppLabel5: TppLabel;
    ppDBText18: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLine8: TppLine;
    ppLabel12: TppLabel;
    ppDBText4: TppDBText;
    ppHeaderBand1: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine12: TppLine;
    ppLabel22: TppLabel;
    ppDBText14: TppDBText;
    ppTitleBand2: TppTitleBand;
    ppDBImage2: TppDBImage;
    ppVariable2: TppVariable;
    ppLine1: TppLine;
    ppLabel23: TppLabel;
    ppLabel28: TppLabel;
    ppDBText22: TppDBText;
    ppDBText36: TppDBText;
    ppLabel29: TppLabel;
    ppDBText37: TppDBText;
    ppLabel30: TppLabel;
    ppDBText38: TppDBText;
    ppLabel32: TppLabel;
    ppDBText39: TppDBText;
    ppLabel33: TppLabel;
    ppDBText40: TppDBText;
    ppLabel34: TppLabel;
    ppDBText41: TppDBText;
    ppLabel35: TppLabel;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppLabel36: TppLabel;
    ppDBText45: TppDBText;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLine2: TppLine;
    ppLabel42: TppLabel;
    ppHeaderBand6: TppHeaderBand;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppDetailBand6: TppDetailBand;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppFooterBand6: TppFooterBand;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppDBText59: TppDBText;
    ppDBText64: TppDBText;
    ppLine6: TppLine;
    ppLabel54: TppLabel;
    ppDBText83: TppDBText;
    raCodeModule2: TraCodeModule;
    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure ppReport2PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_shipadvice: TForm_shipadvice;

implementation

uses DataModule;



{$R *.dfm}

procedure TForm_shipadvice.ppReport1PreviewFormCreate(Sender: TObject);
begin
//
end;

procedure TForm_shipadvice.ppReport2PreviewFormCreate(Sender: TObject);
begin
//
end;

end.
