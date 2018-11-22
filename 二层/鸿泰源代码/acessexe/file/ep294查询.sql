--ep294≤È—Ø
--exec ep294;3 9,1,'2013-09-27 11:00:48'

--create PROCEDURE ep294;3
declare
@vflag int=9,
@vflag2 int=1,
@vdate1 datetime='2013-09-27 11:00:48'
--as
IF @vflag2=0 
select data0050.catalog_number,data0060.so_oldnew,data0060.so_style,data0060.ttype,data0060.rkey,data0060.ent_date,data0060.so_tp,data0097.po_number,data0060.sales_order,data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.parts_alloc,data0059.customer_matl_desc,data0050.customer_part_number+data0050.cp_rev1 as custpartrev,
data0050.customer_part_number,data0050.cp_rev,data0050.cp_rev1,data0059.customer_part_desc,data0060.sch_date,data0060.parts_ordered,data0060.parts_shipped-data0060.part_ovsh as parts_shipped,data0060.to_be_planned,data0060.ONHOLD_SHIPPING,data0060.parts_Spare,
data0047.parameter_value,a.parameter_value as set_value,data0060.cust_part_ptr,data0060.status,data0060.prod_rel,data0060.qty_tran as PARTS_TRANSFERED,data0060.issued_qty as qty_plannned,cast(null as varchar(300)) as remark
,cast(null as float) as diff_qty,cast(null as float) as wip_qty,cast(null as float) as wip_qty2,cast(null as float) as scp_qty,cast(null as varchar(1)) as ok_flag,b.parameter_value as unit_sq,data0060.ORIG_SCHED_SHIP_DATE,data0060.REFERENCE_NUMBER,data0060.quote_price,
data0060.analysis_code_1,data0060.analysis_code_2,data0060.analysis_code_3,data0060.analysis_code_4,data0060.analysis_code_5,
data0050.analysis_code_2 as spec_info1,data0050.analysis_code_3  as spec_info2,
data0050.analysis_code_4 as spec_info3,data0050.analysis_code_5  as spec_info4,Data0060.Forkplate_qty AS set_accbad_qty,
data0050.analysis_code_6 as spec_info5,data0050.analysis_code_7  as spec_info6,
replace(data0050.spec_info,char(10),'') as spec_info,replace(cast(data0011.memo_text as varchar(500)),char(10),'') as memo_text,b.parameter_value*Data0060.PARTS_ORDERED as sq_ordered,ltrim(str(Data0050.set_lngth))+'*'+ltrim(str(Data0050.set_width)) as set_size,Data0060.WHSE_PTR,Data0015.ABBR_NAME
into #testx01
FROM         data0060(nolock) INNER JOIN
                      data0050(nolock) ON data0060.CUST_PART_PTR = data0050.RKEY INNER JOIN
                      data0059(nolock) ON data0050.RKEY = data0059.cust_part_ptr AND data0060.CUSTOMER_PTR = data0059.customer_ptr INNER JOIN
                      data0010(nolock) ON data0060.CUSTOMER_PTR = data0010.RKEY INNER JOIN
                      data0097(nolock) ON data0060.PURCHASE_ORDER_PTR = data0097.RKEY INNER JOIN
                      data0025(nolock) LEFT OUTER JOIN
                      data0047(nolock) ON data0047.PARAMETER_PTR = 2 AND data0047.SOURCE_POINTER = data0025.RKEY LEFT OUTER JOIN
                      data0047 AS a(nolock) ON a.PARAMETER_PTR = 3 AND a.SOURCE_POINTER = data0025.RKEY LEFT OUTER JOIN
                      data0047 AS b(nolock) ON b.PARAMETER_PTR = 7 AND b.SOURCE_POINTER = data0025.RKEY ON 
                      data0025.ANCESTOR_PTR = data0050.RKEY LEFT OUTER JOIN
                      data0011 ON data0060.RKEY = data0011.file_pointer and data0011.source_type=60
                      left join Data0015 on Data0060.WHSE_PTR=Data0015.RKEY
WHERE   (data0060.STATUS = 1 or  data0060.STATUS = @vflag )
AND (data0025.PARENT_PTR = 0)
and isnull(sch_date,ORIG_SCHED_SHIP_DATE)<@vdate1

