--EP047完全报价
--exec EP046;21 '%','%','%','2013-01-01 00:00:00','2013-07-29 00:00:00',0

--CREATE PROCEDURE EP046;21
declare
@vproj varchar(20)='%',
@vcust varchar(40)='%',
@vnum varchar(10)='%',
@vdate1 datetime='2013-01-01 00:00:00',
@vdate2 datetime='2013-07-29 00:00:00',
@vptr int=0
--with encryption
--as
if @vptr=0
begin
SELECT Data0085.RKEY, Data0085.TNUMBER, Data0085.CUST_NAME, 
      Data0085.CUST_PART_NO, Data0085.REF_PART_NO, Data0085.REJ_INFO, 
      Data0085.CUST_PART_DESC, Data0085.TTYPE, Data0085.QBY_EMPL_PTR, 
      Data0085.ENTER_DATE, Data0085.APPRV_BY_PTR, Data0085.APPRV_DATE, 
      Data0085.QTE_DATE, Data0085.AUDITED_STATUS, Data0005.EMPL_CODE, 
      Data0005.EMPLOYEE_NAME AS QBY_EMPLOYEE, Data0005.EMPLOYEE_ID, 
      A.EMPLOYEE_NAME AS APPRV_employee, Data0088.MARKUP_RATE, 
      Data0085.appd_by, Data0259.TAXPRICE1, Data0001.CURR_CODE
FROM Data0088 RIGHT OUTER JOIN
      Data0085 ON Data0088.QTE_PTR = Data0085.RKEY INNER JOIN
      Data0005 ON Data0085.QBY_EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
      Data0005 A ON Data0085.APPRV_BY_PTR = A.RKEY LEFT OUTER JOIN
      Data0259 ON Data0259.QTE_PTR = Data0085.RKEY LEFT OUTER JOIN
      Data0001 ON Data0085.CURR_PTR = Data0001.RKEY
WHERE ENTER_DATE>=@VDATE1 AND ENTER_DATE<=@VDATE2
and data0085.REF_PART_NO like @vproj
and data0085.CUST_PART_NO like @vcust
and data0085.tnumber like @vnum
and data0085.ttype=1
ORDER BY Data0085.TNUMBER
end
if @vptr>0
begin
SELECT Data0085.RKEY, Data0085.TNUMBER, Data0085.CUST_NAME, 
      Data0085.CUST_PART_NO, Data0085.REF_PART_NO, Data0085.REJ_INFO, 
      Data0085.CUST_PART_DESC, Data0085.TTYPE, Data0085.QBY_EMPL_PTR, 
      Data0085.ENTER_DATE, Data0085.APPRV_BY_PTR, Data0085.APPRV_DATE, 
      Data0085.QTE_DATE, Data0085.AUDITED_STATUS, Data0005.EMPL_CODE, 
      Data0005.EMPLOYEE_NAME AS QBY_EMPLOYEE, Data0005.EMPLOYEE_ID, 
      A.EMPLOYEE_NAME AS APPRV_employee, Data0088.MARKUP_RATE, 
      Data0085.appd_by, Data0259.TAXPRICE1, Data0001.CURR_CODE
FROM Data0088 RIGHT OUTER JOIN
      Data0085 ON Data0088.QTE_PTR = Data0085.RKEY INNER JOIN
      Data0005 ON Data0085.QBY_EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
      Data0005 A ON Data0085.APPRV_BY_PTR = A.RKEY LEFT OUTER JOIN
      Data0259 ON Data0259.QTE_PTR = Data0085.RKEY LEFT OUTER JOIN
      Data0001 ON Data0085.CURR_PTR = Data0001.RKEY
WHERE ENTER_DATE>=@VDATE1 AND ENTER_DATE<=@VDATE2
and data0085.REF_PART_NO like @vproj
and data0085.CUST_PART_NO like @vcust
and data0085.tnumber like @vnum
and data0085.QBY_EMPL_PTR=@vptr
and data0085.ttype=1
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

