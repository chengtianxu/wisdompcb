--CM开关查询
DECLARE 
	@STR VARCHAR(2000),
	@Separator VARCHAR(10)
	SET @STR='select ppc_control30,AssignSoNo,ENG_CONTROL25 ,data0195.allow_print_wo_flag,data0195.eng_press_instr_flag2,eng_press_instr_flag3,
data0195.eng_press_instr_flag,data0195.permit_modi_lot_pcs_flag,data0195.dept_para_disp_flag,data0195.bacode_flag3,
data0195.sfg_assign_flag,data0195.allow_print_wo_bf_assign,data0195.sfg_trans_flag,sfg_assign_flag,data0195.allow_print_wo_flag2,
data0192.IsAssignClose,data0195.sfg_over_assign_flag,data0192.report_location
 from data0195,data0192'
 
	SET @Separator=','
	SET @STR=UPPER(LTRIM(RTRIM(@STR)))
	--取字段
	IF CHARINDEX('SElECT',@STR)>0
	  SELECT @STR=SUBSTRING(@STR,7,LEN(@STR)-6)
	SET @STR=LTRIM(@STR) 
	IF CHARINDEX('FROM',@STR)>0  
	  SELECT @STR=SUBSTRING(@STR,1,CHARINDEX('FROM',@STR)-1)
	SET @STR=RTRIM(@STR) 
	
	If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp'))  drop table #tmp 
	CREATE TABLE #tmp 
   (
     [id] int identity(1,1),
     [value] nvarchar(100)
    )
	
     DECLARE @CurrentIndex int;
     DECLARE @NextIndex int;
     DECLARE @ReturnText nvarchar(max);
     SELECT @CurrentIndex=1;
    WHILE(@CurrentIndex<=len(@str))
         BEGIN
             SELECT @NextIndex=charindex(@Separator,@str,@CurrentIndex);
             IF(@NextIndex=0 OR @NextIndex IS NULL)
                 SELECT @NextIndex=len(@str)+1;
                 SELECT @ReturnText=substring(@str,@CurrentIndex,@NextIndex-@CurrentIndex);
                 IF charindex('.',@ReturnText)>0 
                 BEGIN
                 set	@ReturnText=SUBSTRING(@ReturnText,charindex('.',@ReturnText)+1,LEN(@ReturnText)-charindex('.',@ReturnText))
                 END
                 INSERT INTO #tmp([value]) VALUES(LTRIM(rtrim(@ReturnText)));
                 SELECT @CurrentIndex=@NextIndex+1;
             END	
	
		SELECT a.id ,a.VALUE AS fieldname ,
		fn.*
		FROM #tmp a
		left join dict.dbo.statval  fn ON a.[value]=fn.sname
