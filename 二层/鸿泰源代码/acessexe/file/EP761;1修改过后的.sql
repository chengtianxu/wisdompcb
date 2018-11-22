-- EP761;1修改过后的
--exec EP761;1 0,0,'2013-11-23 00:00:00','2013-12-23 00:00:00',0
alter PROCEDURE EP761;1
--declare
@vptr int,
@vsoptr int,
@vdate1 datetime,
@vdate2 datetime,
@vwhse_ptr int=0
with encryption
AS
--select @vptr=0,@vsoptr=0,@vdate1='2013-11-23 00:00:00',@vdate2='2013-12-23 00:00:00',@vwhse_ptr=0
declare @lotspitsqmt int
set @lotspitsqmt=50
declare @v1 int
declare @v2 int
set @vdate2=@vdate2+1
set @vsoptr=isnull(@vsoptr,0)
set @v1=cast(@vdate1 as int)
set @v2=cast(@vdate2 as int)
select data0060.rkey as so_ptr,data0060.cust_part_ptr as ancestor_ptr,data0050.layers,isnull(data0360.sch_date,data0060.ORIG_SCHED_SHIP_DATE) as sch_compl_date ,
data0360.quantity*data0050.unit_sq as sqmt,data0008.prod_code,
case 
when data0050.ttype=0 and data0360.quantity*data0050.unit_sq>@lotspitsqmt  then 1
when data0050.ttype=0 and data0360.quantity*data0050.unit_sq<=@lotspitsqmt then 2
when data0050.ttype=1 then 3
end as ttype,
case 
when data0050.ttype=0 and data0360.quantity*data0050.unit_sq>@lotspitsqmt and data0060.so_oldnew='新单' then data0008.lead_time_l_newso
when data0050.ttype=0 and data0360.quantity*data0050.unit_sq>@lotspitsqmt and data0060.so_oldnew<>'新单' then data0008.lead_time_l
when data0050.ttype=0 and data0360.quantity*data0050.unit_sq<=@lotspitsqmt and data0060.so_oldnew='新单' then data0008.lead_time_newso
when data0050.ttype=0 and data0360.quantity*data0050.unit_sq<=@lotspitsqmt and data0060.so_oldnew<>'新单' then data0008.lead_time
when data0050.ttype=1 and data0360.quantity*data0050.unit_sq>@lotspitsqmt and data0060.so_oldnew='新单' then data0008.lead_time_s_newso
when data0050.ttype=1 and data0360.quantity*data0050.unit_sq>@lotspitsqmt and data0060.so_oldnew<>'新单' then data0008.lead_time_s
end as lead_time
into #test00
from data0050
join data0025 on data0025.ancestor_ptr=data0050.rkey and data0025.parent_ptr=0
join  data0008 on data0025.prod_code_ptr=data0008.rkey
right join data0060 on  data0060.cust_part_ptr=data0050.rkey
left join data0360 on data0360.so_ptr=Data0060.rkey
where 
((data0060.status>=1 and data0060.status<=4 and data0060.so_tp <> 1) or data0060.rkey=@vsoptr)
and isnull(data0360.sch_date,data0060.ORIG_SCHED_SHIP_DATE)>=@vdate1
and isnull(data0360.sch_date,data0060.ORIG_SCHED_SHIP_DATE)<=@vdate2
--and data0060.ttype=0
and Data0060.so_style<>2
and (Data0050.whse_ptr=@vwhse_ptr or @vwhse_ptr=0 or isnull(data0050.whse_ptr,0)=0)


select so_ptr,ancestor_ptr,layers,sch_compl_date,lead_time,ttype,prod_code,
cast(case when sch_compl_date-getdate()-lead_time>0 then sch_compl_date-getdate()-lead_time else 0 end as int) as avl_days,
sum(sqmt) as sqmt
into #test01
from #test00
group by ancestor_ptr,layers,sch_compl_date,lead_time,ttype,prod_code,so_ptr

