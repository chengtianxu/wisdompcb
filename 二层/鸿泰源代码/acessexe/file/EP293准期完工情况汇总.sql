--exec EP293;6 '04','SCT-TEST','2013-05-27','2013-05-28',2,1
--exec EP293;6 '04','SCT-TEST','2013-05-27','2013-05-28',2,1
--准交率查询  汇总信息
--CREATE  PROC [dbo].[EP293];6 (
declare 
@Vcustcode1 varchar(32)='04',
@Vcustcode2 varchar(32)='SCT-TEST',
@Vdate1 varchar(10)='2013-05-27',
@Vdate2 varchar(10)='2013-05-28',
@style  int=2, --产品类型 0是量产 1是样品 2是全部显示产品类型 3是全部不显示产品类型
@datetype int=1 --加日期类型 LLL 20121122 0 为回复交期，1为客户交期

--)AS

declare @str varchar(8000)

if @style=0 or @style=1
begin
select data0010.cust_code,data0050.customer_part_number,Data0009.SALES_REP_NAME,
	data0060.sales_order,Data0060.complete_status,
(case when Data0050.ttype=0 then '量产板' when Data0050.ttype=1 then '样板' end) as ttype,
/*(case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
  Data0060.sch_date else Data0060.EVALUE_DATE end) as sch_date*/
            --0 为回复交期，1为客户交期 LLL 20121122  
        case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end  as sch_date  
into #temp1
from data0060 left join data0010 on data0060.customer_ptr=data0010.rkey
	left join data0050 on data0060.cust_part_ptr=data0050.rkey
    left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey and data0012.rkey = 
 (select top 1 b.rkey from data0012 b , data0009 where (b.srep_ptr_1=Data0009.rkey 
     OR b.srep_ptr_2=Data0009.rkey OR b.srep_ptr_3=Data0009.rkey OR b.srep_ptr_4=Data0009.rkey OR 
     b.srep_ptr_5=Data0009.rkey ) and b.rkey=data0060.cust_ship_addr_ptr)
    left join Data0009 on Data0012.SREP_PTR_1 = Data0009.Rkey
