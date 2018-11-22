SELECT * FROM DATA0419 WHERE PROGRAME = 'qwzpr85Report.exe'
BEGIN TRANSACTION compile_all --开始事务
  declare @description1 varchar(50),
          @description2 varchar(50),
          @description varchar(50),
          @PROGRAME varchar(50),
          @PREV_TP char(5),
          @exe_flag smallint
  set @description1 = '智能报价系统' --一级菜单名
  set @description2 = '基本资料维护' --二组菜单名
--'将表DATA0511中的图片BMP格式转为JPEG格式'
  set @description ='快速报价　报表设计(快板)' --标识 
--'WZPR511.exe'
  set @PROGRAME = 'qwzpr85Report.exe' --程序名字
  set @PREV_TP = 'W/R' --读写权限
  set @exe_flag = 1 --1:exe
  --select * from data0419 where description = @description1
  --查找一级菜单的RKEY值
  declare @ancestor_ptr int
  set @ancestor_ptr =(select top 1 rkey from data0419 where description =@description1)
  print @ancestor_ptr
  --查找二级菜单的RKEY值
  --select * from data0419 where description = @description2
  declare @parent_ptr int
  set @parent_ptr = (select top 1 rkey from data0419 where description =@description2 and ancestor_ptr=@ancestor_ptr)
  print @parent_ptr
  --查找出最大的SEQ_NO值，并将值加1,为新增记录做新序号值
  --select * from data0419 where description = '快速报价 系统'
  declare @SEQ_NO int
  --SELECT MAX(SEQ_NO) AS maxSEQ_NO FROM dbo.Data0419 WHERE (ANCESTOR_PTR = @ancestor_ptr) AND (PARENT_PTR = @parent_ptr)
  set @SEQ_NO=(SELECT MAX(SEQ_NO)+1 AS maxSEQ_NO
                    FROM dbo.Data0419
                WHERE (ANCESTOR_PTR = @ancestor_ptr) AND (PARENT_PTR = @parent_ptr))

  print @ancestor_ptr
  print @parent_ptr
  print '@SEQ_NO='
  print @SEQ_NO
  
  --查出表419的字段名（除RKEY外），并用在表中新增一条旧的记录值，然后将新增的记录改一些字段值，使之可用
  declare @exesql varchar(1000),
          @exesql2 varchar(255)
  set @exesql = '' 
  declare @i int,@maxi int
  set @i=1
  set @maxi=(SELECT TOP 100 PERCENT MAX(syscolumns.colid) AS Expr1
                    FROM syscolumns INNER JOIN
                        sysobjects ON syscolumns.id = sysobjects.id
                    WHERE (sysobjects.name = N'data0419'))
  while (@maxi>@i)
    begin
      set @i = @i + 1
      set @exesql2 = (SELECT TOP 100 PERCENT syscolumns.name 
                       FROM syscolumns INNER JOIN
                              sysobjects ON syscolumns.id = sysobjects.id
                       WHERE (sysobjects.name = N'data0419')
                             and syscolumns.colid = @i)
      if (@maxi <> @i) 
         set @exesql =ltrim(rtrim(@exesql)) + ltrim(rtrim(@exesql2))+','
      else if (@maxi = @i) 
         set @exesql =ltrim(rtrim(@exesql)) + ltrim(rtrim(@exesql2))   
      --print @exesql2
    end

  set @exesql ='INSERT INTO data0419('+ltrim(rtrim(@exesql)) +') select top 1  '+ ltrim(rtrim(@exesql)) +
                ' from data0419 where (ANCESTOR_PTR =' +CONVERT(varchar(10),@ancestor_ptr)+') AND (PARENT_PTR ='+ CONVERT(varchar(10),@parent_ptr)+')'
  --print @exesql
  exec(@exesql)

  declare @rkey int
  set @rkey = (select top 1 rkey from data0419 order by rkey DESC)
  --print @rkey
  
  update data0419
     set seq_no = @seq_no,
         exe_flag = @exe_flag,
         [description] =@description,
         PROGRAME = @PROGRAME,
         PREV_TP = @PREV_TP
     where rkey = @rkey
  --检查DATA0419表中是否有字段PROGRAM，如果有就改变新增记录的对应的PROGRAM的值
  IF EXISTS(SELECT TOP 100 PERCENT syscolumns.colid
        FROM syscolumns INNER JOIN
                     sysobjects ON syscolumns.id = sysobjects.id
            WHERE (sysobjects.name = N'data0419') AND
                 (syscolumns.name = N'PROGRAM'))
    BEGIN
      SET @exesql = 'update data0419 set PROGRAM ='''+ LTRIM(RTRIM(@PROGRAME))
             +''' where rkey ='+CONVERT(varchar(10),@rkey)
      EXEC(@exesql)
    END
  select * from data0419 --显示表data0419所有的记录值　
if @@error = 0 --是否出错
  commit tran compile_all --提交事务
else
  rollback tran compile_all --回滚事务

  -- delete data0419 where rkey = 453  --删除记录
