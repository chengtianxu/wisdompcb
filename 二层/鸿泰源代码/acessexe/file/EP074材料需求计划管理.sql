--EP074材料需求计划管理
CREATE PROCEDURE EP074;47
@vptr int
AS
select '库存' as type,null AS req_date,null AS customer_part_number,
'' AS cp_rev,'' AS manu_part_number,cast('' as varchar(30)) as sales_order,data0017.quan_on_hand
+isnull(sum(a.quan_in_insp),0)
+isnull(sum(e.bal_qty),0)
-isnull(sum(b.quan_expired),0)
 as quan_ned,1 as status
FROM data0017 
left join (select inventory_ptr,sum(quan_in_insp+quan_to_be_stocked) as quan_in_insp from data0022 where inventory_ptr=@vptr and  quan_in_insp+quan_to_be_stocked>0 group by inventory_ptr) a on a.inventory_ptr=@vptr
left join (select inventory_ptr,sum(quan_on_hand) as quan_expired from data0022 where inventory_ptr=@vptr and quan_on_hand>0 and EXPIRE_DATE<getdate() group by inventory_ptr) b
on b.inventory_ptr=@vptr
left join (select INVENT_PTR,SUM(BAL_QTY) as bal_qty from data0458 group by INVENT_PTR) e on e.invent_ptr=@vptr
where data0017.rkey=@vptr
group by data0017.quan_on_hand
union all
select 'P/O在途',data0071.REQ_DATE,'' AS customer_part_number,
'' AS cp_rev,'' AS manu_part_number,data0070.po_number as sales_order,data0071.conversion_factor*(data0071.quan_ord-quan_recd) as quan_ned,1 as status
from data0070,data0071
where (data0070.status=1 or data0070.status=5) --1待审核,2被退回,3已保留,4已暂缓,5 已审核,6已收货,7已完成,8未提交,9已取消
and data0071.po_ptr=data0070.rkey
and data0071.quan_ord-quan_recd>0
and data0071.invt_ptr=@vptr
union all
--订单材料需求预算查阅(已请购待采购)
select 'P/O待采购',data0068.REQ_DATE,'' AS customer_part_number,
'' AS cp_rev,'' AS manu_part_number,data0068.po_req_number as sales_order,data0069.quantity as quan_ned,1 as status
from data0068,data0069
where Data0068.STATUS in(1,2,4,7,8,9)  
and data0069.purch_req_ptr=data0068.rkey
and data0069.invt_ptr=@vptr
/* ,case 
     when status=7 then '未提交'
     when status=1 then '受理后待审批'
     when status=2 then '待采购'
     when status=3 then '已批准'
     when status=4 then '被退回'
     when status=5 then '请购单已撤消'
     when status=6 then '请购单已处理'
     when status=8 then '受理前待审批'
     when status=9 then 
      case when tstate =1 then '审核退回' else '待受理' end
  end as v_status
 ,case 
     when flag='S' then '标准物料'
     when flag='M' then '非标准物料'
     when flag='T' then '标准外发'
     when flag='N' then '非标准外发'
  end as flag1
  */

union all
select * from (
--订单材料需求预算查阅(已投产)
select 'S/O已投产' as type,data0060.ORIG_REQUEST_DATE-data0050.shelf_life-data0050.MFG_LEAD_TIME AS req_date,data0050.customer_part_number,
data0050.cp_rev,data0025.manu_part_number,rtrim(data0060.sales_order)+case when data0060.status=2 then 'on hold' else '' end as sales_order,
case when data0468.quan_bom-data0468.quan_issued>0 then data0468.quan_bom-data0468.quan_issued else 0 end as quan_ned,data0060.status
FROM data0468 ,data0017,data0492,data0050,data0025,data0060
where data0468.status=0 --0有效 ，其它关闭
and data0468.invent_or=0
and data0468.invent_ptr=data0017.rkey
and data0468.cut_no=data0492.cut_no
and data0492.so_no=data0060.sales_order
and data0492.bom_ptr=data0025.rkey
and data0025.ancestor_ptr=data0050.rkey
and data0017.rkey=@vptr
--订单材料需求预算查阅（未投产）
union all
select 'S/O未投产',data0060.ORIG_REQUEST_DATE-data0050.SHELF_LIFE-data0050.MFG_LEAD_TIME as REQ_DATE,data0050.customer_part_number,
data0050.cp_rev,data0025.manu_part_number,rtrim(data0060.sales_order)+case when data0060.status=2 then 'on hold' else '' end as sales_order,
data0475.mrp_qty as quan_ned,data0060.status
from data0475,data0017,data0002,data0060,data0050,data0025
where data0475.inventory_ptr=data0017.rkey
and data0017.stock_unit_ptr=data0002.rkey
and data0475.so_ptr=data0060.rkey
and data0060.cust_part_ptr=data0050.rkey
and data0475.d25rkey=data0025.rkey
and data0475.to_be_planned>0
and data0475.inventory_ptr=@vptr) a
order by status,req_date
go