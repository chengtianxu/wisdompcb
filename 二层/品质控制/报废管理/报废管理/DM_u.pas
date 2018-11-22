unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,DateUtils,Controls;

type
  TDM = class(TDataModule)
    ADOCon: TADOConnection;
    ADOQAll2: TADOQuery;
    Tmp: TADOQuery;
    ADOQAll2RKEY: TAutoIncField;
    ADOQAll2MRB_NO: TStringField;
    ADOQAll2WO_PTR: TIntegerField;
    ADOQAll2TRAN_PTR: TIntegerField;
    ADOQAll2DEPT_PTR: TIntegerField;
    ADOQAll2REJECT_PTR: TIntegerField;
    ADOQAll2QTY_ORG_REJ: TIntegerField;
    ADOQAll2QTY_REJECT: TFloatField;
    ADOQAll2PANELS: TIntegerField;
    ADOQAll2FLOW_NO: TIntegerField;
    ADOQAll2STEP: TIntegerField;
    ADOQAll2EMPL_PTR: TIntegerField;
    ADOQAll2TDATETIME: TDateTimeField;
    ADOQAll2AUDIT_EMPL_PTR: TIntegerField;
    ADOQAll2AUDIT_DATETIME: TDateTimeField;
    ADOQAll2RESP_DEPT_PTR: TIntegerField;
    ADOQAll2REFERENCE: TStringField;
    ADOQAll2TTYPE: TSmallintField;
    ADOQAll2MANU_PART_NUMBER: TStringField;
    ADOQAll2MANU_PART_DESC: TStringField;
    ADOQAll2WORK_ORDER_NUMBER: TStringField;
    ADOQAll2REJ_CODE: TStringField;
    ADOQAll2REJECT_DESCRIPTION: TStringField;
    ADOQAll2EMPLOYEE_NAME: TStringField;
    ADOQAll2AuditEMPLOYEE_NAM: TStringField;
    ADOQAll2DEPT_CODE: TStringField;
    ADOQAll2DEPT_NAME: TStringField;
    ADOQAll2RepDEPT_CODE: TStringField;
    ADOQAll2RepDEPT_NAME: TStringField;
    ADOQ0006: TADOQuery;
    ADOQ0006RKEY: TAutoIncField;
    ADOQ0006WORK_ORDER_NUMBER: TStringField;
    ADOQ0006CUT_NO: TStringField;
    ADOQ0006BEGIN_STEP_NO: TSmallintField;
    ADOQ0006PANEL_A_B: TIntegerField;
    ADOQ0006WHOUSE_PTR: TIntegerField;
    ADOQ0006USER_PTR: TIntegerField;
    ADOQ0006EMPLOYEE_PTR: TIntegerField;
    ADOQ0006BOM_PTR: TIntegerField;
    ADOQ0006SUB_LEVELS: TSmallintField;
    ADOQ0006PRIORITY_CODE: TWordField;
    ADOQ0006ENGG_STATUS: TSmallintField;
    ADOQ0006PROD_STATUS: TSmallintField;
    ADOQ0006ENGG_PROD_FLAG: TSmallintField;
    ADOQ0006QUAN_SCH: TFloatField;
    ADOQ0006QUAN_REJ: TFloatField;
    ADOQ0006QUAN_PROD: TFloatField;
    ADOQ0006PANELS: TIntegerField;
    ADOQ0006REMARK_PNLS: TFloatField;
    ADOQ0006ENT_DATETIME: TDateTimeField;
    ADOQ0006SCH_COMPL_DATE: TDateTimeField;
    ADOQ0006PROJ_START_DATE: TDateTimeField;
    ADOQ0006PROJ_COMPL_DATE: TDateTimeField;
    ADOQ0006CANCEL_HOLD_DATE: TDateTimeField;
    ADOQ0006ACT_COMPL_DATE: TDateTimeField;
    ADOQ0006RMA_PTR: TIntegerField;
    ADOQ0006PARTS_PER_PANEL: TFloatField;
    ADOQ0006EDITED_BY: TIntegerField;
    ADOQ0006PLANNED_QTY: TFloatField;
    ADOQ0006RELEASE_DATE: TDateTimeField;
    ADOQ0006TRAV_PRINTED_BY_PTR: TIntegerField;
    ADOQ0006FLOW_NO: TSmallintField;
    ADOQ0006WIPMAT_STATUS: TSmallintField;
    ADOQ0006PPC_FLAG: TSmallintField;
    ADOQ0006REFERENCE_PTR: TIntegerField;
    ADOQ0006panel_ln: TFloatField;
    ADOQ0006panel_wd: TFloatField;
    ADOQ0006wtype: TWordField;
    ADOQ0006put_type: TWordField;
    ADOQ0006MATL_COST: TFloatField;
    ADOQ0006OVHD_COST: TFloatField;
    ADOQ0006pnl_size: TStringField;
    ADOQ0006from_wo_ptr: TIntegerField;
    ADOQ0058: TADOQuery;
    ADOQ0058RKEY: TAutoIncField;
    ADOQ0058MRB_NO: TStringField;
    ADOQ0058WO_PTR: TIntegerField;
    ADOQ0058TRAN_PTR: TIntegerField;
    ADOQ0058DEPT_PTR: TIntegerField;
    ADOQ0058REJECT_PTR: TIntegerField;
    ADOQ0058QTY_ORG_REJ: TIntegerField;
    ADOQ0058QTY_REJECT: TFloatField;
    ADOQ0058PANELS: TIntegerField;
    ADOQ0058BOM_PTR: TIntegerField;
    ADOQ0058FLOW_NO: TIntegerField;
    ADOQ0058STEP: TIntegerField;
    ADOQ0058EMPL_PTR: TIntegerField;
    ADOQ0058TDATETIME: TDateTimeField;
    ADOQ0058AUDIT_EMPL_PTR: TIntegerField;
    ADOQ0058AUDIT_DATETIME: TDateTimeField;
    ADOQ0058RESP_DEPT_PTR: TIntegerField;
    ADOQ0058REFERENCE: TStringField;
    ADOQ0058TTYPE: TSmallintField;
    ADOQ0006QUAN_ALLREJ: TIntegerField;
    ADOQ0058StepNow: TIntegerField;
    ADOQ564834: TADOQuery;
    ADOQ0006QUAN_ALLPNL: TIntegerField;
    ADOQAll2StepNow: TIntegerField;
    ADOQAll2PROD_STATUS: TSmallintField;
    ADOQAll2BOM_ptr1: TIntegerField;
    ADOQAll2abbr_name: TStringField;
    tmp1: TADOQuery;
    ADOQAll2warehouse_ptr: TIntegerField;
    ADOQ0058warehouse_ptr: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Get_ServerDatetime(var valDateTime,valDate,valdt : string ; var valymd:tdatetime);
    function Get_Data0004(tp:integer;sNo:string='^'):string;
    procedure getdt;
  end;