IF @vflag2=1
select data0050.catalog_number,data0060.so_oldnew,data0060.so_style,data0060.ttype,data0060.rkey,data0060.ent_date,data0060.so_tp,data0097.po_number,data0060.sales_order,data0010.cust_code,data0010.customer_name,data0060.part_ovsh,data0060.parts_alloc,data0059.customer_matl_desc,data0050.customer_part_number+data0050.cp_rev1 as custpartrev,
data0050.customer_part_number,data0050.cp_rev,data0050.cp_rev1,data0059.customer_part_desc,data0060.sch_date,data0060.parts_ordered,data0060.parts_shipped-data0060.part_ovsh as parts_shipped,data0060.to_be_planned,data0060.ONHOLD_SHIPPING,data0060.parts_Spare,
data0047.parameter_value,a.parameter_value as set_value,data0060.cust_part_ptr,data0060.status,data0060.prod_rel,data0060.qty_tran as PARTS_TRANSFERED,data0060.issued_qty as qty_plannned,cast(null as varchar(300)) as remark
,cast(null as float) as diff_qty,cast(null as float) as wip_qty,cast(null as float) as wip_qty2,cast(null as float) as scp_qty,cast(null as varchar(1)) as ok_flag,b.parameter_value as unit_sq,data0060.ORIG_SCHED_SHIP_DATE,data0060.REFERENCE_NUMBER,data0060.quote_price,
data0060.analysis_code_1,data0060.analysis_code_2,data0060.analysis_code_3,data0060.analysis_code_4,data0060.analysis_code_5,
data0050.analysis_code_2 as spec_info1,data0050.analysis_code_3  as spec_info2,
data0050.analysis_code_4 as spec_info3,data0050.analysis_code_5  as spec_info4,Data0060.Forkplate_qty AS set_accbad_qty,
data0050.analysis_code_6 as spec_info5,data0050.analysis_code_7  as spec_info6,
data0050.spec_info,cast(data0011.memo_text as varchar(500)) as memo_text,b.parameter_value*Data0060.PARTS_ORDERED as sq_ordered,ltrim(str(Data0050.set_lngth))+'*'+ltrim(str(Data0050.set_width)) as set_size,Data0060.WHSE_PTR,Data0015.ABBR_NAME
into #testx02
FROM         data0060(nolock) left JOIN
                      data0050(nolock) ON data0060.CUST_PART_PTR = data0050.RKEY left JOIN
                      data0059(nolock) ON data0050.RKEY = data0059.cust_part_ptr AND data0060.CUSTOMER_PTR = data0059.customer_ptr left JOIN
                      data0010(nolock) ON data0060.CUSTOMER_PTR = data0010.RKEY left JOIN
                      data0097(nolock) ON data0060.PURCHASE_ORDER_PTR = data0097.RKEY left JOIN
                      data0025(nolock) LEFT OUTER JOIN
                      data0047(nolock) ON data0047.PARAMETER_PTR = 2 AND data0047.SOURCE_POINTER = data0025.RKEY LEFT OUTER JOIN
                      data0047 AS a(nolock) ON a.PARAMETER_PTR = 3 AND a.SOURCE_POINTER = data0025.RKEY LEFT OUTER JOIN
                      data0047 AS b(nolock) ON b.PARAMETER_PTR = 7 AND b.SOURCE_POINTER = data0025.RKEY ON 
                      data0025.ANCESTOR_PTR = data0050.RKEY LEFT OUTER JOIN
                      data0011(nolock) ON data0060.RKEY = data0011.file_pointer and data0011.source_type=60
                      left join Data0015 on Data0060.WHSE_PTR=Data0015.RKEY
WHERE   (data0060.STATUS = 1 or  data0060.STATUS = @vflag or data0060.rkey in (select data0006.so_ptr from data0056(nolock),data0006(nolock) where data0056.wo_ptr=data0006.rkey))
AND (data0025.PARENT_PTR = 0)
and isnull(sch_date,ORIG_SCHED_SHIP_DATE)<@vdate1

IF @vflag2=0
select * from #testx01
ORDER by customer_part_number,cp_rev1,isnull(sch_date,ORIG_SCHED_SHIP_DATE),ORIG_SCHED_SHIP_DATE
IF @vflag2=1
select * from #testx02
ORDER by customer_part_number,cp_rev1,isnull(sch_date,ORIG_SCHED_SHIP_DATE),ORIG_SCHED_SHIP_DATE

IF @vflag2=0
	DROP TABLE #testx01
IF @vflag2=1
DROP TABLE #testx02

go
