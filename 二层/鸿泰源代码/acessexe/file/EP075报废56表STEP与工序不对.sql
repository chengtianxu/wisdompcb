--EP075报废56表STEP与工序不对
出现报废当前工序不对

SELECT wo_ptr,dept_ptr,* FROM data0056 WHERE wo_ptr=22509
SELECT wo_ptr,dept_ptr,* FROM Data0056 WHERE rkey=1097
SELECT dept_ptr,* FROM data0034 WHERE rkey=859
SELECT flow_no,* FROM data0006 WHERE rkey=948
SELECT * FROM data0038 WHERE SOURCE_PTR=948 AND dept_ptr=858  AND FLOW_NO=0


select data0038.rkey,step_number,data0038.def_rout_inst,data0034.dept_code,
data0034.dept_name,data0034.barcode_entry_flag
from data0038,data0034
where data0038.flow_no=0
and data0038.source_ptr=613
and data0038.dept_ptr=data0034.rkey
order by data0038.step_number

SELECT DATA0034.dept_ptr AS '当前工序指针',DATA0038.DEPT_PTR AS 'STEP工序指针', * 
FROM data0056 
JOIN data0006 ON data0006.rkey=data0056.wo_ptr
JOIN data0034  ON data0056.DEPT_PTR=DATA0034.RKEY
JOIN data0038  ON  data0038.SOURCE_PTR=data0006.bom_ptr AND data0038.STEP_NUMBER=data0056.STEP AND Data0038.FLOW_NO=data0006.FLOW_NO
WHERE data0056.WTYPE=0 AND DATA0034.dept_ptr<>DATA0038.DEPT_PTR --AND WO_PTR=948

SELECT DATA0038.STEP_NUMBER,DATA0056.STEP,
DATA0056.*
FROM Data0056
JOIN data0006 ON data0006.rkey=data0056.wo_ptr
JOIN DATA0034 ON DATA0056.DEPT_PTR =DATA0034.RKEY
JOIN DATA0038 ON data0038.SOURCE_PTR=data0006.bom_ptr AND DATA0034.DEPT_PTR=DATA0038.DEPT_PTR AND Data0038.FLOW_NO=data0006.FLOW_NO
WHERE data0056.WTYPE=0 AND DATA0038.STEP_NUMBER<>DATA0056.STEP --AND data0056.wo_ptr=948



---------------------------------------------
SELECT data0058.* FROM data0058
JOIN data0158 ON dbo.Data0058.MRB_NO = dbo.DATA0158.MRB_NO 
JOIN data0006 on data0006.rkey=data0058.WO_PTR
JOIN data0025 ON data0006.BOM_PTR=data0025.rkey AND data0025.PARENT_PTR=0
JOIN data0050 ON data0050.rkey=data0025.ANCESTOR_PTR
LEFT JOIN data0056 ON data0006.rkey=data0056.wo_ptr
WHERE data0050.CUSTOMER_PART_NUMBER LIKE '' AND 