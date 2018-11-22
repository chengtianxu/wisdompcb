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
    ADO69QUANTITY: TFloatField;
    ADO69UNIT_PRICE: TFloatField;
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
    aq0002: TADOQuery;
    ADO69unit_code: TStringField;
    ADO69unit_name: TStringField;
    ADO69inv_part_description: TStringField;
    ADOQuery2: TADOQuery;
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
    ADO69CONVERSION_FACTOR: TFloatField;
    ADO68budget_ptr: TIntegerField;
    ADO68v_year: TSmallintField;
    ADO68v_month: TSmallintField;
    AQ04: TADOStoredProc;
    AQ04CONTROL_NO_LENGTH: TSmallintField;
    AQ04SEED_VALUE: TStringField;
    AQ04SEED_FLAG: TWordField;
    ADO204UNIT_CODE: TStringField;
    ADO204UNIT_NAME: TStringField;
    ads276: TADOStoredProc;
    ads276USER_ID: TStringField;
    ads276USER_FULL_NAME: TStringField;
    ads276auth_flag: TStringField;
    ads276auth_date: TDateTimeField;
    ads276ranking: TWordField;
    ads276user_ptr: TIntegerField;
    DataSource5: TDataSource;
    ADO204GUI_GE: TStringField;
    ADO69o_i_flag: TWordField;
    ADO69reply_date: TDateTimeField;
    ADO204o_i_flag: TWordField;
    ADO204reply_date: TDateTimeField;
    ADOQuery3: TADOQuery;
    ADOQuery3PO_NUMBER: TStringField;
    ADOQuery3INV_PART_NUMBER: TStringField;
    ADOQuery3INV_PART_DESCRIPTION: TStringField;
    ADOQuery3QUAN_ORD: TFloatField;
    ADOQuery3QUAN_RECD: TFloatField;
    DataSource6: TDataSource;
    ADOQuery4: TADOQuery;
    ADOQuery4PO_NUMBER: TStringField;
    ADOQuery4DESCRIPTION: TStringField;
    ADOQuery4GUI_GE: TStringField;
    ADOQuery4QUAN_ORD: TFloatField;
    ADOQuery4QUANTITY_RECEIVED: TFloatField;
    ADOQuery3rkey: TIntegerField;
    ADOQuery4rkey: TIntegerField;
    ADOQuery5: TADOQuery;
    ADOQuery5GRN_NUMBER: TStringField;
    ADOQuery5TDATE: TDateTimeField;
    ADOQuery5QUANTITY: TFloatField;
    ADOQuery5WAREHOUSE_CODE: TStringField;
    ADOQuery5LOCATION: TStringField;
    ADOQuery5BARCODE_ID: TStringField;
    DataSource7: TDataSource;
    ADOQuery6: TADOQuery;
    ADOQuery6GRN_NUMBER: TStringField;
    ADOQuery6DATE_RECD: TDateTimeField;
    ADOQuery6QUAN_RECD: TFloatField;
    ADOQuery6REF_NUMBER: TStringField;
    ADOQuery6EMPLOYEE_NAME: TStringField;
    ADOQuery5REF_NUMBER: TStringField;
    ADOQuery5EMPLOYEE_NAME: TStringField;
    AQ0068data275_ptr: TIntegerField;
    AQ0068auth_date: TDateTimeField;
    ADO69reason: TStringField;
    ADO204reason: TStringField;
    AQ0068abbr_name: TStringField;
    Aq69: TADOQuery;
    Aq204: TADOQuery;
    Aq69INV_NAME: TStringField;
    Aq69INV_DESCRIPTION: TStringField;
    Aq69UNIT_NAME: TStringField;
    Aq69QUANTITY: TFloatField;
    Aq69REQ_DATE: TDateTimeField;
    Aq69reply_date: TDateTimeField;
    Aq69reason: TStringField;
    Aq204DESCRIPTION_1: TStringField;
    Aq204GUI_GE: TStringField;
    Aq204UNIT_NAME: TStringField;
    Aq204QUANTITY_REQUIRED: TFloatField;
    Aq204REQ_DATE: TDateTimeField;
    Aq204reply_date: TDateTimeField;
    Aq204reason: TStringField;
    ADO69inv_number: TStringField;
    DataSource8: TDataSource;
    ADO69extra_req: TStringField;
    Aq69extra_req: TStringField;
    AQ0068ent_date: TDateTimeField;
    AQ0068edited_date: TDateTimeField;
    procedure AQ0068CalcFields(DataSet: TDataSet);
    procedure ADO68PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure ADO68AfterDelete(DataSet: TDataSet);
    procedure ads276CalcFields(DataSet: TDataSet);
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
  if AQ0068flag.Value='M' then
   dm.AQ0068v_flag.Value :='非生产物料'
  else
   dm.AQ0068v_flag.Value :='外发加工';

 case AQ0068status.Value of
  1 : AQ0068v_status.Value := '有效';
  2 : AQ0068v_status.Value := '提交审批';
  3 : AQ0068v_status.Value := '已批准';
  4 : AQ0068v_status.Value := '未批退回';
  5 : AQ0068v_status.Value := '请购定单已撤消';
  6 : AQ0068v_status.Value := '请购定单已处理';
  7 : AQ0068v_status.Value := '未受理';
 end;
end;

procedure TDM.ADO68PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 messagedlg('数据保存失败,请检查编号是否重否!',mtwarning,[mbok],0);
 abort;
end;

procedure TDM.ADO68AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数据被成功删除!',mtinformation,[mbok],0);
end;

procedure TDM.ads276CalcFields(DataSet: TDataSet);
begin
 if dm.ads276auth_date.AsVariant<>null then
  dm.ads276auth_flag.Value:='已审批'
 else
  dm.ads276auth_flag.Value:='未审批';
end;

procedure TDM.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if (dm.Aq0068FLAG.Value = 'S') or (dm.Aq0068FLAG.Value = 'T') then
  begin           //查找标准采购条目
   datasource8.DataSet := aq69;
   aq69.Open;
   aq204.Close;
  end
 else
  begin           //查找杂项采购条目
   datasource8.DataSet := aq204;
   aq69.Close;
   aq204.Open;
  end;
if form1.DBGrid2.Columns[0].Width<>106 then
begin
  form1.dbgrid2.Columns[0].Width :=106;
  form1.dbgrid2.Columns[1].Width :=188;
  form1.dbgrid2.Columns[2].Width :=65;
  form1.dbgrid2.Columns[3].Width :=63;
  form1.dbgrid2.Columns[4].Width :=62;
  form1.dbgrid2.Columns[5].Width :=70;
end;

end;

end.
