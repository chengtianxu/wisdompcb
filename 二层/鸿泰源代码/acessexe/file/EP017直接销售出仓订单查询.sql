--EP017直接销售出仓
--EXEC EP017;29 3,'2013-07-30 23:29:45','2013-09-29 23:29:45',0,2,3,4,5,6,2,0,0

--create PROCEDURE ep017;29
declare
@vptr int =3,
@dtpk1 datetime='2013-07-30 23:29:45',
@dtpk2 datetime='2013-09-29 23:29:45',
@v1 tinyint=0,
@v2 tinyint=2,
@v3 tinyint=3,
@v4 tinyint=4,
@v5 tinyint=5,
@v6 tinyint=6,
@so_type int=2,
@Stk int=0,
@Rkey16 int=0
--with encryption
--AS
declare @Swith int--0:订单确认前允许投产，1:订单确认前不允许投产
select @Swith=0
--IsNull(PPC_CONTROL13,0) from data0192

SELECT
  Data0060.RKEY ,Data0060.customer_ptr,Qty_Ship=0,qty_shipd=0,data0025.inventory_ptr,
  Data0060.SALES_ORDER,data0060.cust_part_ptr,Rkey98=0,data0060.rma_ptr,
  data0060.PARTS_ORDERED,Data0060.STATUS,data0060.so_tp,data0060.ent_date,
  data0060.due_date,data0060.sch_date,  Data0097.PO_NUMBER,data0060.part_price,
  data0060.parts_shipped,data0060.PARTS_RETURNED,data0060.RETURNED_SHIP,
  data0010.abbr_name,Data0010.cust_code,data0010.customer_name,
  data0059.customer_part_desc,Data0050.CUSTOMER_PART_NUMBER,
  Data0050.CP_REV,data0050.ANALYSIS_CODE_1,RmaNO =data0098.rma_number,data0060.ONHOLD_SHIPPING,
  Data0050.REPORT_UNIT_VALUE1,data0050.rkey as rkey50,data0060.fob, --新增,客户定单号
  data0060.REFERENCE_NUMBER --参考 
  ,data0059.customer_matl_desc as ANALYSIS_CODE_2
  ,data0060.quan_to_re_delivery,  --需补交数量新增
  data0060.orig_sched_ship_date  --计划交期
FROM Data0060 INNER JOIN
      Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY INNER JOIN
      Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY INNER JOIN
      Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY left JOIN
      data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr 
              AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr left join
      Data0098 on Data0060.rma_ptr=data0098.Rkey LEFT join 
      data0025 on data0025.ancestor_ptr=data0050.rkey and data0025.parent_ptr=0
where
   data0025.inventory_ptr>0 and data0060.customer_ptr=@vptr 
  and data0060.PROD_REL <> 1 --
 and  (len(data0060.conf_date)>0 or @Swith=0)  
  and  data0060.ent_date >= @dtpk1+' 00:00:00' and
   data0060.ent_date <= @dtpk2 +' 23:59:59' 
  and Data0060.STATUS <> @v1 AND Data0060.STATUS <> @v2 
  and Data0060.STATUS <> @v3 AND Data0060.STATUS <> @v4 
  and Data0060.STATUS <> @v5 AND Data0060.STATUS <> @v6
 and IsNull(data0060.so_style,0)<>3
  and ((@so_type=0 and IsNull(data0060.rma_ptr,0)=0)OR(@so_type=1 and IsNull(data0060.rma_ptr,0)>0)OR(@so_type=2 and IsNull(data0060.rma_ptr,0)>=0))
   and ((@Stk=1 and exists(select 1 from Data0022
                                    where data0025.inventory_ptr=Data0022.inventory_ptr 
                                      and Data0022.quan_on_hand>0
                                      and (data0022.LOCATION_PTR=@Rkey16 or @Rkey16=0)))OR(@Stk=0))
ORDER BY data0060.sch_date,Data0060.SALES_ORDER


--exec EP017;30 0,0

