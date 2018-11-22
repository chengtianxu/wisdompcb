--删除备份存储过程和表
--exec sp_stored_procedures

--select name from sys.procedures WHERE CHARINDEX('bak',NAME)>0
--select name from sys.tables where CHARINDEX('_',NAME)>0

DECLARE @name varchar(40)
DECLARE authors_cursor CURSOR FOR
select name from sys.tables WHERE CHARINDEX('_',NAME)>0 ORDER BY  name
--select name from sys.procedures WHERE CHARINDEX('_',NAME)>0 ORDER BY  name

OPEN authors_cursor

-- Perform the first fetch and store the values in variables.
-- Note: The variables are in the same order as the columns
-- in the SELECT statement. 

FETCH NEXT FROM authors_cursor
INTO @name -- Check @@FETCH_STATUS to see if there are any more rows to fetch.
WHILE @@FETCH_STATUS = 0
BEGIN

   -- Concatenate and display the current values in the variables.
   --PRINT @name
 
--PRINT  ('drop proc ['+ @name+']' )
 --EXEC ('drop proc ['+ @name+']' )
 EXEC ('drop table ['+ @name+']' )
   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM authors_cursor
   INTO @name
END

CLOSE authors_cursor
DEALLOCATE authors_cursor
GO


