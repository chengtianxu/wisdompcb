--提交审核人条件过滤
exec sp_executesql N'select data0265.* from data0265,data0264
where Data0264.ttype=1 and data0264.rkey=1  --???
and data0264.rkey=data0265.auth_group_ptr and (data0265.mrb_flag=2 or data0265.mrb_flag=0)
and (UPPER_LIMIT <=@P1) AND (LOWER_LIMIT >= @P2) 
ORDER BY data0265.rkey
',N'@P1 float,@P2 float',79.811099999999996,79.811099999999996

select * from  data0264 --主审核
select * from  data0265 --审核明细
 left join data0264 on data0265.AUTH_GROUP_PTR =data0264 .RKEY
 
--data0264.ttype 0：报价审批流程；1报废审批流程

exec sp_executesql N'select data0265.* from data0265,data0264
where Data0264.ttype=1 
--and data0264.rkey=1 --???
and data0264.rkey=data0265.auth_group_ptr and (data0265.mrb_flag=2 or data0265.mrb_flag=1)
and (UPPER_LIMIT <=@P1) AND (LOWER_LIMIT >= @P2) 
ORDER BY data0265.rkey
',N'@P1 float,@P2 float',0.25,0.25


--写入审核信息

exec sp_executesql N'select * from data0274 where mrb_ptr=@P1
',N'@P1 int',13852
exec sp_executesql N'SET NOCOUNT OFF; 
INSERT INTO "SJ_V20_Sample".."data0274" ("user_ptr","ranking","mrb_ptr") 
VALUES (@P1,@P2,@P3); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 tinyint,@P3 int',1,1,13852

--修改报废记录
update data0158 set status=1,AUDIT_EMPL_PTR=1,AUDIT_DATETIME=null  where rkey=13852

