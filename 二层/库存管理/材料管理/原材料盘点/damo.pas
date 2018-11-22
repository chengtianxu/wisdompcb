unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADO92: TADOQuery;
    DataSource1: TDataSource;
    ADO92RKEY: TAutoIncField;
    ADO92PHY_COUNT_NO: TStringField;
    ADO92TDATE: TDateTimeField;
    ADO92EMPLOYEE_PTR: TIntegerField;
    ADO92USER_PTR: TIntegerField;
    ADO92WHOUSE_PTR: TIntegerField;
    ADO92BEG_LOC_PTR: TIntegerField;
    ADO92END_LOC_PTR: TIntegerField;
    ADO92STATUS: TStringField;
    ADO92BEG_INVT_PTR: TIntegerField;
    ADO92END_INVT_PTR: TIntegerField;
    ADO92employee_name: TStringField;
    ADO92warehouse_code: TStringField;
    ADO92warehouse_name: TStringField;
    ADO92BEG_CYCLE_ptr: TIntegerField;
    ADO92END_CYCLE_ptr: TIntegerField;
    ADOQuery1: TADOQuery;
    ADO93: TADOQuery;
    ADO93RKEY: TAutoIncField;
    ADO93PHY_LIST_PTR: TIntegerField;
    ADO93INVENTORY_PTR: TIntegerField;
    ADO93INV_TRAN_PTR: TIntegerField;
    ADO93ENTERED_BY_EMPL_PTR: TIntegerField;
    ADO93USER_PTR: TIntegerField;
    ADO93COUNTED_BY_EMPL_PTR: TIntegerField;
    ADO93LOCATION_PTR: TIntegerField;
    AQ22: TADOQuery;
    AQ22RKEY: TIntegerField;
    AQ22INVENTORY_PTR: TIntegerField;
    AQ22LOCATION_PTR: TIntegerField;
    AQ93: TADOQuery;
    AQ93INV_PART_NUMBER: TStringField;
    AQ93GROUP_NAME: TStringField;
    AQ93LOCATION: TStringField;
    AQ93BARCODE_ID: TStringField;
    AQ93EMPLOYEE_NAME: TStringField;
    AQ93RKEY: TIntegerField;
    AQ93QUANTITY: TFloatField;
    AQ93COUNTED_BY_EMPL_PTR: TIntegerField;
    AQ93LOCATION_PTR: TIntegerField;
    AQ93rkey22: TIntegerField;
    ADOupdate: TADOQuery;
    ADOupdateQUAN_ON_HAND: TFloatField;
    ADOupdateQUANTITY: TFloatField;
    ADOupdateINVENTORY_PTR: TIntegerField;
    ADOupdateINV_TRAN_PTR: TIntegerField;
    ADOupdateENTERED_BY_EMPL_PTR: TIntegerField;
    ADOupdateUSER_PTR: TIntegerField;
    ADOupdateCOUNTED_BY_EMPL_PTR: TIntegerField;
    ADOupdatedivergent: TFloatField;
    ado95: TADOQuery;
    ado95RKEY: TAutoIncField;
    ado95TRAN_TP: TSmallintField;
    ado95INVT_PTR: TIntegerField;
    ado95SRCE_PTR: TIntegerField;
    ado95TRAN_BY: TIntegerField;
    ado95USER_PTR: TIntegerField;
    ado95REC_BY: TIntegerField;
    ado95STORAGE_MTHD_FLAG: TStringField;
    ado95TRAN_DATE: TDateTimeField;
    ado95QUANTITY: TFloatField;
    ado95SHIPPING_METHOD: TStringField;
    ado95REFERENCE_NUMBER: TStringField;
    ado95QTY_RETURNED: TFloatField;
    ADOdivport: TADOQuery;
    ADOdivportQUANTITY: TFloatField;
    ADOdivportdivergent: TFloatField;
    ADOdivportINV_PART_NUMBER: TStringField;
    ADOdivportINV_PART_DESCRIPTION: TStringField;
    ADOdivportUNIT_CODE: TStringField;
    ADOdivportSTD_COST: TFloatField;
    ADOdivportLOCATION: TStringField;
    ADOdivportamount: TFloatField;
    ADO493: TADOQuery;
    ADO493Company_Name: TStringField;
    ADO493ship_address: TStringField;
    ADO493Company_Icon: TBlobField;
    ADO493SITE_INFO_ADD_1: TStringField;
    ADO493SITE_INFO_ADD_2: TStringField;
    ADO493SITE_INFO_ADD_3: TStringField;
    ADO493SITE_INFO_PHONE: TStringField;
    ADOdivportbarcode_id: TStringField;
    AQ93EXPIRE_DATE: TDateTimeField;
    AQ93INV_PART_DESCRIPTION: TStringField;
    AQ93UNIT_CODE: TStringField;
    AQ93ABBR_NAME: TStringField;
    ADO92v_status: TStringField;
    ADO93status: TWordField;
    ADOupdatestatus: TWordField;
    aqdc93: TADOQuery;
    aqdc93INV_PART_NUMBER: TStringField;
    aqdc93INV_PART_DESCRIPTION: TStringField;
    aqdc93GROUP_NAME: TStringField;
    aqdc93LOCATION: TStringField;
    aqdc93BARCODE_ID: TStringField;
    aqdc93EMPLOYEE_NAME: TStringField;
    aqdc93QUANTITY: TFloatField;
    aqdc93EXPIRE_DATE: TDateTimeField;
    aqdc93ABBR_NAME: TStringField;
    aqdc93UNIT_CODE: TStringField;
    aqdc93STATUS: TWordField;
    aqdc93v_status: TStringField;
    aqdc93check_no: TStringField;
    ADO93check_no: TStringField;
    AQ93check_no: TStringField;
    aqdc93STD_COST: TFloatField;
    AQ22QUAN_ON_HAND: TFloatField;
    aqdc93OLD_QUANTITY: TFloatField;
    AQ93OLD_QUANTITY: TFloatField;
    ADOdivportOLD_QUANTITY: TFloatField;
    DataSource2: TDataSource;
    AQ93code: TStringField;
    AQ93unit_name: TStringField;
    ADOdivportEMPLOYEE_NAME: TStringField;
    ADO93QUANTITY: TBCDField;
    ADO93OLD_QUANTITY: TBCDField;
    ADO92abbr_name: TStringField;
    aqdc93tax_price: TBCDField;
    aqdc93TAX_2: TBCDField;
    aqdc93CURR_NAME: TStringField;
    aqdc93exch_rate: TBCDField;
    aqdc93GROUP_DESC: TStringField;
    ADO92OVER_DATE: TDateTimeField;
    aqdc93ship_DATE: TDateTimeField;
    procedure ADO92CalcFields(DataSet: TDataSet);
    procedure aqdc93CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO92CalcFields(DataSet: TDataSet);
begin
if self.ADO92STATUS.Value='0' then
 self.ADO92v_status.Value:='进行中'
else
 self.ADO92v_status.Value:='已完成';
end;

procedure TDM.aqdc93CalcFields(DataSet: TDataSet);
begin
if dm.aqdc93status.Value=0 then
 dm.aqdc93v_status.Value:='未输入'
else
if dm.aqdc93status.Value=1 then
 dm.aqdc93v_status.Value:='已输入'
else
 dm.aqdc93v_status.Value:='已更新';
end;

end.
