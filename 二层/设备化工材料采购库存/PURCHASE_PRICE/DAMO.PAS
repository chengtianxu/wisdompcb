unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs;

type
  TDM = class(TDataModule)
   ADOConnection1: TADOConnection;
   aq0028: TADOQuery;
   DataSource1: TDataSource;
   ADOQuery1: TADOQuery;
   ADO28: TADOQuery;
   DataSource2: TDataSource;
   ADO28RKEY: TAutoIncField;
   ADO28SUPPLIER_PTR: TIntegerField;
   ADO28INVENTORY_PTR: TIntegerField;
   ADO28EMPLOYEE_PTR: TIntegerField;
   ADO28CSI_USER_PTR: TIntegerField;
   ADO28TDATE: TDateTimeField;
   ADO28SUPPLIER_PART_NO: TStringField;
   ADO28SUGG_REORDER_QTY: TFloatField;
   ADO28LEAD_TIME: TSmallintField;
   ADO28MIN_ORDER_QTY: TFloatField;
   ADO28MIN_ORDER_AMT: TFloatField;
   ADO28TAX_1: TFloatField;
   ADO28TAX_2: TFloatField;
   ADO28PRICE_1: TFloatField;
   ADO28PRICE_2: TFloatField;
   ADO28PRICE_3: TFloatField;
   ADO28PRICE_4: TFloatField;
   ADO28PRICE_5: TFloatField;
   ADO28PRICE_6: TFloatField;
   ADO28QUAN_VOL_1: TFloatField;
   ADO28QUAN_VOL_2: TFloatField;
   ADO28QUAN_VOL_3: TFloatField;
   ADO28QUAN_VOL_4: TFloatField;
   ADO28QUAN_VOL_5: TFloatField;
   ADO28DISC_1: TFloatField;
   ADO28DISC_2: TFloatField;
   ADO28DISC_3: TFloatField;
   ADO28DISC_4: TFloatField;
   ADO28DISC_5: TFloatField;
   ADO28DISC_6: TFloatField;
   ADO28TAX_3: TFloatField;
   ADO28TAX_4: TFloatField;
   ADO28PURCHASE_UNIT_PTR: TIntegerField;
   ADO28CONVERSION_FACTOR: TFloatField;
   ADO28AVL_FLAG: TStringField;
   ADO28CURRENCY_PTR: TIntegerField;
   ADO28EDI_OUT_FORCST: TIntegerField;
   ADO28AMT_QUAN_FLAG: TWordField;
   ADOQuery2: TADOQuery;
    ADO17: TADOQuery;
    ADO2811: TADOStoredProc;
    ADO28qte_price: TFloatField;
    aq0028inv_part_number: TStringField;
    aq0028inv_part_description: TStringField;
    aq0028stock_unit_ptr: TIntegerField;
    aq0028code: TStringField;
    aq0028supplier_name: TStringField;
    aq0028lead_time: TSmallintField;
    aq0028supplier_part_no: TStringField;
    aq0028sugg_reorder_qty: TFloatField;
    aq0028curr_name: TStringField;
    aq0028curr_code: TStringField;
    aq0028rkey: TAutoIncField;
    aq0028unit_code: TStringField;
    aq0028unit_name: TStringField;
    aq0028PRICE_1: TFloatField;
    ADO28TAX_FLAG: TStringField;
    aq0028abbr_name: TStringField;
    aq0028inv_name: TStringField;
    procedure ADO28AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADO28AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

end.
