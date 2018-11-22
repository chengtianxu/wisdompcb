
--ep087综合明细查询
--exec ep087A;1 '2013-12-01 00:00:00','2013-12-31 23:59:59',0,0,0,0,1

--create proc EP087A;1 
declare
  @from_date datetime='2013-12-01',
  @to_date datetime='2013-12-31 23:59:59',
  @whouse_ptr int=0,	--工厂指针
  @loc_ptr int=0,		--仓库指针
  @taxflag int=0,		--0:金额不含税，1:金额含税。
  @dispflag int=0,		--0:退货单列显示，1:退货反冲到接收中。
  @dispflag1 int=1		--0:期末IQC单列显示，1:期末ＩＱＣ合并到结存中。

--AS  --exec EP087A '2000-01-01','2010-01-01',0,0,1,1
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp')) 
drop table  #temp
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_1')) 
drop table #temp_1
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_11')) 
drop table  #temp_11
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_2')) 
drop table  #temp_2
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_21')) 
drop table #temp_21
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_3')) 
drop table #temp_3
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_4')) 
drop table #temp_4
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_5')) 
drop table #temp_5
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_5_1')) 
drop table #temp_5_1
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_6')) 
drop table #temp_6
If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#temp_mat_list')) 
drop table #temp_mat_list

 
declare @curdatetime nvarchar(20),@fromdatetime nvarchar(20),@todatetime nvarchar(20),
    @year_str_now varchar(4),@month_str_now varchar(2),@day_str_now varchar(2),
    @year_str_from varchar(4),@month_str_from varchar(2),@day_str_from varchar(2),
	@year_str_get varchar(4),@month_str_get varchar(2),@day_str_get varchar(2),
	@to_date_flag bit,
	@to_date_string varchar(10),@to_date_string1 varchar(10)
	
	--获取开始时间from_date，结束时间to_date和现在这天最好时间curdatetime

set @year_str_now=rtrim(convert(varchar(4),datepart(yyyy,getdate())))
set @year_str_now=replicate('0',4-len(@year_str_now))+@year_str_now

set @month_str_now=rtrim(convert(varchar(2),datepart(mm,getdate())))
set @month_str_now=replicate('0',2-len(@month_str_now))+@month_str_now

set @day_str_now=rtrim(convert(varchar(2),datepart(dd,getdate())))
set @day_str_now=replicate('0',2-len(@day_str_now))+@day_str_now
set @curdatetime=@year_str_now+'-'+@month_str_now+'-'+@day_str_now+' 23:59:59'

set @year_str_from=rtrim(convert(varchar(4),datepart(yyyy,@from_date)))
set @year_str_from=replicate('0',4-len(@year_str_from))+@year_str_from

set @month_str_from=rtrim(convert(varchar(2),datepart(mm,@from_date)))
set @month_str_from=replicate('0',2-len(@month_str_from))+@month_str_from

set @day_str_from=rtrim(convert(varchar(2),datepart(dd,@from_date)))
set @day_str_from=replicate('0',2-len(@day_str_from))+@day_str_from
--set @fromdatetime=@year_str_from+'-'+@month_str_from+'-'+@day_str_from+' 00:00:00'
set @fromdatetime=convert(nvarchar(20),@from_date,120)
set @year_str_get=rtrim(convert(varchar(4),datepart(yyyy,@to_date)))
set @year_str_get=replicate('0',4-len(@year_str_get))+@year_str_get

set @month_str_get=rtrim(convert(varchar(2),datepart(mm,@to_date)))
set @month_str_get=replicate('0',2-len(@month_str_get))+@month_str_get

set @day_str_get=rtrim(convert(varchar(2),datepart(dd,@to_date)))
set @day_str_get=replicate('0',2-len(@day_str_get))+@day_str_get
--set @todatetime=@year_str_get+'-'+@month_str_get+'-'+@day_str_get+' 23:59:59'
set @todatetime=convert(nvarchar(20),@to_date,120)
--查开始时间from_date，结束时间to_date和现在curdatetime
--SELECT @from_date,@to_date,@curdatetime


--查询日期大于当前日期
--if  (convert(int,@year_str_get+@month_str_get+@day_str_get))>=
--	(convert(int,@year_str_now+@month_str_now+@day_str_now))
if @todatetime>=@curdatetime --比较结时间和现在这天最后时间
	set @to_date_flag=0
else
	set @to_date_flag=1

