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
    adsSubProds: TADODataSet;
    adsProdList: TADODataSet;
    adsAuto_WO_List: TADODataSet;
    adsTransRec: TADODataSet;
    ADOSub25: TADOQuery;
    ADOSub25rkey: TAutoIncField;
    ADOSumqty: TADOQuery;
    ADOSubneed: TADOQuery;
    ADOSubneedwork_order_number: TStringField;
    ADOSubneedqty_bom: TBCDField;
    ADOSubneedmanu_part_number: TStringField;
    ADOSubneedquan_issued: TIntegerField;
    ADOSubneedrkey: TAutoIncField;
    ADOSubneedbom_step: TWordField;
    ADOSubneedQty_Total_Req: TFloatField;
    ADOSubneedWONO: TAutoIncField;
    ADOSubneedQty_Needed: TFloatField;
    ADOSumqtyqty_totel: TFloatField;
    adsWorkOrderList: TADODataSet;
    adsWorkOrderListIsSelected: TBooleanField;
    adsWorkOrderListRKEY: TAutoIncField;
    adsWorkOrderListWORK_ORDER_NUMBER: TStringField;
    adsWorkOrderListQty_BackLog: TFloatField;
    adsWorkOrderListENT_DATETIME: TDateTimeField;
    adsWorkOrderListTransQty: TFloatField;
    adsWorkOrderListSO_NO: TStringField;
    adsWorkOrderListQUAN_PROD: TFloatField;
    adsWorkOrderListQuan_Sch: TFloatField;
    dsWorkOrderList: TDataSource;
    cdsWorkOrderList: TClientDataSet;
    cdsWorkOrderListIsSelected: TBooleanField;
    cdsWorkOrderListRKEY: TAutoIncField;
    cdsWorkOrderListWORK_ORDER_NUMBER: TStringField;
    cdsWorkOrderListQty_BackLog: TFloatField;
    cdsWorkOrderListENT_DATETIME: TDateTimeField;
    cdsWorkOrderListTransQty: TFloatField;
    cdsWorkOrderListSO_NO: TStringField;
    cdsWorkOrderListQUAN_PROD: TFloatField;
    cdsWorkOrderListQuan_Sch: TFloatField;
    dspWorkOrder: TDataSetProvider;
    dsTransRec: TDataSource;
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
    procedure adsSubProdsAfterOpen(DataSet: TDataSet);
    procedure adsSubProdsAfterScroll(DataSet: TDataSet);
    procedure adsProdListAfterOpen(DataSet: TDataSet);
    procedure adsProdListAfterScroll(DataSet: TDataSet);
    procedure adsWorkOrderListAfterOpen(DataSet: TDataSet);
    procedure cdsWorkOrderListBeforeDelete(DataSet: TDataSet);
    procedure cdsWorkOrderListBeforeInsert(DataSet: TDataSet);
    procedure cdsWorkOrderListBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
    vIsSelected:boolean;
  public
    { Public declarations }
    vhwnd_TfrmDeployWO:hwnd;
    vTransQty,vTransQtyfr:integer;
    function Check_User_Auth(rKey_User,Dept_ptr:integer):boolean;OVERLOAD;
    function Check_User_Auth(rKey_User:integer;VWoNo:STRING):boolean;OVERLOAD;
    function Check_WO(WoNo:string):boolean;//验证作业单是否可以过数
    function Check_WO_Son(WoNo:string):Boolean;//作业单是否有子工单处于等待状态
    function SQLOpen(AQry: TADOQuery; ASQL: TStringList): Boolean;
    procedure ShowLSMSG(LS: TStrings);
    function SQLExec(AQry: TADOQuery; ASQL: TStringList): Boolean;
    function ChangeWOQty(WoRkey:integer):boolean; //更改作业单数量
    function CloseWO(WOrKey:integer):boolean;//关闭作业单
    function DeployWO(WONO:integer;var SubWOList,Qty_List:string):boolean;//分配作业单
    function AutoDeployWO(DataSet:TAdoDATASET):boolean;//自动分配作业单
    function UpdateWOStatus(WORkey:integer;iStatus:byte):boolean;//更改作业单的状态,为关闭
    procedure OpenWOList(rKey:integer);//打开主作业单列表
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
{
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
  }

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
//      ShowMessage(sqlstr);
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
//    ShowMessage(sqlstr);
   result := MyDataClass.IsExists(sqlstr);
  end;


