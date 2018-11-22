exec ep406;1 '2013-05-01 00:00:00','2013-05-28 00:00:00','%',3,1


--create PROCEDURE ep406
declare
@date1 datetime='2013-05-01 00:00:00',
@date2 datetime='2013-05-01 00:00:00',
@cust varchar(12)='%',
@item smallint=3,--加工形式 0为自制 1为外发和半程 2为补投 3为全部
@dateflag int=2  --0 为下单日期，1为客户交期 20120924 LLL 

--AS
Select @date2=DATEADD(day,1,@date2)
Select @date1=Convert(Datetime,CONVERT(varchar(10),@date1,101)),
@date2=Convert(Datetime,CONVERT(varchar(10),@date2,101))
select @date1,@date2,@item

if @cust='' set @cust='%'
Create table #result(date1 Datetime,
NewArea decimal(18,6),--新单面积
OldArea decimal(18,6),--返单面积
OTArea decimal(18,6),--单双(不含金属基板)面积
DArea decimal(18,6),--多层(不含金属基板)面积
JSArea decimal(18,6),--金属基板面积
Area decimal(18,6),---销售总面积
NewCount int,--新单款数
OldCount int,--返单款数
ICount int,--总款数
Area1 decimal(18,6),--销售面积(单)
Area2 decimal(18,6),--销售面积(双)
Area3 decimal(18,6),--销售面积(多)
Amount1 decimal(18,6),--销售金额(单)
Amount2 decimal(18,6),--销售金额(双)
Amount3 decimal(18,6),--销售金额(多)
TArea1 decimal(18,6),--退货面积(单)
TArea2 decimal(18,6),--退货面积(双)
TArea3 decimal(18,6),--退货面积(多)
TAmount1 decimal(18,6),--退货金额(单)
TAmount2 decimal(18,6),--退货金额(双)
TAmount3 decimal(18,6),--退货金额(多)
HArea1 decimal(18,6),--交货面积(单)
HArea2 decimal(18,6),--交货面积(双)
HArea3 decimal(18,6),--交货面积(多)
HAmount1 decimal(18,6),--交货金额(单)
HAmount2 decimal(18,6),--交货金额(双)
HAmount3 decimal(18,6),--交货金额(多)
PArea1 decimal(18,6),--投产面积(单)
PArea2 decimal(18,6),--投产面积(双)
PArea3 decimal(18,6),--投产面积(多)
PAmount1 decimal(18,6),--投产金额(单)
PAmount2 decimal(18,6),--投产金额(双)
PAmount3 decimal(18,6),--投产金额(多)
SArea1 decimal(18,6),--报废面积(单)
SArea2 decimal(18,6),--报废面积(双)
SArea3 decimal(18,6),--报废面积(多)
SAmount1 decimal(18,6),--报废金额(单)
SAmount2 decimal(18,6),--报废金额(双)
SAmount3 decimal(18,6),--报废金额(多)
Tal_Amount decimal(18,6) --销售金额合计 20120929 
)
Declare @str varchar(8000) 
Declare @i Datetime
Select @i=@date1
While @i<@date2 
Begin
Insert into #result(date1)
Select @i

Select @i=DATEADD(day,1,@i)
End


if @dateflag=0 --0 为下单日期 20120924 LLL 
begin 

update t1
Set t1.NewArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and f.cust_code like @cust and a.SO_OLDNEW='新单'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1



update t1
Set t1.OldArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and f.cust_code like @cust and a.SO_OLDNEW<>'新单'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.OTArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and b.layers in(1,2) and f.cust_code like @cust and SUBSTRING(b.CUSTOMER_PART_NUMBER,1,1)<>'M'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.DArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and b.layers > 2 and f.cust_code like @cust and SUBSTRING(b.CUSTOMER_PART_NUMBER,1,1)<>'M'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.JSArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and f.cust_code like @cust and SUBSTRING(b.CUSTOMER_PART_NUMBER,1,1)='M'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1