create table #temp  (d17_rkey int,d23_rkey int,rkey16 int,d22_rkey int)							--22批次
create table #temp_1(rkey17 int,rkey23 int,Rkey16 int,received_qty money,received_money money,CoinPtr int)	--接收
create table #temp_11(rkey17 int,rkey23 int,Rkey16 int,tranin_qty money,tranin_money money,CoinPtr int)	--转入
create table #temp_2(rkey17 int,rkey23 int,Rkey16 int,out_qty money,out_money money,CoinPtr int )			--发出
create table #temp_21(rkey17 int,rkey23 int,Rkey16 int,tranout_qty money,tranout_money money,CoinPtr int )	--转出
create table #temp_3(rkey17 int,rkey23 int,Rkey16 int,return_qty money,return_money money,CoinPtr int)		--退回
create table #temp_4(rkey17 int,rkey23 int,Rkey16 int,scrap_qty money,scrap_money money,CoinPtr int)		--报废
create table #temp_5(rkey17 int,rkey23 int,Rkey16 int,stock_qty money,stock_money money,CoinPtr int)		--当前库存
create table #temp_5_1(rkey17 int,rkey23 int,Rkey16 int,stock_qty money,stock_money money,CoinPtr int)		--库存1（倒推用）
create table #temp_6(rkey17 int,rkey23 int,Rkey16 int,IQC_qty money,IQC_money money,CoinPtr int)			--IQC（待处理、待入库）

--查询期间所有发生业务的材料清单
--料号、客户号、仓库、货币一样只有一条记录

select data0022.inventory_ptr as rkey17,data0022.supplier_ptr as rkey23,
	isnull(Data0022.location_ptr,0) as rkey16,CURRENCY_PTR as CoinPtr
into #temp_mat_list
from data0022
where data0022.tdate<=@to_date
group by data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0),CURRENCY_PTR

--select * from #temp_mat_list

--stock当前库存
/*
注意：查询当前结存数量，条件必须是：data0022.quan_on_hand>=0，而不能用data0022.quan_on_hand>0，
因为没有结存的项目，可能有IQC数量，如果IQC合并到结存中，那么必须要结存项目有记录。
*/
insert #temp_5(rkey17 ,rkey23 ,Rkey16, stock_qty ,stock_money,CoinPtr)
SELECT INVENTORY_PTR, SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
	SUM(QUAN_ON_HAND) AS stock, 
	ROUND(SUM(QUAN_ON_HAND * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end) 
	--要查一下，之前没有TAX_PRICE，如果最新更新有可能这边会出错??? 
	--SELECT tdate,EXCHANGE_RATE,TAX_2,tax_price,price,tax_price FROM data0022 ORDER BY rkey desc
	--22表这四个指针都要有值key17 ,rkey23 ,Rkey16，CoinPtr
             / EXCHANGE_RATE), 4) AS amount,
    Data0022.CURRENCY_PTR
FROM Data0022
WHERE data0022.quan_on_hand>=0 AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
	and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
GROUP BY  INVENTORY_PTR, SUPPLIER_PTR,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR
--select * from #temp_5

