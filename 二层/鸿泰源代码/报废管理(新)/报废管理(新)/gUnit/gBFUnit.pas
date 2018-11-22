unit gBFUnit;

interface
uses
  Windows, ADODB, SysUtils, Classes;

var
  gCon: TADOConnection;

//增加新的报废
function NewBF(A06RKey, AZR_34RKey,AZR_Step, ABFPCSNum, ABFPnlNum, AQXDMRKey, ABF15RKey, ABakNote: string;AType:Integer;PANEL_ID: Integer = 0 ;GlobalId: string = '';coordinate: string = ''): Boolean;
//MRB_鉴定报废
function NewMRBCheckBF(A06RKey, AZR_34RKey,AZR_Step, ABFPCSNum, ABFPnlNum, AQXDMRKey, ABF15RKey, ABakNote: string): Boolean;
//反审核报废
function UnDoBF(A58Rkey: string; A549Rkey: string = ''): Boolean;
//取得用户的工厂指针
function GetUser15Ptr(ARkey73: string): string;

function ExtractBurnNO(AWONumber: string; AWtype: Integer): string;

function InFSHLock(Rkey58: string): Boolean;
function InPD: Boolean;
function IsKuaYue(ARkey58: string): Boolean;
function IsWaiFa(ARkey06: string): Boolean;
function IsGuoShu(ARkey06: string; A58StepNow: Integer): Boolean;


function SqlOpen(AQry: TADOQuery; ASql: string): Boolean;



implementation

uses
  Dialogs, WZ_gUnit, Math, StrUtils;

function SqlOpen(AQry: TADOQuery; ASql: string): Boolean;
begin
  AQry.Close;
  AQry.Connection := gCon;
  AQry.SQL.Clear;
  AQry.SQL.Add(ASql);
  try
    AQry.Open;
    Result := True;
  except
    Result := False;
    ShowMessage(ASql);
  end
end;

function SqlExec(ASql: string): Boolean;
var
  LCMD: TADOCommand;
begin
  LCMD := TADOCommand.Create(nil);
  try
    LCMD.Connection := gCon;
    LCMD.CommandText := ASql;
    try
      LCMD.Execute;
      Result := True;
    except
      ShowMessage(ASql);
      Result := False;
    end;
  finally
    LCMD.Free;
  end;
end;

function IncMRB_NO(AOldMRB_NO: string): string;
var
  I: Integer;
  nIndex: Integer;
  tmps: string;
begin
  nIndex := -1;
  for I := 1 to Length(AOldMRB_NO) do
  begin
    if AOldMRB_NO[I] in ['0'..'9'] then
    begin
      if nIndex = -1 then nIndex := I-1;
      tmps := tmps + AOldMRB_NO[I];
    end else
    begin
      nIndex := -1;
      tmps := '';
    end;
  end;
  if nIndex = -1 then
    Result := AOldMRB_NO + Format('%.1d',[StrToIntDef(tmps,1)+1])
  else
    Result := Copy(AOldMRB_NO,1,nIndex) + Format('%.1d',[StrToIntDef(tmps,1)+1]);
end;

function SQL_GetWOStep(A06RKey: string; bGuoSHu: Boolean): string;
begin
  Result := 'SELECT  D38.STEP_NUMBER, D34.DEPT_CODE, D34.DEPT_NAME ,D34.BARCODE_ENTRY_FLAG' +
    ' FROM Data0038 D38 INNER JOIN Data0025 D25 ON D38.SOURCE_PTR = D25.RKey' +
    ' INNER JOIN Data0034 D34 ON D38.DEPT_PTR = D34.RKey' +
    ' INNER JOIN Data0006 D06 ON D25.RKey = D06.BOM_PTR' +
    ' WHERE D06.RKey = ' + A06RKey;
    if bGuoSHu then
      Result := Result + ' AND D34.BARCODE_ENTRY_FLAG =' + QuotedStr('Y');
    Result := Result + ' ORDER BY D38.STEP_NUMBER ASC';
end;

function NewBF(A06RKey, AZR_34RKey,AZR_Step, ABFPCSNum, ABFPnlNum, AQXDMRKey, ABF15RKey, ABakNote: string;AType:Integer;PANEL_ID: Integer = 0 ;GlobalId: string = '';coordinate: string = ''): Boolean;
type
  TDept = record
    D34Rkey: Integer;
    MIStep: Integer;
    Now56PCS: Integer;
    Now56Pnl: Integer;
  end;
var
  LQry: TADOQuery;
  LSQ,LZR: TDept;
  LSql: string;
  LMRB_NO: string;
  LErrMsg: Integer;
  LTmpBFNum: Integer;
