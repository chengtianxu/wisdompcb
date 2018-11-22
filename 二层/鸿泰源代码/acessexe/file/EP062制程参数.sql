EP062制程参数
exec EP062;1 348
CREATE PROCEDURE EP062
@vptr int
with encryption
AS
select * from data0506
where ttype=3 and source_ptr=@vptr --data0034.rkey工序
ORDER by seq_no
GO

--SELECT * FROM data0034 WHERE rkey=348



select data0278.parameter_desc,data0494.parameter_value,data0002.unit_name as unit_code,data0506.rkey,data0494.SOURCE_PTR,data0506.rkey d506rkey,data0494.rkey d494rkey,
data0002.rkey,data0494.production_flag
from data0278,data0002,Data0494 
left join data0506 on 
 data0506.rkey=data0494.source_ptr
where data0494.route_step_ptr=279318
and data0494.parameter_ptr=data0278.rkey
--and data0506.doc_flag='Y' 
and (data0506.doc_flag='Y' or isnull(data0506.rkey,0)=0)  --这个是显示以前输入目前不需要的参数
and data0002.rkey=data0278.unit_ptr
and data0494.parameter_value<>''
--and data0494.parameter_value<>'0'
ORDER BY 
data0506.seq_no

-------------------------------------
或直接去除  exec EP100;57
or isnull(data0506.rkey,0)=0