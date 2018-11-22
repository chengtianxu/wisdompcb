--修改退货单数量 ，不完整

select QTY_AUTH,QTY_RECD,* from data0098 where RMA_NUMBER='RMA0227'
select parts_returned,returned_ship,* from Data0060 where RKEY in(select SO_PTR from data0098 where RMA_NUMBER='RMA0227')

update Data0098 set QTY_AUTH=?,QTY_RECD =?  where RMA_NUMBER='RMA0227'
update Data0060 set  parts_returned=?,returned_ship=? where RKEY in(select SO_PTR from data0098 where RMA_NUMBER='RMA0227')

--exec EP183;1 '960','2013-05-01','2013-05-30',3,'001','','','','',-1,-1,0
declare 
@v278 varchar(3)='960',
@vdate1 varchar(10)='2013-05-01',
@vdate2 varchar(20)='2013-05-30',
@so_tp tinyint=3,
@cust varchar(12)='001',
@cust_part varchar(20)='',
@cust_part_desc varchar(40)='',
@rma_nr varchar(20)='',
@so_nr varchar(15)='',
@orderby1 int=-1,
@orderby2 int=-1,
@date_flag int=0

declare @cond varchar(8000)
select @cond=
'select  
   a.rma_number,b.customer_part_number,b.cp_rev,data0059.customer_part_desc,c.employee_name,
   a.redate,a.qty_ship,data0059.customer_matl_desc,d.cust_code,d.abbr_name,a.lost_amount,
   a.required_amount,e.sales_order,e.parts_returned-e.returned_ship as to_be_ship --欠货数量
   ,a.co_price,
   case when a.co_price >0 then round(  a.co_price / dbo.SF_GET_MONTH_EXCHRATE(a.curr_ptr,a.RMA_DATE),4)
     else 0 end as price,
   round(case when a.co_price >0 then round(a.co_price / dbo.SF_GET_MONTH_EXCHRATE(a.curr_ptr,a.RMA_DATE)*a.qty_auth,2)
     else 0 end,2) as amount ,round(dbo.SF_GET_MONTH_EXCHRATE(a.curr_ptr,a.RMA_DATE),4) as exch_rate,
	a.curr_ptr,data0001.curr_code,a.rma_date,a.qty_auth,a.qty_recd,
