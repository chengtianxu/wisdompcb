EP003A界面查询 
exec ep003a 0,0,0,'947,786','',2,2,0

CREATE PROCEDURE ep003a
@Whse_ptr int=0, /*工厂指针*/
@vfg_flag int=0, /*0不显示仓存，1显示仓存*/
@vflag int=0, /*0是按产品型号，1是按订单*/
@vsql1 varchar(2000),--工序，后面用逗号
@vsql2 varchar(2000),--类型别，后面用逗号
@outsource_flag int=2, /*生产类型 0：自制，1外发，2全部*/
@vtp int=2, /* 0:外层，1：内层，2：全部*/
@vttype int =3 --产品类型 0:量产，1：样板，2：全部
with encryption
as 

	select data0034.dept_ptr,data0034.ppc_seq_nr as schno,isnull(data0034.ppc_unit_ptr,0) as unit_ptr,data0034.dept_code,data0034.dept_name,
		case when ppc_unit_ptr=0 then 'Panel' when ppc_unit_ptr=2 then 'SET' else 'PCS'  end as unit_code 
	into #data00007
	from data0034
	where data0034.ttype=1 
	and barcode_entry_flag='Y' 
	and rkey in (
		select distinct data0034.ppc_dept_ptr 
		from data0056 left join data0006 on data0056.wo_ptr=data0006.rkey
		left join Data0060 on Data0006.SO_PTR=Data0060.rkey
		left join data0038 on data0038.source_ptr=data0006.bom_ptr and data0038.flow_no=data0056.flow_no
		left join data0025 on data0006.bom_ptr=data0025.rkey
		left join data0050 on data0025.ancestor_ptr=data0050.rkey
		left join data0034 b on data0056.dept_ptr=b.rkey
		left join data0034 c(nolock)  on data0034.dept_ptr=c.rkey LEFT join Data0034 a on c.PPC_DEPT_PTR=a.rkey
 		 where  data0034.barcode_entry_flag='Y' 
		 and data0034.ppc_dept_ptr in (select ppc_dept_ptr from data0034 where ttype=1)
		 and (@Whse_ptr=0 or data0006.whouse_ptr=@Whse_ptr)
		 and  (@vttype=3 or Data0060.ttype=@vttype)
		 and  (@outsource_flag=2 or b.OUT_SOURCE=@outsource_flag)
		 and (@vtp=2 or (@vtp=0 and data0025.parent_ptr=0) or (@vtp=1 and data0025.parent_ptr>0) ))
	order by data0034.ppc_seq_nr


	
	declare @vsql6 varchar(8000)
	declare @vsql6_2 varchar(8000)
	declare @vrkey2 varchar(20)
	declare @vrkey2_2 varchar(20)

	if @vfg_flag=1
	begin
		select cust_part_ptr,SUM(data0053.QTY_ON_HAND) as qty_on_hand
		into #Test07
		from Data0053 left join Data0016 on Data0053.LOC_PTR=Data0016.RKEY
		where Data0053.QTY_ON_HAND>0 and isnull(data0016.IsForkplate,0)=0
		group by cust_part_ptr

		select cust_part_ptr,SUM(data0053.QTY_ON_HAND) as qty_on_hand
		into #Test08
		from Data0053 left join Data0016 on Data0053.LOC_PTR=Data0016.RKEY
		where Data0053.QTY_ON_HAND>0 and data0016.IsForkplate=1
		group by cust_part_ptr
		
		select cust_part_ptr,SUM(data0053.QUANTITY) as qty_on_hand
		into #test09
		from data0053
        inner join data0416 on data0053.NPAD_PTR=data0416.rkey
        where data0416.tstatus<>2 and data0416.type=2
		group by cust_part_ptr

	end


	if @vflag=0
	begin
		select * into #test00x0
			from (
			select data0050.CATALOG_NUMBER,data0050.rkey as d50rkey,data0050.ttype,data0050.customer_part_number,data0050.cp_rev,vDATA0059.CUSTOMER_PART_DESC,vDATA0059.CUSTOMER_matl_DESC,
			ltrim(ISNULL(DATA0050.ENG_TP,''))+'/'+ltrim(ISNULL(DATA0050.FG_THICK,''))+'/'+ltrim(ISNULL(DATA0050.SM_COLOR,'')) AS ENG_TP,DATA0050.ETEST_TP,
			DATA0050.CNC_TP as CNC_TP,
				   SUM(DATA0056.PANELS) AS PANELS,
				   data0060.SALES_ORDER,data0060.ENT_DATE, data0060.SCH_DATE as sch_date,data0060.rkey as so_ptr,
				   data0060.COMMISION_ON_TOOLING,
				   Data0050.unit_sq,data0050.set_x_qty*data0050.set_y_qty as sets,
				   DATA0025.MANU_PART_NUMBER,DATA0010.CUST_CODE,
					vDATA0059.customer_ptr,Data0050.report_unit_value1,
				   DATA0010.ABBR_NAME,data0008.prod_code+'.'+data0008.PRODUCT_NAME AS PROD_CODE,Data0008.RKEY as d08rkey,
				   DATA0025.PARENT_PTR,DATA0025.RKEY,cast(0 as float) as weight_BACKLOG,SUM( DATA0056.QTY_BACKLOG) AS QTY_BACKLOG,
				   DATA0050.SET_X_QTY*DATA0050.SET_Y_QTY AS SET_NUM,DATA0050.LAYERS,MAX(DATA0006_1.PROD_STATUS) AS PROD_STATUS,
					data0006_1.parts_per_panel,data0006_1.parts_per_set,data0006_1.panel_a_b,max(data0492.ttype) as motype,max(data0006_1.pnl_size) as pnl_size
			from data0056(nolock) inner join
				 (select * from data0006(nolock) where rkey in (select wo_ptr from data0056)) as data0006_1 on data0056.wo_ptr=data0006_1.RKEY left join 
				 data0492(nolock) on data0006_1.CUT_NO=data0492.CUT_NO left join 
				 data0034(nolock) on data0056.dept_ptr=data0034.rkey left join 
				 data0025(nolock) on data0006_1.bom_ptr=data0025.rkey left join 
				 data0008(nolock) on data0025.prod_code_ptr=data0008.rkey left join 
				 data0050(nolock) on data0025.ancestor_ptr=data0050.rkey left join 
				(select data0060.* from data0060(nolock)  where data0060.rkey in (select so_ptr from data0006(nolock) where prod_status in (3,101,102,103))) as data0060 on data0060.rkey=data0006_1.so_ptr 
				left join vDATA0059(nolock) on data0050.rkey=vDATA0059.cust_part_ptr left join 
				 data0010(nolock) on vDATA0059.customer_ptr=data0010.rkey left join 
				 data0097(nolock) on data0060.purchase_order_ptr=data0097.rkey 
			 where  data0006_1.prod_status<>9
			 and (@Whse_ptr=0 or data0006_1.whouse_ptr=@Whse_ptr)
			 and  (@vttype=3 or data0060.ttype=@vttype)
			 and  (@outsource_flag=2 or Data0034.OUT_SOURCE=@outsource_flag)
			 and (@vtp=2 or (@vtp=0 and data0025.parent_ptr=0) or (@vtp=1 and data0025.parent_ptr>0) )
			 and PATINDEX('%,'+ltrim(rtrim(str(Data0034.DEPT_PTR)))+',%',','+@vsql1+',')>0

			group by
				data0050.CATALOG_NUMBER,data0050.rkey,data0050.ttype,data0050.customer_part_number,data0050.cp_rev,vDATA0059.customer_part_desc,vDATA0059.CUSTOMER_matl_DESC,ltrim(ISNULL(DATA0050.ENG_TP,''))+'/'+ltrim(ISNULL(DATA0050.FG_THICK,''))+'/'+ltrim(ISNULL(DATA0050.SM_COLOR,'')),
				data0050.etest_tp,DATA0050.CNC_TP,Data0050.unit_sq,data0025.manu_part_number,
				data0050.cp_rev,data0060.SALES_ORDER,data0060.ENT_DATE,data0060.SCH_DATE,data0060.rkey,
				DATA0010.CUST_CODE,vDATA0059.CUSTOMER_PTR,Data0050.report_unit_value1,data0010.abbr_name,data0008.prod_code+'.'+data0008.PRODUCT_NAME,Data0008.RKEY,
				data0025.parent_ptr,data0025.rkey,data0060.COMMISION_ON_TOOLING,
				data0050.set_x_qty*data0050.set_y_qty,data0050.layers,
				data0006_1.parts_per_panel,data0006_1.parts_per_set,data0006_1.panel_a_b		

		) a
		order by layers,customer_part_number,cp_rev,parts_per_panel,parts_per_set,panel_a_b,SALES_ORDER,so_ptr


	select d08rkey,CAST('' as varchar(30)) as manu_part_number,CATALOG_NUMBER,customer_ptr,d50rkey,ttype,customer_part_number,cp_rev,CUSTOMER_PART_DESC,CUSTOMER_matl_DESC,
			   UNIT_SQ, sets, CUST_CODE,ABBR_NAME,PROD_CODE,PARENT_PTR,RKEY as d25KEY,
			   LAYERS,parts_per_panel,parts_per_set,panel_a_b,max(pnl_size) as pnl_size,
			   min(case when sch_date is null then getdate()+365 else sch_date end) as sch_date,
			   MAX(COMMISION_ON_TOOLING) as COMMISION_ON_TOOLING,
			   sum(QTY_BACKLOG*report_unit_value1) as weight_BACKLOG,sum(QTY_BACKLOG) as QTY_BACKLOG,sum(PANELS) as panels,case when max(motype)>0 then '补料' else '' end AS remark
		INTO #data00008
		from #test00x0 
		where parent_ptr=0
		group by 
				d08rkey,CATALOG_NUMBER,customer_ptr,d50rkey,ttype,customer_part_number,cp_rev,CUSTOMER_PART_DESC,CUSTOMER_matl_DESC,
			   UNIT_SQ, sets, CUST_CODE,ABBR_NAME,PROD_CODE,PARENT_PTR,RKEY,
			   LAYERS,parts_per_panel,parts_per_set,panel_a_b

		INSERT INTO #data00008
		select d08rkey,manu_part_number,CATALOG_NUMBER,customer_ptr,d50rkey,ttype,customer_part_number,cp_rev,CUSTOMER_PART_DESC,CUSTOMER_matl_DESC,
			   UNIT_SQ, sets, CUST_CODE,ABBR_NAME,PROD_CODE,PARENT_PTR,RKEY as d25KEY,
			   LAYERS,parts_per_panel,parts_per_set,panel_a_b,max(pnl_size) as pnl_size,
			   min(case when sch_date is null then getdate()+365 else sch_date end) as sch_date,
			   MAX(COMMISION_ON_TOOLING) as COMMISION_ON_TOOLING,
			   0 as weight_BACKLOG,
			   sum(QTY_BACKLOG) as QTY_BACKLOG,sum(PANELS) as panels,case when max(motype)>0 then '补料' else '' end AS remark
		from #test00x0 where parent_ptr>0
		group by 
				d08rkey,manu_part_number,CATALOG_NUMBER,customer_ptr,d50rkey,ttype,customer_part_number,cp_rev,CUSTOMER_PART_DESC,CUSTOMER_matl_DESC,ENG_TP,ETEST_TP,CNC_TP,
			   UNIT_SQ, sets, CUST_CODE,ABBR_NAME,PROD_CODE,PARENT_PTR,RKEY,
			   LAYERS,parts_per_panel,parts_per_set,panel_a_b
		order by 
		customer_part_number,cp_rev,manu_part_number,parts_per_panel,parts_per_set
		DROP table #test00x0
		
		select Data0060.CUST_PART_PTR as rkey,
			   sum(PARTS_ORDERED) as PARTS_ORDERED,
			   SUM(qty_fg_stocked) AS qty_fg_stocked,  
			   sum(parts_ordered-PARTS_SHIPPED+part_ovsh+quan_to_re_delivery-returned_ship) as parts_needs
		into #test00x2
		from data0060(nolock)
		where --data0060.qty_plannned>0 and  
		parts_ordered-PARTS_SHIPPED+part_ovsh+quan_to_re_delivery-returned_ship>0
		and  data0060.status<=2		
		and (@Whse_ptr=0 or data0060.whse_ptr=@Whse_ptr)
		and  (@vttype=3 or data0060.ttype=@vttype)
		group by Data0060.CUST_PART_PTR
		
		select data0050.rkey as rkey,sum(data0006.quan_sch)  as quanschtocut
		into #test00x3 from data0006
		inner join data0025 on data0006.bom_ptr=data0025.rkey
		inner join data0050 on data0025.ANCESTOR_PTR=data0050.rkey
		where PROD_STATUS=2
		and (@Whse_ptr=0 or data0006.WHOUSE_PTR=@Whse_ptr)
		and  (@vttype=2 or data0050.ttype=@vttype)
		group by Data0050.rkey		
		
		declare mycursor cursor for
		SELECT dept_ptr,unit_ptr FROM #data00007 
		 order by [schno]
		 
		set @vsql6='CREATE TABLE #ppc01(d25rkey int NULL'
		set @vsql6_2=''
		open mycursor
		fetch next from mycursor into @vrkey2,@vrkey2_2
		while @@fetch_status=0
		begin
			if  PATINDEX('%,'+rtrim(@vrkey2)+',%',','+@vsql1+',')>0
			if LEN(@vsql6)<7900
				if @vrkey2_2=0
					set @vsql6=@vsql6
					+',#'+rtrim(@vrkey2)+'_c decimal(16,2)' 
					+',#'+rtrim(@vrkey2)+'_p decimal(16,3)' 
					+',#'+rtrim(@vrkey2)+'_q decimal(16,3)' 
				else
					set @vsql6=@vsql6
					+',#'+rtrim(@vrkey2)+'_c decimal(16,2)' 
					+',#'+rtrim(@vrkey2)+'_s decimal(16,3)' 
					+',#'+rtrim(@vrkey2)+'_q decimal(16,3)' 
			else
				if @vrkey2_2=0
					set @vsql6_2=@vsql6_2
					+',#'+rtrim(@vrkey2)+'_c decimal(16,2)' 
					+',#'+rtrim(@vrkey2)+'_p decimal(16,3)' 
					+',#'+rtrim(@vrkey2)+'_q decimal(16,3)' 
				else
					set @vsql6_2=@vsql6_2
					+',#'+rtrim(@vrkey2)+'_c decimal(16,2)' 
					+',#'+rtrim(@vrkey2)+'_s decimal(16,3)' 
					+',#'+rtrim(@vrkey2)+'_q decimal(16,3)' 
			fetch next from mycursor into @vrkey2,@vrkey2_2
		end
		close mycursor
		deallocate mycursor
		set @vsql6_2=@vsql6_2+') ON [PRIMARY]'
		set @vsql6_2=@vsql6_2+' 
		select 
		#data00008.cust_code ,
		case when #data00008.COMMISION_ON_TOOLING=0 then ''内销'' 
			when #data00008.COMMISION_ON_TOOLING=1 then ''保税'' 
			else ''外销'' end as 类型,
		#data00008.customer_part_number+'' ''+isnull(#data00008.cp_rev,'''')+(case when data0050.pcode>0 then ''*'' else '''' end) as customer_part_number,
		#data00008.customer_part_desc,#data00008.CUSTOMER_matl_DESC ,
		#data00008.PARTS_PER_PANEL,
		case when isnull(PARTS_PER_SET,0)=0 THEN sets else PARTS_PER_SET end as sets,#data00008.unit_sq,
		#data00008.prod_code,
		#data00008.pnl_size,
		#data00008.SCH_DATE,
		#data00008.manu_part_number,
		#data00008.layers,
		#data00008.ttype,
		#test00x2.parts_ordered as 订单PCS,
		#test00x2.qty_fg_stocked AS 入仓数,
		isnull(#test00x2.parts_ordered,0) -  isnull(#test00x2.qty_fg_stocked,0)   AS 入仓欠数,
		#test00x2.parts_needs as 欠货PCS,
		#test00x3.quanschtocut as 已投产未开料,
		d50rkey,#data00008.d25key,'
	    
		if @vfg_flag=1
			set @vsql6_2=@vsql6_2+'#Test07.qty_on_hand as 好板仓,#Test08.qty_on_hand as 叉板仓,#test09.qty_on_hand as 待审核入仓,'
	
		set @vsql6_2=@vsql6_2+' 
		#data00008.qty_backlog as 在制总PCS,
		ceiling(#data00008.qty_backlog/#data00008.PARTS_PER_PANEL) as 在制总PNL,
		round(#data00008.qty_backlog*#data00008.unit_sq,1) as 在制总面积,
		round(weight_BACKLOG,2) as 在制总重量, CAST(0 AS bit) as chose_flag,
		#ppc01.* ,#data00008.remark into #ppc02
		from #data00008 left join #ppc01 on #data00008.d25key=#ppc01.d25rkey
		left join #test00x2 on #data00008.d50rkey=#test00x2.rkey
		left join #test00x3 on #data00008.d50rkey=#test00x3.rkey
		left join data0010 on #data00008.customer_ptr=data0010.rkey
		left join data0025 on #data00008.d25key=data0025.rkey
		left join Data0050 on Data0025.ancestor_ptr=Data0050.RKEY'
		
		if @vfg_flag=1
			set @vsql6_2=@vsql6_2+' left join #Test07 on data0050.rkey=#Test07.cust_PART_PTR
				left join #Test08 on data0050.rkey=#Test08.cust_PART_PTR
				left join #test09 on data0050.rkey=#test09.cust_part_ptr'
		
		set @vsql6_2=@vsql6_2+'
		where #data00008.QTY_BACKLOG>0'

		if @vsql2<>''	set @vsql6_2=@vsql6_2+' and d08rkey in ('+@vsql2+')' 

		set @vsql6_2=@vsql6_2+' 
		order by data0050.ttype desc,data0050.pcode desc,CASE when #data00008.ttype=0 then data0010.P_CODE_DEF_PROD else data0010.P_CODE_DEF_SAMP end desc,#data00008.sch_date,#data00008.customer_part_number,
		#data00008.cp_rev,#data00008.manu_part_number,#data00008.parts_per_panel ;
		
		SELECT CAST (ROW_NUMBER() OVER(order by CUSTOMER_PART_NUMBER asc) AS INT) AS seq,
        CUSTOMER_PART_NUMBER  INTO     #T1
        FROM   (
           SELECT DISTINCT CUSTOMER_PART_NUMBER
           FROM   #ppc02
         )                             a
		select  seq as ''在线款序'',#ppc02.* from #ppc02 , #T1 
		where #ppc02.CUSTOMER_PART_NUMBER = #T1.CUSTOMER_PART_NUMBER 
		order by seq asc
		
		drop table #T1
		drop table #ppc01
		drop table #ppc02'
	end else
	begin
		select * into #test00x1
			from (
			select data0050.CATALOG_NUMBER,data0050.rkey as d50rkey,data0050.ttype,data0050.customer_part_number,data0050.cp_rev,vDATA0059.CUSTOMER_PART_DESC,vDATA0059.CUSTOMER_matl_DESC,
			ltrim(ISNULL(DATA0050.ENG_TP,''))+'/'+ltrim(ISNULL(DATA0050.FG_THICK,''))+'/'+ltrim(ISNULL(DATA0050.SM_COLOR,'')) AS ENG_TP,DATA0050.ETEST_TP,
			DATA0050.CNC_TP as CNC_TP,
				   SUM(DATA0056.PANELS) AS PANELS,data0060.SCH_DATE as sch_date,Data0050.unit_sq,data0050.set_x_qty*data0050.set_y_qty as sets,
				   isnull(data0060.PARTS_ORDERED,0) as PARTS_ORDERED ,
				   data0060.SALES_ORDER,data0060.ENT_DATE,data0060.rkey as so_ptr,data0060.COMMISION_ON_TOOLING,
				data0060.PARTS_SHIPPED,data0060.part_ovsh,data0060.quan_to_re_delivery,data0060.returned_ship,
				   DATA0025.MANU_PART_NUMBER,DATA0010.CUST_CODE,
					vDATA0059.customer_ptr,Data0050.report_unit_value1,
				   DATA0010.ABBR_NAME,data0008.prod_code+'.'+data0008.PRODUCT_NAME AS PROD_CODE,Data0008.RKEY as d08rkey,
				   DATA0025.PARENT_PTR,DATA0025.RKEY,cast(0 as float) as weight_BACKLOG,SUM( DATA0056.QTY_BACKLOG) AS QTY_BACKLOG,
				   DATA0050.SET_X_QTY*DATA0050.SET_Y_QTY AS SET_NUM,DATA0050.LAYERS,MAX(DATA0006_1.PROD_STATUS) AS PROD_STATUS,
					data0006_1.parts_per_panel,data0006_1.parts_per_set,data0006_1.panel_a_b,max(data0492.ttype) as motype,max(data0006_1.pnl_size) as pnl_size
			from data0056(nolock) inner join
				 (select * from data0006(nolock) where rkey in (select wo_ptr from data0056)) as data0006_1 on data0056.wo_ptr=data0006_1.RKEY left join 
				 data0492(nolock) on data0006_1.CUT_NO=data0492.CUT_NO left join 
				 data0034(nolock) on data0056.dept_ptr=data0034.rkey left join 
				 data0025(nolock) on data0006_1.bom_ptr=data0025.rkey left join 
				 data0008(nolock) on data0025.prod_code_ptr=data0008.rkey left join 
				 data0050(nolock) on data0025.ancestor_ptr=data0050.rkey left join 
				(select data0060.* from data0060(nolock)  where data0060.rkey in (select so_ptr from data0006(nolock) where prod_status in (3,101,102,103))
				 ) as data0060 on data0060.rkey=data0006_1.so_ptr left join
				 vDATA0059(nolock) on data0050.rkey=vDATA0059.cust_part_ptr left join 
				 data0010(nolock) on vDATA0059.customer_ptr=data0010.rkey left join 
				 data0097(nolock) on data0060.purchase_order_ptr=data0097.rkey 
			 where  data0006_1.prod_status<>9
			 and (@Whse_ptr=0 or data0006_1.whouse_ptr=@Whse_ptr)
			 and  (@vttype=3 or data0060.ttype=@vttype)
			 and  (@outsource_flag=2 or Data0034.OUT_SOURCE=@outsource_flag)
			 and (@vtp=2 or (@vtp=0 and data0025.parent_ptr=0) or (@vtp=1 and data0025.parent_ptr>0) )
			 and PATINDEX('%,'+ltrim(rtrim(str(Data0034.DEPT_PTR)))+',%',','+@vsql1+',')>0

			group by
				data0050.CATALOG_NUMBER,data0050.rkey,data0050.ttype,data0050.customer_part_number,data0050.cp_rev,vDATA0059.customer_part_desc,vDATA0059.CUSTOMER_matl_DESC,ltrim(ISNULL(DATA0050.ENG_TP,''))+'/'+ltrim(ISNULL(DATA0050.FG_THICK,''))+'/'+ltrim(ISNULL(DATA0050.SM_COLOR,'')),
				data0050.etest_tp,DATA0050.CNC_TP,Data0050.unit_sq,data0025.manu_part_number,
				data0060.parts_ordered,data0060.parts_shipped,data0060.part_ovsh,quan_to_re_delivery,data0060.returned_ship,
				data0050.cp_rev,data0060.SALES_ORDER,data0060.ENT_DATE,data0060.SCH_DATE,data0060.rkey,
				DATA0010.CUST_CODE,vDATA0059.CUSTOMER_PTR,Data0050.report_unit_value1,data0010.abbr_name,data0008.prod_code+'.'+data0008.PRODUCT_NAME,Data0008.RKEY,
				data0025.parent_ptr,data0025.rkey,data0060.COMMISION_ON_TOOLING,
				data0050.set_x_qty*data0050.set_y_qty,data0050.layers,
				data0006_1.parts_per_panel,data0006_1.parts_per_set,data0006_1.panel_a_b		

		) a
		order by layers,customer_part_number,cp_rev,parts_per_panel,parts_per_set,panel_a_b,SALES_ORDER,so_ptr

		select so_ptr,d08rkey,CAST('' as varchar(30)) as manu_part_number,CATALOG_NUMBER,customer_ptr,d50rkey,ttype,customer_part_number,cp_rev,CUSTOMER_PART_DESC,CUSTOMER_matl_DESC,
			   UNIT_SQ, sets, CUST_CODE,ABBR_NAME,PROD_CODE,PARENT_PTR,RKEY as d25KEY,COMMISION_ON_TOOLING,
			   LAYERS,parts_per_panel,parts_per_set,panel_a_b,max(pnl_size) as pnl_size,
			   (case when sch_date is null then getdate()+365 else sch_date end) as sch_date,sales_order,ent_date,
			   (PARTS_ORDERED) as PARTS_ORDERED,	
			   (parts_ordered-PARTS_SHIPPED+part_ovsh+quan_to_re_delivery-returned_ship) as parts_needs,
			   sum(QTY_BACKLOG*report_unit_value1) as weight_BACKLOG,sum(QTY_BACKLOG) as QTY_BACKLOG,sum(PANELS) as panels,case when max(motype)>0 then '补料' else '' end AS remark
		INTO #data00008_2
		from #test00x1
		where parent_ptr=0
		group by 
				so_ptr,d08rkey,CATALOG_NUMBER,customer_ptr,d50rkey,ttype,customer_part_number,cp_rev,CUSTOMER_PART_DESC,CUSTOMER_matl_DESC,
			   UNIT_SQ, sets, CUST_CODE,ABBR_NAME,PROD_CODE,PARENT_PTR,RKEY,COMMISION_ON_TOOLING,
			   LAYERS,parts_per_panel,parts_per_set,panel_a_b,sch_date,sales_order,ent_date
			   ,PARTS_ORDERED, (parts_ordered-PARTS_SHIPPED+part_ovsh+quan_to_re_delivery-returned_ship)

		INSERT INTO #data00008_2
		select so_ptr,d08rkey,manu_part_number,CATALOG_NUMBER,customer_ptr,d50rkey,ttype,customer_part_number,cp_rev,CUSTOMER_PART_DESC,CUSTOMER_matl_DESC,
			   UNIT_SQ, sets, CUST_CODE,ABBR_NAME,PROD_CODE,PARENT_PTR,RKEY as d25KEY,COMMISION_ON_TOOLING,
			   LAYERS,parts_per_panel,parts_per_set,panel_a_b,max(pnl_size) as pnl_size,
			   (case when sch_date is null then getdate()+365 else sch_date end) as sch_date,sales_order,ent_date,
			   0 as PARTS_ORDERED,	
			   0 as parts_needs,0 as weight_BACKLOG,
			   sum(QTY_BACKLOG) as QTY_BACKLOG,sum(PANELS) as panels,case when max(motype)>0 then '补料' else '' end AS remark
		from #test00x1 where parent_ptr>0
		group by 
				so_ptr,d08rkey,manu_part_number,CATALOG_NUMBER,customer_ptr,d50rkey,ttype,customer_part_number,cp_rev,CUSTOMER_PART_DESC,CUSTOMER_matl_DESC,ENG_TP,ETEST_TP,CNC_TP,
			   UNIT_SQ, sets, CUST_CODE,ABBR_NAME,PROD_CODE,PARENT_PTR,RKEY,COMMISION_ON_TOOLING,
			   LAYERS,parts_per_panel,parts_per_set,panel_a_b,sch_date,sales_order,ent_date
		order by 
		customer_part_number,cp_rev,manu_part_number,parts_per_panel,parts_per_set,sch_date,sales_order,ent_date,so_ptr
		DROP table #test00x1
		
		declare mycursor cursor for
		SELECT dept_ptr,unit_ptr FROM #data00007 
		 order by [schno]
		 
		set @vsql6='CREATE TABLE #ppc01(d25rkey int NULL'
		set @vsql6_2=''
		open mycursor
		fetch next from mycursor into @vrkey2,@vrkey2_2
		while @@fetch_status=0
		begin
			if  PATINDEX('%,'+rtrim(@vrkey2)+',%',','+@vsql1+',')>0
			if LEN(@vsql6)<7900
				if @vrkey2_2=0
					set @vsql6=@vsql6
					+',#'+rtrim(@vrkey2)+'_c decimal(16,2)' 
					+',#'+rtrim(@vrkey2)+'_p decimal(16,3)' 
					+',#'+rtrim(@vrkey2)+'_q decimal(16,3)' 
				else
					set @vsql6=@vsql6
					+',#'+rtrim(@vrkey2)+'_c decimal(16,2)' 
					+',#'+rtrim(@vrkey2)+'_s decimal(16,3)' 
					+',#'+rtrim(@vrkey2)+'_q decimal(16,3)' 
			else
				if @vrkey2_2=0
					set @vsql6_2=@vsql6_2
					+',#'+rtrim(@vrkey2)+'_c decimal(16,2)' 
					+',#'+rtrim(@vrkey2)+'_p decimal(16,3)' 
					+',#'+rtrim(@vrkey2)+'_q decimal(16,3)' 
				else
					set @vsql6_2=@vsql6_2
					+',#'+rtrim(@vrkey2)+'_c decimal(16,2)' 
					+',#'+rtrim(@vrkey2)+'_s decimal(16,3)' 
					+',#'+rtrim(@vrkey2)+'_q decimal(16,3)' 
			fetch next from mycursor into @vrkey2,@vrkey2_2
		end
		close mycursor
		deallocate mycursor
		set @vsql6_2=@vsql6_2+') ON [PRIMARY]'
		set @vsql6_2=@vsql6_2+' 
		select 
		#data00008.so_ptr,
		#data00008.cust_code ,cast(data0097.po_number as varchar(15)) as PO号,
		case when #data00008.COMMISION_ON_TOOLING=0 then ''内销'' 
			when #data00008.COMMISION_ON_TOOLING=1 then ''保税'' 
			else ''外销'' end as 类型,
		#data00008.customer_part_number+'' ''+isnull(#data00008.cp_rev,'''')+(case when data0050.pcode>0 then ''*'' else '''' end) as customer_part_number,
		#data00008.customer_part_desc,#data00008.CUSTOMER_matl_DESC ,
		#data00008.PARTS_PER_PANEL,
		case when isnull(PARTS_PER_SET,0)=0 THEN sets else PARTS_PER_SET end as sets,#data00008.unit_sq,
		#data00008.prod_code,
		#data00008.pnl_size,
		#data00008.SCH_DATE,#data00008.sales_order  AS 订单号,case when data0060.STATUS=1 then ''Active'' else null end as Status, #data00008.ent_date as 下单日期,cast(data0050.mat_tp as varchar(10)) as 板材,
		#data00008.manu_part_number,
		#data00008.layers,
		#data00008.ttype,
		#Data00008.parts_ordered as 订单PCS,
		data0060.qty_fg_stocked AS 入仓数,
		#Data00008.parts_needs as 欠货PCS,
		d50rkey,#data00008.d25key,'
	
		if @vfg_flag=1
			set @vsql6_2=@vsql6_2+'#Test07.qty_on_hand as 好板仓,#Test08.qty_on_hand as 叉板仓,'
	
		set @vsql6_2=@vsql6_2+' 
		#data00008.qty_backlog as 在制总PCS,
		ceiling(#data00008.qty_backlog/#data00008.PARTS_PER_PANEL) as 在制总PNL,
		round(#data00008.qty_backlog*#data00008.unit_sq,1) as 在制总面积,
		round(weight_BACKLOG,2) as 在制总重量, CAST(0 AS bit) as chose_flag,
		#ppc01.* ,#data00008.remark into #ppc02
		from #data00008_2 as #data00008 left join #ppc01 on #data00008.d25key=#ppc01.d25rkey
		left join data0060 on #data00008.so_ptr=data0060.rkey   
		left join data0097 on data0060.purchase_order_ptr=data0097.rkey  
		left join data0010 on #data00008.customer_ptr=data0010.rkey
		left join data0025 on #data00008.d25key=data0025.rkey
		left join Data0050 on Data0025.ancestor_ptr=Data0050.RKEY'
		
		if @vfg_flag=1
			set @vsql6_2=@vsql6_2+' left join #Test07 on data0050.rkey=#Test07.cust_PART_PTR
				left join #Test08 on data0050.rkey=#Test08.cust_PART_PTR'
		
		set @vsql6_2=@vsql6_2+'
		where #data00008.QTY_BACKLOG>0'

		--if @vsql1<>''	set @vsql6_2=@vsql6_2+' and ('+@vsql1+')' 
		if @vsql2<>''	set @vsql6_2=@vsql6_2+' and d08rkey in ('+@vsql2+')' 

		set @vsql6_2=@vsql6_2+' 
		order by data0050.ttype desc,data0050.pcode desc,CASE when #data00008.ttype=0 then data0010.P_CODE_DEF_PROD else data0010.P_CODE_DEF_SAMP end desc,#data00008.sch_date,#data00008.customer_part_number,
		#data00008.cp_rev,#data00008.manu_part_number,#data00008.parts_per_panel
		
		SELECT CAST (ROW_NUMBER() OVER(order by CUSTOMER_PART_NUMBER asc) AS INT) AS seq,
        CUSTOMER_PART_NUMBER  INTO     #T1
        FROM   (
           SELECT DISTINCT CUSTOMER_PART_NUMBER
           FROM   #ppc02
         )                             a
		select  seq as ''在线款序'',#ppc02.* from #ppc02 , #T1 
		where #ppc02.CUSTOMER_PART_NUMBER = #T1.CUSTOMER_PART_NUMBER 
		order by seq asc
		
		drop table #T1
		drop table #ppc01
		drop table #ppc02'
	end
	--select @vsql6+@vsql6_2 as vtt into testxxs01
	exec(@vsql6+@vsql6_2)

go
