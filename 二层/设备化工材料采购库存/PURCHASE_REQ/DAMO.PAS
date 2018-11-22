unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Dialogs,Variants;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ0068: TADOQuery;
    DataSource1: TDataSource;
    AQ0068rkey: TIntegerField;
    AQ0068po_req_number: TStringField;
    AQ0068status: TWordField;
    AQ0068flag: TStringField;
    AQ0068req_date: TDateTimeField;
    AQ0068req_by: TIntegerField;
    AQ0068buyer_ptr: TIntegerField;
    AQ0068empl_code: TStringField;
    AQ0068employee_name: TStringField;
    AQ0068v_status: TStringField;
    AQ0068v_flag: TStringField;
    AQ0005: TADOQuery;
    ADO68: TADOQuery;
    DataSource2: TDataSource;
    ADO69: TADOQuery;
    DataSource3: TDataSource;
    ADO69RKEY: TAutoIncField;
    ADO69PURCH_REQ_PTR: TIntegerField;
    ADO69INVT_PTR: TIntegerField;
    ADO69SUPP_PTR: TIntegerField;
    ADO69PO_LINK_PTR: TIntegerField;
    ADO69REQ_DATE: TDateTimeField;
    ADO69UNIT_PTR: TIntegerField;
    aq0017: TADOQuery;
    ADO69inv_part_number: TStringField;
    ADO68RKEY: TAutoIncField;
    ADO68PO_REQ_NUMBER: TStringField;
    ADO68USER_PTR: TIntegerField;
    ADO68REQ_BY: TIntegerField;
    ADO68BUYER_PTR: TIntegerField;
    ADO68APPD_BY: TIntegerField;
    ADO68DATA275_PTR: TIntegerField;
    ADO68AUTH_TYPE: TIntegerField;
    ADO68WHSE_PTR: TIntegerField;
    ADO68NPAD_PTR: TIntegerField;
    ADO68ENT_DATE: TDateTimeField;
    ADO68REQ_DATE: TDateTimeField;
    ADO68AUTH_DATE: TDateTimeField;
    ADO68STATUS: TWordField;
    ADO68DEPARTMENT_NAME: TStringField;
    ADO68FLAG: TStringField;
    ADO68EDITED_DATE: TDateTimeField;
    ADO68EDITED_BY_USER_PTR: TIntegerField;
    ADO68EDITED_BY_EMP_PTR: TIntegerField;
    ADO68TOTAL: TFloatField;
    ADO68CURRENY_PTR: TIntegerField;
    ADO68EXCHANGE_RATE: TFloatField;
    ADOQuery1: TADOQuery;
    ADO6811: TADOQuery;
    aq0023: TADOQuery;
    ADO69supplier_code: TStringField;
    aq0002: TADOQuery;
    ADO69unit_name: TStringField;
    ADO69supplier_name: TStringField;
    ADO69inv_part_description: TStringField;
    ADOQuery2: TADOQuery;
    ADO362: TADOQuery;
    ADO204: TADOQuery;
    DataSource4: TDataSource;
    ADO204RKEY: TAutoIncField;
    ADO204PURCHASE_REQ_PTR: TIntegerField;
    ADO204DESCRIPTION_1: TStringField;
    ADO204DESCRIPTION_2: TStringField;
    ADO204SUPPLIER_PTR: TIntegerField;
    ADO204PO_LINK_PTR: TIntegerField;
    ADO204G_L_PTR: TIntegerField;
    ADO204QUANTITY_REQUIRED: TFloatField;
    ADO204UNIT_PRICE: TFloatField;
    ADO204TAX_FLAG: TStringField;
    ADO204REQ_DATE: TDateTimeField;
    ADO204supp_code: TStringField;
    ADO204supp_name: TStringField;
    ADO68budget_ptr: TIntegerField;
    ADO68v_year: TSmallintField;
    ADO68v_month: TSmallintField;
    AQ04: TADOStoredProc;
    AQ04CONTROL_NO_LENGTH: TSmallintField;
    AQ04SEED_VALUE: TStringField;
    AQ04SEED_FLAG: TWordField;
    ADS276: TADOStoredProc;
    ADS276rkey: TAutoIncField;
    ADS276purchase_ptr: TIntegerField;
    ADS276user_ptr: TIntegerField;
    ADS276auth_date: TDateTimeField;
    ADS276ranking: TWordField;
    aq0001: TADOQuery;
    aq0001rkey: TIntegerField;
    aq0001curr_name: TStringField;
    aq0001base_to_other: TFloatField;
    ADO69curr_name: TStringField;
    ADO69base_to: TFloatField;
    ADO204curr_name: TStringField;
    ADO204base_to: TFloatField;
    ADO204UNIT_CODE: TStringField;
    ADO204UNIT_NAME: TStringField;
    ADOS276: TADOStoredProc;
    DataSource5: TDataSource;
    ADOS276USER_ID: TStringField;
    ADOS276USER_FULL_NAME: TStringField;
    ADOS276user_ptr: TIntegerField;
    ADOS276auth_date: TDateTimeField;
    ADOS276ranking: TWordField;
    ADOS276auth_flag: TStringField;
    ADO204GUI_GE: TStringField;
    ADO204o_i_flag: TWordField;
    ADO69o_i_flag: TWordField;
    ADO69reply_date: TDateTimeField;
    ADO204reply_date: TDateTimeField;
    AQ0068department_name: TStringField;
    ADOQuery3: TADOQuery;
    ADOQuery3PO_NUMBER: TStringField;
    ADOQuery3INV_PART_NUMBER: TStringField;
    ADOQuery3INV_PART_DESCRIPTION: TStringField;
    ADOQuery3QUAN_ORD: TFloatField;
    ADOQuery3QUAN_RECD: TFloatField;
    ADOQuery3rkey: TIntegerField;
    DataSource6: TDataSource;
    ADOQuery4: TADOQuery;
    ADOQuery4PO_NUMBER: TStringField;
    ADOQuery4DESCRIPTION: TStringField;
    ADOQuery4GUI_GE: TStringField;
    ADOQuery4QUAN_ORD: TFloatField;
    ADOQuery4QUANTITY_RECEIVED: TFloatField;
    ADOQuery4rkey: TIntegerField;
    ADOQuery5: TADOQuery;
    ADOQuery5GRN_NUMBER: TStringField;
    ADOQuery5TDATE: TDateTimeField;
    ADOQuery5QUANTITY: TFloatField;
    ADOQuery5WAREHOUSE_CODE: TStringField;
    ADOQuery5LOCATION: TStringField;
    ADOQuery5BARCODE_ID: TStringField;
    ADOQuery5REF_NUMBER: TStringField;
    ADOQuery5EMPLOYEE_NAME: TStringField;
    DataSource7: TDataSource;
    ADOQuery6: TADOQuery;
    ADOQuery6GRN_NUMBER: TStringField;
    ADOQuery6DATE_RECD: TDateTimeField;
    ADOQuery6QUAN_RECD: TFloatField;
    ADOQuery6REF_NUMBER: TStringField;
    ADOQuery6EMPLOYEE_NAME: TStringField;
    AQ0068data275_ptr: TIntegerField;
    AQ0068auth_date: TDateTimeField;
    ADOAP68: TADOQuery;
    AP69204: TADOQuery;
    ADOAP68RKEY: TAutoIncField;
    ADOAP68PO_REQ_NUMBER: TStringField;
    ADOAP68USER_PTR: TIntegerField;
    ADOAP68REQ_BY: TIntegerField;
    ADOAP68BUYER_PTR: TIntegerField;
    ADOAP68APPD_BY: TIntegerField;
    ADOAP68DATA275_PTR: TIntegerField;
    ADOAP68AUTH_TYPE: TIntegerField;
    ADOAP68WHSE_PTR: TIntegerField;
    ADOAP68budget_ptr: TIntegerField;
    ADOAP68NPAD_PTR: TIntegerField;
    ADOAP68ENT_DATE: TDateTimeField;
    ADOAP68REQ_DATE: TDateTimeField;
    ADOAP68AUTH_DATE: TDateTimeField;
    ADOAP68STATUS: TWordField;
    ADOAP68DEPARTMENT_NAME: TStringField;
    ADOAP68FLAG: TStringField;
    ADOAP68EDITED_DATE: TDateTimeField;
    ADOAP68EDITED_BY_USER_PTR: TIntegerField;
    ADOAP68EDITED_BY_EMP_PTR: TIntegerField;
    ADOAP68TOTAL: TBCDField;
    ADOAP68CURRENY_PTR: TIntegerField;
    ADOAP68EXCHANGE_RATE: TFloatField;
    ADOAP68v_year: TSmallintField;
    ADOAP68v_month: TSmallintField;
    ADO69reason: TStringField;
    ADO204reason: TStringField;
    ADO69abbr_name: TStringField;
    ADO204abbr_name: TStringField;
    AQ0068TOTAL: TBCDField;
    AQ0068APPD_BY: TIntegerField;
    AQ0068AUTH_TYPE: TIntegerField;
    ADOstdprice: TADOQuery;
    ADOstdpriceQUANTITY: TFloatField;
    ADOstdpriceUNIT_PRICE: TFloatField;
    ADOstdpriceREQ_DATE: TDateTimeField;
    ADOstdpriceUNIT_NAME: TStringField;
    ADOstdpriceCURR_NAME: TStringField;
    ADOstdpriceABBR_NAME: TStringField;
    ADOstdpriceo_i_flag: TWordField;
    ADOstdpricein_out: TStringField;
    ADOmicprice: TADOQuery;
    ADOmicpriceDESCRIPTION_1: TStringField;
    ADOmicpriceGUI_GE: TStringField;
    ADOmicpriceQUANTITY_REQUIRED: TFloatField;
    ADOmicpriceUNIT_PRICE: TFloatField;
    ADOmicpriceREQ_DATE: TDateTimeField;
    ADOmicpriceo_i_flag: TWordField;
    ADOmicpriceCURR_NAME: TStringField;
    ADOmicpriceABBR_NAME: TStringField;
    ADOmicpriceUNIT_NAME: TStringField;
    DataSource8: TDataSource;
    DataSource9: TDataSource;
    ADOmicpricein_out: TStringField;
    AQ0068abbr_name: TStringField;
    ADO69inv_number: TStringField;
    ADO69extra_req: TStringField;
    AQ0068ent_date: TDateTimeField;
    AQ0068edited_date: TDateTimeField;
    ADO69tax: TBCDField;
    ADO204tax: TBCDField;
    ADO204tax_price: TFloatField;
    ADO69req_quantity: TBCDField;
    ADO69req_unit_ptr: TIntegerField;
    ADO69req_unitname: TStringField;
    ADO69CONVERSION_FACTOR: TBCDField;
    ADO69QUANTITY: TBCDField;
    ADO69UNIT_PRICE: TBCDField;
    ADO69tax_price: TBCDField;
    ADS276auth_flag: TStringField;
    procedure AQ0068CalcFields(DataSet: TDataSet);
    procedure ADO68AfterDelete(DataSet: TDataSet);
    procedure ADOS276CalcFields(DataSet: TDataSet);
    procedure ADOstdpriceCalcFields(DataSet: TDataSet);
    procedure ADOmicpriceCalcFields(DataSet: TDataSet);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