begin
  Result := False;
  LQry := TADOQuery.Create(nil);
  LErrMsg := 0;
  try
    //取得MRB_NO
    if SqlOpen(LQry,'SELECT seed_value from data0004 WHERE rkey=18') then
      LMRB_NO := LQry.FieldValues['seed_value']
    else Exit;

    //责任工序
    LZR.D34Rkey := StrToInt(AZR_34RKey);
    LZR.MIStep := StrToInt(AZR_Step);
    LZR.Now56PCS := 0;
    LZR.Now56Pnl := 0;
    //取得申请工序
    //如果返工中则取返工前的工序
    LSql := ' select D56.DEPT_PTR,D56.WTYPE as wtype56,D56.STEP,D56.QTY_BACKLOG,D56.PANELS,D06.PROD_STATUS from data0056 d56 ' +
            ' inner join data0006 d06 on d56.wo_ptr = d06.rkey ' +
            ' where wo_ptr = ' + A06RKey;
    if SqlOpen(LQry,LSql) then
    begin
      LSQ.D34Rkey := LQry.FieldValues['DEPT_PTR'];
      if LQry.FieldByName('WTYPE56').AsInteger > 0 then
        LSQ.MIStep := LQry.FieldValues['WTYPE56']
      else
        LSQ.MIStep := LQry.FieldValues['STEP'];
      LSQ.Now56PCS := LQry.FieldValues['QTY_BACKLOG'];
      lsq.Now56Pnl := LQry.FieldValues['PANELS'];

      ABFPCSNum := IntToStr(MinIntValue([StrToInt(ABFPCSNum),LSQ.Now56PCS]));
      ABFPnlNum := IntToStr(MinIntValue([StrToInt(ABFPnlNum),LSQ.Now56Pnl]));
    end else Exit;

    if StrToInt(ABFPCSNum) <= 0 then
    begin
      ShowMessage('作业单在线数量不正确');
      Exit;
    end;

    gCon.BeginTrans;
    if AType = 1 then
    begin
      lsql := 'insert into data0058IN(MRB_NO,WO_PTR,DEPT_PTR,REJECT_PTR,QTY_ORG_REJ,QTY_REJECT,PANELS,STEP,EMPL_PTR,TDATETIME,AUDIT_EMPL_PTR,AUDIT_DATETIME,RESP_DEPT_PTR,REFERENCE,StepNow,warehouse_ptr,FLOW_NO,BOM_PTR,GlobalId,PANEL_ID,coordinate)' +
              ' values(' + QuotedStr(LMRB_NO) + ',' + A06RKey + ',' + IntToStr(LSQ.D34Rkey) + ',' +
              AQXDMRKey + ',' + ABFPCSNum + ',' + ABFPCSNum + ',' + ABFPnlNum + ',' + IntToStr(LZR.MIStep) + ',' +
              gUser.User_Ptr + ',getdate(),' + gUser.User_Ptr + ',getdate(),' + IntToStr(LZR.D34Rkey) + ',' +
              QuotedStr(ABakNote) + ',' + IntToStr(LSQ.MIStep) + ',' + ABF15RKey + ',' +
              LQry.FieldByName('WTYPE56').AsString + ',' +
              LQry.FieldByName('PROD_STATUS').AsString + ',' +
              QuotedStr(GlobalId) + ',' +
              IntToStr(PANEL_ID) + ',' +
              QuotedStr(coordinate) +
              ')';
      if not SqlExec(LSql) then Exit;
      //报废单号加1
      LErrMsg := 8;
      LSql := ' UPDATE Data0004 SET SEED_VALUE = ' + QuotedStr(IncMRB_NO(LMRB_NO)) +
              ' where rkey = 18';
      if not SqlExec(LSql) then Exit;

      gCon.CommitTrans;
    end
    else
    begin

      //新增58记录
      LErrMsg := 1;
      lsql := 'insert into data0058(MRB_NO,WO_PTR,DEPT_PTR,REJECT_PTR,QTY_ORG_REJ,QTY_REJECT,PANELS,STEP,EMPL_PTR,TDATETIME,AUDIT_EMPL_PTR,AUDIT_DATETIME,RESP_DEPT_PTR,REFERENCE,StepNow,warehouse_ptr,FLOW_NO,BOM_PTR,GlobalId,PANEL_ID,coordinate)' +
              ' values(' + QuotedStr(LMRB_NO) + ',' + A06RKey + ',' + IntToStr(LSQ.D34Rkey) + ',' +
              AQXDMRKey + ',' + ABFPCSNum + ',' + ABFPCSNum + ',' + ABFPnlNum + ',' + IntToStr(LZR.MIStep) + ',' +
              gUser.User_Ptr + ',getdate(),' + gUser.User_Ptr + ',getdate(),' + IntToStr(LZR.D34Rkey) + ',' +
              QuotedStr(ABakNote) + ',' + IntToStr(LSQ.MIStep) + ',' + ABF15RKey + ',' +
              LQry.FieldByName('WTYPE56').AsString + ',' +
              LQry.FieldByName('PROD_STATUS').AsString + ',' +
              QuotedStr(GlobalId) + ',' +
              IntToStr(PANEL_ID) + ',' +
              QuotedStr(coordinate) +
              ')';
      if not SqlExec(LSql) then Exit;

      //更新492
      LErrMsg := 2;
      LSql := 'update data0492 set QTY_REJECT=QTY_REJECT+' + ABFPCSNum + ',WIP_QTY=WIP_QTY-' + ABFPCSNum + 
              ' where cut_no = (SELECT CUT_NO FROM Data0006 where RKey=' + A06RKey + ')';
      if not SqlExec(LSql) then Exit;
    
      //更新56
      LErrMsg := 3;
      LSql := 'UPDATE Data0056 SET QTY_BACKLOG=';
      if LSQ.Now56PCS >= StrToInt(ABFPCSNum) then
        LSql := LSql + 'QTY_BACKLOG-' + ABFPCSNum
      else
        LSql := LSql + '0';
      if LSQ.Now56Pnl >= StrToInt(ABFPnlNum) then
        LSql := LSql + ',PANELS=PANELS-' + ABFPnlNum
      else
        LSql := LSql + ',PANELS=0';
      LSql := LSql + ' where wo_ptr = ' + A06RKey;
      if not SqlExec(LSql) then Exit;

      //更新06
      LErrMsg := 4;
      LSql := 'UPDATE Data0006 SET QUAN_REJ=QUAN_REJ+';
      if LSQ.Now56PCS >= StrToInt(ABFPCSNum) then
        LSql := LSql + ABFPCSNum
      else
        LSql := LSql + IntToStr(LSQ.Now56PCS);
      LSql := LSql + ' where rkey = ' + A06RKey;
      if not SqlExec(LSql) then Exit;

      //如果删除56则更新06的状态
      LErrMsg := 5;
      LSql := ' UPDATE Data0006 SET PROD_STATUS = 9, wtype = 5' +
              ' FROM Data0006 INNER JOIN Data0056 D56 ON Data0006.RKey=D56.WO_PTR' +
              ' WHERE Data0006.RKey = ' + A06RKey +
              ' AND D56.TO_BE_STOCKED=0 AND D56.QTY_BACKLOG=0';
      if not SqlExec(LSql) then Exit;

      //如果56为0则删除在线
      LErrMsg := 6;
      LSql := ' DELETE FROM Data0056 WHERE TO_BE_STOCKED = 0 AND QTY_BACKLOG =0 AND' +
              ' WO_PTR=' + A06RKey;
      if not SqlExec(LSql) then Exit;

      //处理48表中的记录,只更新申请工序的记录
      LErrMsg := 7;
      LTmpBFNum := MinIntValue([LSQ.Now56PCS,StrToInt(ABFPCSNum)]);
      LSql := 'SELECT STEP_NO,QTY_PROD,QTY_REJECT from data0048' +
              ' WHERE WO_PTR=' + A06RKey + ' AND STEP_NO = ' + IntToStr(LZR.MIStep);
      if SqlOpen(LQry,LSql) then
      begin
        while not LQry.Eof do
        begin
          if LTmpBFNum <= 0 then Break;

          if LQry.FieldByName('qty_prod').AsInteger >= (LQry.FieldByName('qty_reject').AsInteger + LTmpBFNum) then
          begin
            LQry.Edit;
            LQry.FieldByName('qty_reject').AsInteger := LQry.FieldByName('qty_reject').AsInteger + LTmpBFNum;
            LQry.Post;
            LTmpBFNum := 0;
          end else
          begin
            LTmpBFNum := LTmpBFNum - (LQry.fieldbyname('qty_prod').AsInteger - LQry.FieldByName('qty_reject').AsInteger);
            LQry.Edit;
            LQry.FieldByName('qty_reject').AsInteger := LQry.fieldbyname('qty_prod').AsInteger;
            LQry.Post;
          end;

          LQry.Next;
        end;
      end else Exit;

      //报废单号加1
      LErrMsg := 8;
      LSql := ' UPDATE Data0004 SET SEED_VALUE = ' + QuotedStr(IncMRB_NO(LMRB_NO)) +
              ' where rkey = 18';
      if not SqlExec(LSql) then Exit;

      gCon.CommitTrans;
    end;
    Result := True;
  finally
    LQry.Free;
    if gCon.InTransaction then gCon.RollbackTrans;
    if not Result then
      ShowMessage('错误代码 ' + IntToStr(LErrMsg));
  end;
