--EP003在制下面SPMT2 出货面积和
--exec EP003;2 1,1,2,'P',1,0,4,2,'7','%','%',0,'%','3',NULL,NULL,0,2,NULL,NULL
--create PROCEDURE EP003;2
declare
@vdisp_flag int=1, 
@vtp INT=1,  -- 不显示已经交货但尚有WIP的订单 0:显示，1：不显示
@vtype INT=1,  --显示0：外层1：内部2：全部
@tp char(1)='P', --单位模式U/P
@vindex INT=1,  --汇总模式 0：部门，1：工序，2：产品类别，3：客户，4:组
@vindex2 INT=0, -- 产品范围 0：全部，1：本厂编号，2：客户型号
@vindex5 INT=4,  --返工与否 0：正常，1： 退货返工，2：正常返工，3：全部
@vindex6 INT=2,  -- 0：正常，1：暂缓，2：全部
@vptr1 varchar(10)='7',
@vproj varchar(20)='%',
@vdept varchar(10)='%',
@vcust_flag TINYINT=0 ,--客户
@vcust varchar(10)='%',--客户代码
@vttype varchar(1)='3',--产品类型 0:量产，1：样板，2：全部
@BDate varchar(10)='2000-01-01',--客户交期开始时间
@EDate varchar(10)='2049-01-01',--客户交期结束时间
@Whse_ptr INT=0,--工厂指针
@SalCon INT=2,--订单那完工情况
@BDate1 varchar(10)='2000-01-01',--回复交期开始时间
@EDate1 varchar(10)='2049-01-01'--回复交期结束时间
--with encryption
--AS
declare @cond varchar(5000)
declare @spec_rkey varchar(2) 

select @spec_rkey=spec_rkey from data0278(nolock) where rkey=cast(@vptr1 as int)

create table #tmp(Rkey int,Parts_ordered int,qty_tran int,quan_prod int)

if @SalCon=0 
begin
insert #tmp
select data0060.Rkey,Data0060.parts_ordered,data0060.qty_tran,quan_prod=sum(data0006.quan_prod)
from data0060(nolock) ,data0006(nolock)
where data0006.prod_status in (3,103)
and data0006.so_ptr=data0060.rkey
and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,'1999-01-01')>=@BDate
  and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,'2036-12-12')<=@EDate
  and IsNull(Data0060.sch_date,'1999-01-01')>=@BDate1
  and IsNull(Data0060.sch_Date,'2036-12-12')<=@EDate1
group by data0060.Rkey,Data0060.parts_ordered,data0060.qty_tran
 having (sum(data0006.quan_prod)<Data0060.parts_ordered and IsNull(Data0060.qty_tran,0)<Data0060.parts_ordered)
end
else if @SalCon=1 
begin
insert #tmp
select data0060.Rkey,Data0060.parts_ordered,data0060.qty_tran,quan_prod=sum(data0006.quan_prod)
from data0060(nolock) ,data0006(nolock)
where data0006.prod_status in (3,103)
and data0006.so_ptr=data0060.rkey
and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,'1999-01-01')>=@BDate
  and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,'2036-12-12')<=@EDate
  and IsNull(Data0060.sch_date,'1999-01-01')>=@BDate1
  and IsNull(Data0060.sch_Date,'2036-12-12')<=@EDate1
group by data0060.Rkey,Data0060.parts_ordered,data0060.qty_tran
 having (sum(data0006.quan_prod)>=Data0060.parts_ordered or IsNull(Data0060.qty_tran,0)>=Data0060.parts_ordered)
end


IF (@vindex=0) or (@vindex=1) or (@vindex=4)
select @cond='select dept_code=IsNull(Data0034.dept_code,t1.dept_code),
                     dept_name=IsNull(Data0034.dept_name,t1.dept_name),Data0034.seq_nr,
                     pcs_as_unit=IsNull(Data0034.pcs_as_unit,t1.pcs_as_unit),'

IF (@vindex=2)
select @cond='select data0008.prod_code,data0008.product_name,'
IF (@vindex=3)
select @cond='select Data0010.cust_code,data0010.abbr_name,'

