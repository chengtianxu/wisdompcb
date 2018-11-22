--ep275工具管理增加工具
--共用工具不能修改
create PROCEDURE EP100;97 
@vptr int --DATA0025.RKEY
with encryption
AS
SELECT data0025.manu_part_number,data0034.dept_name,data0038.step_number,data0030.tool_tp_name,
data0033.tool_ptr,data0033.rkey as d033_rkey,data0033.d038_ptr,data0033.d031_ptr,data0031.mark,
data0033.tp_flag,data0033.cust_part_ptr,data0031.description,data0031.filename,data0042.rkey as d042_rkey,
data0031.rkey as d031_rkey,data0031.tool_tp_ptr as tool_type_ptr,data0038.rkey as d038_rkey,data0032.*,data0042.*
FROM dbo.Data0032 INNER JOIN
      dbo.Data0042 ON dbo.Data0032.RKEY = dbo.Data0042.tool_ptr RIGHT OUTER JOIN
      dbo.Data0038 INNER JOIN
      dbo.Data0025 ON dbo.Data0038.SOURCE_PTR = dbo.Data0025.RKEY INNER JOIN
      dbo.Data0034 ON dbo.Data0038.DEPT_PTR = dbo.Data0034.RKEY INNER JOIN
      dbo.Data0031 ON dbo.Data0034.DEPT_PTR = dbo.Data0031.DEPT_PTR INNER JOIN
      dbo.Data0030 ON 
      dbo.Data0031.TOOL_TP_PTR = dbo.Data0030.RKEY LEFT OUTER JOIN
      dbo.Data0033 ON dbo.Data0031.RKEY = dbo.Data0033.D031_PTR AND 
      dbo.Data0033.D038_PTR = dbo.Data0038.RKEY ON 
      dbo.Data0032.RKEY = dbo.Data0033.Tool_ptr
WHERE (dbo.Data0025.ANCESTOR_PTR = @vptr)
and dbo.data0038.flow_no=0
ORDER BY dbo.Data0025.RKEY, dbo.Data0038.STEP_NUMBER,data0031.seq_no
GO

create PROCEDURE EP100;99 
with encryption
AS
SELECT * from data0033 where rkey is null
GO
