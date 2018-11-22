
通过入仓单无法找到
1、456表的状态不为0 ，0未审计1已审计2已建凭证3关闭待开票
2、456表里的SUPP_PTR为空
SELECT * FROM Data0456 WHERE  GRN_NUMBER = 'R100062571'  --收货单号


select *from data0079 where  grn_ptr =61134   --收货单号RKEY



select * from  Data0105  where data0105.SOURCE_PTR= 13306   --data0079.INVOICE_PTR