if @spec_rkey='C'
select @cond=@cond+'  SUM(data0056.panels) AS QUANTITY '
else
select @cond=@cond+' CASE WHEN ('''+@TP+'''=''U'') THEN SUM((data0056.qty_backlog+data0056.to_be_stocked)/DATA0047.PARAMETER_VALUE)
                                                   ELSE  SUM((data0056.qty_backlog+data0056.to_be_stocked)*DATA0047.PARAMETER_VALUE) 
                     END  AS QUANTITY '
if (@vindex=1)or(@vindex=4)
Select @cond=@cond+' into #Data0034 '

select @cond=@cond+'
from data0056(nolock) inner join 
     data0006(nolock) on data0056.wo_ptr=data0006.rkey '

select @cond=@cond+' left join data0492(nolock) on data0006.cut_no=data0492.cut_no
inner join data0025(nolock) on data0006.bom_ptr=data0025.rkey '

if @vtype=0
select @cond=@cond+' and data0025.parent_ptr=0 '
if @vtype=1
select @cond=@cond+' and data0025.parent_ptr>0 '

select @cond=@cond+'
left join data0047(nolock) on data0047.source_pointer=data0006.bom_ptr
         AND DATA0047.PARAMETER_PTR='+@vptr1+' 
inner join data0050(nolock) on data0025.ancestor_ptr=data0050.rkey
left join data0059(nolock) on data0050.rkey=data0059.cust_part_ptr
        and data0492.customer_ptr=data0059.customer_ptr 
left join data0060(nolock) on data0060.sales_order=data0492.so_no '

if @vtp=1
select @cond=@cond+' and  data0060.status<=2'

select @cond=@cond+' and  data0060.rkey in (select so_ptr from data0006(nolock) where prod_status in (3,103))'

IF (@vindex=2)
select @cond=@cond+' inner join data0008(nolock) on data0025.prod_code_ptr=data0008.rkey'

select @cond=@cond+' left join data0010(nolock) on data0010.rkey=data0492.customer_ptr '

if (@vindex=0)
select @cond=@cond+' left join data0034 t1(nolock) on data0056.dept_ptr=t1.rkey left join 
 data0034 on t1.big_dept_ptr=Data0034.rkey '

if (@vindex=1)
select @cond=@cond+' left join data0034 t1(nolock) on data0056.dept_ptr=t1.rkey left join 
 data0034 on t1.dept_ptr=Data0034.rkey '

if (@vindex=4)
select @cond=@cond+' left join data0034 t1(nolock)  on data0056.dept_ptr=t1.rkey left join 
 data0034(nolock) on ((t1.rkey=data0034.rkey and t1.ttype=2) or (t1.group_ptr=data0034.rkey and t1.ttype=3))'

if @vindex5=0
  select @cond=@cond+' where  data0056.wtype=0 and data0056.unit_ptr=0 '
else
if @vindex5=1
  select @cond=@cond+' where  data0056.wtype=1 and data0056.unit_ptr=0 '
else
if @vindex5=2
  select @cond=@cond+' where  data0056.wtype=2 and data0056.unit_ptr=0 '
else
if @vindex5=3
  select @cond=@cond+' where data0056.wtype in (0,2) and data0056.unit_ptr=0 '
else
  select @cond=@cond+' where data0056.unit_ptr=0 '


if @vdept<>'%' select @cond=@cond+' and data0056.dept_ptr in (select rkey from data0034(nolock) where dept_ptr in (select rkey from data0034 where dept_code = '''+@vdept+'''))'

if @vindex6=0
  select @cond=@cond+' and data0006.prod_status < 9 '
if @vindex6=1
  select @cond=@cond+' and data0006.prod_status in (101,102,103) '

--客户交期过滤
IF not @BDate IS NULL
select @cond=@cond+' and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,''1999-01-01'')>='''+@BDate+''''
IF not @EDate IS NULL
select @cond=@cond+' and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,''2039-01-01'')<='''+@EDate+''''
--回复交期过滤
IF not @BDate1 IS NULL
select @cond=@cond+' and IsNull(Data0060.SCH_DATE,''1999-01-01'')>='''+@BDate1+''''
IF not @EDate1 IS NULL
select @cond=@cond+' and IsNull(Data0060.SCH_DATE,''2039-01-01'')<='''+@EDate1+''''

select @cond=@cond+' and not exists(select 1 from #tmp where data0060.rkey=#tmp.Rkey)'

IF @vindex2=1
select @cond=@cond+' and DATA0050.CUSTOMER_PART_NUMBER LIKE '''+@VPROJ+''''

IF @vindex2=2
select @cond=@cond+' and data0059.customer_part_desc LIKE '''+@VPROJ+''''

if @Vcust<>'%'
if @vcust_flag=0 
	select @cond=@cond+' and ISNULL(Data0010.cust_code,'''') LIKE '''+@Vcust+''''
else
	select @cond=@cond+' and ISNULL(Data0010.cust_code,'''') not LIKE '''+@Vcust+''''

if @vttype<>'3'
select @cond=@cond+' and  data0050.ttype='+@vttype


if @Whse_ptr>0
select @cond=@cond+' and Data0050.whse_ptr='+convert(varchar(10),@Whse_ptr)

IF (@vindex=0)
begin
select @cond=@cond+' group by IsNull(Data0034.dept_code,t1.dept_code),IsNull(Data0034.dept_name,t1.dept_name),Data0034.seq_nr,IsNull(Data0034.pcs_as_unit,t1.pcs_as_unit) ORDER BY  data0034.seq_nr '
end
IF(@vindex=1)
begin
	select @cond=@cond+' group by IsNull(Data0034.dept_code,t1.dept_code),IsNull(Data0034.dept_name,t1.dept_name),Data0034.seq_nr,IsNull(Data0034.pcs_as_unit,t1.pcs_as_unit) '--'ORDER BY  data0034.seq_nr '
	if @vdisp_flag=0	
	begin
		select @cond=@cond+' select Data0034.dept_code,Data0034.dept_name,Data0034.seq_nr,Data0034.pcs_as_unit, #Data0034.QUANTITY 
						 From Data0034(nolock) left join #Data0034(nolock) on Data0034.dept_code=#Data0034.dept_code Where Data0034.ttype=1 and Data0034.barcode_entry_flag=''Y'''
		if @Whse_ptr>0
			select @cond=@cond+' and (isnull(Data0034.whouse_ptr,0)=0 or Data0034.whouse_ptr='+convert(varchar(10),@Whse_ptr)+')'
		select @cond=@cond+' ORDER BY  data0034.seq_nr '
    end else
		select @cond=@cond+' select Data0034.dept_code,Data0034.dept_name,Data0034.seq_nr,Data0034.pcs_as_unit, #Data0034.QUANTITY 
                     From Data0034(nolock) inner join #Data0034(nolock) on Data0034.dept_code=#Data0034.dept_code Where Data0034.ttype=1 and Data0034.barcode_entry_flag=''Y'' ORDER BY  data0034.seq_nr '
