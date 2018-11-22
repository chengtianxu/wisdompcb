--成品入库单提交审核修改
exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0416" 
SET "ToRemainStock"=@P1,"tstatus"=@P2,"post_date"=@P3,"post_empl_ptr"=@P4,"remark"=@P5 
WHERE "rkey"=@P6 AND "ToRemainStock"=@P7 AND "tstatus"=@P8 AND "post_date" IS NULL AND "post_empl_ptr" IS NULL AND "remark" IS NULL',
N'@P1 tinyint,@P2 tinyint,@P3 datetime,@P4 int,@P5 varchar(1),@P6 int,@P7 tinyint,@P8 tinyint',
0,1,'2013-05-15 10:36:25',1,''
,58540,0,0