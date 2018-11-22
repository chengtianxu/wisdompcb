EP405待入仓数为负数
原来程序有一个BUG
高工  14:52:18
高世锋  15:19:03入仓审核时
delete data0056 where data0056.QTY_BACKLOG=0 and data0056.TO_BE_STOCKED=0

--批量更新56表的已申请待审核入仓数：TO_BE_STOCKED 20130517 
update  data0056 set TO_BE_STOCKED= a.qty 
      from data0056  
        inner join ( Select sum(Data0053.quantity) as qty,data0056.rkey 
        From Data0053 
         inner join Data0056 on Data0053.d0056_ptr=Data0056.Rkey 
         inner join  Data0416 on Data0053.NPAD_PTR=Data0416.Rkey  
         Where isnull(data0053.dept_ptr,0)<>0  and Data0416.tStatus<>2  
          group by Data0056.Rkey  
          ) a  on data0056.rkey=a.rkey 
        where data0056.TO_BE_STOCKED<>a.qty 


--select  qty_backlog,to_be_stocked,*  from data0056 
     

零的开始 23:24:29 
已经入仓了，工作也显示结束，但56表QTY_BACKLOG=0,但还存在着这笔记录，有时还是TO_BE_STOCKED为负数
沉默是金 10:01:23 
 detailaq56['to_be_stocked']:=detailaq56['to_be_stocked']- Form1.ADOQuery1['quantity']; 
沉默是金 10:02:09 
反审核应该是增加吧
沉默是金 10:03:14 
可能当时没搞清楚这个字段的意思
沉默是金 10:06:02 
       begin
          detailaq56.Edit;
          detailaq56['to_be_stocked']:=detailaq56['to_be_stocked']- Form1.ADOQuery1['quantity'];  // 退到产线上要减少入仓数量
          detailaq56['QTY_BACKLOG']:= detailaq56['QTY_BACKLOG']+ Form1.ADOQuery1['quantity'];  //退到产线上要增加现有数量 
          detailaq56['to_be_cancd']:= detailaq56['to_be_cancd']- Form1.ADOQuery1['to_be_cancd'];  //退到产线上要减少样板尾数 
          detailaq56.Post;
        end;
沉默是金 10:58:55 
EP405的单项明细退回到WIP时，to_be_stocked处理有问题，已放到服务器上，请大家更新一下 



