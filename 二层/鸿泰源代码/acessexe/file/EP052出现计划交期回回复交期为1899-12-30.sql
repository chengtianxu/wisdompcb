EP052出现计划交期回回复交期为1899-12-30
360表SCH_DATE为空的原因

SELECT data0360.sch_date FROM data0360 
JOIN data0060 ON data0060.rkey=data0360.so_ptr 
WHERE data0360.sch_date IS NULL

UPDATE DATA0360 SET sch_date =DATA0060.SCH_DATE
FROM data0360 
JOIN data0060 ON data0060.rkey=data0360.so_ptr 
WHERE data0360.sch_date IS NULL