end;


function UnDoBF(A58Rkey: string; A549Rkey: string = ''): Boolean;
var
  LQry58,LQry: TADOQuery;
  LErrMsg: Integer;
  LCreat56: Boolean;
  LSql: string;
  LReCreate56StepNumber: Integer;
  LTmpPcs: Integer;
  LtmpDept: Integer;
begin
  Result := False;
  LQry58 := TADOQuery.Create(nil);
  LQry := TADOQuery.Create(nil);
  LErrMsg := 0;
  try
    //取得58记录
    if not SqlOpen(LQry58,'select data0058.*,getdate() as nowtime from data0058 where rkey = ' + A58Rkey) then Exit;
    //是否有在线
    if not SqlOpen(LQry,'select * from data0056 where wo_ptr = ' + LQry58.fieldbyname('WO_PTR').AsString) then Exit
    else LCreat56 := LQry.IsEmpty;

    if LCreat56 then
    begin
      //必须是最后报废记录的才可以
      LSql := ' select MRB_NO from data0058 where AUDIT_DATETIME > ' +
              QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss',LQry58.fieldbyname('AUDIT_DATETIME').AsDateTime)) +
              ' and wo_ptr = ' + LQry58.fieldbyname('WO_PTR').AsString +
              ' and rkey <> ' + LQry58.fieldbyname('rkey').AsString +
              ' order by AUDIT_DATETIME Desc';
      if not SqlOpen(LQry,LSql) then Exit
      else
      begin
        if not LQry.IsEmpty then
        begin
          ShowMessage('由于当前工单已关闭，请先反审核最后一次的报废记录！ 报废单号：' + LQry.fieldbyname('MRB_NO').AsString);
          exit;
        end;
      end;
      //判断是否为内层
