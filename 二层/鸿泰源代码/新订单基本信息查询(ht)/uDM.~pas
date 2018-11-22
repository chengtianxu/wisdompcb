unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Provider, DBClient;

type
  TDM = class(TDataModule)
    Conn: TADOConnection;
    DS60: TADODataSet;
    DS60audited: TStringField;
    DS60cstatus: TStringField;
    DS60cust_code: TStringField;
    DS60customer_name: TStringField;
    DS60ANALYSIS_CODE_2: TStringField;
    DS60MANU_PART_NUMBER: TStringField;
    DS60MANU_PART_DESC: TStringField;
    DS60to_be_planned: TIntegerField;
    DS60product_name: TStringField;
    DS60po_number: TStringField;
    DS60sales_order: TStringField;
    DS60layers: TWordField;
    DS60qty_plannned: TIntegerField;
    DS60prod_rel: TStringField;
    DS60rkey: TIntegerField;
    DS60prod_code: TStringField;
    DS60so_tp: TWordField;
    DS60curr_code: TStringField;
    DS60part_price: TFloatField;
    DS60exch_rate: TFloatField;
    DS60ent_date: TDateTimeField;
    DS60status: TWordField;
    DS60REFERENCE_NUMBER: TStringField;
    DS60parts_ordered: TFloatField;
    DS60parts_shipped: TFloatField;
    DS60parts_returned: TFloatField;
    DS60parts_invoiced: TFloatField;
    DS60issued_qty: TIntegerField;
    DS60parts_needed: TFloatField;
    DS60free_amount: TFloatField;
    DS60total_add_l_price: TFloatField;
    DS60returned_ship: TIntegerField;
    DS60parameter_value: TFloatField;
    DS60sq_needed: TFloatField;
    DS60sq_needed1: TFloatField;
    DS62: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DS62amount: TFloatField;
    DS62category: TStringField;
    DS62free_amount: TFloatField;
    DS62so_ptr: TIntegerField;
    AQrySOTP: TADOQuery;
    AQrySOTPCType: TStringField;
    AQrySOTPsumNumber: TCurrencyField;
    AQrySOTPso_tp: TIntegerField;
    AQrySOTPSQ: TCurrencyField;
    AQryTTYP: TADOQuery;
    AQryTTYPsumNumber: TFloatField;
    AQryTTYPSQ: TFloatField;
    AQryTTYPTTYPE: TSmallintField;
    AQryTTYPCType: TStringField;
    AQryDD: TADOQuery;
    DataSource3: TDataSource;
    AQryDDSALES_ORDER: TStringField;
    AQryDDSCH_DATE: TDateTimeField;
    AQryDDPARTS_ORDERED: TFloatField;
    AQryDDtotal_shipped: TIntegerField;
    AQryDDdcy: TStringField;
    AQryKH: TADOQuery;
    DS60sq_parts: TFloatField;
    DS60SALES_REP_NAME: TStringField;
    DS60orig_request_date: TDateTimeField;
    DS60orig_sched_ship_date: TDateTimeField;
    DS60sch_date: TDateTimeField;
    aqtmp: TADOQuery;
    DS60ABBR_NAME: TStringField;
    DS60qty_on_hand: TIntegerField;
    DS60warehouse_code: TStringField;
    DS60so_oldnew: TStringField;
    DS60RUSH_CHARGE: TBCDField;
    DS60freeamount: TFloatField;
    DS62costfree_amount: TFloatField;
    DS60fed_tax_id_no: TStringField;
    DS60conf_date: TDateTimeField;
    DS60LOCATION: TStringField;
    dtmfldDS60AUDITED_DATE: TDateTimeField;
    DS60DXKC: TFloatField;
    DS60REPUT_APPR_BY: TIntegerField;
    DS60pack_qianshu: TFloatField;
    DS60ANALYSIS_CODE_1: TStringField;
    DS60ANALYSIS_CODE_5: TStringField;
    DS60set_qty: TIntegerField;
    DS60ORIG_CUSTOMER: TStringField;
    cds0849: TClientDataSet;
    cds0849D419_ptr: TIntegerField;
    cds0849D073_ptr: TIntegerField;
    cds0849FormName: TStringField;
    cds0849GridName: TStringField;
    cds0849FieldName: TStringField;
    cds0849FieldCaption: TStringField;
    cds0849FieldOrder: TIntegerField;
    cds0849FieldWidth: TIntegerField;
    cds0849IsDisplay: TBooleanField;
    dsp0849: TDataSetProvider;
    dt0849: TADODataSet;
    dt0849D419_ptr: TIntegerField;
    dt0849D073_ptr: TIntegerField;
    dt0849GridName: TStringField;
    dt0849FieldName: TStringField;
    dt0849FieldCaption: TStringField;
    dt0849FieldOrder: TIntegerField;
    dt0849FieldWidth: TIntegerField;
    dt0849IsDisplay: TBooleanField;
    dt0849FormName: TStringField;
    cdsRead: TClientDataSet;
    dspRead: TDataSetProvider;
    dtRead: TADODataSet;
    dsTotal: TDataSource;
    aqTotal: TADOQuery;
    aqTotalMANU_PART_NUMBER: TStringField;
    aqTotalDSDesigner: TFloatField;
    aqTotalDSDesigner2: TFloatField;
    aqTotalDSDesigner3: TFloatField;
    aqTotalDSDesigner4: TFloatField;
    aqTotalDSDesigner5: TFloatField;
    aqTotalDSDesigner6: TFloatField;
    aqTotalDSDesigner7: TFloatField;
    aqTotalDSDesigner8: TFloatField;
    aqTotalDSDesigner9: TFloatField;
    aqTotalDSDesigner10: TFloatField;
    aqTotalDSDesigner11: TFloatField;
    aqTotalDSDesigner12: TFloatField;
    aqTotalDSDesigner13: TFloatField;
    aqTotalField: TFloatField;
    DS60SHIPPING_CONTACT: TStringField;
    DS60FOB: TStringField;
    DS60SHIPPING_METHOD: TStringField;
    DS60SHIP_CONTACT_PHONE: TStringField;
    DS60stand_rate: TFloatField;
    DS60DSDesigner: TStringField;
    DS60TaxAmount: TFloatField;
    DS60SampleYN: TStringField;
    DS60ROW_NAME: TStringField;
    DS60NoTaxAmount: TFloatField;
    DS60CPJS: TStringField;
    DS60TNUMBER: TStringField;
    DS60rate_margin: TBCDField;
    DS60poname: TStringField;
    DS60t68: TStringField;
    DS60t56: TStringField;
    DS60T61: TStringField;
    strngfldDS60t93: TStringField;
    DS60cust_a: TStringField;
    DS60RemarkSO: TStringField;
    DS60ofree: TStringField;
    procedure DS60CalcFields(DataSet: TDataSet);
    procedure AQrySOTPCalcFields(DataSet: TDataSet);
    procedure AQryTTYPCalcFields(DataSet: TDataSet);
    procedure aqTotalCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.DS60CalcFields(DataSet: TDataSet);
