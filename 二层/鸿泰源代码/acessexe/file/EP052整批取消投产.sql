--EP052整批取消投产

--投产单搜索

exec sp_executesql N'select a.cut_no as cutno,
e.customer_name,c.customer_part_number,
f.customer_part_desc,c.cp_rev,c.rkey,
a.so_no,a.issue_date,e.cust_code from data0492 a 
left join data0025 b on a.bom_ptr=b.rkey 
left join data0050 c on b.ancestor_ptr=c.rkey left 
join data0060 d on a.so_no=d.sales_order 
left join data0010 e on d.customer_ptr=e.rkey 
left join data0059 f  on f.cust_part_ptr=c.rkey 
where (a.customer_ptr=f.customer_ptr)
and a.issue_date>=@P1
and a.issue_date<=@P2
order by cutno
',N'@P1 datetime,@P2 datetime','2013-12-14 14:29:46','2014-01-14 14:29:46'
--上面确定后
exec sp_executesql N'SELECT data0006.work_order_number,data0006.prod_status,data0006.quan_sch
,data0006.sch_compl_date,data0006.cut_no,data0006.rkey
from data0006,data0492
WHERE data0006.cut_no=data0492.cut_no
and data0492.cut_no like @P1
--and  begin_step_no=0
order by work_order_number
',N'@P1 varchar(12)','140113001%'

----------------------------------------
----查有没流转记录
exec sp_executesql N'Select * from data0048 where wo_ptr in (select rkey from data0006 where cut_no=@P1)
',N'@P1 varchar(20)','140113001-0    --


exec sp_executesql N'UPDATE "SJ_V20_live".."data0050" SET "firm_rel_s"=@P1,"Planned_rel_s"=@P2 
WHERE "Rkey"=@P3 AND "firm_rel_s"=@P4 AND "Planned_rel_s"=@P5',
N'@P1 smallint,@P2 smallint,@P3 int,@P4 smallint,@P5 smallint',
4,-2,
1660,3,-1

--返回待待投
exec sp_executesql N'UPDATE "SJ_V20_live".."data0360" SET "planned_qty"=@P1 
WHERE "rkey"=@P2 AND "planned_qty"=@P3',
N'@P1 int,@P2 int,@P3 int',
0,9337,200
exec sp_executesql N'delete data0048 where wo_ptr in ( 
select rkey from data0006 
where cut_no=@P1 )
',N'@P1 varchar(20)','140113001-0    

--记录
insert into data0318([SALES_ORDER_PTR],
[TRANS_TYPE], [TRANS_DESCRIPTION],
[FROM_STRING], [TO_STRING], [USER_PTR], [TRANS_DATE],
[PROGRAM_SOURCE])
values(9550,15,'整批取消投产(原因:tet)','配料单:140113001-0取消前S/O待投产数量:0已投产数量:1200','取消投产数量:800',1,'2014-01-13 14:37:09',52)
--删除配料单
exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0492" WHERE "rkey"=@P1',N'@P1 int',11513
--然连级删除LOT

