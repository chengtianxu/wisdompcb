--EP002 生产产出查询详细资料
--问题：修改MI的净面积和毛面积,这边不会自动改，因为48表存在sq_per_unit单元净面积gs_sq_per_unit单元毛面积两个字段
--可以运行EP013_EP002.sql脚本
--exec EP002;1 'x',0,'1',0,1,'2013-9 -27 08:30:00','2014-02-28 08:30:00','','','%','%','%','2',2,2,3,0
--create PROCEDURE EP002;1
DECLARE 
@tp CHAR(1), -- tp ＝ P 还是 U
@vtype int,  -- vtype= 查询类别   vtype= 查询类别 DATA0048.WTYPE: 0正常、1,4退货返工; 2 :在线返工; 3,5:库存返工
@vptr varchar(5),   --278指针
@vttp int,   -- 本厂编号的相反条件  (delete)
@vindex int,  -- 汇总级别 部门、工序、组、工作中心
@vdate1 varchar(20),  
@vdate2 varchar(20),
@vdept varchar(2000),
@vprod varchar(2000),
@vproj varchar(20),
@vcust varchar(20),
@vcprev varchar(5),
@vos varchar(1),
@d15Rkey int, --工厂过滤
@iPartType int, -- 部件类型 0:外层；1:内层；2:所有
@iType int, --  0:批量；1:样板；3:所有
@Line int -- 生产线
--WITH ENCRYPTION
--AS
SELECT @tp='x',@vtype=0,@vptr='1',@vttp=0,@vindex=1,@vdate1='2013-9 -27 08:30:00',@vdate2='2014-02-28 08:30:00',
@vdept='',@vprod='',@vproj='%',@vcust='%',@vcprev='%',@vos='2',@d15Rkey=2,@iPartType=2,@iType=3,@Line=0
declare @cond varchar(5000)
if @TP='U' 
begin
	select @cond='  select data0008.prod_code as prod_code,data0008.product_name,data0050.layers,
	data0050.customer_part_number,
panels=sum(case when data0048.panels>0 then data0048.panels else data0048.qty_prod/data0006.parts_per_panel end),
sets_2=sum(case when data0048.SETS_QTY>0 then data0048.SETS_QTY else data0048.qty_prod/data0006.parts_per_set end),
	  CASE data0006.PANEL_A_B 
	  WHEN 0 then ''A''
	  when 1 then ''B''
	  when 2 then ''C''
	  when 3 then ''D''
	  end as AAAA,
	  data0006.parts_per_panel AS psum,
	  data0050.cp_rev,data0025.manu_part_number,data0059.customer_part_desc,case when data0025.parts_num>0 then data0025.parts_num else 1 end as parts_num,
	  data0010.cust_code,data0034.dept_code,data0034.barcode_entry_flag,data0034.dept_name,sum(cast(data0048.qty_prod as float))  as pcs,cast(sum(data0006.parts_per_panel*data0048.panels) as float) as pcs1,
	  round(sum(data0048.qty_prod/data0006.parts_per_panel),2)  AS pnls,
	  round(sum(data0048.qty_prod/data0006.parts_per_set),2)  AS sets,
	  round(sum(data0048.qty_prod*data0048.sq_per_unit),4)  AS net_sq,