end;

function Tdmcon.Check_WO(WoNo: string): boolean;
var
  sqlstr:string;
  step56,rkey25:integer;
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
  rkey25:=aqTmp.FieldByName('bom_ptr').AsInteger;
  step56:=aqTmp.FieldByName('step').AsInteger;
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
  if (aqTmp.FieldByName('tstatus').AsInteger = 1) or
     (aqTmp.FieldByName('tstatus').AsInteger = 3 ) then
  begin
    ShowMsg('当前作业单的配料单处于未审核或取消状态，不能过数',1);
    result:=false;
    exit;
  end;

  if (aqTmp.FieldByName('WIPMAT_STATUS').AsInteger = 0) and (aqTmp.FieldByName('wtype').Value=0) then//内层未分配而且在正常过数要判断子工单是否满足其分配
  begin
    dmcon.ADOSub25.Close;
    dmcon.ADOSub25.Parameters[0].Value:=rkey25;
    dmcon.ADOSub25.Parameters[1].Value:=step56;
    dmcon.ADOSub25.Open;
    if dmcon.ADOSub25.IsEmpty then
    begin
    ShowMsg('工单状态发生错误,此步骤根本不需要压合!',1);
    result:=false;
    exit;
    end;
    dmcon.ADOSub25.First;
    while not dmcon.ADOSub25.Eof do//遍历子层分配供需情况
    begin
    dmcon.ADOSubneed.close;
    dmcon.ADOSubneed.Parameters[0].Value:=WoNo;
    dmcon.ADOSubneed.Parameters[1].Value:=dmcon.ADOSub25rkey.Value;
    dmcon.ADOSubneed.Open;
    dmcon.ADOSumqty.Close;
    dmcon.ADOSumqty.Parameters[0].Value:=dmcon.ADOSub25rkey.Value;
    dmcon.ADOSumqty.Open;
    if dmcon.ADOSubneedQty_Needed.Value>dmcon.ADOSumqtyqty_totel.Value then
    begin
    ShowMsg('内层分配数量不足,无法先分配再过数!',1);
    result:=False;
    exit;
    end
    else
    begin
    result:=true;
    end;
    dmcon.ADOSub25.Next;
    end;
   end;


  if (dmcon.aqTmp.FieldByName('wType').AsInteger > 0) and
     (dmcon.aqTmp.FieldByName('Step').AsInteger=dmcon.aqTmp.FieldByName('wType').AsInteger) then
     //返工的作业单，要判断是否已经过数到了返工前的工序，如果是则修改作业单到正常状态，并正常过数
  begin
      with dm.dmcon.tmp do
      begin
        Close;
        sql.Clear;
        SQL.Add('update data0056 set WType=0');
        sql.Add('from data0056 inner join data0006');
        SQL.Add('on data0056.wo_ptr=data0006.rkey');
        sql.Add('where data0006.work_order_number=:str');
        Parameters[0].Value:=WoNo;
        ExecSQL;
      end;
//    result := false;
//    ShowMsg('该作业单是返工状态，已经过数到返工前工序，请先做返工结束处理，才能继续过数！',1);
//    exit;
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

function TDmcon.AutoDeployWO(DataSet: TAdoDATASET): boolean;
var
  TotalNeedQty,ProvidQty,SubTotalQty : integer;
  Sqlstr,WO_List,Qty_List:string;
