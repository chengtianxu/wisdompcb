--EP042超投报废查询
exec sp_executesql N'if exists(select 1 from tempdb..sysobjects where id=object_id(''tempdb..#data0058''))
  drop table #data0058

Select data0006.cut_no,qty_reject=sum(data0058.qty_reject)
into #data0058
from data0058 inner join
     data0006 on data0058.wo_ptr=data0006.rkey
group by data0006.cut_no

select data0025.manu_part_number,data0025.manu_part_desc,data0050.customer_part_number,data0050.cp_rev,data0060.parts_ordered,
      data0492.cut_no,data0492.so_no,data0492.planned_qty,data0492.issued_qty,data0059.customer_part_desc,
      data0060.SCH_DATE,data0047.PARAMETER_VALUE,data0060.sales_order,
      case when data0492.Issued_qty-data0060.parts_ordered<0 then 0 else data0492.Issued_qty-data0060.parts_ordered end as sopl,
      data0492.issued_qty-data0492.planned_qty as outpl,#data0058.qty_reject,data0010.cust_code,data0059.customer_matl_desc,
   case when data0492.issued_qty>data0492.planned_qty then
             convert(decimal(20,2),convert(float,#data0058.qty_reject)/(case when data0492.Issued_qty-data0060.parts_ordered<=0 then 1 else
         data0492.Issued_qty-data0060.parts_ordered end)* 100)
        else 0 end AS rate,
  type_desc=case data0492.ttype when 0 then ''正常投产'' when 1 then ''非退货补料'' when 2 then ''退货补料'' when 3 then ''正常返工''
                                when 4 then ''退货返工'' else ''未确定'' end
from data0492 inner join
     data0025 on data0492.bom_ptr=data0025.rkey inner join
     data0050 on data0025.ancestor_ptr=data0050.rkey left join
     #data0058 on data0492.cut_no=#data0058.cut_no left join
     data0010 on data0492.customer_ptr=data0010.rkey left join
     data0059 on data0492.customer_ptr=data0059.customer_ptr
             and data0050.rkey=data0059.cust_part_ptr left join
     data0060 on data0492.so_no=data0060.sales_order left join
     data0047 on data0047.SOURCE_POINTER=Data0492.BOM_PTR and PARAMETER_PTR=3 
where #data0058.qty_reject>0
  --and Data0492.issue_date>=?
  --and Data0492.Issue_Date<=?
    and Data0060.SCH_DATE>=@P1
    and Data0060.SCH_DATE<=@P2
  and (exists(select 1 from data0006 inner join 
                            data0056 on data0006.rkey=data0056.wo_ptr 
                       where data0492.cut_no=data0006.cut_no) or @P3 =1)
order by data0010.cust_code,data0050.customer_part_number,data0050.cp_rev,data0492.cut_no


 
 
 
',N'@P1 float,@P2 float,@P3 bit',41566.433063622688,41597.433132708327,1
go