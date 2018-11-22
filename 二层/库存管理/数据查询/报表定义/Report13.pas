unit Report13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppModule, raCodMod, ppBands, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppCache, ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB,
  StdCtrls, ppEndUsr;

type
  TFrmReport13 = class(TForm)
    DataSource1: TDataSource;
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
    Aqwz456DEPT_NAME: TStringField;
    Aqwz456exch_rate: TBCDField;
    ppDB456: TppDBPipeline;
    ppDB456ppField2: TppField;
    ppDB456ppField3: TppField;
    ppDB456ppField4: TppField;
    ppDB456ppField5: TppField;
    ppDB456ppField6: TppField;
    ppDB456ppField7: TppField;
    ppDB456ppField10: TppField;
    ppDB456ppField11: TppField;
    ppDB456ppField12: TppField;
    ppDB456ppField13: TppField;
    ppDB456ppField14: TppField;
    ppDB456ppField15: TppField;
    ppDB456ppField16: TppField;
    ppDB456ppField17: TppField;
    ppDB456ppField18: TppField;
    ppDB456ppField19: TppField;
    ppDB456ppField20: TppField;
    ppDB456ppField21: TppField;
    ppDB456ppField23: TppField;
    Aq493: TADOQuery;
    Aq493Company_Name: TStringField;
    Aq493Company_Name2: TStringField;
    Aq493Company_Name3: TStringField;
    Aq493ship_address: TStringField;
    Aq493Company_Icon: TBlobField;
    Aq493SITE_INFO_ADD_1: TStringField;
    Aq493SITE_INFO_ADD_2: TStringField;
    Aq493SITE_INFO_ADD_3: TStringField;
    Aq493SITE_INFO_PHONE: TStringField;
    DataSource3: TDataSource;
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
    DataSource2: TDataSource;
    Aqwz235: TADOQuery;
    Aqwz235DESCRIPTION: TStringField;
    Aqwz235GUI_GE: TStringField;
    Aqwz235DESCRIPTION2: TStringField;
    Aqwz235UNIT_NAME: TStringField;
    Aqwz235QUAN_RECD: TBCDField;
    Aqwz235LOCATION: TStringField;
    Aqwz235REF_NUMBER: TStringField;
    Aqwz235tax_price: TFloatField;
    Aqwz235STATE_TAX: TBCDField;
    Aqwz235rohs: TStringField;
    Aqwz235amount: TFloatField;
    ppDB235: TppDBPipeline;
    ppDB235ppField1: TppField;
    ppDB235ppField2: TppField;
    ppDB235ppField3: TppField;
    ppDB235ppField4: TppField;
    ppDB235ppField5: TppField;
    ppDB235ppField6: TppField;
    ppDB235ppField7: TppField;
    ppDB235ppField8: TppField;
    ppDB235ppField9: TppField;
    ppDB235ppField10: TppField;
    ppDB235ppField11: TppField;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText9: TppDBText;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppLabel13: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppLabel14: TppLabel;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLine1: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    ppLabel15: TppLabel;
    ppDBText14: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppDBCalc1: TppDBCalc;
    ppLabel12: TppLabel;
    ppLabel17: TppLabel;
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmReport13: TFrmReport13;

implementation
uses datamodule;
{$R *.dfm}

procedure TFrmReport13.ppReport1PrintingComplete(Sender: TObject);
begin
//
end;

end.
