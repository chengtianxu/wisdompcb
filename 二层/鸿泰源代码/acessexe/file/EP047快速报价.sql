--EP047快速报价


--界面查询
--data0085报价单主表
--exec EP047;15 '%','%','%','2013-07-26 00:00:00','2013-07-29 00:00:00',0

--create PROCEDURE EP047;15
declare
@vproj varchar(20)='%',
@vcust varchar(40)='%',
@vnum varchar(10)='%',
@vdate1 datetime='2013-04-26 00:00:00',
@vdate2 datetime='2013-07-26 00:00:00',
@vptr int=0
--with encryption
--as
declare @vptr2 int
select @vptr2=employee_ptr from data0009 where rkey=@vptr
if @vptr=0
begin
SELECT data0015.ABBR_NAME,data0085.prt_flag,data0085.whse_ptr,data0085.auditflag,data0085.select_flag,Data0085.RKEY,data0085.set_len,data0085.set_wth,data0085.QTE_UNITS, Data0085.TNUMBER, Data0085.CUST_NAME,  Data0085.CUST_RFQ, data0088.TOTAL_COST,round(1/isnull(data0085.curr_rate,1),6) as curr_rate,
case when  data0088.qte_price>0 then round(100*(data0088.qte_price-data0259.price1)/data0088.qte_price,2)  else null end as disc_percent,
      Data0085.CUST_PART_NO, case when data0050.rkey>0 then data0050.customer_part_number else Data0085.REF_PART_NO end as REF_PART_NO,data0050.cp_rev1,Data0085.REJ_INFO, 
      Data0085.CUST_PART_DESC, Data0085.TTYPE2 as TTYPE, Data0085.QBY_EMPL_PTR,Data0085.UNIT_LEN,Data0085.UNIT_wth,Data0085.tUNITs,
      Data0085.ENTER_DATE, Data0085.APPRV_BY_PTR, Data0085.APPRV_DATE, data0085.ratio,Data0085.PROMISE_SAMP_DATE,Data0085.PROMISE_DATE,
      Data0085.QTE_DATE, Data0085.AUDITED_STATUS, Data0005.EMPL_CODE, data0085.so_lot_flag,data0085.so_samp_flag,data0085.so_flag,
      Data0005.EMPLOYEE_NAME AS QBY_EMPLOYEE, b.EMPLOYEE_ID, Data0085.expiration_date,Data0085.old_expire_date,
      A.EMPLOYEE_NAME AS APPRV_employee, Data0088.rush_fee_rate*100 as MARKUP_RATE, data0085.last_modified_date,
      Data0085.appd_by, Data0259.TAXPRICE1, Data0001.CURR_CODE,b.employee_name as enetered_name,data0085.seq_nr,
	data0085.layers,data0059.customer_matl_desc,data0010.cust_code,data0085.edit_flag,data0085.NOTE_INFO,
data0085.qte_desc1,data0085.qte_desc2,data0085.qte_desc3,data0085.qte_desc4,data0085.qte_desc5,data0085.qte_desc6,data0085.qte_desc7,data0085.qte_desc8,
data0085.qte_desc9,data0085.qte_desc10,data0085.qte_desc11,data0085.qte_desc12,data0085.qte_desc13,data0085.qte_desc14,data0085.qte_desc15,
data0085.qte_desc16,case when data0259.base_qty>0 then base_qty else data0259.quantity1 end as base_qty,1-data0085.tusage as tusage
      ,data0259.TOOLING1
      ,data0259.TOOLING2
      ,data0259.TOOLING3
      ,data0259.TOOLING4
      ,data0259.TOOLING5
      ,data0259.TOOLING6
      ,data0259.TOOLING7
      ,data0259.TOOLING8
      ,data0259.TOOLING9
      ,data0259.TOOLING10
      ,data0259.TAXTOOL_PRICE1
      ,data0259.TAXTOOL_PRICE2
      ,data0259.TAXTOOL_PRICE3
      ,data0259.TAXTOOL_PRICE4
      ,data0259.TAXTOOL_PRICE5
      ,data0259.TAXTOOL_PRICE6
      ,data0259.TAXTOOL_PRICE7
      ,data0259.TAXTOOL_PRICE8
      ,data0259.TAXTOOL_PRICE9
      ,data0259.TAXTOOL_PRICE10
      ,data0259.TOOL_PRICE1
      ,data0259.TOOL_PRICE2
      ,data0259.TOOL_PRICE3
      ,data0259.TOOL_PRICE4
      ,data0259.TOOL_PRICE5
      ,data0259.TOOL_PRICE6
      ,data0259.TOOL_PRICE7
      ,data0259.TOOL_PRICE8
      ,data0259.TOOL_PRICE9
      ,data0259.TOOL_PRICE10