where Data0060.so_style in (0,1) and Data0060.status in (1,4) and Data0050.ttype=@style
    and data0010.cust_code>=@Vcustcode1 and 
  data0010.cust_code<=@Vcustcode2
	/*and (case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else 
      Data0060.EVALUE_DATE end)>=@Vdate1
    and (case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else 
      Data0060.EVALUE_DATE end)<=@Vdate2*/
    and  (case @datetype when 0 then  --0 为回复交期，1为客户交期 LLL 20121122
     ( case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else  Data0060.EVALUE_DATE end )
     else (case when (Data0060.EVALUE_DATE is null)  then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end ) >=@Vdate1  
     and  (case @datetype when 0 then 
    (case when (Data0060.EVALUE_DATE is null) then Data0060.sch_date else Data0060.EVALUE_DATE end)
     else (case when (Data0060.EVALUE_DATE is null) then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end) <=@Vdate2      and  (case @datetype when 0 then  --0 为回复交期，1为客户交期 LLL 20121122
     ( case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else  Data0060.EVALUE_DATE end )
     else (case when (Data0060.EVALUE_DATE is null)  then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end ) >=@Vdate1  
     and  (case @datetype when 0 then 
    (case when (Data0060.EVALUE_DATE is null) then Data0060.sch_date else Data0060.EVALUE_DATE end)
     else (case when (Data0060.EVALUE_DATE is null) then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end) <=@Vdate2     
group by 
	data0010.cust_code,data0050.customer_part_number,Data0050.ttype,
	data0060.sales_order,Data0060.complete_status,Data0009.SALES_REP_NAME,
    /*(case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
      Data0060.sch_date else Data0060.EVALUE_DATE end)*/
       --0 为回复交期，1为客户交期 LLL 20121122  
      case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end   
order by data0060.sales_order


select  count(*) as count,ttype,sch_date
into #temp2
from #temp1 
group by sch_date,ttype

select  count(*) as count1,ttype,sch_date
into #temp3
from #temp1 where complete_status=1
group by sch_date,ttype

select  count(*) as count2,ttype,sch_date
into #temp4
from #temp1 where complete_status=0
group by ttype,sch_date


select @str='
select #temp2.ttype,#temp2.count as pc_must,
	#temp2.sch_date,
#temp3.count1 as pc_time,#temp4.count2 as pc_late
from #temp2 
    left join #temp3 on #temp2.sch_date=#temp3.sch_date  and #temp2.ttype=#temp3.ttype
    left join #temp4 on #temp2.sch_date=#temp4.sch_date  and #temp2.ttype=#temp4.ttype
order by #temp2.sch_date,#temp2.ttype '
end
if @style=2
begin
select data0010.cust_code,data0050.customer_part_number,Data0009.SALES_REP_NAME,
	data0060.sales_order,Data0060.complete_status,
(case when Data0050.ttype=0 then '量产板' when Data0050.ttype=1 then '样板' end) as ttype,
/*(case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
   Data0060.sch_date else Data0060.EVALUE_DATE end) as sch_date*/
         
           --0 为回复交期，1为客户交期 LLL 20121122  
        case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end  as sch_date 
      
   
into #temp5
from data0060 left join data0010 on data0060.customer_ptr=data0010.rkey
	left join data0050 on data0060.cust_part_ptr=data0050.rkey
    left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey and data0012.rkey = 
     (select top 1 b.rkey from data0012 b , data0009 where (b.srep_ptr_1=Data0009.rkey 
     OR b.srep_ptr_2=Data0009.rkey OR b.srep_ptr_3=Data0009.rkey OR b.srep_ptr_4=Data0009.rkey OR 
     b.srep_ptr_5=Data0009.rkey ) and b.rkey=data0060.cust_ship_addr_ptr)
    left join Data0009 on Data0012.SREP_PTR_1 = Data0009.Rkey
where Data0060.so_style in (0,1) and Data0060.status in (1,4) and 
    data0010.cust_code>=@Vcustcode1 and data0010.cust_code<=@Vcustcode2
	/*and (case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else 
      Data0060.EVALUE_DATE end)>=@Vdate1
    and (case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else 
      Data0060.EVALUE_DATE end)<=@Vdate2 */
    and  (case @datetype when 0 then  --0 为回复交期，1为客户交期 LLL 20121122
     ( case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else  Data0060.EVALUE_DATE end )
     else (case when (Data0060.EVALUE_DATE is null)  then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end ) >=@Vdate1  
     and  (case @datetype when 0 then 
    (case when (Data0060.EVALUE_DATE is null) then Data0060.sch_date else Data0060.EVALUE_DATE end)
     else (case when (Data0060.EVALUE_DATE is null) then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end) <=@Vdate2      and  (case @datetype when 0 then  --0 为回复交期，1为客户交期 LLL 20121122
     ( case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else  Data0060.EVALUE_DATE end )
     else (case when (Data0060.EVALUE_DATE is null)  then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end ) >=@Vdate1  
     and  (case @datetype when 0 then 
    (case when (Data0060.EVALUE_DATE is null) then Data0060.sch_date else Data0060.EVALUE_DATE end)
     else (case when (Data0060.EVALUE_DATE is null) then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end) <=@Vdate2   
      
group by 
	data0010.cust_code,data0050.customer_part_number,Data0050.ttype,
	data0060.sales_order,Data0060.complete_status,Data0009.SALES_REP_NAME,
   /* (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
      Data0060.sch_date else Data0060.EVALUE_DATE end)*/
     --0 为回复交期，1为客户交期 LLL 20121122  
      case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end    
order by data0060.sales_order

select  count(*) as count,ttype,sch_date
into #temp6
from #temp5 
group by sch_date,ttype

select  count(*) as count1,ttype,sch_date
into #temp7
from #temp5 where complete_status=1
group by sch_date,ttype

select  count(*) as count2,ttype,sch_date
into #temp8
from #temp5 where complete_status=0
group by ttype,sch_date


select @str='
select #temp6.ttype,#temp6.count as pc_must,#temp6.sch_date,
#temp7.count1 as pc_time,#temp8.count2 as pc_late
from #temp6 
    left join #temp7 on #temp6.sch_date=#temp7.sch_date  and #temp6.ttype=#temp7.ttype
    left join #temp8 on #temp6.sch_date=#temp8.sch_date  and #temp6.ttype=#temp8.ttype
order by #temp6.sch_date,#temp6.ttype '
end
if @style=3
begin
select data0010.cust_code,data0050.customer_part_number,Data0009.SALES_REP_NAME,
	data0060.sales_order,Data0060.complete_status,
/*(case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
   Data0060.sch_date else Data0060.EVALUE_DATE end) as sch_date */
              --0 为回复交期，1为客户交期 LLL 20121122  
        case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end  as sch_date 
      
into #temp9
from data0060 left join data0010 on data0060.customer_ptr=data0010.rkey
	left join data0050 on data0060.cust_part_ptr=data0050.rkey
    left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey and data0012.rkey =
  (select top 1 b.rkey from data0012 b , data0009 where (b.srep_ptr_1=Data0009.rkey 
    OR b.srep_ptr_2=Data0009.rkey OR b.srep_ptr_3=Data0009.rkey OR b.srep_ptr_4=Data0009.rkey OR 
      b.srep_ptr_5=Data0009.rkey ) and b.rkey=data0060.cust_ship_addr_ptr)
    left join Data0009 on Data0012.SREP_PTR_1 = Data0009.Rkey
where Data0060.so_style in (0,1) and Data0060.status in (1,4) and 
    data0010.cust_code>=@Vcustcode1 and data0010.cust_code<=@Vcustcode2 
    /*
	and (case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else 
      Data0060.EVALUE_DATE end)>=@Vdate1
    and (case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else 
      Data0060.EVALUE_DATE end)<=@Vdate2 */
    and  (case @datetype when 0 then  --0 为回复交期，1为客户交期 LLL 20121122
     ( case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else  Data0060.EVALUE_DATE end )
     else (case when (Data0060.EVALUE_DATE is null)  then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end ) >=@Vdate1  
     and  (case @datetype when 0 then 
    (case when (Data0060.EVALUE_DATE is null) then Data0060.sch_date else Data0060.EVALUE_DATE end)
     else (case when (Data0060.EVALUE_DATE is null) then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end) <=@Vdate2      and  (case @datetype when 0 then  --0 为回复交期，1为客户交期 LLL 20121122
     ( case when (Data0060.EVALUE_DATE is null)  then Data0060.SCH_DATE else  Data0060.EVALUE_DATE end )
     else (case when (Data0060.EVALUE_DATE is null)  then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end ) >=@Vdate1  
     and  (case @datetype when 0 then 
    (case when (Data0060.EVALUE_DATE is null) then Data0060.sch_date else Data0060.EVALUE_DATE end)
     else (case when (Data0060.EVALUE_DATE is null) then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end) <=@Vdate2    
group by 
	data0010.cust_code,data0050.customer_part_number,
	data0060.sales_order,Data0060.complete_status,Data0009.SALES_REP_NAME,
    /*(case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
     Data0060.sch_date else Data0060.EVALUE_DATE end)*/
           --0 为回复交期，1为客户交期 LLL 20121122  
      case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end  
order by data0060.sales_order

select  count(*) as count,sch_date
into #temp10
from #temp9 
group by sch_date

select  count(*) as count1,sch_date
into #temp11
from #temp9 where complete_status=1
group by sch_date

select  count(*) as count2,sch_date
into #temp12
from #temp9 where complete_status=0
group by sch_date


select @str='
select #temp10.count as pc_must,#temp10.sch_date,
#temp11.count1 as pc_time,#temp12.count2 as pc_late
from #temp10 
    left join #temp11 on #temp10.sch_date=#temp11.sch_date 
    left join #temp12 on #temp10.sch_date=#temp12.sch_date 
order by #temp10.sch_date '
end

exec(@str)
print @str
--drop table #temp1,#temp2,#temp3,#temp4,#temp5,#temp6,#temp7,#temp8,#temp9,#temp10,#temp11,#temp12

If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp1'))  drop table #tmp1
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp2'))  drop table #tmp2  
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp3'))  drop table #tmp3
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp4'))  drop table #tmp4  
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp5'))  drop table #tmp5 
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp6'))  drop table #tmp6 
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp7'))  drop table #tmp7 
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp8'))  drop table #tmp8 
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp9'))  drop table #tmp9 
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp10'))  drop table #tmp10
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp11'))  drop table #tmp11 
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp12'))  drop table #tmp12 

go