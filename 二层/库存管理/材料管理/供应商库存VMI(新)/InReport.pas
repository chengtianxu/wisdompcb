unit InReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppDB, ppComm, ppRelatv, ppDBPipe, DB, ADODB, ppBands, ppCache,
  ppClass, ppEndUsr, ppProd, ppReport, ppCtrls, ppStrtch, ppMemo, ppPrnabl,
  ppModule, daDataModule, ppVar;

type
  TForm_InReport = class(TForm)
    Aqwz133: TADOQuery;
    Aqwz134: TADOQuery;
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
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    ppDB133: TppDBPipeline;
    ppDB134: TppDBPipeline;
    ppDB493: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppTitleBand1: TppTitleBand;
    ppSummaryBand1: TppSummaryBand;
    Aqwz133RKEY: TAutoIncField;
    Aqwz133GRN_NUMBER: TStringField;
    Aqwz133DELIVER_NUMBER: TStringField;
    Aqwz133CODE: TStringField;
    Aqwz133SUPPLIER_NAME: TStringField;
    Aqwz133ABBR_NAME: TStringField;
    Aqwz133ship_DATE: TDateTimeField;
    Aqwz133TTYPE: TSmallintField;
    Aqwz133REF_NUMBER: TStringField;
    Aqwz133PO_NUMBER: TStringField;
    Aqwz133EMPLOYEE_NAME: TStringField;
    Aqwz133EMPL_CODE: TStringField;
    Aqwz133WAREHOUSE_CODE: TStringField;
    Aqwz133WAREHOUSE_NAME: TStringField;
    Aqwz133ship_BY: TStringField;
    Aqwz133CURR_CODE: TStringField;
    Aqwz133CURR_NAME: TStringField;
    Aqwz133DEPT_NAME: TStringField;
    Aqwz133exch_rate: TBCDField;
    Aqwz134INV_PART_NUMBER: TStringField;
    Aqwz134INV_NAME: TStringField;
    Aqwz134INV_DESCRIPTION: TStringField;
    Aqwz134LOCATION: TStringField;
    Aqwz134QUANTITY: TBCDField;
    Aqwz134UNIT_NAME: TStringField;
    Aqwz134supplier2: TStringField;
    Aqwz134BARCODE_ID: TStringField;
    Aqwz134EXPIRE_DATE: TDateTimeField;
    Aqwz134price: TBCDField;
    Aqwz134TAX_2: TBCDField;
    Aqwz134rohs: TStringField;
    Aqwz134amount: TBCDField;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppShape1: TppShape;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    Aqwz133v_type: TStringField;
    ppDBText22: TppDBText;
    ppLine1: TppLine;
    ppLine2: TppLine;
    Aqwz134cust_decl: TStringField;
    ppDB134ppField14: TppField;
    procedure Aqwz133CalcFields(DataSet: TDataSet);
    procedure ppReport1PrintingComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_InReport: TForm_InReport;

implementation

uses demo;

{$R *.dfm}

procedure TForm_InReport.Aqwz133CalcFields(DataSet: TDataSet);
begin
 case
  self.Aqwz133TTYPE.Value of
  1:Aqwz133v_type.Value:='编码入库';
  3:Aqwz133v_type.Value:='直接入库';
 end;
end;

procedure TForm_InReport.ppReport1PrintingComplete(Sender: TObject);
begin
dm.ADO133.Close;
dm.ADO133.Parameters[0].Value:=self.Aqwz133RKEY.Value;
dm.ADO133.Open;
dm.ADO133.Edit;
dm.ADO133PRINTED.Value:='Y';
dm.ADO133.Post;
end;


end.
