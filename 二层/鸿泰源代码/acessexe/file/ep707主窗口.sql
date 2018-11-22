--ep707主窗口
SELECT * FROM Data0034 WHERE (ttype=4 or is_cost_dept=1)  Order by DEPT_CODE DESC
--部门审核人员设置
select * from data0707 where data0707.DATA0034_RKEY = 329

order by data0707.SEQ ASC,data0707.rkey ASC
