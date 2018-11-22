UPDATE DATA0074 SET USER_RIGHTS = 4 ,RIGHT_VALUE_STR = '1111111111111111' WHERE USER_PTR=1
UPDATE data0073 SET USER_PASSWORD = NULL,COMPUTER = NULL,NETWORK_ID = null

--此用户已在某台电脑上使用
update Data0073 set NETWORK_ID=null computer=null,login_time=null where lower(USER_LOGIN_NAME)='admin'

--清除全部密码
update Data0073 set USER_PASSWORD=null   where lower(USER_LOGIN_NAME)='admin'

----------------------------------
--根据用户名清除登入密码
update Data0073 set USER_PASSWORD =null where EMPLOYEE_PTR in
( select RKEY from Data0005 where EMPLOYEE_NAME like '郑传清%'
)

--根据用户名清除登入信息
select * from data0073 
where EMPLOYEE_PTR in
( select RKEY from Data0005 where EMPLOYEE_NAME like '郑传清%'
)

update Data0073 set ACTIVE_FLAG=0 where RKEY=1 --0为可用，1不可用


UPDATE DATA0073 SET COMPUTER='',NETWORK_ID=''可以吧其他用户都弹出


UPDATE data0314 SET hread='T' WHERE emp_ptr= --73表RKEY  清除消息

修改数据库密码
1修改数据库密码
2、用Encrypt.exe加密
3、放在KMERP.ini第二行，如果第二行为空，默认为koimy1234

----
批量修改权限
UPDATE Data0074 SET RIGHT_VALUE_STR='1111111111111111'  WHERE user_ptr=1


--------------
73表指向5表用户名
SELECT data0005.EMPL_CODE,data0073.rkey,user_group_flag 
FROM data0073 --user_group_flag 1为用户，0为组（EMPLOYEE_PTR也为NULL）
JOIN data0005 ON data0073.EMPLOYEE_PTR= data0005.RKEY
WHERE data0073.RKEY=294 --data0005.EMPL_CODE=雇员代码



-------------------------------------------------
--根据5表用户名查询73表用户登入名
select * from Data0073 
join Data0005 on data0005.RKEY =data0073.EMPLOYEE_PTR
where data0005.EMPLOYEE_NAME like '郑传清%'

select * from Data0005 
