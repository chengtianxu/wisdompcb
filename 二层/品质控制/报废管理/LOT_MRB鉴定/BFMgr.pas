unit BFMgr;

interface
uses
  DM, Classes, SysUtils;

function AddNewBF(MRB_NO, A06RKey, ASQ_34RKey, AZR_34RKey,ASQ_Step, AZR_Step,
      APCSNum,ABFPnlNum, AQXDMRKey, A15RKey, ABakNote, ASQ_PeopRKey: string): Boolean;
function IncMRB_NO(AOldMRB_NO: string): string;

function ISInPD: Boolean;
function GetMRB_NO: string;
function GetServerTime: TDateTime;

implementation

uses
  Dialogs, ADODB, WZ_gUnit;

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

function ISInPD: Boolean;
var
  LS: TStringList;
begin
  Result := True;
  LS := TStringList.Create;
  try
    LS.Add('SELECT RKEY FROM DATA0400 WHERE STATUS = 0');
    if DM1.SqlOpen(LS,DM1.qrytmp) then
    begin
      Result := not DM1.qrytmp.IsEmpty;
    end;
  finally
    LS.Free;
  end;
end;

function GetMRB_NO: string;
var
  LS: TStringList;
begin
  Result := '';
  LS := TStringList.Create;
  try
    LS.Add('SELECT seed_value,QA_control1, getdate() AS DateTime from data0004,data0192 WHERE data0004.rkey=18');
    if DM1.SqlOpen(LS,DM1.qrytmp) then
    begin
      if not DM1.qrytmp.IsEmpty then
      begin
        if DM1.qrytmp.FieldByName('qa_control1').AsInteger = 0 then
        begin
          Result := DM1.qrytmp.FieldByName('seed_value').AsString;
        end;
        if DM1.qrytmp.FieldByName('qa_control1').AsInteger = 1 then
        begin
          Result := FormatDateTime('yyyyMMdd', DM1.qrytmp.FieldByName('DateTime').AsDateTime);
          Result := Copy(Result,3,6);
        end;
        if DM1.qrytmp.FieldByName('qa_control1').AsInteger = 2 then
        begin
          Result := DM1.qrytmp.FieldByName('seed_value').AsString;
        end;
      end;
    end;
  finally
    LS.Free;
  end;
end;

function CharInSet(C: Char; const CharSet: TSysCharSet): Boolean;
begin
  Result := C in CharSet;
