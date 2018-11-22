EP249报价单查询
exec EP249;1 0,2,0,'%','%','%%','%','%','2013-12-18 00:00:00','2013-12-25 23:59:59'
EP249报价单查询里的存储过程1，and data0009.employee_ptr=data0005.rkey，当DATA0009这个销售代表不存在时，就出不来数据，能不能把这句语句注释了

create PROCEDURE EP249
@vptr int,
@vstatus int,
@vindex int,
@vcust varchar(10),
@vproj varchar(20),
@vpart varchar(40),
@vprod varchar(10),
@vsales varchar(5),
@vdate1 datetime,
@vdate2 datetime
with encryption
as
begin
declare @vflag int
select @vflag=SALESANALYSIS from data0192

if @vstatus=0
begin
if @vindex=0
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,
case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,
data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey   left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS=3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=1
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,
case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,
data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey   left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS=3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY data0346.row_name ,Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=2
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,
case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,
data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey   left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS=3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=3
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,
case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,
data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS=3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0009.rep_code,Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=4
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,
case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,
data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS=3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0085.qte_date,data0010.cust_code,data0085.cust_part_no
end
end
if @vstatus=1
begin
if @vindex=0
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS<>3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=1
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS<>3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY data0346.row_name ,Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=2
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS<>3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=3
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS<>3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0009.rep_code,Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=4
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and data0085.AUDITED_STATUS<>3
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0085.qte_date,data0010.cust_code,data0085.cust_part_no
end
end
if @vstatus=2
begin
if @vindex=0
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=1
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY data0346.row_name ,Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=2
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=3
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0009.rep_code,Data0010.cust_code,data0085.cust_part_no,data0085.qte_date
end
if @vindex=4
begin
select data0085.tnumber,data0346.row_name as prod_code,data0009.rep_code,
case when data0010.cust_code is null then 'New' else data0010.cust_code end as cust_code,
case when data0010.cust_code is null then data0085.cust_name else data0010.customer_name end as customer_name,
data0085.ref_part_no,data0085.cust_part_no,data0085.TUNITS,
Data0085.qte_date,data0085.unit_len,data0085.unit_wth,data0085.qte_units,
data0088.total_cost,data0259.price1,case when data0085.CURR_RATE>0 and data0088.std_price>0 then round(100*(data0088.std_price-data0259.price1/data0085.CURR_RATE)/data0088.std_price,2)  else null end as markup_rate,data0001.curr_code,
data0005.employee_name,data0017.inv_part_description,data0085.ttype,data0085.AUDITED_STATUS
from data0088,data0259,data0009,data0001,data0005,data0085 left outer join data0253
on data0253.quote_ptr=data0085.rkey left outer join data0017 
on data0253.std_invent_ptr=data0017.rkey left outer join data0352
on  data0085.rkey=data0352.quote_ptr left outer join data0346 on data0352.d0346_ptr=data0346.rkey  left outer join data0010
on data0085.cust_ptr=data0010.rkey 

where data0088.qte_ptr=data0085.rkey
and data0259.qte_ptr=data0085.rkey
and data0085.curr_ptr=data0001.rkey
and data0085.qby_empl_ptr=data0005.rkey
and data0085.ttype=0 and data0009.employee_ptr=data0005.rkey

and data0085.qte_DATE>=@VDATE1 AND data0085.qte_DATE<=@VDATE2
and ((data0010.cust_code like @vcust) or (@vcust='%'))
and data0085.REF_PART_NO like @vproj
and data0085.cust_PART_NO like @vpart
and ((data0346.row_name  like @vprod) or (@vprod='%'))
and ((data0009.rep_code like @vsales) or (@vsales='%'))
and ((@vflag=1 and (data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr)) or @vflag=0 or @vptr=0)
ORDER BY Data0085.qte_date,data0010.cust_code,data0085.cust_part_no
end
end
end
go