begin
//1.遍历内层产品,如果内层数量不足,那么就要自动发放数量,
//2.如果自动发放数量不够,那么就终止,否则继续下一个内层
//3.遍历结束后,如果内层数量够,那么操作结束,否则失败
  try
    result := false;
    adsSubProds.First;
    while not adsSubProds.Eof do
    begin
      //已发放数量不满足主产品的需求,那么需要自动分配内层作业单数量
      if adsSubProds.FieldByName('quan_issued').Asinteger < adsSubProds.FieldByName('Qty_Total_Req').Asinteger then
      begin
        WO_List:='';
        Qty_List:='';
        TotalNeedQty:=adsSubProds.FieldByName('Qty_Needed').Asinteger;
        //打开可发放的在线作业单列表
        DataSet.Close;
        Sqlstr:='select D06.RKEY, D56.Qty_BackLog,D06.WORK_ORDER_NUMBER '+
                'from data0006 D06 inner join data0056 D56 on D56.WO_Ptr=D06.rKey '+
                'inner join data0492 D492 on D06.Cut_NO=D492.Cut_NO '+
                'where D06.PROD_STATUS=6 and D06.BOM_Ptr='+adsSubProds.FieldByName('rKey').Asstring+
                ' and D06.panel_A_B='+adsProdList.fieldbyname('panel_A_B').AsString;

        if adsProdList.fieldByName('ttype').AsInteger = 2 then //属于mrb投产,不能用SO_NO来过滤作业单,需要用mrb_ptr
          Sqlstr := Sqlstr+ ' and D492.mrb_ptr='+adsProdList.FieldByName('mrb_ptr').Asstring
        else
         // Sqlstr := Sqlstr+ ' and D492.SO_NO='+QuotedStr(adsProdList.FieldByName('SO_NO').Asstring);   //同一批投产的才能自动分配
          Sqlstr := Sqlstr+ ' and left(D492.Cut_NO,len(D492.Cut_NO)-1)='''+copy(trim(adsProdList.FieldByName('Cut_NO').Asstring),1,length(trim(adsProdList.FieldByName('Cut_NO').Asstring))-1)+'''';

        DataSet.CommandText:=Sqlstr+' order by D492.SO_NO, D06.work_order_Number,D06.ENT_DATETIME';
        DataSet.open;
        ProvidQty:=Floor(Get_Field_Total_Value(DataSet,'Qty_BackLog'));

        if ProvidQty < TotalNeedQty then    //可发放数量 < 需求数量
        begin
          result := false;
          exit;
        end else begin                    //可发放数量 >= 需求数量
          SubTotalQty:=0;
          DataSet.First;
          while not DataSet.Eof do
          begin
            SubTotalQty:=SubTotalQty+DataSet.FieldByName('Qty_BackLog').AsInteger;
            if SubTotalQty<=TotalNeedQty then    
            begin
              if WO_List = '' then
                WO_List:=DataSet.FieldByName('rKey').AsString
              else
                WO_List:=WO_List+','+DataSet.FieldByName('rKey').AsString;
              if Qty_List= '' then
                Qty_List:=DataSet.FieldByName('Qty_BackLog').AsString
              else
                Qty_List:=Qty_List+','+DataSet.FieldByName('Qty_BackLog').AsString;
              if SubTotalQty=TotalNeedQty then break;
            end else begin
              if WO_List = '' then
                WO_List:=DataSet.FieldByName('rKey').AsString
              else
                WO_List:=WO_List+','+DataSet.FieldByName('rKey').AsString;
              if Qty_List= '' then
                Qty_List:=inttostr(TotalNeedQty-SubTotalQty+DataSet.FieldByName('Qty_BackLog').AsInteger)
              else
                Qty_List:=Qty_List+','+inttostr(TotalNeedQty-SubTotalQty+DataSet.FieldByName('Qty_BackLog').AsInteger);
              break;
            end;

            tmpQry.Close;
            tmpQry.SQL.Text:='select D06.rkey from data0006 D06 inner join data0056 D56 on D56.WO_Ptr=D06.rKey '+
                             'where d06.PROD_STATUS=6 and D06.rkey='+DataSet.FieldByName('rKey').AsString+
                             ' and D56.Qty_BackLog-d06.quan_allrej='+DataSet.FieldByName('Qty_BackLog').AsString;
            tmpQry.Open;
            if tmpQry.IsEmpty then
            begin
              ShowMsg('作业单:'+DataSet.FieldByName('WORK_ORDER_NUMBER').AsString+'在线数量或状态发生改变,请检查!',1);
              adsSubProds.Close;
              adsSubProds.Open;
              exit;
            end;

            DataSet.next;
          end;
          result :=dmcon.DeployWO(dmcon.adsProdList.fieldByName('rKey').AsInteger,WO_List,Qty_List);
          if not result then exit;
        end;
        
      end;
      adsSubProds.next;
    end;
  finally
    DATASET.Close;
  end;
end;

function TDmcon.DeployWO(WONO: integer; var SubWOList,Qty_List: string): boolean;
var
  sproc_name: string;
  ParamStrs: array of variant;
  Direction: array of TParameterDirection;
begin
  sproc_name := 'Deploy_WO_Qty';
  SetLength(ParamStrs,5);
  SetLength(Direction,5);
  ParamStrs[0]:= 0;
  ParamStrs[1]:= WONO;
  ParamStrs[2]:= SubWOList;
  ParamStrs[3]:= Qty_List;
  ParamStrs[4]:= StrToInt(User_ptr);


  Direction[0] := pdReturnValue;
  Direction[1] := pdInput;
  Direction[2] := pdInput;
  Direction[3] := pdInput;
  Direction[4] := pdInput;

  try
    MyDataCLass.ExecProc(sproc_name, ParamStrs, Direction);
  finally
    SubWOList:='';  Qty_List:='';
    result := VarAsType(ParamStrs[0],varInteger)=0;//0更新成功，否则失败
  end;
end;


procedure Tdmcon.adsSubProdsAfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
  begin
    adsTransRec.Close;
    adsTransRec.Parameters[0].Value := 0;
    adsTransRec.Parameters[1].Value := 0;
    adsTransRec.open;
  end;
end;

procedure Tdmcon.adsSubProdsAfterScroll(DataSet: TDataSet);
begin
  adsTransRec.Close;
  adsTransRec.Parameters[0].Value := adsSubProds.fieldByName('WONO').Value;
  adsTransRec.Parameters[1].Value := adsSubProds.fieldByName('rKey').Value;
  adsTransRec.open;
end;

procedure Tdmcon.adsProdListAfterOpen(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
  begin
    adsSubProds.Close;
    adsSubProds.Parameters[0].Value := 0;
    adsSubProds.Open;
  end;
end;

procedure Tdmcon.adsProdListAfterScroll(DataSet: TDataSet);
var
  S: string;
begin
  adsSubProds.Close;
  if DataSet.IsEmpty then Exit;
  s := 'select data0006.work_order_number,cast((data0025.qty_bom+0.0)/data0025.QTY_PARENTBOM as decimal(18,4)) as qty_bom,data0025.manu_part_number,IsNULL(data0488.quan_issued,0) as quan_issued ,'+
       'data0025.rkey,data0025.bom_step,ceiling(Data0025.Qty_bom*Data0006.quan_sch/(QTY_PARENTBOM+0.0)) as Qty_Total_Req,data0006.rKey as WONO, ' +
       'ceiling(Data0025.Qty_bom*Data0006.quan_sch/(QTY_PARENTBOM+0.0))-IsNULL(data0488.quan_issued,0) as Qty_Needed ' +
       'from data0006 inner join data0025 on ' +
       'data0006.bom_ptr=data0025.parent_ptr ' +
       'LEFT JOIN Data0056 ON Data0056.WO_PTR = Data0006.RKey ' +
       'left outer join data0488 on data0488.WO_Ptr=data0006.rKey and data0488.bom_ptr=data0025.rkey ' +
       'where data0006.rkey=:F01 AND Data0025.BOM_STEP = data0056.STEP ' +
       'ORDER by data0025.bom_step,data0025.manu_part_number ';
  adsSubProds.CommandText := s;
  adsSubProds.Parameters[0].Value := DataSet.fieldByName('rKey').Value;
  adsSubProds.Open;
end;

function Tdmcon.UpdateWOStatus(WORkey:integer;iStatus:byte):boolean;
var
  sqlstr:string;
begin
  sqlstr:='update data0006 set wipmat_status='+IntToStr(iStatus)+' where rkey='+IntToStr(WorKey);
  result:= MyDataClass.ExecSql(sqlstr);
end;

function Tdmcon.CloseWO(WOrKey: integer): boolean;
begin
//1.判断所有内层产品的产量是否已经满足主产品的要求
//2.如果满足,主产品状态改变为”已分配”wipmat_status=1
//3.如果不满足,提示修改主产品的数量,如果更改数量,那么就更改主产品状态,
  result := true;
  if ChangeWOQty(WorKey) then
  begin
    if UpdateWOStatus(WorKey,1) then
      OpenWOList(WorKey)
    else
    begin
      ShowMsg('更新作业单状态失败!',1);
      result := false;
    end;
  end
  else
    result := false;
end;

function Tdmcon.ChangeWOQty(
  WoRkey: integer): boolean;
var
  i,PNL,Qty_Diff:integer;
  Sqlstr:string;
begin
 // 遍历内层,获取已发放数量为最小的内层,以此数量为准做为主产品的更新数量
 //注意数量的转换:已发放数量 div BOM用量, PNL数,需要用PCS数转换
  result := true;
  with dmcon do begin
    adsSubProds.First;
    i:= adsSubProds.FieldByName('quan_issued').Value div adsSubProds.FieldByName('qty_bom').Value;
    adsSubProds.next;
    while not adsSubProds.Eof do begin
      if i > (adsSubProds.FieldByName('quan_issued').Value div adsSubProds.FieldByName('qty_bom').Value) then
        i:=adsSubProds.FieldByName('quan_issued').Value div adsSubProds.FieldByName('qty_bom').Value;
      adsSubProds.next;
    end;
    PNL:= ceil(i/adsProdList.fieldbyName('PARTS_PER_PANEL').Asinteger);
    Sqlstr:='';
    try
      begin
        Qty_Diff:= adsProdList.fieldByName('QUAN_SCH').asInteger - i;
        Sqlstr:=' update data0006 set QUAN_SCH= '+IntToStr(i)+',PANELS='+IntToStr(PNL)+' where rKey='+adsProdList.FieldByName('rKey').AsString;
        if Qty_Diff >0 then
          sqlstr:=sqlstr+' Update data0492 set Issued_Qty=Issued_Qty-'+IntToStr(Qty_Diff)+',waitfor_release=waitfor_release-'+IntToStr(Qty_Diff)+' where CUT_NO='+QuotedStr(adsProdList.FieldByName('CUT_NO').AsString);


        sqlstr:=sqlstr+' insert into data0117(SOURCE_TYPE,SOURCE_PTR,EMPL_PTR,TDATE,ACTION,remark) '+
                'values(2,'+IntToStr(WorKey)+','+user_ptr+',getdate()'+',8,''从关闭作业单中创建:作业单数量修改原PNL:'+adsProdList.fieldbyname('panels').AsString+'新PNL:'+IntToStr(PNL)+''')';
      end;
    finally
      free;
    end;
    if sqlstr<>'' then
    begin
      if not MyDataclass.ExecSql(sqlstr) then
      begin
        result := false;
        ShowMsg('更新数量失败',1);
      end
      else
        OpenWOList(WorKey);
    end
    else
      result := false;
  end;
end;

procedure Tdmcon.OpenWOList(rKey: integer);
begin
  with dmcon do
  begin
    adsProdList.Close;
    try
      screen.Cursor:=crSQLWait;
      adsProdList.Open;
      if rKey > 0 then  adsProdList.Locate('rkey',rKey,[]);
    finally
      screen.Cursor:=crDefault;
    end;
  end;
end;

procedure Tdmcon.adsWorkOrderListAfterOpen(DataSet: TDataSet);
begin
  cdsWorkOrderList.Data := dspWorkOrder.Data;
end;

procedure Tdmcon.cdsWorkOrderListBeforeDelete(DataSet: TDataSet);
begin
abort;
end;

procedure Tdmcon.cdsWorkOrderListBeforeInsert(DataSet: TDataSet);
begin
abort;
end;

procedure Tdmcon.cdsWorkOrderListBeforeEdit(DataSet: TDataSet);
begin
  if not cdsWorkOrderList.IsEmpty then
  begin
    vIsSelected := cdsWorkOrderList.fieldByName('IsSelected').AsBoolean;
    vTransQtyfr := cdsWorkOrderList.fieldByName('TransQty').AsInteger ;
  end;
end;

function Tdmcon.Check_WO_Son(WoNo:string):Boolean;
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

