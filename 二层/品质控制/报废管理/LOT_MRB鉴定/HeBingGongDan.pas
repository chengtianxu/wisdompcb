unit HeBingGongDan;

interface
uses
  DM;



function CombinLot(AChildRKey06: string): Boolean;
//function ExtractBurnNO(AWONumber: string; AWtype: Integer): string;

implementation
uses
  Classes, Dialogs, SysUtils, ADODB, WZ_gUnit, StrUtils;

function CombinLot(AChildRKey06: string): Boolean;
var
  LS: TStringList;
  LQry: TADOQuery;
  nEffect, Child56NowPcs, Child56NowPnl, ChildToStockPcs, ChildToStockPnl, Child06BFPcs, ChildJiHuaPNL: Integer;
  ChildJiHuaPCS: Double;
  //tmp,tmp2: Integer;
  Mother06Rkey, Child25RKey: string;
  lqry410Mother,Lqry410Child: TADOQuery;
  //LBurnNO: string;
  LSql: string;
  label lbl;
begin
//  Child56NowPcs := 0;
//  Child56NowPnl := 0;
//  ChildToStockPcs := 0;
//  ChildToStockPnl := 0;
//  ChildJiHuaPCS := 0;
  Result := False;
  //如果子工单存在待入库数量，则禁止退回。
  LSql := 'select TO_BE_STOCKED,TO_BE_CANCD from data0056 where wo_ptr = ' + AChildRKey06;
  dm1.SqlOpen(LSql,DM1.qrytmp);
  if (DM1.qrytmp.FieldByName('TO_BE_STOCKED').AsInteger > 0) or (DM1.qrytmp.FieldByName('TO_BE_CANCD').AsInteger > 0) then
  begin
    ShowMessage('子工单存在待入库数量，禁止退回操作');
    Exit;
  end;


  

  LS := TStringList.Create;
  try
    //母单是否存在，状态是否一致
    LS.Clear;
    LS.Add(' SELECT D06Mother.*, D06Child.put_type AS ChildOldStatus, D06Child.Quan_SCH AS ChildJiHuaPCS, D06Child.QUAN_REJ AS ChildBFPcs,');
    LS.Add(' D06Child.BOM_PTR AS Child25RKey,');
    //工序
    LS.Add(' D56Child.DEPT_PTR AS ChildNowDeptPtr, D56Mother.DEPT_PTR AS MotherNowDeptPtr,');
    //56在线数量
    LS.Add(' D56Child.QTY_BACKLOG AS ChildNowPcs, D56Child.PANELS AS ChildNowPnl, D56Mother.RKey AS MotherRkey56,');
    //56 child 待入库数量
    LS.Add(' D56Child.TO_BE_STOCKED AS ChildToStockPcs, D56Child.TO_BE_CANCD AS ChildToStockPnl ');
    LS.Add(' FROM Data0006 D06Mother ');
    //连接
    LS.Add(' INNER JOIN Data0006 D06Child ON D06Child.from_wo_ptr = D06Mother.RKey');
    LS.Add(' Left JOIN Data0056 D56Child ON D06Child.RKey = D56child.WO_PTR');
    LS.Add(' Left JOIN Data0056 D56Mother On D56Mother.WO_PTR = D06Mother.Rkey');
    //条件
    LS.Add(' WHERE D06Child.Rkey = ' + AChildRKey06);
    if DM1.SqlOpen(LS,DM1.qrytmp) then
    begin
      if DM1.qrytmp.IsEmpty then //母单不存在，则自己就是母单
      begin
        lbl:
        if not DM1.con1.InTransaction then DM1.con1.BeginTrans;
        //退回的时候刻印内容不改变