end;
//
//function AddNewBF(MRB_NO, A06RKey, ASQ_34RKey, AZR_34RKey,ASQ_Step, AZR_Step,
//      APCSNum,ABFPnlNum, A39RKey, A15RKey, ABakNote, ASQ_PeopRKey,ASH_PeopRKey: string): Boolean;
//var
//  LS: TStringList;
//  nEffect: Integer;
//begin
//  Result := False;
//  if ISInPD then
//  begin
//    ShowMessage('盘点中禁止输入报废');
//    Exit;
//  end;
//  LS := TStringList.Create;
//  if not DM1.con1.InTransaction then DM1.con1.BeginTrans;
//  try
//    try
//      //新增报废58记录
//      LS.Clear;
//      LS.Add(' INSERT INTO Data0058 VALUES(');
//      LS.Add(QuotedStr(MRB_NO)+',' + A06RKey + ',0,' + ASQ_34RKey + ',' + A39RKey + ',');
//      LS.Add(APCSNum + ',' + APCSNum + ',' + ABFPnlNum + ',NULL,0,'+ AZR_Step + ',' + ASQ_PeopRKey + ',');
//      LS.Add('getdate(),' + ASQ_PeopRKey + ',' + 'getdate(),') ;
//      LS.Add(AZR_34RKey + ',' + QuotedStr(ABakNote) + ',0,' + ASQ_Step + ',' + A15RKey);
//      LS.Add(')');
//      if not DM1.SqlExec(LS,DM1.qrytmp, nEffect) or (nEffect <= 0) then Exit;
//
//      //更新492数量
//      LS.Clear;
//      LS.Add('UPDATE Data0492 SET ');
//      LS.Add(' QTY_REJECT=QTY_REJECT+' + APCSNum);
//      LS.Add(' ,WIP_QTY=WIP_QTY-' + APCSNum);
//      LS.Add(' WHERE CUT_NO IN (SELECT CUT_NO FROM Data0006 where RKey=' + A06RKey + ')');
//      if not DM1.SqlExec(LS,DM1.qrytmp, nEffect) or (nEffect <= 0) then Exit;      
//
//      //更新06的数量
//      LS.Clear;
//      LS.Add(' UPDATE Data0006 SET QUAN_REJ=QUAN_REJ+' + APCSNum);
//      LS.Add(' WHERE RKey=' + A06RKey);      
//      if not DM1.SqlExec(LS,DM1.qrytmp, nEffect) or (nEffect <= 0) then Exit;
//
//      //更新56在线的数量
//      LS.Clear;
//      LS.Add('UPDATE Data0056 SET QTY_BACKLOG=QTY_BACKLOG-' + APCSNum);
//      LS.Add(', PANELS=PANELS-' + ABFPnlNum);
//      LS.Add(' WHERE WO_PTR=' + A06RKey + ' AND QTY_BACKLOG>=' + APCSNum);
//      if not DM1.SqlExec(LS,DM1.qrytmp, nEffect) or (nEffect <= 0) then Exit;
//
//      //更新048的产出数量
//      LS.Clear;
//      LS.Add(' UPDATE Data0048 SET QTY_PROD = QTY_PROD-' + APCSNum);
//      LS.Add(' ,QTY_REJECT= QTY_REJECT+' + APCSNum);
//      LS.Add(' ,PANELS=PANELS-' + ABFPnlNum);
//      LS.Add(' WHERE WO_PTR=' + A06RKey + ' AND STEP_NO >= ' + AZR_Step + ' AND STEP_NO < ' + ASQ_Step);
//      if not DM1.SqlExec(LS,DM1.qrytmp, nEffect) then Exit;
//
//      //如果删除56则更新06的状态
//      LS.Clear;
//      LS.Add(' UPDATE Data0006 SET PROD_STATUS = 9');
//      LS.Add(' FROM Data0006 INNER JOIN Data0056 D56 ON Data0006.RKey=D56.WO_PTR');
//      LS.Add(' WHERE Data0006.RKey = ' + A06RKey);
//      LS.Add(' AND D56.TO_BE_STOCKED=0 AND D56.QTY_BACKLOG=0' ) ;
//      if not DM1.SqlExec(LS,DM1.qrytmp, nEffect) then Exit;
//
//      //如果56为0则删除56记录
//      LS.Clear;
//      LS.Add(' DELETE FROM Data0056 WHERE TO_BE_STOCKED = 0 AND QTY_BACKLOG =0 AND');
//      LS.Add(' WO_PTR=' + A06RKey);
//      if not DM1.SqlExec(LS,DM1.qrytmp, nEffect) then Exit;
//
//      //删除48产出为0的记录
//      LS.Clear;
//      LS.Add(' DELETE FROM Data0048 WHERE WO_PTR=' + A06RKey);
//      LS.Add(' AND QTY_PROD = 0');
//      if not DM1.SqlExec(LS,DM1.qrytmp, nEffect) then Exit;
//
//      //报废单号+1
//      LS.Clear;
//      LS.Add(' UPDATE Data0004 SET SEED_VALUE = ' + QuotedStr(IncMRB_NO(MRB_NO)));
//      LS.Add(' WHERE RKey=18');
//      if not DM1.SqlExec(LS,DM1.qrytmp, nEffect) or (nEffect <= 0) then Exit;
//
//      DM1.con1.CommitTrans;
//      Result := True;
//    except
//      Result := False;
//      DM1.con1.RollbackTrans;
//    end;
//  finally
//    if DM1.con1.InTransaction then DM1.con1.RollbackTrans;
//    LS.Free;
//  end;
//  if not Result then ShowMessage('提交报废失败');
//end;
//
//function AddNewBF(MRB_NO, A06RKey, ASQ_34RKey, AZR_34RKey,ASQ_Step, AZR_Step,
//      APCSNum,ABFPnlNum, A39RKey, A15RKey, ABakNote, ASQ_PeopRKey,ASH_PeopRKey: string): Boolean;

