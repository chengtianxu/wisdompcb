unit list_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppBands, ppCache, ppClass, ppProd, ppReport, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppPrnabl, ppCtrls, ppModule, raCodMod, ppVar,
  ppStrtch, ppMemo, ppRichTx,math, ppEndUsr, ppBarCod;

type
  TForm6 = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    aq0439: TADOQuery;
    aq64: TADOQuery;
    Aq11: TADOQuery;
    DataSource3: TDataSource;
    ppDB64: TppDBPipeline;
    ppDB11: TppDBPipeline;
    ppReport1: TppReport;
    aq0493: TADOQuery;
    DataSource4: TDataSource;
    ppDB493: TppDBPipeline;
    aq64rkey: TAutoIncField;
    aq64shipment_no: TSmallintField;
    aq64sales_order: TStringField;
    aq64po_number: TStringField;
    aq64po_date: TDateTimeField;
    aq64QUAN_SHIPPED: TIntegerField;
    aq64NOTE_PAD_LINE_1: TStringField;
    aq64NOTE_PAD_LINE_2: TStringField;
    aq64NOTE_PAD_LINE_3: TStringField;
    aq64NOTE_PAD_LINE_4: TStringField;
    aq0493Company_Name: TStringField;
    aq0493ship_address: TStringField;
    aq0493Company_Icon: TBlobField;
    aq0493SITE_INFO_ADD_1: TStringField;
    aq0493SITE_INFO_ADD_2: TStringField;
    aq0493SITE_INFO_ADD_3: TStringField;
    aq0493SITE_INFO_PHONE: TStringField;
    aq64fob: TStringField;
    aq64REFERENCE_NUMBER: TStringField;
    aq64ANALYSIS_CODE_1: TStringField;
    aq64ANALYSIS_CODE_2: TStringField;
    aq64REPORT_UNIT_VALUE1: TFloatField;
    aq64weight: TFloatField;
    aq64remark: TStringField;
    ADO1011: TADOQuery;
    ADO1011memo_text: TMemoField;
    DataSource5: TDataSource;
    ppDB1011: TppDBPipeline;
    Aq11memo_text: TMemoField;
    ppDB11ppField1: TppField;
    aq64part_price: TFloatField;
    aq64TOTAL_ADD_L_PRICE: TFloatField;
    aq0439delivery_no: TStringField;
    aq0439CUST_CODE: TStringField;
    aq0439CUSTOMER_NAME: TStringField;
    aq0439BILLING_ADDRESS_1: TStringField;
    aq0439EMPLOYEE_NAME: TStringField;
    aq0439LOCATION: TStringField;
    aq0439SHIP_TO_ADDRESS_1: TStringField;
    aq0439UNIT_CODE: TStringField;
    aq0439UNIT_NAME: TStringField;
    aq0439SALES_REP_NAME: TStringField;
    aq0439invoice_number: TStringField;
    aq0439shipping_method: TStringField;
    aq0439fob: TStringField;
    aq0439cartons_no: TIntegerField;
    aq0439weight: TFloatField;
    aq0439net_weight: TFloatField;
    aq0439date_sailing: TDateTimeField;
    aq0439date_ent: TDateTimeField;
    aq0439reference_number: TStringField;
    aq0439charge: TFloatField;
    aq0439remark: TStringField;
    aq0439print_date: TDateTimeField;
    aq0439fh_location: TStringField;
    aq0439STATE: TStringField;
    aq0439COUNTRY_CODE: TStringField;
    aq0439COUNTRY_NAME: TStringField;
    ppDB439: TppDBPipeline;
    aq0439rkey: TAutoIncField;
    aq0439customer_ptr: TIntegerField;
    aq64COMMISION_ON_TOOLING: TStringField;
    aq0439FED_TAX_ID_NO: TStringField;
    aq64TAX_2: TBCDField;
    aq64tax_in_price: TStringField;
    aq64tools_taxprice: TFloatField;
    aq64taxprice: TFloatField;
    aq64notaxprice: TFloatField;
    aq64taxamount: TFloatField;
    aq64notaxamount: TFloatField;
    aq64MANU_PART_DESC: TStringField;
    aq64MANU_PART_NUMBER: TStringField;
    aq64set_qty: TIntegerField;
    aq0439PHONE: TStringField;
    aq0439FAX: TStringField;
    aq0439APPLY_IN_TRANSIT: TWordField;
    ppDesigner1: TppDesigner;
    aq64ANALYSIS_code60_1: TStringField;
    aq64ANALYSIS_code60_2: TStringField;
    aq64ANALYSIS_code60_3: TStringField;
    aq0439DSDesigner: TStringField;
    aq0439DSDesigner2: TStringField;
    aq64PARTS_ORDERED: TFloatField;
    aq64PARTS_SHIPPED: TFloatField;
    aq64PARTS_RETURNED: TFloatField;
    aq64RETURNED_SHIP: TIntegerField;
    aq0439DSDesigner3: TStringField;
    aq0439DSDesigner4: TStringField;
    aq0439DSDesigner5: TStringField;
    strngfldaq64_39: TStringField;
    strngfldaq64_392: TStringField;
    strngfldaq64_393: TStringField;
    strngfldaq64_394: TStringField;
    strngfldaq0439_39: TStringField;
    aq64DSDesigner: TLargeintField;
    ppTitleBand1: TppTitleBand;
    ppLabel3: TppLabel;
    ppDBText22: TppDBText;
    ppSystemVariable7: TppSystemVariable;
    lbl1: TppLabel;
    lbl2: TppLabel;
    ppDBBarCode1: TppDBBarCode;
    ppHeaderBand4: TppHeaderBand;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel10: TppLabel;
    ppLabel6: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine2: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine10: TppLine;
    ppLabel15: TppLabel;
    lbl3: TppLabel;
    lbl4: TppLabel;
    lbl5: TppLabel;
    pln1: TppLine;
    pln3: TppLine;
    pln5: TppLine;
    ppDetailBand4: TppDetailBand;
    ppLine13: TppLine;
    ppLine1: TppLine;
    ppLine3: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine11: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBBarCode2: TppDBBarCode;
    ppDBText3: TppDBText;
    ppDBBarCode3: TppDBBarCode;
    ppDBText4: TppDBText;
    ppDBBarCode4: TppDBBarCode;
    ppDBText5: TppDBText;
    ppDBBarCode5: TppDBBarCode;
    pln2: TppLine;
    pln4: TppLine;
    ppDBText7: TppDBText;
    pln6: TppLine;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    lbl6: TppLabel;
    ppFooterBand4: TppFooterBand;
    ppSummaryBand4: TppSummaryBand;
    lbl13: TppLabel;
    pln7: TppLine;
    pln8: TppLine;
    pln9: TppLine;
    pln10: TppLine;
    pln11: TppLine;
    pln12: TppLine;
    pln13: TppLine;
    pln14: TppLine;
    pln15: TppLine;
    pln16: TppLine;
    pln17: TppLine;
    lbl7: TppLabel;
    lbl8: TppLabel;
    lbl9: TppLabel;
    lbl10: TppLabel;
    lbl11: TppLabel;
    lbl12: TppLabel;
    ppDBText6: TppDBText;
    lbl14: TppLabel;
    ppPageStyle1: TppPageStyle;
    raCodeModule1: TraCodeModule;
    intgrfldaq64allqty: TIntegerField;
    strngfldaq0439LOCNAME_FOR_FORM: TStringField;
    strngfldaq64Bar39_ANALYSIS_code60_1: TStringField;
    procedure aq64CalcFields(DataSet: TDataSet);
    procedure ppReport1PrintingComplete(Sender: TObject);
    procedure ppReport1PreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
uses damo,common;
{$R *.dfm}

procedure TForm6.aq64CalcFields(DataSet: TDataSet);
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
 DM.qrytmp.Close;
 dm.qrytmp.SQL.Text := 'select sum(quan_shipped) as allqty from data0064 where packing_list_ptr = ' + aq0439.fieldbyname('rkey').AsString +
                        ' group by packing_list_ptr ';
 dm.qrytmp.Open;
 aq64.FieldByName('allqty').AsInteger := dm.qrytmp.fieldbyname('allqty').AsInteger;
 dm.qrytmp.Close;
end;

procedure TForm6.ppReport1PrintingComplete(Sender: TObject);
begin
 {
    aq0439.Edit;
    aq0439print_date.Value:=getsystem_date(dm.ADOQuery1,1);
    aq0439.Post;
  }
end;

procedure TForm6.ppReport1PreviewFormCreate(Sender: TObject);
begin
//
end;

end.
