--exec EP100;132 36872  -- FLOW_NO-×ê¿×¡¢ÂñÃ¤×ê¿×   (0-1×ê¡¢1-2×ê\2-3×ê\3-ÂñÃ¤1×ê¡¢4-ÂñÃ¤2×ê)
DECLARE @vptr INT

BEGIN
	SELECT *
	FROM   DATA0029
	WHERE  source_ptr = @vptr
	       AND flow_no >= 1
	ORDER BY
	       flow_no,
	       SEQ_NO
END

DATA0029 ×ê¿×¡¢ÂñÃ¤×ê¿× FLOW_NOÀ´·ÖµÄ
DATA0229Èû¿×ÂÁÆ¬×ê¿×
DATA0230Âàµ¶
