update data0022 set OccupyQty=a.Quan
from data0022,
(
select OccupyQty,
(
  select cast(isnull(sum(data0706.Quan),0) as numeric(18,6)) as Quan
  from data0706
  inner join data0701 on data0706.rkey=data0701.rkey 
  and data0701.ISSUEDFLAG in (2)
  and data0706.data0022_rkey=data0022.rkey
) as Quan,
data0022.rkey,
data0022.quan_on_hand
from data0022 where 
OccupyQty<>
(
 select cast(isnull(sum(data0706.Quan),0)as numeric(18,6)) as Quan
 from data0706
 inner join data0701 on data0706.rkey=data0701.rkey 
 and data0701.ISSUEDFLAG in (2)
 and data0706.data0022_rkey=data0022.rkey
)
--order by rkey asc
) a
where
data0022.rkey=a.rkey

---------------------------------------------------
select * from data0017 where inv_part_number like 'OTGZ000753822210'
select occupyqty,* from data0022 where inventory_ptr=3570 and quan_on_hand=500
select * from data0706 where data0022_rkey=229964

--update data0022 set occupyqty=0 where rkey=229964
