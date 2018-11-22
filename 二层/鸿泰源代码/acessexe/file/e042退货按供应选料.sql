e042退货按供应选料
create PROCEDURE EP017;20  -- 
@vtp int,
@vptr int,--工厂指针
@USER_PTR INT,
@LOCATION_PTR int=0, --仓库
@supp_ptr int=0, --供应商
@Permit_Sale int=0, --允许销售
@dept_id int=0--部门ID
with encryption
AS
declare @ep017isstockdatactrls  bit 
select @ep017isstockdatactrls = isnull(ep017isstockdatactrls,0) from Data0195 
update data0017 set IF_Select=0 where IF_Select=1
/*部门专用料列表*/
select rkey into #tmplist from
(
    select Data0017.rkey from data0496
	inner join Data0017 on data0496.rkey=data0017.GROUP_PTR
	where isnull(data0496.DEP_Flag,0)=0 
    and isnull(data0017.dptuserflag,0)=0--既不是类别部门专用料也不是单独专用料
    union all--类别专用料
	select Data0017.rkey from data0496 
	inner join Data0837 on data0496.rkey=data0837.key496
	inner join Data0017 on data0496.rkey=data0017.GROUP_PTR
	where data0837.key34=@dept_id 
    and data0496.DEP_Flag=1
	union all--材料专用料
	select data0017.rkey from data0017 
	inner join Data0837 on Data0837.rkey17=data0017.rkey
	where Data0837.key34=@dept_id 
    and data0017.dptuserflag=1
) invtmplist

  --不需要数据权限控制，全部显示出来
