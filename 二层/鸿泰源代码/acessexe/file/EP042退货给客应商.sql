--tstatus =5 未提交  0待审  1 通过  2退回
--退货供应商界面主表
exec sp_executesql N'SELECT
 data0071.rkey,data0071.quan_ord,data0071.quan_recd,
 data0071.REQ_DATE,data0071.QUAN_RETN,
 data0017.inv_part_number,data0017.s_b_n,
 data0002.unit_code,data0017.inv_part_description
FROM
 data0071,data0002,data0017,DATA0070
WHERE
 data0071.invt_ptr=data0017.rkey AND
 data0071.purchase_unit_ptr=data0002.rkey 
 and data0071.PO_ptr=DATA0070.rkey
 and data0071.po_ptr=@P1
 and 1=1
',N'@P1 int',15099

--退货供应商界面明细

exec sp_executesql N'SELECT
 data0017.inv_part_number,data0022.BARCODE_ID,
 data0022.quantity,data0022.quan_stocked,Data0022.location_ptr,data0016.code as Code16,data0016.location,
 data0022.quan_to_be_shipped,data0022.QUAN_RETURNED,erq_rejd_conpaid=isnull((select sum (Data0096.QUAN_REJD) from  data0096  where (data0096.TRAN_TP<>8 or data0096.TRAN_TP<>38) and isnull(data0096.flag,0)=2 and INV_TRAN_PTR = Data0022.RKEY and (isnull(Tstatus,0)<1 or isnull(Tstatus,0)=5)),0),
 data0022.tdate,data0022.quan_on_hand,isnull(data0022.occupyqty,0) as occupyqty,data0022.rkey,
 data0002.unit_code,data0022.inventory_ptr,data0017.inv_part_description
from data0022
inner  join    data0017   on  data0022.INVENTORY_PTR = data0017.rkey
Left   join    data0002   on  data0017.stock_unit_ptr = data0002.rkey
inner  join    data0016   on  data0022.location_ptr=data0016.rkey
where (data0022.ttype=2 or data0022.ttype=3)
and  data0022.SOURCE_PTR =@P1
and 1=1
',N'@P1 int',31219




select * from data0096 where rkey95=1705 order by 1 desc


select * from Data0096 order by 1 desc
exec sp_executesql N'select data0096.rkey,data0017.INV_PART_NUMBER,data0017.INV_PART_DESCRIPTION,data0096.tdate,data0096.quan_rejd,
       data0076.REJECT_DESCRIPTION,data0096.rkey95,
       data0005.employee_name,data0096.rkey,data0096.tstatus
from data0096
inner join data0076 on  data0096.rej_ptr=data0076.rkey
inner join data0005 on  data0096.empl_ptr=data0005.rkey
inner join Data0017 ON Data0096.INVT_PTR = Data0017.RKEY
where data0096.inv_tran_ptr=@P1 
 and (data0096.tstatus=100 or data0096.tstatus=5) --tstatus=5未提交
',N'@P1 int',33116  

--增加退料线供应商
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0095" 
("TRAN_TP","INVT_PTR","SRCE_PTR","TRAN_BY","USER_PTR","TRAN_DATE","QUANTITY") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 float',
20,1092,33116,1,1,'2013-05-24 21:05:39',35

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0096" 
("INVT_PTR","REJ_PTR","INV_TRAN_PTR","EMPL_PTR","USER_PTR","TDATE","QUAN_REJD","FLAG","REFERENCE_NUMBER","tstatus","Req_Quan_REJD","TRAN_TP","rkey95") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 float,@P8 varchar(1),@P9 varchar(20),@P10 tinyint,@P11 float,@P12 smallint,@P13 int',
 1092,28,33116,1,1,'2013-05-24 21:05:39',35,'2','200005379           ',5,35,20,178407 

  --tstatus=5未提交




--删除退料线供应商

delete from data0095 --材料处理综合记录表)【接收，收货，退货，装运?
where rkey=178406

go
delete from data0096 --标准材料拒收【退货】【报废】表
where rkey=1706

--提交评审

update data0096 set tstatus=0   --tstatus=0待审
where rkey=1707