/*--销售总面积:取消此计算方法，直接用Area=Area1+Area2+Area3 LLL 20120924 
update t1
Set t1.Area=t2.data1  
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1
*/


update t1
Set t1.NewCount=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,COUNT(ent_date) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and f.cust_code like @cust and a.SO_OLDNEW='新单'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.OldCount=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,COUNT(ent_date) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and f.cust_code like @cust and a.SO_OLDNEW<>'新单'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.ICount=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,COUNT(ent_date) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1


update t1
Set t1.Area1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and b.layers=1 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1


update t1
Set t1.Area2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and b.layers=2 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.Area3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and b.layers>2 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.Amount1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum((a.parts_ordered*a.part_price+a.total_add_l_price)/a.exch_rate),2) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and b.layers=1 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.Amount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum((a.parts_ordered*a.part_price+a.total_add_l_price)/a.exch_rate),2) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and b.layers=2 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.Amount3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ent_date,101)) as date1,round(sum((a.parts_ordered*a.part_price+a.total_add_l_price)/a.exch_rate),2) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ent_date>=@date1 and a.ent_date<@date2
	and b.layers>2 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ent_date,101))) t2
Where t1.date1=t2.date1




update t1
Set t1.TArea1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.unit_sq),4) as data1
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers=1 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TArea2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.unit_sq),4) as data1
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers=2 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TArea3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.unit_sq),4) as data1
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers>2 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TAmount1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.latest_price),4) as data1 
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers=1 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TAmount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.latest_price),4) as data1 
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers=2 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TAmount3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.latest_price),4) as data1 
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers>2 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HArea1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),date_shipped,101)) as date1,round(sum(a.quan_shipped*c.unit_sq),4) as data1
from data0064 a inner join data0060 b on a.so_ptr=b.rkey 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
left join data0010 f on b.customer_ptr=f.rkey
where c.layers=1 and a.date_shipped>=@date1 and a.date_shipped<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),date_shipped,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HArea2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),date_shipped,101)) as date1,round(sum(a.quan_shipped*c.unit_sq),4) as data1
from data0064 a inner join data0060 b on a.so_ptr=b.rkey 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=2 and a.date_shipped>=@date1 and a.date_shipped<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),date_shipped,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HArea3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),date_shipped,101)) as date1,round(sum(a.quan_shipped*c.unit_sq),4)  as data1
from data0064 a inner join data0060 b on a.so_ptr=b.rkey 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers>2 and a.date_shipped>=@date1 and a.date_shipped<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),date_shipped,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HAmount1=t2.data1
from #result t1, (SELECT Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101))  as date1,
 ROUND(SUM(case when Data0050.sales_order_unit_ptr=0 then  ROUND((
(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
  +(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*
(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price
   else data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
 +(case data0060.tax_in_price when 'N' then data0060.set_price else
   data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))
  *(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2) end),4)    AS data1 --AS notax_amount_base 
 FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  --INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0   left join data0009 on data0010.SALES_REP_PTR=data0009.rkey  LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=4
 -- INNER join data0047 b on data0025.rkey=b.source_pointer and b.parameter_ptr=2
  --LEFT JOIN DATA0047 C ON DATA0025.RKEY=C.SOURCE_POINTER AND C.PARAMETER_PTR=7
  --left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  --left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  --left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
   --   Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  --LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  --LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  --left join Data0001 on data0060.currency_ptr=data0001.rkey
   left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
  --left join data0015 on data0060.whse_ptr=data0015.rkey left join (select so_no,min(issue_date) issue_date,min(data0053.mfg_date) mfg_date from data0492 inner join 
--data0006 on data0492.CUT_NO=data0006.CUT_NO left join data0053 on data0006.rkey=data0053.WORK_ORDER_PTR group by so_no) d  on data0060.sales_order=d.so_no
WHERE Data0050.layers =1 and 
	(Data0064.QUAN_SHIPPED+data0064.ovsh_qty) > 0   and 
 --  data0439.date_sailing>='2011-04-27'  and data0439.date_sailing<'2011-04-28'--and 
    data0439.date_sailing>=@date1  and data0439.date_sailing<@date2 and 
 	 data0010.cust_code like @cust
 	 and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
	group by  Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HAmount2=t2.data1
from #result t1, (SELECT Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101)) as date1,
 ROUND(SUM(case when Data0050.sales_order_unit_ptr=0 then  ROUND((
(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
  +(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*
(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price
   else data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
 +(case data0060.tax_in_price when 'N' then data0060.set_price else
   data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))
  *(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2) end),4)    AS data1 --AS notax_amount_base 
 FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  --INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0   left join data0009 on data0010.SALES_REP_PTR=data0009.rkey  LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=4
 -- INNER join data0047 b on data0025.rkey=b.source_pointer and b.parameter_ptr=2
  --LEFT JOIN DATA0047 C ON DATA0025.RKEY=C.SOURCE_POINTER AND C.PARAMETER_PTR=7
  --left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  --left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  --left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
   --   Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  --LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  --LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  --left join Data0001 on data0060.currency_ptr=data0001.rkey
   left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
  --left join data0015 on data0060.whse_ptr=data0015.rkey left join (select so_no,min(issue_date) issue_date,min(data0053.mfg_date) mfg_date from data0492 inner join 
--data0006 on data0492.CUT_NO=data0006.CUT_NO left join data0053 on data0006.rkey=data0053.WORK_ORDER_PTR group by so_no) d  on data0060.sales_order=d.so_no
WHERE Data0050.layers =2 and 
	(Data0064.QUAN_SHIPPED+data0064.ovsh_qty) > 0   and 
 --  data0439.date_sailing>='2011-04-27'  and data0439.date_sailing<'2011-04-28'--and 
    data0439.date_sailing>=@date1  and data0439.date_sailing<@date2 and 
 	 data0010.cust_code like @cust
 	 and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
	group by  Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HAmount3=t2.data1
from #result t1, (SELECT Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101)) as date1,
 ROUND(SUM(case when Data0050.sales_order_unit_ptr=0 then  ROUND((
(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
  +(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*
(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price
   else data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
 +(case data0060.tax_in_price when 'N' then data0060.set_price else
   data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))
  *(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2) end),4)    AS data1 --AS notax_amount_base 
 FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  --INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0   left join data0009 on data0010.SALES_REP_PTR=data0009.rkey  LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=4
 -- INNER join data0047 b on data0025.rkey=b.source_pointer and b.parameter_ptr=2
  --LEFT JOIN DATA0047 C ON DATA0025.RKEY=C.SOURCE_POINTER AND C.PARAMETER_PTR=7
  --left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  --left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  --left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
   --   Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  --LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  --LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  --left join Data0001 on data0060.currency_ptr=data0001.rkey
   left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
  --left join data0015 on data0060.whse_ptr=data0015.rkey left join (select so_no,min(issue_date) issue_date,min(data0053.mfg_date) mfg_date from data0492 inner join 
--data0006 on data0492.CUT_NO=data0006.CUT_NO left join data0053 on data0006.rkey=data0053.WORK_ORDER_PTR group by so_no) d  on data0060.sales_order=d.so_no
WHERE Data0050.layers >2 and 
	(Data0064.QUAN_SHIPPED+data0064.ovsh_qty) > 0   and 
 --  data0439.date_sailing>='2011-04-27'  and data0439.date_sailing<'2011-04-28'--and 
    data0439.date_sailing>=@date1  and data0439.date_sailing<@date2 and 
 	 data0010.cust_code like @cust
 	 and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
	group by  Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101))) t2
Where t1.date1=t2.date1


update t1
Set t1.PArea1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101))  as date1,
round(sum(a.issued_qty*c.unit_sq),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=1 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PArea2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101))  as date1,
round(sum(a.issued_qty*c.unit_sq),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=2 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PArea3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101))  as date1,round(sum(a.issued_qty*c.unit_sq),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers>2 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PAmount1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101))  as date1,
 round(sum(a.issued_qty*b.part_price/b.exch_rate),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=1 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PAmount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101)) as date1,
 round(sum(a.issued_qty*b.part_price/b.exch_rate),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=2 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PAmount3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101)) as date1,
 round(sum(a.issued_qty*b.part_price/b.exch_rate),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers>2 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.SArea1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,
round(sum(a.qty_reject*c.unit_sq),4) as data1
FROM data0058 a inner join data0006 d ON a.WO_PTR = d.RKEY 
	INNER JOIN Data0025 e ON d.BOM_PTR = e.RKEY 
	INNER JOIN Data0050 c ON e.ANCESTOR_PTR = c.RKEY 
	LEFT OUTER JOIN data0492 ON d.CUT_NO = data0492.CUT_NO 
	left join data0060 ON Data0060.SALES_ORDER = data0492.SO_NO
	left join Data0010 f ON f.RKEY = Data0060.CUSTOMER_PTR 
WHERE (c.LAYERS = 1) and a.tdatetime>=@date1 and a.tdatetime<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.SArea2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101))  as date1,
round(sum(a.qty_reject*c.unit_sq),4) as data1
FROM data0058 a inner join data0006 d ON a.WO_PTR = d.RKEY 
	INNER JOIN Data0025 e ON d.BOM_PTR = e.RKEY 
	INNER JOIN Data0050 c ON e.ANCESTOR_PTR = c.RKEY 
	LEFT JOIN data0492 ON d.CUT_NO = dbo.data0492.CUT_NO 
	left join data0060 ON Data0060.SALES_ORDER = data0492.SO_NO
	left join data0010 f on f.RKEY = Data0060.CUSTOMER_PTR 
where c.layers=2 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  

update t1
Set t1.SArea3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,
round(sum(a.qty_reject*c.unit_sq),4) as data1
FROM data0058 a inner join Data0006 d ON a.WO_PTR = d.RKEY 
	INNER JOIN Data0025 e ON d.BOM_PTR = e.RKEY 
	INNER JOIN Data0050 c ON e.ANCESTOR_PTR = c.RKEY 
	LEFT OUTER JOIN dbo.data0492 ON d.CUT_NO = data0492.CUT_NO 
	left join data0060 on Data0060.SALES_ORDER = data0492.SO_NO
	left join data0010 f ON f.RKEY = Data0060.CUSTOMER_PTR
where c.layers>3 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  

update t1
Set t1.SAmount1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,round(sum(a.qty_reject*b.part_price/b.exch_rate),4) as data1
from data0058 a inner join data0006 d on a.wo_ptr=d.rkey 
	inner join data0492 e on d.cut_no=e.cut_no 
	inner join data0060 b on e.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
	inner join data0025 g on d.bom_ptr=g.rkey 
where c.layers=1 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and g.parent_ptr=0 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  

update t1
Set t1.SAmount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,round(sum(a.qty_reject*b.part_price/b.exch_rate),4) as data1
from data0058 a inner join data0006 d on a.wo_ptr=d.rkey 
	inner join data0492 e on d.cut_no=e.cut_no 
	inner join data0060 b on e.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
	inner join data0025 g on d.bom_ptr=g.rkey 
where c.layers=2 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and g.parent_ptr=0 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  

update t1
Set t1.SAmount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,round(sum(a.qty_reject*b.part_price/b.exch_rate),4) as data1
from data0058 a inner join data0006 d on a.wo_ptr=d.rkey 
	inner join data0492 e on d.cut_no=e.cut_no 
	inner join data0060 b on e.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
	inner join data0025 g on d.bom_ptr=g.rkey 
where c.layers>2 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and g.parent_ptr=0 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  

end --0 为下单日期 20120924 LLL 

else
begin --1 为交易日期 20120924 LLL 

update t1
Set t1.NewArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and f.cust_code like @cust and a.SO_OLDNEW='新单'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.OldArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and f.cust_code like @cust and a.SO_OLDNEW<>'新单'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.OTArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and b.layers in(1,2) and f.cust_code like @cust and SUBSTRING(b.CUSTOMER_PART_NUMBER,1,1)<>'M'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.DArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and b.layers > 2 and f.cust_code like @cust and SUBSTRING(b.CUSTOMER_PART_NUMBER,1,1)<>'M'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.JSArea=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and f.cust_code like @cust and SUBSTRING(b.CUSTOMER_PART_NUMBER,1,1)='M'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1


/*--销售总面积:取消此计算方法，直接用Area=Area1+Area2+Area3 LLL 20120924 
update t1
Set t1.Area=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1
*/


update t1
Set t1.NewCount=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,COUNT(ORIG_REQUEST_DATE) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and f.cust_code like @cust and a.SO_OLDNEW='新单'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.OldCount=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,COUNT(ORIG_REQUEST_DATE) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and f.cust_code like @cust and a.SO_OLDNEW<>'新单'
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.ICount=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,COUNT(ORIG_REQUEST_DATE) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1


update t1
Set t1.Area1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and b.layers=1 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.Area2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and b.layers=2 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.Area3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum(a.parts_ordered*b.unit_sq),4) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and b.layers>2 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.Amount1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum((a.parts_ordered*a.part_price+a.total_add_l_price)/a.exch_rate),2) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and b.layers=1 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.Amount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum((a.parts_ordered*a.part_price+a.total_add_l_price)/a.exch_rate),2) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and b.layers=2 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.Amount3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,round(sum((a.parts_ordered*a.part_price+a.total_add_l_price)/a.exch_rate),2) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>=@date1 and a.ORIG_REQUEST_DATE<@date2
	and b.layers>2 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TArea1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.unit_sq),4) as data1
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers=1 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TArea2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.unit_sq),4) as data1
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers=2 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TArea3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.unit_sq),4) as data1
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers>2 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TAmount1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.latest_price),4) as data1 
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers=1 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TAmount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.latest_price),4) as data1 
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers=2 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.TAmount3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),rma_date,101)) as date1,round(sum(a.qty_auth*b.latest_price),4) as data1 
from data0098 a inner join data0050 b on a.customer_part_ptr=b.rkey 
left join data0010 f on a.customer_ptr=f.rkey
where b.layers>2 and a.rma_date>=@date1 and a.rma_date<@date2
	and f.cust_code like @cust
