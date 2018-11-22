--EP082LOT流转记录
exec sp_executesql N'SELECT  data0048.rkey,data0048.step_no,Data0006.WORK_ORDER_NUMBER,
data0048.sets_qty,data0048.QTY_REJECT,
Data0048.INTIME,D34B.DEPT_NAME,D34c.DEPT_NAME as to_dept_name,Data0048.OUTTIME,data0034.dept_name as dptname,
Data0048.QTY_PROD,Data0048.panels,data0005.employee_name,a.employee_name as sender ,data0048.sendtime
FROM Data0006,Data0048 
left outer join data0005 on data0048.empl_ptr=data0005.rkey
left outer join data0005 a on data0048.send_empl_ptr=a.rkey
left outer join Data0034 ON Data0048.FM_dept_PTR=Data0034.RKEY
left outer join Data0034 D34B ON Data0048.work_center_PTR=D34B.RKEY
left outer join Data0034 D34c ON Data0048.to_dept_PTR=D34c.RKEY
WHERE Data0048.WO_PTR=Data0006.RKEY and data0034.barcode_entry_flag=''Y''
AND data0006.work_order_number like @P1
ORDER BY data0048.flow_no,data0048.step_no,DATA0048.RKEY
 
 
',N'@P1 varchar(18)','130808001-0-10-01%'

select * from data0048 where rkey =513
UPDATE data0048 set QTY_PROD=379,qty_reject=21 where rkey=513--报废数据和产出数量

select * from data0058  where wo_ptr=11
