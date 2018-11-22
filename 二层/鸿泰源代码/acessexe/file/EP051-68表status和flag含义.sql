 ,case 
     when status=7 then '未提交'
     when status=1 then '受理后待审批'
     when status=2 then '待采购'
     when status=3 then '已批准'
     when status=4 then '被退回'
     when status=5 then '请购单已撤消'
     when status=6 then '请购单已处理'
     when status=8 then '受理前待审批'
     when status=9 then 
      case when tstate =1 then '审核退回' else '待受理' end
  end as v_status
 ,case 
     when flag='S' then '标准物料'
     when flag='M' then '非标准物料'
     when flag='T' then '标准外发'
     when flag='N' then '非标准外发'
  end as flag1