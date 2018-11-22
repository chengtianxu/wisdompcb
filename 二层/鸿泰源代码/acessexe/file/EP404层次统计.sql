EP404层次统计
CREATE PROCEDURE ep404;8 -- 计算按层数
	@vdate1 varchar(30) ,--查询日期
        @vdate2 varchar(30) , --查询日期
        @param2 int, --统计单位
        @Rject1 int=0, --报废原因
        @param3 varchar(30)='%', --本厂编号
        --@param4 varchar(30)='%', --客户型号
        @param5 varchar(8)='%',   --版本号
        @param6 varchar(12)='%'    --订单号
       -- @Factory_Ptr int --工厂指针
with ENCRYPTION
as
begin
   select a.layers,sum(a.sum_QTY_ORG_REJ)sum_QTY_ORG_REJ,sum(a.ca)ca,sum(a.QTY_PROD)QTY_PROD,
     cast(round(sum(isnull(a.ca,0))/(sum(isnull(a.qty_prod,0))+sum(isnull(a.ca,0)))*100,2) as varchar)+'%' as rate
     --sum(isnull(a.ca,0))/ (case when sum(isnull(a.qty_prod,0))=0 then '1'+sum(isnull(a.ca,0))
     --else sum(isnull(a.qty_prod,0))+sum(isnull(a.ca,0)) end)*100 as rate
   from 
       (SELECT Data0050.layers,sum(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)) as sum_QTY_ORG_REJ,
         sum(case when (data0047.parameter_value is null ) then '0'
                  else case when data0278.prod_unit_base='U' then round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)/data0047.parameter_value,3) 
                            else round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)*data0047.parameter_value,3)
                       end 
             end ) as ca,0 as QTY_PROD
      FROM Data0058 inner JOIN
       Data0006 ON Data0058.WO_PTR = Data0006.RKEY  
        left join data0060 on Data0006.SO_PTR=data0060.rkey --加订单号LLL 20120823 
      inner JOIN
       Data0025 ON Data0006.BOM_PTR = Data0025.RKEY    inner JOIN
       Data0050 ON Data0025.ANCESTOR_PTR = Data0050.RKEY inner JOIN
       Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER inner JOIN
       Data0278 ON Data0047.PARAMETER_PTR = Data0278.RKEY  
            and data0278.rkey=@param2
       left join Data0039 on Data0058.REJECT_PTR = Data0039.RKEY
      where data0058.tdatetime>=@vdate1
       and data0058.tdatetime<=@vdate2
       and data0058.reject_ptr <>@Rject1
       and data0050.customer_part_number like @param3 
       and data0050.cp_rev like @param5 
       
      and data0060.sales_order like @param6      --加订单号 LLL 20120823 
       and Data0039.spec_type=0
       group by Data0050.layers
    union all
      select data0050.layers,sum(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)) as sum_qty_org_rej,
       sum(case when (data0047.parameter_value is null ) then '0'
                  else case when data0278.prod_unit_base='U' then round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)/data0047.parameter_value,3) 
                            else round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)*data0047.parameter_value,3)
                       end 
             end ) as ca,0 as QTY_PROD
     from data0058 inner join data0025 on data0058.d25_rkey=data0025.rkey  
       inner join data0050 on Data0025.ANCESTOR_PTR = Data0050.RKEY
       inner JOIN Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER 
       inner JOIN Data0278 ON Data0047.PARAMETER_PTR = Data0278.RKEY  
            and data0278.rkey=@param2
       left join Data0039 on Data0058.REJECT_PTR = Data0039.RKEY
       where data0058.tdatetime>=@vdate1
       and data0058.tdatetime<=@vdate2
       and data0058.reject_ptr <>@Rject1
       and data0050.customer_part_number like @param3 
       and data0050.cp_rev like @param5
       and Data0039.spec_type=0
       group by Data0050.layers
   union all
    select data0050.layers,sum(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)) as sum_qty_org_rej,
       sum(case when (data0047.parameter_value is null ) then '0'
                  else case when data0278.prod_unit_base='U' then round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)/data0047.parameter_value,3) 
                            else round(round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4)*data0047.parameter_value,3)
                       end 
             end ) as ca,0 as QTY_PROD
    from data0058 inner join data0053 on data0058.d53_rkey=data0053.rkey
       inner join data0050 on data0053.cust_part_ptr=data0050.rkey
       left join data0025 on data0050.rkey=data0025.ANCESTOR_PTR  
       inner JOIN Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER 
       inner JOIN Data0278 ON Data0047.PARAMETER_PTR = Data0278.RKEY  
            and data0278.rkey=@param2
       left join Data0039 on Data0058.REJECT_PTR = Data0039.RKEY
        where data0058.tdatetime>=@vdate1
       and data0058.tdatetime<=@vdate2
       and data0058.reject_ptr <>@Rject1
       and data0050.customer_part_number like @param3 
       and data0050.cp_rev like @param5
       and Data0039.spec_type=0
       group by Data0050.layers
   union all
     select data0050.layers,0 as sum_qty_org_rej,0 as ca,
    sum(case when (data0278.prod_unit_base='U') then round(Data0048.QTY_PROD/data0047.parameter_value,3)         
     else round(Data0048.QTY_PROD*data0047.parameter_value,3) end) as QTY_PROD 
    from data0048 inner join
      Data0034 a ON Data0048.fm_dept_ptr = a.RKEY left JOIN
      data0034 on a.dept_ptr=data0034.rkey inner join 
      data0006 on data0048.wo_ptr=data0006.rkey 
       left join data0060 on Data0006.SO_PTR=data0060.rkey --加订单号LLL 20120823 
      left join 
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY INNER JOIN
      Data0050 ON Data0025.ANCESTOR_PTR = Data0050.RKEY INNER JOIN
      Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER inner JOIN
      Data0278 ON Data0047.PARAMETER_PTR = Data0278.RKEY  
            and data0278.rkey=@param2
      where data0048.outtime>=@vdate1 
      and data0048.outtime<=@vdate2
      and data0050.customer_part_number like @param3 
      and data0050.cp_rev like @param5
      -- 
      and (data0034.dept_name like 'FQC%' ) and Data0048.wtype=0
      and data0060.sales_order like @param6      --加订单号 LLL 20120823  
      group by data0034.dept_name,data0050.layers)a group by a.layers
   order by a.layers
end
GO
