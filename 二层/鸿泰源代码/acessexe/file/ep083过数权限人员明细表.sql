select EMPL_CODE,EMPLOYEE_NAME,DEPT_NAME,LOGIN_NAME from Data0486 a
left join Data0487 b on a.RKEY=b.USER_PTR
left join Data0034 c on b.DEPT_PTR=c.RKEY
left join Data0005 d on a.EMPL_PTR=d.RKEY