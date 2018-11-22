--exec EP100;105 36872 Âàµ¶³ß´ç
DECLARE @vptr INT
SET @vptr = 36872 
BEGIN
	SELECT *
	FROM   DATA0230
	WHERE  source_ptr = @vptr --data0025.rkey
	ORDER BY
	       SEQ_NO
END

DATA0029 ×ê¿×¡¢ÂñÃ¤×ê¿× FLOW_NOÀ´·ÖµÄ
DATA0229Èû¿×ÂÁÆ¬×ê¿×
DATA0230Âàµ¶
