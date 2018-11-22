
alter PROCEDURE EP0000;8
--EP000a计划分析会产生重复数据
@vflag int, /*0编排，1查看达成率一，2查看达成率二*/
@vptr int, /*计划指针*/
@vptr2 int, /*计划指针*/
@vptr3 int, /*计划指针*/
@Whse_ptr int=0, /*工厂指针*/
@vtp int=2, /* 0:外层，1：内层，2：全部*/
@vttype int =3 --产品类型 0:量产，1：样板，2：全部
as 

SELECT ppc_ptr,customer_part_number,cp_rev1,SUM(QTY_on_hand) as fg_qty
into #tst001
 FROM data00011
WHERE ppc_ptr in (@vptr,@vptr2,@vptr3)
group by ppc_ptr,customer_part_number,cp_rev1


if (@vflag=0) or (@vflag=1)
begin
	declare mycursor cursor for
	SELECT dept_ptr FROM (
	SELECT distinct schno,dept_ptr FROM [Data00007]
	where ppc_ptr in (@vptr,@vptr2,@vptr3)
	 ) a
	 
 	declare @vsql varchar(8000)
	declare @vsql2 varchar(8000)
	declare @vsql3 varchar(8000)
	declare @vsql4 varchar(8000)
	declare @vsql5 varchar(8000)
	set @vsql='CREATE TABLE #ppc01(d25rkey int NULL'
	set @vsql2=''
	set @vsql3=''
	set @vsql4=''
	set @vsql5=''
	declare @vrkey varchar(20)
	open mycursor
	fetch next from mycursor into @vrkey
	while @@fetch_status=0
	begin
		if @vflag=0
		begin
			if len(@vsql)<7500
				set @vsql=@vsql
				+',d'+rtrim(@vrkey)+'_sy decimal(6,2)' 
				+',d'+rtrim(@vrkey)+'_on decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_tr decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_sc decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_no varchar(10)' 
			else
			if len(@vsql2)<7500
				set @vsql2=@vsql2
				+',d'+rtrim(@vrkey)+'_sy decimal(6,2)' 
				+',d'+rtrim(@vrkey)+'_on decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_tr decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_sc decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_no varchar(10)' 
			else
			if len(@vsql3)<7500
				set @vsql3=@vsql3
				+',d'+rtrim(@vrkey)+'_sy decimal(6,2)' 
				+',d'+rtrim(@vrkey)+'_on decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_tr decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_sc decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_no varchar(10)' 
			else
			if len(@vsql4)<7500
				set @vsql4=@vsql4
				+',d'+rtrim(@vrkey)+'_sy decimal(6,2)' 
				+',d'+rtrim(@vrkey)+'_on decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_tr decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_sc decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_no varchar(10)' 
			else
				set @vsql5=@vsql5
				+',d'+rtrim(@vrkey)+'_sy decimal(6,2)' 
				+',d'+rtrim(@vrkey)+'_on decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_tr decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_sc decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_no varchar(10)' 
		end else
		begin
			if len(@vsql)<7500
				set @vsql=@vsql
				+',d'+rtrim(@vrkey)+'_sy decimal(6,2)' 
				+',d'+rtrim(@vrkey)+'_on decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_sc decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_pd decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_pd2 decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_no varchar(10)' 
				+',d'+rtrim(@vrkey)+'_pct varchar(8)' 
				+',d'+rtrim(@vrkey)+'_pc int' 
			else
			if len(@vsql2)<7500
				set @vsql2=@vsql2
				+',d'+rtrim(@vrkey)+'_sy decimal(6,2)' 
				+',d'+rtrim(@vrkey)+'_on decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_sc decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_pd decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_pd2 decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_no varchar(10)' 
				+',d'+rtrim(@vrkey)+'_pct varchar(8)' 
				+',d'+rtrim(@vrkey)+'_pc int' 
			else
			if len(@vsql3)<7500
				set @vsql3=@vsql3
				+',d'+rtrim(@vrkey)+'_sy decimal(6,2)' 
				+',d'+rtrim(@vrkey)+'_on decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_sc decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_pd decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_pd2 decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_no varchar(10)' 
				+',d'+rtrim(@vrkey)+'_pct varchar(8)' 
				+',d'+rtrim(@vrkey)+'_pc int' 
			else
			if len(@vsql4)<7500
				set @vsql4=@vsql4
				+',d'+rtrim(@vrkey)+'_sy decimal(6,2)' 
				+',d'+rtrim(@vrkey)+'_on decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_sc decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_pd decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_pd2 decimal(16,3)' 
				+',d'+rtrim(@vrkey)+'_no varchar(10)' 
				+',d'+rtrim(@vrkey)+'_pct varchar(8)' 
				+',d'+rtrim(@vrkey)+'_pc int' 
		end
		fetch next from mycursor into @vrkey
	end
	close mycursor
	deallocate mycursor
	set @vsql5=@vsql5+') ON [PRIMARY]'

	set @vsql5=@vsql5+' 
	select Data00008.Sch_no,CASE when Data00008.ttype=0 then data0010.P_CODE_DEF_PROD else data0010.P_CODE_DEF_SAMP end as CUST_P_CODE,
	data0008.P_CODE,data00008.edit_flag,
	Data00008.cust_code ,
	data00008.customer_part_number+(case when data0050.pcode>0 then ''*'' else '''' end) as customer_part_number,
	Data00008.cp_rev as 版本,Data00008.qty_backlog as 在制PCS,
	Data00008.PARTS_PER_PANEL,
	case when isnull(PARTS_PER_SET,0)=0 THEN sets else PARTS_PER_SET end as sets,
	Data00008.customer_part_desc,
	Data00008.CATALOG_NUMBER,
	Data00008.SCH_DATE,
	Data00008.manu_part_number,
	Data00008.eng_tp ,
	Data00008.layers,
	Data00008.unit_sq,
	Data00008.parts_ordered as 订单PCS,
	Data00008.parts_needs as 欠货PCS,
	Data00008.parts_needs*Data00008.unit_sq as sq_needs,#tst001.fg_qty as 仓存PCS,
	case when Data00008.parts_needs>isnull(#tst001.fg_qty,0) then Data00008.parts_needs-isnull(#tst001.fg_qty,0) else 0 end as parts_need_2,
	d50rkey,data00008.d25key,#ppc01.* ,data00008.remark,data00008.rkey,data00008.ppc_ptr
	from data00008 left join #tst001 on data00008.ppc_ptr=#tst001.ppc_ptr and data00008.customer_part_number=#tst001.customer_part_number
	and #tst001.cp_rev1=substring(data00008.cp_rev,1,len(#tst001.cp_rev1))
	left join #ppc01 on data00008.d25key=#ppc01.d25rkey
	left join data0010 on data00008.customer_ptr=data0010.rkey
	left join data0025 on data00008.d25key=data0025.rkey
	left join data0050 on data0025.ancestor_ptr=data0050.rkey
	left join data0008 on data0025.prod_code_ptr=data0008.rkey'

	set @vsql5=@vsql5+' where data00008.ppc_ptr in ('+str(@vptr)+','+str(@vptr2)+','+str(@vptr3)+')'
	set @vsql5=@vsql5+' 
	order by data0050.pcode desc,CASE when data00008.ttype=0 then data0010.P_CODE_DEF_PROD else data0010.P_CODE_DEF_SAMP end desc,data0008.P_CODE desc,data00008.sch_date,data00008.customer_part_number,
	Data00008.cp_rev,Data00008.manu_part_number,Data00008.parts_per_panel
	drop table #ppc01
	drop table #tst001'
	exec(@vsql+@vsql2+@vsql3+@vsql4+@vsql5)
end else
if @vflag=2
begin
	select Data0015.WAREHOUSE_name as factcode,
	data00009.ppc_no,data00009.ppc_ptr,Data00009.schno as Sch_no,str(Data0034.ppc_seq_nr,3)+'.'+ltrim(Data0034.DEPT_CODE)+'['+ltrim(Data0034.DEPT_NAME)+']' as dept_name,
	DATA00008.cust_code ,data00008.d50rkey,Data00009.sys_qty,a.DEPT_CODE+a.dept_name as big_dept_name,
	data0050.customer_part_number+(case when data0050.pcode>0 then '*' else '' end) as customer_part_number,Data00009.intime,Data00009.outtime,
	data0050.cp_rev as 版本,
	customer_part_desc,SCH_DATE,
	data0050.CATALOG_NUMBER,
	data0025.manu_part_number,
	data00009.PARTS_PER_PANEL,
	case when isnull(data00009.PARTS_PER_SET,0)=0 THEN sets else data00009.PARTS_PER_SET end as sets,
	case when Data00009.ppc_unit_ptr=0 then 'Panel' when Data00009.ppc_unit_ptr=2 then 'SET' else 'PCS'  end as unit_code ,
	case when Data00009.ppc_unit_ptr=0 then qty_prod_pnls when Data00009.ppc_unit_ptr=2 then cast(ceiling(qty_prod/data00009.parts_per_set) AS int) else qty_prod  end as qty_prod,
	case when Data00009.ppc_unit_ptr=0 then qty_prod_pnls2 when Data00009.ppc_unit_ptr=2 then cast(ceiling(qty_prod2/data00009.parts_per_set) AS int) else qty_prod2  end as qty_prod2,
	case when Data00009.ppc_unit_ptr=0 then pnl_qty when Data00009.ppc_unit_ptr=2 then ceiling(data00009.qty_backlog/data00009.parts_per_set) else data00009.qty_backlog  end as qty_backlog,
	case when Data00009.ppc_unit_ptr=0 then ceiling(data00009.qty_sched/data00009.parts_per_panel) when Data00009.ppc_unit_ptr=2 then ceiling(data00009.qty_sched/data00009.parts_per_set) else data00009.qty_sched  end as qty_sched,
	case when Data00009.ppc_unit_ptr=0 then ceiling(qty_in/data00009.parts_per_panel) when Data00009.ppc_unit_ptr=2 then ceiling(qty_in/data00009.parts_per_set) else qty_in  end as qty_in,
	qty_sched*data00008.unit_sq as sq_SCHED,
	qty_prod*data00008.unit_sq as sq_prod,
	qty_prod2*data00008.unit_sq as sq_prod2,
	qty_in*data00008.unit_sq as sq_in,
	data00009.qty_backlog*data00008.unit_sq as sq_backlog,
	case when data00009.qty_sched>0 then 
	case when Data00009.ppc_unit_ptr=1 then round((isnull(qty_prod,0)+isnull(qty_prod2,0))*100/data00009.qty_sched,2) else round((isnull(qty_prod_pnls,0)+isnull(qty_prod_pnls2,0))*data00009.parts_per_panel*100/data00009.qty_sched,2) end
	else null end as comp_rate	,Data00008.remark
	from data00009 
	left join (select  customer_part_desc, ttype,customer_ptr,d25key,sets,ppc_ptr,cust_code ,customer_part_number,cp_rev,data00008.d50rkey,data00008.prod_code,data00008.unit_sq,min(SCH_DATE) as sch_date,MAX(remark) as remark
	from data00008 where ppc_ptr  in (@vptr,@vptr2,@vptr3) 
	group by customer_part_desc,ttype,customer_ptr,d25key,sets,ppc_ptr,cust_code ,customer_part_number,cp_rev,data00008.d50rkey,data00008.prod_code,data00008.unit_sq) 
  as Data00008 on data00008.d25key=Data00009.d25_rkey 
    and data00008.ppc_ptr = data00009.ppc_ptr --szmeitan增加的
	left join #tst001 on data00008.ppc_ptr=#tst001.ppc_ptr and data00008.customer_part_number=#tst001.customer_part_number and data00008.ppc_ptr = data00009.ppc_ptr
	and #tst001.cp_rev1=substring(data00008.cp_rev,1,len(#tst001.cp_rev1))
	left join Data0034 on Data00009.ppc_dept_ptr=Data0034.RKEY
	left join Data0034 a on Data0034.big_dept_ptr=a.RKEY
	left join Data0025 on Data00009.d25_rkey=Data0025.RKEY
	left join Data0050 on Data0025.ancestor_ptr=Data0050.RKEY
	left join data0008 on data0025.prod_code_ptr=data0008.rkey
	left join data0010 on data00008.customer_ptr=data0010.rkey
	left join Data00006 on Data00006.RKEY=data00008.ppc_ptr 
	left join data0015 on Data00006.whouse_ptr=Data0015.rkey 
	 where  Data00009.ppc_ptr in (@vptr,@vptr2,@vptr3) and data00009.parts_per_panel>0 and (data00009.qty_backlog>0 or data00009.qty_sched>0 or Data00009.qty_prod2>0)
	order by Data0015.WAREHOUSE_name,Data0034.ppc_seq_nr,a.dept_name,data00009.ppc_no,DATA0034.DEPT_CODE,case when isnull(data00009.ppc_no,0)=0 then 999 else data00009.ppc_no end,Data00009.schno,data0050.pcode desc,CASE when data00008.ttype=0 then data0010.P_CODE_DEF_PROD else data0010.P_CODE_DEF_SAMP end desc,data0008.P_CODE desc,sch_date,data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number,data00009.PARTS_PER_PANEL
end
go