end

IF(@vindex=4)
begin
	select @cond=@cond+' group by IsNull(Data0034.dept_code,t1.dept_code),IsNull(Data0034.dept_name,t1.dept_name),Data0034.seq_nr,IsNull(Data0034.pcs_as_unit,t1.pcs_as_unit) '--'ORDER BY  data0034.seq_nr '
	if @vdisp_flag=0	
	begin
		select @cond=@cond+' select Data0034.dept_code,Data0034.dept_name,Data0034.seq_nr,Data0034.pcs_as_unit, #Data0034.QUANTITY 
							 From Data0034(nolock) left join #Data0034(nolock) on Data0034.dept_code=#Data0034.dept_code left join data0034 a on data0034.dept_ptr=a.rkey
							 Where Data0034.barcode_entry_flag=''Y'' AND  (Data0034.ttype=2 or (Data0034.ttype=1 and exists(select 1 from #Data0034 t2 where Data0034.dept_code=t2.dept_code)))'
		if @Whse_ptr>0
			select @cond=@cond+' and (isnull(Data0034.whouse_ptr,0)=0 or Data0034.whouse_ptr='+convert(varchar(10),@Whse_ptr)+')'
		select @cond=@cond+' ORDER BY  a.seq_nr,data0034.dept_code '
    end else
		select @cond=@cond+' select Data0034.dept_code,Data0034.dept_name,Data0034.seq_nr,Data0034.pcs_as_unit, #Data0034.QUANTITY 
                     From Data0034(nolock) inner join #Data0034(nolock) on Data0034.dept_code=#Data0034.dept_code left join data0034 a on data0034.dept_ptr=a.rkey
                     Where Data0034.barcode_entry_flag=''Y'' AND  (Data0034.ttype=2 or (Data0034.ttype=1 and exists(select 1 from #Data0034 t2 where Data0034.dept_code=t2.dept_code))) ORDER BY  a.seq_nr,data0034.dept_code '
end

IF (@vindex=2)
begin
select @cond=@cond+' group by data0008.prod_code,data0008.product_name '
select @cond=@cond+' ORDER BY QUANTITY DESC '
end

IF (@vindex=3)
begin
select @cond=@cond+' group by Data0010.cust_code,data0010.abbr_name '
select @cond=@cond+' ORDER BY QUANTITY DESC '
end
exec (@cond)
PRINT (@cond)
--select @cond as vtx into testvtx
DROP TABLE #tmp
GO



---------------------------------------------
select dept_code=IsNull(Data0034.dept_code,t1.dept_code),
                     dept_name=IsNull(Data0034.dept_name,t1.dept_name),Data0034.seq_nr,
                     pcs_as_unit=IsNull(Data0034.pcs_as_unit,t1.pcs_as_unit),
                      CASE WHEN ('P'='U') THEN SUM((data0056.qty_backlog+data0056.to_be_stocked)/DATA0047.PARAMETER_VALUE)
                                                   ELSE  SUM((data0056.qty_backlog+data0056.to_be_stocked)*DATA0047.PARAMETER_VALUE) 
                     END  AS QUANTITY  into #Data0034 
from data0056(nolock) inner join 
     data0006(nolock) on data0056.wo_ptr=data0006.rkey  left join data0492(nolock) on data0006.cut_no=data0492.cut_no
inner join data0025(nolock) on data0006.bom_ptr=data0025.rkey  and data0025.parent_ptr>0 
left join data0047(nolock) on data0047.source_pointer=data0006.bom_ptr
         AND DATA0047.PARAMETER_PTR=7 
inner join data0050(nolock) on data0025.ancestor_ptr=data0050.rkey
left join data0059(nolock) on data0050.rkey=data0059.cust_part_ptr
        and data0492.customer_ptr=data0059.customer_ptr 
left join data0060(nolock) on data0060.sales_order=data0492.so_no  and  data0060.status<=2 and  data0060.rkey in (select so_ptr from data0006(nolock) where prod_status in (3,103)) left join data0010(nolock) on data0010.rkey=data0492.customer_ptr  left join data0034 t1(nolock) on data0056.dept_ptr=t1.rkey left join 
 data0034 on t1.dept_ptr=Data0034.rkey  where data0056.unit_ptr=0  and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,'1999-01-01')>='2000-01-01' and IsNull(Data0060.ORIG_SCHED_SHIP_DATE,'2039-01-01')<='2049-01-01' and IsNull(Data0060.SCH_DATE,'1999-01-01')>='2000-01-01' and IsNull(Data0060.SCH_DATE,'2039-01-01')<='2049-01-01' and not exists(select 1 from #tmp where data0060.rkey=#tmp.Rkey) group by IsNull(Data0034.dept_code,t1.dept_code),IsNull(Data0034.dept_name,t1.dept_name),Data0034.seq_nr,IsNull(Data0034.pcs_as_unit,t1.pcs_as_unit)  select Data0034.dept_code,Data0034.dept_name,Data0034.seq_nr,Data0034.pcs_as_unit, #Data0034.QUANTITY 
                     From Data0034(nolock) inner join #Data0034(nolock) on Data0034.dept_code=#Data0034.dept_code Where Data0034.ttype=1 and Data0034.barcode_entry_flag='Y' ORDER BY  data0034.seq_nr 