select  ancestor_ptr,so_ptr,sch_compl_date,avl_days,#test01.ttype,prod_code, lead_time,round(sum(sqmt/DATA0015.ppc_f0_value*(1+(layers/2-1)*DATA0015.ppc_f1_value)+(1+(layers/2-1)*DATA0015.ppc_f2_value)*DATA0015.ppc_f3_value),0) as sys_qty
into #test02
from #test01,DATA0015
WHERE Data0015.RKEY=@vwhse_ptr or (@vwhse_ptr=0 and Data0015.RKEY in (select MIN(rkey) as rkey from Data0015 where prod_flag=1))
group by ancestor_ptr,sch_compl_date,avl_days, lead_time,#test01.ttype,prod_code,so_ptr
order by ancestor_ptr,sch_compl_date,avl_days, lead_time,#test01.ttype,prod_code,so_ptr

select sch_compl_date as vdate,sum(sys_qty) as sys_qty,cast(0 as float) as result_qty,count(ancestor_ptr) as ord_num
into #test03
from #test02 group by sch_compl_date

select so_ptr,sch_compl_date as vdate,ttype,prod_code, lead_time,avl_days,sys_qty
--,cast(0 as float) as result_qty,cast(0 as float) as trans_in_qty,cast(0 as float) as trans_out_qty
into #test03_2
from #test02


create table #data01(tdate datetime)


while @v1<@v2
begin
	insert into #data01(tdate ) values(cast(@v1 as datetime))
    set @v1=@v1+1
end

select tdate,#test03.sys_qty,#test03.result_qty,cast(0 as float) as trans_in_qty,cast(0 as float) as trans_out_qty,cast('' as varchar(2000)) as remark,#test03.ord_num
into #test04
from #data01 left join #test03 on #test03.vdate=#data01.tdate
order by #data01.tdate 

declare mycursor1 cursor for select tdate,sys_qty
	from #test04 
	order by tdate desc
open mycursor1

declare @vobj float
declare @vobj2 float

--select @vobj=ppc_bal_value,@vobj2=ppc_bal_value2 from Data0015 where RKEY=@vwhse_ptr
--20131022 lll
select @vobj=ppc_bal_value,@vobj2=ppc_bal_value2 from Data0015 where (RKEY=@vwhse_ptr) or (@vwhse_ptr=0 and Data0015.RKEY in (select MIN(rkey) as rkey from Data0015 where prod_flag=1)) 


declare @vday datetime
declare @vsys_qty float

declare @vtrans_qty float /*后面一天向前一天转移的订单数量*/
declare @vtrans_qty_last float /*后面一天向前一天转移的订单数量*/
set @vtrans_qty=0