function AddNewBF(MRB_NO, A06RKey, ASQ_34RKey, AZR_34RKey,ASQ_Step, AZR_Step,
      APCSNum,ABFPnlNum, AQXDMRKey, A15RKey, ABakNote, ASQ_PeopRKey: string): Boolean;
var
  LS: TStringList;
  LErrCode: Integer;
  Lqry48: TADOQuery;
  LNeedBFNum,LOldStep: Integer;
begin
  Result := False;
  if ISInPD then
  begin
    ShowMessage('盘点中禁止输入报废');
    Exit;
  end;
  LErrCode := 0;
  LS := TStringList.Create;
  dm1.con1.BeginTrans;
  try
    try
      //{$REGION '添加58记录'}
      LS.Clear;
      LS.Add(' INSERT INTO Data0058 VALUES(');
      LS.Add(QuotedStr(MRB_NO)+',' + A06RKey + ',0,' + ASQ_34RKey + ',' + AQXDMRKey + ',');
      LS.Add(APCSNum + ',' + APCSNum + ',' + ABFPnlNum + ',NULL,0,'+ AZR_Step + ',' + ASQ_PeopRKey + ',');
      LS.Add('getdate(),' + gUser.User_Ptr + ',' + 'getdate(),') ;
      LS.Add(AZR_34RKey + ',' + QuotedStr(ABakNote) + ',0,' + ASQ_Step + ',' + A15RKey);
      LS.Add(')');
      dm1.QryTmpExec(LS);

      //{$REGION '更新492'}
      LErrCode := 1;
      LS.Clear;
      LS.Add('UPDATE Data0492 SET ');
      LS.Add(' QTY_REJECT=QTY_REJECT+' + APCSNum);
      LS.Add(' ,WIP_QTY=WIP_QTY-' + APCSNum);
      LS.Add(' WHERE CUT_NO IN (SELECT CUT_NO FROM Data0006 where RKey=' + A06RKey + ')');
      dm1.QryTmpExec(LS);

      //{$REGION '更新06'}
      LErrCode := 2;
      LS.Clear;
      LS.Add(' UPDATE Data0006 SET QUAN_REJ=QUAN_REJ+' + APCSNum);
      LS.Add(' WHERE RKey=' + A06RKey);
      dm1.QryTmpExec(LS);

      //{$REGION '更新56'}
      LErrCode := 3;
      LS.Clear;
      LS.Add('UPDATE Data0056 SET QTY_BACKLOG=QTY_BACKLOG-' + APCSNum);
      LS.Add(', PANELS=PANELS-' + ABFPnlNum);
      LS.Add(' WHERE WO_PTR=' + A06RKey + ' AND QTY_BACKLOG>=' + APCSNum);
      dm1.QryTmpExec(LS);

      //{$REGION '更新48中的报废记录'}
      LErrCode := 3;
      Lqry48 := TADOQuery.Create(nil);
      LNeedBFNum := StrToInt(APCSNum);
      LOldStep := -1;
      try
        Lqry48.Connection := dm1.con1;
        Lqry48.SQL.Clear;
        Lqry48.SQL.Add('SELECT STEP_NO,QTY_PROD,QTY_REJECT from data0048') ;
        Lqry48.SQL.Add(' WHERE WO_PTR=' + A06RKey + ' AND STEP_NO >= ' + AZR_Step + ' AND STEP_NO < ' + ASQ_Step);
        Lqry48.SQL.Add(' order by STEP_NO');
        Lqry48.Open;
        Lqry48.First;
        while not Lqry48.Eof do
        begin
          if LOldStep <> Lqry48.FieldByName('STEP_NO').AsInteger then
          begin
            LOldStep := Lqry48.FieldByName('STEP_NO').AsInteger;
            LNeedBFNum := StrToInt(APCSNum);
          end;
          if LNeedBFNum > 0 then
          begin
            if Lqry48.FieldByName('qty_prod').AsInteger >= (Lqry48.FieldByName('qty_reject').AsInteger + LNeedBFNum) then
            begin
              Lqry48.Edit;
              Lqry48.FieldByName('qty_reject').AsInteger := Lqry48.FieldByName('qty_reject').AsInteger + LNeedBFNum;
              Lqry48.Post;
              LNeedBFNum := 0;
            end else
            begin
              LNeedBFNum := LNeedBFNum - (Lqry48.fieldbyname('qty_prod').AsInteger - Lqry48.FieldByName('qty_reject').AsInteger);
              Lqry48.Edit;
              Lqry48.FieldByName('qty_reject').AsInteger := Lqry48.fieldbyname('qty_prod').AsInteger;
              Lqry48.Post;
            end;
          end;
          Lqry48.Next;
        end;
      finally
        Lqry48.Close;
        Lqry48.Free;
      end;