FROM dbo.Data0088(nolock) --报价单分析标准价格表
RIGHT OUTER JOIN dbo.Data0085(nolock) ON dbo.Data0088.QTE_PTR = dbo.Data0085.RKEY
 INNER JOIN dbo.Data0005(nolock) ON   dbo.Data0085.QBY_EMPL_PTR = dbo.Data0005.RKEY 
 LEFT OUTER JOIN   dbo.Data0010(nolock) ON dbo.Data0085.CUST_PTR = dbo.Data0010.RKEY 
 LEFT OUTER JOIN   dbo.data0059(nolock) 
 INNER JOIN dbo.Data0050(nolock) ON dbo.data0059.cust_part_ptr = dbo.Data0050.RKEY
  ON   dbo.Data0085.CUST_PTR = dbo.data0059.customer_ptr AND dbo.Data0085.CUST_PART_PTR = dbo.Data0050.RKEY AND dbo.Data0010.RKEY = dbo.data0059.customer_ptr 
LEFT OUTER JOIN dbo.Data0001(nolock) ON   dbo.Data0085.CURR_PTR = dbo.Data0001.RKEY 
LEFT OUTER JOIN dbo.Data0005 A(nolock) ON dbo.Data0085.APPRV_BY_PTR = A.RKEY 
LEFT OUTER JOIN dbo.Data0259 ON dbo.Data0259.QTE_PTR = dbo.Data0085.RKEY --报价单特别费用表/额外费用表
 LEFT OUTER JOIN dbo.Data0005 b(nolock) ON dbo.Data0085.last_modified_by_ptr = b.RKEY 
left join Data0015 on Data0085.whse_ptr=Data0015.RKEY
WHERE ENTER_DATE>=@VDATE1 AND ENTER_DATE<=@VDATE2
and data0085.REF_PART_NO like @vproj --本厂编号
and data0085.CUST_PART_NO like @vcust --客户型号
and data0085.tnumber like @vnum --报价单号
and data0085.ttype=0 --0：快速报价； 1：完全报价
and (@whse_ptr=0 or (data0050.whse_ptr=@whse_ptr or isnull(data0050.whse_ptr,0)=0))

ORDER BY Data0085.TNUMBER
end
if @vptr>0
begin
SELECT data0015.ABBR_NAME,data0085.prt_flag,data0085.whse_ptr,data0085.auditflag,data0085.select_flag,Data0085.RKEY,data0085.set_len,data0085.set_wth,data0085.QTE_UNITS, Data0085.TNUMBER, Data0085.CUST_NAME,  Data0085.CUST_RFQ, data0088.TOTAL_COST,round(1/isnull(data0085.curr_rate,1),6) as curr_rate,
case when  data0088.qte_price>0 then round(100*(data0088.qte_price-data0259.price1)/data0088.qte_price,2)  else null end as disc_percent,
      Data0085.CUST_PART_NO, case when data0050.rkey>0 then data0050.customer_part_number else Data0085.REF_PART_NO end as REF_PART_NO,data0050.cp_rev1,Data0085.REJ_INFO, 
      Data0085.CUST_PART_DESC, Data0085.TTYPE2 as TTYPE, Data0085.QBY_EMPL_PTR,Data0085.UNIT_LEN,Data0085.UNIT_wth,Data0085.tUNITs,
      Data0085.ENTER_DATE, Data0085.APPRV_BY_PTR, Data0085.APPRV_DATE, data0085.ratio,Data0085.PROMISE_SAMP_DATE,Data0085.PROMISE_DATE,
      Data0085.QTE_DATE, Data0085.AUDITED_STATUS, Data0005.EMPL_CODE, data0085.so_lot_flag,data0085.so_samp_flag,data0085.so_flag,
      Data0005.EMPLOYEE_NAME AS QBY_EMPLOYEE, b.EMPLOYEE_ID, Data0085.expiration_date,Data0085.old_expire_date,
      A.EMPLOYEE_NAME AS APPRV_employee, Data0088.rush_fee_rate*100 as MARKUP_RATE, data0085.last_modified_date,
      Data0085.appd_by, Data0259.TAXPRICE1, Data0001.CURR_CODE,b.employee_name as enetered_name,data0085.seq_nr,
	data0085.layers,data0059.customer_matl_desc,data0010.cust_code,data0085.edit_flag,data0085.NOTE_INFO,
