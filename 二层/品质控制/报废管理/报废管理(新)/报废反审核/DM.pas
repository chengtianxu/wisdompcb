unit DM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM1 = class(TDataModule)
    con1: TADOConnection;
    adsFrmMain: TADODataSet;
    strngfldFrmMainMANU_PART_NUMBER: TStringField;
    strngfldFrmMainMANU_PART_DESC: TStringField;
    strngfldFrmMainMRB_NO: TStringField;
    strngfldFrmMainWORK_ORDER_NUMBER: TStringField;
    intgrfldFrmMainQTY_REJECT: TIntegerField;
    intgrfldFrmMainRKey58: TIntegerField;
    atncfldFrmMainRKey549: TAutoIncField;
    strngfldFrmMainSQR: TStringField;
    dtmfldFrmMainSQTime: TDateTimeField;
    strngfldFrmMainSQNote: TStringField;
    strngfldFrmMainSHR: TStringField;
    dtmfldFrmMainSHTime: TDateTimeField;
    strngfldFrmMainSHNote: TStringField;
    strngfldFrmMainJSR: TStringField;
    dtmfldFrmMainJSTime: TDateTimeField;
    strngfldFrmMainJSNote: TStringField;
    strngfldFrmMainDEPT_CODE: TStringField;
    atncfldFrmMainRKey34: TAutoIncField;
    strngfldFrmMainStatus: TStringField;
    qrytmp: TADOQuery;
    intgrfldFrmMainRkey06: TIntegerField;
  private
    { Private declarations }

  public
    { Public declarations }
//    function InFSHLock: Boolean;
//    function InPD: Boolean;
//    function IsGuaYue: Boolean;
//    function IsWaiFa: Boolean;
//    function IsGuoShu: Boolean;
    //function FSH(A58RKey: string): Boolean;
    function SqlOpen(AStr: string): Boolean;
    function SqlExec(AStr: string): Boolean;    
  end;

var
  DM1: TDM1;

implementation

uses
  Dialogs, WZ_gUnit;

{$R *.dfm}

function SQL_GetWOStep(A06RKey: string; bGuoSHu: Boolean): string;
begin
  Result := 'SELECT  D38.STEP_NUMBER, D34.DEPT_CODE, D34.DEPT_NAME ,D34.BARCODE_ENTRY_FLAG' +
    ' FROM Data0038 D38 INNER JOIN Data0025 D25 ON D38.SOURCE_PTR = D25.RKey' +
    ' INNER JOIN Data0034 D34 ON D38.DEPT_PTR = D34.RKey' +
    ' INNER JOIN Data0006 D06 ON D25.RKey = D06.BOM_PTR' +
    ' WHERE D06.RKey = ' + A06RKey;
    if bGuoSHu then
      Result := Result + ' AND D34.BARCODE_ENTRY_FLAG =' + QuotedStr('Y');
    Result := Result + ' ORDER BY D38.STEP_NUMBER';
end;

