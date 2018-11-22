unit misc_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ppDB, ppComm, ppRelatv, ppDBPipe, ADODB,raide, ppProd,
  ppClass, ppReport, ppCtrls, ppPrnabl, ppBands, ppCache, ppEndUsr;

type
  TForm_miscreport = class(TForm)
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
    ppReport1: TppReport;
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
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine14: TppLine;
    ppLabel11: TppLabel;
    ppDBText11: TppDBText;
    ppLabel15: TppLabel;
    ppDBText14: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine15: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel12: TppLabel;
    ppDesigner1: TppDesigner;
    dtmfldAqwz456AUDITED_DATE: TDateTimeField;
    wdstrngfldAqwz456AUDITED_NAME: TWideStringField;
    ppDB456: TppDBPipeline;
    pfldDB456ppField1: TppField;
    pfldDB456ppField2: TppField;
    pfldDB456ppField3: TppField;
    pfldDB456ppField4: TppField;
    pfldDB456ppField5: TppField;
    pfldDB456ppField6: TppField;
    pfldDB456ppField7: TppField;
    pfldDB456ppField8: TppField;
    pfldDB456ppField9: TppField;
    pfldDB456ppField10: TppField;
    pfldDB456ppField11: TppField;
    pfldDB456ppField12: TppField;
    pfldDB456ppField13: TppField;
    pfldDB456ppField14: TppField;
    pfldDB456ppField15: TppField;
    pfldDB456ppField16: TppField;
    pfldDB456ppField17: TppField;
    pfldDB456ppField18: TppField;
    pfldDB456ppField19: TppField;
    pfldDB456ppField20: TppField;
    pfldDB456ppField21: TppField;
    pfldDB456ppField22: TppField;
    pfldDB456ppField23: TppField;
    pfldDB456ppField24: TppField;
    plbl1: TppLabel;
    plbl2: TppLabel;
    pdbtxt1: TppDBText;
    pdbtxt2: TppDBText;
    ppPageStyle1: TppPageStyle;
    pln1: TppLine;
    Ado0005: TADOQuery;
    Ado0005EMPLOYEE_NAME: TStringField;
    DataSource4: TDataSource;
    ppDB0005: TppDBPipeline;
    Aqwz235cust_decl: TStringField;
    ppDB235ppField12: TppField;
    procedure Aqwz456CalcFields(DataSet: TDataSet);
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_miscreport: TForm_miscreport;

implementation

uses main, data_module;

{$R *.dfm}

procedure TForm_miscreport.Aqwz456CalcFields(DataSet: TDataSet);
begin
 case aqwz456status.Value of
  1 : aqwz456v_status.Value := '未提交';
  2 : aqwz456v_status.Value := '待审核';
  3 : aqwz456v_status.Value := '已审核';
  4 : aqwz456v_status.Value := '已记帐';
  5 : aqwz456v_status.Value := '已付款';
  6 : aqwz456v_status.Value := '被退回';
 end;
 case
  self.Aqwz456TTYPE.Value of
  1:Aqwz456v_type.Value:='编码入库';
  2:Aqwz456v_type.Value:='杂项入库';
  3:Aqwz456v_type.Value:='直接入库';
  5:Aqwz456v_type.Value:='VMI入库';
 end;
end;

procedure TForm_miscreport.ppReport1PrintingComplete(Sender: TObject);
begin
  dm.ADO456.Close;
  dm.ADO456.Parameters[0].Value := self.Aqwz456rkey.Value;
  dm.ADO456.Open;
  dm.ADO456.Edit;
  dm.ADO456PRINTED.Value:='Y';
  dm.ADO456.Post;
end;

end.
