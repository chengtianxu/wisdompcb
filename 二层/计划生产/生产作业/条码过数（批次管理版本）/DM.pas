unit DM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ExtCtrls, ComCtrls, StdCtrls, Buttons,DB, ADODB,
  Menus,math, Provider, DBClient;

type
  Tdmcon = class(TDataModule)
    ADOConnection1: TADOConnection;
    adsUserInfo: TADODataSet;
    adsWOInfo: TADODataSet;
    dsWOInfo: TDataSource;
    aqNextStepNO: TADOQuery;
    adsEmployee: TADODataSet;
    aqBasicParam: TADOQuery;
    aqTmp: TADOQuery;
    dsEmployee: TDataSource;
    ads0041: TADODataSet;
    ads0048: TADODataSet;
    aqTmp2: TADOQuery;
    tmp: TADOQuery;
    DS: TDataSource;
    aspWO_Split: TADOStoredProc;
    tmpQry: TADOQuery;
    NextStep_238: TADOQuery;
    WoClamp: TADOQuery;
    WoClampWORK_ORDER_NUMBER: TStringField;
    WoClampCUT_NO: TStringField;
    WoClampPANEL_A_B: TIntegerField;
    WoClampBEGIN_STEP_NO: TSmallintField;
    WoClampSUB_LEVELS: TSmallintField;
    WoClampPRIORITY_CODE: TWordField;
    WoClampPROD_STATUS: TSmallintField;
    WoClampENGG_STATUS: TSmallintField;
    WoClampENGG_PROD_FLAG: TSmallintField;
    WoClampQUAN_SCH: TFloatField;
    WoClampQUAN_REJ: TFloatField;
    WoClampQUAN_PROD: TFloatField;
    WoClampPANELS: TIntegerField;
    WoClampREMARK_PNLS: TFloatField;
    WoClampPLANNED_QTY: TFloatField;
    WoClampFLOW_NO: TSmallintField;
    WoClampWIPMAT_STATUS: TSmallintField;
    WoClampwtype: TWordField;
    WoClampput_type: TWordField;
    WoClampMATL_COST: TFloatField;
    WoClampOVHD_COST: TFloatField;
    WoClampfrom_wo_ptr: TIntegerField;
    WoClampCUTNO_WO: TStringField;
    WoClampLOT_NUMBER: TStringField;
    WoClampQUAN_ALLPNL: TIntegerField;
    WoClamprkey06: TAutoIncField;
    WoClampRKEY: TAutoIncField;
    WoClampSTEP: TSmallintField;
    WoClampQTY_BACKLOG: TFloatField;
    WoClamppanels56: TIntegerField;
    WoClampINTIME: TDateTimeField;
    WoClampTO_BE_STOCKED: TFloatField;
    WoClampwtype56: TSmallintField;
    WoClampREFERENCE: TStringField;
    WoClampTO_BE_CANCD: TIntegerField;
    WoClampOUTSOURCE: TBooleanField;
    WoClampPO_NUMBER: TStringField;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    WoClampIn: TADOQuery;
    WoClampInWORK_ORDER_NUMBER: TStringField;
    WoClampInCUT_NO: TStringField;
    WoClampInPANEL_A_B: TIntegerField;
    WoClampInBEGIN_STEP_NO: TSmallintField;
    WoClampInSUB_LEVELS: TSmallintField;
    WoClampInPRIORITY_CODE: TWordField;
    WoClampInPROD_STATUS: TSmallintField;
    WoClampInENGG_STATUS: TSmallintField;
    WoClampInENGG_PROD_FLAG: TSmallintField;
    WoClampInQUAN_SCH: TFloatField;
    WoClampInQUAN_REJ: TFloatField;
    WoClampInQUAN_PROD: TFloatField;
    WoClampInPANELS: TIntegerField;
    WoClampInREMARK_PNLS: TFloatField;
    WoClampInPLANNED_QTY: TFloatField;
    WoClampInFLOW_NO: TSmallintField;
    WoClampInWIPMAT_STATUS: TSmallintField;
    WoClampInwtype: TWordField;
    WoClampInput_type: TWordField;
    WoClampInMATL_COST: TFloatField;
    WoClampInOVHD_COST: TFloatField;
    WoClampInfrom_wo_ptr: TIntegerField;
    WoClampInCUTNO_WO: TStringField;
    WoClampInLOT_NUMBER: TStringField;
    WoClampInQUAN_ALLPNL: TIntegerField;
    WoClampInrkey06: TAutoIncField;
    WoClampInRKEY: TAutoIncField;
    WoClampInSTEP: TSmallintField;
    WoClampInQTY_BACKLOG: TFloatField;
    WoClampInpanels56: TIntegerField;
    WoClampInINTIME: TDateTimeField;
    WoClampInTO_BE_STOCKED: TFloatField;
    WoClampInwtype56: TSmallintField;
    WoClampInREFERENCE: TStringField;
    WoClampInTO_BE_CANCD: TIntegerField;
    WoClampInOUTSOURCE: TBooleanField;
    WoClampInPO_NUMBER: TStringField;
    Para_Value: TADOQuery;
    Para_Valuenames_value: TMemoField;
    ADO101: TADOQuery;
    ADO101names_value: TMemoField;
    ADO014: TADOQuery;
    ADO014rkey: TAutoIncField;
    ADO014MESSAGE: TStringField;
    ADO014senddate: TDateTimeField;
    ADO014whosend: TIntegerField;
    ADO314: TADOQuery;
    ADO314rkey: TAutoIncField;
    ADO314emp_ptr: TIntegerField;
    ADO314d14_ptr: TIntegerField;
    ADO314hread: TStringField;
    ADO314deleted: TStringField;
    ADO314if_note: TBooleanField;





    procedure cdsWorkOrderListBeforeDelete(DataSet: TDataSet);
    procedure cdsWorkOrderListBeforeInsert(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
    vhwnd_TfrmDeployWO:hwnd;
    vTransQty,vTransQtyfr:integer;
    function Check_User_Auth(rKey_User,Dept_ptr:integer):boolean;OVERLOAD;
    function Check_User_Auth(rKey_User:integer;VWoNo:STRING):boolean;OVERLOAD;
    function Check_User_Factory(rkey_User,rkey_06:Integer):Boolean;
    function Check_WO(WoNo:string):boolean;//验证作业单是否可以过数
    function Check_WO_Son(WoNo:string):Boolean;//作业单是否有子工单处于等待状态
    function SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
    procedure ShowLSMSG(LS: TStrings);
    function SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;
    function UpdateWOStatus(WORkey:integer;iStatus:byte):boolean;//更改作业单的状态,为关
  end;

var
  dmcon: Tdmcon;

implementation
uses MyClass,common;
{$R *.dfm}

{ Tdmcon }

function Tdmcon.Check_User_Auth(rKey_User, Dept_ptr: integer): boolean;
var
  sqlstr:string;
begin   //检查用户在本工序是不是有过数权限
  sqlstr:='select 1 from data0487 where User_ptr='+IntToStr(rKey_User)+
        ' and Dept_ptr='+IntToStr(Dept_ptr);

  result := MyDataClass.IsExists(sqlstr);
end;

function Tdmcon.Check_User_Auth(rKey_User: integer;
  VWoNo: STRING): boolean;
var
  sqlstr:string;
begin  //检查用户在下一过数工序是不是权限
   with dmcon.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from data0238 where wo_ptr='+dmcon.adsWOInfo.FieldByName('rkey06').AsString);
    Open;
  end;
  if dmcon.ADOQuery1.IsEmpty=True then
  begin
   sqlstr:= 'select * from data0487 where user_ptr= '+IntToStr(rKey_User) + ' and dept_ptr = (SELECT TOP 1 Data0038.DEPT_PTR '
    +' FROM Data0034 INNER JOIN'
    +'        Data0038 ON Data0034.RKEY = Data0038.DEPT_PTR INNER JOIN'
    +'       Data0006 INNER JOIN'
    +'       Data0056 ON Data0006.RKEY = Data0056.WO_PTR ON'
    +'       Data0038.SOURCE_PTR = Data0006.BOM_PTR AND'
    +'       Data0038.STEP_NUMBER > Data0056.STEP'
    +' WHERE (Data0034.BARCODE_ENTRY_FLAG = ''Y'') AND'
    +'        (Data0006.PROD_STATUS IN (5, 6, 3, 4)) and '
    +'       (Data0006.WORK_ORDER_NUMBER = '''+VWoNo+''')'
    +' ORDER BY Data0038.STEP_NUMBER)';
   result := MyDataClass.IsExists(sqlstr);
  end
  else
  begin
   sqlstr:= 'select * from data0487 where user_ptr= '+IntToStr(rKey_User) + ' and dept_ptr = (SELECT TOP 1 Data0238.DEPT_PTR '
    +' FROM Data0034 INNER JOIN'
    +'        Data0238 ON Data0034.RKEY = Data0238.DEPT_PTR INNER JOIN'
    +'       Data0006 INNER JOIN'
    +'       Data0056 ON Data0006.RKEY = Data0056.WO_PTR ON'
    +'       Data0238.WO_PTR = Data0006.rkey AND'
    +'       Data0238.STEP_NUMBER > Data0056.STEP'
    +' WHERE (Data0034.BARCODE_ENTRY_FLAG = ''Y'') AND'
    +'        (Data0006.PROD_STATUS IN (5, 6, 3, 4)) and '
    +'       (Data0006.WORK_ORDER_NUMBER = '''+VWoNo+''')'
    +' ORDER BY Data0238.STEP_NUMBER)';
   result := MyDataClass.IsExists(sqlstr);
  end;

end;

function tdmcon.Check_User_Factory(rKey_User,rKey_06:integer): boolean;
begin
 result:=True;
 with dmcon.ADOQuery1 do
 begin
   Close;
   sql.Clear;
   SQL.Add('select isnull(warehouse_ptr,0) as w_ptr from data0486 where rkey='+IntToStr(rKey_User));
   Open;
 end;
 if dmcon.ADOQuery1.FieldByName('w_ptr').Value>0 then
 begin
  with dmcon.ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select isnull(LOC_PTR,0) as w_ptr from data0056 where WO_PTR='+IntToStr(rkey_06));
    Open;
  end;
  if dmcon.ADOQuery1.FieldByName('w_ptr').Value=dmcon.ADOQuery2.FieldByName('w_ptr').Value then
  Result:=True
  else
  Result:=False;
 end
 else
 begin
  Result:=True;
 end;
end;

function Tdmcon.Check_WO(WoNo: string): boolean;
var
  sqlstr:string;
begin
  result:=true;
  sqlstr:='select D06.bom_ptr,D06.prod_Status,D06.Panel_A_B, D06.WIPMAT_STATUS,D06.WTYPE as wtype06, '+
   'D06.Cut_No,D56.Step,D56.wType,D06.Flow_No,d492.tstatus,D56.DEPT_PTR '+
   'from data0006 D06 inner join Data0056 D56 '+
   'on D06.RKEY = D56.WO_PTR inner join data0492 d492 '+
   'on d06.CUT_NO = d492.CUT_NO '+
   'where D06.prod_status in (5,6,3,4) and '+
   'Work_Order_Number='+QuotedStr(WoNo);
  MyDataClass.OpenQuery(aqTmp,sqlstr);
  if (aqTmp.FieldByName('prod_status').AsInteger= 5) or
     (aqTmp.FieldByName('prod_status').AsInteger= 6) then
  begin
    ShowMsg('当前作业单已经过数到最后一道工序，不能过数',1);
    result:=false;
    exit;
  end
  else
  if (aqTmp.FieldByName('prod_status').AsInteger < 3) or
     (aqTmp.FieldByName('prod_status').AsInteger >4 ) or
     (aqTmp.FieldByName('wtype06').AsInteger=2) or
     (aqTmp.FieldByName('wtype06').AsInteger=4)
     then
  begin
    ShowMsg('当前作业单不是"生产中"或"外发生产"状态，或作业单处于MRB待确定状态，不能过数',1);
    result:=false;
    exit;
  end;
  if (aqTmp.FieldByName('tstatus').AsInteger = 1) or
     (aqTmp.FieldByName('tstatus').AsInteger = 3 ) then
  begin
    ShowMsg('当前作业单的配料单处于未审核或取消状态，不能过数',1);
    result:=false;
    exit;
  end;
//  with dmcon.ADOQuery1 do //判断母工单是不是先走
//  begin
//    Close;
//    SQL.Clear;
//    sql.Add('select mother06.* from data0006 mother06 ');
//    SQL.Add('inner join data0006 son06 on son06.from_wo_ptr=mother06.rkey');
//    SQL.Add('inner join data0056 mother56 on mother06.rkey=mother56.wo_ptr');
//    sql.Add('where son06.work_order_number='+quotedstr(WoNo));
//    SQL.Add('and mother56.step<='+dmcon.aqTmp.fieldbyName('Step').AsString);
//    sql.Add('and mother56.wtype='+dmcon.aqTmp.fieldbyName('wtype').AsString);
//    sql.Add('and mother06.prod_status='+dmcon.aqTmp.fieldbyName('prod_status').AsString);
//    Open;
//  end;
//  Result:=dmcon.ADOQuery1.IsEmpty;
//    if not result then
//  begin
//    ShowMsg('当前作业单有母工单没过数,请先过:'+dmcon.ADOQuery1.fieldByName('Work_Order_Number').AsString,1);
//    exit;
//  end;
  //如果同一配料单按顺序过数,要判断是否当前工序之前要有作业单未过数.
  if dmcon.aqBasicParam.FieldByName('ppc_control12').AsInteger =0 then exit;
  sqlstr:='SELECT D06.WORK_ORDER_NUMBER FROM dbo.Data0006 D06 INNER JOIN '+
          'dbo.Data0056 D56 ON D06.RKEY = D56.WO_PTR '+
          'where D06.WORK_ORDER_NUMBER<'+quotedstr(WoNO)+
          ' and D06.Panel_A_B='+ dmcon.aqTmp.fieldbyName('Panel_A_B').AsString+
          ' and D06.Flow_No='+dmcon.aqTmp.fieldbyName('Flow_No').AsString+
          ' and D06.Cut_No ='+QuotedStr(dmcon.aqTmp.fieldbyName('Cut_No').AsString)+
          ' and D06.wtype ='+dmcon.aqTmp.fieldbyName('wtype06').AsString+
          ' and D06.wtype<>3'+
          ' and D56.DEPT_PTR='+dmcon.aqTmp.fieldbyName('DEPT_PTR').AsString+
          ' and D56.Step<='+dmcon.aqTmp.fieldbyName('Step').AsString+
          ' and d56.wtype='+dmcon.aqTmp.fieldbyName('wtype').AsString+
          ' and d06.PROD_STATUS='+dmcon.aqTmp.fieldbyName('prod_status').AsString+
          ' Order by D06.Work_Order_Number';
  MyDataClass.OpenQuery(dmcon.aqTmp,sqlstr);
  result := dmcon.aqTmp.IsEmpty;
  if not result then
  begin
    ShowMsg('当前作业单没有按照顺序过数,请先过:'+dmcon.aqTmp.fieldByName('Work_Order_Number').AsString,1);
    exit;
  end;

end;

function TDmcon.SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := Dmcon.ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.Open;
    Result := True;
  except
    AQry.Close;
    Result := False;
    if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
    ASQL.Add('错误!');
    ShowLSMSG(ASQL);
  end;
end;

procedure TDmcon.ShowLSMSG(LS: TStrings);
var
  S: string;
  I: Integer;
begin
  for I := 0 to LS.Count - 1 do
    S := S + #13 + LS[I];
  ShowMessage(S);
end;

function TDmcon.SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;
begin
  try
    AQry.Close;
    AQry.Connection := Dmcon.ADOConnection1;
    AQry.SQL.Clear;
    AQry.SQL.Assign(ASQL);
    AQry.Prepared := True;
    AQry.ExecSQL;
    Result := True;
  except
    AQry.Close;
    Result := False;
    if ADOConnection1.InTransaction then ADOConnection1.RollbackTrans;
    ASQL.Add('错误');
    ShowLSMSG(ASQL);
  end;
end;

function Tdmcon.UpdateWOStatus(WORkey:integer;iStatus:byte):boolean;
var
  sqlstr:string;
begin
  sqlstr:='update data0006 set wipmat_status='+IntToStr(iStatus)+' where rkey='+IntToStr(WorKey);
  result:= MyDataClass.ExecSql(sqlstr);
end;


procedure Tdmcon.cdsWorkOrderListBeforeDelete(DataSet: TDataSet);
begin
abort;
end;

procedure Tdmcon.cdsWorkOrderListBeforeInsert(DataSet: TDataSet);
begin
abort;
end;

function Tdmcon.Check_WO_Son(WoNo:string):Boolean;
begin
  Result:=True;
  with dmcon.tmp do
  begin
    Close;
    sql.Clear;
    SQL.Add('select d06_1.wtype from data0006 d06_1,data0006 d06_2 where d06_1.from_wo_ptr=d06_2.rkey');
    SQL.Add('and d06_2.work_order_number='+QuotedStr(WoNo));
    sql.Add('and d06_1.wtype in(2,4)');
    Open;
  end;
  if dmcon.tmp.IsEmpty=true then
  begin
   Result:=True;
  end
  else
  begin
    Result:=False;
    ShowMessage('此工单有子工单处于MRB确定状态，不能过数！请联系MRB部门！');
  end;
end;

end.

