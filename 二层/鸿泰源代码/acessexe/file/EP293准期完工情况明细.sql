exec sp_executesql N'declare @dt varchar(4)
declare @Mjflag int 
declare @Jmg varchar(4),@mmg varchar(4)
declare @datetype int

set @datetype=@P1  --0为回复交期，1为客户交期

select @dt=EVALUE_DATE_time  from data0192 --考核交期截止时间

select @Mjflag=Search_Unit_flag from data0195 --0为平方米，1为平方尺

if @Mjflag=0  --0为平方米
begin
set @Jmg=''L''
set @mmg=''D''
end 
else  --1为平方尺
begin
set @Jmg=''K''
set @mmg=''E''
end 

select data0053.mfg_date,
data0060.sales_order,Data0053.QUANTITY
into #temp1
from Data0053
      left JOIN Data0006 on Data0053.WORK_ORDER_PTR = Data0006.RKEY
      left JOIN data0492 ON Data0006.CUT_NO=data0492.CUT_NO
      left join Data0060 on Data0492.SO_NO=Data0060.SALES_ORDER 

----指派数量
select Data0060.sales_order,sum(Data0052.quan_shp) as qty2
into #temp2
from Data0064 left join Data0052 on data0052.SO_SHP_PTR=data0064.rkey
   left join Data0053 on data0052.data0053_ptr=data0053.rkey
   left join Data0060 on Data0064.so_ptr=Data0060.Rkey 
where Data0053.mfg_date<=DATEADD(n,cast(right(@dt,2) as integer),DATEADD(Hh,cast(left(@dt,2) as integer),
--(case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then Data0060.sch_date else Data0060.EVALUE_DATE end))) 
   (case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end )))  
      
group by Data0060.sales_order

select Data0060.rkey,data0060.cust_part_ptr,data0010.cust_code,data0050.customer_part_number,Data0009.SALES_REP_NAME,Data0050.cp_rev1,
	data0060.sales_order,Data0097.PO_NUMBER,Data0059.customer_part_desc,Data0060.parts_ordered,Data0050.cp_rev,
	    case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end  as sch_date, 
      
  (case data0050.ttype when 0 then ''量产'' when 1 then ''样板'' when 2  then ''其它''  else '''' end) as ttype50,data0050.ttype as D50type,
(case data0060.ttype when 0 then ''量产'' when 1 then ''样板'' when 2  then ''其它''  else '''' end) as ttype60,
   (select isnull(sum(isnull(Data0053.qty_on_hand,0)),0) as qty1 
from Data0053 left join Data0050 a on Data0053.CUST_PART_PTR=a.rkey 
     where a.customer_part_number=Data0050.customer_part_number  and  a.cp_rev1=Data0050.cp_rev1 and
Data0053.mfg_date<=DATEADD(n,cast(right(@dt,2) as integer),
--DATEADD(Hh,cast(left(@dt,2) as integer),Data0060.sch_date )) ) as qty1 ,
DATEADD(Hh,cast(left(@dt,2) as integer),(case @datetype when 0 then 
(case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then Data0060.sch_date else Data0060.EVALUE_DATE end)
 else (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end ))) ) as qty1,