group by Convert(Datetime,CONVERT(varchar(10),rma_date,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HArea1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),date_shipped,101)) as date1,round(sum(a.quan_shipped*c.unit_sq),4) as data1
from data0064 a inner join data0060 b on a.so_ptr=b.rkey 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
left join data0010 f on b.customer_ptr=f.rkey
where c.layers=1 and a.date_shipped>=@date1 and a.date_shipped<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),date_shipped,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HArea2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),date_shipped,101)) as date1,round(sum(a.quan_shipped*c.unit_sq),4) as data1
from data0064 a inner join data0060 b on a.so_ptr=b.rkey 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=2 and a.date_shipped>=@date1 and a.date_shipped<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),date_shipped,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HArea3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),date_shipped,101)) as date1,round(sum(a.quan_shipped*c.unit_sq),4)  as data1
from data0064 a inner join data0060 b on a.so_ptr=b.rkey 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers>2 and a.date_shipped>=@date1 and a.date_shipped<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),date_shipped,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HAmount1=t2.data1
from #result t1, (SELECT Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101))  as date1,
 ROUND(SUM(case when Data0050.sales_order_unit_ptr=0 then  ROUND((
(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
  +(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*
(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price
   else data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
 +(case data0060.tax_in_price when 'N' then data0060.set_price else
   data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))
  *(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2) end),4)    AS data1 --AS notax_amount_base 
 FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  --INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0   left join data0009 on data0010.SALES_REP_PTR=data0009.rkey  LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=4
 -- INNER join data0047 b on data0025.rkey=b.source_pointer and b.parameter_ptr=2
  --LEFT JOIN DATA0047 C ON DATA0025.RKEY=C.SOURCE_POINTER AND C.PARAMETER_PTR=7
  --left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  --left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  --left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
   --   Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  --LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  --LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  --left join Data0001 on data0060.currency_ptr=data0001.rkey
   left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
  --left join data0015 on data0060.whse_ptr=data0015.rkey left join (select so_no,min(issue_date) issue_date,min(data0053.mfg_date) mfg_date from data0492 inner join 
--data0006 on data0492.CUT_NO=data0006.CUT_NO left join data0053 on data0006.rkey=data0053.WORK_ORDER_PTR group by so_no) d  on data0060.sales_order=d.so_no
WHERE Data0050.layers =1 and 
	(Data0064.QUAN_SHIPPED+data0064.ovsh_qty) > 0   and 
 --  data0439.date_sailing>='2011-04-27'  and data0439.date_sailing<'2011-04-28'--and 
    data0439.date_sailing>=@date1  and data0439.date_sailing<@date2 and 
 	 data0010.cust_code like @cust
 	 and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
	group by  Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HAmount2=t2.data1
from #result t1, (SELECT Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101)) as date1,
 ROUND(SUM(case when Data0050.sales_order_unit_ptr=0 then  ROUND((
(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
  +(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*
(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price
   else data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
 +(case data0060.tax_in_price when 'N' then data0060.set_price else
   data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))
  *(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2) end),4)    AS data1 --AS notax_amount_base 
 FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  --INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0   left join data0009 on data0010.SALES_REP_PTR=data0009.rkey  LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=4
 -- INNER join data0047 b on data0025.rkey=b.source_pointer and b.parameter_ptr=2
  --LEFT JOIN DATA0047 C ON DATA0025.RKEY=C.SOURCE_POINTER AND C.PARAMETER_PTR=7
  --left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  --left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  --left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
   --   Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  --LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  --LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  --left join Data0001 on data0060.currency_ptr=data0001.rkey
   left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
  --left join data0015 on data0060.whse_ptr=data0015.rkey left join (select so_no,min(issue_date) issue_date,min(data0053.mfg_date) mfg_date from data0492 inner join 
--data0006 on data0492.CUT_NO=data0006.CUT_NO left join data0053 on data0006.rkey=data0053.WORK_ORDER_PTR group by so_no) d  on data0060.sales_order=d.so_no
WHERE Data0050.layers =2 and 
	(Data0064.QUAN_SHIPPED+data0064.ovsh_qty) > 0   and 
 --  data0439.date_sailing>='2011-04-27'  and data0439.date_sailing<'2011-04-28'--and 
    data0439.date_sailing>=@date1  and data0439.date_sailing<@date2 and 
 	 data0010.cust_code like @cust
 	 and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
	group by  Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101))) t2
Where t1.date1=t2.date1

update t1
Set t1.HAmount3=t2.data1
from #result t1, (SELECT Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101)) as date1,
 ROUND(SUM(case when Data0050.sales_order_unit_ptr=0 then  ROUND((
(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*Data0064.QUAN_SHIPPED
  +(case data0060.tax_in_price when 'N' then data0060.part_price else data0060.part_price/(1+data0189.state_tax/100.00) end)*data0064.ovsh_qty*
(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2)
else ROUND(((case data0060.tax_in_price when 'N' then data0060.set_price
   else data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.000000*Data0064.QUAN_SHIPPED/(Data0050.set_x_qty * Data0050.set_y_qty))
 +(case data0060.tax_in_price when 'N' then data0060.set_price else
   data0060.set_price/(1+data0189.state_tax/100.00) end)*(1.00000*data0064.ovsh_qty/(Data0050.set_x_qty * Data0050.set_y_qty))
  *(100-Data0064.ovsh_discount)*0.01) / dbo.SF_GET_DO_MONTH_EXCHRATE(data0064.rkey)+0.0000001,2) end),4)    AS data1 --AS notax_amount_base 
 FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  --INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0   left join data0009 on data0010.SALES_REP_PTR=data0009.rkey  LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=4
 -- INNER join data0047 b on data0025.rkey=b.source_pointer and b.parameter_ptr=2
  --LEFT JOIN DATA0047 C ON DATA0025.RKEY=C.SOURCE_POINTER AND C.PARAMETER_PTR=7
  --left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  --left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  --left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
   --   Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  --LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  --LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  --left join Data0001 on data0060.currency_ptr=data0001.rkey
   left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey 
  --left join data0015 on data0060.whse_ptr=data0015.rkey left join (select so_no,min(issue_date) issue_date,min(data0053.mfg_date) mfg_date from data0492 inner join 
--data0006 on data0492.CUT_NO=data0006.CUT_NO left join data0053 on data0006.rkey=data0053.WORK_ORDER_PTR group by so_no) d  on data0060.sales_order=d.so_no
WHERE Data0050.layers >2 and 
	(Data0064.QUAN_SHIPPED+data0064.ovsh_qty) > 0   and 
 --  data0439.date_sailing>='2011-04-27'  and data0439.date_sailing<'2011-04-28'--and 
    data0439.date_sailing>=@date1  and data0439.date_sailing<@date2 and 
 	 data0010.cust_code like @cust
 	 and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
	group by  Convert(Datetime,CONVERT(varchar(10),DATA0439.date_sailing,101))) t2
Where t1.date1=t2.date1


update t1
Set t1.PArea1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101))  as date1,
round(sum(a.issued_qty*c.unit_sq),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=1 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PArea2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101))  as date1,
round(sum(a.issued_qty*c.unit_sq),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=2 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PArea3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101))  as date1,round(sum(a.issued_qty*c.unit_sq),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers>2 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PAmount1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101))  as date1,
 round(sum(a.issued_qty*b.part_price/b.exch_rate),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=1 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PAmount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101)) as date1,
 round(sum(a.issued_qty*b.part_price/b.exch_rate),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers=2 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.PAmount3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),issue_date,101)) as date1,
 round(sum(a.issued_qty*b.part_price/b.exch_rate),4) as data1
