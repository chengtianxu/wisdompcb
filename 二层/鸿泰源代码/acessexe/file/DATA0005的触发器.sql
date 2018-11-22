--EP120职员管理报无法定位
--因为触发器，当5表有数据73表没数据触发器更新报错，直接运行不会报错
IF EXISTS (
       SELECT NAME
       FROM   sysobjects
       WHERE  NAME         = 'data0005_1'
              AND TYPE     = 'TR'
   )
    DROP TRIGGER data0005_1
GO

UPDATE data0073
SET    active_flag = CASE 
                          WHEN data0005.active_flag = 'Y' THEN 0
                          ELSE 1
                     END
FROM   data0073,
       data0005
WHERE  data0073.EMPLOYEE_PTR = data0005.rkey
GO

CREATE TRIGGER [data0005_1]
ON [dbo].[data0005] 
   WITH ENCRYPTION
FOR  UPDATE
AS
	DECLARE @P1 INT 
	DECLARE @InserRkey INT 
	SELECT @InserRkey = rkey
	FROM   INSERTED
	
	SELECT @P1 = COUNT(*)
	FROM   data0073
	WHERE  data0073.EMPLOYEE_PTR = @InserRkey
	
	IF @P1 > 0
	BEGIN
	    UPDATE data0073
	    SET    active_flag = CASE 
	                              WHEN INSERTED.active_flag = 'Y' THEN 0
	                              ELSE 1
	                         END
	    FROM   data0073,
	           INSERTED
	    WHERE  data0073.EMPLOYEE_PTR = INSERTED.rkey
	END ;
	--SELECT * FROM data0073
GO