fetch next from mycursor1 into @vday,@vsys_qty
while @@fetch_status=0
begin
	if @vsys_qty<=@vobj 
	begin
		update #test04 set result_qty=@vsys_qty+trans_in_qty,trans_out_qty=0 where tdate=@vday
	end else
    begin	
		set @vtrans_qty=@vsys_qty-@vobj /*@vtrans_qty：需要前移的数量*/
		set @vtrans_qty_last=0
		----------------------检查有多少数量可以前移，能够前移的就全部前移
	
		declare mycursor2 cursor for select vdate,sys_qty,avl_days from #test03_2 where vdate=@vday and avl_days>0
			order by avl_days desc
		open mycursor2

		declare @vday2 datetime
		declare @vsys_qty2 float
		declare @vavl_days float
		fetch next from mycursor2 into @vday2,@vsys_qty2,@vavl_days
		while (@@fetch_status=0) and (@vtrans_qty>0)
		begin
			if @vsys_qty2<@vtrans_qty /*当前记录可以全部前移*/
			begin
				declare mycursor3 cursor for select tdate,sys_qty,trans_in_qty
					from #test04 where trans_in_qty+sys_qty<@vobj and tdate<@vday and tdate>=@vday-@vavl_days
					order by tdate desc
				open mycursor3
				declare @vday3 datetime
				declare @vsys_qty3 float
				declare @vtrans_in_qty float
				fetch next from mycursor3 into @vday3,@vsys_qty3,@vtrans_in_qty
				while (@@fetch_status=0) and (@vtrans_qty>0)
				begin
					if @vobj-@vsys_qty3-@vtrans_in_qty>=@vsys_qty2 /*剩余空间足够插入当前转移的订单@vsys_qty2*/
					begin
						if @vsys_qty2>0
							update #test04 set trans_in_qty=trans_in_qty+@vsys_qty2,remark=rtrim(remark)+'['+substring(convert(varchar(10),@vday,101),1,5)+']'+cast(@vsys_qty2 as varchar(10))+';' where tdate=@vday3
						set @vtrans_qty=@vtrans_qty-@vsys_qty2
						set @vsys_qty2=0
					end else
					begin
						if  (@vobj-@vsys_qty3-@vtrans_in_qty)>0
							update #test04 set trans_in_qty=trans_in_qty+(@vobj-@vsys_qty3-@vtrans_in_qty),remark=rtrim(remark)+'['+substring(convert(varchar(10),@vday,101),1,5)+']'+cast((@vobj-@vsys_qty3-@vtrans_in_qty) as varchar(10))+';' where tdate=@vday3
						set @vtrans_qty=@vtrans_qty-(@vobj-@vsys_qty3-@vtrans_in_qty)
						set @vsys_qty2=@vsys_qty2-(@vobj-@vsys_qty3-@vtrans_in_qty)
					end
					fetch next from mycursor3 into @vday3,@vsys_qty3,@vtrans_in_qty
				end
				close mycursor3
				deallocate mycursor3
				/*排查之后现在@vtrans_qty为当前记录可转移但未能前移的数量*/
				update #test04 set result_qty=@vtrans_qty+@vobj,trans_out_qty=@vsys_qty+trans_in_qty-@vtrans_qty-@vobj where tdate=@vday
				--update #test03_2 set trans_out_qty=@vsys_qty-@vobj-@vtrans_qty-@vtrans_qty_last where vdate=@vday and avl_days=@vavl_days
				set @vtrans_qty_last=@vtrans_qty_last+@vsys_qty-@vobj-@vtrans_qty-@vtrans_qty_last
			end else /*当前记录只需要转移@vtrans_qty*/
			begin
				declare mycursor3 cursor for select tdate,sys_qty,trans_in_qty
					from #test04 where trans_in_qty+sys_qty<@vobj and tdate<@vday and tdate>=@vday-@vavl_days
					order by tdate desc
				open mycursor3
				declare @vday4 datetime
				declare @vsys_qty4 float
				declare @vtrans_in_qty2 float
				fetch next from mycursor3 into @vday4,@vsys_qty4,@vtrans_in_qty2
				while (@@fetch_status=0) and (@vtrans_qty>0)
				begin
					if @vobj-@vsys_qty4-@vtrans_in_qty2>=@vtrans_qty /*剩余空间足够插入当前转移的订单@vtrans_qty*/
					begin
						update #test04 set trans_in_qty=trans_in_qty+@vtrans_qty,remark=rtrim(remark)+'['+substring(convert(varchar(10),@vday,101),1,5)+']'+cast(@vtrans_qty as varchar(10))+';'where tdate=@vday4
						--update #test03_2 set trans_in_qty=trans_in_qty+@vtrans_qty where vdate=@vday4  and avl_days=@vavl_days
						set @vtrans_qty=0
					end else
					begin
						update #test04 set trans_in_qty=trans_in_qty+(@vobj-@vsys_qty4-@vtrans_in_qty2),remark=rtrim(remark)+'['+substring(convert(varchar(10),@vday,101),1,5)+']'+cast((@vobj-@vsys_qty4-@vtrans_in_qty2) as varchar(10))+';' where tdate=@vday4
						--update #test03_2 set trans_in_qty=trans_in_qty+@vtrans_qty where vdate=@vday4 and avl_days=@vavl_days
						set @vtrans_qty=@vtrans_qty-(@vobj-@vsys_qty4-@vtrans_in_qty2)
					end
					fetch next from mycursor3 into @vday4,@vsys_qty4,@vtrans_in_qty2
				end
				close mycursor3
				deallocate mycursor3
				/*排查之后现在@vtrans_qty为当前记录可转移但未能前移的数量*/
				update #test04 set result_qty=@vtrans_qty+@vobj,trans_out_qty=@vsys_qty+trans_in_qty-@vtrans_qty-@vobj where tdate=@vday
				--update #test03_2 set trans_out_qty=@vsys_qty-@vtrans_qty-@vobj-@vtrans_qty_last where vdate=@vday and avl_days=@vavl_days
				set @vtrans_qty_last=@vtrans_qty_last+@vsys_qty-@vtrans_qty-@vobj-@vtrans_qty_last
			end
			fetch next from mycursor2 into @vday2,@vsys_qty2,@vavl_days
		end
		close mycursor2
		deallocate mycursor2
	end
	
	fetch next from mycursor1 into @vday,@vsys_qty
