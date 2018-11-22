 --EP087更新含税价格
 --ep022;6 '2013-05-12 22:27:19','2013-08-20 22:27:19',0,2,3,4,5,6,1,'',2,0,0,3
DECLARE
@dtpk1 datetime,
@dtpk2 datetime,
@v1 tinyint=0,--有效的
@v2 tinyint=2,--暂缓
@v3 tinyint=3,--已结算
@v4 tinyint=4,--已完成
@v5 tinyint=5,--已取消
@v6 tinyint=6,--未提交
@flag tinyint,--1销售订单号,2本厂编号,3补退货,4客户型号
@so_number varchar(20),
@so_type int,
@Stk int,
@Rkey16 int,
@flag_cust INT
SELECT @dtpk1='2013-05-12 22:27:19',@dtpk2='2013-08-20 22:27:19',@v1=0,@v2=2,@v3=3,@v4=4,@v5=5,@v6=6,@flag=1,@so_number='',@so_type=2,@Stk=0,@Rkey16=0,@flag_cust=3

  SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,isnull(set_x_qty,1) as set_x_qty,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,isnull(set_y_qty,1) as set_y_qty, 
  data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ent_date,data0060.to_be_planned,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,Data0060.qty_sure,data0060.parts_Spare,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,data0060.part_ovsh,data0060.ovsh_qty1,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RmaNO =data0098.rma_number,data0060.ONHOLD_SHIPPING,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, 
  data0060.REFERENCE_NUMBER
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,
  data0060.orig_sched_ship_date,
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904
  ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
  ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL 
FROM Data0060 (nolock) INNER JOIN

      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr left join
      Data0098 (nolock) on Data0060.rma_ptr=data0098.Rkey
   where
   data0060.ent_date >= @dtpk1+' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
   data0060.sales_order like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,6,7))  ---0正式订单1免费订单2 退货订单3备料订单4外包订单5预付费订单6内部订单7临时订单8寄售订单
and Data0050.ttype <> 3 --0,量1,样2,报价,3其它
   and ((@so_type=0 and Data0060.so_style<>2 )OR(@so_type=1 and Data0060.so_style=2 )OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
---------------------------------------------测试
 --exec ep022;6 '2013-08-17 19:57:14','2013-11-25 19:57:14',0,2,3,4,5,6,1,'',2,0,0,3
DECLARE
@dtpk1 datetime,
@dtpk2 datetime,
@v1 tinyint=0,--有效的
@v2 tinyint=2,--暂缓
@v3 tinyint=3,--已结算
@v4 tinyint=4,--已完成
@v5 tinyint=5,--已取消
@v6 tinyint=6,--未提交
@flag tinyint,--1销售订单号,2本厂编号,3补退货,4客户型号
@so_number varchar(20),
@so_type int,
@Stk int,
@Rkey16 int,
@flag_cust INT
SELECT @dtpk1='2013-05-12 22:27:19',@dtpk2='2013-08-20 22:27:19',@v1=0,@v2=2,@v3=3,@v4=4,@v5=5,@v6=6,@flag=1,@so_number='',@so_type=2,@Stk=0,@Rkey16=0,@flag_cust=3

  SELECT d.RKEY
FROM Data0060 (nolock) INNER JOIN

      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr left join
      Data0098 (nolock) on Data0060.rma_ptr=data0098.Rkey, data0060 d
   where
   data0060.ent_date >= @dtpk1+' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
   data0060.sales_order like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,6,7))  ---0正式订单1免费订单2 退货订单3备料订单4外包订单5预付费订单6内部订单7临时订单8寄售订单
