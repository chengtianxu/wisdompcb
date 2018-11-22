unit damo;

interface

uses
  SysUtils, Classes, DB, ADODB,Variants;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    AQ0068: TADOQuery;
    DataSource1: TDataSource;
    AQ0068po_req_number: TStringField;
    AQ0068abbr_name: TStringField;
    AQ0068EMPLOYEE_NAME: TStringField;
    AQ0068department_name: TStringField;
    AQ0068req_date: TDateTimeField;
    AQ0068total: TFloatField;
    AQ0068exchange_rate: TFloatField;
    AQ0068status: TWordField;
    AQ0068v_status: TStringField;
    ADOQuery1: TADOQuery;
    AQ0068rkey: TAutoIncField;
    AQ0068buyer_ptr: TIntegerField;
    AQ0068warehouse_code: TStringField;
    AQ0068warehouse_name: TStringField;
    AQ0068empl_code: TStringField;
    AQ0068code: TStringField;
    AQ0068purchase_approv_desc: TStringField;
    AQ0005: TADOQuery;
    AQ0068buyer_empl_code: TStringField;
    AQ0068buyer_empl_name: TStringField;
    AQ0068flag: TStringField;
    aq69: TADOQuery;
    DataSource2: TDataSource;
    aq69inv_part_number: TStringField;
    aq69unit_price: TFloatField;
    aq69code: TStringField;
    aq69inv_part_description: TStringField;
    aq204: TADOQuery;
    DataSource3: TDataSource;
    aq204DESCRIPTION_1: TStringField;
    aq204QUANTITY_REQUIRED: TFloatField;
    aq204unit_price: TFloatField;
    aq204req_date: TDateTimeField;
    AQ0068appd_by: TIntegerField;
    aq204DESCRIPTION_2: TStringField;
    AQ0068bud_code: TStringField;
    AQ0068DESCRIPTION: TStringField;
    ads276: TADOStoredProc;
    ads276USER_ID: TStringField;
    ads276USER_FULL_NAME: TStringField;
    ads276auth_date: TDateTimeField;
    ads276ranking: TWordField;
    DataSource4: TDataSource;
    AQ0068auth_date: TDateTimeField;
    AQ0068ranking: TWordField;
    ads276user_ptr: TIntegerField;
    AQ106811: TADOStoredProc;
    aq204curr_name: TStringField;
    AQ0068v_type: TStringField;
    aq69curr_name: TStringField;
    aq204abbr_name: TStringField;
    aq204gui_ge: TStringField;
    aq69UNIT_NAME: TStringField;
    aq69GROUP_DESC: TStringField;
    aq69inv_group_desc: TStringField;
    aq69reply_DATE: TDateTimeField;
    aq204reason: TStringField;
    aq204reply_date: TDateTimeField;
    aq204UNIT_NAME: TStringField;
    aq69reason: TStringField;
    aq69REQ_DATE: TDateTimeField;
    aq69o_i_flag: TWordField;
    aq204o_i_flag: TWordField;
    aq204in_out: TStringField;
    AQ0068USER_FULL_NAME: TStringField;
    ADOstdprice: TADOQuery;
    DataSource5: TDataSource;
    aq69INVT_PTR: TIntegerField;
    ADOstdpriceQUANTITY: TFloatField;
    ADOstdpriceUNIT_PRICE: TFloatField;
    ADOstdpriceREQ_DATE: TDateTimeField;
    ADOstdpriceUNIT_NAME: TStringField;
    ADOstdpriceCURR_NAME: TStringField;
    ADOstdpriceABBR_NAME: TStringField;
    ADOstdpriceo_i_flag: TWordField;
    ADOstdpricein_out: TStringField;
    ADOmicprice: TADOQuery;
    DataSource6: TDataSource;
    ADOmicpriceDESCRIPTION_1: TStringField;
    ADOmicpriceGUI_GE: TStringField;
    ADOmicpriceQUANTITY_REQUIRED: TFloatField;
    ADOmicpriceUNIT_PRICE: TFloatField;
    ADOmicpriceREQ_DATE: TDateTimeField;
    ADOmicpriceo_i_flag: TWordField;
    ADOmicpriceCURR_NAME: TStringField;
    ADOmicpriceABBR_NAME: TStringField;
    ADOmicpriceUNIT_NAME: TStringField;
    ADOmicpricein_out: TStringField;
    DataSource7: TDataSource;
    ADO28: TADOQuery;
    ADO28PRICE_1: TFloatField;
    ADO28AVL_FLAG: TStringField;
    ADO28LEAD_TIME: TSmallintField;
    ADO28TAX_2: TFloatField;
    ADO28CURR_NAME: TStringField;
    ADO28UNIT_NAME: TStringField;
    ADO28ABBR_NAME: TStringField;
    ADO28avl_type: TStringField;
    AQ0068edited_date: TDateTimeField;
    aq69inv_number: TStringField;
    ADOstock22: TADOQuery;
    aq69stack_qty: TFloatField;
    AQ0068user_ptr: TIntegerField;
    ADO71zaitu: TADOQuery;
    ADO71zaituINVT_PTR: TIntegerField;
    ADO71zaituDSDesigner: TFloatField;
    aq69quantity_zaitu: TFloatField;
    aq69extra_req: TStringField;
    aq69tax: TBCDField;
    aq69tax_price: TFloatField;
    aq204tax: TBCDField;
    aq204tax_price: TFloatField;
    AQ0068auth_flag: TStringField;
    aq69req_QUANTITY: TBCDField;
    ads276auth_flag: TStringField;
    ads276auth_type: TStringField;
    procedure AQ0068CalcFields(DataSet: TDataSet);
    procedure ads276CalcFields(DataSet: TDataSet);
    procedure aq204CalcFields(DataSet: TDataSet);
    procedure ADOstdpriceCalcFields(DataSet: TDataSet);
    procedure ADOmicpriceCalcFields(DataSet: TDataSet);
    procedure ADO28CalcFields(DataSet: TDataSet);
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
 if dm.aq0068auth_date.AsVariant=null then
  dm.AQ0068v_status.Value := '待审批'
 else
  dm.AQ0068v_status.Value := '已批准';

 if dm.AQ0068flag.Value = 'S' then
  dm.AQ0068v_type.Value := '生产物料'
 else
  if dm.AQ0068flag.Value = 'M' then
   dm.AQ0068v_type.Value := '非生产物料'
  else
   dm.AQ0068v_type.Value := '外发加工';
