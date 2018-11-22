unit demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADP400: TADOStoredProc;
    ADP400rkey: TAutoIncField;
    ADP400wip_code: TStringField;
    ADP400user_ptr: TIntegerField;
    ADP400ent_date: TDateTimeField;
    ADP400status: TWordField;
    ADP400serial_no: TStringField;
    ADP400whouse_ptr: TIntegerField;
    ADP400EMPL_CODE: TStringField;
    ADP400EMPLOYEE_NAME: TStringField;
    ADP400WAREHOUSE_CODE: TStringField;
    ADP400WAREHOUSE_NAME: TStringField;
    ADO34: TADOQuery;
    ADO34rkey: TIntegerField;
    ADO34dept_code: TStringField;
    ADO34dept_name: TStringField;
    ADOQuery2: TADOQuery;
    ADO401: TADOQuery;
    ADO56: TADOQuery;
    ADO401rkey: TAutoIncField;
    ADO401header_ptr: TIntegerField;
    ADO401wo_ptr: TIntegerField;
    ADO401dept_ptr: TIntegerField;
    ADO401wip_ptr: TIntegerField;
    ADO401reject_ptr: TIntegerField;
    ADO401wip_system_qty: TFloatField;
    ADO401physical_count_qty: TFloatField;
    ADO401enterted_ptr: TIntegerField;
    ADO401count_ptr: TIntegerField;
    ADO401ent_date: TDateTimeField;
    ADO401user_ptr: TIntegerField;
    ADO401status: TWordField;
    ADO401seaial_no: TIntegerField;
    ADO56QTY_BACKLOG: TFloatField;
    ADO56WO_PTR: TIntegerField;
    ADO56DEPT_PTR: TIntegerField;
    ADO56step: TSmallintField;
    ADP401: TADOStoredProc;
    ADO58: TADOQuery;
    ADO58RKEY: TAutoIncField;
    ADO58MRB_NO: TStringField;
    ADO58WO_PTR: TIntegerField;
    ADO58TRAN_PTR: TIntegerField;
    ADO58DEPT_PTR: TIntegerField;
    ADO58REJECT_PTR: TIntegerField;
    ADO58QTY_REJECT: TFloatField;
    ADO58FLOW_NO: TIntegerField;
    ADO58STEP: TIntegerField;
    ADO58EMPL_PTR: TIntegerField;
    ADO58TDATETIME: TDateTimeField;
    ADO58AUDIT_EMPL_PTR: TIntegerField;
    ADO58AUDIT_DATETIME: TDateTimeField;
    ADO58RESP_DEPT_PTR: TIntegerField;
    ADO58REFERENCE: TStringField;
    ADO58TTYPE: TSmallintField;
    ADOupdate1: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQuery1WO_PTR: TIntegerField;
    ADOQuery1DEPT_PTR: TIntegerField;
    ADOQuery1UNIT_PTR: TIntegerField;
    ADOQuery1EMPLOYEE_PTR: TIntegerField;
    ADOQuery1FLOW_NO: TSmallintField;
    ADOQuery1STEP: TSmallintField;
    ADOQuery1QTY_BACKLOG: TFloatField;
    ADOQuery1INTIME: TDateTimeField;
    ADO493: TADOQuery;
    ADO493Company_Name: TStringField;
    ADO493ship_address: TStringField;
    ADO493Company_Icon: TBlobField;
    ADO493SITE_INFO_ADD_1: TStringField;
    ADO493SITE_INFO_ADD_2: TStringField;
    ADO493SITE_INFO_ADD_3: TStringField;
    ADO493SITE_INFO_PHONE: TStringField;
    ADOQuery3: TADOQuery;
    ADOQuery3wip_system_qty: TFloatField;
    ADOQuery3wip_ptr: TIntegerField;
    ADOQuery3physical_count_qty: TFloatField;
    ADOQuery3divergent: TFloatField;
    ADOQuery3WORK_ORDER_NUMBER: TStringField;
    ADOQuery3MANU_PART_NUMBER: TStringField;
    ADOQuery3ABBR_NAME: TStringField;
    ADOQuery3REJECT_DESCRIPTION: TStringField;
    ADOQuery3DEPT_CODE: TStringField;
    ADP400ttype: TStringField;
    ADP401WORK_ORDER_NUMBER: TStringField;
    ADP401wip_system_qty: TFloatField;
    ADP401REJECT_DESCRIPTION: TStringField;
    ADP401wip_ptr: TIntegerField;
    ADP401MANU_PART_NUMBER: TStringField;
    ADP401CUST_CODE: TStringField;
    ADP401EMPLOYEE_NAME: TStringField;
    ADP401physical_count_qty: TFloatField;
    ADP401rkey: TIntegerField;
    ADP401reject_ptr: TIntegerField;
    ADP401count_ptr: TIntegerField;
    ADP401DEPT_CODE_2: TStringField;
    ADP401DEPT_CODE: TStringField;
    ADO402: TADOQuery;
    ADO402rkey: TAutoIncField;
    ADO402wo_ptr: TIntegerField;
    ADO402wipcode_ptr: TIntegerField;
    ADO402system_quan: TFloatField;
    ADO402dept_ptr: TIntegerField;
    ADO402step: TIntegerField;
    ADO402reject_ptr: TIntegerField;
    ADO402employee_ptr: TIntegerField;
    ADP401parts_per_panel: TFloatField;
    ADP401pnls: TIntegerField;
    ADO56PANELS: TIntegerField;
    ADO401panels: TIntegerField;
    Adomax_no: TADOQuery;
    Adomax_nomax_no: TIntegerField;
    ADO58QTY_ORG_REJ: TIntegerField;
    ADO58PANELS: TIntegerField;
    ADOQuery3divergent_pan: TIntegerField;
    ADOQuery1RKEY: TAutoIncField;
    ADOQuery1PANELS: TIntegerField;
    ADOQuery1TO_BE_STOCKED: TFloatField;
    ADOQuery1TDATE: TDateTimeField;
    ADOQuery1LOC_PTR: TSmallintField;
    ADO402panels: TIntegerField;
    ADO56rkey: TIntegerField;
    ADO401wiprkey_ptr: TIntegerField;
    ADO401physical_panels: TIntegerField;
    ADP401physical_panels: TIntegerField;
    ADOQuery3physical_PANELS: TIntegerField;
    ADOQuery3panels: TIntegerField;
    ADO493Company_name2: TStringField;
    ADO493Company_name3: TStringField;
    DataSource2: TDataSource;
    ado0006: TADOQuery;
    ado0006QUAN_REJ: TFloatField;
    ado0006PROD_STATUS: TSmallintField;
    ado0006panels: TIntegerField;
    ado0006quan_sch: TFloatField;
    ado0006quan_prod: TFloatField;
    ADOupdate1wip_system_qty: TFloatField;
    ADOupdate1wip_ptr: TIntegerField;
    ADOupdate1PANELS56: TIntegerField;
    ADOupdate1QTY_BACKLOG: TFloatField;
    ADOupdate1physical_count_qty: TFloatField;
    ADOupdate1dept_ptr: TIntegerField;
    ADOupdate1wo_ptr: TIntegerField;
    ADOupdate1count_ptr: TIntegerField;
    ADOupdate1count_pan: TIntegerField;
    ADOupdate1divergent: TFloatField;
    ADOupdate1divergent_pan: TIntegerField;
    ADOupdate1reject_ptr: TIntegerField;
    ADOupdate1status: TWordField;
    ADOupdate1ent_date: TDateTimeField;
    ADOQuery4: TADOQuery;
    ADOQuery4WORK_ORDER_NUMBER: TStringField;
    ADOQuery4parts_per_panel: TFloatField;
    ADOQuery4wip_system_qty: TFloatField;
    ADOQuery4physical_count_qty: TFloatField;
    ADOQuery4pnls: TIntegerField;
    ADOQuery4physical_panels: TIntegerField;
    ADOQuery4REJECT_DESCRIPTION: TStringField;
    ADOQuery4wip_ptr: TIntegerField;
    ADOQuery4CUST_CODE: TStringField;
    ADOQuery4EMPLOYEE_NAME: TStringField;
    ADOQuery4MANU_PART_NUMBER: TStringField;
    ADOQuery4type: TStringField;
    ADOQuery4status: TWordField;
    ADO401check_no: TStringField;
    ADP401check_no: TStringField;
    ADOQuery4check_no: TStringField;
    ADOQuery3check_no: TStringField;
    ADOupdate1rkey: TAutoIncField;
    ADP400group_ptr: TIntegerField;
    ADP401MANU_PART_DESC: TStringField;
    ADOQuery3MANU_PART_DESC: TStringField;
    ADOQuery4DEPT_CODE_2: TStringField;
    ADOQuery4MANU_PART_DESC: TStringField;
    ADOQuery4DEPT_CODE: TStringField;
    ADOQuery4unit_sq: TFloatField;
    ado0006QTY_REJECT: TIntegerField;
    ado0006WIP_QTY: TIntegerField;
    ADOQuery5: TADOQuery;
    ADOQuery5DSDesigner: TStringField;
    ADOQuery5DSDesigner2: TStringField;
    ADOQuery5DSDesigner3: TStringField;
    ADOQuery5DSDesigner4: TStringField;
    ADOQuery5DSDesigner5: TFloatField;
    ADOQuery5DSDesigner6: TStringField;
    ADOQuery5PNLPCS: TFloatField;
    ADOQuery5PCS: TFloatField;
    ADOQuery5PCS2: TFloatField;
    ADOQuery5PNL: TIntegerField;
    ADOQuery5PNL2: TIntegerField;
    ADOQuery4wostatus: TStringField;
    ADO56WTYPE: TSmallintField;
    ADO401WTYPE: TSmallintField;
    ADOQuery4DEPT_name: TStringField;
    ADOQuery4onlinestatus: TStringField;
    ADP400update_date: TDateTimeField;
    ADOQuery4abbr_name: TStringField;
    ADO56LOC_PTR: TSmallintField;
    ADO401wharehouse_ptr: TIntegerField;
    ADO58warehouse_ptr: TIntegerField;
    ADOQuery5DSDesigner7: TStringField;
    ADOQuery5DSDesigner8: TFloatField;
    ADOQuery5DSDesigner9: TFloatField;
    ADOQuery4DSDesigner: TFloatField;
    ADOQuery4DSDesigner2: TFloatField;
    ADOQuery4DSDesigner3: TStringField;
    ADOQuery5DSDesigner10: TStringField;
    ADOQuery3DEPT_NAME: TStringField;
    ADOQuery3mianji: TFloatField;
    ADOQuery3mianji_1: TFloatField;
    ADOQuery3MJ: TFloatField;
    ADOQuery3MJ_1: TFloatField;
    ADO56INTIME: TDateTimeField;
    ADO401INTIME: TDateTimeField;
    ADOQuery4DSDesigner4: TIntegerField;
    qrytmp: TADOQuery;
    procedure ADP400CalcFields(DataSet: TDataSet);
    procedure ADOQuery4CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADP400CalcFields(DataSet: TDataSet);
begin
 if dm.ADP400status.Value=0 then
  dm.ADP400ttype.Value:='进行中'
 else
  dm.ADP400ttype.Value:='已完成';
end;

procedure TDM.ADOQuery4CalcFields(DataSet: TDataSet);
begin
if dm.ADOQuery4.FieldValues['status']=0 then
 dm.ADOQuery4type.Value:='未输入'
else
 if dm.ADOQuery4.FieldValues['status']=1 then
  dm.ADOQuery4type.Value:='已输入'
 else
  dm.ADOQuery4type.Value:='已更新';
end;

end.
