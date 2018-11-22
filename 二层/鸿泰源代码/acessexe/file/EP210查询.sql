EP210查询
declare
--create PROCEDURE EP210;1  --FrmMain.ADOQuery1
@vdate1 varchar(20),--报废申请时间范围Data0058.tdatetime 
@vdate2 varchar(20),--Data0058.tdatetime 
@Radiogroup1ItemIndex2 int,  --data0058.audit_empl_ptr,是否审核
@vptr varchar(8),
@vtp varchar(1),
@vunitptr int,
@orderbyField varchar(50),--排序字段
@flag int=0,  --0:不折算 1：折算
@PDflag int=0,   --0包括盘点报废，1不包括盘点报废20130515
@PROD_rkey varchar(100), --产品类别指针 20130806 LLL
@whse_ptr int=0 --工厂指针  
--with encryption
--AS
SELECT @vdate1='2014-03-01 00:00:00',@vdate2='2014-03-17 23:59:59',@Radiogroup1ItemIndex2=2,
@vptr='0',@vtp='U',@vunitptr=1,@orderbyField=' ORDER BY data0050.customer_part_number',
@flag=1,@PDflag=0,@PROD_rkey='0',@whse_ptr=0
begin
declare @sql2 varchar(8000)

set @sql2=' SELECT t1.source_pointer,t1.parameter_value,t2.Parameter_Desc,t2.Spec_Rkey
 into #Data0047
 FROM Data0047 t1 INNER JOIN
	  Data0278 t2 ON t1.Parameter_ptr = t2.Rkey 
				AND t2.Rkey = ' + cast(@vunitptr as varchar(10))
If @vtp='U'
	BEGIN

