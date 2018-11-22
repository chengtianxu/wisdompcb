--exec EP100;102 36872  Èû¿×ÂÁÆ¬×ê¿×

DECLARE @vptr INT
SET @vptr = 36872
BEGIN
	SELECT *
	FROM   DATA0229
	WHERE  source_ptr = @vptr
	ORDER BY
	       SEQ_NO
END

DATA0029 ×ê¿×¡¢ÂñÃ¤×ê¿× FLOW_NOÀ´·ÖµÄ
DATA0229Èû¿×ÂÁÆ¬×ê¿×
DATA0230Âàµ¶
