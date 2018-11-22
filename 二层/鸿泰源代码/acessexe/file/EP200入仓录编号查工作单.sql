--EP200查找本厂编号
create PROCEDURE EP200;3 
  @out_source int,
  @flag int,
  @factory int,  --工厂指针,全部是为0 20130815 LLL 
  @isfactory_50 int  --是否包括50表的工厂指定 1为不指定,0为指定20130815 LLL 
WITH ENCRYPTION
AS

declare @strsql varchar(8000) 
if @flag = 0
begin
 --20120829应用回原来的  
 
set @strsql =' 
    select distinct Data0050.RKEY, Data0050.CUSTOMER_PART_NUMBER, isnull(data0050.REPORT_UNIT_VALUE1,0) as REPORT_UNIT_VALUE1, 
      Data0050.CP_REV,data0059.customer_part_desc,data0050.ttype,data0050.CATALOG_NUMBER,data0015.ABBR_NAME  
    from data0050 inner join data0059 
    on data0059.cust_part_ptr=data0050.rkey   
      and data0050.rkey in (select ancestor_ptr from data0025 
        where parent_ptr=0 and rkey in (select bom_ptr from data0006 
    where data0006.prod_status=3 and
      rkey in (select wo_ptr from data0056 where 
        data0056.qty_backlog>0 
        and dept_ptr in (select rkey from data0034 where fgstock_flag=1 )--这道工序要有入库标志szmeitan
         )))   
        left join data0015 on data0050.whse_ptr=data0015.rkey  '
     
  if @factory <>0 
   begin
     if @isfactory_50=1  --不指定包括本工厂和50表工厂指什为空的数据  20130815 LLL 
     set @strsql = @strsql + ' where (data0050.whse_ptr is null or data0050.whse_ptr='+ convert(varchar(20),@factory) +')' --加工厂指针 20130815 LLL 
     else 
     set @strsql = @strsql + ' where (data0050.whse_ptr='+ convert(varchar(20),@factory) +')' --加工厂指针 20130815 LLL 
   end   
 
    set @strsql = @strsql + '  ORDER BY Data0050.CUSTOMER_PART_NUMBER ' 
   
  
print(@strsql)
exec(@strsql)

end
else
begin
set @strsql =' 
 select distinct Data0050.RKEY, Data0050.CUSTOMER_PART_NUMBER, 
      Data0050.CP_REV,data0059.customer_part_desc,data0050.ttype,Data0050.CATALOG_NUMBER,data0015.ABBR_NAME  
    from data0050 inner join data0059 
    on data0059.cust_part_ptr=data0050.rkey
      and data0050.rkey in (select ancestor_ptr from data0025 
        where parent_ptr=0 and rkey in (select bom_ptr from data0006 
      where data0006.prod_status=3 and
      rkey in (select wo_ptr from data0056 where 
        data0056.qty_backlog>0 and dept_ptr in 
         -- (select rkey from data0034 where fgstock_flag=1 and out_source= @out_source) )))  
          (select rkey from data0034 where fgstock_flag=1 and out_source= '+ convert(varchar(20),@out_source) +') )))     
  
           left join data0015 on data0050.whse_ptr=data0015.rkey  '
          
   if @factory <>0
   begin
     if @isfactory_50=1  --不指定包括本工厂和50表工厂指什为空的数据  20130815 LLL 
     set @strsql = @strsql + ' where (data0050.whse_ptr is null or data0050.whse_ptr='+ convert(varchar(20),@factory) +')' --加工厂指针 20130815 LLL 
     else 
     set @strsql = @strsql + ' where ( data0050.whse_ptr='+ convert(varchar(20),@factory) +')' --加工厂指针 20130815 LLL 
   end   
         
    set @strsql = @strsql + '  ORDER BY Data0050.CUSTOMER_PART_NUMBER ' 
   
 
print(@strsql)
exec(@strsql)
   
end
go


--exec EP200;1 10623,1,0 EP200入仓录编号查工作单
CREATE PROCEDURE EP200;1
@vptr2 int,
@out_source int,
@flag int
WITH ENCRYPTION
AS

declare @ReworkIn_flag int 

set @ReworkIn_flag=(select ReworkIn_flag from data0195) 

