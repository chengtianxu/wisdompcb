unit damo;

interface

uses
  SysUtils, Classes, ADODB, DB;

type
  Tdm = class(TDataModule)
    adsBrowse: TADODataSet;
    adsBrowseRKEY: TAutoIncField;
    dsBrowse: TDataSource;
    ADOConn: TADOConnection;
    aqTmp: TADOQuery;
    adsBrowsesys_date: TDateTimeField;
    adsBrowseRMA_STATUS: TSmallintField;
    adsBrowsesrce_ptr: TIntegerField;
    adsBrowseRMA_NUMBER: TStringField;
    adsBrowseCUST_CODE: TStringField;
    aq98: TADOQuery;
    aq98RKEY: TAutoIncField;
    aq98RMA_NUMBER: TStringField;
    aq98AUTH_BY_EMPL_PTR: TIntegerField;
    aq98CUSTOMER_PTR: TIntegerField;
    aq98SO_PTR: TIntegerField;
    aq98SO_SHIP_PTR: TIntegerField;
    aq98NOTE_PAD_PTR: TIntegerField;
    aq98RMA_DATE: TDateTimeField;
    aq98Putaway_date: TDateTimeField;
    aq98sys_date: TDateTimeField;
    aq98QTY_AUTH: TBCDField;
    aq98QTY_RECD: TBCDField;
    aq98QTY_CRED: TBCDField;
    aq98RMA_STATUS: TSmallintField;
    aq98ANALYSIS_CODE_1: TWideStringField;
    aq98srce_ptr: TIntegerField;
    aq98GLPTR_STATUS: TBooleanField;
    adsBrowseRMA_DATE: TDateTimeField;
    adsBrowsePutaway_date: TDateTimeField;
    adsBrowseCUSTOMER_NAME: TStringField;
    adsBrowseTStatus: TStringField;
    adsBrowseTNOTE_PAD_PTR: TStringField;
    adsBrowseTGLPTR_STATUS: TStringField;
    adsBrowsesales_order: TStringField;
    adsBrowseEMPLOYEE_NAME: TStringField;
    adsBrowseANALYSIS_CODE_1: TWideStringField;
    adsBrowseQTY_AUTH: TBCDField;
    adsBrowseQTY_RECD: TBCDField;
    adsBrowseQTY_CRED: TBCDField;
    ds98: TDataSource;
    aq98EmpName: TStringField;
    aqFindPO: TADOQuery;
    dsFindPO: TDataSource;
    aqFindPOrkey: TAutoIncField;
    aqFindPOsales_order: TStringField;
    aqFindPOCUST_CODE: TStringField;
    aqFindPOABBR_NAME: TStringField;
    aqFindPOPROD_CODE: TStringField;
    aqFindPOPRODUCT_NAME: TStringField;
    aqFindPOPRODUCT_DESC: TStringField;
    aqFindPOTStatus: TStringField;
    aqFindPOstatus: TWordField;
    dsFindShip: TDataSource;
    aqFindShip: TADOQuery;
    aqFindShiprkey: TAutoIncField;
    aqFindShipsales_order: TStringField;
    aqFindShipOUTNUMBER: TStringField;
    aqFindShipPROD_CODE: TStringField;
    aqFindShipPRODUCT_NAME: TStringField;
    aqFindShipPRODUCT_DESC: TStringField;
    aqFindShipLOCATION: TStringField;
    aqFindShipquantity: TBCDField;
    aqFindShipreturen_qty: TBCDField;
    aqFindShipCUST_CODE: TStringField;
    aqFindShipABBR_NAME: TStringField;
    aqFindShipstatus: TWordField;
    aqFindShipTStatus: TStringField;
    aqFindShipRKEY10: TAutoIncField;
    aqFindShiprkey70: TAutoIncField;
    aqFindPORKEY10: TIntegerField;
    aqInfo: TADOQuery;
    dsInfo: TDataSource;
    aqInfoPROD_CODE: TStringField;
    aqInfoPRODUCT_NAME: TStringField;
    aqInfoPRODUCT_DESC: TStringField;
    aqInfoquantity: TBCDField;
    aqInforeturen_qty: TBCDField;
    aqInforkey: TAutoIncField;
    aqInfosales_order: TStringField;
    adsBrowseSO_SHIP_PTR: TIntegerField;
    aq70: TADOQuery;
    aq70rkey: TAutoIncField;
    aq70sales_order: TStringField;
    aq5: TADOQuery;
    aq5RKEY: TAutoIncField;
    aq5EMPLOYEE_NAME: TStringField;
    aq10: TADOQuery;
    aq10RKEY: TAutoIncField;
    aq10CUST_CODE: TStringField;
    aq10CUSTOMER_NAME: TStringField;
    aq10ABBR_NAME: TStringField;
    ds70: TDataSource;
    ds10: TDataSource;
    adsBrowserkey70: TIntegerField;
    aqFindPOquantity: TBCDField;
    aqFindPOQTY_PLANED: TBCDField;
    aqFindPOPARTS_SHIPPED: TBCDField;
    aqFindPOreturen_qty: TBCDField;
    procedure aq98SO_SHIP_PTRChange(Sender: TField);
    procedure aq98SO_PTRChange(Sender: TField);
    procedure aq98CUSTOMER_PTRChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

uses Browse, Detail;

{$R *.dfm}

procedure Tdm.aq98SO_SHIP_PTRChange(Sender: TField);
begin
  frmBrowse.OpenQuery(aqInfo,[aq98SO_SHIP_PTR.AsString]);
  if frmBrowse.YY = 1 then
    frmDetail.Edit6.Text:= CurrToStr(aqInfoquantity.AsCurrency - aqInforeturen_qty.AsCurrency)
  else
    frmDetail.Edit6.Text:= CurrToStr(aqInfoquantity.AsCurrency - aqInforeturen_qty.AsCurrency + aq98.FieldByName('QTY_AUTH').AsCurrency);
end;

procedure Tdm.aq98SO_PTRChange(Sender: TField);
begin
  frmBrowse.OpenQuery(aq70,[aq98SO_PTR.AsString]);
end;

procedure Tdm.aq98CUSTOMER_PTRChange(Sender: TField);
begin
  frmBrowse.OpenQuery(aq10,[aq98CUSTOMER_PTR.AsString]);
end;

end.
