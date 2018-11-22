create PROCEDURE ep404;3 -- 计算按报废缺陷--总报废数量
	@vdate1 varchar(30) ,--查询日期
    @vdate2 varchar(30) , --查询日期
    @param2 int, --统计单位
    @param3 varchar(30)='%', --本厂编号
    @param4 varchar(30)='%', --客户型号
    @param5 varchar(8)='%',   --版本号
    @param6 varchar(12)='%',   --订单号
    @Rject1 int=0, --报废原因
    @Factory_Ptr int --工厂指针
with ENCRYPTION
AS  --在线报废
select a.REJECT_DESCRIPTION,a.parameter_desc,sum(a.sum_QTY_ORG_REJ)sum_QTY_ORG_REJ,sum(a.ca)ca,sum(ca1)ca1 
from 
  (SELECT Data0039.REJECT_DESCRIPTION,Data0278.parameter_desc,sum(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)) as sum_QTY_ORG_REJ,
  sum(case when (data0047.parameter_value is null ) then '0'
    else case when data0278.prod_unit_base='U' then round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)/data0047.parameter_value,2) 
      else round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)*data0047.parameter_value,2) end  end ) as ca,
  (select sum(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4))
     FROM Data0058 inner JOIN
       Data0006 ON Data0058.WO_PTR = Data0006.RKEY inner JOIN
       Data0039 ON Data0058.REJECT_PTR = Data0039.RKEY left JOIN
       Data0025 ON Data0006.BOM_PTR = Data0025.RKEY   inner JOIN
       Data0050 ON Data0025.ANCESTOR_PTR = Data0050.RKEY inner JOIN
       Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER inner JOIN
       Data0278 ON Data0047.PARAMETER_PTR = Data0278.RKEY  and data0278.rkey=@param2
     where data0058.tdatetime>=@vdate1 and data0058.tdatetime<=@vdate2
       and data0050.customer_part_number like @param3 
       and data0050.cp_rev like @param5
       and data0058.reject_ptr <>@Rject1
       and (Data0006.whouse_ptr=@Factory_Ptr or @Factory_Ptr=0)
       and Data0039.spec_type=0 ) as ca1
FROM Data0058 inner JOIN
     Data0006 ON Data0058.WO_PTR = Data0006.RKEY 
     left join data0060 on Data0006.SO_PTR=data0060.rkey --加订单号LLL 20120823 
     inner JOIN
     Data0039 ON Data0058.REJECT_PTR = Data0039.RKEY inner JOIN
     Data0025 ON Data0006.BOM_PTR = Data0025.RKEY   inner JOIN
     Data0050 ON Data0025.ANCESTOR_PTR = Data0050.RKEY inner JOIN
     Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER inner JOIN
     Data0278 ON Data0047.PARAMETER_PTR = Data0278.RKEY  and data0278.rkey=@param2  
     
where data0058.tdatetime>=@vdate1 
  and data0058.tdatetime<=@vdate2
  and data0050.customer_part_number like @param3 
  and data0050.cp_rev like @param5
  and data0058.reject_ptr <>@Rject1
  and (Data0006.whouse_ptr=@Factory_Ptr or @Factory_Ptr=0)
  and Data0039.spec_type=0  
  and data0060.sales_order like @param6      --加订单号 LLL 20120823 
group by data0039.REJECT_DESCRIPTION,Data0278.parameter_desc

union all  --重检报废
select data0039.REJECT_DESCRIPTION,Data0278.parameter_desc,sum(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)) as sum_qty_org_rej,
  sum(case when (data0047.parameter_value is null ) then '0'
    else case when data0278.prod_unit_base='U' then round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)/data0047.parameter_value,2) 
      else round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)*data0047.parameter_value,2) end end ) as ca,0 as ca1
from data0058 inner join data0025 on data0058.d25_rkey=data0025.rkey  
  inner join data0050 on Data0025.ANCESTOR_PTR = Data0050.RKEY
  inner JOIN Data0039 ON Data0058.REJECT_PTR = Data0039.RKEY 
  inner JOIN Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER 
  inner JOIN Data0278 ON Data0047.PARAMETER_PTR = Data0278.RKEY  and data0278.rkey=@param2
where data0058.tdatetime>=@vdate1
  and data0058.tdatetime<=@vdate2
  and data0058.reject_ptr <>@Rject1
  and data0050.customer_part_number like @param3 
  and data0050.cp_rev like @param5
  and Data0039.spec_type=0
group by data0039.REJECT_DESCRIPTION,Data0278.parameter_desc

union all   --成品报废
select data0039.REJECT_DESCRIPTION,Data0278.parameter_desc,sum(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)) as sum_qty_org_rej,
  sum(case when (data0047.parameter_value is null ) then '0'
    else case when data0278.prod_unit_base='U' then round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)/data0047.parameter_value,2) 
      else round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)*data0047.parameter_value,2) end end ) as ca,0 as ca1
from data0058 inner join data0053 on data0058.d53_rkey=data0053.rkey inner join
  Data0039 ON Data0058.REJECT_PTR = Data0039.RKEY 
  inner join data0050 on data0053.cust_part_ptr=data0050.rkey
  left join data0025 on data0050.rkey=data0025.ANCESTOR_PTR  
  inner JOIN Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER 
  inner JOIN Data0278 ON Data0047.PARAMETER_PTR = Data0278.RKEY and data0278.rkey=@param2
where data0058.tdatetime>=@vdate1
  and data0058.tdatetime<=@vdate2
  and data0058.reject_ptr <>@Rject1
  and data0050.customer_part_number like @param3 
  and data0050.cp_rev like @param5
  and Data0039.spec_type=0
group by data0039.REJECT_DESCRIPTION,Data0278.parameter_desc)

a group by a.REJECT_DESCRIPTION,a.parameter_desc order by a.ca desc
GO