--a.qty_scrap,a.qty_reworked,a.qty_remaked,  a.qty_to_move_fin_good,
   a.ref_number,h.parameter_desc,round(case when g.parameter_value is null then 0 else g.parameter_value end,4) as value,
   case when (g.parameter_value is null or a.qty_recd=0) then 0 else case when  a.qty_recd>0 then
     case when h.prod_unit_base=''U''  then a.qty_recd/g.parameter_value else a.qty_recd*g.parameter_value
     end end end as ca,i.abbr_name as abbr_name1,
   d60.sales_order as new_so,d60.part_price,d60.parts_ordered,d01.curr_code as new_curr_code,
   round(isnull(d60.part_price,0)*isnull(d60.parts_ordered,0),2) as new_amount,a.rma_status,
   case  a.rma_status when 0 then ''未提交'' when 1 then ''待审核'' when 2 then ''待入仓''
     when 3 then ''已入仓'' when 4 then ''已充帐'' when 5 then ''完成'' when 6 then  ''关闭''
     when 7 then    ''退回'' end as status,d414.qty_rece,d414.qty_to_be_reworked,d414.qty_reworked,
   d414.qty_to_be_reworked-d414.qty_reworked as to_be_reworked,d414.qty_to_be_remaked,
   d414.qty_remaked,d414.qty_to_be_remaked-d414.qty_remaked as to_be_remaked,d414.qty_to_be_stocked,
   d414.qty_stocked,d414.qty_to_be_stocked-d414.qty_stocked as to_be_stocked,d06.sum_quan_prod,
   d06.sum_quan_sch,e.parts_shipped as qty_shipd,d05.employee_name as auditor,d415.qty_to_be_audit,
   a.audited_date,a.ANALYSIS_CODE_1,a.ANALYSIS_CODE_2,a.ANALYSIS_CODE_3,a.ANALYSIS_CODE_4,a.ANALYSIS_CODE_5,
   cast(m.memo_text as varchar(200)) as memo_text ,d415.quantity,data0116.memo_number 
   ,ltrim(str(b.set_lngth,18,2))+''mm*''+ltrim(str(b.set_width,18,2))+''mm''
	    +''(/''+ltrim(str(b.set_x_qty*b.set_y_qty,8,0))+'')'' as ship_size   --交货尺寸及形式 20121119 LLL
   ,d60.SALES_ORDER as RMA_SALES_ORDER,d60.PARTS_SHIPPED as RMA_PARTS_SHIPPED,isnull(d60.STATUS,0) as RMAORDER_STATUS,   --退货订单 20121120 LLL
    case  isnull(d60.STATUS,0) when 0 then ''无退货订单'' when 1 then ''有效'' when 2 then ''暂缓''
     when 3 then ''关闭'' when 4 then ''完成'' when 5 then ''取消'' when 6 then  ''未提交''
     end as RMAORDER_STATUS_desc,isnull(a.qty_ship-d60.PARTS_SHIPPED,0) as Rma_qty_remarked,
     isnull(a.srce_ptr,0) as srce_ptr,case isnull(a.srce_ptr,0) when 0 then ''未入帐'' else ''已入帐'' end as cw_status  
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
	inner join data0005 c on a.auth_by_empl_ptr=c.rkey 
	inner join data0010 d on a.customer_ptr=d.rkey 
	left join data0060 e on a.so_ptr=e.rkey 
    left join data0060 d60 on a.rkey=d60.RMA_PTR  --退货订单 20121120 LLL
	left join data0116 on a.srce_ptr=data0116.rkey 
	left join data0025 f on b.rkey=f.ancestor_ptr and f.parent_ptr=0 
	left join data0047 g on f.rkey=g.source_pointer and g.parameter_ptr='+@v278+'
  	left join data0278 h on g.parameter_ptr=h.rkey
  	left join data0023 i on e.supplier_ptr=i.rkey
	left join data0059 on data0059.cust_part_ptr = a.CUSTOMER_PART_PTR AND data0059.customer_ptr = a.CUSTOMER_PTR
    left join ( select memo_text,FILE_POINTER from data0011 where SOURCE_TYPE=98) as m on m.FILE_POINTER=a.rkey
	left join data0001 on a.curr_ptr=data0001.rkey 
    left join data0001 d01  on d60.currency_ptr=d01.rkey 
    left join data0073 d73 on a.audited_by_ptr=d73.rkey
    left join data0005 d05 on d73.EMPLOYEE_PTR =d05.rkey
    left join (select data0414.rma_ptr,sum(data0006.quan_prod) as sum_quan_prod, 
      sum(data0006.quan_sch) as sum_quan_sch  from data0414
      left join data0492 on data0414.rkey=data0492.mrb_ptr
      left join data0006 on data0492.cut_no=data0006.cut_no  
      where data0414.rma_ptr >0 group by data0414.rma_ptr)  d06 on a.rkey=d06.rma_ptr
    left join (select rma_ptr,sum(qty_to_be_reworked) as  qty_to_be_reworked,
      sum(qty_to_be_remaked) as qty_to_be_remaked,sum(qty_to_be_stocked) as qty_to_be_stocked  ,
      sum(qty_stocked) as qty_stocked,sum(qty_reworked) as qty_reworked,
      sum(qty_remaked) as qty_remaked,sum(qty_rece) as qty_rece
      from data0414 where rma_ptr >0 group by rma_ptr) d414 on a.rkey=d414.rma_ptr 
      left join (select rma_ptr,sum(quantity-qty_received) as  qty_to_be_audit,sum(quantity) as quantity
      from data0415 where rma_ptr >0 group by rma_ptr) d415 on a.rkey=d415.rma_ptr 
where '
if @date_flag=0  select @cond=@cond+'a.rma_date>='''+@vdate1+'''
   	and a.rma_date<='''+@vdate2+' 23:59:59'''
if @date_flag=1  select @cond=@cond+'a.audited_date>='''+@vdate1+'''
   	and a.audited_date<='''+@vdate2+' 23:59:59'''
if @so_tp <> 3 
   select @cond=@cond+' and e.so_tp='+cast(@so_tp as varchar(1))

--条件
if @cust <> ''
  select @cond=@cond+' and cust_code='''+@cust+''''
if @cust_part <> ''
  select @cond=@cond+' and customer_part_number like '''+@cust_part+'%'''
if @cust_part_desc <> ''
  select @cond=@cond+' and customer_part_desc like '''+@cust_part_desc+'%'''
if @rma_nr <> ''
  select @cond=@cond+' and a.rma_number like '''+@rma_nr+'%'''  
if @so_nr <> ''
  select @cond=@cond+' and e.sales_order like '''+@so_nr+'%'''  

--排序
if  @orderby1=0 
  select @cond=@cond+' order by d.abbr_name'
if  @orderby1=1 
  select @cond=@cond+' order by a.rma_date'
if  @orderby1=2 
   select @cond=@cond+' order by b.customer_part_number'
if  @orderby1=3 
   select @cond=@cond+' order by data0059.customer_part_desc'
if  @orderby1=4 
   select @cond=@cond+' order by a.rma_number'

if  @orderby2 =0
  select @cond=@cond+' , d.abbr_name'
if  @orderby2 =1
   select @cond=@cond+' , a.rma_date'
if  @orderby2 =2
   select @cond=@cond+' , b.customer_part_number'
if  @orderby2 =3
   select @cond=@cond+' , b.customer_part_desc'
if  @orderby2 =4
   select @cond=@cond+' , a.rma_number'

 exec (@cond)
  print @cond
go