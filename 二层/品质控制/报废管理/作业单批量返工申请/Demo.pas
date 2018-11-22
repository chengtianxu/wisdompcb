unit Demo;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADO257: TADOQuery;
    ADO258: TADOQuery;
    ADO239: TADOQuery;
    ADO260: TADOQuery;
    ADO252: TADOQuery;
    ADO34: TADOQuery;
    ADO34RKEY: TAutoIncField;
    ADO34DEPT_CODE: TStringField;
    ADO34TTYPE: TStringField;
    ADO34OUT_SOURCE: TWordField;
    ADO34DEPT_NAME: TStringField;
    ADO34ACTIVE_FLAG: TWordField;
    ADO34SUPERVISOR_PTR: TIntegerField;
    ADO34PCS_AS_UNIT: TWordField;
    ADO34UNIT_PTR: TIntegerField;
    ADO34BIG_DEPT_PTR: TIntegerField;
    ADO34DEPT_PTR: TIntegerField;
    ADO34GROUP_PTR: TIntegerField;
    ADO34IS_COST_DEPT: TWordField;
    ADO34COST_DEPT_PTR: TIntegerField;
    ADO34DEF_ROUT_INST: TStringField;
    ADO34SCHEDULE_FLAG: TStringField;
    ADO34SEQ_NO: TIntegerField;
    ADO34BARCODE_ENTRY_FLAG: TStringField;
    ADO34ALLOW_SPLIT_LOTS: TStringField;
    ADO34PRINTING_RESOURCE: TStringField;
    ADO34SETUP_TIME_PER_LOT: TStringField;
    ADO34QUEUE_TIME: TStringField;
    ADO34PROCESS_TIME: TStringField;
    ADO34PROCESS_TIME_B: TStringField;
    ADO34IS_CYCLE: TWordField;
    ADO34CYCLE_TIME: TStringField;
    ADO34OVERHEAD_FORMULA: TStringField;
    ADO34OVERHEAD2_FORMULA: TStringField;
    ADO34OVERHEAD3_FORMULA: TStringField;
    ADO34Inst_Flag: TStringField;
    ADO34EQUIPMENT_PTR: TIntegerField;
    ADO34QTY_EQP_LIMIT: TIntegerField;
    ADO34SETUP_SYS: TBCDField;
    ADO34QUEUE_SYS: TBCDField;
    ADO34PROCESS_SYS: TBCDField;
    ADO34PROCESS_SYS_B: TBCDField;
    ADO34CYCLE_TIME_SYS: TBCDField;
    ADO34SEQ_NR: TIntegerField;
    ADO34PPC_TIME: TDateTimeField;
    ADO34PPC_BOM: TIntegerField;
    ADO34PPC_CYCLE_TIME: TIntegerField;
    ADO34PPC_CYCLE_LOT: TFloatField;
    ADO34PPC_LAST_LOT: TIntegerField;
    ADO34PPC_STATUS: TWordField;
    ADO34PR_ID: TStringField;
    ADO34SPEC_FLAG: TWordField;
    ADO34PERMIT_SPLIT_LOT: TWordField;
    ADO34VISIBLE_IN_MI: TWordField;
    ADO34WO_DAYS: TIntegerField;
    ADO34matl_cost_per_sq: TFloatField;
    ADO34GL_ACCT_PTR: TIntegerField;
    ADO34output_flag: TWordField;
    ADO34matcost_flag: TWordField;
    ADO34cost_name: TStringField;
    ADO34wage_flag: TBooleanField;
    ADO34Work_Para: TStringField;
    ADO258v_ttype: TStringField;
    ADO258rkey34: TIntegerField;
    ADO258seq_no: TIntegerField;
    ADO258DEPT_CODE: TStringField;
    ADO258DEPT_NAME: TStringField;
    aq257: TADOQuery;
    DS257: TDataSource;
    DS258: TDataSource;
    aq203: TADOQuery;
    aq203rkey: TAutoIncField;
    aq203return_code: TStringField;
    aq203user_ptr: TIntegerField;
    aq203ENT_DATE: TDateTimeField;
    aq203submit: TDateTimeField;
    aq203CUST_PART_PTR: TIntegerField;
    aq203dept_ptr: TIntegerField;
    aq203v_ttype: TStringField;
    aq203status: TWordField;
    aq203WTYPE_step: TIntegerField;
    aq203describe: TWideStringField;
    aq203reason: TWideStringField;
    aq203scheme: TWideStringField;
    aq203panel_qty: TIntegerField;
    aq203pcs_qty: TIntegerField;
    ado04: TADOQuery;
    ado04SEED_VALUE: TStringField;
    ado04SEED_FLAG: TWordField;
    ADO06: TADODataSet;
    ADO06RKEY: TIntegerField;
    ADO06PANEL_A_B: TIntegerField;
    ADO06Qty_SMQ: TFloatField;
    ADO06wtype06: TWordField;
    ADO06DEPT_CODE: TStringField;
    ADO06DEPT_NAME: TStringField;
    ADO06WO_DAYS: TIntegerField;
    ADO06deptptr: TIntegerField;
    ADO06TTYPE: TStringField;
    ADO06QUAN_SCH: TFloatField;
    ADO06FLOW_NO: TSmallintField;
    ADO06WORK_ORDER_NUMBER: TStringField;
    ADO06PROD_STATUS: TSmallintField;
    ADO06QUAN_REJ: TFloatField;
    ADO06TimeDiff: TBCDField;
    ADO06QUAN_PROD: TFloatField;
    ADO06QUAN_ALLREJ: TIntegerField;
    ADO06INTIME: TDateTimeField;
    ADO06REFERENCE_PTR: TIntegerField;
    ADO06PARENT_PTR: TIntegerField;
    ADO06PANELS: TIntegerField;
    ADO06PNL_ONLine: TIntegerField;
    ADO06BOM_PTR: TIntegerField;
    ADO06MANU_PART_NUMBER: TStringField;
    ADO06MANU_PART_DESC: TStringField;
    ADO06STEP: TSmallintField;
    ADO06d56_rkey: TIntegerField;
    ADO06WTYPE: TSmallintField;
    ADO06SAMPLE_NR: TStringField;
    ADO06Flow_NO_06: TSmallintField;
    ADO06SCH_COMPL_DATE: TDateTimeField;
    ADO06REFERENCE: TStringField;
    ADO06PARTS_PER_PANEL: TFloatField;
    ADO06QTY_BACKLOG: TFloatField;
    ADO06TO_BE_STOCKED: TFloatField;
    ADO06DEPT_PTR: TIntegerField;
    ADO06SO_NO: TStringField;
    ADO06CUT_NO: TStringField;
    ADO06PRODUCT_NAME: TStringField;
    ADO06CUST_CODE: TStringField;
    ADO06ENT_DATETIME: TDateTimeField;
    ADO06unit_sq: TFloatField;
    ADO06unit_sq_includingBoader: TFloatField;
    ADO06prod_Square: TFloatField;
    ADO06so_oldnew: TStringField;
    ADO06REFERENCE_NUMBER: TStringField;
    ADO06WHOUSE_PTR: TIntegerField;
    ADO06FacNm: TStringField;
    ADO06rkey25: TIntegerField;
    qrytmp: TADOQuery;
    ADO252rkey203: TIntegerField;
    ADO252rkey06: TIntegerField;
    ADO239rkey203: TIntegerField;
    ADO239DEPT_PTR: TIntegerField;
    ADO239DEF_ROUT_INST: TStringField;
    ADO239STEP_NUMBER: TSmallintField;
    ADO239tooling_rev: TStringField;
    ADO239TOOL_REMARK: TStringField;
    ADO239Old_Step_NO: TIntegerField;
    aqr006: TADOQuery;
    aqr006work_order_number: TStringField;
    aqr006step: TSmallintField;
    aqr006dept_name: TStringField;
    aqr006QTY_BACKLOG: TFloatField;
    aqr006PANELS: TIntegerField;
    aqr006rkey06: TIntegerField;
    aqr239: TADOQuery;
    aqr239dept_code: TStringField;
    aqr239dept_name: TStringField;
    aqr239BARCODE_ENTRY_FLAG: TStringField;
    aqr239dept_ptr: TIntegerField;
    aqr239step_number: TSmallintField;
    aqr239old_step_no: TIntegerField;
    ADO260rkey203: TIntegerField;
    ADO260dept_ptr: TIntegerField;
    ADO260user_ptr: TIntegerField;
    ADO260auth_date: TDateTimeField;
    ADO260PUTH_INFO: TStringField;
    ADO260seq_no: TIntegerField;
    ADO260auth_flag: TBooleanField;
    ADO203: TADODataSet;
    ADO203rkey: TAutoIncField;
    ADO203return_code: TStringField;
    ADO203user_ptr: TIntegerField;
    ADO203ENT_DATE: TDateTimeField;
    ADO203submit: TDateTimeField;
    ADO203CUST_PART_PTR: TIntegerField;
    ADO203dept_ptr: TIntegerField;
    ADO203v_ttype: TStringField;
    ADO203status: TWordField;
    ADO203tstatus: TStringField;
    ADO203WTYPE_step: TIntegerField;
    ADO203describe: TWideStringField;
    ADO203reason: TWideStringField;
    ADO203scheme: TWideStringField;
    ADO203panel_qty: TIntegerField;
    ADO203pcs_qty: TIntegerField;
    ADO203Remark: TWideStringField;
    ADO203MANU_PART_NUMBER: TStringField;
    ADO203MANU_PART_DESC: TStringField;
    ADO203DEPT_CODE: TStringField;
    ADO203DEPT_NAME: TStringField;
    ADO203ABBR_NAME: TStringField;
    qryMIStep: TADOQuery;
    ads260: TADODataSet;
    ads260rkey203: TIntegerField;
    ads260dept_ptr: TIntegerField;
    ads260dept_name: TStringField;
    ads260user_ptr: TIntegerField;
    ads260employee_name: TStringField;
    ads260auth_date: TDateTimeField;
    ads260PUTH_INFO: TStringField;
    ads260seq_no: TIntegerField;
    ads260auth_flag: TBooleanField;
    DataSource2: TDataSource;
    ADO258name_no: TIntegerField;
    ADO258USER_FULL_NAME: TStringField;
    ADOQuery2: TADOQuery;
    ADO260Information: TIntegerField;
    ADOQuery3: TADOQuery;
    ADOQuery3DEPT_CODE: TStringField;
    ADOQuery3BIG_DEPT_PTR: TIntegerField;
    ADOQuery4: TADOQuery;
    ADOQuery4BIG_DEPT_PTR: TIntegerField;
    ADOQuery4DEPT_CODE: TStringField;
    ADO252pcs_qty: TIntegerField;
    ADO252pnl_qty: TIntegerField;
    aqr006pnl_qty: TIntegerField;
    aqr006pcs_qty: TIntegerField;
    tmp1: TADOQuery;
    tmp: TADOQuery;
    tmp2: TADOQuery;
    tmp3: TADOQuery;
    ADO257v_ttype: TStringField;
    ADO257Remark: TWideStringField;
    ADO257rkey73: TIntegerField;
    ADO257USER_FULL_NAME: TStringField;
    ADO257USER_LOGIN_NAME: TStringField;
    aq257v_ttype: TStringField;
    aq257remark: TWideStringField;
    aq257rkey73: TIntegerField;
    ADOQuery5: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure QryTmpExec(ALS: TStringList);
    function SqlOpen(ASQL: TStringList; AQry: TADOQuery): Boolean;overload;
    function SqlOpen(ASQL: string; AQry: TADOQuery): Boolean;overload;
    function SqlExec(ASQL: TStringList; AQry: TADOQuery;out nEffect: Integer): Boolean;overload;
    function SqlExec(ASQL: string; AQry: TADOQuery;out nEffect: Integer): Boolean;overload;
    function SqlExec(ASQL: string; out nEffect: Integer): Boolean;overload;
    function SqlExec(ASQL: TStringList;out nEffect: Integer): Boolean;overload;

    procedure ShowLSMSG(LS: TStrings);
  end;

