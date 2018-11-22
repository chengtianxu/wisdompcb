--EP001工作单查询
--exec ep001;3 '3','2','2','3','2',' order by customer_part_number'
--exec ep001;3 '3','2','2','3','2',' order by data0060.sch_date'--现在用

--create procedure ep001;3 
declare
@para1 varchar(1),  -- 正常0 ，退货返工1，正常返工2，全部3
@para2 varchar(1),  -- 自制0，外发1，全部2
@para3 varchar(1),  -- 外层0，内层1，全部2
@para5 varchar(1),  -- 量产0，样板1，全部3
@para6 varchar(1),  -- 正常0，暂停1，全部2
@para4 varchar(100)   -- 排序
SELECT @para1='3',@para2='2',@para3='2',@para5='3',@para6='2',@para4=' order by data0060.sch_date'
--WITH ENCRYPTION
--as

declare @cond varchar(8000)
declare @Reject_ptr int

select @Reject_ptr=IsNull(custfedship,0) From data0192

declare @vflag2 int
select @vflag2=isnull(ep001_simple_flag,0) from data0195

if @vflag2=0
begin
	select @cond = '
	declare @vflag int
	select @vflag=isnull(ENG_CONTROL25,0) from data0192
	declare @vparam_ptr int
	select @vparam_ptr=rkey from data0278 where spec_rkey=''E''
	if isnull(@vparam_ptr,0)=0 
	select @vparam_ptr=rkey from data0278 where spec_rkey=''D'''

	select @cond=@cond+'
	select so_ptr,sum(quan_rej) as quan_rej
	into #data0058
	from data0006(nolock),data0025(nolock)
	where data0006.so_ptr in (select distinct data0006.so_ptr from data0056,data0006 where data0056.wo_ptr=data0006.rkey)
	and data0006.bom_ptr=data0025.rkey
	and data0025.parent_ptr=0
	group by so_ptr

	Select data0047.source_pointer,data0047.parameter_value
	into #data0047
			   From Data0047(nolock) where parameter_ptr=@vparam_ptr and source_pointer in 
	(select distinct bom_ptr from data0006(nolock) where rkey in (select wo_ptr from data0056))

	select wo_ptr,''自动拆单'' as CFtyep 
	into #data0056_001
	from data0056(nolock) group by wo_ptr having count(wo_ptr)>1

	select #data0056_001.CFtyep,#test00.rkey,#test00.bom_ptr,#test00.sets_cust_part_ptr,data0056.flow_no,#test00.prod_status,data0050.analysis_code_2,
	data0025.manu_part_number,data0025.manu_part_desc,data0010.cust_code,data0060.orig_sched_ship_date,data0060.ttype as so_type,data0050.layers,data0025.parent_ptr,data0025.parts_num,
	CASE DATA0492.TTYPE 
		WHEN 0 THEN ''正常投产''
		WHEN 1 THEN ''非退货补料''
		WHEN 2 THEN ''退货补料''
		WHEN 3 THEN ''正常返工''
		WHEN 4 THEN ''退货返工''
	END AS TTYPE492,data0492.remark,
	case when substring(#test00.work_order_number,len(#test00.work_order_number),1)>''9'' then ''Yes''  else''No''  end as  ttype02_HMFS,
	case data0056.wtype 
		when 0 then ''正常生产中''
		when 1 then ''返工生产中''
		when 2 then ''返工生产中''
	end as flowtype_desc,
	case when @vflag=0 then data0010.abbr_name else '''' end as abbr_name,#test00.parts_per_set as set_qty,
	data0060.sales_order,#test00.sch_compl_date as due_date, data0060.sch_date,data0492.ISSUE_DATE+isnull(data0008.lead_time2,0) as sch_date2,
	DATA0060.so_oldnew,data0060.reference_number,#test00.sets_bom_ptr,data0060.COMMISION_ON_TOOLING,
	#test00.work_order_number,data0050.customer_part_number,data0050.cp_rev,#test00.panel_a_b,#test00.stop_lmt_step,
	data0059.customer_part_desc,data0056.step,#test00.whouse_ptr,data0059.customer_matl_desc,
	data0056.qty_backlog+to_be_stocked as qty_backlog,data0056.qty_rej_to_stocked,data0056.to_be_stocked,data0056.dept_ptr,
	#test00.parts_per_panel,data0056.panels,data0056.sets_qty,data0056.Xset_qty,#test00.priority_code,data0056.intime,data0056.sendtime,
	a.dept_code as dpt_code,a.dept_name as dpt_name,a.ttype,a.dept_ptr as deptptr,
	data0056.reference,data0060.orig_request_date,Data0015.warehouse_code,Data0015.warehouse_name,
	data0008.prod_code,data0008.product_name,warehouse_abbr_name=Data0015.abbr_name,
	#test00.quan_sch,#test00.quan_rej as quan_reject,#test00.quan_prod as qty_prod,data0060.fob,data0060.ent_date,#test00.ENT_DATETIME as issue_date,
	GrossArea=(data0056.qty_backlog+data0056.to_be_stocked)*#data0047.parameter_value,
	netArea=(data0056.qty_backlog+data0056.to_be_stocked)*data0050.unit_sq,
	#data0047.parameter_value,data0060.parts_ordered,a.rkey as d34Rkey,#test00.wo_datecode,
	data0060.parts_ordered-IsNull(data0060.parts_shipped,0)+IsNull(data0060.quan_to_re_delivery,0)-IsNull(data0060.returned_ship,0) as plan_ship,
	data0060.parts_shipped,data0060.issued_qty, #data0058.quan_rej,data0056.rkey as d56Rkey,Data0060.qty_tran,
	b.dept_code as dept_cod ,b.wo_days,b.wo_days2,data0050.catalog_number,#test00.quan_rej-