if @ep017isstockdatactrls <> 1 
begin
  if @vtp=0 --发料到部门
  SELECT Data0022.RKEY, Data0022.INVENTORY_PTR, Data0017.INV_PART_NUMBER,case Data0017.use_flag when '0' then '共用' when '1' then '专用' end as use_flag, 
      Data0017.inv_name,Data0017.inv_description,Data0017.INV_PART_DESCRIPTION,data0017.Permit_Sale,Data0022.BARCODE_ID, 
      case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end as TDATE,
      Data0022.QUAN_ON_HAND,Data0022.EXPIRE_DATE,data0017.IF_Select,Data0022.LOCATION_PTR,Data0016.CODE,data0016.location,data0022.Reference_Number,
      0.00 as quan_send,Data0017.ANALYSIS_CODE1,Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3,Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5,
      Data0023.ABBR_NAME AS scode, Data0002.UNIT_CODE,Data0002.UNIT_NAME,Data0017.STD_COST, 
      Data0022.PRICE / Data0022.EXCHANGE_RATE AS unit_price,Data0456.REF_NUMBER, Data0022.WHOUSE_PTR,
      Data0022.SUPPLIER2,Data0022.extra_req, Data0022.TAX_2,data0022.occupyqty,
      isnull(Data0022.QUAN_ON_HAND,0)-isnull(data0022.occupyqty,0) as UseQty,
      isnull(min_stock,0) as min_stock,isnull(REORDER_POINT,0) as REORDER_POINT,data0022.ref_barcodeID
      ,data0496.ttype as costtype
  FROM Data0022 INNER JOIN
      Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN
      data0496 ON data0017.group_ptr=data0496.rkey INNER JOIN
      Data0016 ON Data0022.LOCATION_PTR = Data0016.RKEY INNER JOIN
      Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY INNER JOIN
      Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY INNER JOIN
      Data0456 ON Data0022.GRN_PTR = Data0456.RKEY left join 
      (select data0018.invent_ptr,sum(isnull(min_stock,0)) as min_stock,sum(isnull(REORDER_POINT,0)) as REORDER_POINT
       from data0018 group by data0018.invent_ptr) a on Data0022.INVENTORY_PTR=a.invent_ptr
  WHERE (Data0022.QUAN_ON_HAND > 0)    
       and data0022.whouse_ptr=@vptr 
       and (data0017.Permit_Sale=@Permit_Sale or @Permit_Sale=0)
       and (Data0022.LOCATION_PTR=@LOCATION_PTR or @LOCATION_PTR=0)
       and (Data0022.supplier_ptr=@supp_ptr or @supp_ptr=0)
       and (data0017.rkey in (select rkey from #tmplist))
  order by data0017.inv_part_number,case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end,data0022.barcode_id
  
  if @vtp=1  --材料指针查询
  SELECT Data0022.RKEY, Data0022.INVENTORY_PTR, Data0017.INV_PART_NUMBER,data0017.IF_Select,Data0022.LOCATION_PTR, 
      Data0017.inv_name,Data0017.inv_description,Data0017.INV_PART_DESCRIPTION, Data0022.BARCODE_ID, case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end as TDATE,
      Data0022.QUAN_ON_HAND, Data0022.EXPIRE_DATE, Data0016.CODE,data0016.location,data0022.Reference_Number,
      0.00 as quan_send,/* LCM 新增 */Data0017.ANALYSIS_CODE1,Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3,Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5, 
      Data0023.ABBR_NAME AS scode, Data0002.UNIT_CODE,Data0002.UNIT_NAME, Data0017.STD_COST, 
      Data0022.PRICE / Data0022.EXCHANGE_RATE AS unit_price, 
      Data0456.REF_NUMBER, Data0022.WHOUSE_PTR, Data0022.SUPPLIER2, 
      Data0022.extra_req, Data0022.TAX_2,data0022.occupyqty,
      isnull(Data0022.QUAN_ON_HAND,0)-isnull(data0022.occupyqty,0) as UseQty
      ,isnull(min_stock,0) as min_stock,isnull(REORDER_POINT,0) as REORDER_POINT,data0022.ref_barcodeID
      ,data0496.ttype as costtype
 FROM Data0022 INNER JOIN
      Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN
      data0496 ON data0017.group_ptr=data0496.rkey INNER JOIN
      Data0016 ON Data0022.LOCATION_PTR = Data0016.RKEY INNER JOIN
      Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY INNER JOIN
      Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY INNER JOIN
      Data0456 ON Data0022.GRN_PTR = Data0456.RKEY  left join 
      (select data0018.invent_ptr,sum(isnull(min_stock,0)) as min_stock,sum(isnull(REORDER_POINT,0)) as REORDER_POINT
       from data0018 group by data0018.invent_ptr) a on Data0022.INVENTORY_PTR=a.invent_ptr
  WHERE (Data0022.QUAN_ON_HAND > 0)     
       and data0022.inventory_ptr=@vptr
       and (data0017.Permit_Sale=@Permit_Sale or @Permit_Sale=0)
       and (Data0022.LOCATION_PTR=@LOCATION_PTR or @LOCATION_PTR=0)
       and (Data0022.supplier_ptr=@supp_ptr or @supp_ptr=0)
  order by data0017.inv_part_number,case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end,data0022.barcode_id
  if @vtp=2 --data0022.rkey查询
  SELECT Data0022.RKEY, Data0022.INVENTORY_PTR, Data0017.INV_PART_NUMBER,data0017.IF_Select,Data0022.LOCATION_PTR, 
      Data0017.inv_name,Data0017.inv_description,Data0017.INV_PART_DESCRIPTION, Data0022.BARCODE_ID, case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end as TDATE,
      Data0022.QUAN_ON_HAND, Data0022.EXPIRE_DATE, Data0016.CODE,data0016.location,data0022.Reference_Number,
      0.00 as quan_send,/* LCM 新增 */Data0017.ANALYSIS_CODE1,Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3,Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5, 
      Data0023.ABBR_NAME AS scode, Data0002.UNIT_CODE,Data0002.UNIT_NAME, Data0017.STD_COST, 
      Data0022.PRICE / Data0022.EXCHANGE_RATE AS unit_price, 
      Data0456.REF_NUMBER, Data0022.WHOUSE_PTR, Data0022.SUPPLIER2, 
      Data0022.extra_req, Data0022.TAX_2,data0022.occupyqty,isnull(Data0022.QUAN_ON_HAND,0)-isnull(data0022.occupyqty,0) as UseQty
      ,isnull(min_stock,0) as min_stock,isnull(REORDER_POINT,0) as REORDER_POINT,data0022.ref_barcodeID
      ,data0496.ttype as costtype
FROM Data0022 INNER JOIN
      Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN
      data0496 ON data0017.group_ptr=data0496.rkey INNER JOIN
      Data0016 ON Data0022.LOCATION_PTR = Data0016.RKEY INNER JOIN
      Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY INNER JOIN
      Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY INNER JOIN
      Data0456 ON Data0022.GRN_PTR = Data0456.RKEY  left join 
      (select data0018.invent_ptr,sum(isnull(min_stock,0)) as min_stock,sum(isnull(REORDER_POINT,0)) as REORDER_POINT
       from data0018 group by data0018.invent_ptr) a on Data0022.INVENTORY_PTR=a.invent_ptr
  WHERE (Data0022.QUAN_ON_HAND > 0)     
       and data0022.rkey=@vptr
      and (Data0022.LOCATION_PTR=@LOCATION_PTR or @LOCATION_PTR=0)
end
else
begin
  if @vtp=0
  SELECT Data0022.RKEY, Data0022.INVENTORY_PTR, Data0017.INV_PART_NUMBER,case Data0017.use_flag when '0' then '共用' when '1' then '专用' end as use_flag, 
      Data0017.inv_name,Data0017.inv_description,Data0017.INV_PART_DESCRIPTION, Data0022.BARCODE_ID, case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end as TDATE,
      Data0022.QUAN_ON_HAND, Data0022.EXPIRE_DATE, Data0016.CODE,data0016.location,data0022.Reference_Number,
      0.00 as quan_send,/* LCM 新增 */Data0017.ANALYSIS_CODE1,Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3,Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5,
      Data0023.ABBR_NAME AS scode, Data0002.UNIT_CODE,Data0002.UNIT_NAME, Data0017.STD_COST, 
      Data0022.PRICE / Data0022.EXCHANGE_RATE AS unit_price,data0017.IF_Select,Data0022.LOCATION_PTR, 
      Data0456.REF_NUMBER, Data0022.WHOUSE_PTR, Data0022.SUPPLIER2, 
      Data0022.extra_req, Data0022.TAX_2,data0022.occupyqty,
      isnull(Data0022.QUAN_ON_HAND,0)-isnull(data0022.occupyqty,0) as UseQty,
      isnull(min_stock,0) as min_stock,isnull(REORDER_POINT,0) as REORDER_POINT,data0022.ref_barcodeID
  FROM Data0022 INNER JOIN
      Data0810 on Data0022.LOCATION_PTR = Data0810.Key16 AND Data0810.Key73 = @USER_PTR INNER JOIN
      Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN
      Data0016 ON Data0022.LOCATION_PTR = Data0016.RKEY INNER JOIN
      Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY INNER JOIN
      Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY INNER JOIN
      Data0456 ON Data0022.GRN_PTR = Data0456.RKEY left join 
      (select data0018.invent_ptr,sum(isnull(min_stock,0)) as min_stock,sum(isnull(REORDER_POINT,0)) as REORDER_POINT
       from data0018 group by data0018.invent_ptr) a on Data0022.INVENTORY_PTR=a.invent_ptr
  WHERE (Data0022.QUAN_ON_HAND > 0)     
      and data0022.whouse_ptr=@vptr
      and (Data0022.LOCATION_PTR=@LOCATION_PTR or @LOCATION_PTR=0)
      and (Data0022.supplier_ptr=@supp_ptr or @supp_ptr=0)
      and (data0017.rkey in (select rkey from #tmplist))
  order by data0017.inv_part_number,case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end,data0022.barcode_id
  if @vtp=1
  SELECT Data0022.RKEY, Data0022.INVENTORY_PTR, Data0017.INV_PART_NUMBER,data0017.IF_Select,Data0022.LOCATION_PTR, 
      Data0017.inv_name,Data0017.inv_description,Data0017.INV_PART_DESCRIPTION, Data0022.BARCODE_ID, case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end as TDATE,
      Data0022.QUAN_ON_HAND, Data0022.EXPIRE_DATE, Data0016.CODE,data0016.location,data0022.Reference_Number,
      0.00 as quan_send,/* LCM 新增 */Data0017.ANALYSIS_CODE1,Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3,Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5, 
      Data0023.ABBR_NAME AS scode, Data0002.UNIT_CODE,Data0002.UNIT_NAME, Data0017.STD_COST, 
      Data0022.PRICE / Data0022.EXCHANGE_RATE AS unit_price, 
      Data0456.REF_NUMBER, Data0022.WHOUSE_PTR, Data0022.SUPPLIER2, 
      Data0022.extra_req, Data0022.TAX_2,data0022.occupyqty,
      isnull(Data0022.QUAN_ON_HAND,0)-isnull(data0022.occupyqty,0) as UseQty
      ,isnull(min_stock,0) as min_stock,isnull(REORDER_POINT,0) as REORDER_POINT,data0022.ref_barcodeID
  FROM Data0022 INNER JOIN
      Data0810 on Data0022.LOCATION_PTR = Data0810.Key16 AND Data0810.Key73 = @USER_PTR INNER JOIN
      Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN
      Data0016 ON Data0022.LOCATION_PTR = Data0016.RKEY INNER JOIN
      Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY INNER JOIN
      Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY INNER JOIN
      Data0456 ON Data0022.GRN_PTR = Data0456.RKEY left join 
      (select data0018.invent_ptr,sum(isnull(min_stock,0)) as min_stock,sum(isnull(REORDER_POINT,0)) as REORDER_POINT
       from data0018 group by data0018.invent_ptr) a on Data0022.INVENTORY_PTR=a.invent_ptr
  WHERE (Data0022.QUAN_ON_HAND > 0)     
       and data0022.inventory_ptr=@vptr
      and (Data0022.LOCATION_PTR=@LOCATION_PTR or @LOCATION_PTR=0)
      and (Data0022.supplier_ptr=@supp_ptr or @supp_ptr=0)
  order by data0017.inv_part_number,case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end,data0022.barcode_id
  if @vtp=2
  SELECT Data0022.RKEY, Data0022.INVENTORY_PTR, Data0017.INV_PART_NUMBER,data0017.IF_Select,Data0022.LOCATION_PTR, 
      Data0017.inv_name,Data0017.inv_description,Data0017.INV_PART_DESCRIPTION, Data0022.BARCODE_ID, case when data0022.invoice_ptr>0 then DATA0456.create_date else data0022.tdate end as TDATE,
      Data0022.QUAN_ON_HAND, Data0022.EXPIRE_DATE, Data0016.CODE,data0016.location,data0022.Reference_Number,
      0.00 as quan_send,/* LCM 新增 */Data0017.ANALYSIS_CODE1,Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3,Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5, 
      Data0023.ABBR_NAME AS scode, Data0002.UNIT_CODE,Data0002.UNIT_NAME, Data0017.STD_COST, 
      Data0022.PRICE / Data0022.EXCHANGE_RATE AS unit_price, 
      Data0456.REF_NUMBER, Data0022.WHOUSE_PTR, Data0022.SUPPLIER2, 
      Data0022.extra_req, Data0022.TAX_2,data0022.occupyqty,
      isnull(Data0022.QUAN_ON_HAND,0)-isnull(data0022.occupyqty,0) as UseQty
      ,isnull(min_stock,0) as min_stock,isnull(REORDER_POINT,0) as REORDER_POINT,data0022.ref_barcodeID
  FROM Data0022 INNER JOIN
      Data0810 on Data0022.LOCATION_PTR = Data0810.Key16 AND Data0810.Key73 = @USER_PTR INNER JOIN
      Data0017 ON Data0022.INVENTORY_PTR = Data0017.RKEY INNER JOIN
      Data0016 ON Data0022.LOCATION_PTR = Data0016.RKEY INNER JOIN
      Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY INNER JOIN
      Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY INNER JOIN
      Data0456 ON Data0022.GRN_PTR = Data0456.RKEY  left join 
      (select data0018.invent_ptr,sum(isnull(min_stock,0)) as min_stock,sum(isnull(REORDER_POINT,0)) as REORDER_POINT
       from data0018 group by data0018.invent_ptr) a on Data0022.INVENTORY_PTR=a.invent_ptr
  WHERE (Data0022.QUAN_ON_HAND > 0)     
       and data0022.rkey=@vptr
      and (Data0022.LOCATION_PTR=@LOCATION_PTR or @LOCATION_PTR=0)
      and (Data0022.supplier_ptr=@supp_ptr or @supp_ptr=0)
end
go

CREATE PROCEDURE EP017;21
@vptr int
with encryption
AS
select rkey,quan_on_hand from data0022
where rkey=@vptr
go