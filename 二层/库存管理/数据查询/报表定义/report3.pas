unit report3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppPrnabl, ppCtrls, ppModule, raCodMod, ppVar,
  ppStrtch, ppMemo, ppRichTx, ppEndUsr,Raide,math;

type
  TFrmreport3 = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    aq0439: TADOQuery;
    aq64: TADOQuery;
    Aq11: TADOQuery;
    DataSource3: TDataSource;
    ppDB64: TppDBPipeline;
    ppDB11: TppDBPipeline;
    ppReport1: TppReport;
    DataSource4: TDataSource;
    ppDB493: TppDBPipeline;
    ppDB439: TppDBPipeline;
    ppDesigner1: TppDesigner;
    aq64shipment_no: TSmallintField;
    aq64sales_order: TStringField;
    aq64po_number: TStringField;
    aq64po_date: TDateTimeField;
    aq64QUAN_SHIPPED: TIntegerField;
    aq0439delivery_no: TStringField;
    aq0439shipping_method: TStringField;
    aq0439fob: TStringField;
    aq0439cartons_no: TIntegerField;
    aq0439weight: TFloatField;
    aq0439net_weight: TFloatField;
    aq0439date_sailing: TDateTimeField;
    aq0439date_ent: TDateTimeField;
    aq0439reference_number: TStringField;
    aq0439charge: TFloatField;
    aq0439cust_code: TStringField;
    aq0439customer_name: TStringField;
    aq0439BILLING_ADDRESS_1: TStringField;
    aq0439LOCATION: TStringField;
    aq0439SHIP_TO_ADDRESS_1: TStringField;
    aq0439unit_code: TStringField;
    aq0439unit_name: TStringField;
    aq64NOTE_PAD_LINE_1: TStringField;
    aq64NOTE_PAD_LINE_2: TStringField;
    aq64NOTE_PAD_LINE_3: TStringField;
    aq64NOTE_PAD_LINE_4: TStringField;
    aq0439Remark: TStringField;
    aq64fob: TStringField;
    aq64reference_number: TStringField;
    aq64analysis_code_1: TStringField;
    aq64analysis_code_2: TStringField;
    ppReport3: TppReport;
    ppReport4: TppReport;
    ppReport5: TppReport;
    ppDesigner3: TppDesigner;
    ppDesigner4: TppDesigner;
    ppDesigner5: TppDesigner;
    aq0439employee_name: TStringField;
    ppDB439ppField20: TppField;
    ppTitleBand3: TppTitleBand;
    ppLine13: TppLine;
    ppDBImage3: TppDBImage;
    ppLabel50: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppLabel56: TppLabel;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppLabel59: TppLabel;
    ppDBText50: TppDBText;
    ppLabel60: TppLabel;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppLabel61: TppLabel;
    ppDBText53: TppDBText;
    ppLabel62: TppLabel;
    ppDBText77: TppDBText;
    ppLabel63: TppLabel;
    ppDBText78: TppDBText;
    ppLabel64: TppLabel;
    ppDBText79: TppDBText;
    ppLabel65: TppLabel;
    ppDBText60: TppDBText;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppLabel68: TppLabel;
    ppDBText63: TppDBText;
    ppSystemVariable4: TppSystemVariable;
    ppVariable3: TppVariable;
    ppSystemVariable5: TppSystemVariable;
    ppHeaderBand3: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppDetailBand3: TppDetailBand;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppFooterBand3: TppFooterBand;
    ppLabel75: TppLabel;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppLabel76: TppLabel;
    ppLine41: TppLine;
    ppLabel77: TppLabel;
    ppLine42: TppLine;
    ppDBText94: TppDBText;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppMemo1: TppMemo;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLine43: TppLine;
    ppLine44: TppLine;
    ppLine46: TppLine;
    ppLabel51: TppLabel;
    raCodeModule3: TraCodeModule;
    ppTitleBand4: TppTitleBand;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppLabel55: TppLabel;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppFooterBand4: TppFooterBand;
    ppTitleBand5: TppTitleBand;
    ppLine67: TppLine;
    ppDBImage5: TppDBImage;
    ppLabel107: TppLabel;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppLabel108: TppLabel;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppLabel109: TppLabel;
    ppLabel110: TppLabel;
    ppSystemVariable10: TppSystemVariable;
    ppLabel111: TppLabel;
    ppDBText111: TppDBText;
    ppLabel112: TppLabel;
    ppDBText112: TppDBText;
    ppDBText113: TppDBText;
    ppLabel113: TppLabel;
    ppDBText114: TppDBText;
    ppLabel114: TppLabel;
    ppDBText115: TppDBText;
    ppLabel115: TppLabel;
    ppDBText116: TppDBText;
    ppLabel116: TppLabel;
    ppDBText117: TppDBText;
    ppLabel117: TppLabel;
    ppDBText118: TppDBText;
    ppLabel118: TppLabel;
    ppLabel119: TppLabel;
    ppDBText119: TppDBText;
    ppDBText120: TppDBText;
    ppLabel121: TppLabel;
    ppDBText122: TppDBText;
    ppSystemVariable11: TppSystemVariable;
    ppVariable5: TppVariable;
    ppSystemVariable12: TppSystemVariable;
    ppHeaderBand5: TppHeaderBand;
    ppShape4: TppShape;
    ppLabel122: TppLabel;
    ppLabel123: TppLabel;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    ppLabel126: TppLabel;
    ppLabel127: TppLabel;
    ppLine68: TppLine;
    ppLine69: TppLine;
    ppLine70: TppLine;
    ppLine71: TppLine;
    ppLine72: TppLine;
    ppDetailBand5: TppDetailBand;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppDBText126: TppDBText;
    ppDBText127: TppDBText;
    ppDBText128: TppDBText;
    ppLine73: TppLine;
    ppLine74: TppLine;
    ppLine75: TppLine;
    ppLine76: TppLine;
    ppLine77: TppLine;
    ppLine78: TppLine;
    ppLine79: TppLine;
    ppLine80: TppLine;
    ppFooterBand5: TppFooterBand;
    ppLabel128: TppLabel;
    ppDBText129: TppDBText;
    ppDBText130: TppDBText;
    ppDBText131: TppDBText;
    ppDBText132: TppDBText;
    ppLabel129: TppLabel;
    ppLine81: TppLine;
    ppLabel130: TppLabel;
    ppLine82: TppLine;
    ppDBText133: TppDBText;
    ppLabel131: TppLabel;
    ppLabel132: TppLabel;
    ppMemo4: TppMemo;
    ppSummaryBand4: TppSummaryBand;
    ppDBCalc4: TppDBCalc;
    ppLine83: TppLine;
    ppLine84: TppLine;
    ppLine85: TppLine;
    ppLine86: TppLine;
    ppLabel133: TppLabel;
    raCodeModule5: TraCodeModule;
    aq0439SALES_REP_NAME: TStringField;
    ppDB439ppField21: TppField;
    aq64REPORT_UNIT_VALUE1: TFloatField;
    ppDB64ppField22: TppField;
    aq64weight: TFloatField;
    ppDB64ppField23: TppField;
    aq64remark: TStringField;
    ppDB64ppField24: TppField;
    aq0439print_date: TDateTimeField;
    aq0439invoice_number: TStringField;
    ppDB439ppField22: TppField;
    ppDB439ppField23: TppField;
    Aq11memo_text: TMemoField;
    ppDB11ppField1: TppField;
    ADO1011: TADOQuery;
    ADO1011memo_text: TMemoField;
    DataSource7: TDataSource;
    ppDB1011: TppDBPipeline;
    aq0439fh_location: TStringField;
    ppDB439ppField24: TppField;
    aq64part_price: TFloatField;
    aq64TOTAL_ADD_L_PRICE: TFloatField;
    ppDB64ppField26: TppField;
    aq0439STATE: TStringField;
    aq0439COUNTRY_CODE: TStringField;
    aq0439COUNTRY_NAME: TStringField;
    ppDB439ppField25: TppField;
    ppDB439ppField26: TppField;
    ppDB439ppField27: TppField;
    aq0439PHONE: TStringField;
    aq0439FAX: TStringField;
    ppDB439ppField28: TppField;
    ppDB439ppField29: TppField;
    aq0439remark_bak: TStringField;
    ppDB439ppField30: TppField;
    aq64COMMISION_ON_TOOLING: TStringField;
    ppDB64ppField27: TppField;
    aq0439FED_TAX_ID_NO: TStringField;
    ppDB439ppField31: TppField;
    aq64TAX_2: TBCDField;
    aq64tax_in_price: TStringField;
    aq64taxprice: TFloatField;
    aq64taxamount: TFloatField;
    aq64notaxprice: TFloatField;
    aq64notaxamount: TFloatField;
    ppDB64ppField9: TppField;
    aq64tools_taxprice: TFloatField;
    ppDB64ppField10: TppField;
    ppDB64ppField28: TppField;
    ppDB64ppField29: TppField;
    ppDB64ppField30: TppField;
    ppDB64ppField25: TppField;
    aq64MANU_PART_DESC: TStringField;
    aq64MANU_PART_NUMBER: TStringField;
    aq64set_qty: TIntegerField;
    ppDB64ppField3: TppField;
    ppDB64ppField4: TppField;
    ppDB64ppField5: TppField;
    ppHeaderBand2: TppHeaderBand;
    ppDBText20: TppDBText;
    ppDBText23: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppLabel31: TppLabel;
    ppDBText33: TppDBText;
    ppDBText19: TppDBText;
    ppLabel24: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    ppDetailBand2: TppDetailBand;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText56: TppDBText;
    ppDBText21: TppDBText;
    ppLabel80: TppLabel;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppDBText95: TppDBText;
    ppSummaryBand2: TppSummaryBand;

    procedure ppReport1PreviewFormCreate(Sender: TObject);
    procedure ppReport3PreviewFormCreate(Sender: TObject);
    procedure ppReport4PreviewFormCreate(Sender: TObject);
    procedure ppReport5PreviewFormCreate(Sender: TObject);
    procedure aq64CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmreport3: TFrmreport3;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmreport3.ppReport1PreviewFormCreate(Sender: TObject);
