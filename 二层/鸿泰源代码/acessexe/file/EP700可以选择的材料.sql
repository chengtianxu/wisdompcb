--EP700可以选择的材料
exec sp_executesql N'declare @ep700curr int

select @ep700curr=PreOccupy from data0195 --材料申领已预占用库存 0所有申领单；1：已提交和已审批

select rkey into #tmplist from
(
	select Data0017.rkey 
	from data0496
	inner join Data0017 on data0496.rkey=data0017.GROUP_PTR
	where isnull(data0496.DEP_Flag,0)=0 --非类部门专用料标识
	and isnull(data0017.dptuserflag,0)=0--非材料部门专用料标识
	union all
	select Data0017.rkey from data0496 
	inner join Data0837 on data0496.rkey=data0837.key496 --类部门专用料标识
	inner join Data0017 on data0496.rkey=data0017.GROUP_PTR
	where data0837.key34=@P1 
	and data0496.DEP_Flag=1
	union all
	select data0017.rkey from data0017 
	inner join Data0837 on Data0837.rkey17=data0017.rkey
	where Data0837.key34=@P2 
	and data0017.dptuserflag=1
) invtmplist


if @ep700curr=0
begin
  SELECT 0 as selected,* from Vdata0700_3 where rkey in(select rkey from #tmplist)
end
else
begin
  SELECT 0 as selected,* from Vdata0700_3A where rkey in(select rkey from #tmplist)
end

drop table #tmplist
',N'@P1 varchar(3),@P2 varchar(3)','329','329'

--Vdata0703_2
SELECT     dbo.data0706.RKEY1, dbo.Data0022.BARCODE_ID, dbo.data0701.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.data0706.QUAN, 
                      dbo.data0706.RETURN_QUAN, dbo.Data0002.UNIT_NAME, dbo.Data0022.REFERENCE_NUMBER, dbo.Data0017.INV_NAME, dbo.Data0017.INV_DESCRIPTION
FROM         dbo.Data0017 LEFT OUTER JOIN
                      dbo.Data0002 ON dbo.Data0017.PURCH_UNIT_PTR = dbo.Data0002.RKEY LEFT OUTER JOIN
                      dbo.data0701 ON dbo.Data0017.INV_PART_NUMBER = dbo.data0701.INV_PART_NUMBER RIGHT OUTER JOIN
                      dbo.data0706 LEFT OUTER JOIN
                      dbo.Data0022 ON dbo.data0706.DATA0022_RKEY = dbo.Data0022.RKEY ON dbo.data0701.RKEY = dbo.data0706.RKEY LEFT OUTER JOIN
                      dbo.data0700 ON dbo.data0701.DATA0700_RKEY = dbo.data0700.RKEY
                      
--Vdata0703_2A
SELECT     dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.GROUP_PTR, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.INV_NAME, 
                      dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME,
                          (SELECT     SUM(CASE isnull(data0701.ISSUEDFLAG, 0) WHEN 0 THEN data0701.quan ELSE isnull(data0701.total, 0) END) AS quan
                            FROM          dbo.data0701 INNER JOIN
                                                   dbo.data0700 ON dbo.data0701.DATA0700_RKEY = dbo.data0700.RKEY
                            WHERE      (dbo.data0700.STATUS IN (2)) AND (dbo.data0701.INV_PART_NUMBER = dbo.Data0017.INV_PART_NUMBER) AND (ISNULL(dbo.data0701.ISSUEDFLAG, 
                                                   0) IN (0, 2))) AS QuanSum, MAX(dbo.Data0022.SUPPLIER2) AS SUP2, SUM(CASE WHEN isnull(Data0022.QUAN_ON_HAND, 0) 
                      > 0 THEN isnull(Data0022.QUAN_ON_HAND, 0) ELSE 0 END) AS QUAN_ON_HAND
FROM         dbo.Data0017 LEFT OUTER JOIN
                      dbo.Data0022 ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR INNER JOIN
                      dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN
                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY
GROUP BY dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.GROUP_PTR, dbo.Data0017.INV_DESCRIPTION, dbo.Data0017.INV_NAME, 
                      dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME
HAVING      (SUM(CASE WHEN isnull(Data0022.QUAN_ON_HAND, 0) > 0 THEN isnull(Data0022.QUAN_ON_HAND, 0) ELSE 0 END) > 0)
--Vdata0703_3                    
SELECT     RKEY, INV_PART_NUMBER, GROUP_PTR, INV_DESCRIPTION, INV_NAME, INV_PART_DESCRIPTION, UNIT_NAME, QuanSum, SUP2, QUAN_ON_HAND, 
                      ISNULL(QUAN_ON_HAND, 0) - ISNULL(QuanSum, 0) AS CurrentStore
FROM         dbo.Vdata0700_2
--Vdata0703_3A
SELECT     RKEY, INV_PART_NUMBER, GROUP_PTR, INV_DESCRIPTION, INV_NAME, INV_PART_DESCRIPTION, UNIT_NAME, QuanSum, SUP2, QUAN_ON_HAND, 
                      ISNULL(QUAN_ON_HAND, 0) - ISNULL(QuanSum, 0) AS CurrentStore
FROM         dbo.Vdata0700_2A


---------------------------------旧版本
--可查材料
 select a.rkey,a.inv_part_number,a.inv_description,a.inv_name,a.inv_part_description,b.unit_name,isnull(c.stock_qty,0) as QUAN_ON_HAND,e.SUP2,QuanSum 
  from data0017 a  inner join data0002 b on a.stock_unit_ptr=b.rkey 
   left join (select inventory_ptr,sum(isnull(quan_on_hand,0)) as stock_qty  from data0022 where quan_on_hand>0  group by inventory_ptr ) c on a.rkey=c.inventory_ptr  
   left join (select inv_part_number,sum(isnull(issued_qty,0)) as QuanSum from   (select inv_part_number,case isnull(data0701.ISSUEDFLAG,0) when 0 then data0701.quan else isnull(data0701.total,0) end as issued_qty  from data0701,data0700  where data0701.data0700_rkey=data0700.rkey  and data0700.status in(1,2)  and isnull(data0701.ISSUEDFLAG,0) in (0,2)  and (data0701.quan>0 or data0701.total>0) ) aa  group by aa.inv_part_number    ) d on a.inv_part_number=d.inv_part_number  
   left join (select inventory_ptr,max(supplier2) as SUP2 from data0022  Group by inventory_ptr ) e on a.rkey=e.inventory_ptr  
    union  select a.rkey,a.inv_part_number,a.inv_description,a.inv_name,a.inv_part_description,b.unit_name,isnull(c.stock_qty,0) as QUAN_ON_HAND,e.SUP2,QuanSum  
           from data0017 a  inner join data0002 b on a.stock_unit_ptr=b.rkey  inner join data0496 on a.GROUP_PTR=data0496.rkey and isnull(data0496.DEP_Flag,0)=1  
           inner join Data0837 on data0496.rkey=Data0837.Key496 and Data0837.Key34=329 left join (select inventory_ptr,sum(isnull(quan_on_hand,0)) as stock_qty  from data0022 where quan_on_hand>0  group by inventory_ptr ) c on a.rkey=c.inventory_ptr  
           left join (select inv_part_number,sum(isnull(issued_qty,0)) as QuanSum from   (select inv_part_number,case isnull(data0701.ISSUEDFLAG,0) when 0 then data0701.quan else isnull(data0701.total,0) end as issued_qty  from data0701,data0700  where data0701.data0700_rkey=data0700.rkey  and data0700.status in(1,2)  and isnull(data0701.ISSUEDFLAG,0) in (0,2)  and (data0701.quan>0 or data0701.total>0) ) aa  group by aa.inv_part_number    ) d on a.inv_part_number=d.inv_part_number  
           left join (select inventory_ptr,max(supplier2) as SUP2 from data0022  Group by inventory_ptr ) e on a.rkey=e.inventory_ptr   order by a.INV_PART_NUMBER
--查库存
 select a.inv_part_number,a.inv_description,a.inv_name,a.inv_part_description,b.unit_name,isnull(c.stock_qty,0) as QUAN_ON_HAND,QuanSum,data0023.abbr_name,data0016.location  from data0017 a  inner join data0002 b on a.stock_unit_ptr=b.rkey  inner join (select inventory_ptr,supplier_ptr,location_ptr,sum(isnull(quan_on_hand,0)) as stock_qty  from data0022 where quan_on_hand>0 and data0022.inventory_ptr=2818 group by inventory_ptr,supplier_ptr,location_ptr) c on a.rkey=c.inventory_ptr  inner join data0023 on c.supplier_ptr=data0023.rkey inner join data0016 on c.location_ptr=data0016.rkey left join (select data0701.inv_part_number,data0701.supplier_ptr,sum(case isnull(data0701.ISSUEDFLAG,0) when 0 then data0701.quan else isnull(data0701.total,0) end) as QuanSum  from data0701,data0700 where data0701.data0700_rkey=data0700.rkey  and isnull(data0701.supplier_ptr,0)>0 and data0701.inv_part_number='1AB1080KB63300M135' and data0700.status in(1,2)  and isnull(data0701.ISSUEDFLAG,0) in (0,2)  and (data0701.quan>0 or data0701.total>0) group by data0701.inv_part_number,data0701.supplier_ptr) d on a.inv_part_number=d.inv_part_number and c.supplier_ptr=d.supplier_ptr