//        LQry := TADOQuery.Create(nil);
//        try
//          LS.Clear;
//          LS.Add('SELECT WORK_ORDER_NUMBER, put_type from Data0006 WHERE RKey =' + AChildRKey06);
//          if DM1.SqlOpen(LS,LQry) then
//          begin
//            LBurnNO := ExtractBurnNO(LQry.FieldByName('WORK_ORDER_NUMBER').AsString,LQry.FieldbyName('put_type').AsInteger);
//          end else
//          begin
//            ShowMessage('重新获取刻印内容失败时候取得工单号失败');
//            Exit;
//          end;
//        finally
//          LQry.Free;
//        end;

        LS.Clear;
        LS.Add('UPDATE Data0006 SET WTYPE = ISNULL(1,0) WHERE RKey = ' + AChildRKey06);
        if DM1.SqlExec(LS,nEffect) then
        begin
          if nEffect > 0 then
          begin
            Result := True;
          end else
          begin
            ShowMessage('更新子单06为母单时候返回0行，退回失败');
            Result := False
          end;
        end else
          Result := False;
          
        //写子工单日志  
        if Result then
        begin
          LS.Clear;
          LS.Add('INSERT INTO Data0117 VALUES(');
          LS.Add(AChildRKey06 + ',2,0,' + gUser.User_Ptr + ',getdate(),15,');
          LS.Add(QuotedStr('LOT_MRB鉴定退回,与母工单:' + DM1.qrytmp.FieldByName('WORK_ORDER_NUMBER').AsString + ' 无法合并.'));
          ls.Add(')');
          if DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
          begin
            Result := nEffect >= 1;
            if not Result then
              ShowMessage('写子工单入日志失败');
          end else
          begin
            Result := False;
            ShowMessage('写子工单入日志失败');
          end;
        end;
        if Result then DM1.con1.CommitTrans else DM1.con1.RollbackTrans;
        Exit;
      end else
      begin
        //检查母工单状态
        if DM1.qrytmp.FieldByName('Prod_Status').AsInteger in [9,102,103] then
        begin
          //sShowMessage('母工单状态错误，退回失败');
          goto lbl;
          Exit;
        end;
        if DM1.qrytmp.FieldByName('Prod_Status').AsInteger = 202 then //母工单已经被合并掉的时候处理
        begin
          goto lbl;
          Exit;
        end;        

        if DM1.qrytmp.FieldByName('WType').AsInteger <> DM1.qrytmp.FieldByName('ChildOldStatus').AsInteger then
        begin
          //ShowMessage('母工单和子工单原始的WTYPE状态不一致，退回失败');
          goto lbl;
          Exit;
        end;
        //检查工序一致
        if DM1.qrytmp.FieldByName('ChildNowDeptPtr').AsInteger <> DM1.qrytmp.FieldByName('MotherNowDeptPtr').AsInteger then
        begin
          //如果工序不一样，则自己就是一个单独的单了
          goto lbl;
          Exit;
        end;
        //检查是否有报废，如果有报废则不可以退回
        if DM1.qrytmp.FieldByName('ChildBFPcs').AsInteger > 0 then
        begin
          //ShowMessage('子单有报废记录，不可以退回，退回失败');
          goto lbl;
          Exit;
        end;
      end;
    end else Exit;

    Mother06Rkey := DM1.qrytmp.fieldbyname('RKey').AsString;
    Child56NowPcs := DM1.qrytmp.Fieldbyname('ChildNowPcs').AsInteger;
    Child56NowPnl := DM1.qrytmp.Fieldbyname('ChildNowPnl').AsInteger;
    ChildToStockPcs := DM1.qrytmp.Fieldbyname('ChildToStockPcs').AsInteger;
    ChildToStockPnl := DM1.qrytmp.Fieldbyname('ChildToStockPnl').AsInteger;
    ChildJiHuaPCS := DM1.qrytmp.FieldByName('ChildJiHuaPCS').AsFloat;
    Child06BFPcs := DM1.qrytmp.FieldByName('ChildBFPcs').AsInteger;
    Child25RKey :=  DM1.qrytmp.FieldByName('Child25RKey').AsString;
    ChildJiHuaPNL := DM1.qrytmp.FieldByName('PANELS').AsInteger;
    
    DM1.con1.BeginTrans;
    //增加母单的在线56记录中的数量
    LS.Clear;
    LS.Add(' UPDATE Data0056 SET QTY_BACKLOG = QTY_BACKLOG + ' + IntToStr(Child56NowPcs) + ',');
    LS.Add(' PANELS = PANELS + ' + IntToStr(Child56NowPnl) + ',');
    LS.Add(' TO_BE_STOCKED = TO_BE_STOCKED + ' + IntToStr(ChildToStockPcs) + ',');
    LS.Add(' TO_BE_CANCD = TO_BE_CANCD + ' + IntToStr(ChildToStockPnl));
    LS.Add(' WHERE RKey = ' + DM1.qrytmp.fieldbyname('MotherRkey56').AsString);
    if DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
    begin
      //
    end else
    begin
      ShowMessage('增加母单在线纪录出错，退回失败');
      Exit;
    end;
    //增加母单06的数量
    LS.Clear;
    LS.Add(' UPDATE Data0006 SET QUAN_SCH = QUAN_SCH + ' + IntToStr(Child56NowPcs) + ',');
    LS.Add(' PANELS = PANELS + ' + IntToStr(Child56NowPnl));
    //LS.Add(' REMARK_PNLS = REMARK_PNLS ' + IntToStr(Child56NowPnl) + ','); 因为拆分时候没有减少所以暂时不动
    LS.Add(' WHERE RKey = ' + Mother06Rkey);
    if DM1.SqlExec(LS,DM1.qrytmp, nEffect) then
    begin
      if nEffect <= 0 then
      begin
        ShowMessage('增加母单06数量时返回0行，退回失败');
        Exit;
      end;
    end else
    begin
      ShowMessage('增加母单06数量时候出错，退回失败');
      Exit;
    end;

    //更改母单0489的半成品分配记录
    //先查出child 的半成品流转记录
    LQry := TADOQuery.Create(nil);
    try
      LS.Clear;
      LS.Add(' SELECT RKey,Qty,SOURCE_PTR,BOM_PTR FROM Data0489 WHERE WO_PTR = ' + AChildRKey06);
      if DM1.SqlOpen(LS,LQry) then
      begin
        LQry.First;
        while not LQry.Eof do
        begin
          //如果报废记录为0则全
          if Child06BFPcs <= 0 then
          begin
            LS.Clear;
            LS.Add('UPDATE Data0489 SET Qty = Qty + ' + LQry.Fieldbyname('Qty').AsString);
            LS.Add(' WHERE SOURCE_PTR = ' + LQry.FieldByName('SOURCE_PTR').AsString);
            LS.Add(' AND WO_PTR = ' + Mother06Rkey);
            LS.Add(' AND BOM_PTR = ' + LQry.fieldbyname('BOM_PTR').AsString);
            if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
            begin
              ShowMessage('增加母单半成品分配数量出错，退回失败');
              Exit;
            end;
            //删除Child 的489的记录
            LS.Clear;
            LS.Add(' DELETE FROM Data0489 ');
            LS.Add(' WHERE RKey = ' + LQry.fieldbyname('RKey').AsString);
            if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
            begin
              ShowMessage('删除子单半成品分配记录出错，退回失败');
              Exit;
            end;            
          end else
          begin
            {
            LS.Clear;
            tmp := Round((Child56NowPcs/(Child56NowPcs + Child06BFPcs))* LQry.FieldByName('Qty').AsInteger);//通过百分比来计算分配的半成品数
            LS.Add('UPDATE Data0489 SET Qty = Qty + ' + IntToStr(tmp) );
            LS.Add(' WHERE SOURCE_PTR = ' + LQry.FieldByName('SOURCE_PTR').AsString);
            LS.Add(' AND WO_PTR = ' + Mother06Rkey);
            if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
            begin
              ShowMessage('增加母单半成品分配数量出错，退回失败');
              Exit;
            end;
            //减少Child 的489的qty数量
            LS.Clear;
            LS.Add('UPDATE Data0489 SET Qty = Qty - ' + IntToStr(tmp) );
            LS.Add(' WHERE RKey = ' + LQry.fieldbyname('RKey').AsString);
            if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
            begin
              ShowMessage('减少子单半成品分配数量出错，退回失败');
              Exit;
            end;
            }
            ShowMessage('有报废记录不能退回。退回失败');
          end;

          LQry.Next;
        end;
      end else
      begin
        ShowMessage('取得分配的子工单时候出错');
        Exit;
      end;
    finally
      LQry.Free;
    end;


    //增加Mother中的488数量，减少Child中488的数量
    LQry := TADOQuery.Create(nil);
    try
      LS.Clear;
      LS.Add(' SELECT RKey,BOM_PTR,Quan_Req,Quan_ISSUED FROM Data0488 WHERE WO_PTR = ' + AChildRKey06);
      if DM1.SqlOpen(LS,LQry) then
      begin
        LQry.First;
        while not LQry.Eof do
        begin
          //如果child的报废为0则
          if Child06BFPcs <= 0 then
          begin
            LS.Clear;
            LS.Add('UPDATE Data0488 SET Quan_Req = Quan_Req + ' + LQry.fieldbyname('Quan_Req').AsString + ',');
            LS.Add(' Quan_ISSUED = Quan_ISSUED + ' + LQry.fieldbyname('Quan_ISSUED').AsString);
            LS.Add(' WHERE WO_PTR = ' + Mother06Rkey);
            LS.Add(' AND BOM_PTR = ' + LQry.FieldByName('BOM_PTr').AsString);
            if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
            begin
              ShowMessage('更新母单488数量时候出错，退回失败');
              Exit;
            end;
            //删除子单的488记录
            LS.Clear;
            LS.Add(' DELETE FROM Data0488 WHERE RKey = ' + LQry.FieldByName('RKey').AsString);
            if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
            begin
              ShowMessage('删除子单488记录时候出错，退回失败');
              Exit;
            end;
          end else
          begin
            ShowMessage('有报废记录不能退回，退回失败');
            Exit;
          end;
          LQry.Next;
        end;
      end else
      begin
        ShowMessage('取得子工单488记录时候出错，退回失败');
        Exit;
      end;
    finally
      LQry.Free;
    end;

    //更改母单的48产出过数记录
    LQry := TADOQuery.Create(nil);
    try
      LS.Clear;
      LS.Add('UPDATE Data0048 SET WO_PTR = ' + Mother06Rkey);
      //LS.Add(' PANELS = PANELS + ' + IntToStr(ChildJiHuaPNL));
      LS.Add(' WHERE WO_PTR = ' + AChildRKey06);
      //LS.Add(' AND TO_DEPT_PTR IS not NULL');
      if DM1.SqlExec(LS,LQry,nEffect) then
      begin
        
      end else
      begin
        ShowMessage('更新母单48过数记录失败，退回失败');
        Exit;
      end;
    finally
      LQry.Free;
    end;

    //合并410的记录，删除子单的410
    lqry410Mother := TADOQuery.Create(nil);
    Lqry410Child := TADOQuery.Create(nil);
    try
      if not DM1.SqlOpen('select * from data0410 where WO_PTR = ' + Mother06Rkey,lqry410Mother) then
      begin
        ShowMessage('取得母单410出错');
        Exit;
      end;
      if not DM1.SqlOpen('select * from data0410 where WO_PTR = ' + AChildRKey06,Lqry410Child) then
      begin
        ShowMessage('取得子单410出错');
        Exit;
      end;
      try
      lqry410Mother.First;
      while not lqry410Mother.Eof do
      begin
        Lqry410Child.First;
        while not Lqry410Child.Eof do
        begin
          if (lqry410Mother.FieldByName('D0451_PTR').Value = Lqry410Child.FieldByName('D0451_PTR').Value) and
            (lqry410Mother.FieldByName('STEP').Value = Lqry410Child.FieldByName('STEP').Value) and
            (lqry410Mother.FieldByName('DEPT_PTR').Value = Lqry410Child.FieldByName('DEPT_PTR').Value)
          then
          begin
            lqry410Mother.Edit;
            lqry410Mother.FieldByName('QTY').AsInteger := lqry410Mother.FieldByName('QTY').AsInteger + Lqry410Child.FieldByName('QTY').AsInteger;
            lqry410Mother.FieldByName('MATL_AMOUNT').AsFloat := lqry410Mother.FieldByName('MATL_AMOUNT').AsFloat + Lqry410Child.FieldByName('MATL_AMOUNT').AsFloat;
            lqry410Mother.FieldByName('ovhd1_AMOUNT').AsFloat := lqry410Mother.FieldByName('ovhd1_AMOUNT').AsFloat + Lqry410Child.FieldByName('ovhd1_AMOUNT').AsFloat;
            lqry410Mother.FieldByName('ovhd2_AMOUNT').AsFloat := lqry410Mother.FieldByName('ovhd2_AMOUNT').AsFloat + Lqry410Child.FieldByName('ovhd2_AMOUNT').AsFloat;
            lqry410Mother.FieldByName('ovhd3_AMOUNT').AsFloat := lqry410Mother.FieldByName('ovhd3_AMOUNT').AsFloat + Lqry410Child.FieldByName('ovhd3_AMOUNT').AsFloat;
            lqry410Mother.Post;
            Lqry410Child.Delete;
          end;
          Lqry410Child.Next;
        end;
        lqry410Mother.Next;
      end;
      except
        ShowMessage('合并410记录时候出错');
        Exit;
      end;

    finally
      lqry410Mother.Free;
      Lqry410Child.Free;
    end;

    //删除子单的48记录