from data0492 a left join data0060 b on a.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
where c.layers>2 and a.issue_date>=@date1 and a.issue_date<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),issue_date,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.SArea1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,
round(sum(a.qty_reject*c.unit_sq),4) as data1
FROM data0058 a inner join data0006 d ON a.WO_PTR = d.RKEY 
	INNER JOIN Data0025 e ON d.BOM_PTR = e.RKEY 
	INNER JOIN Data0050 c ON e.ANCESTOR_PTR = c.RKEY 
	LEFT OUTER JOIN data0492 ON d.CUT_NO = data0492.CUT_NO 
	left join data0060 ON Data0060.SALES_ORDER = data0492.SO_NO
	left join Data0010 f ON f.RKEY = Data0060.CUSTOMER_PTR 
WHERE (c.LAYERS = 1) and a.tdatetime>=@date1 and a.tdatetime<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1 

update t1
Set t1.SArea2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101))  as date1,
round(sum(a.qty_reject*c.unit_sq),4) as data1
FROM data0058 a inner join data0006 d ON a.WO_PTR = d.RKEY 
	INNER JOIN Data0025 e ON d.BOM_PTR = e.RKEY 
	INNER JOIN Data0050 c ON e.ANCESTOR_PTR = c.RKEY 
	LEFT JOIN data0492 ON d.CUT_NO = dbo.data0492.CUT_NO 
	left join data0060 ON Data0060.SALES_ORDER = data0492.SO_NO
	left join data0010 f on f.RKEY = Data0060.CUSTOMER_PTR 