if @flag = 0  
begin
  if @ReworkIn_flag=0 --加返工单是否可以入仓的开关，ReworkIn_flag默认为0，不可入仓，1-可入仓 20130221 LLL
  begin 
  SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr,
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels,data0050.tax_flag,
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW, 
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53,
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60 
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING   --增加订单销售类型 LLL 20121008 
      ,isnull(data0060.PARTS_ORDERED*data0010.Forkplate_rate/100,0) as Forkplate_qty,data0010.Forkplate_rate,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty --增加叉板数及叉板比例 LLL 20121207 
      ,data0059.customer_part_desc,Dsum59.parts_margin2
      ,sumPo60.po_number,isnull(sumPo60.PO_PARTS_ORDERED*data0010.Forkplate_rate/100,0) as PO_Forkplate_qty --加该客户订单下允许叉板比例20130715 LLL   
      FROM Data0056 INNER JOIN  
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc   ) --53set净重20130125 LLL  
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order 
       left join data0010 on data0060.CUSTOMER_PTR=data0010.rkey 
      left join data0059 on data0060.CUSTOMER_PTR=data0059.CUSTOMER_PTR and data0060.CUST_PART_PTR=data0059.CUST_PART_PTR --20130615  
      left join 
      ( select  data0059.rkey ,isnull(sum(Data0060.PARTS_ORDERED-Data0060.PARTS_SHIPPED+Data0060.quan_to_re_delivery-Data0060.returned_ship+part_ovsh),0) as parts_margin2 from data0060  
      left join data0059 on data0060.CUSTOMER_PTR=data0059.CUSTOMER_PTR and data0060.CUST_PART_PTR=data0059.CUST_PART_PTR where data0060.status=1 
       group by data0059.rkey, data0059.rkey ) as Dsum59 on data0059.rkey=Dsum59.rkey --20130615  

      left join 
    ( select  data0097.rkey as rkey_97,data0097.po_number,isnull(sum(data0060.PARTS_ORDERED),0) as PO_PARTS_ORDERED from data0060  
      left join data0097  on data0060.PURCHASE_ORDER_PTR=data0097.rkey  
       group by data0097.rkey,data0097.po_number  ) as sumPo60  on sumPo60.rkey_97=data0060.PURCHASE_ORDER_PTR --加该客户订单下允许叉板比例20130715 LLL 


      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod)
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no  
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
  WHERE  (Data0025.ANCESTOR_PTR = @vptr2)
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 )  
    and DATA0056.WTYPE<>2  --过滤在线返工状态 20120816 LLL
  ORDER BY Data0006.WORK_ORDER_NUMBER
  end
  else --1-可入仓
  begin 
    SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr,
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels,data0050.tax_flag, 
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW, 
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53,
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60 
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING   --增加订单销售类型 LLL 20121008 
     ,isnull(data0060.PARTS_ORDERED*data0010.Forkplate_rate/100,0) as Forkplate_qty,data0010.Forkplate_rate,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty --增加叉板数及叉板比例 LLL 20121207 
        ,data0059.customer_part_desc,Dsum59.parts_margin2 
       ,sumPo60.po_number,isnull(sumPo60.PO_PARTS_ORDERED*data0010.Forkplate_rate/100,0) as PO_Forkplate_qty --加该客户订单下允许叉板比例20130715 LLL     
      FROM Data0056 INNER JOIN  
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc   ) --53set净重20130125 LLL  
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order
      left join data0010 on data0060.CUSTOMER_PTR=data0010.rkey 
       left join data0059 on data0060.CUSTOMER_PTR=data0059.CUSTOMER_PTR and data0060.CUST_PART_PTR=data0059.CUST_PART_PTR --20130615  
      left join 
      ( select  data0059.rkey ,isnull(sum(Data0060.PARTS_ORDERED-Data0060.PARTS_SHIPPED+Data0060.quan_to_re_delivery-Data0060.returned_ship+part_ovsh),0) as parts_margin2 from data0060  
      left join data0059 on data0060.CUSTOMER_PTR=data0059.CUSTOMER_PTR and data0060.CUST_PART_PTR=data0059.CUST_PART_PTR where data0060.status=1 
       group by data0059.rkey, data0059.rkey ) as Dsum59 on data0059.rkey=Dsum59.rkey --20130615  

       left join 
    ( select  data0097.rkey as rkey_97,data0097.po_number,isnull(sum(data0060.PARTS_ORDERED),0) as PO_PARTS_ORDERED from data0060  
      left join data0097  on data0060.PURCHASE_ORDER_PTR=data0097.rkey  
       group by data0097.rkey,data0097.po_number  ) as sumPo60  on sumPo60.rkey_97=data0060.PURCHASE_ORDER_PTR --加该客户订单下允许叉板比例20130715 LLL 

      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod)
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no  
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
    WHERE  (Data0025.ANCESTOR_PTR = @vptr2)
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 )  
    ORDER BY Data0006.WORK_ORDER_NUMBER
  end
