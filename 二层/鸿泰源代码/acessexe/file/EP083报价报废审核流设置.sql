select * from  data0264 --主审核
select * from  data0265 --审核明细
 left join data0264 on data0265.AUTH_GROUP_PTR =data0264 .RKEY
 
--data0264.ttype 0：报价审批流程；1报废审批流程


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
      --user_ptr必须在DATA0073中存在，不然会出现NULL出错