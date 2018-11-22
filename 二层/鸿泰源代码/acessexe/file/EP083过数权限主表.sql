--ep083
--过数权限主表
select * from Data0486 where EMPL_PTR =834 --data0005.rkey
--priv 1过数 2报审申请 3过数+报审申请ipqc_prev_flag IPQC审核 scp_prev_flag确认报废责任

--过数权限明细表

select * from data0487 where USER_PTR in --过数权限指针(Data0486.rkey)
(
select rkey from Data0486 where EMPL_PTR =834 
)


select data0486.*,data0005.empl_code,data0005.employee_name,
data0034.dept_code,data0034.dept_name,data0005.tpostion,
data0005.active_flag
 from data0486,data0005,data0034
where data0486.empl_ptr=data0005.rkey
and data0005.employee_id=data0034.rkey
order by 
data0034.dept_name,data0005.empl_code