end
else 
begin 
 if @ReworkIn_flag=0 --加返工单是否可以入仓的开关，ReworkIn_flag默认为0，不可入仓，1-可入仓 20130221 LLL
  begin 
     SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr,
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels,data0050.tax_flag, 
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW,
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53, 
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60   
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING  --增加订单销售类型 LLL 20121008 
      ,isnull(data0060.PARTS_ORDERED*data0010.Forkplate_rate/100,0) as Forkplate_qty,data0010.Forkplate_rate,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty  --增加叉板数及叉板比例 LLL 20121207   
         ,data0059.customer_part_desc,Dsum59.parts_margin2 
       ,sumPo60.po_number,isnull(sumPo60.PO_PARTS_ORDERED*data0010.Forkplate_rate/100,0) as PO_Forkplate_qty --加该客户订单下允许叉板比例20130715 LLL    
      FROM Data0056 INNER JOIN
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN 
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey  
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc  ) --53set净重20130125 LLL    
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order 
      left join data0010 on data0060.CUSTOMER_PTR=data0010.rkey 
       left join data0059 on data0060.CUSTOMER_PTR=data0059.CUSTOMER_PTR and data0060.CUST_PART_PTR=data0059.CUST_PART_PTR --20130615  
      left join 
      ( select  data0059.rkey ,isnull(sum(Data0060.PARTS_ORDERED-Data0060.PARTS_SHIPPED+Data0060.quan_to_re_delivery-Data0060.returned_ship+part_ovsh),0) as parts_margin2 from data0060  
      left join data0059 on data0060.CUSTOMER_PTR=data0059.CUSTOMER_PTR and data0060.CUST_PART_PTR=data0059.CUST_PART_PTR  where data0060.status=1 
       group by data0059.rkey, data0059.rkey ) as Dsum59 on data0059.rkey=Dsum59.rkey --20130615 

        left join 
    ( select  data0097.rkey as rkey_97,data0097.po_number,isnull(sum(data0060.PARTS_ORDERED),0) as PO_PARTS_ORDERED from data0060  
      left join data0097  on data0060.PURCHASE_ORDER_PTR=data0097.rkey  
       group by data0097.rkey,data0097.po_number  ) as sumPo60  on sumPo60.rkey_97=data0060.PURCHASE_ORDER_PTR --加该客户订单下允许叉板比例20130715 LLL 

 
      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod) 
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no
                 --Where t2.so_no=Data0060.sales_order
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
  WHERE    
    (Data0025.ANCESTOR_PTR = @vptr2)
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 and out_source= @out_source ) 
    and  DATA0056.WTYPE<>2  --过滤在线返工状态 20120816 LLL   
    ORDER BY Data0006.WORK_ORDER_NUMBER
 end
 else --1-可入仓
 begin 
   SELECT Data0006.WORK_ORDER_NUMBER, Data0056.STEP,isnull(Data0060.customer_ptr,data0492.customer_ptr) as  customer_ptr, 
      Data0034.DEPT_NAME, Data0056.INTIME, Data0056.QTY_BACKLOG,Data0056.Panels,data0050.tax_flag, 
      Data0056.RKEY, Data0056.FLOW_NO,data0056.reference,Data0060.sales_order,Data0056.Weight_SET, 
      Data0025.RKEY AS data0025_rkey, Data0056.TO_BE_STOCKED,Data0060.parts_ordered,Data0056.TO_BE_STOCKED_NOW,
      Data0056.TO_BE_CANCD, Data0056.TDATE, Data0056.EMPLOYEE_PTR,data0050.cp_rev,data0050.rkey as rkey_50,isnull(data0053.Weight_SET,0) as Weight_SET_53, 
      Data0025.ANCESTOR_PTR, Data0056.WO_PTR, Data0056.DEPT_PTR,data0050.customer_part_number,Data0056.LOC_PTR,
      Data0006.WIPMAT_STATUS,Rkey50=Data0025.ANCESTOR_PTR,data0006.WO_DATECODE,Data0006.QUAN_REJ,
      qty_owe=case when Data0060.parts_ordered-D06.qty_owe>0 then Data0060.parts_ordered-D06.qty_owe else 0 end,
      (data0060.parts_ordered+data0060.parts_returned-data0060.parts_shipped) as own,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end,
      Data0056.loc_place,Data0056.wo_date_code,DATA0056.WTYPE,data0060.rkey  as rkey60   
      ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING  --增加订单销售类型 LLL 20121008 
      ,isnull(data0060.PARTS_ORDERED*data0010.Forkplate_rate/100,0) as Forkplate_qty,data0010.Forkplate_rate,isnull(data0060.PARTS_ORDERED+data0060.parts_Spare,0) as sum_qty  --增加叉板数及叉板比例 LLL 20121207   
        ,data0059.customer_part_desc,Dsum59.parts_margin2 
      ,sumPo60.po_number,isnull(sumPo60.PO_PARTS_ORDERED*data0010.Forkplate_rate/100,0) as PO_Forkplate_qty --加该客户订单下允许叉板比例20130715 LLL    
     FROM Data0056 INNER JOIN
      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN
      Data0034 ON Data0056.DEPT_PTR = Data0034.RKEY INNER JOIN 
      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY
              and Data0025.PARENT_PTR = 0
      left join data0050 on data0025.ancestor_ptr=data0050.rkey  
      left join data0053 on data0053.CUST_PART_Ptr=data0050.rkey and data0053.rkey=(select top 1 rkey from data0053  where data0053.CUST_PART_Ptr=data0050.rkey and data0053.Weight_SET>0 order by MFG_DATE desc  ) --53set净重20130125 LLL    
      left join data0492 on data0006.cut_no=data0492.cut_no 
      left join data0060 on data0492.so_no=data0060.sales_order 
      left join data0010 on data0060.CUSTOMER_PTR=data0010.rkey 
       left join data0059 on data0060.CUSTOMER_PTR=data0059.CUSTOMER_PTR and data0060.CUST_PART_PTR=data0059.CUST_PART_PTR --20130615  
      left join 
      ( select  data0059.rkey ,isnull(sum(Data0060.PARTS_ORDERED-Data0060.PARTS_SHIPPED+Data0060.quan_to_re_delivery-Data0060.returned_ship+part_ovsh),0) as parts_margin2 from data0060  
      left join data0059 on data0060.CUSTOMER_PTR=data0059.CUSTOMER_PTR and data0060.CUST_PART_PTR=data0059.CUST_PART_PTR   where data0060.status=1 
       group by data0059.rkey, data0059.rkey ) as Dsum59 on data0059.rkey=Dsum59.rkey --20130615  
      
     left join 
    ( select  data0097.rkey as rkey_97,data0097.po_number,isnull(sum(data0060.PARTS_ORDERED),0) as PO_PARTS_ORDERED from data0060  
      left join data0097  on data0060.PURCHASE_ORDER_PTR=data0097.rkey  
       group by data0097.rkey,data0097.po_number  ) as sumPo60  on sumPo60.rkey_97=data0060.PURCHASE_ORDER_PTR --加该客户订单下允许叉板比例20130715 LLL 


      left join (Select t2.so_no,qty_owe=sum(t1.quan_prod) 
                 From Data0006 t1 inner join
                      Data0492 t2 on t1.cut_no=t2.cut_no
                 --Where t2.so_no=Data0060.sales_order
                 group by t2.so_no) as D06 on Data0060.sales_order=d06.so_no
  WHERE    
    (Data0025.ANCESTOR_PTR = @vptr2)
    and data0056.outsource=0 and data0006.prod_status=3 and data0056.qty_backlog>0
    and data0056.dept_ptr in (select rkey from data0034 where fgstock_flag=1 and out_source= @out_source ) 
  ORDER BY Data0006.WORK_ORDER_NUMBER
 end 
end
GO
