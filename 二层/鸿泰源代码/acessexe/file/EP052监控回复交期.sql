ep052出错回复日期不对的监控器
会出现回交期为1899-12-30
出现SMALLDATETIME不对
alter TRIGGER Data0360schdate
ON data0360
FOR  UPDATE
AS
	IF 
	    UPDATE (sch_date)
	
	BEGIN
		DECLARE @old_value DATETIME
		DECLARE @new_vale DATETIME
		
		SELECT @new_vale = sch_date
   
		FROM   INSERTED
		
		SELECT @old_value = sch_date
   
		FROM   deleted		
		
		IF (@old_value IS NOT NULL) and  (@new_vale IS  NULL)
		BEGIN
		    SELECT *
		    FROM   DATA0360触发器提示,非法修改回复交请,请联系管理员
		END;

				
	END;