//      LSql := ' SELECT D25_2.RKey FROM Data0025 D25 ' +
//              ' INNER JOIN Data0006 D06 ON D06.BOM_PTR = D25.RKey ' +
//              ' INNER JOIN Data0025 D25_2 ON D25.PARENT_PTR = D25_2.RKey ' +
//              ' WHERE D06.RKey = ' + LQry58.FieldByName('WO_PTR').AsString;
//      if not SqlOpen(LQry,LSql) then Exit
//      else LIsNeiCeng := not LQry.IsEmpty;
//      //判断是否为最后工序
//      if not SqlOpen(LQry,SQL_GetWOStep(LQry58.FieldByName('WO_PTR').AsString,True)) then Exit
//      else LIsLastStep := LQry58.FieldByName('StepNow').AsInteger >= LQry.FieldByName('STEP_NUMBER').AsInteger;

      gCon.BeginTrans;
      //更新06表的状态,数量
      LErrMsg := 1;
      if not SqlOpen(LQry,'select * from data0006 where rkey =' + LQry58.FieldByName('WO_PTR').AsString) then exit
      else
      begin
        LQry.Edit;
        LQry.FieldValues['PROD_STATUS'] := lqry58.FieldValues['bom_ptr'];
//        if LIsLastStep then
//        begin
//          if LIsNeiCeng then
//            LQry.FieldValues['PROD_STATUS'] := 6
//          else
//            LQry.FieldValues['PROD_STATUS'] := 5;
//        end else
//          LQry.FieldValues['PROD_STATUS'] := 3;
        LQry.FieldValues['QUAN_REJ'] := LQry.fieldbyname('QUAN_REJ').AsInteger - LQry58.fieldbyname('QTY_REJECT').AsInteger;
        LQry.FieldValues['wtype'] := LQry.fieldbyname('put_type').AsInteger;
        LQry.Post;
      end;
      // 新增56
      LErrMsg := 2;
      //如果在返工中报废完了，则查238中的返工工序对应的步骤
      if LQry58.FieldByName('FLOW_NO').AsInteger > 0 then
      begin
        if SqlOpen(LQry,'select STEP_NUMBER from data0238 where wo_ptr = ' + LQry58.fieldbyname('wo_ptr').AsString + ' and DEPT_PTR = ' + LQry58.fieldbyname('DEPT_PTR').AsString)
        then
        begin
          LReCreate56StepNumber := LQry.FieldByName('STEP_NUMBER').AsInteger
        end else
          LReCreate56StepNumber := LQry58.FieldByName('STEPNOW').AsInteger;
      end else
        LReCreate56StepNumber := LQry58.FieldByName('STEPNOW').AsInteger;
      if not SqlOpen(LQry,'select * from data0056 where wo_ptr = -1') then Exit
      else
      begin
        LQry.Append;
        LQry.FieldValues['WO_PTR'] := LQry58.FieldByName('WO_PTR').Value;
        LQry.FieldValues['DEPT_PTR'] := LQry58.FieldByName('DEPT_PTR').Value;
        LQry.FieldValues['EMPLOYEE_PTR'] := gUser.User_Ptr;
        LQry.FieldValues['STEP'] := LReCreate56StepNumber;
        LQry.FieldValues['QTY_BACKLOG'] := LQry58.FieldByName('QTY_REJECT').Value;
        LQry.FieldValues['PANELS'] := LQry58.FieldByName('PANELS').Value;
        LQry.FieldValues['INTIME'] := LQry58.FieldByName('nowtime').Value;
        LQry.FieldValues['TDATE'] := LQry58.FieldByName('nowtime').Value;
        LQry.FieldValues['LOC_PTR'] := LQry58.FieldValues['warehouse_ptr'];
        LQry.FieldValues['REFERENCE'] := '报废反审核创建';
        LQry.FieldValues['WTYPE'] := LQry58.FieldValues['FLOW_NO'];
        LQry.Post;
      end;

      //更新492的数量
      LErrMsg := 3;
      LSql := 'UPDATE Data0492 SET QTY_REJECT=QTY_REJECT-' + LQry58.FieldByName('QTY_REJECT').AsString +
              ' ,WIP_QTY=WIP_QTY+' + LQry58.FieldByName('QTY_REJECT').AsString +
              ' WHERE CUT_NO IN (SELECT CUT_NO FROM Data0006 where RKey=' + LQry58.FieldByName('WO_PTR').AsString + ')';
      if not SqlExec(LSql) then Exit;

      //更新48记录
      LErrMsg := 4;
      if LQry58.FieldByName('STEP').AsInteger <> LQry58.FieldByName('StepNow').AsInteger then
      begin
        LSql := 'SELECT STEP_NO,QTY_PROD,QTY_REJECT from data0048' +
                ' WHERE WO_PTR=' + LQry58.fieldbyname('WO_PTR').AsString + ' AND STEP_NO = ' + LQry58.fieldbyname('step').AsString;
        if not SqlOpen(LQry,LSql) then Exit
        else
        begin
          LTmpPcs := LQry58.fieldbyname('QTY_REJECT').AsInteger;
          while not LQry.Eof do
          begin
            if LTmpPcs = 0 then Break;
            if LQry.FieldByName('QTY_REJECT').AsInteger >= LTmpPcs then
            begin
              LQry.Edit;
              LQry.FieldByName('QTY_REJECT').AsInteger := LQry.fieldbyname('QTY_REJECT').AsInteger - LTmpPcs;
              LQry.Post;
              LTmpPcs := 0;
            end else
            begin
              LTmpPcs := LTmpPcs - LQry.FieldByName('QTY_REJECT').AsInteger;
              LQry.Edit;
              LQry.FieldByName('QTY_REJECT').AsInteger := 0;
              LQry.Post;
            end;
            LQry.Next;
          end;
        end;
      end;

      //更新549反审核申请表
      LErrMsg := 5;
      if A549Rkey <> '' then
      begin
        LSql := 'UPDATE Data0549 SET Status = 1, SH_D05_PTR =' + gUser.User_Ptr +
              ',SHTime=getdate(), SHNote=NULL, JS_D34_PTR= ' + LQry58.fieldbyname('DEPT_PTR').asstring +
              ' WHERE RKey= ' + A549Rkey +
              ' AND (Status = 0 OR Status = -1)';
        if not SqlExec(LSql) then Exit;
      end;
            
      //删除58记录
      LQry58.Delete;

      gCon.CommitTrans;
      Result := True;
    end else
    begin
      gCon.BeginTrans;
      //恢复56的数量
      LErrMsg := 6;
      LQry.Edit;
      LQry.FieldValues['QTY_BACKLOG'] := LQry.fieldbyname('QTY_BACKLOG').AsInteger + LQry58.fieldbyname('QTY_REJECT').AsInteger;
      LQry.FieldValues['PANELS'] := LQry.fieldbyname('PANELS').AsInteger + LQry58.fieldbyname('PANELS').AsInteger;
      LQry.Post;

      //回复06的数量
      LErrMsg := 7;
      if not SqlOpen(LQry,'select * from data0006 where rkey = ' + LQry58.fieldbyname('WO_PTR').AsString) then Exit
      else
      begin
        LQry.Edit;
        LQry.FieldValues['QUAN_REJ'] := LQry.fieldbyname('QUAN_REJ').AsInteger - LQry58.fieldbyname('QTY_REJECT').AsInteger;
        LQry.Post;
      end;

      //恢复492的数量
      LErrMsg := 8;
      LSql := 'select * from data0492 where cut_no = (select cut_no from data0006 where rkey = ' + LQry58.fieldbyname('WO_PTR').AsString + ')';
      if not SqlOpen(LQry,LSql) then Exit
      else
      begin
        LQry.Edit;
        LQry.FieldValues['QTY_REJECT'] := LQry.fieldbyname('QTY_REJECT').AsInteger - LQry58.fieldbyname('QTY_REJECT').AsInteger;
        LQry.FieldValues['WIP_QTY'] := LQry.fieldbyname('WIP_QTY').AsInteger + LQry58.fieldbyname('QTY_REJECT').AsInteger;
        LQry.Post;
      end;

      //更新48的记录
      LErrMsg := 9;
      if LQry58.FieldByName('STEP').AsInteger <> LQry58.FieldByName('StepNow').AsInteger then
      begin
        //恢复48的QTY_REJECT字段
        LSql := 'SELECT STEP_NO,QTY_PROD,QTY_REJECT from data0048' +
                ' WHERE WO_PTR=' + LQry58.fieldbyname('WO_PTR').AsString + ' AND STEP_NO = ' + LQry58.fieldbyname('step').AsString;
        if not SqlOpen(LQry,LSql) then Exit
        else
        begin
          LTmpPcs := LQry58.fieldbyname('QTY_REJECT').AsInteger;
          while not LQry.Eof do
          begin
            if LTmpPcs = 0 then Break;
            if LQry.FieldByName('QTY_REJECT').AsInteger >= LTmpPcs then
            begin
              LQry.Edit;
              LQry.FieldByName('QTY_REJECT').AsInteger := LQry.fieldbyname('QTY_REJECT').AsInteger - LTmpPcs;
              LQry.Post;
              LTmpPcs := 0;
            end else
            begin
              LTmpPcs := LTmpPcs - LQry.FieldByName('QTY_REJECT').AsInteger;
              LQry.Edit;
              LQry.FieldByName('QTY_REJECT').AsInteger := 0;
              LQry.Post;
            end;
            LQry.Next;
          end;
        end;
      end;

      //恢复48中的产出记录
      LErrMsg := 10;
      LSql := 'select * from data0048 where wo_ptr = ' + LQry58.fieldbyname('WO_PTR').AsString +
              ' and outtime > ' + QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss' ,LQry58.fieldbyname('AUDIT_DATETIME').AsDateTime)) +
              ' order by FM_DEPT_PTR asc ';
      if not SqlOpen(LQry,LSql) then Exit
      else
      begin
        LtmpDept := -1;
        while not LQry.Eof do
        begin
          if LtmpDept <> LQry.fieldbyname('FM_DEPT_PTR').AsInteger then
          begin
            LtmpDept := LQry.fieldbyname('FM_DEPT_PTR').AsInteger;
            LQry.Edit;
            LQry.FieldValues['QTY_PROD'] := LQry.fieldbyname('QTY_PROD').AsInteger + LQry58.fieldbyname('QTY_REJECT').AsInteger;
            LQry.post;
          end;
          LQry.Next;
        end;
      end;      

      //更新549反审核申请表
      LErrMsg := 11;
      if A549Rkey <> '' then
      begin
        LSql := 'UPDATE Data0549 SET Status = 1, SH_D05_PTR =' + gUser.User_Ptr +
              ',SHTime=getdate(), SHNote=NULL, JS_D34_PTR= ' + LQry58.fieldbyname('DEPT_PTR').AsString +
              ' WHERE RKey= ' + A549Rkey +
              ' AND (Status = 0 OR Status = -1)';
        if not SqlExec(LSql) then Exit;
      end;
            
      //删除58记录
      LQry58.Delete;

      gCon.CommitTrans;
      Result := True;      
    end;
    

  finally
    LQry58.Free;
    LQry.Free;
    if gCon.InTransaction then gCon.RollbackTrans;
    if not Result then
      ShowMessage('错误代码： ' + IntToStr(LErrMsg));
  end;
