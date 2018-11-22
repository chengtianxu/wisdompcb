unit invtin_report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ppDB, ppComm, ppRelatv, ppDBPipe, ppCtrls, ppPrnabl,
  ppClass, ppBands, ppCache, ppProd, ppReport, ppStrtch, raide, ppMemo,
  ppVar, ppEndUsr;

type
  TForm_report = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
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
    Aqwz22: TADOQuery;
    Aqwz22INV_PART_NUMBER: TStringField;
    Aqwz22INV_NAME: TStringField;
    Aqwz22INV_DESCRIPTION: TStringField;
    Aqwz22LOCATION: TStringField;
    Aqwz22QUANTITY: TBCDField;
    Aqwz22UNIT_NAME: TStringField;
    Aqwz22BARCODE_ID: TStringField;
    Aqwz22EXPIRE_DATE: TDateTimeField;
    Aqwz22PRICE: TBCDField;
    Aqwz22TAX_2: TBCDField;
    ppDB22: TppDBPipeline;
    ppReport1: TppReport;
    Aqwz22amount: TBCDField;
    ppDB22ppField9: TppField;
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
    Aqwz22supplier2: TStringField;
    Aqwz22rohs: TStringField;
    ppDB22ppField10: TppField;
    ppDB22ppField13: TppField;
    ppDesigner1: TppDesigner;
    Aqwz456audited_emplname: TStringField;
    Aqwz456AUDITED_DATE: TDateTimeField;
    ppDB456: TppDBPipeline;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText11: TppDBText;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText12: TppDBText;
    ppLabel5: TppLabel;
    ppDBText13: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppDBText14: TppDBText;
    ppLabel16: TppLabel;
    ppLabel12: TppLabel;
    ppLabel18: TppLabel;
    ppDBText10: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppDBText19: TppDBText;
    ppDBImage1: TppDBImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel21: TppLabel;
    ppDBText20: TppDBText;
    ppLabel22: TppLabel;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppShape2: TppShape;
    ppDetailBand1: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText17: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText5: TppDBText;
    ppDBText18: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel15: TppLabel;
    ppDBText16: TppDBText;
    ppLine18: TppLine;
    ppLabel14: TppLabel;
    ppDBText15: TppDBText;
    ppLine1: TppLine;
    ppDBText6: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppDBCalc1: TppDBCalc;
    ppLabel17: TppLabel;
    plbl1: TppLabel;
    plbl2: TppLabel;
    pdbtxt1: TppDBText;
    Aqwz22DSDesigner: TStringField;
    ppDB22ppField14: TppField;
    Ado0005: TADOQuery;
    DataSource4: TDataSource;
    Ado0005EMPLOYEE_NAME: TStringField;
    ppDB0005: TppDBPipeline;
    Aqwz22cust_decl: TStringField;
    ppDB22ppField15: TppField;
    procedure Aqwz456CalcFields(DataSet: TDataSet);
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_report: TForm_report;

implementation

uses data_module;

{$R *.dfm}

procedure TForm_report.Aqwz456CalcFields(DataSet: TDataSet);
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

procedure TForm_report.ppReport1PrintingComplete(Sender: TObject);
begin
  dm.ADO456.Close;
  dm.ADO456.Parameters[0].Value := self.Aqwz456rkey.Value;
  dm.ADO456.Open;
  dm.ADO456.Edit;
  dm.ADO456PRINTED.Value:='Y';
  dm.ADO456.Post;
end;

end.