//    LS.Clear;
//    LS.Add('DELETE FROM Data0048 WHERE WO_PTR = ' + AChildRKey06);
//    if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
//    begin
//      ShowMessage('删除子单过数记录失败，退回失败');
//      Exit;
//    end;

    //更新子工单的06状态和数量
    LS.Clear;
    LS.Add('UPDATE Data0006 SET QUAN_SCH = 0,PANELS = 0,PROD_STATUS = 202,WTYPE= ISNULL(put_type,1) ');
    LS.Add(' WHERE RKey = ' + AChildRKey06);
    if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
    begin
      ShowMessage('更新子单06记录状态失败，退回失败');
      Exit;
    end;

    //删除子工单的238记录
    LS.Clear;
    LS.Add('DELETE FROM Data0238 WHERE WO_PTR = ' + AChildRKey06);
    if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
    begin
      ShowMessage('删除子工单返工238流程失败');
      Exit;
    end;

    //删除删除子单的在线56记录
    LS.Clear;
    LS.Add('DELETE FROM Data0056 WHERE WO_PTR = ' + AChildRKey06);
    if not DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
    begin
      ShowMessage('删除子单在线记录失败，退回失败');
      Exit;
    end;

    //写子工单日志
    LS.Clear;
    LS.Add('INSERT INTO Data0117 VALUES(');
    LS.Add(AChildRKey06 + ',2,0,' + gUser.User_Ptr + ',getdate(),15,');
    LS.Add('NULL');
    ls.Add(')');
    if DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
    begin
      Result := nEffect >= 1;
      if not Result then
        ShowMessage('写子工单入日志失败');
    end else
    begin
      Result := False;
      ShowMessage('写子工单入日志失败');
    end;

    //写母工单日志
    LS.Clear;
    LS.Add('INSERT INTO Data0117 VALUES(');
    LS.Add(Mother06Rkey + ',2,0,' + gUser.User_Ptr + ',getdate(),15,');
    LS.Add(QuotedStr('LOT_MRB鉴定退回,本单合并子工单:' + DM1.adsFrmMain.fieldbyname('WORK_ORDER_NUMBER').AsString));
    ls.Add(')');
    if DM1.SqlExec(LS,DM1.qrytmp,nEffect) then
    begin
      Result := nEffect >= 1;
      if not Result then
        ShowMessage('写母工单入日志失败');
    end else
    begin
      Result := False;
      ShowMessage('写母工单入日志失败');
    end;

    DM1.con1.CommitTrans;
    Result := True;
  finally
    LS.Free;
    if DM1.con1.InTransaction then DM1.con1.RollbackTrans;
  end;
end;



end.