end;

function NewMRBCheckBF(A06RKey, AZR_34RKey,AZR_Step, ABFPCSNum, ABFPnlNum, AQXDMRKey, ABF15RKey, ABakNote: string): Boolean;
type
  TDept = record
    D34Rkey: Integer;
    MIStep: Integer;
    Now56PCS: Integer;
    Now56Pnl: Integer;
  end;
var
  LQry: TADOQuery;
  LSQ,LZR: TDept;
  LSql: string;
  LMRB_NO: string;
  LErrMsg: Integer;
  LTmpBFNum: Integer;
  LCutNO_WO: string;
begin
  Result := False;
  LQry := TADOQuery.Create(nil);
  LErrMsg := 0;
  try
    //取得MRB_NO
    if SqlOpen(LQry,'SELECT seed_value from data0004 WHERE rkey=18') then
      LMRB_NO := LQry.FieldValues['seed_value']
    else Exit;

    //责任工序
    LZR.D34Rkey := StrToInt(AZR_34RKey);
    LZR.MIStep := StrToInt(AZR_Step);
    LZR.Now56PCS := 0;
    LZR.Now56Pnl := 0;
    //取得申请工序
    //如果返工中则取返工前的工序
    LSql := ' select D56.DEPT_PTR,D56.WTYPE as wtype56,D56.STEP,D56.QTY_BACKLOG,D56.PANELS,D06.PROD_STATUS from data0056 d56 ' +
            ' inner join data0006 d06 on d56.wo_ptr = d06.rkey ' +
            ' where wo_ptr = ' + A06RKey;
    if SqlOpen(LQry,LSql) then
    begin
      LSQ.D34Rkey := LQry.FieldValues['DEPT_PTR'];
      if LQry.FieldByName('WTYPE56').AsInteger > 0 then
        LSQ.MIStep := LQry.FieldValues['WTYPE56']
      else
        LSQ.MIStep := LQry.FieldValues['STEP'];
      LSQ.Now56PCS := LQry.FieldValues['QTY_BACKLOG'];
      lsq.Now56Pnl := LQry.FieldValues['PANELS'];

      ABFPCSNum := IntToStr(MinIntValue([StrToInt(ABFPCSNum),LSQ.Now56PCS]));
      ABFPnlNum := IntToStr(MinIntValue([StrToInt(ABFPnlNum),LSQ.Now56Pnl]));
    end else Exit;

    gCon.BeginTrans;
    //新增58记录
    LErrMsg := 1;
    lsql := 'insert into data0058(MRB_NO,WO_PTR,DEPT_PTR,REJECT_PTR,QTY_ORG_REJ,QTY_REJECT,PANELS,STEP,EMPL_PTR,TDATETIME,AUDIT_EMPL_PTR,AUDIT_DATETIME,RESP_DEPT_PTR,REFERENCE,StepNow,warehouse_ptr,FLOW_NO,BOM_PTR)' +
            ' values(' + QuotedStr(LMRB_NO) + ',' + A06RKey + ',' + IntToStr(LSQ.D34Rkey) + ',' +
            AQXDMRKey + ',' + ABFPCSNum + ',' + ABFPCSNum + ',' + ABFPnlNum + ',' + IntToStr(LZR.MIStep) + ',' +
            gUser.User_Ptr + ',getdate(),' + gUser.User_Ptr + ',getdate(),' + IntToStr(LZR.D34Rkey) + ',' +
            QuotedStr(ABakNote) + ',' + IntToStr(LSQ.MIStep) + ',' + ABF15RKey + ',' +
            LQry.FieldByName('WTYPE56').AsString + ',' +
            LQry.FieldByName('PROD_STATUS').AsString +
            ')';
    if not SqlExec(LSql) then Exit;

    //更新492
    LErrMsg := 2;
    LSql := 'update data0492 set QTY_REJECT=QTY_REJECT+' + ABFPCSNum + ',WIP_QTY=WIP_QTY-' + ABFPCSNum + 
            ' where cut_no = (SELECT CUT_NO FROM Data0006 where RKey=' + A06RKey + ')';
    if not SqlExec(LSql) then Exit;
    
    //更新56
    LErrMsg := 3;
    LSql := 'UPDATE Data0056 SET QTY_BACKLOG=';
    if LSQ.Now56PCS >= StrToInt(ABFPCSNum) then
      LSql := LSql + 'QTY_BACKLOG-' + ABFPCSNum
    else
      LSql := LSql + '0';
    if LSQ.Now56Pnl >= StrToInt(ABFPnlNum) then
      LSql := LSql + ',PANELS=PANELS-' + ABFPnlNum
    else
      LSql := LSql + ',PANELS=0';
    LSql := LSql + ' where wo_ptr = ' + A06RKey;
    if not SqlExec(LSql) then Exit;

    //更新06
    LErrMsg := 4;
    LSql := 'UPDATE Data0006 SET QUAN_REJ=QUAN_REJ+';
    if LSQ.Now56PCS >= StrToInt(ABFPCSNum) then
      LSql := LSql + ABFPCSNum
    else
      LSql := LSql + IntToStr(LSQ.Now56PCS);
    LSql := LSql + ' where rkey = ' + A06RKey;
    if not SqlExec(LSql) then Exit;

    //如果删除56则更新06的状态
    LErrMsg := 5;
    LSql := ' UPDATE Data0006 SET PROD_STATUS = 9, wtype = 5' +
            ' FROM Data0006 INNER JOIN Data0056 D56 ON Data0006.RKey=D56.WO_PTR' +
            ' WHERE Data0006.RKey = ' + A06RKey +
            ' AND D56.TO_BE_STOCKED=0 AND D56.QTY_BACKLOG=0';
    if not SqlExec(LSql) then Exit;

    //如果56为0则删除在线
    LErrMsg := 6;
    LSql := ' DELETE FROM Data0056 WHERE TO_BE_STOCKED = 0 AND QTY_BACKLOG =0 AND' +
            ' WO_PTR=' + A06RKey;
    if not SqlExec(LSql) then Exit;

    //处理48表中的记录,只更新申请工序的记录
    LErrMsg := 7;
    LTmpBFNum := MinIntValue([LSQ.Now56PCS,StrToInt(ABFPCSNum)]);
    LSql := 'SELECT STEP_NO,QTY_PROD,QTY_REJECT from data0048' +
            ' WHERE WO_PTR=' + A06RKey + ' AND STEP_NO = ' + IntToStr(LZR.MIStep);
    if SqlOpen(LQry,LSql) then
    begin
      while not LQry.Eof do
      begin
        if LTmpBFNum <= 0 then Break;

        if LQry.FieldByName('qty_prod').AsInteger >= (LQry.FieldByName('qty_reject').AsInteger + LTmpBFNum) then
        begin
          LQry.Edit;
          LQry.FieldByName('qty_reject').AsInteger := LQry.FieldByName('qty_reject').AsInteger + LTmpBFNum;
          LQry.Post;
          LTmpBFNum := 0;
        end else
        begin
          LTmpBFNum := LTmpBFNum - (LQry.fieldbyname('qty_prod').AsInteger - LQry.FieldByName('qty_reject').AsInteger);
          LQry.Edit;
          LQry.FieldByName('qty_reject').AsInteger := LQry.fieldbyname('qty_prod').AsInteger;
          LQry.Post;
        end;

        LQry.Next;
      end;
    end else Exit;

    //报废单号加1
    LErrMsg := 8;
    LSql := ' UPDATE Data0004 SET SEED_VALUE = ' + QuotedStr(IncMRB_NO(LMRB_NO)) +
            ' where rkey = 18';
    if not SqlExec(LSql) then Exit;


    //如果是内层则不取刻印内容
    LErrMsg := 9;
    LSql := ' SELECT D25.PARENT_PTR,D06.WORK_ORDER_NUMBER  FROM Data0025 D25 ' +
            ' INNER JOIN Data0006 D06 ON D06.BOM_PTR = D25.RKey ' +
            ' WHERE D06.RKey = ' + A06RKey;
    if SqlOpen(LQry,LSql) then
    begin
      if LQry.IsEmpty then
        LCutNO_WO := ''
      else
        LCutNO_WO := ExtractBurnNO(LQry.FieldByName('WORK_ORDER_NUMBER').AsString,3);
    end else
      Exit;

    //更新06作业单在状态和刻印内容
    lerrmsg := 10;
    if LCutNO_WO <> '' then
    begin
      LSql := 'UPDATE Data0006 SET WTYPE = 5 ,CUTNO_WO=' + QuotedStr(LCutNO_WO) + ' WHERE RKey = ' + A06RKey;
    end else
      LSql := 'UPDATE Data0006 SET WTYPE = 5 WHERE RKey = ' + A06RKey;
    if not SqlExec(LSql) then Exit;

    
    //写日志
    LSql := ' INSERT INTO Data0117 VALUES(' +
            A06RKey + ',2,0,' + gUser.User_Ptr + ',getdate(),14,NULL)';
    if not SqlExec(LSql) then Exit;
    

    gCon.CommitTrans;

    Result := True;
  finally
    LQry.Free;
    if gCon.InTransaction then gCon.RollbackTrans;
    if not Result then
      ShowMessage('错误代码 ' + IntToStr(LErrMsg));
  end;