//      LErrCode := 3;
//      LS.Clear;
//      LS.Add(' UPDATE Data0048 SET QTY_PROD = QTY_PROD-' + APCSNum);
//      LS.Add(' ,QTY_REJECT= QTY_REJECT+' + APCSNum);
//      LS.Add(' ,PANELS=PANELS-' + ABFPnlNum);
//      LS.Add(' WHERE WO_PTR=' + A06RKey + ' AND STEP_NO >= ' + AZR_Step + ' AND STEP_NO < ' + ASQ_Step);
//      dm1.QryTmpExec(LS);

      //{$REGION '如果删除56则更新06的状态'}
      LErrCode := 4;
      LS.Clear;
      LS.Add(' UPDATE Data0006 SET PROD_STATUS = 9, wtype = 5');
      LS.Add(' FROM Data0006 INNER JOIN Data0056 D56 ON Data0006.RKey=D56.WO_PTR');
      LS.Add(' WHERE Data0006.RKey = ' + A06RKey);
      LS.Add(' AND D56.TO_BE_STOCKED=0 AND D56.QTY_BACKLOG=0' ) ;
      dm1.QryTmpExec(LS);

      //{$REGION '如果56为0则删除'}
      LErrCode := 5;
      LS.Clear;
      LS.Add(' DELETE FROM Data0056 WHERE TO_BE_STOCKED = 0 AND QTY_BACKLOG =0 AND');
      LS.Add(' WO_PTR=' + A06RKey);
      dm1.QryTmpExec(LS);

      //{$REGION '删除48为0的记录'}
//      LErrCode := 6;
//      LS.Clear;
//      LS.Add(' DELETE FROM Data0048 WHERE WO_PTR=' + A06RKey);
//      LS.Add(' AND QTY_PROD = 0');
//      dm1.QryTmpExec(LS);

      //{$REGION '报废单号+1'}
      LErrCode := 7;
      LS.Clear;
      LS.Add(' UPDATE Data0004 SET SEED_VALUE = ' + QuotedStr(IncMRB_NO(MRB_NO)));
      LS.Add(' WHERE RKey=18');
      dm1.QryTmpExec(LS);

      dm1.con1.CommitTrans;
      Result := True;
    except
      if dm1.con1.InTransaction then dm1.con1.RollbackTrans;
      ShowMessage('提交失败，错误代码：'+ IntToStr(LErrCode));
      Result := False;
    end;
  finally
    if dm1.con1.InTransaction then dm1.con1.RollbackTrans;
    LS.Free;
  end;
end;

function GetServerTime: TDateTime;
var
  LS: TStringList;
begin
  LS := TStringList.Create;
  try
    LS.Add('SELECT getdate() AS NowTime');
    DM1.SqlOpen(LS,DM1.qrytmp);
    Result := DM1.qrytmp.fieldbyname('NowTime').AsDateTime;
  finally
    LS.Free;
  end;
end;


end.