--如果查询日期小于当前日期
if @to_date_flag<>0
begin
   
  --汇总查询结束日期到当前日期IQC待处理、待入库数据
    insert #temp_6(rkey17, rkey23 ,Rkey16, IQC_qty ,IQC_money,CoinPtr)
    SELECT INVENTORY_PTR, SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
	SUM(data0022.quan_in_insp+data0022.quan_in_insp1+data0022.quan_to_be_stocked+data0022.quan_to_be_stocked1+data0022.quan_useasis) AS IQC, 
	ROUND(SUM((data0022.quan_in_insp+data0022.quan_in_insp1+data0022.quan_to_be_stocked+data0022.quan_to_be_stocked1+data0022.quan_useasis) 
	* (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end) 
         / EXCHANGE_RATE), 4) AS amount,Data0022.CURRENCY_PTR
    FROM Data0022
    WHERE (data0022.quan_in_insp>0 OR data0022.quan_in_insp1>0 
		OR data0022.quan_to_be_stocked>0 or data0022.quan_to_be_stocked1>0 or data0022.quan_useasis>0)
		and Data0022.TDATE >cast(@todatetime as datetime)
	and Data0022.TDATE <=cast(@curdatetime as datetime) 
	AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
	and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
    GROUP BY INVENTORY_PTR,SUPPLIER_PTR,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

    --汇总查询结束日期到当前日期，
    --received_total  材料接收data0022

	insert #temp_1(rkey17 ,rkey23 ,Rkey16,received_qty ,received_money,CoinPtr)
	SELECT data0022.inventory_ptr as rkey17,Data0022.SUPPLIER_PTR AS rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
		SUM(Data0022.QUANTITY-isnull(data0022.quan_send,0)) AS received, --quan_send转出数量
		ROUND(SUM((Data0022.QUANTITY-isnull(data0022.quan_send,0)) * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end) 
                                      / Data0022.EXCHANGE_RATE),4) AS received_money,
        Data0022.CURRENCY_PTR
	FROM Data0022 
    INNER JOIN Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY 
	WHERE Data0022.TDATE >cast(@todatetime as datetime)
		and Data0022.TDATE <=cast(@curdatetime as datetime)
		AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
		and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
        and isnull(Data0022.QUANTITY,0)>0  --????
	GROUP BY data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR
    --材料转入
    insert #temp_11(rkey17 ,rkey23 ,Rkey16,tranin_qty ,tranin_money,CoinPtr)
	SELECT data0022.inventory_ptr as rkey17,Data0022.SUPPLIER_PTR AS rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
		SUM(isnull(Data0027.QUANTITY,0)) AS received, 
		ROUND(SUM((isnull(Data0027.QUANTITY,0)) * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end) 
                                      / Data0022.EXCHANGE_RATE),4) AS received_money,
        Data0022.CURRENCY_PTR
	FROM data0027 
    INNER JOIN  Data0022 ON data0027.TO_D0022_PTR = Data0022.RKEY and isnull(data0022.quan_transferin,0)>0
  	and data0027.TDATE >cast(@todatetime as datetime)
		AND data0027.TDATE <=cast(@curdatetime as datetime)
		AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
		and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
        and isnull(Data0022.QUANTITY,0)>=0--???
	GROUP by data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

    --select * from #temp_1
    
    --received_extend_total 材料发放data0207

  	insert #temp_2(rkey17 ,rkey23 ,Rkey16, out_qty ,out_money,CoinPtr)
  	SELECT data0022.inventory_ptr as rkey17, data0022.supplier_ptr as rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
		SUM(Data0207.QUANTITY) AS out_qty, 
		ROUND(SUM(Data0207.QUANTITY * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end)  
                      / Data0022.EXCHANGE_RATE),4) AS out_money,
        Data0022.CURRENCY_PTR
  	FROM Data0207 
    INNER JOIN  Data0022 ON Data0207.D0022_PTR = Data0022.RKEY 
  	WHERE Data0207.TDATE >cast(@todatetime as datetime)
		AND Data0207.TDATE <=cast(@curdatetime as datetime)
		AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
		and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
  	GROUP BY ALL data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

    --材料转出
    insert #temp_21(rkey17 ,rkey23 ,Rkey16, tranout_qty ,tranout_money,CoinPtr)
  	SELECT data0022.inventory_ptr as rkey17, data0022.supplier_ptr as rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
		SUM(0-Data0027.QUANTITY) AS out_qty, 
		ROUND(SUM((0-Data0027.QUANTITY) * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end)  
                      / Data0022.EXCHANGE_RATE),4) AS out_money,
        Data0022.CURRENCY_PTR
  	FROM data0027 
    INNER JOIN  Data0022 ON data0027.D0022_PTR = Data0022.RKEY and isnull(data0022.quan_send,0)<0
  	WHERE data0027.TDATE >cast(@todatetime as datetime)
		AND data0027.TDATE <=cast(@curdatetime as datetime)
		AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
		and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
  	GROUP BY data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

       
    --invt_returen   材料退货 data0096

  	insert #temp_3(rkey17 ,rkey23 ,Rkey16,return_qty ,return_money,CoinPtr)
  	SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
           SUM(Data0096.QUAN_REJD) AS quan_returen, 
           ROUND(SUM(Data0096.QUAN_REJD * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end) 
       / Data0022.EXCHANGE_RATE),4) AS amount_returen,Data0022.CURRENCY_PTR
  	FROM Data0096 
    INNER JOIN Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY
  	WHERE Data0096.TDATE >cast(@todatetime as datetime)
		AND Data0096.TDATE <=cast(@curdatetime as datetime)
		AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
		and (data0096.flag='2' or data0096.flag='9') --'1'代表拒收'2'代表退回供应商
		and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
        and (((data0096.TRAN_TP=8 or data0096.TRAN_TP=38 or isnull(data0096.TRAN_TP,0)=0) and data0096.tstatus<>2) or data0096.tstatus=1 or data0096.tstatus=3)
  	GROUP BY Data0096.INVT_PTR,SUPPLIER_PTR,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

    --select * from #temp_3
    
    --invt_scrap      材料报废data0096

  	insert #temp_4(rkey17 ,rkey23 ,Rkey16, scrap_qty ,scrap_money,CoinPtr)
  	SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
		SUM(Data0096.QUAN_REJD) AS quan_scrap, 
		ROUND(SUM(Data0096.QUAN_REJD * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end)  
         / Data0022.EXCHANGE_RATE),4) AS amount_csrap,Data0022.CURRENCY_PTR
  	FROM Data0096 
    INNER JOIN Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY
  	WHERE Data0096.TDATE >cast(@todatetime as datetime)
		AND Data0096.TDATE <=cast(@curdatetime as datetime)
		AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
		and data0096.flag='1'
        and data0096.tstatus<>2
		and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
  	GROUP BY Data0096.INVT_PTR,SUPPLIER_PTR,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

    --select * from #temp_4
    
    --received_extend_stock_total      第1次汇总进出存
    insert #temp_5_1(rkey17,rkey23,Rkey16,stock_qty,stock_money,CoinPtr)
    SELECT	t0.rkey17,t0.rkey23,t0.Rkey16, 
		isnull(#temp_5.stock_qty,0)+isnull(#temp_2.out_qty,0)-isnull(#temp_21.tranout_qty,0)+isnull(#temp_3.return_qty,0)+isnull(#temp_4.scrap_qty,0)
        +isnull(#temp_6.iqc_qty,0)-isnull(#temp_1.received_qty,0)-isnull(#temp_11.tranin_qty,0) as begstock,//????
		isnull(#temp_5.stock_money,0)+isnull(#temp_2.out_money,0)-isnull(#temp_21.tranout_money,0)+isnull(#temp_3.return_money,0)+isnull(#temp_4.scrap_money,0)
        +isnull(#temp_6.iqc_money,0)-isnull(#temp_1.received_money,0)-isnull(#temp_11.tranin_money,0) as begstock_money,t0.CoinPtr
    FROM #temp_mat_list t0 
		left join #temp_1 on t0.rkey17=#temp_1.rkey17 and t0.rkey23=#temp_1.rkey23 and t0.Rkey16=#temp_1.rkey16 and t0.CoinPtr=#temp_1.CoinPtr
		left join #temp_11 on t0.rkey17=#temp_11.rkey17 and t0.rkey23=#temp_11.rkey23 and t0.Rkey16=#temp_11.rkey16 and t0.CoinPtr=#temp_11.CoinPtr
	    left join #temp_2 on t0.rkey17=#temp_2.rkey17 and t0.rkey23=#temp_2.rkey23 and t0.rkey16=#temp_2.rkey16 and t0.CoinPtr=#temp_2.CoinPtr
	    left join #temp_21 on t0.rkey17=#temp_21.rkey17 and t0.rkey23=#temp_21.rkey23 and t0.rkey16=#temp_21.rkey16 and t0.CoinPtr=#temp_21.CoinPtr
	  	left join #temp_3 on t0.rkey17=#temp_3.rkey17 and t0.rkey23=#temp_3.rkey23 and t0.rkey16=#temp_3.rkey16 and t0.CoinPtr=#temp_3.CoinPtr
		left join #temp_4 on t0.rkey17=#temp_4.rkey17 and t0.rkey23=#temp_4.rkey23 and t0.rkey16=#temp_4.rkey16 and t0.CoinPtr=#temp_4.CoinPtr
		left join #temp_5 on t0.rkey17=#temp_5.rkey17 and t0.rkey23=#temp_5.rkey23 and t0.rkey16=#temp_5.rkey16 and t0.CoinPtr=#temp_5.CoinPtr
		left join #temp_6 on t0.rkey17=#temp_6.rkey17 and t0.rkey23=#temp_6.rkey23 and t0.rkey16=#temp_6.rkey16 and t0.CoinPtr=#temp_6.CoinPtr
        
    where stock_qty is not null 
		or received_qty is not null 
		or out_qty is not null 
		or return_qty is not null 
		or scrap_qty is not null
		or iqc_qty is not null
    order by t0.rkey17
    
    delete #temp_1
    delete #temp_11
    delete #temp_2
    delete #temp_21
    delete #temp_3
    delete #temp_4
    delete #temp_6
    
    --如果查询日期小于当前日期，查询出当前库存

	delete #temp_5
	insert #temp_5(rkey17,rkey23,Rkey16,stock_qty ,stock_money,CoinPtr)
	select rkey17,rkey23,Rkey16,stock_qty,stock_money,CoinPtr
	from #temp_5_1
    delete #temp_5_1

end
 --汇总查询IQC待处理、待入库数据
    insert #temp_6(rkey17, rkey23 ,Rkey16, IQC_qty ,IQC_money,CoinPtr)
    SELECT INVENTORY_PTR, SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
	SUM(data0022.quan_in_insp+data0022.quan_in_insp1+data0022.quan_to_be_stocked+data0022.quan_to_be_stocked1+data0022.quan_useasis) AS IQC, 
	ROUND(SUM((data0022.quan_in_insp+data0022.quan_in_insp1+data0022.quan_to_be_stocked+data0022.quan_to_be_stocked1+data0022.quan_useasis) 
	* (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end) 
         / EXCHANGE_RATE), 4) AS amount,Data0022.CURRENCY_PTR
    FROM Data0022
    WHERE (data0022.quan_in_insp>0 OR data0022.quan_in_insp1>0 
		OR data0022.quan_to_be_stocked>0 or data0022.quan_to_be_stocked1>0 or data0022.quan_useasis>0)
	--	and Data0022.TDATE >=@fromdatetime
	AND Data0022.TDATE <=cast(@todatetime as datetime) 
	AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
	and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
    GROUP BY INVENTORY_PTR, SUPPLIER_PTR,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR
    
--received_total  材料接收data0022

insert #temp_1(rkey17 ,rkey23 ,Rkey16,received_qty ,received_money,CoinPtr)
SELECT data0022.inventory_ptr as rkey17,   Data0022.SUPPLIER_PTR AS rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
	SUM(Data0022.QUANTITY-isnull(data0022.quan_send,0)) AS received, 
	ROUND(SUM((Data0022.QUANTITY-isnull(data0022.quan_send,0)) * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end)  
        / Data0022.EXCHANGE_RATE),4) AS received_money,Data0022.CURRENCY_PTR
FROM Data0022 
INNER JOIN Data0023 ON Data0022.SUPPLIER_PTR = Data0023.RKEY 
WHERE Data0022.TDATE >=cast(@fromdatetime as datetime)
	AND Data0022.TDATE <=cast(@todatetime as datetime)
	AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
	and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
GROUP BY ALL Data0022.inventory_ptr,Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR
--材料转入
insert #temp_11(rkey17 ,rkey23 ,Rkey16,tranin_qty ,tranin_money,CoinPtr)
SELECT data0022.inventory_ptr as rkey17,Data0022.SUPPLIER_PTR AS rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
	SUM(isnull(Data0027.QUANTITY,0)) AS received, 
	ROUND(SUM((isnull(Data0027.QUANTITY,0)) * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end)  
        / Data0022.EXCHANGE_RATE),4) AS received_money,Data0022.CURRENCY_PTR
FROM data0027 
    INNER JOIN  Data0022 ON data0027.TO_D0022_PTR = Data0022.RKEY and isnull(data0022.quan_transferin,0)>0
  	and data0027.TDATE >cast(@fromdatetime as datetime)
	AND data0027.TDATE <=cast(@todatetime as datetime) 
	AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
	and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
GROUP BY Data0022.inventory_ptr,Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

--received_extend_total 材料发放data0207

insert #temp_2(rkey17 ,rkey23 ,Rkey16,out_qty ,out_money,CoinPtr)
SELECT data0022.inventory_ptr as rkey17,data0022.supplier_ptr as rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
	SUM(Data0207.QUANTITY) AS out_qty,
	ROUND(SUM(Data0207.QUANTITY * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end) 
      / Data0022.EXCHANGE_RATE),4) AS out_money,Data0022.CURRENCY_PTR
FROM Data0207 
INNER JOIN Data0022 ON Data0207.D0022_PTR = Data0022.RKEY 
WHERE Data0207.TDATE >=cast(@fromdatetime as datetime)
	AND Data0207.TDATE <=cast(@todatetime as datetime)
	AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
	and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
GROUP BY ALL Data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

--材料转出
insert #temp_21(rkey17 ,rkey23 ,Rkey16,tranout_qty ,tranout_money,CoinPtr)
SELECT data0022.inventory_ptr as rkey17,data0022.supplier_ptr as rkey23,isnull(Data0022.location_ptr,0) as location_ptr,
	SUM(0-Data0027.QUANTITY) AS out_qty,
	ROUND(SUM((0-Data0027.QUANTITY) * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end) 
      / Data0022.EXCHANGE_RATE),4) AS out_money,Data0022.CURRENCY_PTR