and Data0050.ttype <> 3 --0,量1,样2,报价,3其它
   and ((@so_type=0 and Data0060.so_style<>2 )OR(@so_type=1 and Data0060.so_style=2 )OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER

----------------------------------
CREATE PROCEDURE ep022;5
       @rkey int
with encryption
AS
select
  data0006.WORK_ORDER_NUMBER,
  data0016.location,
  data0053.qty_on_hand,
  data0053.qty_alloc,
  data0063.part_batch_ptr as rkey53,
  data0063.quan_allocated,data0063.rkey as rkey63,
  qty_on_hand-qty_alloc+quan_allocated as qty_avail
From Data0053 left join
     Data0006 on Data0053.WORK_ORDER_PTR = Data0006.RKEY inner join
     Data0063 on Data0053.RKEY = Data0063.PART_BATCH_PTR inner join
     Data0016 on Data0053.LOC_PTR = Data0016.RKEY
where
  data0063.so_ptr=@rkey
go
--------------
create PROCEDURE ep022;6
@dtpk1 datetime,
@dtpk2 datetime,
@v1 tinyint=0,
@v2 tinyint=2,
@v3 tinyint=3,
@v4 tinyint=4,
@v5 tinyint=5,
@v6 tinyint=6,
@flag tinyint,--1销售订单号,2本厂编号,3补退货,4客户型号
@so_number varchar(20),
@so_type int,
@Stk int,
@Rkey16 int,
@flag_cust int
with encryption
AS
declare @Swith int--0:订单确认前允许投产，1:订单确认前不允许投产
declare @jh_price_flag int
select @Swith=IsNull(PPC_CONTROL13,0) from data0192
declare @cond varchar(8000)
set @cond=''

select @jh_price_flag=isnull(jh_price_flag,0) from data0195 
  
if @flag=1 
begin
  if  (@flag_cust=1) and (@jh_price_flag=1)
  begin
  SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,isnull(set_x_qty,1) as set_x_qty,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,isnull(set_y_qty,1) as set_y_qty, 
  data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ent_date,data0060.to_be_planned,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,Data0060.qty_sure,data0060.parts_Spare,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,data0060.part_ovsh,data0060.ovsh_qty1,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RmaNO =data0098.rma_number,data0060.ONHOLD_SHIPPING,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, 
  data0060.REFERENCE_NUMBER
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,
  data0060.orig_sched_ship_date,
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904
  ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107
  ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
FROM Data0060 (nolock)  INNER JOIN
      Data0010 (nolock)  ON Data0060.CUSTOMER_PTR = Data0010.RKEY
        and (data0010.ParentCust_ptr is null)
      INNER JOIN
      Data0097 (nolock)  ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr left join
      Data0098 (nolock) on Data0060.rma_ptr=data0098.Rkey
   where
   data0060.ent_date >= @dtpk1+' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
   data0060.sales_order like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and Data0060.so_style<>2 )OR(@so_type=1 and Data0060.so_style=2 )OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
end
if (@flag_cust=2) and (@jh_price_flag=1)
begin
  SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,isnull(set_x_qty,1) as set_x_qty,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,isnull(set_y_qty,1) as set_y_qty, 
  data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ent_date,data0060.to_be_planned,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,Data0060.qty_sure,data0060.parts_Spare,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,data0060.part_ovsh,data0060.ovsh_qty1,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RmaNO =data0098.rma_number,data0060.ONHOLD_SHIPPING,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, 
  data0060.REFERENCE_NUMBER
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,
  data0060.orig_sched_ship_date,
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904
 ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
  ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
FROM Data0060 (nolock)  INNER JOIN
      Data0010 (nolock)  ON Data0060.CUSTOMER_PTR = Data0010.RKEY
        and  (not(data0010.ParentCust_ptr is null))
      INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr left join
      Data0098 (nolock) on Data0060.rma_ptr=data0098.Rkey
   where
   data0060.ent_date >= @dtpk1+' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
   data0060.sales_order like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and Data0060.so_style<>2 )OR(@so_type=1 and Data0060.so_style=2 )OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
end
if @jh_price_flag<>1
begin
  SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,isnull(set_x_qty,1) as set_x_qty,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,isnull(set_y_qty,1) as set_y_qty, 
  data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ent_date,data0060.to_be_planned,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,Data0060.qty_sure,data0060.parts_Spare,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,data0060.part_ovsh,data0060.ovsh_qty1,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RmaNO =data0098.rma_number,data0060.ONHOLD_SHIPPING,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, 
  data0060.REFERENCE_NUMBER
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,
  data0060.orig_sched_ship_date,
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904
  ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
  ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL 