var
  DM: TDM;

implementation

uses Dialogs;

{$R *.dfm}
procedure TDM.ShowLSMSG(LS: TStrings);
var
  S: string;
  I: Integer;
begin
  for I := 0 to LS.Count - 1 do
    S := S + #13 + LS[I];
  ShowMessage(S);
end;

function TDM.SqlExec(ASQL: TStringList; AQry: TADOQuery;out nEffect: Integer): Boolean;
begin
  nEffect := 0;
  try
    AQry.Close;
    AQry.Connection := ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    nEffect := AQry.ExecSQL;
    Result := True;
  except
    AQry.Close;
    Result := False;
    ASQL.Add('´íÎó');
    ShowLSMSG(ASQL);
  end;
end;

function TDM.SqlOpen(ASQL: TStringList; AQry: TADOQuery): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.Open;
    Result := True;
  except
    AQry.Close;
    Result := False;
    ASQL.Add('´íÎó!');
    ShowLSMSG(ASQL);
  end;
end;

function TDM.SqlExec(ASQL: string; AQry: TADOQuery;
  out nEffect: Integer): Boolean;
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  try
    LS.Add(ASQL);
    Result := SqlExec(LS,AQry,nEffect);
  finally
    LS.Free;
  end;
end;

function TDM.SqlOpen(ASQL: string; AQry: TADOQuery): Boolean;
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  try
    LS.Add(ASQL);
    Result := SqlOpen(LS,AQry);
  finally
    LS.Free;
  end;
end;

function TDM.SqlExec(ASQL: string; out nEffect: Integer): Boolean;
var
  LQry: TADOQuery;
begin
  LQry := TADOQuery.Create(Self);
  try
    Result := SqlExec(ASQL,LQry,nEffect);
  finally
    LQry.Free;
  end;
end;

function TDM.SqlExec(ASQL: TStringList; out nEffect: Integer): Boolean;
var
  LQry: TADOQuery;
begin
  LQry := TADOQuery.Create(Self);
  try
    Result := SqlExec(ASQL,LQry,nEffect);
  finally
    LQry.Free;
  end;
end;

procedure TDM.QryTmpExec(ALS: TStringList);
begin
  qrytmp.Close;
  qrytmp.Prepared := False;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Assign(ALS);
  qrytmp.ExecSQL;
end;

end.
