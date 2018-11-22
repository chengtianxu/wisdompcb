unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdmcon = class(TDataModule)
    ADOConnection1: TADOConnection;
    adsWOInfo: TADODataSet;
    dsWOInfo: TDataSource;
    aqNextStepNO: TADOQuery;
    adsEmployee: TADODataSet;
    aqBasicParam: TADOQuery;
    aqTmp: TADOQuery;
    dsEmployee: TDataSource;
    ads0041: TADODataSet;
    ads0048: TADODataSet;
    adsFlowList: TADODataSet;
    dsFlowList: TDataSource;
    ads0056: TADODataSet;
    aqTmp2: TADOQuery;
    tmp: TADOQuery;
    NextStep_238: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    Para_Value: TADOQuery;
    Para_Valuenames_value: TMemoField;
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
    ads238FlowList: TADODataSet;
    tmpQry: TADOQuery;
    adsUserInfo: TADODataSet;
    procedure adsWOInfoAfterScroll(DataSet: TDataSet);
    procedure adsFlowListAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function Check_User_Auth(rKey_User,Dept_ptr:integer):boolean;
    function Check_WO(WoNo:string):boolean;//验证作业单是否可以过数
    function Check_WO_Son(WoNo:string):Boolean;//验证作业单子工单是否处于等待状态,否则不允许母工单过数
    function SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
    procedure ShowLSMSG(LS: TStrings);
    function SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;       
  end;

var
  dmcon: Tdmcon;

implementation
uses MyClass,common, Dialogs;
{$R *.dfm}

{ Tdmcon }

function Tdmcon.Check_User_Auth(rKey_User, Dept_ptr: integer): boolean;
var
  sqlstr:string;
begin
  sqlstr:='select 1 from data0487 where User_ptr='+IntToStr(rKey_User)+' and Dept_ptr='+IntToStr(Dept_ptr);
  result := MyDataClass.IsExists(sqlstr);
end;

function Tdmcon.Check_WO(WoNo: string): boolean;
var
  sqlstr:string;
begin
  Result := True;
  sqlstr:='select D06.bom_ptr,D06.prod_Status,D06.Panel_A_B, D06.WIPMAT_STATUS,D06.WTYPE as wtype06, '+
   'D06.Cut_No,D56.Step,D56.wType,D06.Flow_No,d492.tstatus,D56.DEPT_PTR '+
   'from data0006 D06 inner join Data0056 D56 '+
   'on D06.RKEY = D56.WO_PTR inner join data0492 d492 '+
   'on d06.CUT_NO = d492.CUT_NO '+
   'where D06.prod_status in (5,6,3,4) and '+
   'Work_Order_Number='+QuotedStr(WoNo);
  MyDataClass.OpenQuery(aqTmp,sqlstr); //MyDataClass.IsExists(sqlstr);

  if aqtmp.IsEmpty then
   begin
    ShowMsg('作业单号错误，不能过数',1);
    result:=false;
    exit;
   end;

   if (aqTmp.FieldByName('tstatus').AsInteger = 1) or
      (aqTmp.FieldByName('tstatus').AsInteger = 3) then
   begin
    ShowMsg('当前作业单的配料单处于未审核或取消状态，不能过数',1);
    result:=false;
    exit;
   end;

  if (aqTmp.FieldByName('prod_status').AsInteger= 5) or
     (aqTmp.FieldByName('prod_status').AsInteger= 6) then
   begin
    ShowMsg('当前作业单已经过数到最后一道工序，不能过数',1);
    result:=false;
    exit;
   end
  else
   if (aqTmp.FieldByName('prod_status').AsInteger < 3) or
      (aqTmp.FieldByName('prod_status').AsInteger >4 ) then
   begin
    ShowMsg('当前作业单不是"生产中"或"外发生产"状态，不能过数',1);
    result:=false;
    exit;
   end;

  if aqTmp.FieldByName('WIPMAT_STATUS').AsInteger = 0 then
  begin
    ShowMsg('内层未分配不可以过数',1);
    Result := False;
    Exit;
  end;   

  if (dmcon.aqTmp.FieldByName('wType').AsInteger > 0) and
     (dmcon.aqTmp.FieldByName('Step').AsInteger=dmcon.aqTmp.FieldByName('wType').AsInteger) then //返工的作业单，要判断是否已经过数到了返工前的工序，如果是则不允许继续过数
   begin
    result := false;
    ShowMsg('该作业单是返工状态，已经过数到返工前工序，请先做返工结束处理，才能继续过数！',1);
    exit;
   end;
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

procedure Tdmcon.adsWOInfoAfterScroll(DataSet: TDataSet);
begin
  with dmcon.ADOQuery1 do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from data0238 where wo_ptr='+dmcon.adsWOInfo.FieldByName('rkey06').AsString);
    Open;
  end;
  if not dmcon.ADOQuery1.IsEmpty then
  begin
    MyDataClass.OpenDataSetByPara(DataSet.FieldByName('Work_Order_Number').AsString,ads238FlowList);
    dsFlowList.DataSet:=ads238FlowList;
  end
  else
  begin
   MyDataClass.OpenDataSetByPara(DataSet.FieldByName('Work_Order_Number').AsString,adsFlowList);
   dsFlowList.DataSet:=adsFlowList;
  end;
end;

procedure Tdmcon.adsFlowListAfterOpen(DataSet: TDataSet);
begin
  MyDataClass.OpenDataSetByPara(DataSet.fieldbyName('rKey06').AsInteger,ads0056);
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

function TDmcon.Check_WO_Son(WoNo:string):Boolean;
begin
  Result:=True;
  with dmcon.tmp do
  begin
    Close;
    sql.Clear;
    SQL.Add('select d06_1.* from data0006 d06_1,data0006 d06_2 where d06_1.from_wo_ptr=d06_2.rkey');
    SQL.Add('and d06_2.work_order_number='+QuotedStr(WoNo));
    Open;
  end;
  if dmcon.tmp.IsEmpty=true then
  begin
   Result:=True;
  end
  else
  begin
    dmcon.tmp.First;
    while not dmcon.tmp.Eof do
    begin
      if ((dmcon.tmp.FieldByName('wtype').AsInteger=2) or (dmcon.tmp.FieldByName('wtype').AsInteger=4)) and ((dmcon.tmp.FieldByName('PROD_STATUS').Value=3) or (dmcon.tmp.FieldByName('PROD_STATUS').Value=4)) then
      begin
        Result:=False;
        ShowMessage('此工单有子工单处于MRB确定状态，不能过数！请联系MRB部门！');
        break;
      end;
      dmcon.tmp.Next;
    end;
  end;
end;


end.