where c.layers=2 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  

update t1
Set t1.SArea3=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,
round(sum(a.qty_reject*c.unit_sq),4) as data1
FROM data0058 a inner join Data0006 d ON a.WO_PTR = d.RKEY 
	INNER JOIN Data0025 e ON d.BOM_PTR = e.RKEY 
	INNER JOIN Data0050 c ON e.ANCESTOR_PTR = c.RKEY 
	LEFT OUTER JOIN dbo.data0492 ON d.CUT_NO = data0492.CUT_NO 
	left join data0060 on Data0060.SALES_ORDER = data0492.SO_NO
	left join data0010 f ON f.RKEY = Data0060.CUSTOMER_PTR
where c.layers>3 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (Data0060.so_tp=0)) or ((@item=1) and (Data0060.so_tp in(1,2))) or ((@item=2) and (Data0060.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  

update t1
Set t1.SAmount1=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,round(sum(a.qty_reject*b.part_price/b.exch_rate),4) as data1
from data0058 a inner join data0006 d on a.wo_ptr=d.rkey 
	inner join data0492 e on d.cut_no=e.cut_no 
	inner join data0060 b on e.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
	inner join data0025 g on d.bom_ptr=g.rkey 
where c.layers=1 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and g.parent_ptr=0 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  

update t1
Set t1.SAmount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,round(sum(a.qty_reject*b.part_price/b.exch_rate),4) as data1
from data0058 a inner join data0006 d on a.wo_ptr=d.rkey 
	inner join data0492 e on d.cut_no=e.cut_no 
	inner join data0060 b on e.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
	inner join data0025 g on d.bom_ptr=g.rkey 
where c.layers=2 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and g.parent_ptr=0 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  

update t1
Set t1.SAmount2=t2.data1
from #result t1, (select Convert(Datetime,CONVERT(varchar(10),tdatetime,101)) as date1,round(sum(a.qty_reject*b.part_price/b.exch_rate),4) as data1
from data0058 a inner join data0006 d on a.wo_ptr=d.rkey 
	inner join data0492 e on d.cut_no=e.cut_no 
	inner join data0060 b on e.so_no=b.sales_order 
	inner join data0050 c on b.cust_part_ptr=c.rkey 
	left join data0010 f on b.customer_ptr=f.rkey
	inner join data0025 g on d.bom_ptr=g.rkey 
where c.layers>2 and a.tdatetime>=@date1 and a.tdatetime<@date2
	and g.parent_ptr=0 and f.cust_code like @cust
	and ((@item=3) or ((@item=0) and (b.so_tp=0)) or ((@item=1) and (b.so_tp in(1,2))) or ((@item=2) and (b.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),tdatetime,101))) t2
Where t1.date1=t2.date1  


end --1 为交易日期 20120924 LLL 

--销售总面积:直接用Area=Area1+Area2+Area3 LLL 20120924 
update #result 
Set Area=round((isnull(Area1,0)+isnull(Area2,0)+isnull(Area3,0)),4) 


--增加销售总金额 20120929 LL 
update #result 
Set tal_Amount=round((isnull(Amount1,0)+isnull(Amount2,0)+isnull(Amount3,0)),4) 


print (@date1)
print (@date2)

Select * from #result

go


select Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101)) as date1,COUNT(ORIG_REQUEST_DATE) as data1 
from data0060 a inner join data0050 b on a.cust_part_ptr=b.rkey 
	left join data0010 f on a.customer_ptr=f.rkey
where a.ORIG_REQUEST_DATE>='2013-5-1' and a.ORIG_REQUEST_DATE<'2013-5-29'
	and f.cust_code like '%'
	--and ((@item=3) or ((@item=0) and (a.so_tp=0)) or ((@item=1) and (a.so_tp in(1,2))) or ((@item=2) and (a.so_tp=3)))
group by Convert(Datetime,CONVERT(varchar(10),ORIG_REQUEST_DATE,101))

select sales_order,ORIG_REQUEST_DATE from data0060 where ORIG_REQUEST_DATE between '2013-5-27' and '2013-5-28' order by ORIG_REQUEST_DATE