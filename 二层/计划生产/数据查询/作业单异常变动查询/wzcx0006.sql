
if exists (select * from sysobjects where id = object_id(N'wzcx0006') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop PROCEDURE wzcx0006
GO



CREATE PROCEDURE wzcx0006
  @wher1 varchar(100),
  @wher2 varchar(100),
  @wher3 varchar(100),
  @wher4 varchar(100),
  @wher5 varchar(100),
  @wher6 varchar(100),
  @wher7 varchar(100),

  @ISSUE_DATE1 varchar(20),
  @ISSUE_DATE2 varchar(20),
  @if1 int --0无条件，1有条件
--with encryption
AS
begin
  set @ISSUE_DATE1 =ltrim(rtrim(@ISSUE_DATE1))   --+' 00:00:00'
  set @ISSUE_DATE2 =ltrim(rtrim(@ISSUE_DATE2))   --  +' 23:59:59'
  declare @sql varchar(4000) 
  set @sql=''
    set @sql=@sql+'SELECT Data0006.WORK_ORDER_NUMBER, Data0025.MANU_PART_NUMBER, '
            +' Data0025.MANU_PART_DESC,  '
            --+' Data0011.NOTE_PAD_LINE_1, '
            --+' Data0011.NOTE_PAD_LINE_2, Data0011.NOTE_PAD_LINE_3, Data0011.NOTE_PAD_LINE_4,'
            +'  Data0005.EMPLOYEE_NAME, '
            +' Data0117.TDATE, Data0117.SOURCE_PTR,Data0117.[ACTION],Data0117.remark '
            +' ,Data0010.CUST_CODE, Data0010.ABBR_NAME,Data0010.CUSTOMER_NAME'
/*      +' FROM Data0005 INNER JOIN'
            +' Data0117 ON Data0005.RKEY = Data0117.EMPL_PTR INNER JOIN'
            +' Data0011 ON Data0117.NOTEPAD_PTR = Data0011.RKEY INNER JOIN'
            +' Data0025 INNER JOIN'
            +' Data0006 ON Data0025.RKEY = Data0006.BOM_PTR INNER JOIN'
            +' Data0050 ON Data0025.ANCESTOR_PTR = Data0050.RKEY ON '
            +' Data0117.SOURCE_PTR = Data0006.RKEY INNER JOIN '
            +' Data0010 ON Data0050.CUSTOMER_PTR = Data0010.RKEY '
*/
/*      +' FROM Data0005 INNER JOIN '
            +' Data0117 ON Data0005.RKEY = Data0117.EMPL_PTR INNER JOIN '
            +' Data0011 ON Data0117.NOTEPAD_PTR = Data0011.RKEY INNER JOIN '
            +' Data0025 INNER JOIN '
            +' Data0006 ON Data0025.RKEY = Data0006.BOM_PTR ON ' 
            +' Data0117.SOURCE_PTR = Data0006.RKEY INNER JOIN '
            +' Data0010 ON ' 
            +' Data0025.CUSTOMER_PTR = Data0010.RKEY '--LEFT OUTER JOIN '
*/
            --+' Data0025 Data0025_1 ON '
            --+' (Data0025.PARENT_PTR = Data0025_1.RKEY and ((Data0025.PARENT_PTR = 0) or (Data0025.PARENT_PTR is null))) '

      +' FROM Data0005 INNER JOIN'
            +' Data0117 ON Data0005.RKEY = Data0117.EMPL_PTR INNER JOIN'
            +' Data0025 INNER JOIN'
            +' Data0006 ON Data0025.RKEY = Data0006.BOM_PTR ON' 
            +' Data0117.SOURCE_PTR = Data0006.RKEY INNER JOIN'
            +' Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY'

      +' WHERE (Data0117.SOURCE_TYPE = 2)'

      +' and Data0117.TDATE>= '''+@ISSUE_DATE1+''''
      +' and Data0117.TDATE<= '''+@ISSUE_DATE2+''''
      
--以上为已投产的订单

   declare @sql3 varchar(1000)
   set @sql3=ltrim(rtrim(@wher1))+' '+ltrim(rtrim(@wher2))+' '+ltrim(rtrim(@wher3))+' '+ltrim(rtrim(@wher4))+' '
             +ltrim(rtrim(@wher5))+' '+ltrim(rtrim(@wher6))+' '+ltrim(rtrim(@wher7))           
  if @if1=1
  begin
    if ltrim(rtrim(@sql3))<>'' 
      set @sql=@sql+ltrim(rtrim(@sql3))
  end

  --print @sql3
  print @sql
  --print len(@sql)
  exec(@sql)
end
go



CREATE PROCEDURE wzcx0006;2
  @rkey0006 int
--with encryption
AS
begin
 SELECT AVG(DATEDIFF(hh,Data0048.INTIME,Data0048.OUTTIME)) as hours, --平均停留小时
       AVG(DATEDIFF(mi,Data0048.INTIME,Data0048.OUTTIME)) as minutes, --平均停留分钟
       AVG(Data0048.QTY_PROD) as QTY_PROD,  --平均产出数量（PCS）
      FrData0034.DEPT_CODE AS frDEPT_CODE, --从部门代码
      FrData0034.DEPT_NAME AS frDEPT_NAME, --从部门名称
      case when data0048.TO_DEPT_PTR is null then '' else  ToData0034.DEPT_CODE end AS toDEPT_CODE, --到部门代码
      case when data0048.TO_DEPT_PTR is null then '仓库' else  ToData0034.DEPT_NAME end AS toDEPT_NAME --到部门名称
 FROM Data0034 ToData0034 RIGHT OUTER JOIN
      Data0034 Data0034_2 ON 
      ToData0034.RKEY = Data0034_2.DEPT_PTR RIGHT OUTER JOIN
      data0492 INNER JOIN
      Data0006 ON data0492.CUT_NO = Data0006.CUT_NO INNER JOIN
      Data0048 ON Data0006.RKEY = Data0048.WO_PTR INNER JOIN
      Data0060 ON data0492.SO_NO = Data0060.SALES_ORDER INNER JOIN
      Data0034 ON Data0048.FM_DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0034 FrData0034 ON Data0034.DEPT_PTR = FrData0034.RKEY ON 
      Data0034_2.RKEY = Data0048.TO_DEPT_PTR

where data0060.rkey=@rkey0006
group by FrData0034.DEPT_CODE,FrData0034.DEPT_NAME,
      case when data0048.TO_DEPT_PTR is null then '' else  ToData0034.DEPT_CODE end, --到部门代码
      case when data0048.TO_DEPT_PTR is null then '仓库' else  ToData0034.DEPT_NAME end --到部门名称
end
go




CREATE PROCEDURE wzcx0006;3
  @rkey0006 int
--with encryption
AS
begin
 SELECT data0060.rkey,
       data0006.WORK_ORDER_NUMBER, --作业单号　　
       --Data0048.FM_DEPT_PTR , 
       --Data0048.TO_DEPT_PTR, 
       Data0048.INTIME, 
       Data0048.OUTTIME, 
       DATEDIFF(hh,Data0048.INTIME,Data0048.OUTTIME) as hours,--停留小时
       DATEDIFF(mi,Data0048.INTIME,Data0048.OUTTIME) as minutes,--停留分钟


       Data0048.QTY_PROD,  --产出数量


      FrData0034.DEPT_CODE AS frDEPT_CODE, --从部门代码
      FrData0034.DEPT_NAME AS frDEPT_NAME, --从部门名称
      case when data0048.TO_DEPT_PTR is null then '' else  ToData0034.DEPT_CODE end AS toDEPT_CODE, --到部门代码
      case when data0048.TO_DEPT_PTR is null then '仓库' else  ToData0034.DEPT_NAME end AS toDEPT_NAME --到部门名称
 FROM Data0034 ToData0034 RIGHT OUTER JOIN
      Data0034 Data0034_2 ON 
      ToData0034.RKEY = Data0034_2.DEPT_PTR RIGHT OUTER JOIN
      data0492 INNER JOIN
      Data0006 ON data0492.CUT_NO = Data0006.CUT_NO INNER JOIN
      Data0048 ON Data0006.RKEY = Data0048.WO_PTR INNER JOIN
      Data0060 ON data0492.SO_NO = Data0060.SALES_ORDER INNER JOIN
      Data0034 ON Data0048.FM_DEPT_PTR = Data0034.RKEY INNER JOIN
      Data0034 FrData0034 ON Data0034.DEPT_PTR = FrData0034.RKEY ON 
      Data0034_2.RKEY = Data0048.TO_DEPT_PTR

 where data0060.rkey=@rkey0006
end 
go

CREATE PROCEDURE wzcx0006;4
--with encryption
AS
begin
  select DISTINCT sales_order from data0060 where sales_order<>''
end
go

CREATE PROCEDURE wzcx0006;5
--with encryption
AS
begin
  select DISTINCT CUT_NO from data0492 where CUT_NO<>''
end
go

CREATE PROCEDURE wzcx0006;6
--with encryption
AS
begin
  select DISTINCT MANU_PART_NUMBER from data0025
     where MANU_PART_NUMBER<>'' 
       --and ((PARENT_PTR = 0) or (PARENT_PTR is null))
end
go

CREATE PROCEDURE wzcx0006;7
--with encryption
AS
begin
  select DISTINCT MANU_PART_DESC from data0025
    where MANU_PART_DESC<>''
       --and ((PARENT_PTR = 0) or (PARENT_PTR is null))
end
go

CREATE PROCEDURE wzcx0006;8
--with encryption
AS
begin
  select DISTINCT CUST_CODE from data0010 where CUST_CODE<>''
end
go


CREATE PROCEDURE wzcx0006;9
  @WO_PTR int 
--with encryption
AS
begin  --报废信息
  SELECT Data0039.REJECT_DESCRIPTION, Data0034.DEPT_NAME, 
      a.DEPT_NAME AS resp_dept_name, Data0058.QTY_REJECT, 
      Data0058.PANELS, Data0058.TDATETIME, 
      Data0005.EMPLOYEE_NAME
  FROM Data0005 INNER JOIN
      Data0039 INNER JOIN
      Data0058 ON Data0039.RKEY = Data0058.REJECT_PTR INNER JOIN
      Data0034 ON Data0058.DEPT_PTR = Data0034.RKEY ON 
      Data0005.RKEY = Data0058.EMPL_PTR LEFT OUTER JOIN
      Data0034 a ON Data0058.RESP_DEPT_PTR = a.RKEY
  /*FROM Data0034 a RIGHT OUTER JOIN
      Data0039 INNER JOIN
      Data0058 ON Data0039.RKEY = Data0058.REJECT_PTR INNER JOIN
      Data0034 ON Data0058.DEPT_PTR = Data0034.RKEY ON 
      a.RKEY = Data0058.RESP_DEPT_PTR*/
  WHERE (Data0058.WO_PTR = @WO_PTR)
end
go

CREATE PROCEDURE wzcx0006;10
  @WO_PTR int 
--with encryption
AS
begin  --入仓信息
  SELECT TOP 100 PERCENT Data0053.QUANTITY, Data0053.MFG_DATE, 
      Data0015.WAREHOUSE_NAME
  FROM Data0053 INNER JOIN
      Data0015 ON Data0053.WHSE_PTR = Data0015.RKEY
  WHERE (Data0053.WORK_ORDER_PTR =  @WO_PTR)
end
go

CREATE PROCEDURE wzcx0006;11
  @WO_PTR int 
--with encryption
AS
begin --流转信息
  SELECT Data0048.INTIME, D34B.DEPT_NAME, Data0048.OUTTIME, 
      Data0034.DEPT_NAME AS dptname, Data0048.QTY_PROD,
          (SELECT SUM(qty_reject)
                        FROM data0058 a
        		 GROUP BY wo_ptr, step, flow_no
        		 HAVING a.wo_ptr = data0048.wo_ptr AND a.step = data0048.step_no + 1 AND 
           		    a.flow_no = data0048.flow_no) AS QTY_REJECT, Data0048.PANELS, 
      Data0005.EMPLOYEE_NAME
  FROM Data0034 D34B RIGHT OUTER JOIN
      Data0048 LEFT OUTER JOIN
      Data0005 ON 
      Data0048.EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
      Data0034 ON Data0048.FM_DEPT_PTR = Data0034.RKEY ON 
      D34B.RKEY = Data0048.WORK_CENTER_PTR
  WHERE (Data0048.WO_PTR = @WO_PTR)
end
go


CREATE PROCEDURE wzcx0006;12
  @FLOW_NO int,
  @bom_ptr int 
--with encryption
AS  
begin  --MI流程
  SELECT TOP 100 PERCENT Data0038.STEP_NUMBER, Data0034.DEPT_CODE, 
      Data0034.DEPT_NAME AS dptname, Data0038.DEF_ROUT_INST, 
      Data0034.BARCODE_ENTRY_FLAG, Data0038.tooling_rev,data0038.rkey as rkey38
  FROM Data0038 INNER JOIN
      Data0034 ON Data0038.DEPT_PTR = Data0034.RKEY
  WHERE (Data0038.FLOW_NO = @FLOW_NO) AND (Data0038.SOURCE_PTR = @bom_ptr)
  ORDER BY Data0038.STEP_NUMBER
end
go


CREATE PROCEDURE wzcx0006;13
  @STEP_NUMBER int,
  @rkey38 int 
--with encryption
AS
begin
  SELECT Data0038.STEP_NUMBER, Data0034.DEPT_CODE, 
         Data0034.DEPT_NAME, Data0278.PARAMETER_NAME, 
         Data0278.PARAMETER_DESC, Data0002.UNIT_CODE, 
         Data0002.UNIT_NAME, Data0506.rkey,
         PARAMETER_VALUE=(select Data0494.PARAMETER_VALUE 
                              from data0494 
                              where Data0494.SOURCE_PTR = data0506.rkey
                                    and  Data0494.ROUTE_STEP_PTR = data0038.rkey
                          )
  FROM Data0506 INNER JOIN
       Data0038 ON 
       Data0506.SOURCE_PTR = Data0038.DEPT_PTR INNER JOIN
       Data0034 ON Data0038.DEPT_PTR = Data0034.RKEY INNER JOIN
       Data0278 ON 
       Data0506.PARAMETER_PTR = Data0278.RKEY INNER JOIN
       Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY
  WHERE (Data0506.ttype=3) and  (Data0038.rkey = @rkey38)  --哪个产品部件
         and (data0038.STEP_NUMBER = @STEP_NUMBER)
  ORDER BY data0506.seq_no --Data0038.STEP_NUMBER,
end
go

CREATE PROCEDURE wzcx0006;14 --查找作业单号
AS
begin
   select WORK_ORDER_NUMBER  from data0006
end
go