(case when abs(#test00.panels - #test00.quan_sch/#test00.parts_per_panel)<1 then 0 else (round(#test00.quan_sch/#test00.parts_per_panel,0)-#test00.panels)*#test00.parts_per_panel end) as rej_pcs,
	c.dept_code
	/*+dbo.GetWoDeptStepSeqDesc(#test00.bom_ptr,#test00.flow_no,c.rkey,data0056.step)* gtsh:20091230挂*/
	 as ddept_code,
	c.dept_name as ddept_name,Data0097.PO_NUMBER,cast(getdate()-#test00.ENT_DATETIME as float) as prod_days,
	cast(accu_stoped_days as float) as cle_time,data0050.rkey as rkey50,t5.EMPLOYEE_NAME as cd_pp,data0060.parts_ordered*data0050.unit_sq as soarea
	 from data0056(nolock) 
	left join (select * from data0006(nolock)
	where rkey in (select wo_ptr from data0056(nolock))) as 
	#test00 on data0056.wo_ptr=#test00.rkey
	left join data0025(nolock) on #test00.bom_ptr=data0025.rkey         
	left join data0050(nolock) on data0025.ancestor_ptr=data0050.rkey
	left join data0008(nolock) on data0025.prod_code_ptr=data0008.rkey
	left join data0034 a(nolock) on data0056.dept_ptr=a.rkey
	left join data0034 b(nolock) on a.dept_ptr=b.rkey
	left join data0034 c(nolock) on a.big_dept_ptr=c.rkey
	LEFT JOIN DATA0492(nolock) ON #TEST00.CUT_NO=DATA0492.CUT_NO
	left join data0060(nolock) on #test00.so_ptr=data0060.rkey
	left join #data0058(nolock) on #data0058.so_ptr=data0060.rkey
	left join data0010(nolock) on data0060.customer_ptr=data0010.rkey 
	left join #data0047(nolock) on data0025.rkey=#data0047.source_pointer
	left join data0059(nolock) on data0059.cust_part_ptr=data0050.rkey
					  and (case when data0060.customer_ptr>0 then data0060.customer_ptr  else data0492.customer_ptr end)=data0059.customer_ptr
	left join Data0097(nolock) on Data0060.PURCHASE_ORDER_PTR=Data0097.Rkey
	left join Data0015(nolock) on #test00.whouse_ptr=Data0015.Rkey
	left join #data0056_001(nolock) on #data0056_001.wo_ptr=#test00.rkey
	left join data0134(nolock) on data0134.wo_ptr=#test00.rkey and data0134.ttype=1
	left join data0005 t5(nolock) on data0134.empl_ptr=t5.rkey
	where 1=1'
	if @para2=1
	begin
	  select @cond=@cond+' and (data0056.outsource='+@para2+' or a.out_source='+@para2+')'
	end

	if @para2=0
	begin
	  select @cond=@cond+' and (data0056.outsource='+@para2+' and a.out_source='+@para2+')'
	end

	if @para1<2
	  select @cond=@cond+' and data0056.wtype='+@para1
	if @para1=2
	  select @cond=@cond+' and data0056.wtype in (2,3)'

	if @para3=0
	  select @cond=@cond+' and data0025.parent_ptr=0'
	if @para3=1
	  select @cond=@cond+' and data0025.parent_ptr>0'


	if @para5=0
	  select @cond=@cond+' and data0060.ttype=0'
	if @para5=1
	  select @cond=@cond+' and data0060.ttype=1'
	if @para5=2
	  select @cond=@cond+' and data0060.ttype=2'


	if @para6=0
	  select @cond=@cond+' and #test00.prod_status<100 '
	if @para6=1
	  select @cond=@cond+' and #test00.prod_status>=100 '


	select @cond=@cond+@para4
	select @cond=@cond+' drop table #data0056_001'
end
if @vflag2=1
begin
	select @cond = '
	declare @vflag int
	select @vflag=isnull(ENG_CONTROL25,0) from data0192
	declare @vparam_ptr int
	select @vparam_ptr=rkey from data0278 where spec_rkey=''E''
	if isnull(vparam_ptr,0)=0
	select @vparam_ptr=rkey from data0278 where spec_rkey=''D'''

	select @cond=@cond+'

	Select data0047.source_pointer,data0047.parameter_value
	into #data0047
			   From Data0047(nolock) where parameter_ptr=@vparam_ptr and source_pointer in 
	(select distinct bom_ptr from data0006(nolock) where rkey in (select wo_ptr from data0056))

	select '''' as CFtyep,#test00.rkey,#test00.bom_ptr,#test00.sets_cust_part_ptr,data0056.flow_no,#test00.prod_status,data0050.analysis_code_2,
	data0025.manu_part_number,data0025.manu_part_desc,data0010.cust_code,data0060.orig_sched_ship_date,data0060.ttype as so_type,data0050.layers,data0025.parent_ptr,data0025.parts_num,
	CASE DATA0492.TTYPE 
		WHEN 0 THEN ''正常投产''
		WHEN 1 THEN ''非退货补料''
		WHEN 2 THEN ''退货补料''
		WHEN 3 THEN ''正常返工''
		WHEN 4 THEN ''退货返工''
	END AS TTYPE492,data0492.remark,
	case when substring(#test00.work_order_number,len(#test00.work_order_number),1)>''9'' then ''Yes''  else''No''  end as  ttype02_HMFS,
	case data0056.wtype 
		when 0 then ''正常生产中''
		when 1 then ''返工生产中''
		when 2 then ''返工生产中''
	end as flowtype_desc,
	case when @vflag=0 then data0010.abbr_name else '''' end as abbr_name,#test00.parts_per_set as set_qty,
	data0060.sales_order,#test00.sch_compl_date as due_date, data0060.sch_date,data0492.ISSUE_DATE+isnull(data0008.lead_time2,0) as sch_date2,DATA0060.so_oldnew,data0060.reference_number,
	#test00.work_order_number,data0050.customer_part_number,data0050.cp_rev,#test00.panel_a_b,#test00.stop_lmt_step,
	data0059.customer_part_desc,data0056.step,#test00.whouse_ptr,data0059.customer_matl_desc,#test00.sets_bom_ptr,
	data0056.qty_backlog+to_be_stocked as qty_backlog,data0056.to_be_stocked,data0056.dept_ptr,
	#test00.parts_per_panel,data0056.panels,#test00.priority_code,data0056.intime,data0056.sendtime,
	a.dept_code as dpt_code,a.dept_name as dpt_name,a.ttype,a.dept_ptr as deptptr,
	data0056.reference,data0060.orig_request_date,Data0015.warehouse_code,Data0015.warehouse_name,
	data0008.prod_code,data0008.product_name,warehouse_abbr_name=Data0015.abbr_name,
	#test00.quan_sch,#test00.quan_rej as quan_reject,#test00.quan_prod as qty_prod,data0060.fob,data0060.ent_date,#test00.ENT_DATETIME as issue_date,
	GrossArea=(data0056.qty_backlog+data0056.to_be_stocked)*#data0047.parameter_value,
	netArea=(data0056.qty_backlog+data0056.to_be_stocked)*data0050.unit_sq,
	#data0047.parameter_value,data0060.parts_ordered,a.rkey as d34Rkey,#test00.wo_datecode,
	data0060.parts_ordered-IsNull(data0060.parts_shipped,0)+IsNull(data0060.quan_to_re_delivery,0)-IsNull(data0060.returned_ship,0) as plan_ship,
	data0060.parts_shipped,data0060.issued_qty, data0060.quan_reject as quan_rej,data0056.rkey as d56Rkey,Data0060.qty_tran,
	b.dept_code as dept_cod ,b.wo_days,b.wo_days2,data0050.catalog_number,#test00.panels*#test00.parts_per_panel-(#test00.quan_sch-#test00.quan_rej) as rej_pcs,
	c.dept_code
	/*+dbo.GetWoDeptStepSeqDesc(#test00.bom_ptr,#test00.flow_no,c.rkey,data0056.step)* gtsh:20091230挂*/
	 as ddept_code,
	c.dept_name as ddept_name,Data0097.PO_NUMBER,
	cast(accu_stoped_days as float) as cle_time,data0050.rkey as rkey50,'''' as cd_pp,data0060.parts_ordered*data0050.unit_sq as soarea
	 from data0056(nolock) 
	left join (select * from data0006(nolock)
	where rkey in (select wo_ptr from data0056(nolock))) as 
	#test00 on data0056.wo_ptr=#test00.rkey
	left join data0025(nolock) on #test00.bom_ptr=data0025.rkey         
	left join data0050(nolock) on data0025.ancestor_ptr=data0050.rkey
	left join data0008(nolock) on data0025.prod_code_ptr=data0008.rkey
	left join data0034 a(nolock) on data0056.dept_ptr=a.rkey
	left join data0034 b(nolock) on a.dept_ptr=b.rkey
	left join data0034 c(nolock) on a.big_dept_ptr=c.rkey
	LEFT JOIN DATA0492(nolock) ON #TEST00.CUT_NO=DATA0492.CUT_NO
	left join data0060(nolock) on #test00.so_ptr=data0060.rkey
	left join data0010(nolock) on data0060.customer_ptr=data0010.rkey 
	left join #data0047(nolock) on data0025.rkey=#data0047.source_pointer
	left join data0059(nolock) on data0059.cust_part_ptr=data0050.rkey
					  and (case when data0060.customer_ptr>0 then data0060.customer_ptr  else data0492.customer_ptr end)=data0059.customer_ptr
	left join Data0097(nolock) on Data0060.PURCHASE_ORDER_PTR=Data0097.Rkey
	left join Data0015(nolock) on #test00.whouse_ptr=Data0015.Rkey
	left join data0134(nolock) on data0134.wo_ptr=#test00.rkey and data0134.ttype=1
	where 1=1'
	if @para2=1
	begin
	  select @cond=@cond+' and (data0056.outsource='+@para2+' or a.out_source='+@para2+')'
	end

	if @para2=0
	begin
	  select @cond=@cond+' and (data0056.outsource='+@para2+' and a.out_source='+@para2+')'
	end

	if @para1<3
	  select @cond=@cond+' and data0056.wtype='+@para1

	if @para3=0
	  select @cond=@cond+' and data0025.parent_ptr=0'
	if @para3=1
	  select @cond=@cond+' and data0025.parent_ptr>0'


	if @para5=0
	  select @cond=@cond+' and data0060.ttype=0'
	if @para5=1
	  select @cond=@cond+' and data0060.ttype=1'
	if @para5=2
	  select @cond=@cond+' and data0060.ttype=2'


	if @para6=0
	  select @cond=@cond+' and #test00.prod_status<100 '
	if @para6=1
	  select @cond=@cond+' and #test00.prod_status>=100 '


	select @cond=@cond+@para4

end

exec (@cond)
go