end;


function GetUser15Ptr(ARkey73: string): string;
var
  LQry: TADOQuery;
begin
  LQry := TADOQuery.Create(nil);
  try
    if SqlOpen(LQry,'SELECT warehouse_ptr FROM Data0073 WHERE RKey = ' + ARkey73) then
    begin
      if not LQry.IsEmpty then Result := LQry.fieldbyname('warehouse_ptr').AsString
      else
      begin
        ShowMessage('没有找到该用户');
        Exit;
      end;
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;


function InFSHLock(Rkey58: string): Boolean;
var
  LQry: TADOQuery;
begin
  Result := True;
  LQry := TADOQuery.Create(nil);
  try
    if SqlOpen(LQry,'SELECT RKey FROM Data0549 WHERE D58_PTR= ' + Rkey58 + ' AND STATUS = 0') then
    begin
      Result := not LQry.IsEmpty;
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

function InPD: Boolean;
var
  LQry: TADOQuery;
begin
  Result := True;
  LQry := TADOQuery.Create(nil);
  try
    if SqlOpen(LQry,'SELECT RKEY FROM DATA0400 WHERE STATUS = 0') then
    begin
      Result := not LQry.IsEmpty;
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

function IsKuaYue(ARkey58: string): Boolean;
var
  LQry: TADOQuery;
  LSql: string;
