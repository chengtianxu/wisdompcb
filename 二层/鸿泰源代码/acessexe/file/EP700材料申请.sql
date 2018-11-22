--EP700材料申请
--选择申请材料

select rkey into #tmplist from 
( 
select Data0017.rkey 
from data0496  
inner join Data0017 on data0496.rkey=data0017.GROUP_PTR  
where isnull(data0496.DEP_Flag,0)=0 and isnull(data0017.dptuserflag,0)=0 --料、类部门专用料标识
 union all  
select Data0017.rkey 
from data0496 
 inner join Data0837 on data0496.rkey=data0837.key496  --材料类别使用部门关联表 
inner join Data0017 on data0496.rkey=data0017.GROUP_PTR 
 where data0837.key34=8   and data0496.DEP_Flag=1 
 union all 
  select data0017.rkey 
  from data0017 
   inner join Data0837 on    Data0837.rkey17=data0017.rkey  
  where Data0837.key34=8  and data0017.dptuserflag=1 ) invtmplist  
  
  select 
a.rkey,a.inv_part_number,a.inv_description,a.inv_name,a.inv_part_description,
b.unit_name,isnull(c.stock_qty,0) as QUAN_ON_HAND,e.SUP2,QuanSum  
 from data0017 a  
 inner join data0002 b on a.stock_unit_ptr=b.rkey  
 
 left join (select inventory_ptr,sum(isnull(quan_on_hand,0)) as stock_qty 
 from data0022 
 where quan_on_hand>0 
 group by inventory_ptr ) c on a.rkey=c.inventory_ptr  
 
 left join (select inv_part_number,sum(isnull(issued_qty,0)) as QuanSum 
            from   (select inv_part_number,case isnull(data0701.ISSUEDFLAG,0) when 0 then data0701.quan else isnull(data0701.total,0) end as issued_qty  
                    from data0701,data0700  
                    where data0701.data0700_rkey=data0700.rkey  and data0700.status in(0,1,2,4)  --0 未提交,1  已提交/待审核,2 已审核 ,3 已发料 ,4 被退回 ELSE 取消审核
                            and isnull(data0701.ISSUEDFLAG,0) in (0,2)  --0未发放,1已退回,2已发放 ELSE 已出库
                            and (data0701.quan>0 or data0701.total>0) ) aa 
            group by aa.inv_part_number    ) d on a.inv_part_number=d.inv_part_number  left join (select inventory_ptr,max(supplier2) as SUP2 from data0022  Group by 
inventory_ptr ) e on a.rkey=e.inventory_ptr   
  where a.rkey in (select rkey from #tmplist) and c.stock_qty>0  o
  rder by a.INV_PART_NUMBER  drop table #tmplist
  
  -------------------------------------------------------------------
 库存
   select a.inv_part_number,a.inv_description,a.inv_name,a.inv_part_description,b.unit_name,isnull(c.stock_qty,0) as 
QUAN_ON_HAND,QuanSum,data0023.abbr_name,data0016.location  from data0017 a  inner join data0002 b on a.stock_unit_ptr=b.rkey  inner join (select 
inventory_ptr,supplier_ptr,location_ptr,sum(isnull(quan_on_hand,0)) as stock_qty  from data0022 where quan_on_hand>0 and data0022.inventory_ptr=1785 group by 
inventory_ptr,supplier_ptr,location_ptr) c on a.rkey=c.inventory_ptr  inner join data0023 on c.supplier_ptr=data0023.rkey inner join data0016 on 
c.location_ptr=data0016.rkey left join (select data0701.inv_part_number,data0701.supplier_ptr,sum(case isnull(data0701.ISSUEDFLAG,0) when 0 then data0701.quan else 
isnull(data0701.total,0) end) as QuanSum  from data0701,data0700 where data0701.data0700_rkey=data0700.rkey  and isnull(data0701.supplier_ptr,0)>0 and 
data0701.inv_part_number='002-00013' and data0700.status in(0,1,2,4)  and isnull(data0701.ISSUEDFLAG,0) in (0,2)  and (data0701.quan>0 or data0701.total>0) group by 
data0701.inv_part_number,data0701.supplier_ptr) d on a.inv_part_number=d.inv_part_number and c.supplier_ptr=d.supplier_ptr where c.stock_qty>0 