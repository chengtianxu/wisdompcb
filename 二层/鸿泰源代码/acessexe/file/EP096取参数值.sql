--EP096取参数值
SELECT * FROM data0278 
WHERE 
--PARAMETER_desc LIKE ''
--parameter_name LIKE ''
SPEC_RKEY ='B'
--统计参数
tj.PARAMETER_VALUE ''
(SELECT data0047.SOURCE_POINTER,data0047.PARAMETER_VALUE FROM data0047 WHERE data0047.PARAMETER_PTR=3 ) tj ON data0025.rkey=tj.source_pointer
--全局参数
qj.PARAMETER_VALUE ''
(SELECT data0279.SOURCE_ptr,data0279.PARAMETER_VALUE FROM data0279 WHERE data0279.PARAMETER_PTR=3 ) qj ON data0025.rkey=qj.source_pointer

--工序参数
gx.PARAMETER_VALUE ''
(SELECT data0038.SOURCE_ptr,data0494.PARAMETER_VALUE 
 FROM data0494
 JOIN data0038 ON data0494.ROUTE_step_ptr=data0038.rkey
 WHERE data0494.PARAMETER_PTR=3 ) gx ON data0025.rkey=gx.source_pointer