FROM Data0027 
INNER JOIN Data0022 ON Data0027.D0022_PTR = Data0022.RKEY and isnull(Data0022.quan_send,0)<0
WHERE Data0027.TDATE >=cast(@fromdatetime as datetime)
	AND Data0027.TDATE <=cast(@todatetime as datetime)
	AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
	and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
GROUP BY  Data0022.inventory_ptr,data0022.supplier_ptr,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

--invt_returen   材料退货 data0096

insert #temp_3(rkey17 ,rkey23 ,rkey16,return_qty ,return_money,CoinPtr)
SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
     SUM(Data0096.QUAN_REJD) AS quan_returen, 
     ROUND(SUM(Data0096.QUAN_REJD * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end) 
     / Data0022.EXCHANGE_RATE),4) AS amount_returen,Data0022.CURRENCY_PTR
FROM Data0096 
INNER JOIN Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY
WHERE Data0096.TDATE >=cast(@fromdatetime as datetime)
AND Data0096.TDATE <=cast(@todatetime as datetime)
	AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
	and (data0096.flag='2' or data0096.flag='9')
and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
and (((data0096.TRAN_TP=8 or data0096.TRAN_TP=38 or isnull(data0096.TRAN_TP,0)=0) and data0096.tstatus<>2) or data0096.tstatus=1 or data0096.tstatus=3)
GROUP BY Data0096.INVT_PTR,Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR

--select * from #temp_3

--invt_scrap      材料报废data0096

insert #temp_4(rkey17 ,rkey23 ,rkey16, scrap_qty ,scrap_money,CoinPtr)
SELECT Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0) as location_ptr,
	SUM(Data0096.QUAN_REJD) AS quan_scrap, 
	ROUND(SUM(Data0096.QUAN_REJD * (case @taxflag when 0 then Data0022.PRICE else Data0022.Tax_price end)
     / Data0022.EXCHANGE_RATE),4) AS amount_csrap,Data0022.CURRENCY_PTR
FROM Data0096 INNER JOIN
     Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY
WHERE Data0096.TDATE >=cast(@fromdatetime as datetime)
	AND Data0096.TDATE <=cast(@todatetime as datetime)
	AND (Data0022.WHOUSE_PTR = @whouse_ptr or @whouse_ptr=0)
	and data0096.flag='1'
    and data0096.tstatus<>2
	and (Data0022.location_ptr=@loc_ptr or @loc_ptr=0)
GROUP BY Data0096.INVT_PTR, Data0022.SUPPLIER_PTR,isnull(Data0022.location_ptr,0),Data0022.CURRENCY_PTR


--退货反冲到接收中
if @dispflag=1 
begin
	update #temp_1
     set #temp_1.received_qty=isnull(#temp_1.received_qty,0)-isnull(#temp_3.return_qty,0),
		#temp_1.received_money=isnull(#temp_1.received_money,0)-isnull(#temp_3.return_money,0)
	FROM #temp_mat_list t0 
   left join #temp_1 on t0.rkey17=#temp_1.rkey17 and t0.rkey23=#temp_1.rkey23 and t0.Rkey16=#temp_1.rkey16 and t0.CoinPtr=#temp_1.CoinPtr
   left join #temp_3 on t0.rkey17=#temp_3.rkey17 and t0.rkey23=#temp_3.rkey23 and t0.Rkey16=#temp_3.Rkey16 and t0.CoinPtr=#temp_3.CoinPtr
	update #temp_3
    set #temp_3.return_qty=0,
		#temp_3.return_money=0
	FROM #temp_mat_list t0 
    left join #temp_1 on t0.rkey17=#temp_1.rkey17 and t0.rkey23=#temp_1.rkey23 and t0.Rkey16=#temp_1.rkey16 and t0.CoinPtr=#temp_1.CoinPtr
    left join #temp_3 on t0.rkey17=#temp_3.rkey17 and t0.rkey23=#temp_3.rkey23 and t0.Rkey16=#temp_3.Rkey16 and t0.CoinPtr=#temp_3.CoinPtr