end	
close mycursor1
deallocate mycursor1

if @vptr=0 
select sys_qty +trans_in_qty -trans_out_qty as result_qty,*,@vobj as obj,@vobj2 as obj2,
@vobj-(isnull(sys_qty,0) +isnull(trans_in_qty,0) -isnull(trans_out_qty,0))  as diff from #test04  where tdate>=@vdate1 and tdate<=@vdate2

if @vptr=1
begin
	if @vsoptr=0
	begin
		SELECT #TEST03_2.*,DATA0060.SALES_ORDER,DATA0050.CUSTOMER_PART_NUMBER,DATA0050.LAYERS,CAST(DATA0360.QUANTITY AS FLOAT) AS PARTS_ORDERED,DATA0360.QUANTITY*DATA0050.UNIT_SQ AS SQMT
		FROM DATA0060,DATA0050,#TEST03_2,DATA0360
		WHERE  DATA0060.RKEY=#TEST03_2.SO_PTR
		AND DATA0060.CUST_PART_PTR=DATA0050.RKEY
		AND DATA0060.RKEY=DATA0360.SO_PTR
		AND #TEST03_2.VDATE>=@VDATE1 AND #TEST03_2.VDATE<=@VDATE2
		ORDER BY VDATE
	end
	
	if @vsoptr>0
	select #test03_2.lead_time,data0050.customer_part_number,data0050.layers,isnull(data0060.sch_date,data0060.ORIG_SCHED_SHIP_DATE) as sch_date ,data0360.quantity*data0050.unit_sq as sqmt,
	round((data0360.quantity*data0050.unit_sq/data0015.ppc_f0_value*(1+(data0050.layers/2-1)*data0015.ppc_f1_value)+(1+(data0050.layers/2-1)*data0015.ppc_f2_value)*data0015.ppc_f3_value),0) as sys_qty,
	cast(isnull(data0060.sch_date,data0060.ORIG_SCHED_SHIP_DATE)-#test03_2.lead_time-getdate() as float) as avl_days
	from data0060,data0050,data0025,data0008,data0015,#test03_2,data0360
	--where  data0060.rkey=@vsoptr and Data0015.RKEY=@vwhse_ptr  
    --20131022LLL 
    where  data0060.rkey=@vsoptr and ((Data0015.RKEY=@vwhse_ptr) or (@vwhse_ptr=0 and Data0015.RKEY in (select MIN(rkey) as rkey from Data0015 where prod_flag=1)))  
	
    and data0060.rkey=#test03_2.so_ptr  
	and data0060.cust_part_ptr=data0050.rkey
	and Data0060.RKEY=data0360.so_ptr
	and data0025.ancestor_ptr=data0050.rkey and data0025.parent_ptr=0
	and data0025.prod_code_ptr=data0008.rkey

end
drop table #data01 drop table #test00 drop table #test01 drop table #test02 drop table #test03  drop table #test04

go
