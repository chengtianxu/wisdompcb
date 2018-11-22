--1\申请人所属部门还没有设置报废审核流程，请先进行设置再提交审核! 就是D264_PTR为空
select data0073.USER_LOGIN_NAME,data0005.rkey,data0034.DEPT_CODE,data0005.employee_name, case when data0034.ttype<4 then a.dept_name else data0034.dept_name end as dept_name, 
case when data0034.ttype<4 then a.d264_ptr else data0034.d264_ptr end as d264_ptr ,
data0034.ttype,data0034.d264_ptr,a.d264_ptr
from data0005 
join Data0073 on Data0073.EMPLOYEE_PTR=data0005.RKEY
left join data0034 on data0005.employee_id=data0034.rkey 
left join data0034 a on data0034.dept_ptr=a.rkey 
where data0005.rkey in (834,647)

select * from data0005 where  data0005.rkey=834

--2\user_ptr必须在DATA0073中存在，不然会出现NULL出错

exec sp_executesql N'select data0265.* from data0265,data0264
where Data0264.ttype=1 
--and data0264.rkey=1 --???
and data0264.rkey=data0265.auth_group_ptr and (data0265.mrb_flag=2 or data0265.mrb_flag=1)
and (UPPER_LIMIT <=@P1) AND (LOWER_LIMIT >= @P2) 
ORDER BY data0265.rkey
',N'@P1 float,@P2 float',0.25,0.25

   /*   WHEN Data0158.mrb_flag=0 THEN '单只交货'
      WHEN Data0158.mrb_flag=1 THEN 'SET交货' 
    ,case 
      WHEN Data0158.STATUS=0 THEN '未提交'
      WHEN Data0158.STATUS=1 THEN '待审核'
      WHEN Data0158.STATUS=2 THEN '已审核'
      WHEN Data0158.STATUS=3 THEN '被退回'
    end as v_STATUS     
      */
  select * from data0265    
     