unit much_so;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB, ppEndUsr, ppStrtch, ppMemo;

type
  TForm3 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
    ppDB60: TppDBPipeline;
    ppReport1: TppReport;
    ppDB493: TppDBPipeline;
    ppDesigner1: TppDesigner;
    ADOQuery1SALES_REP_NAME: TStringField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1SALES_ORDER: TStringField;
    ADOQuery1ORIG_SCHED_SHIP_DATE: TDateTimeField;
    ADOQuery1PARTS_ORDERED: TFloatField;
    ADOQuery1REFERENCE_NUMBER: TStringField;
    ADOQuery1PART_PRICE: TFloatField;
    ADOQuery1TOTAL_ADD_L_PRICE: TFloatField;
    ADOQuery1EXCH_RATE: TFloatField;
    ADOQuery1CURR_NAME: TStringField;
    ADOQuery1mian_ji: TFloatField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1QUOTE_PRICE: TWordField;
    ADOQuery1FOB: TStringField;
    ADOQuery1PO_NUMBER: TStringField;
    ADOQuery1SCH_DATE: TDateTimeField;
    ADOQuery1so_oldnew: TStringField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1ANALYSIS_CODE_2: TStringField;
    ADOQuery1ANALYSIS_CODE_3: TStringField;
    ADOQuery1ANALYSIS_CODE_1: TStringField;
    ADOQuery1unit_sq: TFloatField;
    ADOQuery1rohs: TStringField;
    ADOQuery1quote_auth: TStringField;
    ppDB60ppField25: TppField;
    ppTitleBand1: TppTitleBand;
    ppDBText5: TppDBText;
    ppLabel1: TppLabel;
    ppDBImage1: TppDBImage;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel31: TppLabel;
    ppLine40: TppLine;
    ppLabel32: TppLabel;
    ppLine42: TppLine;
    ppMemo1: TppMemo;
    ppLabel33: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppDBText13: TppDBText;
    ppLine41: TppLine;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine43: TppLine;
    ppDBText16: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape2: TppShape;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLine30: TppLine;
    ppLine31: TppLine;
    ppLine32: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLine33: TppLine;
    ppLine34: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppLine38: TppLine;
    ppLabel28: TppLabel;
    ppLine35: TppLine;
    ppLabel29: TppLabel;
    ppLine39: TppLine;
    ppLabel30: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    ppDBCalc1: TppDBCalc;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
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

procedure TForm3.ADOQuery1CalcFields(DataSet: TDataSet);
begin
case adoquery1.FieldValues['quote_price'] of
  0: adoquery1.FieldValues['quote_auth']:='Œ¥∆¿…Û';
  1: adoquery1.FieldValues['quote_auth']:='“—∆¿…Û';
  2: adoquery1.FieldValues['quote_auth']:='±ªÕÀªÿ';
  3: adoquery1.FieldValues['quote_auth']:='≤ª∆¿…Û';
 end;
end;

end.