begin
 case dm.DS60.FieldByName('status').asinteger of
  1: dm.DS60.FieldValues['cstatus']:='有效的';
  2: dm.DS60.FieldValues['cstatus']:='暂缓';
  3: dm.DS60.FieldValues['cstatus']:='已关闭';
  4: dm.DS60.FieldValues['cstatus']:='已完成';
  5: dm.DS60.FieldValues['cstatus']:='已取消';
  6: dm.DS60.FieldValues['cstatus']:='未提交';
 end;

 case dm.DS60.FieldByName('prod_rel').AsInteger of
  1: dm.DS60.FieldByName('audited').AsString:='未确认';
  2: dm.DS60.FieldByName('audited').AsString:='已确认';
  3: dm.DS60.FieldByName('audited').AsString:='已投产';
  4: dm.DS60.FieldByName('audited').AsString:='已取消';
 end;

end;

procedure TDM.AQrySOTPCalcFields(DataSet: TDataSet);
begin
 case AQrySOTP.FieldValues['so_tp'] of
  0: AQrySOTP.FieldValues['CType']:='自制';
  1: AQrySOTP.FieldValues['CType']:='外发';
  2: AQrySOTP.FieldValues['CType']:='半制程';
 end;
end;

procedure TDM.AQryTTYPCalcFields(DataSet: TDataSet);
begin
 case AQryTTYP.FieldValues['TTYPE'] of
  0: AQryTTYP.FieldValues['CType']:='量产板';
  1: AQryTTYP.FieldValues['CType']:='样板';
 end;
end;

procedure TDM.aqTotalCalcFields(DataSet: TDataSet);
begin
  aqTotal.FieldByName('待投产数量').AsFloat:= aqTotal.FieldByName('订单数量').AsFloat-aqTotal.FieldByName('投产数量').AsFloat;
end;

end.
