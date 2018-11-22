(--帐目查询
SELECT Data0103.RKEY, Data0103.GL_ACC_NUMBER,Data0103.gl_description,
	CASE data0103.db_cr WHEN 'D' THEN '借方' WHEN 'C' THEN '贷方' END AS db_cr,
	case data0103.curr_tp when 0 then '不核算' when 1 then '核算' when 2 then '核算单一' end  as curr_tp,
	case when data0103_2.GL_DESCRIPTION is not null 
	then data0103_2.GL_DESCRIPTION+'-'+data0103_1.GL_DESCRIPTION+'-'+data0103.GL_DESCRIPTION 
	else case when data0103_1.GL_DESCRIPTION is not null then data0103_1.GL_DESCRIPTION+'-'+data0103.GL_DESCRIPTION 
	else data0103.GL_DESCRIPTION end end as description_2
FROM Data0103 Data0103_2 RIGHT OUTER JOIN Data0103 Data0103_1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR 
	RIGHT OUTER JOIN Data0103 ON Data0103_1.RKEY = Data0103.PARENT_PTR
WHERE dbo.Data0103.HAS_CHILD = 0
) a