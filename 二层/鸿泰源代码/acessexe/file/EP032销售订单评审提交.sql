--查看评审信息
--SELECT TOP 5 status,quote_price ,* FROM data0060 ORDER BY rkey DESC  --status 6未提交 ，1提交  quote_price  订单是否已评审(0,1,2,3)(否,是,退回,不评审)
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
where data0090.pact_ptr=82118--@d60rkey
order by data0090.seq_no,data0090.rkey

select * from data0011
where source_type=6169 and file_pointer=82118
order by data0011.rkey desc

--------------------------------------------------------------------------------------------------------

--过滤评审数据
SELECT distinct data0091.dept_ptr,data0091.sysuser_ptr,data0091.auth_rule_flag,data0091.seq_no,Data0091.IF_Param,Data0320.whse_ptr, 
data0091.if_puthdate,data0091.if_puthwfsupp,data0091.if_puthmat,data0091.puth_info,data0091.credit_flag,data0091.base_flag,data0091.IF_project 
FROM data0060,data0091 INNER JOIN Data0320 ON data0091.group_ptr = Data0320.RKEY
INNER JOIN Data0566 ON Data0320.RKEY = Data0566.auth_ptr
INNER JOIN Data0025 ON Data0566.prod_ptr = Data0025.PROD_CODE_PTR
inner join data0567 on data0320.rkey=data0567.auth_ptr
WHERE data0060.rkey=82118  --订单指针
and (data0060.whse_ptr=Data0320.whse_ptr or  Data0320.whse_ptr is null)
and data0060.cust_part_ptr=data0025.ancestor_ptr
and data0567.so_style=data0060.so_style
and Data0025.PARENT_PTR = 0
and (data0091.base_flag=1 or (data0060.so_credit_flag=1 and data0091.credit_flag=1))
 and ( data0091.ttype=2
 or data0091.ttype=0 ) 
 and Data0091.So_oldnew like '%新单%'
order by data0091.seq_no,data0091.dept_ptr,data0091.sysuser_ptr,data0091.auth_rule_flag,
data0091.if_puthdate,data0091.if_puthwfsupp,data0091.if_puthmat,data0091.puth_info,data0091.base_flag,data0091.IF_project
--------------------------------------------------------------------------
--插入数据
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0090" ("pact_ptr","if_puthdate","puth_info","IF_PUTHWFSUPP","IF_PUTHMAT","auth_rule_flag","sysuser_ptr","seq_no","credit_flag","IF_PARAM","whse_ptr_90") VALUES 
(@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 tinyint,@P3 varchar(4),@P4 tinyint,@P5 tinyint,@P6 tinyint,@P7 int,@P8 int,@P9 tinyint,@P10 tinyint,@P11 int',
82118,1,'test',1,1,1,362,2,1,1,NULL

--修改60状态
exec sp_executesql N'UPDATE "SJ_V20_live".."data0060"
 SET "STATUS"=@P1,"DUE_DATE"=@P2
  WHERE "RKEY"=@P3 AND "STATUS"=@P4 AND "DUE_DATE" IS NULL',
  N'@P1 tinyint,@P2 datetime,@P3 int,@P4 tinyint',1,'2013-04-25 21:33:03',82118,6