end;

procedure TDM.ads276CalcFields(DataSet: TDataSet);
begin
 if dm.ads276auth_date.AsVariant <> null then
  dm.ads276auth_type.Value := '已审批'
 else
  dm.ads276auth_type.Value := '未审批';
end;

procedure TDM.aq204CalcFields(DataSet: TDataSet);
begin
if dm.aq204o_i_flag.Value =0 then
 dm.aq204in_out.Value := '国内'
else
 dm.aq204in_out.Value := '国外';
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
if dm.ADOmicpriceo_i_flag.Value =0 then
 dm.ADOmicpricein_out.Value := '国内'
else
 dm.ADOmicpricein_out.Value := '国外';
end;

procedure TDM.ADO28CalcFields(DataSet: TDataSet);
begin
if dm.ADO28AVL_FLAG.Value='Y' then
 dm.ADO28avl_type.Value:='已认可'
else
 if dm.ADO28AVL_FLAG.Value='N' then
  dm.ADO28avl_type.Value:='未认可'
 else
  dm.ADO28avl_type.Value:='暂时认可';
end;

procedure TDM.DataSource1DataChange(Sender: TObject; Field: TField);
begin
 if (dm.Aq0068FLAG.Value='S') or (dm.Aq0068FLAG.Value='T') then
  begin             //查找标准采购条目
   adostock22.Open;
   aq69.Open;
   form1.dbgrid3.Visible := false;
   form1.dbgrid2.Visible := true;
   aq204.Close;
  end
 else
  begin           //查找杂项采购条目
   aq204.Open;
   form1.dbgrid2.Visible := false;
   form1.dbgrid3.Visible := true;
   aq69.Close;
   adostock22.Close;
   ado71zaitu.Close;
  end;
end;

end.
