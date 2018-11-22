 update data0056 
 set QTY_REJ=a58.qty_org_rej-isnull(a258.qty_received,0) 
 from data0056 
 
 inner join (select wo_ptr,step,sum(qty_org_rej) as qty_org_rej from data0058  --报废品记录表 
 where wo_ptr in (select wo_ptr from data0056) group by wo_ptr,step) as a58 
 on data0056.wo_ptr=a58.wo_ptr and data0056.step=a58.step 
 
 left join (select srce_ptr,sum(qty_received) as qty_received from data0258 --
 where wo_ptr in (select wo_ptr from data0056) group by srce_ptr) as a258 
 on data0056.rkey=a258.srce_ptr 
 
  where isnull(data0056.QTY_REJ,0)<>a58.qty_org_rej-isnull(a258.qty_received,0)