begin
//
end;

procedure TFrmreport3.ppReport3PreviewFormCreate(Sender: TObject);
begin
//
end;

procedure TFrmreport3.ppReport4PreviewFormCreate(Sender: TObject);
begin
//
end;

procedure TFrmreport3.ppReport5PreviewFormCreate(Sender: TObject);
begin
//
end;

procedure TFrmreport3.aq64CalcFields(DataSet: TDataSet);
begin
self.aq64tools_taxprice.Value:=
  roundto(self.aq64TOTAL_ADD_L_PRICE.Value*(1+self.aq64TAX_2.Value*0.01),-4);

if self.aq64tax_in_price.Value='N' then
 begin
  self.aq64notaxprice.Value:=self.aq64part_price.Value;
  self.aq64notaxamount.Value:=self.aq64notaxprice.Value*
                              self.aq64QUAN_SHIPPED.Value;
  self.aq64taxprice.Value:=self.aq64notaxprice.Value*(1+self.aq64TAX_2.Value*0.01);
  self.aq64taxamount.Value:=self.aq64notaxamount.Value*(1+self.aq64TAX_2.Value*0.01);
 end
else
 begin
  self.aq64taxprice.Value:=self.aq64part_price.Value;
  self.aq64taxamount.Value:=self.aq64notaxprice.Value*
                              self.aq64QUAN_SHIPPED.Value;
  self.aq64notaxprice.Value:=self.aq64taxprice.Value/(1+self.aq64TAX_2.Value*0.01);
  self.aq64notaxamount.Value:=self.aq64taxamount.Value/(1+self.aq64TAX_2.Value*0.01);
 end;

end;

end.
