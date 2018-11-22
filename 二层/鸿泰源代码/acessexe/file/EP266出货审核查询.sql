--EP266出货审核查询
exec sp_executesql N'declare @user int  set @user=@P1
SELECT	 data0439.* , data0010.cust_code,data0010.customer_name,data0010.ABBR_NAME,
    data0012.location,data0012.SHIP_TO_CONTACT,a.employee_name as audit,data0001.CURR_NAME,data0010.FED_TAX_ID_NO,
     (select sum(quan_stocked) from data0064 where packing_list_ptr=data0439.rkey) as quan_stocked,
    data0005.employee_name,data0012.SHIP_TO_FAX,Data0274.rkey as rkey274,b.min_ranking ,c.max_ranking   
from data0439 
    inner join data0010 on data0439.customer_ptr=data0010.rkey
    left join data0001 on data0001.rkey=data0010.CURRENCY_PTR
    inner join data0012 on data0439.ship_addr_ptr=data0012.rkey 
    inner join data0005 on data0439.employee_ptr=data0005.rkey  
    left join data0005 a  on data0439.Audit_ptr=a.rkey
    left join Data0274 on Data0274.D439_ptr=data0439.rkey  and  Data0274.user_ptr=@user  
    left join data0073 on data0073.rkey=data0274.user_ptr  
    left join (select d439_ptr,min(ranking) as min_ranking from data0274 group by d439_ptr ) b  on data0439.rkey=b.d439_ptr 
     left join (select d439_ptr,max(ranking) as max_ranking from data0274 group by d439_ptr ) c  on data0439.rkey=c.d439_ptr 
where (data0439.date_sailing >= @P2) and (data0439.date_sailing <@P3 + 1)  
    and data0439.use_stauts <> 5 
    and  (invoice_ptr is null)
    and  ((data0439.use_stauts = 2  and Data0274.ranking=data0439.ranking) or (data0439.use_stauts =4 and data0439.ranking = (select ranking from Data0274 where D439_ptr=Data0439.rkey and user_ptr=@user)))
 and 1=1 
    and 1=1
   order by data0439.delivery_no 
',N'@P1 int,@P2 datetime,@P3 datetime',1,'2013-07-07 22:59:36','2013-09-05 22:59:36'

--子查询
exec sp_executesql N'select data0064.rkey,data0060.sales_order,data0050.CUSTOMER_PART_NUMBER,data0050.CP_REV,
  Data0060.PARTS_ORDERED,data0097.po_number,employee_name,data0064.QUAN_SHIPPED,data0064.ovsh_qty,
  data0060.fob,data0060.part_price,Data0059.CUSTOMER_PART_DESC,data0064.ovsh_discount,
  (data0064.QUAN_SHIPPED+data0064.ovsh_qty) as qty_shipped,
  (select sum(a.quan_shipped+a.ovsh_qty) from Data0064 a inner join Data0439 b on a.packing_list_ptr = b.rkey
     where b.use_stauts =9 and a.so_ptr=data0064.so_ptr ) as so_shiped,
  round(data0064.QUAN_SHIPPED*(round(case data0060.tax_in_price when ''Y'' 
    then convert(dec(18,4),data0060.part_price) else convert(dec(18,4),data0060.part_price)
    *(1+state_tax/100) end,4))
	+(100.0-ovsh_discount)*data0064.ovsh_qty*(round(case data0060.tax_in_price when ''Y'' 
    then convert(dec(18,4),data0060.part_price) else convert(dec(18,4),data0060.part_price)
    *(1+state_tax/100) end,4))*0.01,2) as tax_amount,
  (QUAN_SHIPPED+data0064.ovsh_qty)*data0050.REPORT_UNIT_VALUE1*0.0001 as weigth 
 ,data0064.addnote1,data0064.addnote2,data0064.addnote3,data0064.addnote4,data0064.addnote5,data0064.addnote6,
case data0060.so_style when 0 then ''正式订单''
                       when 1 then ''免费订单''
                       when 2 then ''退货订单''
                       when 3 then ''备料订单'' 
                       when 4 then ''外包订单''
                       when 5 then ''预付费订单''
                       when 6 then ''内部订单''
                       when 7 then ''临时订单'' end as SoStyle
from data0064 inner join data0060 on data0064.so_ptr=data0060.rkey
  inner join data0050 on data0060.cust_part_ptr=data0050.rkey
  left join data0097 on data0060.purchase_order_ptr=data0097.rkey
  left join DATA0059 on Data0060.CUSTOMER_PTR = data0059.customer_ptr 
    AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  inner join data0005 on data0064.ENT_EMPL_PTR = Data0005.RKEY
  left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
where  data0064.packing_list_ptr=@P1
order by Data0097.po_number,data0059.customer_part_desc
',N'@P1 varchar(16)','3552'

--------------------------审核通过

update data0274 set D439_audit_Remark =''
 ,auth_date = '2013-09-05'
 ,user_ptr = '1'
where rkey = 9047


if exists(select 1 from tempdb..sysobjects where id=object_id('tempdb..#tmp')) drop table #tmp 
select data0053.rkey,quan_shp=sum(data0052.quan_shp) into #tmp From Data0439 inner join Data0064 on Data0439.Rkey=Data0064.packing_list_ptr inner join 
Data0052 on Data0064.Rkey=Data0052.so_shp_ptr inner join Data0053 on Data0052.Data0053_ptr=Data0053.Rkey where isnull(Data0439.audited_by_ptr,0)=0 
and Data0439.rkey=3556
group by data0053.rkey   
Update Data0053 Set Data0053.to_be_audit=IsNull(#tmp.quan_shp,0) From Data0053 inner join  #tmp on Data0053.Rkey=#tmp.Rkey 
where Data0053.to_be_audit<>IsNull(#tmp.quan_shp,0)

update Data0053 set to_be_audit=to_be_audit -221
 ,FinishShip=FinishShip + 221
 where rkey = 21273
 
 update data0439 set use_stauts = 9,ranking =2
 ,audited_date = '2013-09-05'
 ,audited_by_ptr = '1'
where rkey = 3556

 