FROM Data0060 (nolock) INNER JOIN

      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr left join
      Data0098 (nolock) on Data0060.rma_ptr=data0098.Rkey
   where
   data0060.ent_date >= @dtpk1+' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
   data0060.sales_order like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,6,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and Data0060.so_style<>2 )OR(@so_type=1 and Data0060.so_style=2 )OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
end

end
else if @flag=2 
begin
if (@flag_cust=1) and (@jh_price_flag=1)
begin
SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,data0060.ent_date,data0060.to_be_planned,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,Data0060.qty_sure,data0060.parts_Spare,
  Data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ONHOLD_SHIPPING,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED, data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.ovsh_qty1,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,isnull(set_x_qty,1) as set_x_qty,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RMaNO=data0098.rma_number,isnull(set_y_qty,1) as set_y_qty,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER  --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date,  --计划交期
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904 
 ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
 ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
 FROM Data0060 (nolock) INNER JOIN
      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY and (data0010.ParentCust_ptr is null) INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock)  ON Data0060.CUST_PART_PTR = data0059.cust_part_ptr 
              AND Data0060.CUSTOMER_PTR = data0059.customer_ptr left join
      Data0098 (nolock)  on Data0060.rma_ptr=Data0098.Rkey
 where
   /*
   data0060.PROD_REL <> 1 and (len(data0060.conf_date)>0 or @Swith=0) and 
   */
   data0060.ent_date >= @dtpk1 +' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
   data0050.CUSTOMER_PART_NUMBER like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
end
if @flag_cust=2 and (@jh_price_flag=1)
begin
SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,data0060.ent_date,data0060.to_be_planned,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,Data0060.qty_sure,data0060.parts_Spare,
  Data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ONHOLD_SHIPPING,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED, data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.ovsh_qty1,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,isnull(set_x_qty,1) as set_x_qty,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RMaNO=data0098.rma_number,isnull(set_y_qty,1) as set_y_qty,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER  --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date,  --计划交期
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904 
 ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
 ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
 FROM Data0060 (nolock) INNER JOIN
      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY and (not(data0010.ParentCust_ptr is null)) INNER JOIN
      Data0097 (nolock)  ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUST_PART_PTR = data0059.cust_part_ptr 
              AND Data0060.CUSTOMER_PTR = data0059.customer_ptr left join
      Data0098 (nolock) on Data0060.rma_ptr=Data0098.Rkey
 where
   /*
   data0060.PROD_REL <> 1 and (len(data0060.conf_date)>0 or @Swith=0) and 
   */
   data0060.ent_date >= @dtpk1 +' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
   data0050.CUSTOMER_PART_NUMBER like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
end
if @jh_price_flag<>1 
begin
  SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,data0060.ent_date,data0060.to_be_planned,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,Data0060.qty_sure,data0060.parts_Spare,
  Data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ONHOLD_SHIPPING,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED, data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.ovsh_qty1,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,isnull(set_x_qty,1) as set_x_qty,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RMaNO=data0098.rma_number,isnull(set_y_qty,1) as set_y_qty,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER  --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date,  --计划交期
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904 
 ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
 ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
 FROM Data0060 (nolock) INNER JOIN
      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUST_PART_PTR = data0059.cust_part_ptr 
              AND Data0060.CUSTOMER_PTR = data0059.customer_ptr left join
      Data0098 (nolock)  on Data0060.rma_ptr=Data0098.Rkey
 where
   /*
   data0060.PROD_REL <> 1 and (len(data0060.conf_date)>0 or @Swith=0) and 
   */
   data0060.ent_date >= @dtpk1 +' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
   data0050.CUSTOMER_PART_NUMBER like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,6,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER

end
end
 else  if @flag=3
begin
  if @flag_cust=1 and (@jh_price_flag=1)
begin
SELECT data0060.so_oldnew,
case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Data0098.Qty_Ship,Data0098.qty_shipd,Data0060.qty_sure,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=Data0098.Rkey,data0060.ent_date,data0060.to_be_planned,
  data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.rma_ptr,isnull(set_x_qty,1) as set_x_qty,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.ONHOLD_SHIPPING,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,isnull(set_y_qty,1) as set_y_qty,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.ovsh_qty1,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,data0060.part_price,data0060.parts_Spare,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RmaNO=data0098.RMA_NUMBER,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER  --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date,   --计划交期
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904 
,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
 ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
 FROM Data0060 (nolock) INNER JOIN
      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY and (data0010.ParentCust_ptr is null) INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr inner join 
      data0098 (nolock) on data0098.so_ptr=data0060.rkey 
 where
   /*
   data0060.PROD_REL <> 1 and (len(data0060.conf_date)>0 or @Swith=0) and  
   */
   data0060.quan_to_re_delivery>0  
   and  data0060.ent_date >= @dtpk1+' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and 
   data0060.sales_order like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
