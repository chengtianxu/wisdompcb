unit damo;

interface

uses
  Classes, DB,ADODB,Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADO215: TADOQuery;
    aq53: TADOQuery;
    ADOupdate1: TADOQuery;
    ADOupdate1rkey: TAutoIncField;
    ADOupdate1custpart_batch_ptr: TIntegerField;
    ADOupdate1quantity: TFloatField;
    ADOupdate1qty_on_hand: TFloatField;
    ADOupdate1divergent: TFloatField;
    ADOupdate1quantity53: TFloatField;
    ADOupdate1entered_by_ptr: TIntegerField;
    ADOupdate1entered_by_user_ptr: TIntegerField;
    ADOQuery2: TADOQuery;
    ADO493: TADOQuery;
    ADOdivergent: TADOQuery;
    ADOdivergentMANU_PART_NUMBER: TStringField;
    ADOdivergentmanu_part_desc: TStringField;
    ADOdivergentCUST_CODE: TStringField;
    ADOdivergentSTANDARD_COST: TFloatField;
    ADOdivergentWORK_ORDER_NUMBER: TStringField;
    ADOdivergentQTY_ON_HAND: TFloatField;
    ADOdivergentEMPLOYEE_NAME: TStringField;
    ADOdivergentQUANTITY: TFloatField;
    ADOdivergentcode: TStringField;
    ADOdivergentLOCATION: TStringField;
    ADOdivergentdivergent: TFloatField;
    ADOdivergenttotaldiver: TFloatField;
    ADO215RKEY: TAutoIncField;
    ADO215FG_LIST_PTR: TIntegerField;
    ADO215CUSTPART_PTR: TIntegerField;
    ADO215CUSTPART_BATCH_PTR: TIntegerField;
    ADO215location_ptr: TIntegerField;
    ADO215QUANTITY: TFloatField;
    ADO215ENTERED_BY_PTR: TIntegerField;
    ADO215ENTERED_BY_USER_PTR: TIntegerField;
    ADO215COUNTED_BY_EMPL_PTR: TIntegerField;
    ADO493Company_Name: TStringField;
    ADO493ship_address: TStringField;
    ADO493Company_Icon: TBlobField;
    ADO493SITE_INFO_ADD_1: TStringField;
    ADO493SITE_INFO_ADD_2: TStringField;
    ADO493SITE_INFO_ADD_3: TStringField;
    ADO493SITE_INFO_PHONE: TStringField;
    aq215: TADOStoredProc;
    aq215RKEY: TAutoIncField;
    aq215CUST_CODE: TStringField;
    aq215WORK_ORDER_NUMBER: TStringField;
    aq215QTY_ON_HAND: TFloatField;
    aq215EMPLOYEE_NAME: TStringField;
    aq215COUNTED_BY_EMPL_PTR: TIntegerField;
    aq215QUANTITY: TFloatField;
    aq215code: TStringField;
    aq215LOCATION: TStringField;
    aq215REFERENCE_NUMBER: TStringField;
    aq215custpart_ptr: TIntegerField;
    aq215location_ptr: TIntegerField;
    adosum215: TADOQuery;
    adosum215CUSTPART_PTR: TIntegerField;
    adosum215ABBR_NAME: TStringField;
    adosum215total_qty: TFloatField;
    ADOupdate1custpart_ptr: TIntegerField;
    ADO215status: TWordField;
    ADOupdate1status: TWordField;
    ADOQuery3: TADOQuery;
    ADOQuery3MANU_PART_NUMBER: TStringField;
    ADOQuery3manu_part_desc: TStringField;
    ADOQuery3CUST_CODE: TStringField;
    ADOQuery3WORK_ORDER_NUMBER: TStringField;
    ADOQuery3EMPLOYEE_NAME: TStringField;
    ADOQuery3QUANTITY: TFloatField;
    ADOQuery3QTY_ON_HAND: TFloatField;
    ADOQuery3LOCATION: TStringField;
    ADOQuery3REFERENCE_NUMBER: TStringField;
    ADOQuery3status: TWordField;
    ADOQuery3v_status: TStringField;
    ADOQuery3check_no: TStringField;
    ADO215check_no: TStringField;
    aq215check_no: TStringField;
    ADOQuery3LATEST_PRICE: TFloatField;
    ADOQuery3DSDesigner: TFloatField;
    aq215LATEST_PRICE: TFloatField;
    aq215unit_sq: TFloatField;
    aq215mianji: TFloatField;
    ADO215old_quantity: TFloatField;
    aq215MANU_PART_NUMBER: TStringField;
    aq215manu_part_desc: TStringField;
    aq215old_quantity: TFloatField;
    adosum215MANU_PART_NUMBER: TStringField;
    adosum215analysis_code_2: TStringField;
    adosum215MANU_PART_DESC: TStringField;
    adosum215bath_former: TStringField;
    ado25: TADOCommand;
    ADO214: TADOQuery;
    ADO214RKEY: TAutoIncField;
    ADO214FG_COUNT_CODE: TStringField;
    ADO214DATE_CREATED: TDateTimeField;
    ADO214EMPLOYEE_PTR: TIntegerField;
    ADO214USER_PTR: TIntegerField;
    ADO214WAREHOUSE_PTR: TIntegerField;
    ADO214BEG_LOCCODE_PTR: TIntegerField;
    ADO214END_LOCCODE_PTR: TIntegerField;
    ADO214BEG_CUST_PTR: TIntegerField;
    ADO214END_CUST_PTR: TIntegerField;
    ADO214BEG_CUSTPART_PTR: TIntegerField;
    ADO214END_CUSTPART_PTR: TIntegerField;
    ADO214STATUS: TStringField;
    ADO214OVER_DATE: TDateTimeField;
    ADO214empl_code: TStringField;
    ADO214employee_name: TStringField;
    ADO214warehouse_code: TStringField;
    ADO214warehouse_name: TStringField;
    ADO214abbr_name: TStringField;
    ADO214v_status: TStringField;
    procedure ADOQuery1AfterDelete(DataSet: TDataSet);
    procedure ADO214CalcFields(DataSet: TDataSet);
    procedure ADOQuery3CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOQuery1AfterDelete(DataSet: TDataSet);
begin
 messagedlg('数量删除成功!',mtinformation,[mbok],0);
end;

procedure TDM.ADO214CalcFields(DataSet: TDataSet);
begin
if self.ADO214STATUS.Value='0' then
 self.ADO214v_status.Value:='进行中'
else
if self.ADO214STATUS.Value='1' then
 self.ADO214v_status.Value:='已完成';
end;

procedure TDM.ADOQuery3CalcFields(DataSet: TDataSet);
begin
if dm.ADOQuery3status.Value=0 then
 dm.ADOQuery3v_status.Value:='未输入'
else
if dm.ADOQuery3status.Value=1 then
 dm.ADOQuery3v_status.Value:='已输入'
else
 dm.ADOQuery3v_status.Value:='已完成';
end;

end.
