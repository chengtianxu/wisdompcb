------排程---已经测
SELECT data0028.exp_flag,DATA0028.ACTIVE_FLAG, Data0028.[status], * FROM Data0028 
JOIN data0023 ON data0028.SUPPLIER_PTR=data0023.RKEY 
JOIN data0017 ON data0028.INVENTORY_PTR=data0017.RKEY
WHERE data0023.CODE='BAZJ' --客户代码
AND data0017.INV_PART_NUMBER IN ('199-02-020','199-02-054','199-02-126')--材料编号
                                         --DATA0028.ACTIVE_FLAG 0表示无效，1有效 ，才能导出采购单（导出PR程序这么要求的） 没测到
                                         --status 0：未提交；1：待审；2：已审；3：退回,点修改，再按保存回到未提交；
                                         --exp_flag 0：正常；1：失效；  
--UPDATE data0028 SET ACTIVE_FLAG = 1 WHERE RKEY=14988
--SELECT * FROM data0073 WHERE RKEY=294  


-----供应商---已经测
SELECT supplier_active_flag,--审核状态 0：未审；1：退回；2：待审；3：已审；4:审核中
Sup_Type, --supplier_active_flag,0：正式；1：试用；没测到
isbad,          --0 正常，2过期
*  FROM data0023  

--------材料项目
SELECT CONF_FLAG,--审核标志,0未核，1待审核,2退回，3已审核，取消提交回到0
STOP_PURCH --停止采购Y，N可用
,* FROM data0017                                