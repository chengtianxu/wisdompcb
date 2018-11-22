--把73表用户1授权1095
--请购单授权
update data0073 set rpl_pr_ptr=1095
where rkey=1
insert into Data0011(SOURCE_TYPE,file_pointer,memo_text) values(
73,1,'2013-07-04 14:28:37暂时授权1095审理请购单的权限')
--请购单取消授权
update data0073 set rpl_pr_ptr=1
where rkey=1

--采购单授权
update data0073 set rpl_po_ptr=1095
where rkey=1
insert into Data0011(SOURCE_TYPE,file_pointer,memo_text) values(
73,1,'2013-07-04 14:27:32暂时授权1095审理采购单的权限')

--报价单授权
update data0073 set RPL_QO_PTR=1095
where rkey=1
insert into Data0011(SOURCE_TYPE,file_pointer,memo_text) values(
73,1,'2013-07-04 14:26:39暂时授权1095审理报价单的权限')


--申领单授权
update data0073 set RPL_BO_PTR=1095
where rkey=1
insert into Data0011(SOURCE_TYPE,file_pointer,memo_text) values(
73,1,'2013-07-04 14:19:30暂时授权1095审理申领单的权限')


--销售评审授权
update data0073 set RPL_SO_PTR=1095
where rkey=1
insert into Data0011(SOURCE_TYPE,file_pointer,memo_text) values(
73,1,'2013-07-04 14:22:20取消授权1095审理销售评审的权限')

--退货评审授权
update data0073 set Return_SO_PTR=1095
where rkey=1
insert into Data0011(SOURCE_TYPE,file_pointer,memo_text) values(
73,1,'2013-07-04 14:32:26暂时授权1095审理客户退货评审的权限')

--出货评审授权
update data0073 set packing_out_ptr=1095
where rkey=1
insert into Data0011(SOURCE_TYPE,file_pointer,memo_text) values(
73,1,'2013-07-04 14:33:44暂时授权1095审理出货评审的权限')












