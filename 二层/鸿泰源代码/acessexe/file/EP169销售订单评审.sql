
SELECT data0090.seq_no,data0090.auth_rule_flag,
	data0034.dept_code,Data0034.DEPT_NAME,
	data0073.user_login_name,data0073.user_full_name,
	data0009.rep_code,data0009.sales_rep_name,
	Data0005.EMPLOYEE_NAME,
      data0090.auth_date,data0090.rkey,
	data0090.dept_ptr,data0090.sysuser_ptr,data0090.rep_ptr,
	case data0090.auth_rule_flag 
		when 0 then '部门/小组' when 1 then '系统用户' when 2 then '销售代表' end as rule_desc,
	case data0090.auth_rule_flag 
		when 0 then Data0034.DEPT_NAME when 1 then data0073.user_full_name 
		when 2 then data0009.sales_rep_name+'('+d09_d05.employee_name+')' end as auth_item_desc
FROM data0090 left join Data0034 ON Data0034.RKEY = data0090.dept_ptr
	left join data0073 on data0090.sysuser_ptr=data0073.rkey
	left join data0009 on data0090.rep_ptr=data0009.rkey
	left join data0005 d09_d05 on data0009.employee_ptr=d09_d05.rkey
	LEFT OUTER JOIN Data0005 ON data0090.user_ptr = Data0005.RKEY
where data0090.pact_ptr=82114
order by data0090.seq_no,data0090.rkey


SELECT * FROM data0090 WHERE pact_ptr=82114