data0085.qte_desc1,data0085.qte_desc2,data0085.qte_desc3,data0085.qte_desc4,data0085.qte_desc5,data0085.qte_desc6,data0085.qte_desc7,data0085.qte_desc8,
data0085.qte_desc9,data0085.qte_desc10,data0085.qte_desc11,data0085.qte_desc12,data0085.qte_desc13,data0085.qte_desc14,data0085.qte_desc15,
data0085.qte_desc16,case when data0259.base_qty>0 then base_qty else data0259.quantity1 end as base_qty,1-data0085.tusage as tusage
      ,data0259.TOOLING1
      ,data0259.TOOLING2
      ,data0259.TOOLING3
      ,data0259.TOOLING4
      ,data0259.TOOLING5
      ,data0259.TOOLING6
      ,data0259.TOOLING7
      ,data0259.TOOLING8
      ,data0259.TOOLING9
      ,data0259.TOOLING10
      ,data0259.TAXTOOL_PRICE1
      ,data0259.TAXTOOL_PRICE2
      ,data0259.TAXTOOL_PRICE3
      ,data0259.TAXTOOL_PRICE4
      ,data0259.TAXTOOL_PRICE5
      ,data0259.TAXTOOL_PRICE6
      ,data0259.TAXTOOL_PRICE7
      ,data0259.TAXTOOL_PRICE8
      ,data0259.TAXTOOL_PRICE9
      ,data0259.TAXTOOL_PRICE10
      ,data0259.TOOL_PRICE1
      ,data0259.TOOL_PRICE2
      ,data0259.TOOL_PRICE3
      ,data0259.TOOL_PRICE4
      ,data0259.TOOL_PRICE5
      ,data0259.TOOL_PRICE6
      ,data0259.TOOL_PRICE7
      ,data0259.TOOL_PRICE8
      ,data0259.TOOL_PRICE9
      ,data0259.TOOL_PRICE10
FROM data0009(nolock),dbo.Data0088(nolock) RIGHT OUTER JOIN
      dbo.Data0085(nolock) ON dbo.Data0088.QTE_PTR = dbo.Data0085.RKEY INNER JOIN
      dbo.Data0005(nolock) ON 
      dbo.Data0085.QBY_EMPL_PTR = dbo.Data0005.RKEY LEFT OUTER JOIN
      dbo.Data0010(nolock) ON dbo.Data0085.CUST_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN
      dbo.data0059(nolock) INNER JOIN
      dbo.Data0050(nolock) ON dbo.data0059.cust_part_ptr = dbo.Data0050.RKEY ON 
      dbo.Data0085.CUST_PTR = dbo.data0059.customer_ptr AND 
      dbo.Data0085.CUST_PART_PTR = dbo.Data0050.RKEY AND 
      dbo.Data0010.RKEY = dbo.data0059.customer_ptr LEFT OUTER JOIN
      dbo.Data0001(nolock) ON 
      dbo.Data0085.CURR_PTR = dbo.Data0001.RKEY LEFT OUTER JOIN
      dbo.Data0005 A(nolock) ON dbo.Data0085.APPRV_BY_PTR = A.RKEY LEFT OUTER JOIN
      dbo.Data0259 ON dbo.Data0259.QTE_PTR = dbo.Data0085.RKEY LEFT OUTER JOIN
      dbo.Data0005 b(nolock) ON dbo.Data0085.last_modified_by_ptr = b.RKEY
      left join Data0015 on Data0085.whse_ptr=Data0015.RKEY
WHERE ENTER_DATE>=@VDATE1 AND ENTER_DATE<=@VDATE2
and data0085.REF_PART_NO like @vproj
and data0085.CUST_PART_NO like @vcust
and data0085.tnumber like @vnum
and data0085.ttype=0
and data0085.srep_ptr=data0009.rkey
and (@whse_ptr=0 or (data0050.whse_ptr=@whse_ptr or isnull(data0050.whse_ptr,0)=0))
and ((dbo.Data0085.SREP_PTR=@vptr) or (dbo.Data0085.QBY_EMPL_PTR=@vptr2) or (data0010.rkey in (select data0012.customer_ptr from data0012 where 
srep_ptr_1=@vptr or srep_ptr_2=@vptr or srep_ptr_3=@vptr or srep_ptr_4=@vptr or srep_ptr_5=@vptr)
or data0009.rkey=@vptr or data0009.supervisor_ptr=@vptr))
ORDER BY Data0085.TNUMBER
end
go




--报价审核记录信息
--exec ep047;14 13722
--CREATE PROCEDURE ep047;14
declare 
@purch_ptr int=13722
--with encryption
--AS
SELECT user_id,user_full_name,allow_modi_flag,
       auth_date,ranking,user_ptr
FROM data0274(nolock) inner join data0073(nolock)
     On data0274.user_ptr=data0073.rkey
WHERE (qte_ptr = @purch_ptr)
  
ORDER BY
  ranking
Go
--审核流
select * from data0264 --审核人设置，0为报价，１为报废

select * from Data0085 where rkey=13722



