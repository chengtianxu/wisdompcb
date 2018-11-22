EP305修改客户报NULL错误
非空列不能更新为 Null。.

1、60表里的EXCH_RATE,CURRENCY_PTR 重新保存一下汇率
2\装运地址


 with dm.ADOQryTmp do //取得新货币汇率  20121129 LLL 更改客户需同时更新汇率
      begin
        if active = True then
          active := False;
        sql.Clear;
        sql.text:='select isnull(data0003.exch_rate,0) as exch_rate,fyear,fmonth '
          +'from data0003 '
          +'where data0003.curr_ptr=' + trim(form10.Label9.Caption)
          +' and fyear= '+inttostr(yearof(dm.ADO60.FieldByName('ent_date').Value))   //         下单日期当月汇率
          +' and fmonth='+inttostr(monthof(dm.ADO60.FieldByName('ent_date').Value));  //         下单日期当月汇率
        active := True;
       end;
         dm.ADO60.FieldByName('exch_rate').Value:=dm.ADOQryTmp.FieldByName('exch_rate').Value;  //20121129 LLL 更改客户需同时更新汇率

2850615974(刘玲利) 2014-03-21 11:49:28
  dm.ADO60.FieldByName('customer_ptr').AsInteger := strtoint('0' +
          trim(form10.Edit6.Hint));客户
        dm.ADO60.FieldByName('cust_ship_addr_ptr').AsInteger := strtoint('0' +
          trim(form10.Edit7.Hint));装运地点
        dm.ADO60.FieldByName('CURRENCY_PTR').AsInteger :=strtoint('0' +
          trim(form10.Label9.Caption)); //新货币指针
          
          Form10.Label9.Caption :=DM.ADO60.fieldbyname('currency_ptr').AsString;