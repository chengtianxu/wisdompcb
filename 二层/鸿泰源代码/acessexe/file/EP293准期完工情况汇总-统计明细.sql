--exec test1 '04','SCT-TEST','2013-05-27','2013-05-28',2,1
declare 
@Vcustcode1 varchar(32)='04',
@Vcustcode2 varchar(32)='SCT-TEST',
@Vdate1 varchar(10)='2013-05-27',
@Vdate2 varchar(10)='2013-05-28',
--@style  int=2, --产品类型 0是量产 1是样品 2是全部显示产品类型 3是全部不显示产品类型
@datetype int=1 --加日期类型 LLL 20121122 0 为回复交期，1为客户交期

select data0010.cust_code,data0050.customer_part_number,Data0009.SALES_REP_NAME,
	data0060.sales_order,Data0060.complete_status,
(case when Data0050.ttype=0 then '量产板' when Data0050.ttype=1 then '样板' end) as ttype,

         
           --0 为回复交期，1为客户交期 LLL 20121122  
        case @datetype when 0 then  (case when (Data0060.EVALUE_DATE is null) or (Data0060.sch_date<Data0060.MODF_DATE) then 
        Data0060.sch_date else Data0060.EVALUE_DATE end)
      else
      (case when (Data0060.EVALUE_DATE is null) or (Data0060.ORIG_REQUEST_DATE<Data0060.MODF_DATE) then 
        Data0060.ORIG_REQUEST_DATE else Data0060.EVALUE_DATE end)
      end  as sch_date 
      
   
--into #temp5
from data0060 left join data0010 on data0060.customer_ptr=data0010.rkey
	left join data0050 on data0060.cust_part_ptr=data0050.rkey
    left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey and data0012.rkey = 
     (select top 1 b.rkey from data0012 b , data0009 where (b.srep_ptr_1=Data0009.rkey 
     OR b.srep_ptr_2=Data0009.rkey OR b.srep_ptr_3=Data0009.rkey OR b.srep_ptr_4=Data0009.rkey OR 
     b.srep_ptr_5=Data0009.rkey ) and b.rkey=data0060.cust_ship_addr_ptr)
    left join Data0009 on Data0012.SREP_PTR_1 = Data0009.Rkey
where 
   Data0060.so_style in (0,1) --  0正式订单 1免费订单 2 退货订单 3 备料订单 4 外包订单 5预付费订单 6 内部订单 7 临时订单 8 寄售订单
   and Data0060.status in (1,4) --1有效   2  暂缓 3  关闭 4  完成 5 取消 
   and data0010.cust_code>=@Vcustcode1 and data0010.cust_code<=@Vcustcode2
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
order by sch_date,data0060.sales_order
