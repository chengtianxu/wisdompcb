--create proc EP087C
declare 
  @from_date datetime,
  @to_date datetime,
  @sqlwhere varchar(300)
 select @from_date='2000-01-01 00:00:00',@to_date='2013-09-14 00:00:00',@sqlwhere='select data0017.rkey   from data0017 inner join data0496 on data0017.group_ptr=data0496.rkey  
 where data0496.rkey>=8 and data0017.INV_PART_NUMBER>=''HG.0040'' and data0017.inv_part_number<=''HG.0040'''
--with encryption
--AS
   declare @rkey17 int,@suminqty money,@sumoutqty money
          ,@line int
          ,@rkey23 int
          ,@Rkey16 int
          ,@class int
          ,@inqty money
          ,@outqty money
          ,@opdate datetime
          ,@sn varchar(30)
          ,@dept varchar(50)
          ,@stock money 
          ,@sumqty money

declare @year_str_now varchar(4),@month_str_now varchar(2),@day_str_now varchar(2),
	@year_str_get varchar(4),@month_str_get varchar(2),@day_str_get varchar(2),
	@to_date_flag bit,
	@to_date_string varchar(10),@to_date_string1 varchar(10)

set @year_str_now=rtrim(convert(varchar(4),datepart(yyyy,getdate())))
set @year_str_now=replicate('0',4-len(@year_str_now))+@year_str_now

set @month_str_now=rtrim(convert(varchar(2),datepart(mm,getdate())))
set @month_str_now=replicate('0',2-len(@month_str_now))+@month_str_now

set @day_str_now=rtrim(convert(varchar(2),datepart(dd,getdate())))
set @day_str_now=replicate('0',2-len(@day_str_now))+@day_str_now

set @year_str_get=rtrim(convert(varchar(4),datepart(yyyy,@to_date)))
set @year_str_get=replicate('0',4-len(@year_str_get))+@year_str_get
set @month_str_get=rtrim(convert(varchar(2),datepart(mm,@to_date)))
set @month_str_get=replicate('0',2-len(@month_str_get))+@month_str_get
set @day_str_get=rtrim(convert(varchar(2),datepart(dd,@to_date)))
set @day_str_get=replicate('0',2-len(@day_str_get))+@day_str_get

if  (convert(int,@year_str_get+@month_str_get+@day_str_get))>=
	(convert(int,@year_str_now+@month_str_now+@day_str_now))
	set @to_date_flag=0
else
	set @to_date_flag=1

   IF object_id('tempdb..##tempList') is not null
     DROP TABLE ##tempList
 
   create table ##tempList(d17_rkey int)--要查询的材料列表
   create table #tempList(d17_rkey int)--要查询的材料列表
   exec (' insert ##tempList(d17_rkey) '+ @sqlwhere)
   insert #tempList (d17_rkey) select d17_rkey from  ##templist
   DROP TABLE ##tempList
  --select * from #tempList
   --delete #tempList

create table #toutinlist(rkey17 int,rkey23 int,Rkey16 int,class int,inqty money,outqty money,opdate datetime,sn varchar(30),stock money,dept varchar(50)) --出入仓明细表

create table #toutinlist2(line int,rkey17 int,rkey_17 int,rkey23 int,Rkey16 int,class int,inqty money,outqty money,opdate datetime,sn varchar(30),stock money,dept varchar(50) ) --出入仓明细表

create table #temp_5(rkey17 int,rkey23 int,Rkey16 int,stock_qty money,stock_money money)		--库存


--#temp_mat_list物料的供应商和仓库

  select data0022.inventory_ptr as rkey17,data0022.supplier_ptr as rkey23,
    	isnull(Data0022.location_ptr,0) as rkey16
  into #temp_mat_list
  from data0022
  where data0022.inventory_ptr in (select d17_rkey  from #templist )
  group by data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0)


--stock当前库存
/*
注意：此处查询结存数量的条件必须是：data0022.quan_on_hand>=0，而不能用data0022.quan_on_hand>0，
因为没有结存的项目，可能有IQC数量，如果IQC合并到结存中，那么必须要结存项目有记录。
*/


insert #temp_5(rkey17 ,rkey23 ,Rkey16, stock_qty )
SELECT INVENTORY_PTR, SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
	SUM(QUAN_ON_HAND) AS stock
FROM Data0022
WHERE data0022.quan_on_hand>=0
GROUP BY  INVENTORY_PTR, SUPPLIER_PTR,isnull(Data0022.location_ptr,0)

--select * from #temp_5

--当前时刻的IQC待处理、待入库数据

insert #temp_5(rkey17 ,rkey23 ,Rkey16, stock_qty )
SELECT INVENTORY_PTR, SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
	data0022.quan_in_insp+data0022.quan_in_insp1+data0022.quan_to_be_stocked+data0022.quan_to_be_stocked1+data0022.quan_useasis AS IQC
FROM Data0022
left join data0456 on data0022.GRN_PTR=data0456.rkey
WHERE  inventory_ptr in (select d17_rkey  from #tempList )
        and (data0022.quan_in_insp>0 OR data0022.quan_in_insp1>0 
		OR data0022.quan_to_be_stocked>0 or data0022.quan_to_be_stocked1>0 or data0022.quan_useasis>0) 



--received_total  材料接收data0022

insert #toutinlist(rkey17 ,rkey23 ,Rkey16 ,class ,inqty ,outqty ,opdate,sn,dept)
SELECT data0022.inventory_ptr as rkey17,   Data0022.SUPPLIER_PTR AS rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
	1,Data0022.QUANTITY  AS received,0,ISNULL(Data0022.Stock_Date,Data0022.TDATE),data0456.GRN_NUMBER,Case When Data0022.TTYPE=5 then '盘点' Else '' End
    --SUM(Data0022.QUANTITY) AS received     xp
	--,ROUND(SUM((Data0022.QUANTITY) * (case @taxflag when 0 then Data0022.PRICE else Data0022.PRICE*(1+data0022.tax_2/100.00) end)  / Data0022.EXCHANGE_RATE),4) AS received_money
FROM Data0022 INNER JOIN 
     Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY 
     left join data0456 on data0022.GRN_PTR=data0456.rkey
WHERE Data0022.TDATE >=@from_date
	AND Data0022.TDATE < @to_date+1
     and Data0022.inventory_ptr in (select d17_rkey  from #templist )
--dept
insert #toutinlist(rkey17 ,rkey23 ,Rkey16 ,class ,inqty ,outqty ,opdate,sn,dept )
SELECT data0022.inventory_ptr as rkey17,data0022.supplier_ptr as rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
       2,0,Data0207.QUANTITY AS out_qty,data0207.TDATE,data0457.GON_NUMBER,Case When Data0207.TTYPE=5 then '盘点' Else data0034.dept_name End	
FROM Data0207 INNER JOIN  
     Data0022 ON Data0207.D0022_PTR = Data0022.RKEY 
     LEFT JOIN DATA0457 ON Data0207.GON_PTR=data0457.rkey
     left join data0034 on data0207.dept_ptr=data0034.rkey
WHERE Data0207.TDATE >=@from_date
	AND Data0207.TDATE < @to_date+1
     and Data0022.inventory_ptr in (select d17_rkey  from #templist )
--材料退货
insert #toutinlist(rkey17 ,rkey23 ,Rkey16 ,class ,inqty ,outqty ,opdate,sn,dept  )
SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
     3,0,Data0096.QUAN_REJD  AS quan_returen,data0096.TDATE,data0022.BARCODE_ID,''
     FROM Data0096 INNER JOIN
   Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY
WHERE Data0096.TDATE >=@from_date
AND Data0096.TDATE < @to_date+1
	and (data0096.flag='2' or data0096.flag='9')
    and (((data0096.TRAN_TP=8 or data0096.TRAN_TP=38 or isnull(data0096.TRAN_TP,0)=0) and data0096.tstatus<>2) or data0096.tstatus=1 or data0096.tstatus=3 or data0096.invoice_ptr>0)
    and Data0022.inventory_ptr in (select d17_rkey  from #templist )

--材料报废
insert #toutinlist(rkey17 ,rkey23 ,Rkey16 ,class ,inqty ,outqty ,opdate,sn,dept)
SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
	 4,0,Data0096.QUAN_REJD AS quan_scrap,data0096.TDATE,data0022.BARCODE_ID,''  
     --SUM(Data0096.QUAN_REJD) AS quan_scrap 
	--,ROUND(SUM(Data0096.QUAN_REJD * (case @taxflag when 0 then Data0022.PRICE else Data0022.PRICE*(1+data0022.tax_2/100.00) end) / Data0022.EXCHANGE_RATE),4) AS amount_csrap
FROM Data0096 INNER JOIN
     Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY
WHERE Data0096.TDATE >=@from_date
	AND Data0096.TDATE < @to_date+1
	and data0096.flag='1'
    and data0096.tstatus<>2
    and Data0022.inventory_ptr in (select d17_rkey  from #templist )

--select * from #temp_4
if @to_date_flag<>0
begin
     create table #temp_1(rkey17 int,rkey23 int,Rkey16 int,received_qty money)	--接收 
     create table #temp_2(rkey17 int,rkey23 int,Rkey16 int,out_qty money)			--发出
     create table #temp_3(rkey17 int,rkey23 int,Rkey16 int,return_qty money)		--退回
     create table #temp_4(rkey17 int,rkey23 int,Rkey16 int,scrap_qty money)		--报废
     create table #temp_5_1(rkey17 int,rkey23 int,Rkey16 int,stock_qty money)		--库存1（倒推用）

    --第一次汇总取得期初库存
    --received_total  材料接收data0022

	insert #temp_1(rkey17 ,rkey23 ,Rkey16,received_qty )
	SELECT data0022.inventory_ptr as rkey17,Data0022.SUPPLIER_PTR AS rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
		SUM(Data0022.QUANTITY) AS received 
	FROM Data0022 INNER JOIN 
		Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY 
	WHERE Data0022.TDATE >=@to_date+1
		AND Data0022.TDATE < getdate()+1
		
	GROUP BY ALL data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0)

    --select * from #temp_1
    
    --received_extend_total 材料发放data0207

  	insert #temp_2(rkey17 ,rkey23 ,Rkey16, out_qty )
  	SELECT data0022.inventory_ptr as rkey17, data0022.supplier_ptr as rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
		SUM(Data0207.QUANTITY) AS out_qty 
  	FROM Data0207 INNER JOIN  Data0022 ON Data0207.D0022_PTR = Data0022.RKEY 
  	WHERE Data0207.TDATE >=@to_date+1
		AND Data0207.TDATE < getdate()+1
  	GROUP BY ALL data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0)

    --select * from #temp_2
    
    --invt_returen   材料退货 data0096

  	insert #temp_3(rkey17 ,rkey23 ,Rkey16,return_qty )
  	SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
           SUM(Data0096.QUAN_REJD) AS quan_returen 
  	FROM Data0096 INNER JOIN
         Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY
  	WHERE Data0096.TDATE >=@to_date+1
		AND Data0096.TDATE < getdate()+1
		and (data0096.flag='2' or data0096.flag='9')
        and (((data0096.TRAN_TP=8 or data0096.TRAN_TP=38) and data0096.tstatus<>2) or data0096.tstatus=1 or data0096.tstatus=3)
  	GROUP BY Data0096.INVT_PTR,SUPPLIER_PTR,isnull(Data0022.location_ptr,0)

    --select * from #temp_3
    
    --invt_scrap      材料报废data0096

  	insert #temp_4(rkey17 ,rkey23 ,Rkey16, scrap_qty )
  	SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
		SUM(Data0096.QUAN_REJD) AS quan_scrap 
  	FROM Data0096 INNER JOIN
         Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY
  	WHERE Data0096.TDATE >=@to_date+1
		AND Data0096.TDATE < getdate()+1
		and data0096.flag='1'
        and data0096.tstatus<>2
  	GROUP BY Data0096.INVT_PTR,SUPPLIER_PTR,isnull(Data0022.location_ptr,0)

    --select * from #temp_4
    
    --received_extend_stock_total      第1次汇总进出存
    insert #temp_5_1(rkey17,stock_qty)
    SELECT	t0.rkey17, --t0.rkey23,t0.Rkey16, 
		isnull(#temp_5.stock_qty,0)+isnull(#temp_2.out_qty,0)+isnull(#temp_3.return_qty,0)+isnull(#temp_4.scrap_qty,0)-isnull(#temp_1.received_qty,0) as begstock
		--isnull(#temp_5.stock_money,0)+isnull(#temp_2.out_money,0)+isnull(#temp_3.return_money,0)+isnull(#temp_4.scrap_money,0)+isnull(#temp_6.iqc_money,0)-isnull(#temp_1.received_money,0) as begstock_money
    FROM #temp_mat_list t0 
		left join #temp_1 on t0.rkey17=#temp_1.rkey17
			and t0.rkey23=#temp_1.rkey23 
			and t0.Rkey16=#temp_1.rkey16 
		left join #temp_2 on t0.rkey17=#temp_2.rkey17 
			and t0.rkey23=#temp_2.rkey23 
			and t0.rkey16=#temp_2.rkey16 
		left join #temp_3 on t0.rkey17=#temp_3.rkey17 
			and t0.rkey23=#temp_3.rkey23 
			and t0.rkey16=#temp_3.rkey16 
		left join #temp_4 on t0.rkey17=#temp_4.rkey17 
			and t0.rkey23=#temp_4.rkey23 
			and t0.rkey16=#temp_4.rkey16 
		left join #temp_5 on t0.rkey17=#temp_5.rkey17 
			and t0.rkey23=#temp_5.rkey23
			and t0.rkey16=#temp_5.rkey16
    where stock_qty is not null 
		or received_qty is not null 
		or out_qty is not null 
		or return_qty is not null 
		or scrap_qty is not null
    order by t0.rkey17
    
    delete #temp_1
    delete #temp_2
    delete #temp_3
    delete #temp_4
    delete #temp_5


 
	delete #temp_5
	insert #temp_5(rkey17 ,rkey23 ,rkey16, stock_qty )
	select rkey17 ,rkey23,rkey16,stock_qty
	from #temp_5_1
	delete #temp_5_1

end


 declare rst cursor LOCAL FAST_FORWARD
 for 
    select rkey17, sum(inqty),sum(outqty) from #toutinlist  group by rkey17 
 open rst
 fetch rst  into @rkey17,@suminqty,@sumoutqty
 while  @@fetch_status=0
 begin
   set @line=1
   --累计结存
   --select @stock= stock from  #toutinlist where rkey17=@rkey17 and class=0
   select @stock= sum(isnull(stock_qty,0)) from  #temp_5 where rkey17=@rkey17 
 
   insert #toutinlist2(line,rkey17,class,inqty,outqty,stock) values (@line,@rkey17,8,@suminqty,@sumoutqty,@stock)
   
  
   set @sumqty=0 
   --set @stock=0
   declare rst2 cursor LOCAL FAST_FORWARD
   for  
      select rkey23 ,Rkey16 ,class ,inqty ,outqty ,opdate ,sn,dept  from #toutinlist where rkey17=@rkey17 and class<>0 order by opdate desc ,class desc 
   open rst2
   fetch rst2  into @rkey23 ,@Rkey16 ,@class ,@inqty ,@outqty ,@opdate ,@sn,@dept 
   while  @@fetch_status=0
   begin
       set @line=@line+1
       set @stock=@stock-@sumqty
       insert #toutinlist2(line,rkey17 ,rkey23 ,Rkey16 ,class ,inqty ,outqty ,opdate ,sn,stock,dept )
              values (@line,@rkey17,@rkey23,@Rkey16,@class,@inqty,@outqty,@opdate,@sn,@stock,@dept)

       set @sumqty= @inqty-@outqty
     
       fetch rst2  into @rkey23 ,@Rkey16 ,@class ,@inqty ,@outqty ,@opdate ,@sn,@dept 

   end
   close rst2
   deallocate rst2
      --期初结存
   --select @stock= stock from  #toutinlist where rkey17=@rkey17 and class=0
   insert #toutinlist2(line,rkey17,rkey_17,class,stock) values (@line+1,@rkey17,@rkey17,7,@stock-@sumqty)

   fetch rst  into @rkey17,@suminqty,@sumoutqty
 end
 close rst
 deallocate rst
 
 update #toutinlist2 set inqty=null where inqty=0
 update #toutinlist2 set outqty=null where outqty=0


 
select t0.class ,t0.line,t0.inqty ,t0.outqty ,t0.opdate ,t0.sn,t0.dept,t0.stock
       ,data0017.inv_part_number,data0016.LOCATION,data0023.ABBR_NAME
       ,Data0017.INV_PART_DESCRIPTION+Data0017.INV_DESCRIPTION as SPEC
       ,data0002.unit_code
from #toutinlist2 t0
     left join data0017 on t0.rkey_17=data0017.rkey 
	 left join data0002 on data0017.stock_unit_ptr=data0002.rkey 
	--left join data0496 on data0017.group_ptr=data0496.rkey 
	--left join data0019 on data0496.group_ptr=data0019.rkey 
	left join data0016 on t0.rkey16=data0016.rkey
	left join data0023 on t0.rkey23=data0023.rkey
order by t0.rkey17,t0.line desc 

delete #tempList
delete #toutinlist
delete #toutinlist2
delete #temp_5

GO


SELECT * FROM DATA0093 WHERE INVENTORY_PTR=3716 AND PHY_LIST_PTR IN
(
SELECT RKEY FROM DATA0092 WHERE TDATE BETWEEN '2013-9-1' AND '2013-9-2'
)

SELECT quan_send,quan_transferin,* FROM DATA0022 WHERE INVENTORY_PTR=3716