select * from data0439 
select rkey,delivery_no,customer_ptr,ship_addr_ptr,employee_ptr,
unit_ptr,invoice_ptr,currency_ptr,shipping_method,cartons_no,weight,net_weight,date_sailing,date_ent,
charge,Remark,print_date,AMOUNT,TSTATUS
 from [192.168.1.253].sj_v20_live.dbo.data0439  
 where date_ent>='2016-01-01'  and len(Remark)>200


alter table data0439 alter column Remark varchar(255) 

SET IDENTITY_INSERT data0439  ON
insert into data0439 (rkey,delivery_no,customer_ptr,ship_addr_ptr,employee_ptr,
unit_ptr,invoice_ptr,currency_ptr,shipping_method,cartons_no,weight,net_weight,date_sailing,date_ent,
charge,Remark,print_date,AMOUNT,TSTATUS)
select rkey, cast(delivery_no as varchar(10)) as delivery_no,customer_ptr,ship_addr_ptr,employee_ptr,
unit_ptr,invoice_ptr,currency_ptr, cast(shipping_method as varchar(20)) as shipping_method,cartons_no,weight,net_weight,date_sailing,date_ent,
charge,Remark,print_date,AMOUNT,TSTATUS
 from [192.168.1.253].sj_v20_live.dbo.data0439  
 where date_ent>='2016-01-01'

SET IDENTITY_INSERT data0439 off

select * from Data0064
select RKEY,SO_PTR,ENT_EMPL_PTR,ENT_CSI_USER_PTR,packing_list_ptr,DATE_ASSIGN,
DATE_SHIPPED,PACKING_SLIP_FLAG,SHIPMENT_NO,QUAN_SHIPPED,QUAN_CREDITED,RMA_PTR,
part_price,rush_charge,prod_tax_flag,tool_tax_flag,discount,TAX_2,
reg_tax_fixed_unused,REMARK,assign_type
 from [192.168.1.253].sj_v20_live.dbo.data0064  where SO_PTR in (select RKEY from Data0060)


SET IDENTITY_INSERT data0064  ON
insert into data0064 ( RKEY,SO_PTR,ENT_EMPL_PTR,ENT_CSI_USER_PTR,packing_list_ptr,DATE_ASSIGN,
DATE_SHIPPED,PACKING_SLIP_FLAG,SHIPMENT_NO,QUAN_SHIPPED,QUAN_CREDITED,RMA_PTR,
part_price,rush_charge,prod_tax_flag,tool_tax_flag,discount,TAX_2,
reg_tax_fixed_unused,REMARK,assign_type)
select  RKEY,SO_PTR,ENT_EMPL_PTR,ENT_CSI_USER_PTR,packing_list_ptr,DATE_ASSIGN,
DATE_SHIPPED,PACKING_SLIP_FLAG,SHIPMENT_NO,QUAN_SHIPPED,QUAN_CREDITED,RMA_PTR,
part_price,rush_charge,prod_tax_flag,tool_tax_flag,discount,TAX_2,
reg_tax_fixed_unused,REMARK,assign_type 
from  [192.168.1.253].sj_v20_live.dbo.data0064  where SO_PTR in (select RKEY from Data0060)

SET IDENTITY_INSERT data0064  off


select SO_SHP_PTR,boxes into #22 from  [192.168.1.253].sj_v20_live.dbo.data0322


select * from Data0064
--update data0064 set cartons_no=(select  boxes  from #22 where data0064.RKEY =#22.SO_SHP_PTR)
where RKEY in (select  SO_SHP_PTR from #22 where data0064.RKEY =#22.SO_SHP_PTR)