专用管理员admin:.          admin:主机名\实例名
先用1参数，再用0参数 
1\exec DecryProc 存储过程名,1
2\exec DecryProc 存储过程名,0

ALTER PROCEDURE [dbo].[DecryProc]
(@procedure SYSNAME = NULL, @revfl INT = 1)
AS
	/**//*
	王成辉翻译整理，转贴请注明出自微软BI开拓者www.windbi.com
	调用形式为：
	exec dbo.sp__windbi$decrypt @procedure,0
	如果第二个参数使用1的话，会给出该存储过程的一些提示。
	--版本4.0  修正存储过程过长解密出来是空白的问题
	*/
	SET NOCOUNT ON
	IF @revfl = 1
	BEGIN
	    PRINT '警告：该存储过程会删除并重建原始的存储过程。'
	    PRINT ' 在运行该存储过程之前确保你的数据库有一个备份。'
	    PRINT ' 该存储过程通常应该运行在产品环境的一个备份的非产品环境下。'
	    PRINT ' 为了运行这个存储过程，将参数@refl的值更改为0。'
	    RETURN 0
	END
	
	DECLARE @intProcSpace       BIGINT,
	        @t                  BIGINT,
	        @maxColID           SMALLINT,
	        @procNameLength     INT
	
	SELECT @maxColID = MAX(subobjid)
	FROM   sys.sysobjvalues
	WHERE  objid = OBJECT_ID(@procedure)  /* @maxColID = 2  */
	--select @maxColID as 'Rows in sys.sysobjvalues'
	
	DECLARE @real_01 NVARCHAR(MAX)
	DECLARE @fake_01 NVARCHAR(MAX)
	DECLARE @fake_encrypt_01 NVARCHAR(MAX)
	DECLARE @real_decrypt_01 NVARCHAR(MAX),
	        @real_decrypt_01a NVARCHAR(MAX)
	
	DECLARE @objtype        VARCHAR(2),
	        @ParentName     NVARCHAR(MAX)
	
	SELECT @real_decrypt_01a = ''
	--提取对象的类型如是存储过程还是函数，如果是触发器，还要得到其父对象的名称
	SELECT @objtype = TYPE,
	       @parentname     = OBJECT_NAME(parent_object_id)
	FROM   sys.objects
	WHERE  [object_id]     = OBJECT_ID(@procedure)
	-- 从sys.sysobjvalues里提出加密的imageval记录
	-- 
		--创建一个临时表
	CREATE TABLE #output
	(
		[ident]            [int] IDENTITY(1, 1) NOT NULL,
		[real_decrypt]     NVARCHAR(MAX)
	)
	CREATE TABLE #CommentText
	(
		LineId     INT,
		TEXT       NVARCHAR(255) COLLATE database_default
	)
	
		DECLARE myc1 CURSOR  
	FOR
	 	        SELECT  imageval
	        FROM   sys.sysobjvalues
	        WHERE  objid            = OBJECT_ID(@procedure)
	               AND valclass     = 1
	        ORDER BY
	               subobjid asc 
	               
	DECLARE @dbname              SYSNAME,
	        @BlankSpaceAdded     INT,
	        @BasePos             INT,
	        @CurrentPos          INT,
	        @TextLength          INT,
	        @LineId              INT,
	        @AddOnLen            INT,
	        @LFCR                INT --回车换行的长度
	        ,
	        @DefinedLength       INT,
	        @SyscomText          NVARCHAR(MAX),
	        @Line                NVARCHAR(MAX)
	        
	SELECT @LFCR = 2
	SELECT @LineId = 1    
	    
	open  myc1   
	declare  @p1 int 
	set @p1 = 0   

	          
	--FETCH NEXT FROM myc1 INTO @real_01
	--WHILE @@fetch_status >= 0 
	--begin
	--print @p1
	--set @p1 = @p1 + 1 ;
	--BEGIN TRAN
	--end ;    
	--开始一个事务，稍后回滚
	BEGIN TRAN
	     
	FETCH NEXT FROM myc1 INTO @real_01
	WHILE @@fetch_status >= 0          
	BEGIN
		
    --IF @p1= 0  FETCH NEXT FROM myc1 INTO @real_01 ;
	print @p1
	set @p1 = @p1 + 1 ;


	print '1' + convert(varchar,@real_01)  + '2'   
	SELECT @procNameLength = DATALENGTH(@procedure + ';' + CONVERT(VARCHAR,@p1)) + 29
	--SET @real_01 = (
	--        SELECT TOP 1 imageval
	--        FROM   sys.sysobjvalues
	--        WHERE  objid            = OBJECT_ID(@procedure)
	--               AND valclass     = 1
	--        ORDER BY
	--               subobjid asc 
	--    )
	


	--更改原始的存储过程，用短横线替换
	IF @objtype = 'P'
	    SET @fake_01 = 'ALTER PROCEDURE ' + @procedure  + ';'+ CONVERT(VARCHAR,@p1) +
	        ' WITH ENCRYPTION AS select 1
  /**//*' + REPLICATE(
	            CAST('*'AS NVARCHAR(MAX)),
	            DATALENGTH(@real_01) / 2 - @procNameLength
	        ) + '*/'
	ELSE 
	IF @objtype = 'FN'
	    SET @fake_01 = 'ALTER FUNCTION ' + @procedure + 
	        '() RETURNS INT WITH ENCRYPTION AS BEGIN RETURN 1
  /**//*' + REPLICATE(
	            CAST('*'AS NVARCHAR(MAX)),
	            DATALENGTH(@real_01) / 2 - @procNameLength
	        ) + '*/ END'
	ELSE 
	IF @objtype = 'V'
	    SET @fake_01 = 'ALTER view ' + @procedure + ';'+CONVERT(VARCHAR,@p1) +
	        ' WITH ENCRYPTION AS select 1 as col
  /**//*' + REPLICATE(
	            CAST('*'AS NVARCHAR(MAX)),
	            DATALENGTH(@real_01) / 2 - @procNameLength
	        ) + '*/'
	ELSE 
	IF @objtype = 'TR'
	    SET @fake_01 = 'ALTER trigger ' + @procedure + ' ON ' + @parentname + 
	        'WITH ENCRYPTION AFTER INSERT AS RAISERROR (''N'',16,10)
  /**//*' + REPLICATE(
	            CAST('*'AS NVARCHAR(MAX)),
	            DATALENGTH(@real_01) / 2 - @procNameLength
	        ) + '*/'
	PRINT @fake_01
	EXECUTE (@fake_01)
	--从sys.sysobjvalues里提出加密的假的
	
	--DECLARE @sql VARCHAR(1000)
	--SET @sql =  ' SELECT TOP 1 imageval ( 
	--	   SELECT TOP'  + convert(varchar,@p1) + ' imageval , subobjid
	--        FROM   sys.sysobjvalues
	--        WHERE  objid            = OBJECT_ID( ' + @procedure + ')
	--               AND valclass     = 1
	--        ORDER BY
	--               subobjid ASC ) ORDER BY  subobjid DESC '
	
	DECLARE  MYC2 CURSOR FOR 
	SELECT  imageval 
	        FROM   sys.sysobjvalues
	        WHERE  objid            = OBJECT_ID(@procedure)
	               AND valclass     = 1
	        ORDER BY
	               subobjid ASC
	             
	 OPEN   MYC2            
	 DECLARE @P2 INT 
	 SET @P2 = 1 
	 
	 
	 FETCH NEXT FROM MYC2 INTO @fake_encrypt_01
	WHILE @@fetch_status >= 0
	BEGIN
	  IF @P2=@P1  BREAK ;
	  
	  SET @P2 = @P2 + 1 ;
	  FETCH NEXT FROM MYC2 INTO @fake_encrypt_01
	END;
	
	CLOSE  MYC2
	DEALLOCATE MYC2  
	
	--SET @fake_encrypt_01 = (SELECT TOP 1 imageval (
	--        SELECT TOP @p1 imageval , subobjid
	--        FROM   sys.sysobjvalues
	--        WHERE  objid            = OBJECT_ID(@procedure)
	--               AND valclass     = 1
	--        ORDER BY
	--               subobjid ASC) ORDER BY  subobjid DES 
	--)
   PRINT @fake_encrypt_01
   
	--SET @fake_encrypt_01 = @real_01
	IF @objtype = 'P'
	    SET @fake_01 = 'Create PROCEDURE ' + @procedure  + ';'+ CONVERT(VARCHAR,@p1) +
	        ' WITH ENCRYPTION AS select 1
  /**//*' + REPLICATE(
	            CAST('*'AS NVARCHAR(MAX)),
	            DATALENGTH(@real_01) / 2 - @procNameLength
	        ) + '*/'
	ELSE 
	IF @objtype = 'FN'
	    SET @fake_01 = 'CREATE FUNCTION ' + @procedure + 
	        '() RETURNS INT WITH ENCRYPTION AS BEGIN RETURN 1
  /**//*' + REPLICATE(
	            CAST('*'AS NVARCHAR(MAX)),
	            DATALENGTH(@real_01) / 2 - @procNameLength
	        ) + '*/ END'
	ELSE 
	IF @objtype = 'V'
	    SET @fake_01 = 'Create view ' + @procedure + 
	        ' WITH ENCRYPTION AS select 1 as col
  /**//*' + REPLICATE(
	            CAST('*'AS NVARCHAR(MAX)),
	            DATALENGTH(@real_01) / 2 - @procNameLength
	        ) + '*/'
	ELSE 
	IF @objtype = 'TR'
	    SET @fake_01 = 'Create trigger ' + @procedure + ' ON ' + @parentname + 
	        'WITH ENCRYPTION AFTER INSERT AS RAISERROR (''N'',16,10)
  /**//*' + REPLICATE(
	            CAST('*'AS NVARCHAR(MAX)),
	            DATALENGTH(@real_01) / 2 - @procNameLength
	        ) + '*/'
	--开始计数
	SET @intProcSpace = 1
	--使用字符填充临时变量
	SET @real_decrypt_01 = REPLICATE(CAST('A'AS NVARCHAR(MAX)), (DATALENGTH(@real_01) / 2))
	--循环设置每一个变量，创建真正的变量
	--每次一个字节
	SET @intProcSpace = 1
	--如有必要，遍历每个@real_xx变量并解密
	PRINT DATALENGTH(@real_01)
	WHILE @intProcSpace <= (DATALENGTH(@real_01) / 2)
	BEGIN
	    --真的和假的和加密的假的进行异或处理
	    SET @real_decrypt_01 = STUFF(
	            @real_decrypt_01,
	            @intProcSpace,
	            1,
	            NCHAR(
	                UNICODE(SUBSTRING(@real_01, @intProcSpace, 1)) ^(
	                    UNICODE(SUBSTRING(@fake_01, @intProcSpace, 1)) ^
	                    UNICODE(SUBSTRING(@fake_encrypt_01, @intProcSpace, 1))
	                )
	            )
	        )
	    
	    SET @intProcSpace = @intProcSpace + 1
	END
	
	
	--通过sp_helptext逻辑向表#output里插入变量
	
	DELETE FROM  #output
	
	INSERT #output
	  (
	    real_decrypt
	  )
	SELECT @real_decrypt_01
	--select real_decrypt AS '#output chek' from #output --测试
	-- -------------------------------------
	--开始从sp_helptext提取
	-- -------------------------------------

	SELECT @DefinedLength = 255
	SELECT @BlankSpaceAdded = 0 --跟踪行结束的空格。注意Len函数忽略了多余的空格

	--使用#output代替sys.sysobjvalues
	DECLARE ms_crs_syscom CURSOR LOCAL 
	FOR
	    SELECT real_decrypt
	    FROM   #output
	    ORDER BY
	           ident
	           FOR READ ONLY
	--获取文本

	OPEN ms_crs_syscom
	FETCH NEXT FROM ms_crs_syscom INTO @SyscomText
	WHILE @@fetch_status >= 0
	BEGIN
	    SELECT @BasePos = 1
	    SELECT @CurrentPos = 1
	    SELECT @TextLength = LEN(@SyscomText)
	    PRINT @TextLength
	    WHILE @CurrentPos != 0
	    BEGIN
	        --通过回车查找行的结束
	        SELECT @CurrentPos = CHARINDEX(CHAR(13) + CHAR(10), @SyscomText, @BasePos)
	        --如果找到回车
	        IF @CurrentPos != 0
	        BEGIN
	            --如果@Lines的长度的新值比设置的大就插入@Lines目前的内容并继续
	            WHILE (
	                      ISNULL(LEN(@Line), 0) + @BlankSpaceAdded +
	                      @CurrentPos -@BasePos + @LFCR
	                  ) > @DefinedLength
	            BEGIN
	                SELECT @AddOnLen = @DefinedLength -(ISNULL(LEN(@Line), 0) + @BlankSpaceAdded)
	                INSERT #CommentText
	                VALUES
	                  (
	                    @LineId,
	                    ISNULL(@Line, N'') + ISNULL(SUBSTRING(@SyscomText, @BasePos, @AddOnLen), N'')
	                  )
	                SELECT @Line = NULL,
	                       @LineId      = @LineId + 1,
	                       @BasePos     = @BasePos + @AddOnLen,
	                       @BlankSpaceAdded = 0
	            END
	            SELECT @Line = ISNULL(@Line, N'') +
	                   ISNULL(
	                       SUBSTRING(@SyscomText, @BasePos, @CurrentPos -@BasePos + @LFCR),
	                       N''
	                   )
	            
	            SELECT @BasePos = @CurrentPos + 2
	            INSERT #CommentText
	            VALUES
	              (
	                @LineId,
	                @Line
	              )
	            SELECT @LineId = @LineId + 1
	            SELECT @Line = NULL
	        END
	        ELSE
	            --如果回车没找到
	        BEGIN
	            IF @BasePos <= @TextLength
	            BEGIN
	                --如果@Lines长度的新值大于定义的长度
	                WHILE (
	                          ISNULL(LEN(@Line), 0) + @BlankSpaceAdded +
	                          @TextLength -@BasePos + 1
	                      ) > @DefinedLength
	                BEGIN
	                    SELECT @AddOnLen = @DefinedLength -(ISNULL(LEN(@Line), 0) + @BlankSpaceAdded)
	                    INSERT #CommentText
	                    VALUES
	                      (
	                        @LineId,
	                        ISNULL(@Line, N'') + ISNULL(SUBSTRING(@SyscomText, @BasePos, @AddOnLen), N'')
	                      )
	                    SELECT @Line = NULL,
	                           @LineId      = @LineId + 1,
	                           @BasePos     = @BasePos + @AddOnLen,
	                           @BlankSpaceAdded = 0
	                END
	                SELECT @Line = ISNULL(@Line, N'') +
	                       ISNULL(
	                           SUBSTRING(@SyscomText, @BasePos, @TextLength -@BasePos + 1),
	                           N''
	                       )
	                
	                IF LEN(@Line) < @DefinedLength
	                   AND CHARINDEX(' ', @SyscomText, @TextLength + 1) > 0
	                BEGIN
	                    SELECT @Line = @Line + ' ',
	                           @BlankSpaceAdded = 1
	                END
	            END
	        END
	    END
	    FETCH NEXT FROM ms_crs_syscom INTO @SyscomText
	END
	IF @Line IS NOT NULL
	    INSERT #CommentText
	    VALUES
	      (
	        @LineId,
	        @Line
	      )
	CLOSE ms_crs_syscom
	DEALLOCATE ms_crs_syscom  

	
    FETCH NEXT FROM myc1 INTO @real_01  
     
END ;
	CLOSE myc1
	DEALLOCATE myc1  
	
	SELECT TEXT
	FROM   #CommentText
	ORDER BY
	       LineId

	--CLOSE ms_crs_syscom
	--DEALLOCATE ms_crs_syscom
	DROP TABLE #CommentText
	-- -------------------------------------
	--结束从sp_helptext提取
	-- -------------------------------------
	--删除用短横线创建的存储过程并重建原始的存储过程
	DROP TABLE #output
    ROLLBACK TRAN