begin
  Result := True;
  LQry := TADOQuery.Create(nil);
  try
    LSql := ' SELECT max(D444.tdate) AS PDDate,  ' +
            ' (SELECT AUDIT_DATETIME FROM Data0058 WHERE RKey = ' + ARkey58 + ') AS BFTime ' +
            ' FROM Data0444 D444 ';
    if SqlOpen(LQry,LSql) then
    begin
      Result := LQry.FieldByName('BFTime').AsDateTime <= LQry.FieldByName('PDDate').AsDateTime;
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

function IsWaiFa(ARkey06: string): Boolean;
var
  LQry: TADOQuery;
begin
  Result := True;
  LQry := TADOQuery.Create(nil);
  try
    if SqlOpen(LQry,'SELECT PROD_STATUS FROM Data0006 WHERE RKey =  ' + ARkey06) then
    begin
      Result := LQry.FieldByName('PROD_STATUS').AsInteger = 4;
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;

function IsGuoShu(ARkey06: string; A58StepNow: Integer): Boolean;
var
  LQry: TADOQuery;
begin
  Result := True;
  LQry := TADOQuery.Create(nil);
  try
    if SqlOpen(LQry,'SELECT STEP FROM Data0056 WHERE WO_PTR =  ' + ARkey06) then
    begin
      Result := not (A58StepNow = LQry.FieldByName('STEP').AsInteger);
    end;
  finally
    LQry.Close;
    LQry.Free;
  end;
