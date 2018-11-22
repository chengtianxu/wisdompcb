unit data_module;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOQuery1: TADOQuery;
    Aqwz456: TADOQuery;
    Aqwz22: TADOQuery;
    ADO456: TADOQuery;
    ADO22: TADOQuery;
    ADOQuery2: TADOQuery;
    Aq22: TADOQuery;
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
    Aqwz456rkey: TAutoIncField;
    Aqwz456v_status: TStringField;
    Aqwz456v_type: TStringField;
    Aqwz22INV_PART_NUMBER: TStringField;
    Aqwz22INV_NAME: TStringField;
    Aqwz22INV_DESCRIPTION: TStringField;
    Aqwz22LOCATION: TStringField;
    Aqwz22QUANTITY: TBCDField;
    Aqwz22UNIT_NAME: TStringField;
    Aqwz22BARCODE_ID: TStringField;
    Aqwz22EXPIRE_DATE: TDateTimeField;
    ADO456RKEY: TAutoIncField;
    ADO456GRN_NUMBER: TStringField;
    ADO456DELIVER_NUMBER: TStringField;
    ADO456SUPP_PTR: TIntegerField;
    ADO456PO_PTR: TIntegerField;
    ADO456TTYPE: TWordField;
    ADO456STATUS: TWordField;
    ADO456CREATE_DATE: TDateTimeField;
    ADO456CREATE_BY: TIntegerField;
    ADO456ship_DATE: TDateTimeField;
    ADO456ship_BY: TStringField;
    ADO456AUDITED_BY: TIntegerField;
    ADO456AUDITED_DATE: TDateTimeField;
    ADO456REF_NUMBER: TStringField;
    ADO456PRINTED: TStringField;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    ADO22RKEY: TAutoIncField;
    ADO22GRN_PTR: TIntegerField;
    ADO22INVENTORY_PTR: TIntegerField;
    ADO22SOURCE_PTR: TIntegerField;
    ADO22LOCATION_PTR: TIntegerField;
    ADO22QUANTITY: TBCDField;
    ADO22PRICE: TBCDField;
    ADO22TAX_2: TBCDField;
    ADO22CURRENCY_PTR: TIntegerField;
    ADO22EXCHANGE_RATE: TBCDField;
    ADO22QUAN_ON_HAND: TBCDField;
    ADO22LOCATION_PTR_FROM: TIntegerField;
    ADO22BARCODE_ID: TStringField;
    ADO22EXPIRE_DATE: TDateTimeField;
    ADO456warehouse_ptr: TIntegerField;
    Aq22RKEY: TIntegerField;
    Aq22QUAN_ORD: TBCDField;
    Aq22QUAN_RECD: TBCDField;
    Aq22PRICE: TBCDField;
    Aq22WO_PTR: TIntegerField;
    Aq22PURCHASE_UNIT_PTR: TIntegerField;
    Aq22TAX_2: TBCDField;
    Aq22CONVERSION_FACTOR: TBCDField;
    Aq22INVT_PTR: TIntegerField;
    Aq22QUANTITY: TBCDField;
    Aq22BARCODE_ID: TStringField;
    Aq22EXPIRE_DATE: TDateTimeField;
    Aq22INV_PART_NUMBER: TStringField;
    Aq22INV_NAME: TStringField;
    Aq22INV_DESCRIPTION: TStringField;
    Aq22UNIT_NAME: TStringField;
    Aq22pr_unitname: TStringField;
    Aqwz456PO_PTR: TIntegerField;
    Aq22LOCATION: TStringField;
    Aq22LOCATION_PTR: TIntegerField;
    Aqwz456WAREHOUSE_CODE: TStringField;
    Aqwz456WAREHOUSE_NAME: TStringField;
    Aqwz456ship_BY: TStringField;
    Aqwz456CURR_CODE: TStringField;
    Aqwz456CURR_NAME: TStringField;
    Aqwz456EXCHANGE_RATE: TFloatField;
    Aqwz456DEPT_NAME: TStringField;
    Aqwz456warehouse_ptr: TIntegerField;
    Aq22LOCATION_PTR_FROM: TIntegerField;
    Aqwz456CURRENCY_PTR: TIntegerField;
    Aq22SHELF_LIFE: TSmallintField;
    aq16: TADOQuery;
    aq16rkey: TIntegerField;
    aq16LOCATION: TStringField;
    Aqwz456SUPP_PTR: TIntegerField;
    Aqwz22LOCATION_PTR_FROM: TIntegerField;
    Aqwz22LOCATION_PTR: TIntegerField;
    Aqwz22INVENTORY_PTR: TIntegerField;
    Aqwz22PRICE: TBCDField;
    Aqwz22TAX_2: TBCDField;
    Aqwz22EXCHANGE_RATE: TBCDField;
    Aqwz22CURRENCY_PTR: TIntegerField;
    Aqwz22CURR_CODE: TStringField;
    Aqwz22CURR_NAME: TStringField;
    Aqwz22SHELF_LIFE: TSmallintField;
    Aqwz456AUDITED_BY: TIntegerField;
    Aqwz456AUDITED_DATE: TDateTimeField;
    Aqwz456PRINTED: TStringField;
    procedure Aqwz456CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.Aqwz456CalcFields(DataSet: TDataSet);
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
 end;
end;

end.
