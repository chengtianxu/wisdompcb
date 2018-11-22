--删除窗口最底层模块菜单
DECLARE @PROGRAM VARCHAR(30);--要删除的执行程序名
SET @PROGRAM='ep766.exe'

------------------------
DECLARE  @ncount INT,@rkey int
select @ncount=0,@rkey=0
select @ncount=count(*) from data0419 where programe=@program

IF @ncount>0 --查找是否存在
 BEGIN
  SELECT @rkey=rkey from data0419 where programe=@program
  DELETE  FROM data0074 WHERE FUNCTION_ID=@rkey
  DELETE  FROM data0073 WHERE rkey=@rkey
  SELECT @ncount,@rkey
end