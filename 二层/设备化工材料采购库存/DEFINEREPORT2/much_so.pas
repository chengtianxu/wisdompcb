unit much_so;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB, ppEndUsr;

type
  TForm3 = class(TForm)
    ADOQuery1: TADOQuery;
    ADOQuery1SALES_REP_NAME: TStringField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1CUSTOMER_PART_NUMBER: TStringField;
    ADOQuery1CUSTOMER_PART_DESC: TStringField;
    ADOQuery1CP_REV: TStringField;
    ADOQuery1SALES_ORDER: TStringField;
    ADOQuery1ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADOQuery1PARTS_ORDERED: TFloatField;
    ADOQuery1REFERENCE_NUMBER: TStringField;
    ADOQuery1PART_PRICE: TFloatField;
    ADOQuery1TOTAL_ADD_L_PRICE: TFloatField;
    ADOQuery1EXCH_RATE: TFloatField;
    ADOQuery1mian_ji: TFloatField;
    ADOQuery1unit_sq: TFloatField;
    ADOQuery1CURR_NAME: TStringField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1QUOTE_PRICE: TWordField;
    ADOQuery1quote_auth: TStringField;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
    ppDB60: TppDBPipeline;
    ppDBPipeline1ppField1: TppField;
    ppDBPipeline1ppField2: TppField;
    ppDBPipeline1ppField3: TppField;
    ppDBPipeline1ppField4: TppField;
    ppDBPipeline1ppField5: TppField;
    ppDBPipeline1ppField6: TppField;
    ppDBPipeline1ppField7: TppField;
    ppDBPipeline1ppField8: TppField;
    ppDBPipeline1ppField9: TppField;
    ppDBPipeline1ppField10: TppField;
    ppDBPipeline1ppField11: TppField;
    ppDBPipeline1ppField12: TppField;
    ppDBPipeline1ppField13: TppField;
    ppDBPipeline1ppField14: TppField;
    ppDBPipeline1ppField15: TppField;
    ppDBPipeline1ppField16: TppField;
    ppDBPipeline1ppField18: TppField;
    ppReport1: TppReport;
    ppTitleBand1: TppTitleBand;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppDB493: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ADOQuery1fob: TStringField;
    ppDBPipeline1ppField17: TppField;
    ADOQuery1ANALYSIS_CODE_1: TStringField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    ADOQuery1ANALYSIS_CODE_3: TStringField;
    ADOQuery1PO_NUMBER: TStringField;
    ppDB60ppField1: TppField;
    ppDB60ppField2: TppField;
    ppDB60ppField3: TppField;
    ppDB60ppField4: TppField;
    ADOQuery1sch_date: TDateTimeField;
    ppDB60ppField5: TppField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses DataModule;

{$R *.dfm}

end.
