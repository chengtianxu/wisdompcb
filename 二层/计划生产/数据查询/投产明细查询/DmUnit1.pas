unit DmUnit1;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    TemADOQuery1: TADOQuery;
    ADOQuery1TTYPE: TWordField;
    ADOQuery1CUT_NO: TStringField;
    ADOQuery1SO_NO: TStringField;
    ADOQuery1PLANNED_QTY: TIntegerField;
    ADOQuery1ISSUED_QTY: TIntegerField;
    ADOQuery1ISSUE_DATE: TDateTimeField;
    ADOQuery1rate: TFloatField;
    ADOQuery1area1: TFloatField;
    ADOQuery1area2: TFloatField;
    ADOQuery1rkey: TAutoIncField;
    ADOQuery1ABBR_NAME: TStringField;
    ADOQuery1MyPART_PRICE: TBCDField;
    ADOQuery1APP_QUAN: TIntegerField;
    ADOQuery1CUST_CODE: TStringField;
    ADOQuery1MyData0492TTYPE: TStringField;
    ADOQuery1MANU_PART_NUMBER: TStringField;
    ADOQuery1MANU_PART_DESC: TStringField;
    ADOQuery1sch_date: TDateTimeField;
    ADOQuery1PRODUCT_NAME: TStringField;
    ADOQuery1analysis_code_3: TStringField;
    ADOQuery1PROD_CODE: TStringField;
    ADOQuery1pnl1_size: TStringField;
    ADOQuery1pnl2_size: TStringField;
    ADOQuery1unit_sq: TFloatField;
    ADOQuery1remark2: TStringField;
    ADOQuery1ORD_REQ_QTY: TIntegerField;
    ADOQuery1area3: TFloatField;
    ADOQuery1employee_name: TStringField;
    ADOQuery1status: TStringField;
    ADOQuery1qty_reject: TIntegerField;
    tmp: TADOQuery;
    ADOQuery1PANEL_1_QTY: TIntegerField;
    ADOQuery1UPANEL1: TIntegerField;
    ADOQuery1PANEL_2_QTY: TIntegerField;
    ADOQuery1UPANEL2: TIntegerField;
    ADOQuery1warehouse_code: TStringField;
    ADOQuery1TUSAGE: TBCDField;
    ADOQuery1area3_1: TFloatField;
    ADOQuery1area1_1: TFloatField;
    ADOQuery1area2_1: TFloatField;
    ADOQuery1unit_sq_1: TFloatField;
    AdoWDetails: TADOQuery;
    ADOQuery1d414number: TStringField;
    ADOQuery1d415number: TStringField;
    ADOQuery1PARTS_ORDERED: TFloatField;
    ADOQuery1area_4: TFloatField;
    ADOQuery1so_oldnew: TStringField;
    ADOQuery1rw_caotou_qty: TFloatField;
    ADOQuery1rw_caotou_mianji: TFloatField;
    ADOQuery1FG_QTY: TIntegerField;
    ADOQuery1WIP_QTY: TIntegerField;
    ADOQuery1waitfor_release: TIntegerField;
    ADOQuery1QTY_REJECT2: TFloatField;
    ADOQuery1EST_SCRAP: TFloatField;
    ADOQuery1PO_NUMBER: TStringField;
    AdoViewSales: TADOQuery;
    adoField: TADOQuery;
    DataSource3: TDataSource;
    AdoViewSalesSALES_ORDER: TStringField;
    AdoViewSalesPARTS_ORDERED: TFloatField;
    AdoViewSalesQTY_PLANNED: TIntegerField;
    AdoViewSalesISSUED_QTY: TIntegerField;
    AdoViewSalesTO_BE_PLANNED: TIntegerField;
    ADOQuery1ORIG_CUSTOMER: TStringField;
    ADOQuery1LAYERS: TWordField;
    ADOQuery1cite_qryonhand: TIntegerField;
    procedure adoFieldBeforeInsert(DataSet: TDataSet);
    procedure adoFieldBeforeDelete(DataSet: TDataSet);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}


procedure TDM.adoFieldBeforeInsert(DataSet: TDataSet);
begin
  abort;
end;

procedure TDM.adoFieldBeforeDelete(DataSet: TDataSet);
begin
  abort;
end;

end.