uses main;

{$R *.dfm}

procedure TDM.AQ0068CalcFields(DataSet: TDataSet);
begin
 if AQ0068flag.Value='S' then
  dm.AQ0068v_flag.Value :='生产物料'
 else
   dm.AQ0068v_flag.Value :='非生产物料';

 case AQ0068status.Value of
  7 : AQ0068v_status.Value := '未提交';
  1 : AQ0068v_status.Value := '待审批';
  2 : AQ0068v_status.Value := '待采购';
  3 : AQ0068v_status.Value := '已批准';
  4 : AQ0068v_status.Value := '被退回';
  5 : AQ0068v_status.Value := '请购单已撤消';
  6 : AQ0068v_status.Value := '请购单已处理';
 end;
end;

procedure TDM.ADO68AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TDM.ADOS276CalcFields(DataSet: TDataSet);
begin
 if dm.ados276auth_date.AsVariant<>null then
  dm.ados276auth_flag.Value:='已审批'
 else
  dm.ados276auth_flag.Value:='未审批';
end;

procedure TDM.ADOstdpriceCalcFields(DataSet: TDataSet);
begin
 if dm.ADOstdpriceo_i_flag.Value=0 then
  dm.ADOstdpricein_out.Value := '国内'
 else
  dm.ADOstdpricein_out.Value := '国外';
end;

procedure TDM.ADOmicpriceCalcFields(DataSet: TDataSet);
begin
 if dm.ADOmicpriceo_i_flag.Value=0 then
  dm.ADOmicpricein_out.Value := '国内'
 else
  dm.ADOmicpricein_out.Value := '国外';
end;

procedure TDM.DataSource1DataChange(Sender: TObject; Field: TField);
begin
if (dm.Aq0068FLAG.Value='S') or (dm.Aq0068FLAG.Value='T') then
 with dm.ADO69 do
  begin             //查找标准采购条目
   active:=false;
   Parameters[0].Value:=dm.Aq0068rkey.Value;
   active:=true;
   form1.dbgrid3.Visible := false;
   form1.dbgrid2.Visible := true;
  end
else
 with dm.ADO204 do
  begin           //查找杂项采购条目  
   active:=false;
   Parameters[0].Value:=dm.Aq0068rkey.Value;
   active:=true;
   form1.dbgrid2.Visible := false;
   form1.dbgrid3.Visible := true;  
  end;
end;

end.
