
--批量更新56表的已申请待审核入仓数：TO_BE_STOCKED 20130517 
update  data0056 set TO_BE_STOCKED= a.qty 
      from data0056  
        inner join ( Select sum(Data0053.quantity) as qty,data0056.rkey 
        From Data0053 
         inner join Data0056 on Data0053.d0056_ptr=Data0056.Rkey 
         inner join  Data0416 on Data0053.NPAD_PTR=Data0416.Rkey  
         Where isnull(data0053.dept_ptr,0)<>0  and Data0416.tStatus<>2  --1待入仓2已入仓3被退回
          group by Data0056.Rkey  
          ) a  on data0056.rkey=a.rkey 
        where data0056.TO_BE_STOCKED<>a.qty 


--select  qty_backlog,to_be_stocked,*  from data0056 
     