ep141全局码DATA004增加
declare @vptr int
select @vptr=count(*) from data0004 where rkey=70
if @vptr=0
INSERT INTO Data0004
           ([CONTROL_NO_LENGTH]
           ,[SEED_MEAN]
           ,[BIG5_SEED_MEAN]
           ,[SEED_VALUE]
           ,[SEED_FLAG]
           ,[table_name])
     VALUES
           (10
           ,'销售出仓单号'
           ,'销售出仓单号'
           ,'X10000001'
           ,4
           ,'DATA0457')