{ TDM1 }
(*
function Tdm1.FSH(A58RKey: string): Boolean;
var
  LS: TStringList;
  bNeedCreatWO: Boolean;
  bAtLastStep: Boolean;
  bIsNeiCheng: Boolean;
  bIsFirstStep: Boolean;
  LNow56EmpRKey: string;
  I: Integer;

  n48GuoShuRKey: Integer;
  nReturnGX,nReturnDept: Integer;
  RKey48Arr: string;
  LQry58: TADOQuery;

  LOldStep: Integer;
  L48qry: TADOQuery;
  LneedFSHpcs: Integer;
begin
  n48GuoShuRKey := 0;
  
  Result := False;
  LS := TStringList.Create;
  LQry58 := TADOQuery.Create(Self);
  L48qry := TADOQuery.Create(Self);
  try
    LQry58.Connection := con1;
    LQry58.Prepared := True;
    //取得58记录
    LS.Clear;
    LS.Add(' SELECT D58.*,D06.EMPLOYEE_PTR AS D06EMPLOYEE_PTR, D56.Rkey AS RKey56 FROM Data0058 D58');
    LS.Add(' INNER JOIN Data0006 D06 ON D06.RKey = D58.WO_PTR');
    LS.Add(' LEFT JOIN Data0056 D56 ON D56.WO_PTR = D58.WO_PTR');
    LS.Add(' WHERE D58.RKey = ' + A58Rkey);
    LQry58.Close;
    LQry58.SQL.Clear;
    LQry58.SQL.Assign(LS);
    LQry58.Open;
    //是否有在线 
    bNeedCreatWO := LQry58.FieldByName('RKey56').IsNull;
    //反审核生成
    //是否最后工序报废的，关联06的状态，生产中，带入仓，待分配
    //{$REGION '取得报废记录和48产出中最大的工序'}
    //如果作业单已经关闭了。则反审核的返回接收工序为48和58中最大的工序
    LS.Clear;
    LS.Add(' SELECT top 1 a.STEP,a.DEPT FROM (');
    LS.Add(' SELECT  STEPNOW AS STEP, DEPT_PTR AS DEPT FROM Data0058 D58 WHERE WO_PTR ='+ LQry58.FieldByName('WO_PTR').AsString);
    LS.Add(' UNION ALL ');
    LS.Add(' SELECT STEP_NO+1 AS STEP, TO_DEPT_PTR AS DEPT FROM Data0048 D48 WHERE WO_PTR ='+ LQry58.FieldByName('WO_PTR').AsString);
    LS.Add(' AND NOT TO_DEPT_PTR IS NULL ');
    LS.Add(') AS a ORDER BY a.STEP DESC');
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Assign(LS);
    qrytmp.Open;
    nReturnGX := qrytmp.FieldByName('STEP').AsInteger;
    nReturnDept := qrytmp.FieldByName('DEPT').AsInteger;
    //

    LS.Clear;
    LS.Add(SQL_GetWOStep(LQry58.FieldByName('WO_PTR').AsString,True));
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Assign(LS);
    qrytmp.Open;
    qrytmp.Last;
    bAtLastStep := nReturnGX >= qrytmp.FieldByName('STEP_NUMBER').AsInteger;
    qrytmp.First;
    bIsFirstStep := nReturnGX = qrytmp.FieldByName('STEP_NUMBER').AsInteger;

    //是否为内层
    LS.Clear;
    LS.Add(' SELECT D25_2.RKey FROM Data0025 D25 ');
    LS.Add(' INNER JOIN Data0006 D06 ON D06.BOM_PTR = D25.RKey ');
    LS.Add(' INNER JOIN Data0025 D25_2 ON D25.PARENT_PTR = D25_2.RKey ');
    LS.Add(' WHERE D06.RKey = ' + LQry58.FieldByName('WO_PTR').AsString);
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Assign(LS);
    qrytmp.Open;
    bIsNeiCheng := not qrytmp.IsEmpty;

    //56的过数人员为反审核审批人员
    if bNeedCreatWO then
    begin
      if bIsFirstStep then
      begin
        LNow56EmpRKey := LQry58.FieldByName('D06EMPLOYEE_PTR').AsString;
        if LNow56EmpRKey = '' then LNow56EmpRKey := '0';
      end else
      begin
        LS.Clear;
        LS.Add(' SELECT EMPL_PTR FROM Data0048 WHERE WO_PTR='+ LQry58.FieldByName('WO_PTR').AsString);
        LS.Add(' AND STEP_NO = ' + LQry58.FieldByName('STEPNOW').AsString);
        qrytmp.Close;
        qrytmp.SQL.Clear;
        qrytmp.SQL.Assign(LS);
        qrytmp.Open;
        if qrytmp.IsEmpty then
          LNow56EmpRKey := LQry58.FieldByName('D06EMPLOYEE_PTR').AsString
        else
          LNow56EmpRKey := qrytmp.FieldByName('EMPL_PTR').AsString;

        if LNow56EmpRKey = '' then LNow56EmpRKey := '0';
      end;
    end;

    if not con1.InTransaction then con1.BeginTrans;
    try
      //{$REGION '1-删除58记录'}
      qrytmp.Close;
      qrytmp.SQL.Clear;
      qrytmp.SQL.Add(' DELETE FROM Data0058 WHERE RKey = ' + A58Rkey);
      qrytmp.ExecSQL;
        
      //{$REGION '2-更新06的数量和状态'}
      LS.Clear;
      LS.Add(' UPDATE Data0006 SET ');
      if bNeedCreatWO then
      begin
        LS.Add(' PROD_STATUS = ');
        if bAtLastStep then
        begin
          if bIsNeiCheng then
            LS.Add('6')
          else
            LS.Add('5');
        end else
          LS.Add('3');
        LS.Add(',');
      end;
      LS.Add('QUAN_REJ=QUAN_REJ-' + LQry58.FieldByName('QTY_REJECT').AsString);
      LS.Add(',wtype = put_type ');
      LS.Add(' WHERE RKey=' + LQry58.FieldByName('WO_PTR').AsString);
      qrytmp.Close;
      qrytmp.SQL.Clear;
      qrytmp.SQL.Assign(LS);
      qrytmp.ExecSQL;

      //{$REGION '3-如果56生成在线'}
      if bNeedCreatWO then
      begin
        //{$REGION '1-新增56'}
        LS.Clear;
        LS.Add(' INSERT INTO Data0056(WO_PTR,DEPT_PTR,UNIT_PTR,EMPLOYEE_PTR,FLOW_NO,STEP,QTY_BACKLOG,PANELS,INTIME,TO_BE_STOCKED,TDATE,LOC_PTR,WTYPE,REFERENCE,TO_BE_CANCD,PUT_TYPE,OUTSOURCE,tobestock_date,PO_NUMBER) ');
        LS.Add(' VALUES(');
        LS.Add(LQry58.FieldByName('WO_PTR').AsString + ',');
        LS.Add(LQry58.FieldByName('DEPT_PTR').AsString + ',');
        LS.Add('0,' + LNow56EmpRKey + ',0,');
        LS.Add(LQry58.FieldByName('STEPNOW').AsString + ',0,0,getdate(),0,getdate(),');
        LS.Add(LQry58.FieldByName('warehouse_ptr').AsString + ',0,');
        LS.Add(QuotedStr('报废反审核') + ',0,0,0,NULL,NULL)' );
        qrytmp.Close;
        qrytmp.SQL.Clear;
        qrytmp.SQL.Assign(LS);
        qrytmp.ExecSQL;

      end;        
        
      //{$REGION '4-更新56在线'}
      LS.Clear;
      LS.Add(' UPDATE Data0056 SET ');
      LS.Add(' QTY_BACKLOG = QTY_BACKLOG + ' + LQry58.FieldByName('QTY_REJECT').AsString);
      LS.Add(' , PANELS=PANELS + ' + LQry58.FieldByName('PANELS').AsString);
      if bNeedCreatWO then
      begin
        LS.Add(' ,STEP=' + IntToStr(nReturnGX));
        ls.Add(' ,DEPT_PTR =' + IntToStr(nReturnDept));
        LS.Add(' ,EMPLOYEE_PTR = ' + IntToStr(n48GuoShuRKey));
      end;
      LS.Add(' WHERE WO_PTR=' + LQry58.FieldByName('WO_PTR').AsString);
      qrytmp.Close;
      qrytmp.SQL.Clear;
      qrytmp.SQL.Assign(LS);
      qrytmp.ExecSQL;


      //{$REGION '5-更新48'}



      //{$REGION '这个是为了去重复'}
      LS.Clear;
      LS.Add(' SELECT RKey, STEP_NO, QTY_REJECT FROM Data0048 ');
      LS.Add(' WHERE WO_PTR=' + LQry58.FieldByName('WO_PTR').AsString);
      LS.Add(' AND STEP_NO>=' + LQry58.FieldByName('STEP').AsString);
      LS.Add(' AND NOT TO_DEPT_PTR IS NULL order by STEP_NO');
      L48qry.Connection := dm1.con1;
      L48qry.Close;
      L48qry.SQL.Clear;
      L48qry.SQL.Assign(LS);
      L48qry.Open;
      L48qry.First;
      LOldStep := -1;
      LneedFSHpcs := LQry58.FieldByName('QTY_REJECT').AsInteger;
      while not L48qry.Eof do
      begin
        if LOldStep <> L48qry.FieldByName('STEP_NO').AsInteger then
        begin
          LOldStep := L48qry.FieldByName('STEP_NO').AsInteger;
          LneedFSHpcs := LQry58.FieldByName('QTY_REJECT').AsInteger;
        end;
        if LneedFSHpcs > 0 then
        begin
          if L48qry.FieldByName('QTY_REJECT').AsInteger >= LneedFSHpcs then
          begin
            L48qry.Edit;
            L48qry.FieldByName('qty_reject').AsInteger := L48qry.FieldByName('qty_reject').AsInteger - LneedFSHpcs;
            L48qry.Post;
            LneedFSHpcs := 0;
          end else
          begin
            LneedFSHpcs := LneedFSHpcs - L48qry.FieldByName('qty_reject').AsInteger;
            L48qry.Edit;
            L48qry.FieldByName('qty_reject').AsInteger := 0;
            L48qry.Post;
          end;
        end;
        L48qry.Next;
      end;

      //{$REGION '7-更新492的数量'}
      LS.Clear;
      LS.Add('UPDATE Data0492 SET ');
      LS.Add(' QTY_REJECT=QTY_REJECT-' + LQry58.FieldByName('QTY_REJECT').AsString);
      LS.Add(' ,WIP_QTY=WIP_QTY+' + LQry58.FieldByName('QTY_REJECT').AsString);
      LS.Add(' WHERE CUT_NO IN (SELECT CUT_NO FROM Data0006 where RKey=' + LQry58.FieldByName('WO_PTR').AsString + ')');
      qrytmp.Close;
      qrytmp.SQL.Clear;
      qrytmp.SQL.Assign(LS);
      qrytmp.ExecSQL;

      con1.CommitTrans;
      Result := True;
    except
      con1.RollbackTrans;
    end;
  finally
    if con1.InTransaction then con1.RollbackTrans;
    LS.Free;
    LQry58.Close;
    LQry58.Free;
    L48qry.Free;
  end;
end;
 *)

