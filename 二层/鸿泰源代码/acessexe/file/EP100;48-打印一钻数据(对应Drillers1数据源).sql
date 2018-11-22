--EXEC EP100;48 36872
DECLARE @vptr INT

SET @vptr = 36872   /* 部件指针 */
BEGIN
	SELECT *
	FROM   DATA0029
	WHERE  source_ptr      = @vptr
	       AND flow_no     = 0
	ORDER BY
	       SEQ_NO
END
DATA0029 钻孔、埋盲钻孔 FLOW_NO来分的
DATA0229塞孔铝片钻孔
DATA0230锣刀
