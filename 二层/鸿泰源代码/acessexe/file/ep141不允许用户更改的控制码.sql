 ep141不允许用户更改的控制码
 
 if (adoquery1rkey.Value=63) 材料条形码
 or (adoquery1rkey.Value=55) 配料单号
 or (adoquery1rkey.Value=18) 报废单编号
 or (adoquery1rkey.Value=17) 销售订单代码
 or (adoquery1rkey.Value=26) 装箱单号码
 or (adoquery1rkey.Value=56) 出仓/退仓单号
 or (adoquery1rkey.Value=57) 收货单号 
 or (adoquery1rkey.Value=2)  客户投诉代码
 then  //收货出仓
   begin             //不允许用户更改的控制码
            //不允许用户更改的控制码
    n1.Enabled:=false;
    n2.Enabled:=false;
    n3.Enabled:=false;
    n4.Enabled:=false;
   end
 else
   begin
    n1.Enabled:=true;
    n2.Enabled:=true;
    n3.Enabled:=true;
    n4.Enabled:=true;
   END
   
   SELECT * FROM data0004 WHERE rkey IN (2,17,18,26,55,56,57,63)