//function TDM1.InFSHLock: Boolean;
//begin
//  qrytmp.Close;
//  qrytmp.SQL.Clear;
//  qrytmp.SQL.Add('SELECT RKey FROM Data0549 WHERE D58_PTR= ' + adsFrmMain.fieldbyname('RKey58').AsString + ' AND STATUS = 0');
//  qrytmp.Open;
//  Result := not qrytmp.IsEmpty;
//end;
//
//function TDM1.InPD: Boolean;
//begin
//  Result := True;
//  dm1.qrytmp.Close;
//  dm1.qrytmp.SQL.Clear;
//  dm1.qrytmp.SQL.Add('SELECT RKEY FROM DATA0400 WHERE STATUS = 0');
//  dm1.qrytmp.Open;
//  if dm1.qrytmp.IsEmpty then
//    Result := False;
//end;
//
//function TDM1.IsGuaYue: Boolean;
//begin
//  qrytmp.Close;
//  qrytmp.SQL.Clear;
//  qrytmp.SQL.Add(' SELECT max(D444.tdate) AS PDDate , ');
//  qrytmp.SQL.Add(' (SELECT AUDIT_DATETIME FROM Data0058 WHERE RKey = ' + adsFrmMain.FieldByName('RKey58').AsString + ') AS BFTime ');
//  qrytmp.SQL.Add(' FROM Data0444 D444 ');
//  qrytmp.Open;
//  if qrytmp.FieldByName('BFTime').AsDateTime <= qrytmp.FieldByName('PDDate').AsDateTime then
//  begin
//    Result := True;
//  end else
//    Result := False;
//end;
//
//function TDM1.IsGuoShu: Boolean;
//begin
//  Result := True;
//  qrytmp.Close;
//  qrytmp.SQL.Clear;
//  qrytmp.SQL.Add('SELECT STEP FROM Data0056 WHERE WO_PTR =  ' + adsFrmMain.fieldbyname('RKey06').AsString);
//  qrytmp.Open;
//  if adsFrmMain.FieldByName('STEPNOW').AsInteger = qrytmp.FieldByName('STEP').AsInteger then
//    Result := False;
//end;
//
//function TDM1.IsWaiFa: Boolean;
//begin
//  qrytmp.Close;
//  qrytmp.SQL.Clear;
//  qrytmp.SQL.Add(' SELECT D06.PROD_STATUS FROM Data0549 D549 ');
//  qrytmp.SQL.Add(' INNER JOIN Data0058 D58 ON D58.RKey = D549.D58_PTR ');
//  qrytmp.SQL.Add(' INNER JOIN Data0006 D06 ON D58.WO_PTR = D06.RKey ');
//  qrytmp.SQL.Add(' WHERE D549.RKey = ' + adsFrmMain.FIeldByName('RKey549').AsString);
//  //qrytmp.SQL.Add('SELECT PROD_STATUS FROM Data0006 WHERE RKey =  ' + adsFrmMain.fieldbyname('RKey06').AsString);
//  qrytmp.Open;
//  if qrytmp.FieldByName('PROD_STATUS').AsInteger = 4 then
//    Result := True
//  else
//    Result := False;
//end;

function TDM1.SqlExec(AStr: string): Boolean;
begin
  //Result := False;
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Add(AStr);
    qrytmp.ExecSQL;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := False;
    end;
  end;
end;

function TDM1.SqlOpen(AStr: string): Boolean;
begin
  //Result := False;
  try
    qrytmp.Close;
    qrytmp.SQL.Clear;
    qrytmp.SQL.Add(AStr);
    qrytmp.Open;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := False;
    end;
  end;
end;

end.


