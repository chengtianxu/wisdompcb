
if exists (select * from sysobjects where id = object_id(N'wzcx56') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop PROCEDURE wzcx56
GO



CREATE PROCEDURE wzcx56
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
    set @sql=@sql+'SELECT data0060.rkey,'
       +' Data0025.MANU_PART_NUMBER,' --本厂编号　
       -- +' Data0050.CP_REV,' --版本
       +' Data0025.MANU_PART_DESC,'--客户型号 
       +' Data0060.ENT_DATE,' --订单输入日期
       +' Data0060.SCH_DATE,' --回复交期
       --+' Data0010.CUST_CODE,' --客户代码
       --+' Data0010.CUSTOMER_NAME,' --客户名称
       --+' Data0010.ABBR_NAME,' --客户简称
       +' Data0005_1.EMPLOYEE_NAME AS ENAME60,' --订单输入人
       +' Data0005.EMPLOYEE_NAME AS ENAME492,' --投产人
       +' Data0060.PARTS_ORDERED,'--pcs数量
       +' Data0060.set_ordered,'--set数量
       +' Data0060.PARTS_SHIPPED,' --已装运的数量 
       +' Data0060.PARTS_RETURNED,' --已退回的数量
       +' Data0060.PARTS_ALLOC,' --已分配的数量
       +' Data0060.PARTS_INVOICED,' --已开发票数量
       +' Data0060.FOB,' --合同号

       +' data0492.CUT_NO,' --投料单号
       +' data0492.ISSUE_DATE,' --投产日期
       +' data0492.ISSUED_QTY,'--投产数量


       +' Data0060.SALES_ORDER,' --订单号
       +' Data0060.STATUS,' --订单状态
       +' Data0097.PO_NUMBER' --客户订单号

           +' ,CASE WHEN (Data0025.PARENT_PTR = 0) or (Data0025.PARENT_PTR is null) THEN Data0025.MANU_PART_NUMBER '
            +' else  '
                +' case WHEN (Data0025_1.PARENT_PTR = 0) or (Data0025_1.PARENT_PTR is null) THEN Data0025_1.MANU_PART_NUMBER '
                     +' else Data0025_2.MANU_PART_NUMBER  '
                     +' END'
            +' end AS partMANU_PART_NUMBER'
            +' , CASE WHEN (Data0025.PARENT_PTR = 0) or (Data0025.PARENT_PTR is null) THEN Data0025.MANU_PART_DESC '
            +' else  '
                +' case WHEN (Data0025_1.PARENT_PTR = 0) or (Data0025_1.PARENT_PTR is null) THEN Data0025_1.MANU_PART_DESC '
                     +' else Data0025_2.MANU_PART_DESC  '
                     +' END'
            +' end AS CUSTOMER_PART_DESC'
            +' , CASE WHEN (Data0025.PARENT_PTR = 0) or (Data0025.PARENT_PTR is null) THEN Data0010.CUST_CODE'
            +' else  '
                +' case WHEN (Data0025_1.PARENT_PTR = 0) or (Data0025_1.PARENT_PTR is null) THEN Data0010.CUST_CODE'
                     +' else Data0010.CUST_CODE  '
                     +' END'
            +' end AS CUST_CODE'
            +' , CASE WHEN (Data0025.PARENT_PTR = 0) or (Data0025.PARENT_PTR is null) THEN Data0010.CUSTOMER_NAME'
            +' else  '
                +' case WHEN (Data0025_1.PARENT_PTR = 0) or (Data0025_1.PARENT_PTR is null) THEN Data0010.CUSTOMER_NAME'
                     +' else Data0010.CUSTOMER_NAME  '
                     +' END'
            +' end AS CUSTOMER_NAME'
           +'  , CASE WHEN (Data0025.PARENT_PTR = 0) or (Data0025.PARENT_PTR is null) THEN Data0010.ABBR_NAME'
            +' else  '
                +' case WHEN (Data0025_1.PARENT_PTR = 0) or (Data0025_1.PARENT_PTR is null) THEN Data0010.ABBR_NAME'
                     +' else Data0010.ABBR_NAME  '
                     +' END'
            +' end AS ABBR_NAME'
            +' ,data0008.PRODUCT_NAME'

 +' FROM Data0010 Data0010_2 INNER JOIN Data0025 Data0025_2 ON '
       +' Data0010_2.RKEY = Data0025_2.CUSTOMER_PTR RIGHT OUTER JOIN'
       +' Data0010 Data0010_1 INNER JOIN Data0025 Data0025_1 ON '
       +' Data0010_1.RKEY = Data0025_1.CUSTOMER_PTR RIGHT OUTER JOIN'
       +' Data0025 INNER JOIN Data0005 INNER JOIN'
       +' data0492 ON Data0005.RKEY = data0492.CREATED_BY_PTR ON '
       +' Data0025.RKEY = data0492.BOM_PTR INNER JOIN'
       +' Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY LEFT OUTER JOIN'
       +' Data0008 ON Data0025.PROD_CODE_PTR = Data0008.RKEY ON '
       +' Data0025_1.RKEY = Data0025.PARENT_PTR ON '
       +' Data0025_2.RKEY = Data0025_1.PARENT_PTR LEFT OUTER JOIN'
       +' Data0060 ON data0492.SO_NO = Data0060.SALES_ORDER LEFT OUTER JOIN'
       +' Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY LEFT OUTER JOIN'
       +' Data0005 Data0005_1 ON Data0060.ENTERED_BY_EMPL_PTR = Data0005_1.RKEY'

/*  +' FROM Data0025 RIGHT OUTER JOIN'
      +' Data0097 RIGHT OUTER JOIN'
      +' Data0060 ON' 
      +' Data0097.RKEY = Data0060.PURCHASE_ORDER_PTR LEFT OUTER JOIN'
      +' Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY ON' 
      +' Data0025.RKEY = Data0060.CUST_PART_PTR LEFT OUTER JOIN'
      +' Data0005 Data0005_1 ON' 
      +' Data0060.ENTERED_BY_EMPL_PTR = Data0005_1.RKEY RIGHT OUTER JOIN'
      +' Data0005 INNER JOIN'
      +' data0492 ON Data0005.RKEY = data0492.CREATED_BY_PTR ON' 
      +' Data0060.SALES_ORDER = data0492.SO_NO'
*/

      +' where data0492.ISSUE_DATE>= '''+@ISSUE_DATE1+''''
      +' and data0492.ISSUE_DATE<= '''+@ISSUE_DATE2+''''
      
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



CREATE PROCEDURE wzcx56;2
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




CREATE PROCEDURE wzcx56;3
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

CREATE PROCEDURE wzcx56;4
--with encryption
AS
begin
  select DISTINCT sales_order from data0060 where sales_order<>''
end
go

CREATE PROCEDURE wzcx56;5
--with encryption
AS
begin
  select DISTINCT CUT_NO from data0492 where CUT_NO<>''
end
go

CREATE PROCEDURE wzcx56;6
--with encryption
AS
begin
  select DISTINCT MANU_PART_NUMBER from data0025
           where MANU_PART_NUMBER<>''
              and ((PARENT_PTR = 0) or (PARENT_PTR is null))
end
go

CREATE PROCEDURE wzcx56;7
--with encryption
AS
begin
  select DISTINCT MANU_PART_DESC from data0025
         where MANU_PART_DESC<>''
          and ((PARENT_PTR = 0) or (PARENT_PTR is null))
end
go

CREATE PROCEDURE wzcx56;8
--with encryption
AS
begin
  select DISTINCT CUST_CODE from data0010 where CUST_CODE<>''
end
go


CREATE PROCEDURE wzcx56;9
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

CREATE PROCEDURE wzcx56;10
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

CREATE PROCEDURE wzcx56;11
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


CREATE PROCEDURE wzcx56;12
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


CREATE PROCEDURE wzcx56;13
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
--select * from #table_a1

--drop table #table_a1

/*
--描述
 SELECT a.[value] AS 描述,b.name AS 字段名, c.name AS 表名, a.smallid
 into #a2
 FROM sysproperties a INNER JOIN
      syscolumns b ON a.id = b.id AND a.smallid = b.colid INNER JOIN
      sysobjects c ON b.id = c.id
 WHERE (a.type = 4)

 insert into #a2(描述,字段名,表名,smallid)
 SELECT a.[value] AS Expr2, '' AS Expr3, d.name AS Expr1, a.smallid
 FROM sysproperties a INNER JOIN
      sysobjects d ON a.id = d.id
 WHERE (a.type = 3)

 select 表名,字段名,描述 from #a2 where 表名 in ('data0060','data0492','data0048') order by 表名,smallid

 drop table #a2



--select * from data0419 where description like '新特殊%'

SELECT *
FROM Data0419
WHERE (parent_ptr = 94) AND (ANCESTOR_PTR = 87) 

--select * from data0419 where ancestor_ptr=70 and parent_ptr=77 order by seq_no 
*/