end

--期末IQC合并到期末结存中
if @dispflag1=1 
begin
	--终止日期为当天的才把IQC数量增加到结存中。
--	if @to_date_flag=0
--	begin
		update #temp_5
         set #temp_5.stock_qty=isnull(#temp_5.stock_qty,0)+isnull(#temp_6.iqc_qty,0),
			#temp_5.stock_money=isnull(#temp_5.stock_money,0)+isnull(#temp_6.iqc_money,0)
		FROM #temp_mat_list t0 
	    left join #temp_5 on t0.rkey17=#temp_5.rkey17 and t0.rkey23=#temp_5.rkey23 and t0.Rkey16=#temp_5.rkey16  and t0.CoinPtr=#temp_5.CoinPtr
	    left join #temp_6 on t0.rkey17=#temp_6.rkey17 and t0.rkey23=#temp_6.rkey23 and t0.Rkey16=#temp_6.Rkey16  and t0.CoinPtr=#temp_6.CoinPtr
--	end

	update #temp_6 
     set #temp_6.iqc_qty=0,
		#temp_6.iqc_money=0
	FROM #temp_mat_list t0 
    left join #temp_5 on t0.rkey17=#temp_5.rkey17 and t0.rkey23=#temp_5.rkey23 and t0.Rkey16=#temp_5.rkey16  and t0.CoinPtr=#temp_5.CoinPtr
	left join #temp_6 on t0.rkey17=#temp_6.rkey17 and t0.rkey23=#temp_6.rkey23 and t0.Rkey16=#temp_6.Rkey16  and t0.CoinPtr=#temp_6.CoinPtr