end;


function ExtractBurnNO(AWONumber: string; AWtype: Integer): string;
var
  LBeginPos,LLen,n: Integer;
  I: Integer;
  LQry: TADOQuery;
  PnlAB: string;
begin
  LQry := TADOQuery.Create(nil);
  try
    if SqlOpen(LQry,'SELECT PANEL_A_B FROM Data0006 WHERE WORK_ORDER_NUMBER = ' + QuotedStr(AWONumber)) then
    begin
      if LQry.FieldByName('PANEL_A_B').AsInteger = 0 then PnlAB := 'A'
      else if LQry.FieldByName('PANEL_A_B').AsInteger = 1 then PnlAB := 'B'
      else PnlAB := '';
    end;
  finally
    LQry.Free;
  end;
  n := 1;
  if LeftStr(AWONumber,2) = 'W-' then//客户退货的为W-开头的，多加了个W-
  begin
    for I := 1 to Length(AWONumber) do
    begin
      LBeginPos := I+1;
      if AWONumber[I] = '-' then
      begin
        if n = 2 then
        begin
          Result := LeftStr(AWONumber,I-1) + PnlAB;
        end;
        if n = 4 then
        begin
          if AWtype in [0,1] then
            LLen := 1
          else
            LLen := Length(AWONumber) - I;
          Result := Result + '-' + Copy(AWONumber,LBeginPos,LLen);
        end;
        Inc(n);
      end;
    end;    
  end else
  begin
    for I := 1 to Length(AWONumber) do
    begin
      LBeginPos := I+1;
      if AWONumber[I] = '-' then
      begin
        if n = 1 then
        begin
          Result := LeftStr(AWONumber,I-1) + PnlAB;
        end;
        if n = 3 then
        begin
          if AWtype in [0,1] then
            LLen := 1
          else
            LLen := Length(AWONumber) - I;
          Result := Result + '-' + Copy(AWONumber,LBeginPos,LLen);
        end;
        Inc(n);
      end;
    end;
  end;
end;

end.