--处理除数为0的数据


 set @sql2 =@sql2 + 'SELECT Data0058.RKEY,Data0158.RKEY as RKEY_158,Data0058.MRB_NO, Data0058.WO_PTR,isnull(data0158.status,2) as status,
		  Data0058.TRAN_PTR, Data0058.DEPT_PTR, Data0058.REJECT_PTR,Data0492.so_no,Data0058.BOM_PTR,  '
	 if @flag = 1 
	 begin
	  SET @sql2 = @sql2 + ' round((cast(Data0058.QTY_ORG_REJ as float)/isnull(Data0025.parts_num,1)),4) AS QTY_ORG_REJ, 
		  round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4) as QTY_REJECT, 
          round((Data0058.SETS_QTY/isnull(Data0025.parts_num,1)),4) AS SETS_QTY,
		  round((Data0058.PANELS/isnull(Data0025.parts_num,1)),4) AS PANELS_2, 
          NetArea=
          case Data0047_1.PARAMETER_VALUE when 0 then 0 else 
          round(((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1))/isnull(Data0047_1.PARAMETER_VALUE,1)),4) end,  --20120618LLL
		  round((CAST(data0492.ISSUED_QTY AS FLOAT)/isnull(Data0025.parts_num,1)),4) AS ISSUED_QTY, '
	 end

   else 
	 begin
	   SET @sql2 = @sql2 + ' cast(Data0058.QTY_ORG_REJ as float) AS QTY_ORG_REJ, 
		  Data0058.QTY_REJECT,Data0058.SETS_QTY,Data0058.PANELS AS PANELS_2,
          NetArea= 
          case Data0047_1.PARAMETER_VALUE when 0 then 0 else 
		  Data0058.QTY_REJECT/isnull(Data0047_1.PARAMETER_VALUE,1) end  , 
		  CAST(data0492.ISSUED_QTY AS FLOAT) AS ISSUED_QTY, '
	 end
   	  
	SET @sql2 = @sql2 + '  
		  Data0058.FLOW_NO, Data0058.STEP, Data0058.EMPL_PTR,Data0050.eng_tp,
		  Data0058.TDATETIME, Data0058.AUDIT_EMPL_PTR, Data0058.TTYPE,
		  Data0058.AUDIT_DATETIME, Data0058.RESP_DEPT_PTR,Data0058.REFERENCE,  
		  Data0006.WORK_ORDER_NUMBER, data0059.customer_part_desc, 
		  Data0034.DEPT_CODE AS DEPT_CODE_2, Data0034.DEPT_NAME, 
		  B.DEPT_CODE AS dept_code_1, B.DEPT_NAME AS dept_name_1, 
		  C.DEPT_CODE AS dept_code_3, C.DEPT_NAME AS dept_name_3,Data0006.PROD_STATUS, 
		  Data0039.REJ_CODE, Data0039.REJECT_DESCRIPTION, Data0050.LAYERS, 
		  Data0050.CUSTOMER_PART_NUMBER, Data0008.PRODUCT_NAME,data0008.PROD_CODE,
          isnull(data0050.latest_price,0) as latest_price,
		  Data0050.CP_REV, Data0025.MANU_PART_NUMBER, 
		  Data0005.EMPLOYEE_NAME, A.EMPLOYEE_NAME AS auditor, 	   
		  Data0047_1.Parameter_Desc AS NetParameter_Desc,Data0015.WAREHOUSE_NAME,data0015.Abbr_name as Abbr_name_15,
		  Data0010.ABBR_NAME, Data0010.CUST_CODE,DATA0058.status as status_58 ,data0025.parent_ptr,data0058.remark,
		  data0058.remark_matl,data0058.remark_matl_desc,data0058.remark_resp_people
		   ,round(data0050.LATEST_PRICE/(1+data0050.last_state_tax),4) as price_notax  --本币无税单价20130509 LLL 
		  ,round(data0050.LATEST_PRICE/(1+data0050.last_state_tax)*(Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),2) as amount_notax  --本币无税金额20130509 LLL 
		  
	FROM data0492 RIGHT OUTER JOIN
		  Data0058 left JOIN
		  Data0158 ON Data0058.MRB_PTR = Data0158.RKEY INNER JOIN
		  Data0039 ON Data0058.REJECT_PTR = Data0039.RKEY INNER JOIN
		  Data0006 ON Data0058.WO_PTR = Data0006.RKEY INNER JOIN
		  Data0025 ON Data0006.BOM_PTR = Data0025.RKEY INNER JOIN
		  Data0050 ON Data0025.ANCESTOR_PTR = Data0050.RKEY INNER JOIN
		  Data0015 ON 
		  Data0006.WHOUSE_PTR = Data0015.RKEY LEFT OUTER JOIN
		  #Data0047 Data0047_1 ON Data0025.RKEY = Data0047_1.SOURCE_POINTER LEFT OUTER JOIN
		  Data0034 ON Data0058.DEPT_PTR = Data0034.RKEY LEFT OUTER JOIN
		  Data0034 B ON Data0058.RESP_DEPT_PTR = B.RKEY LEFT OUTER JOIN
		  Data0034 C ON Data0058.now_dept_ptr = C.RKEY LEFT OUTER JOIN
		  Data0005 ON 
		  Data0058.EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
		  Data0005 A ON Data0058.AUDIT_EMPL_PTR = A.RKEY LEFT OUTER JOIN
		  Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY ON 
		  data0492.CUT_no = Data0006.CUT_no LEFT OUTER JOIN
		  Data0010 INNER JOIN
		  data0059 ON Data0010.RKEY = data0059.customer_ptr ON 
		  Data0050.RKEY = data0059.cust_part_ptr AND 
		  data0492.CUSTOMER_PTR = data0059.customer_ptr' 
      SET @sql2 = @sql2 + ' where  (data0058.ttype<>10) and  (data0058.ttype<>11) '  -- 不包括成品报废 20130620 仁创艺要求 LLL             '
	  SET @sql2 = @sql2 + ' and  Data0058.tdatetime  >= '''+@VDATE1+''''--时间过滤
	  SET @sql2 = @sql2 +' and  Data0058.tdatetime  <= '''+@VDATE2+''''--时间过滤
	  if @Radiogroup1ItemIndex2=0 
	  SET @sql2 = @sql2 +'and isnull(Data0158.STATUS,2) = 2'
	  if @Radiogroup1ItemIndex2=1
	  SET @sql2 = @sql2 +'and isnull(Data0158.STATUS,2) <> 2 ' 
      if @PDflag<>0 
      SET @sql2 = @sql2+'  and (Data0058.reject_ptr<>(select custfedship from data0192)) and (Data0058.reject_ptr<>(select CUSTFEDSHIP_loss from data0192)) '  --不包括盘点报废20130515 
      
    
      if @PROD_rkey <> '0'
       set @sql2=@sql2+' AND DATA0008.rkey in ('+ convert(varchar(20), @PROD_rkey) +')' --改产品类别指针 20130806 LLL 

     if @whse_ptr<>0 
       set @sql2=@sql2+' AND data0006.WHOUSE_PTR = '+ convert(varchar(20),@whse_ptr)  --加工厂指针 20130828 LLL 

      --排序字段改成后台 LLL 20120717 惠州奥士康要求按此顺序
      SET @sql2 = @sql2 +'  ORDER BY Data0058.MRB_NO,Data0058.TDATETIME,Data0025.MANU_PART_NUMBER,data0050.customer_part_number ' 

	END
If @vtp='P'
	BEGIN
	 set @sql2 =@sql2 + 'SELECT Data0058.RKEY,Data0158.RKEY as RKEY_158, Data0058.MRB_NO, Data0058.WO_PTR, isnull(data0158.status,2) as status,
		  Data0058.TRAN_PTR, Data0058.DEPT_PTR, Data0058.REJECT_PTR,Data0492.so_no,Data0058.BOM_PTR, '  
	 if @flag=1 
	 begin
	   SET @sql2 = @sql2 + ' round((cast(Data0058.QTY_ORG_REJ as float)/isnull(Data0025.parts_num,1)),4) AS QTY_ORG_REJ, 
		  round((Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4) AS QTY_REJECT, 
          round((Data0058.SETS_QTY/isnull(Data0025.parts_num,1)),4) AS SETS_QTY,
		  round((Data0058.PANELS/isnull(Data0025.parts_num,1)),4) AS PANELS_2, 
		  round(Data0047_1.PARAMETER_VALUE * (Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),4) AS NetArea,
		  round((CAST(data0492.ISSUED_QTY AS FLOAT)/isnull(Data0025.parts_num,1)),4) as ISSUED_QTY, '
	 end
	 else
	 begin
	   SET @sql2 = @sql2 + ' cast(Data0058.QTY_ORG_REJ as float) AS QTY_ORG_REJ,Data0058.QTY_REJECT,Data0058.SETS_QTY, 
		  Data0058.PANELS AS PANELS_2,Data0047_1.PARAMETER_VALUE * Data0058.QTY_REJECT AS NetArea,
		  CAST(data0492.ISSUED_QTY AS FLOAT) as ISSUED_QTY, '
	 end	  		  
	 SET @sql2 = @sql2 + '	  
		  Data0058.FLOW_NO, Data0058.STEP, Data0058.EMPL_PTR,Data0050.eng_tp,
		  Data0058.TDATETIME, Data0058.AUDIT_EMPL_PTR,Data0058.TTYPE,  
		  Data0058.AUDIT_DATETIME, Data0058.RESP_DEPT_PTR,Data0058.REFERENCE, 
		  Data0006.WORK_ORDER_NUMBER, data0059.customer_part_desc, 
		  Data0034.DEPT_CODE AS DEPT_CODE_2, Data0034.DEPT_NAME, 
		  B.DEPT_CODE AS dept_code_1, B.DEPT_NAME AS dept_name_1,
		  C.DEPT_CODE AS dept_code_3, C.DEPT_NAME AS dept_name_3, 
		  Data0006.PROD_STATUS, Data0039.REJ_CODE,Data0039.REJECT_DESCRIPTION, Data0050.LAYERS, 
		  Data0050.CUSTOMER_PART_NUMBER, Data0008.PRODUCT_NAME,data0008.PROD_CODE,
          isnull(data0050.latest_price,0) as latest_price,
		  Data0050.CP_REV, Data0025.MANU_PART_NUMBER, 
		  Data0005.EMPLOYEE_NAME, A.EMPLOYEE_NAME AS auditor,   
		  Data0047_1.Parameter_Desc AS NetParameter_Desc,Data0015.WAREHOUSE_NAME,data0015.Abbr_name  as Abbr_name_15,
		  Data0010.ABBR_NAME, Data0010.CUST_CODE,DATA0058.status as status_58,data0025.parent_ptr,data0058.remark,
		  data0058.remark_matl,data0058.remark_matl_desc,data0058.remark_resp_people
	      ,round(data0050.LATEST_PRICE/(1+data0050.last_state_tax),4) as price_notax  --本币无税单价20130509 LLL 
		  ,round(data0050.LATEST_PRICE/(1+data0050.last_state_tax)*(Data0058.QTY_REJECT/isnull(Data0025.parts_num,1)),2) as amount_notax  --本币无税金额20130509 LLL  
	FROM data0492 RIGHT OUTER JOIN
		  Data0058 left JOIN
		  Data0158 ON Data0058.MRB_PTR = Data0158.RKEY INNER JOIN
		  Data0039 ON Data0058.REJECT_PTR = Data0039.RKEY INNER JOIN
		  Data0006 ON Data0058.WO_PTR = Data0006.RKEY INNER JOIN
		  Data0025 ON Data0006.BOM_PTR = Data0025.RKEY INNER JOIN
		  Data0050 ON Data0025.ANCESTOR_PTR = Data0050.RKEY INNER JOIN
		  Data0015 ON 
		  Data0006.WHOUSE_PTR = Data0015.RKEY LEFT OUTER JOIN
		  #Data0047 Data0047_1 ON Data0025.RKEY = Data0047_1.SOURCE_POINTER LEFT OUTER JOIN
		  Data0034 ON Data0058.DEPT_PTR = Data0034.RKEY LEFT OUTER JOIN
		  Data0034 B ON Data0058.RESP_DEPT_PTR = B.RKEY LEFT OUTER JOIN
		  Data0034 C ON Data0058.now_dept_ptr = C.RKEY LEFT OUTER JOIN
		  Data0005 ON 
		  Data0058.EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
		  Data0005 A ON Data0058.AUDIT_EMPL_PTR = A.RKEY LEFT OUTER JOIN
		  Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY ON 
		  data0492.CUT_no = Data0006.CUT_no LEFT OUTER JOIN
		  Data0010 INNER JOIN
		  data0059 ON Data0010.RKEY = data0059.customer_ptr ON 
		  Data0050.RKEY = data0059.cust_part_ptr AND 
		  data0492.CUSTOMER_PTR = data0059.customer_ptr' 

      SET @sql2 = @sql2 + ' where  (data0058.ttype<>10) and  (data0058.ttype<>11) '  -- 不包括成品报废 20130620 仁创艺要求 LLL 
	  SET @sql2 = @sql2 + ' and Data0058.tdatetime  >= '''+@VDATE1+''''--时间过滤
	  SET @sql2 = @sql2 +' and  Data0058.tdatetime  <= '''+@VDATE2+''''--时间过滤
	  if @Radiogroup1ItemIndex2=0 
	  SET @sql2 = @sql2 +'and isnull(Data0158.STATUS,2) = 2'
	  if @Radiogroup1ItemIndex2=1
	  SET @sql2 = @sql2 +'and isnull(Data0158.STATUS,2) <> 2'

      if @PDflag<>0 
      SET @sql2 = @sql2+'  and (Data0058.reject_ptr<>(select custfedship from data0192)) and (Data0058.reject_ptr<>(select CUSTFEDSHIP_loss from data0192)) '  --不包括盘点报废20130515 

        if @PROD_rkey <> '0'
       set @sql2=@sql2+' AND DATA0008.rkey in ('+ convert(varchar(20), @PROD_rkey) +')' --改产品类别指针 20130806 LLL 

       if @whse_ptr<>0 
       set @sql2=@sql2+' AND data0006.WHOUSE_PTR = '+ convert(varchar(20),@whse_ptr)  --加工厂指针 20130828 LLL 


     --排序字段改成后台 LLL 20120717 惠州奥士康要求按此顺序
      SET @sql2 = @sql2 +'  ORDER BY Data0058.MRB_NO,Data0058.TDATETIME,Data0025.MANU_PART_NUMBER,data0050.customer_part_number '

	--  SET @sql2 = @sql2 +@orderbyField--data0050.customer_part_number'
	  --PRINT @sql2
	END

  exec (@sql2)

  print(@sql2)
END
go