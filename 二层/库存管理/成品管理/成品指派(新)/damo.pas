unit damo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, DB, ADODB;

type
  Tdm = class(TDataModule)
    ADOConnection1: TADOConnection;
    DS64: TDataSource;
    ADS64: TADODataSet;
    aqtmp: TADOQuery;
    AQ64: TADOQuery;
    ADS64sales_order: TStringField;
    ADS64shipment_no: TSmallintField;
    ADS64quan_shipped: TIntegerField;
    ADS64v_assign_type: TStringField;
    ADS64if_ship: TStringField;
    ADS64date_assign: TDateTimeField;
    ADS64remark: TStringField;
    ADS64po_number: TStringField;
    ADS64sch_date: TDateTimeField;
    ADS64parts_ordered: TFloatField;
    ADS64parts_shipped: TFloatField;
    ADS64parts_margin: TFloatField;
    ADS64v_status: TStringField;
    ADS64v_type: TStringField;
    ADS64v_kind: TStringField;
    ADS64reference_number: TStringField;
    ADS64cust_code: TStringField;
    ADS64manu_part_number: TStringField;
    ADS64manu_part_desc: TStringField;
    ADS64ANALYSIS_CODE_1: TStringField;
    ADS64report_unit_value1: TBCDField;
    ADS64rkey: TAutoIncField;
    AQ64RKEY: TAutoIncField;
    AQ64SO_PTR: TIntegerField;
    AQ64ENT_EMPL_PTR: TIntegerField;
    AQ64ENT_CSI_USER_PTR: TIntegerField;
    AQ64packing_list_ptr: TIntegerField;
    AQ64DATE_ASSIGN: TDateTimeField;
    AQ64DATE_SHIPPED: TDateTimeField;
    AQ64PACKING_SLIP_FLAG: TStringField;
    AQ64SHIPMENT_NO: TSmallintField;
    AQ64QUAN_SHIPPED: TIntegerField;
    AQ64QUAN_CREDITED: TIntegerField;
    AQ64RMA_PTR: TIntegerField;
    AQ64part_price: TFloatField;
    AQ64rush_charge: TBCDField;
    AQ64prod_tax_flag: TStringField;
    AQ64tool_tax_flag: TStringField;
    AQ64discount: TBCDField;
    AQ64TAX_2: TBCDField;
    AQ64ovsh_qty: TIntegerField;
    AQ64ovsh_discount: TBCDField;
    AQ64reg_tax_fixed_unused: TWordField;
    AQ64REMARK: TStringField;
    AQ64assign_type: TWordField;
    ADS64rkey25: TAutoIncField;
    ADS64customer_name: TStringField;
    ADS64ent_date: TDateTimeField;
    ADS64po_date: TDateTimeField;
    ADS64shipping_method: TStringField;
    ADS64location: TStringField;
    ADS64rkey60: TAutoIncField;
    ADS64rkey97: TAutoIncField;
    ADS64assign_type: TWordField;
    ADS64parts_returned: TFloatField;
    ADS64returned_ship: TIntegerField;
    ADS64total_shipped: TFloatField;
    ADS64qty_on_hand: TIntegerField;
    ADS64commision_on_tooling: TStringField;
    ADS64employee_name: TStringField;
    ADS64area: TFloatField;
    ADS64abbr_name: TStringField;
    AQ64REPORT_UNIT_VALUE1: TBCDField;
    ADS64REPORT_UNIT_VALUE1_1: TBCDField;
    ADS64set_qty: TIntegerField;
    ADS64CUSTOMER_PTR: TIntegerField;
    ADS64abbrname23: TStringField;
    ADS64cust_decl: TStringField;
    ADS64delivery_no: TStringField;
    AQ64cartons_no: TIntegerField;
    ADS64cartons_no: TIntegerField;
    ADS64REPUT_APPR_BY: TIntegerField;
    ADS64ANALYSIS_CODE_2: TStringField;
    AQ64custshipno: TStringField;
    ADS64custshipno: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
