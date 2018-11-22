--EP032查本厂编号
--exec ep032;5 2,61,'',''
--CREATE PROCEDURE EP032;50
--create PROCEDURE ep032;5
declare
@v_flag tinyint,
@rkey10 int,
@part_number varchar(30),
@vprev  varchar(30) ----20130426 超华要求增加版本条件 LLL 
  SELECT @v_flag=2,@rkey10=61,@part_number='',@vprev=''
--AS
declare @strsql varchar(8000)

select @strsql='
SELECT Data0050.RKEY, Data0050.TTYPE,data0050.set_x_qty,data0050.set_y_qty,data0050.set_x_qty * data0050.set_y_qty as jhss,
    Data0050.CP_REV1,Data0050.CP_REV2,Data0050.CP_REV3,
	Data0050.CUSTOMER_PART_NUMBER, Data0059.CUSTOMER_PART_DESC,customer_matl_desc,data0050.etest_tp,
	Data0050.CP_REV,rtrim(Data0050.CP_REV1)+rtrim(Data0050.CP_REV2) as CP_REV12,cp_code,data0050.mat_tp,
	Data0059.CUSTOMER_PTR,data0025.ENG_NOTE,data0008.product_name,isnull(Data0050.min_ord_qty,0) as min_ord_qty,
	Data0059.ONHOLD_SALES_FLAG,Data0050.unit_sq,Data0050.QTY_ALLOC,Data0050.INTERNAL_ECN_COUNTER,
	Data0050.EXTERNAL_ECN_COUNTER,Data0025.PROD_CODE_PTR,isnull(Data0050.MAX_ORD_QTY,0) as MAX_ORD_QTY,
	data0025.REMARK,data0050.SHELF_LIFE,data0025.rkey as rkey25,
	(data0050.custpart_ent_date+data0050.temp_valid_days) as MIvalid_day,
	data0050.set_lngth, data0050.set_width,DATA0010.CUST_CODE,Data0050.eq_status,
	case data0050.ttype when 0 then ''批量'' when 1 then ''样品'' when 2 then ''其它'' when 3 then ''采购部件'' end as TTYPE_DESC,
	case data0050.ONHOLD_PLANNING_FLAG when 0 then ''允许投产'' when 1 then ''禁止投产'' end as ONHOLD_PLAN_DESC,
	case data0050.tstatus when 1 then ''待1审'' when 2 then ''待2审'' when 3 then ''待3审''
		when 4 then ''待4审'' when 5 then ''1审退'' when 6 then ''2审退'' 
		when 7 then ''3审退'' when 8 then ''4审退'' when 9 then ''通过'' else ''修订中'' end as TSTATUS_DESC,
	(case Data0050.eq_status when 1 then ''问客中'' when 2 then ''完成'' else '''' end) as ceq_status,
	(select isnull(sum(data0053.qty_on_hand-data0053.qty_alloc),0) from data0053 
		where data0053.cust_part_ptr=data0050.rkey 
		and data0053.qty_on_hand>0) as qty_on_hand,
	(select isnull(sum(data0053.qty_on_hand-data0053.qty_alloc),0) from data0053 inner join data0050 t1 on data0053.cust_part_ptr=t1.rkey
		where t1.customer_part_number=data0050.customer_part_number and t1.cp_rev1=data0050.cp_rev1
		and data0053.qty_on_hand>0) as orev_qty_on_hand,
	(select isnull(sum(data0053.qty_on_hand-data0053.qty_alloc),0) from data0053 inner join data0050 t1 on data0053.cust_part_ptr=t1.rkey
		where t1.customer_part_number=data0050.customer_part_number
		and data0053.qty_on_hand>0) as cpno_qty_on_hand,data0050.risk_info '

--加载附加列

DECLARE @d0278rkey int,@FileAsName varchar(50),@extcol_sqlstring varchar(2000)

set @extcol_sqlstring=''
DECLARE extcol_list CURSOR FOR 
SELECT data0278.rkey, 'EXTCOL_'+upper(rtrim(data0278.parameter_name)) as FileAsName
from data0278 
where data0278.SPEC_MAT_FLAG=1 
order by data0278.SEQUENCE_NO

OPEN extcol_list
FETCH NEXT FROM extcol_list 
INTO @d0278rkey, @FileAsName
WHILE @@FETCH_STATUS = 0
BEGIN
	set @extcol_sqlstring=@extcol_sqlstring+char(10)
	+',(select rtrim(data0279.parameter_value) from data0279 where data0279.parameter_ptr='+convert(varchar,@d0278rkey)
	+' and data0279.source_ptr=data0025.rkey) as '+@FileAsName+' '
   -- Get the next author.
   FETCH NEXT FROM extcol_list 
   INTO @d0278rkey, @FileAsName
END
CLOSE extcol_list
DEALLOCATE extcol_list

--print @extcol_sqlstring

if @part_number<>'' --20130419LLL改为=号 
select @strsql=@strsql+@extcol_sqlstring++char(10)+'
FROM Data0050 INNER JOIN Data0025 ON Data0050.RKEY = Data0025.ANCESTOR_PTR AND Data0025.PARENT_PTR = 0
 	INNER JOIN Data0059 ON Data0050.RKEY = Data0059.CUST_PART_PTR 
	inner join data0010 on data0059.customer_ptr=data0010.rkey
	left join data0008 on data0025.prod_code_ptr=data0008.rkey  
    WHERE  (Data0050.CUSTOMER_PART_NUMBER = '''+@part_number+''') 
      and (Data0059.onhold_sales_flag<>1) '
   else 
    select @strsql=@strsql+@extcol_sqlstring++char(10)+'
    FROM Data0050 INNER JOIN Data0025 ON Data0050.RKEY = Data0025.ANCESTOR_PTR AND Data0025.PARENT_PTR = 0
 	INNER JOIN Data0059 ON Data0050.RKEY = Data0059.CUST_PART_PTR 
	inner join data0010 on data0059.customer_ptr=data0010.rkey
	left join data0008 on data0025.prod_code_ptr=data0008.rkey  
    WHERE  
       (Data0059.onhold_sales_flag<>1) ' 

if @vprev<>'' --20130426 超华要求增加版本条件 LLL 
  select @strsql=@strsql+' and (DATA0050.cp_rev='''+@vprev+''' ) '

if @v_flag <> 1
	select @strsql=@strsql+' 
	and (DATA0059.customer_ptr='+convert(varchar,@rkey10)+') '

select @strsql=@strsql+'  
	ORDER BY Data0050.CUSTOMER_PART_number,data0050.cp_rev desc '

EXEC(@strsql)
--print @strsql

GO



