unit DM_u;

interface

uses
  SysUtils, Classes, DB, ADODB,DateUtils,Dialogs,Controls;

type
  TDM = class(TDataModule)
    con1: TADOConnection;
    ADO0053: TADOQuery;
    ADO0048: TADOQuery;
    ADO0053RKEY: TAutoIncField;
    ADO0053WHSE_PTR: TIntegerField;
    ADO0053LOC_PTR: TIntegerField;
    ADO0053WORK_ORDER_PTR: TIntegerField;
    ADO0053CUST_PART_PTR: TIntegerField;
    ADO0053QUANTITY: TFloatField;
    ADO0053QTY_ON_HAND: TFloatField;
    ADO0053QTY_ALLOC: TFloatField;
    ADO0053MFG_DATE: TDateTimeField;
    ADO0053RMA_PTR: TIntegerField;
    ADO0053NPAD_PTR: TIntegerField;
    ADO0053REFERENCE_NUMBER: TStringField;
    ADO0053USER_DATE: TDateTimeField;
    ADO0053barcode_ptr: TIntegerField;
    ADO0053DEPT_PTR: TIntegerField;
    ADO0053STEP: TSmallintField;
    ADO0053PANELS: TIntegerField;
    ADO0053EMPLOYEE_PTR: TIntegerField;
    ADO0048RKEY: TAutoIncField;
    ADO0048WO_PTR: TIntegerField;
    ADO0048FM_DEPT_PTR: TIntegerField;
    ADO0048WORK_CENTER_PTR: TIntegerField;
    ADO0048TO_DEPT_PTR: TIntegerField;
    ADO0048INTIME: TDateTimeField;
    ADO0048OUTTIME: TDateTimeField;
    ADO0048QTY_PROD: TIntegerField;
    ADO0048QTY_REJECT: TIntegerField;
    ADO0048PANELS: TIntegerField;
    ADO0048FLOW_NO: TSmallintField;
    ADO0048STEP_NO: TSmallintField;
    ADO0048ACTION_REF: TStringField;
    ADO0048EMPL_PTR: TIntegerField;
    ADO0048WTYPE: TWordField;
    ADO0048put_type: TWordField;
    ADOQ416: TADOQuery;
    ADOQ416rkey: TAutoIncField;
    ADOQ416number: TStringField;
    ADOQ416type: TWordField;
    ADOQ416empl_ptr: TIntegerField;
    ADOQ416sys_date: TDateTimeField;
    ADOQ416quantity: TIntegerField;
    ADOQ416reference: TStringField;
    ADOQ416rma_ptr: TIntegerField;
    ADOQ416so_ptr: TIntegerField;
    ADOQ416EMPLOYEE_NAME: TStringField;
    qrytmp: TADOQuery;
    ADOQ53: TADOQuery;
    ADOQ53MANU_PART_NUMBER: TStringField;
    ADOQ53MANU_PART_DESC: TStringField;
    ADOQ53CUST_CODE: TStringField;
    ADOQ53CUSTOMER_NAME: TStringField;
    ADOQ53CUT_NO: TStringField;
    ADOQ53SO_NO: TStringField;
    ADOQ53WORK_ORDER_NUMBER: TStringField;
    ADOQ53QUANTITY: TFloatField;
    ADOQ53MFG_DATE: TDateTimeField;
    ADOQ53CODE: TStringField;
    ADOQ53LOCATION: TStringField;
    ADOQ53REFERENCE_NUMBER: TStringField;
    ADOQ53RKEY: TAutoIncField;
    ADOQ53WHSE_PTR: TIntegerField;
    ADOQ53LOC_PTR: TIntegerField;
    ADOQ53WORK_ORDER_PTR: TIntegerField;
    ADOQ53CUST_PART_PTR: TIntegerField;
    ADOQ53QTY_ON_HAND: TFloatField;
    ADOQ53QTY_ALLOC: TFloatField;
    ADOQ53RMA_PTR: TIntegerField;
    ADOQ53NPAD_PTR: TIntegerField;
    ADOQ53USER_DATE: TDateTimeField;
    ADOQ53barcode_ptr: TIntegerField;
    ADOQ53DEPT_PTR: TIntegerField;
    ADOQ53STEP: TSmallintField;
    ADOQ53PANELS: TIntegerField;
    ADOQ53EMPLOYEE_PTR: TIntegerField;
    ADO0048warehouse_ptr: TIntegerField;
    ADO0053PO_NUMBER: TStringField;
    ADOQ53po_number: TStringField;
    ADOQ53spec_place: TStringField;
    ADO0053spec_place: TStringField;
    ADOQ53EMPLOYEE_NAME: TStringField;
    procedure ADOQ416AfterScroll(DataSet: TDataSet);
  private

  public
    function Get_ServerDatetime(var valDateTime,valDate,valdt : string ; var valymd:tdatetime):boolean;
    function SqlOpen(AStr: string): Boolean;
    function SqlExec(AStr: string): Boolean;
    function GetServerDatetime(): TDateTime;
    function IS_Stock_Inventorying: boolean;
  end;

var
  DM: TDM;
  Vdtpk3Date : Tdate;
  Vdtpk4Date :Tdate;
  user_ptrCaption,vprevCaption,db_ptrCaption,user_Nm :string;
  
implementation

{$R *.dfm}
function TDM.IS_Stock_Inventorying: boolean; //判断在制品是否在盘点
begin                                   //在盘点返回为TRUE,无盘点返回为FALSE
  if SqlOpen('select * from data0400 where status=0') then
  begin
    Result := not qrytmp.IsEmpty;
  end else
    Result := True;
end;

function TDM.GetServerDatetime: TDateTime;
begin
  if SqlOpen('select getdate() as DTime') then
  begin
    Result := qrytmp.fieldbyname('DTime').AsDateTime;
  end else
    Result := 0;
end;

function TDM.Get_ServerDatetime(var valDateTime, valDate,valdt: string ; var valymd:tdatetime): boolean;
begin
  result := false;
  qrytmp.Close ;
  qrytmp.SQL.Clear ;
  qrytmp.SQL.Add('select getdate() as vdt,DATENAME(yyyy, getdate()) as vy,DATENAME(mm, getdate()) as vm,DATENAME(dd, getdate()) as vd');
  qrytmp.Open ;
  valymd := dm.qrytmp.fieldbyname('vdt').AsDateTime ;
  valDateTime := datetimetostr(dm.qrytmp.fieldbyname('vdt').asdatetime);
  valDate := datetostr(dm.qrytmp.fieldbyname('vdt').asdatetime);
  valdt := copy(dm.qrytmp.fieldbyname('vy').AsString,3,2);
  valdt := valdt + dm.qrytmp.fieldbyname('vm').AsString;
  valdt := valdt + dm.qrytmp.fieldbyname('vd').AsString;
  dm.qrytmp.Close ;
  result := true;
end;


procedure TDM.ADOQ416AfterScroll(DataSet: TDataSet);
begin
  if not ADOQ416.IsEmpty then
  begin
    ADOQ53.Close ;
    ADOQ53.Parameters.ParamValues['rkey416'] := ADOQ416rkey.AsInteger;
    ADOQ53.Open ;
  end else
    ADOQ53.Close ;
end;

function TDM.SqlExec(AStr: string): Boolean;
begin
  Result := False;
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Add(AStr);
  qrytmp.ExecSQL;
  Result := True;
end;

function TDM.SqlOpen(AStr: string): Boolean;
begin
  Result := False;
  qrytmp.Close;
  qrytmp.SQL.Clear;
  qrytmp.SQL.Add(AStr);
  qrytmp.Open;
  Result := True;
end;


end.