end
if @flag_cust=2 and (@jh_price_flag=1)
begin
SELECT data0060.so_oldnew,
case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Data0098.Qty_Ship,Data0098.qty_shipd,Data0060.qty_sure,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=Data0098.Rkey,data0060.ent_date,data0060.to_be_planned,
  data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.rma_ptr,isnull(set_x_qty,1) as set_x_qty,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.ONHOLD_SHIPPING,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,isnull(set_y_qty,1) as set_y_qty,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.ovsh_qty1,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,data0060.part_price,data0060.parts_Spare,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RmaNO=data0098.RMA_NUMBER,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER  --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date,   --计划交期
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904 
,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
 ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
 FROM Data0060 (nolock) INNER JOIN
      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY and (not(data0010.ParentCust_ptr is null)) INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr inner join 
      data0098 (nolock) on data0098.so_ptr=data0060.rkey 
 where
   /*
   data0060.PROD_REL <> 1 and (len(data0060.conf_date)>0 or @Swith=0) and  
   */
   data0060.quan_to_re_delivery>0  
   and  data0060.ent_date >= @dtpk1+' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and 
   data0060.sales_order like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
end
if @jh_price_flag<>1 
begin
  SELECT data0060.so_oldnew,
case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Data0098.Qty_Ship,Data0098.qty_shipd,Data0060.qty_sure,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=Data0098.Rkey,data0060.ent_date,data0060.to_be_planned,
  data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.rma_ptr,isnull(set_x_qty,1) as set_x_qty,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.ONHOLD_SHIPPING,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,isnull(set_y_qty,1) as set_y_qty,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.ovsh_qty1,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,data0060.part_price,data0060.parts_Spare,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RmaNO=data0098.RMA_NUMBER,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER  --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date,   --计划交期
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904 
  ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
  ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
 FROM Data0060 (nolock) INNER JOIN
      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY  INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr inner join 
      data0098 (nolock) on data0098.so_ptr=data0060.rkey 
 where
   /*
   data0060.PROD_REL <> 1 and (len(data0060.conf_date)>0 or @Swith=0) and  
   */
   data0060.quan_to_re_delivery>0  
   and  data0060.ent_date >= @dtpk1+' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and 
   data0060.sales_order like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,6,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER

end
end
 else
if @flag=4  --客户型号20120329lll
begin
  if (@flag_cust=1) and (@jh_price_flag=1)
  begin
  SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,data0060.ent_date,data0060.to_be_planned,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,Data0060.qty_sure,data0060.parts_Spare,
  Data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ONHOLD_SHIPPING,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED, data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.ovsh_qty1,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,isnull(set_x_qty,1) as set_x_qty,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RMaNO=data0098.rma_number,isnull(set_y_qty,1) as set_y_qty,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER  --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date,  --计划交期
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904
  ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
   ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL 
 FROM Data0060 (nolock) INNER JOIN
      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY and (data0010.ParentCust_ptr is null) INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUST_PART_PTR = data0059.cust_part_ptr 
              AND Data0060.CUSTOMER_PTR = data0059.customer_ptr left join
      Data0098 (nolock) on Data0060.rma_ptr=Data0098.Rkey
 where
   /*
   data0060.PROD_REL <> 1 and (len(data0060.conf_date)>0 or @Swith=0) and 
   */
   data0060.ent_date >= @dtpk1 +' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
 --data0050.CUSTOMER_PART_NUMBER like '%'+@so_number+'%'
   data0059.customer_part_desc  like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
end
if @flag_cust=2 and (@jh_price_flag=1)
  begin
SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,data0060.ent_date,data0060.to_be_planned,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,Data0060.qty_sure,data0060.parts_Spare,
  Data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ONHOLD_SHIPPING,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED, data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.ovsh_qty1,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,isnull(set_x_qty,1) as set_x_qty,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RMaNO=data0098.rma_number,isnull(set_y_qty,1) as set_y_qty,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER  --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date,  --计划交期
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904 
  ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
  ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
 FROM Data0060 (nolock) INNER JOIN
      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY and (not(data0010.ParentCust_ptr is null)) INNER JOIN
      Data0097 (nolock)  ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUST_PART_PTR = data0059.cust_part_ptr 
              AND Data0060.CUSTOMER_PTR = data0059.customer_ptr left join
      Data0098 (nolock) on Data0060.rma_ptr=Data0098.Rkey
 where
   /*
   data0060.PROD_REL <> 1 and (len(data0060.conf_date)>0 or @Swith=0) and 
   */
   data0060.ent_date >= @dtpk1 +' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
 --data0050.CUSTOMER_PART_NUMBER like '%'+@so_number+'%'
   data0059.customer_part_desc  like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER
end
if @jh_price_flag=1
begin
  SELECT data0060.so_oldnew,
  case data0050.sales_order_unit_ptr when 1 then 'Strip出货'
                                     else 'Pcs出货' end as sales_order_unit_ptr,
  data0060.PARTS_ORDERED/(isnull(set_x_qty,1)*isnull(set_y_qty,1)) as strip_order,
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,data0060.ent_date,data0060.to_be_planned,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,Data0060.qty_sure,data0060.parts_Spare,
  Data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ONHOLD_SHIPPING,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,data0050.CATALOG_NUMBER,
  data0060.parts_shipped,data0060.PARTS_RETURNED, data0060.RETURNED_SHIP,data0060.PARTS_ORDERED* Data0050.unit_sq as so_sq,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.ovsh_qty1,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,isnull(set_x_qty,1) as set_x_qty,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RMaNO=data0098.rma_number,isnull(set_y_qty,1) as set_y_qty,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER  --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date,  --计划交期
  data0060.PROD_REL,data0060.conf_date,data0060.parts_stocked,data0060.RETURNED_stocked
  ,data0060.qty_tran,data0060.ORIG_REQUEST_DATE --加转仓数量及客户交期 LLL 20120904 
 ,case  data0060.so_style when 0 then '正式订单' when 1 then '免费订单' when 2 then '退货订单' when 3 then '备料订单'
      when 4 then '外包订单' when 5 then '预付费订单' when 6 then '内部订单' when 7 then '临时订单' when 8 then '寄售订单'
  end as so_style_desc  --加销售订单类型 LLL 20130107 
  ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销 ' end as COMMISION_ON_TOOLING_desc  --加订单销售类型 20130309LLL
 FROM Data0060 (nolock) INNER JOIN
      Data0010 (nolock) ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
      Data0097 (nolock) ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 (nolock) ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 (nolock) ON Data0060.CUST_PART_PTR = data0059.cust_part_ptr 
              AND Data0060.CUSTOMER_PTR = data0059.customer_ptr left join
      Data0098 (nolock) on Data0060.rma_ptr=Data0098.Rkey
 where
   /*
   data0060.PROD_REL <> 1 and (len(data0060.conf_date)>0 or @Swith=0) and 
   */
   data0060.ent_date >= @dtpk1 +' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' and
   Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 and
   Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 and
   Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6 and
 --data0050.CUSTOMER_PART_NUMBER like '%'+@so_number+'%'
   data0059.customer_part_desc  like '%'+@so_number+'%'
   and (IsNull(data0060.so_style,0) not in (3,6,7)) and Data0050.ttype <> 3
   and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0053 left join 
                                         data0416 on Data0053.npad_ptr=data0416.Rkey 
                                    where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                                      and (Data0053.qty_on_hand-data0053.qty_alloc)>0
                                      and Data0416.type<>4
                                      and (data0053.loc_ptr=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
   and (exists(select 1 from Data0053 
                  where data0060.cust_part_ptr=Data0053.cust_part_ptr 
                        and (Data0053.loc_ptr=@Rkey16)OR(@Rkey16=0)))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER

end
end
go