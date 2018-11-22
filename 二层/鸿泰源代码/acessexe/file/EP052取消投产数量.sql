--EP052取消投产数量
--相同型号在EP052合并投产，转入为负数，转出为正数,如果取消投产，这个待投产只会全部返加这个单，而不会回到合并另一个单
--这级采用级联删除，如果这个关系掉了，会出现468表和492表链接没办法删除，原因这边只删除492，语句里没有删除468
--to_be_planned=parts_order-QTY_PLANNNED-ppc_trans_qty(合并投产)

exec sp_executesql N'UPDATE "SJ_V20_live".."data0050" 
SET "firm_rel_s"=@P1,"Planned_rel_s"=@P2 
WHERE "Rkey"=@P3 AND "firm_rel_s"=@P4 AND "Planned_rel_s"=@P5',
N'@P1 smallint,@P2 smallint,@P3 int,@P4 smallint,@P5 smallint',
3,-1,1660,2,0

exec sp_executesql N'UPDATE "SJ_V20_live".."data0360" 
SET "planned_qty"=@P1 
WHERE "rkey"=@P2 AND "planned_qty"=@P3',
N'@P1 int,@P2 int,@P3 int',
0,9337,200

exec sp_executesql N'delete data0048 where wo_ptr in ( 
select rkey from data0006 
where cut_no=@P1 )
',N'@P1 varchar(20)','131205002-0         '

insert into data0318([SALES_ORDER_PTR],
[TRANS_TYPE], [TRANS_DESCRIPTION],
[FROM_STRING], [TO_STRING], [USER_PTR], [TRANS_DATE],
[PROGRAM_SOURCE])
values(9550,15,'整批取消投产(原因:test)','配料单:131205002-0取消前S/O待投产数量:0已投产数量:1200','取消投产数量:1000',1,'2013-12-05 12:25:25',52)


exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0492" 
                     WHERE "rkey"=@P1',N'@P1 int',11506