isnull(#temp2.qty2,0) as qty2,
    (case when Data0060.complete_status=0 then ''否''  when Data0060.complete_status=1 then ''是'' end) as status,Data0060.complete_status
,case isnull(d0047_t1.parameter_value,0) when 0 then ''*''+ cast ( convert(numeric(30,8), data0050.unit_sq) as varchar)   else cast ( convert(numeric(30,8), d0047_t1.PARAMETER_VALUE) as varchar) end as Unit_JMj --处理科学计数法的数值
,case isnull(d0047_t2.parameter_value,0) when 0 then ''*''+ cast ( convert(numeric(30,8), data0050.unit_sq) as varchar)   else  cast ( convert(numeric(30,8), d0047_t1.PARAMETER_VALUE) as varchar) end as Unit_MMj 
,round(case Data0060.complete_status when 0 then  case isnull(d0047_t1.parameter_value,0) when 0 then convert(numeric(30,8), data0050.unit_sq) else  convert(numeric(30,8), d0047_t1.parameter_value) end  * parts_ordered  
 else 0 end,4)  as TqMj

from data0060 left join data0010 on data0060.customer_ptr=data0010.rkey
	left join data0050 on data0060.cust_part_ptr=data0050.rkey
	left join data0492 on data0060.sales_order=data0492.so_no
	left join data0102 on Data0102.SALES_ORDER_PTR = Data0060.RKEY
    left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey and data0012.rkey = ( select top 1 b.rkey from data0012 b , data0009 where (b.srep_ptr_1=Data0009.rkey 
     OR b.srep_ptr_2=Data0009.rkey OR b.srep_ptr_3=Data0009.rkey OR b.srep_ptr_4=Data0009.rkey OR b.srep_ptr_5=Data0009.rkey )
     and b.rkey=data0060.cust_ship_addr_ptr)
     left join Data0009 on Data0102.SALES_REP_PTR=Data0009.rkey

	left join data0006 on data0006.cut_no=data0492.cut_no
	left join data0015 on data0060.whse_ptr=data0015.rkey
	left join data0053 on data0053.work_order_ptr=data0006.rkey
left join data0025 on (data0060.cust_part_ptr=data0025.ancestor_ptr and data0025.parent_ptr=0)
left join data0059 on Data0059.cust_part_ptr= Data0050.rkey and Data0059.customer_ptr=Data0010.rkey
left join Data0097 on Data0060.purchase_order_ptr=Data0097.rkey
left join
		(select source_pointer,parameter_ptr,parameter_value,parameter_name 
		from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey
		where upper(spec_rkey)=@Jmg) as d0047_t1 on d0047_t1.source_pointer=data0025.rkey  --净面积
left join
		(select source_pointer,parameter_ptr,parameter_value,parameter_name 
		from data0047 inner join data0278 on data0047.parameter_ptr=data0278.rkey
		where upper(spec_rkey)=@mmg) as d0047_t2 on d0047_t2.source_pointer=data0025.rkey  --毛面积
left join #temp2 on Data0060.sales_order= #temp2.sales_order
where Data0060.so_style in (0,1) and Data0060.status in (1,4) 
   and Data0102.SALES_REP_PTR=(select top 1 SALES_REP_PTR from data0102 where  Data0102.SALES_ORDER_PTR = Data0060.RKEY   order by CREDIT desc,RKEY )  --取分配比例最高的销售代表

 and data0010.cust_code>=@P2 and data0010.cust_code<=@P3
   and  (case @datetype when 0 then 
    (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then Data0060.sch_date else Data0060.EVALUE_DATE end)
    else (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end ) >=@P4    
     and  (case @datetype when 0 then 
    (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then Data0060.sch_date else Data0060.EVALUE_DATE end)
    else (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end) end) <=@P5 
group by 
	Data0060.rkey,data0010.cust_code,data0050.customer_part_number,Data0060.complete_status,Data0097.PO_NUMBER,Data0050.cp_rev1,Data0050.cp_rev,
	data0060.sales_order,Data0009.SALES_REP_NAME,Data0059.customer_part_desc,data0060.cust_part_ptr,
    Data0060.fob,Data0060.parts_ordered,#temp2.qty2,data0050.RKEY,data0060.EVALUE_DATE,data0060.MODF_DATE,data0050.ttype,data0060.ttype
    ,d0047_t1.parameter_value,d0047_t2.parameter_value,data0050.unit_sq,
    --0 为回复交期，1为客户交期 LLL 20121122  
      case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end  
order by data0050.customer_part_number,Data0060.sales_order

drop table #temp1,#temp2
',N'@P1 varchar(16),@P2 varchar(2),@P3 varchar(8),@P4 varchar(10),@P5 varchar(10)','1','04','SCT-TEST','2013-05-27','2013-05-28'