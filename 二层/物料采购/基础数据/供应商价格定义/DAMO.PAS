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
    ADO28QTE_PRICE1: TFloatField;
    aq0028abbr_name: TStringField;
    aq0028inv_name: TStringField;
    ADO28rohs: TStringField;
    aq0028rohs: TStringField;
    ADO28quote_type: TWordField;
    aq0028TAX_2: TStringField;
    ADODataSet1: TADODataSet;
    ADODataSet1SUPPLIER_PTR: TIntegerField;
    ADODataSet1INVENTORY_PTR: TIntegerField;
    ADODataSet1EMPLOYEE_PTR: TIntegerField;
    ADODataSet1CSI_USER_PTR: TIntegerField;
    ADODataSet1TDATE: TDateTimeField;
    ADODataSet1SUPPLIER_PART_NO: TStringField;
    ADODataSet1SUGG_REORDER_QTY: TFloatField;
    ADODataSet1LEAD_TIME: TSmallintField;
    ADODataSet1AMT_QUAN_FLAG: TWordField;
    ADODataSet1MIN_ORDER_QTY: TFloatField;
    ADODataSet1MIN_ORDER_AMT: TFloatField;
    ADODataSet1TAX_1: TFloatField;
    ADODataSet1TAX_2: TFloatField;
    ADODataSet1PRICE_1: TFloatField;
    ADODataSet1PRICE_2: TFloatField;
    ADODataSet1PRICE_3: TFloatField;
    ADODataSet1PRICE_4: TFloatField;
    ADODataSet1PRICE_5: TFloatField;
    ADODataSet1PRICE_6: TFloatField;
    ADODataSet1QUAN_VOL_1: TFloatField;
    ADODataSet1QUAN_VOL_2: TFloatField;
    ADODataSet1QUAN_VOL_3: TFloatField;
    ADODataSet1QUAN_VOL_4: TFloatField;
    ADODataSet1QUAN_VOL_5: TFloatField;
    ADODataSet1DISC_1: TFloatField;
    ADODataSet1DISC_2: TFloatField;
    ADODataSet1DISC_3: TFloatField;
    ADODataSet1DISC_4: TFloatField;
    ADODataSet1DISC_5: TFloatField;
    ADODataSet1DISC_6: TFloatField;
    ADODataSet1TAX_3: TFloatField;
    ADODataSet1TAX_4: TFloatField;
    ADODataSet1PURCHASE_UNIT_PTR: TIntegerField;
    ADODataSet1CONVERSION_FACTOR: TFloatField;
    ADODataSet1AVL_FLAG: TStringField;
    ADODataSet1CURRENCY_PTR: TIntegerField;
    ADODataSet1EDI_OUT_FORCST: TIntegerField;
    ADODataSet1qte_price: TFloatField;
    ADODataSet1tax_flag: TStringField;
    ADODataSet1QTE_PRICE1: TBCDField;
    ADODataSet1rohs: TStringField;
    ADODataSet1quote_type: TWordField;
    aq0028qte_price: TFloatField;
    aq0028qte_price2: TIntegerField;
    ADO28qte_price2: TIntegerField;
    ADODataSet1qte_price2: TIntegerField;
    aq0028avl_flag: TStringField;
    aq0028supper_statu: TStringField;
    ADO28IF_CAF: TWideStringField;
    aq0028IF_CAF: TWideStringField;
    aq0028TAX: TFloatField;
    aq0028prot_report_ptr: TIntegerField;
    ADO28prot_report_ptr: TIntegerField;
    aq0028CATALOG_NUM: TStringField;
    aq0028model: TStringField;
    aq0028DSDesigner: TStringField;
    aq0028remark: TWideStringField;
    ADO28remark: TWideStringField;
    qryFtp: TADOQuery;
    dsFile: TDataSource;
    qry28_1: TADOQuery;
    qryFile: TADOQuery;
    qryFtpIDKey: TStringField;
    qryFtpFileName: TStringField;
    qryFtpFtp_Ptr: TIntegerField;
    qryFtpFtpDir: TStringField;
    qryFtpFtp_fileName: TStringField;
    qryFtpUploadTime: TDateTimeField;
    qryFtpUploadUser_d05ptr: TIntegerField;
    qryFtpGroupIDKey: TStringField;
    qryFtpBEnable: TBooleanField;
    qry28_1rkey28: TIntegerField;
    qry28_1FtpIDKey: TWideStringField;
    qryFileFileName: TStringField;
    qryFileFtpIDKey: TWideStringField;
    qryFilerkey28: TIntegerField;
    qryFileIDKey: TStringField;
    qryFileFtp_Ptr: TIntegerField;
    qryFileFtpDir: TStringField;
    qryFileFtp_fileName: TStringField;
    qryFileUploadTime: TDateTimeField;
    qryFileUploadUser_d05ptr: TIntegerField;
    qryFileGroupIDKey: TStringField;
    qryFileBEnable: TBooleanField;
    ADO28ORIG_ABBRNAME: TStringField;
    aq0028orig_abbrname: TStringField;
    procedure ADO28AfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    qte_price:single;
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