end

--received_extend_stock_total      汇总进出存
SELECT #temp_1.rkey17, data0016.location,data0016.code,data0496.GROUP_NAME,data0496.group_desc,
	data0019.inv_group_name,data0019.inv_group_desc,Data0017.ANALYSIS_CODE1,Data0017.ANALYSIS_CODE2,Data0017.ANALYSIS_CODE3,
    Data0017.ANALYSIS_CODE4,Data0017.ANALYSIS_CODE5,
	data0496.ttype,case data0496.ttype when 'P' then '直接材料' when 'M' then '间接材料'
		                               when 'N' then '其他材料' when 'T' then '外发项目' when 'F' then '非成本项'
                   end ttype_desc,
	data0023.ABBR_NAME,data0023.code as suppcode,
    case Data0017.use_flag when '0' then '共用' when '1' then '专用' 
                           end as use_flag,
	data0017.INV_PART_NUMBER, data0017.inv_name,data0017.inv_DESCRIPTION,data0002.UNIT_NAME, 
	convert(dec(18,4),data0017.STD_COST) as std_price,data0017.STOCK_SELL, data0017.STOCK_BASE, 
	isnull(#temp_1.received_qty,0) as received,
   -- isnull(case #temp_1.received_qty when 0 then 0 else #temp_1.received_money end,0) as received_money, 
    isnull(#temp_1.received_money,0) as received_money,
    isnull(#temp_11.tranin_qty,0)+isnull(#temp_21.tranout_qty,0) as tran_qty,
    isnull(#temp_11.tranin_money,0)+isnull(#temp_21.tranout_money,0) as tran_money, 
	isnull(#temp_2.out_qty,0) as extend, --#temp_2.out_money as extend_money,
    
	isnull(#temp_3.return_qty,0) as quan_return,isnull(#temp_3.return_money,0) as amount_return,
	isnull(#temp_4.scrap_qty,0) as quan_scrap,isnull(#temp_4.scrap_money,0) as amount_scrap,
	isnull(#temp_5.stock_qty,0) as stock,isnull(#temp_5.stock_money,0) as amount, 
	isnull(#temp_6.iqc_qty,0) as iqc_qty,isnull(#temp_6.iqc_money,0) as iqc_money,
	convert(dec(18,2),#temp_5.stock_qty * data0017.STOCK_BASE) AS totol_hight, 
	convert(dec(18,2),#temp_5.stock_qty * data0017.STOCK_SELL) AS totol_mianji,
	isnull(#temp_5.stock_qty,0)+isnull(#temp_2.out_qty,0)+isnull(#temp_3.return_qty,0)+isnull(#temp_4.scrap_qty,0)
           +isnull(#temp_6.iqc_qty,0)-isnull(#temp_1.received_qty,0)
           -isnull(#temp_11.tranin_qty,0)-isnull(#temp_21.tranout_qty,0) 
          as begstock,
	ROUND(isnull(#temp_5.stock_money,0)+isnull(#temp_2.out_money,0)+isnull(#temp_3.return_money,0)+isnull(#temp_4.scrap_money,0)
          +isnull(#temp_6.iqc_money,0)-isnull(#temp_1.received_money,0),4) 
          -isnull(#temp_11.tranin_money,0)-isnull(#temp_21.tranout_money,0)
          as begstock_money,
    
    ROUND(isnull(#temp_5.stock_money,0)-isnull(#temp_21.tranout_money,0)+isnull(#temp_2.out_money,0)+isnull(#temp_3.return_money,0)+isnull(#temp_4.scrap_money,0)
    +isnull(#temp_6.iqc_money,0)-isnull(#temp_1.received_money,0)-isnull(#temp_11.tranin_money,0),4)
    +isnull(#temp_1.received_money,0)+isnull(#temp_11.tranin_money,0)+isnull(#temp_21.tranout_money,0)
    -isnull(#temp_5.stock_money,0)-isnull(#temp_3.return_money,0)-isnull(#temp_4.scrap_money,0)-isnull(#temp_6.iqc_money,0)
    as extend_money

    ,Coin=Data0001.Curr_Code,t99.last_price,case Data0017.protariff when 1 then '是' else '否' end as protariff
FROM #temp_mat_list t0 
left join #temp_1 on t0.rkey17=#temp_1.rkey17 and t0.rkey23=#temp_1.rkey23 and t0.Rkey16=#temp_1.rkey16 and t0.CoinPtr=#temp_1.CoinPtr
left join #temp_11 on t0.rkey17=#temp_11.rkey17 and t0.rkey23=#temp_11.rkey23 and t0.Rkey16=#temp_11.rkey16 and t0.CoinPtr=#temp_11.CoinPtr
left join #temp_2 on t0.rkey17=#temp_2.rkey17 and t0.rkey23=#temp_2.rkey23 and t0.Rkey16=#temp_2.Rkey16 and t0.CoinPtr=#temp_2.CoinPtr
left join #temp_21 on t0.rkey17=#temp_21.rkey17 and t0.rkey23=#temp_21.rkey23 and t0.Rkey16=#temp_21.Rkey16 and t0.CoinPtr=#temp_21.CoinPtr
left join #temp_3 on t0.rkey17=#temp_3.rkey17 and t0.rkey23=#temp_3.rkey23 and t0.Rkey16=#temp_3.Rkey16 and t0.CoinPtr=#temp_3.CoinPtr
left join #temp_4 on t0.rkey17=#temp_4.rkey17 and t0.rkey23=#temp_4.rkey23 and t0.Rkey16=#temp_4.Rkey16 and t0.CoinPtr=#temp_4.CoinPtr
left join #temp_5 on t0.rkey17=#temp_5.rkey17 and t0.rkey23=#temp_5.rkey23 and t0.Rkey16=#temp_5.Rkey16 and t0.CoinPtr=#temp_5.CoinPtr
left join #temp_6 on t0.rkey17=#temp_6.rkey17 and t0.rkey23=#temp_6.rkey23 and t0.Rkey16=#temp_6.Rkey16 and t0.CoinPtr=#temp_6.CoinPtr
left join data0017 on t0.rkey17=data0017.rkey 
left join data0002 on data0017.stock_unit_ptr=data0002.rkey 
left join data0496 on data0017.group_ptr=data0496.rkey 
left join data0019 on data0496.group_ptr=data0019.rkey 
left join data0016 on t0.rkey16=data0016.rkey
left join data0023 on t0.rkey23=data0023.rkey 
left join Data0001 on t0.CoinPtr=Data0001.rkey --Data0001.quote_based=1 
left join (select a.inventory_ptr as rkey17,
            round(case 1 when 0 then a.PRICE else a.Tax_price end/a.EXCHANGE_RATE,4) as last_price
           from data0022  a inner join (
            select inventory_ptr,max(rkey) as maxrkey from data0022 
           group by inventory_ptr) b on a.rkey=b.maxrkey
)t99 on t0.rkey17=t99.rkey17
where --stock_qty is not null  or 
   stock_qty<>0
   or received_qty is not null 
   or out_qty is not null 
   or return_qty is not null 
   or scrap_qty is not null
   or IQC_qty is not null
   or (isnull(#temp_5.stock_qty,0)+isnull(#temp_21.tranout_qty,0)+isnull(#temp_2.out_qty,0)+isnull(#temp_3.return_qty,0)+isnull(#temp_4.scrap_qty,0)
      +isnull(#temp_6.iqc_qty,0)-isnull(#temp_1.received_qty,0)+isnull(#temp_11.tranin_qty,0)<>0)
order by data0017.inv_part_number,data0016.code
/*
delete #temp_1
delete #temp_11
delete #temp_2
delete #temp_21
delete #temp_3
delete #temp_4
delete #temp_5
delete #temp_6
*/
GO