var
  DM: TDM;
  Vdtpk3Date : tdate;
  Vdtpk4Date : tdate;
  user_ptrCaption,vprevCaption :string;
implementation

{$R *.dfm}

procedure TDM.Get_ServerDatetime(var valDateTime, valDate,valdt: string ; var valymd:tdatetime);
begin
  dm.Tmp.Close ;
  Tmp.SQL.Text:='select getdate() as vdt,DATENAME(yyyy, getdate()) as vy,DATENAME(mm, getdate()) as vm,DATENAME(dd, getdate()) as vd';
  Tmp.Open ;
  valymd := dm.Tmp.fieldbyname('vdt').AsDateTime ;
  valDateTime := datetimetostr(dm.Tmp.fieldbyname('vdt').asdatetime);
  valDate := datetostr(dm.Tmp.fieldbyname('vdt').asdatetime);
  valdt := copy(dm.Tmp.fieldbyname('vy').AsString,3,2);
  valdt := valdt + copy('00',1,2 - length(trim(dm.Tmp.fieldbyname('vm').AsString))) + dm.Tmp.fieldbyname('vm').AsString;
  valdt := valdt + copy('00',1,2 - length(trim(dm.Tmp.fieldbyname('vd').AsString))) + dm.Tmp.fieldbyname('vd').AsString;
  dm.Tmp.Close ;
end;

function TDM.Get_Data0004(tp:integer;sNo:string): string;
var sL,s:string;
    B:boolean;
    i:integer;
begin
  result := '';
  if tp=0 then
  begin
    DM.Tmp.Close;
    DM.Tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey =18';
    DM.Tmp.Open;
    result :=DM.Tmp.Fields[0].AsString;
  end else begin
    sL:='0';
    s:=sNo;
    for i:=length(s) downto 1 do
      if not (s[i] in ['0'..'9']) then begin sL:=inttostr(i); break; end;

    B:=true;
    while B do
    begin
      DM.Tmp.Close;
      DM.Tmp.SQL.Text:='update data0004 set SEED_VALUE=left(SEED_VALUE,'+sL+')+right(''00000''+cast(cast(right(SEED_VALUE,len(SEED_VALUE)-'+sL+') as int)+1 as varchar(6)),6) '+
                       'where rkey=18 and SEED_VALUE='''+sNo+'''';
      if DM.Tmp.ExecSQL=0 then
      begin
        DM.Tmp.Close;
        DM.Tmp.SQL.Text:='select SEED_VALUE  from data0004  where rkey =18';
        DM.Tmp.Open;
        sNo:=DM.Tmp.Fields[0].AsString;
      end else
        B:=false;
    end;
    result :=sNo ;
  end;
end;

procedure TDM.getdt;
begin
  Tmp.Close ;
  Tmp.SQL.Text:='select getdate()';
  Tmp.Open ;
  Vdtpk3Date := tmp.fields[0].AsDateTime-1;
  Vdtpk4Date := tmp.fields[0].AsDateTime;
  tmp.Close;
end;

end.