round(sum(data0048.qty_prod*data0050.LATEST_PRICE),2)  AS amount,
	  round(sum(data0048.qty_prod*data0048.gs_sq_per_unit),4)  AS gross_sq'

	if @vindex<=1 -- 按照部门或者工序查询
	select @cond=@cond+'
	  from data0048(nolock) inner join data0006(nolock)
		on data0048.wo_ptr=data0006.rkey inner join data0025(nolock)
		on data0006.bom_ptr=data0025.rkey inner join data0050(nolock)
		on data0025.ancestor_ptr=data0050.rkey left join data0492(nolock)
		on data0006.cut_no=data0492.cut_no left join data0010(nolock)
		on data0492.customer_ptr=data0010.rkey left join data0008(nolock)
		on data0008.rkey=data0025.prod_code_ptr left join data0034 a(nolock)
		on data0048.fm_dept_ptr=a.rkey left join data0038(nolock)
		on data0038.source_ptr=data0025.rkey and  data0038.step_number=data0048.step_no
	  and data0038.flow_no=data0048.flow_no 
	  left join data0059(nolock) on data0050.rkey=data0059.cust_part_ptr
	  and data0492.customer_ptr=data0059.customer_ptr '

	if @vindex>1 -- 按照组或者工作中心查询
	select @cond=@cond+'
	  from data0048(nolock) inner join data0006(nolock)
		on data0048.wo_ptr=data0006.rkey inner join data0025(nolock)
		on data0006.bom_ptr=data0025.rkey inner join data0050(nolock)
		on data0025.ancestor_ptr=data0050.rkey left join data0492(nolock)
		on data0006.cut_no=data0492.cut_no left join data0010(nolock)
		on data0492.customer_ptr=data0010.rkey  left join data0008(nolock)
		on data0008.rkey=data0025.prod_code_ptr left join data0034 a(nolock)
		on data0048.work_center_ptr=a.rkey left join data0038(nolock)
		on data0038.source_ptr=data0025.rkey and  data0038.step_number=data0048.step_no
	  and data0038.flow_no=data0048.flow_no 
	  left join data0059(nolock) on data0050.rkey=data0059.cust_part_ptr
	  and data0492.customer_ptr=data0059.customer_ptr '

	if (@vindex=0) --等于部门
	  select @cond=@cond+' left join data0034 b(nolock)
		on data0048.to_dept_ptr=b.rkey left join data0034(nolock)
		on a.big_dept_ptr=data0034.rkey '
	if (@vindex=1)  --等于工序
	  select @cond=@cond+'  left join data0034(nolock) on  a.dept_ptr=data0034.rkey'
	if (@vindex=2)  --等于组
	  select @cond=@cond+'  left join data0034(nolock) on  a.group_ptr=data0034.rkey'
	if (@vindex=3)  --等于工作中心
	  select @cond=@cond+'  left join data0034(nolock) on  a.rkey=data0034.rkey'

	select @cond=@cond+' 
	  where data0048.outtime >='''+ @vdate1+''' and data0048.outtime <='''+@vdate2+'''
	and (a.out_source='+@vos+' or 2='+@vos+') '

	if @vindex=0
		if @vdept<>''	set @cond=@cond+' and a.big_dept_ptr in ('+@vdept+')' 
	if @vindex=1
		if @vdept<>''	set @cond=@cond+' and a.dept_ptr in ('+@vdept+')' 
	if @vindex=2
		if @vdept<>''	set @cond=@cond+' and a.group_ptr in ('+@vdept+')' 
	if @vindex=3
		if @vdept<>''	set @cond=@cond+' and a.rkey in ('+@vdept+')' 

	if @vprod<>''	set @cond=@cond+' and data0008.rkey in ('+@vprod+')' 

	if @d15Rkey>0
	  select @cond=@cond+' and data0006.whouse_ptr='+convert(varchar(10),@d15Rkey)

	if @Line>0
	  select @cond=@cond+' and (IsNull(Data0034.whouse_ptr,0)=0 or data0034.whouse_ptr='+convert(varchar(10),@Line)+' )'

	if @iPartType=0
	  select @cond=@cond+' and data0025.parent_ptr=0'

	if @iPartType=1
	  select @cond=@cond+' and data0025.parent_ptr>0'

	if @iType=0
	  select @cond=@cond+' and data0050.ttype=0'
	if @iType=1
	  select @cond=@cond+' and data0050.ttype=1'
	if @iType=2
	  select @cond=@cond+' and data0050.ttype=2'
	if @vcust<>'%'
	  select @cond=@cond+' and data0010.cust_code='''+@vcust+''''

	if (@vindex=0)
	  begin
		select @cond=@cond+' 
		 and (b.big_dept_ptr<>a.big_dept_ptr or  b.big_dept_ptr is null) '
	  end

	if @vtype= 0 
	begin
	  select @cond=@cond+' and data0048.wtype=0 '
	end
	if @vtype= 1
	begin
	  select @cond=@cond+' and data0048.wtype in (1,4) '  
	end
	if @vtype= 2
	begin
	  select @cond=@cond+' and data0048.wtype=2 '  
	end
	if @vtype= 3
	  select @cond=@cond+' and data0048.wtype in (3,5) '

	if @vproj <> '%'
	 begin
		select @cond=@cond+' and data0050.customer_part_number like '''+@vproj+''''
	 end
	if @vcprev <> '%'
	 begin
		select @cond=@cond+' and data0050.cp_rev like '''+@vcprev+''''
	 end
	 
	select @cond=@cond+'
	  group by
	  data0008.prod_code,data0008.product_name,data0050.layers,data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,data0006.parts_per_PANEL,data0006.PANEL_A_B,data0492.upanel1,data0492.upanel2,data0492.upanel3,data0492.upanel4, 
	  data0010.cust_code,data0034.dept_code,data0034.barcode_entry_flag,data0034.dept_name,data0059.customer_part_desc,data0025.parts_num'
	if (@vindex<>0)
	select @cond=@cond+',data0038.outp_spfc'

	select @cond=@cond+'
	  order by
	  data0008.prod_code,data0008.product_name,data0050.layers,data0050.customer_part_number,data0025.manu_part_number,
	  data0010.cust_code,data0034.dept_code,data0034.barcode_entry_flag,data0034.dept_name'
end
if @TP<>'U' 
begin
	select @cond='  select data0008.prod_code as prod_code,data0008.product_name,data0050.layers,
	data0050.customer_part_number,
panels=sum(case when data0048.panels>0 then data0048.panels else data0048.qty_prod/data0006.parts_per_panel end),
sets_2=sum(case when data0048.SETS_QTY>0 then data0048.SETS_QTY else data0048.qty_prod/data0006.parts_per_set end),
	  CASE data0006.PANEL_A_B 
	  WHEN 0 then ''A''
	  when 1 then ''B''
	  when 2 then ''C''
	  when 3 then ''D''
	  end as AAAA,
	  data0006.parts_per_panel AS psum,
	  data0050.cp_rev,data0025.manu_part_number,data0059.customer_part_desc,case when data0025.parts_num>0 then data0025.parts_num else 1 end as parts_num,
	  data0010.cust_code,data0034.dept_code,data0034.barcode_entry_flag,data0034.dept_name,sum(cast(data0048.qty_prod as float))  as pcs,cast(sum(data0006.parts_per_panel*data0048.panels) as float) as pcs1,
	  round(sum(data0048.qty_prod/data0006.parts_per_panel),2)  AS pnls,
	  round(sum(data0048.qty_prod/data0006.parts_per_set),2)  AS sets,
	  round(sum(data0048.qty_prod*data0048.sq_per_unit),4)  AS net_sq,
round(sum(data0048.qty_prod*data0050.LATEST_PRICE),2)  AS amount,
	  round(sum(data0048.qty_prod*data0048.gs_sq_per_unit),4)  AS gross_sq'

	if @vindex<=1 -- 按照部门或者工序查询
	select @cond=@cond+'
	  from data0048(nolock) inner join data0006(nolock)
		on data0048.wo_ptr=data0006.rkey inner join data0025(nolock)
		on data0006.bom_ptr=data0025.rkey inner join data0050(nolock)
		on data0025.ancestor_ptr=data0050.rkey left join data0492(nolock)
		on data0006.cut_no=data0492.cut_no left join data0010(nolock)
		on data0492.customer_ptr=data0010.rkey  left join data0008(nolock)
		on data0008.rkey=data0025.prod_code_ptr left join data0034 a(nolock)
		on data0048.fm_dept_ptr=a.rkey left join data0038(nolock)
		on data0038.source_ptr=data0025.rkey and  data0038.step_number=data0048.step_no
	  and data0038.flow_no=data0048.flow_no 
	  left join data0059(nolock) on data0050.rkey=data0059.cust_part_ptr
	  and data0492.customer_ptr=data0059.customer_ptr '

	if @vindex>1 -- 按照组或者工作中心查询
	select @cond=@cond+'
	  from data0048(nolock) inner join data0006(nolock)
		on data0048.wo_ptr=data0006.rkey inner join data0025(nolock)
		on data0006.bom_ptr=data0025.rkey inner join data0050(nolock)
		on data0025.ancestor_ptr=data0050.rkey left join data0492(nolock)
		on data0006.cut_no=data0492.cut_no left join data0010(nolock)
		on data0492.customer_ptr=data0010.rkey  left join data0008(nolock)
		on data0008.rkey=data0025.prod_code_ptr left join data0034 a(nolock)
		on data0048.work_center_ptr=a.rkey left join data0038(nolock)
		on data0038.source_ptr=data0025.rkey and  data0038.step_number=data0048.step_no
	  and data0038.flow_no=data0048.flow_no 
	  left join data0059(nolock) on data0050.rkey=data0059.cust_part_ptr
	  and data0492.customer_ptr=data0059.customer_ptr '

	if (@vindex=0) --等于部门
	  select @cond=@cond+' left join data0034 b(nolock)
		on data0048.to_dept_ptr=b.rkey left join data0034(nolock)
		on a.big_dept_ptr=data0034.rkey '
	if (@vindex=1)  --等于工序
	  select @cond=@cond+'  left join data0034(nolock) on  a.dept_ptr=data0034.rkey'
	if (@vindex=2)  --等于组
	  select @cond=@cond+'  left join data0034(nolock) on  a.group_ptr=data0034.rkey'
	if (@vindex=3)  --等于工作中心
	  select @cond=@cond+'  left join data0034(nolock) on  a.rkey=data0034.rkey'

	select @cond=@cond+' 
	  where data0048.outtime >='''+ @vdate1+''' and data0048.outtime <='''+@vdate2+'''
	and (a.out_source='+@vos+' or 2='+@vos+') '

	if @vindex=0
		if @vdept<>''	set @cond=@cond+' and a.big_dept_ptr in ('+@vdept+')' 
	if @vindex=1
		if @vdept<>''	set @cond=@cond+' and a.dept_ptr in ('+@vdept+')' 
	if @vindex=2
		if @vdept<>''	set @cond=@cond+' and a.group_ptr in ('+@vdept+')' 
	if @vindex=3
		if @vdept<>''	set @cond=@cond+' and a.rkey in ('+@vdept+')' 

	if @vprod<>''	set @cond=@cond+' and data0008.rkey in ('+@vprod+')' 

	if @d15Rkey>0
	  select @cond=@cond+' and data0006.whouse_ptr='+convert(varchar(10),@d15Rkey)

	if @Line>0
	  select @cond=@cond+' and (IsNull(Data0034.whouse_ptr,0)=0 or data0034.whouse_ptr='+convert(varchar(10),@Line)+' )'

	if @iPartType=0
	  select @cond=@cond+' and data0025.parent_ptr=0'

	if @iPartType=1
	  select @cond=@cond+' and data0025.parent_ptr>0'

	if @iType=0
	  select @cond=@cond+' and data0050.ttype=0'
	if @iType=1
	  select @cond=@cond+' and data0050.ttype=1'
	if @iType=2
	  select @cond=@cond+' and data0050.ttype=2'

	if (@vindex=0)
	  begin
		select @cond=@cond+' 
		 and (b.big_dept_ptr<>a.big_dept_ptr or  b.big_dept_ptr is null) '
	  end

	if @vtype= 0 
	begin
	  select @cond=@cond+' and data0048.wtype=0 '
	end
	if @vtype= 1
	begin
	  select @cond=@cond+' and data0048.wtype in (1,4) '  
	end
	if @vtype= 2
	begin
	  select @cond=@cond+' and data0048.wtype=2 '  
	end
	if @vtype= 3
	  select @cond=@cond+' and data0048.wtype in (3,5) '
	if @vproj <> '%'
	 begin
		select @cond=@cond+' and data0050.customer_part_number like '''+@vproj+''''
	 end
	if @vcprev <> '%'
	 begin
		select @cond=@cond+' and data0050.cp_rev like '''+@vcprev+''''
	 end
	 
	select @cond=@cond+'
	  group by
	  data0008.prod_code,data0008.product_name,data0050.layers,data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,data0006.parts_per_PANEL,data0006.PANEL_A_B,data0492.upanel1,data0492.upanel2,data0492.upanel3,data0492.upanel4, 
	  data0010.cust_code,data0034.dept_code,data0034.barcode_entry_flag,data0034.dept_name,data0059.customer_part_desc,data0025.parts_num'
	if (@vindex<>0)
	select @cond=@cond+',data0038.outp_spfc'

	select @cond=@cond+'
	  order by
	  data0008.prod_code,data0008.product_name,data0050.layers,data0050.customer_part_number,data0025.manu_part_number,
	  data0010.cust_code,data0034.dept_code,data0034.barcode_entry_flag,data0034.dept_name'

end



exec (@cond)
PRINT(@cond)
go
