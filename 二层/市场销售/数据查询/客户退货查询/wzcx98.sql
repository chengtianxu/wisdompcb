
if exists (select * from sysobjects where id = object_id(N'[dbo].[wzcx98]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  drop PROCEDURE wzcx98
GO


CREATE PROCEDURE wzcx98
  @wher1 varchar(100),
  @wher2 varchar(100),
  @wher3 varchar(100),
  @wher4 varchar(100),
  @wher5 varchar(100),
  @wher6 varchar(100),
  @wher7 varchar(100),

  @ISSUE_DATE1 varchar(20),
  @ISSUE_DATE2 varchar(20),
  @finished int , --是否完成
  @so_tp int, --自制,外发,半制程,全部
  @vrkey278 int  --参数指针

--with encryption
AS
begin
  set @ISSUE_DATE1 =ltrim(rtrim(@ISSUE_DATE1))
  set @ISSUE_DATE2 =ltrim(rtrim(@ISSUE_DATE2))
  declare @sql varchar(4000) 
  set @sql=''

   declare @sql3 varchar(1000)
   set @sql3=ltrim(rtrim(@wher1))+' '+ltrim(rtrim(@wher2))+' '+ltrim(rtrim(@wher3))+' '+ltrim(rtrim(@wher4))+' '
             +ltrim(rtrim(@wher5))+' '+ltrim(rtrim(@wher6))+' '+ltrim(rtrim(@wher7))           




     set @sql=@sql+'SELECT Data0098.RMA_NUMBER,'   --退货单号码
                        +' Data0010.CUST_CODE,'    --客户代码
                        +' Data0010.abbr_name,'   --客户
                        +' Data0025.MANU_PART_DESC,'  --客户型号
                        +' Data0025.MANU_PART_NUMBER,'  --本厂编号
                        -- +' Data0050.CP_REV,'   --
                        +' Data0060.SALES_ORDER,'  --订单号码
                        +' Data0098.RMA_DATE,'   --退货日期
                        +' Data0098.QTY_AUTH,'   --计划退回
                        +' Data0098.QTY_RECD,'   --已接收
                        --+' Data0098.QTY_REMAKED,'   ---已补料
                        --+' Data0098.QTY_REWORKED,'   --已返工
                        --+' Data0098.QTY_SCRAP,'  --报废数量
                        --+' Data0098.QTY_TO_MOVE_FIN_GOOD,'   --好货
                        +' Data0060.PARTS_RETURNED - Data0060.RETURNED_SHIP AS to_be_ship,'  --欠货PCS

                        +' Data0005.EMPLOYEE_NAME,'   --录入者
                        +' Data0023.ABBR_NAME AS ABBR_NAME1,'  --外发厂
                        +' round((data0060.part_price / data0060.exch_rate),6) as price,' -- 单价（原币）
                        +' Data0001.CURR_NAME,' --货币
                        +' Data0008.PRODUCT_NAME,' --产品类别

                        +' Data0025.unit_sq as value,'  --单只面积
                        +' DATA0098.qty_recd*Data0025.unit_sq as ca'  --总面积  --统计入仓
                        +' ,case data0098.RMA_STATUS when 1 then ''未提交'' when 2 then ''待入仓'' when 3 then ''已入仓'' when 4 then ''已充帐'' end as MyRMA_STATUS'
                        +' ROUND(DATA0098.qty_recd*Data0025.REPORT_UNIT_VALUE1*0.0001,4) as cw'--总重量
                    +' FROM Data0023 RIGHT OUTER JOIN'  
                        +' Data0060 LEFT OUTER JOIN'  
                        +' Data0001 ON '  
                        +' Data0060.CURRENCY_PTR = Data0001.RKEY RIGHT OUTER JOIN'  
                        +' Data0008 INNER JOIN'  
                        +' Data0098 INNER JOIN'  
                        +' Data0005 ON '  
                        +' Data0098.AUTH_BY_EMPL_PTR = Data0005.RKEY INNER JOIN'  
                        +' Data0025 ON Data0098.CUSTOMER_PART_PTR = Data0025.RKEY ON '  
                        +' Data0008.RKEY = Data0025.PROD_CODE_PTR INNER JOIN'  
                        +' Data0010 ON Data0098.CUSTOMER_PTR = Data0010.RKEY ON '  
                        +' Data0060.RKEY = Data0098.SO_PTR ON '  
                        +' Data0023.RKEY = Data0060.supplier_ptr'  



                   + ' WHERE rma_date>='''+@ISSUE_DATE1+''''
                           + ' and rma_date<='''+@ISSUE_DATE2+''''




         if @finished = 0
           select @sql = @sql + ' and data0060.status = 1 and data0060.parts_returned-data0060.returned_ship>0'
         else if @finished = 1
           select @sql = @sql + ' and data0060.parts_returned-data0060.returned_ship=0' 


         if @so_tp <> 3
            set @sql=@sql+' and data0060.so_tp='+cast(@so_tp as varchar(1))  
         if ltrim(rtrim(@sql3))<>'' 
            set @sql=@sql+ltrim(rtrim(@sql3))


  --select @sql
  --print @sql3
  --print @sql
  --print len(@sql)
  exec(@sql)
end
go



CREATE PROCEDURE wzcx98;2
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




CREATE PROCEDURE wzcx98;3
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

CREATE PROCEDURE wzcx98;4 --查找有退货的订单号
--with encryption
AS
begin
  SELECT DISTINCT Data0060.SALES_ORDER
  FROM Data0060 INNER JOIN
      Data0098 ON Data0060.RKEY = Data0098.SO_PTR
  WHERE (Data0060.SALES_ORDER <> '')

  --select DISTINCT sales_order from data0060 where sales_order<>''
end
go

CREATE PROCEDURE wzcx98;5
--with encryption
AS
begin
  select DISTINCT CUT_NO from data0492 where CUT_NO<>''
end
go

CREATE PROCEDURE wzcx98;6
--with encryption
AS
begin
  SELECT DISTINCT Data0025.MANU_PART_NUMBER  --, Data0050.CP_REV
  FROM Data0025 INNER JOIN
       Data0098 ON 
       Data0025.RKEY = Data0098.CUSTOMER_PART_PTR
  WHERE (Data0025.MANU_PART_NUMBER <> '') --AND (Data0025.CP_REV <> '')
  --select DISTINCT CUSTOMER_PART_NUMBER,CP_REV from data0050 where CUSTOMER_PART_NUMBER<>'' and CP_REV<>''
end
go

CREATE PROCEDURE wzcx98;7  --查找退货的客户型号
--with encryption
AS
begin
  SELECT DISTINCT Data0025.MANU_PART_DESC
  FROM Data0025 INNER JOIN
      Data0098 ON 
      Data0025.RKEY = Data0098.CUSTOMER_PART_PTR
  WHERE (Data0025.MANU_PART_DESC <> '')

  --select DISTINCT CUSTOMER_PART_DESC from data0050 where CUSTOMER_PART_DESC<>''
end
go

CREATE PROCEDURE wzcx98;8 --查找客户代码,只有退货的客户才显示
--with encryption
AS
begin
  SELECT DISTINCT Data0010.CUST_CODE, Data0010.ABBR_NAME
  FROM Data0010 INNER JOIN
      Data0098 ON Data0010.RKEY = Data0098.CUSTOMER_PTR
  WHERE (Data0010.CUST_CODE <> '')
  --select DISTINCT CUST_CODE from data0010 where CUST_CODE<>''
end
go

CREATE PROCEDURE wzcx98;9
--with encryption
AS
begin
  select DISTINCT INV_PART_NUMBER,INV_PART_DESCRIPTION from data0017  where INV_PART_NUMBER<>''
end
go

CREATE PROCEDURE wzcx98;10
--with encryption
AS
begin
  select DISTINCT CODE,REJECT_DESCRIPTION from data0076 where CODE<>''
  union all
  SELECT   '盘点','盘点'
end
go

CREATE PROCEDURE wzcx98;11 --选择工程中的基本单位
--with encryption
AS
begin
  SELECT Data0278.RKEY, Data0278.PARAMETER_NAME, 
      Data0278.PARAMETER_DESC, Data0278.Prod_Unit_base
  FROM Data0277 INNER JOIN
      Data0278 ON Data0277.RKEY = Data0278.CATEGORY_PTR
  WHERE (Data0277.CATEGORY_TYPE = 1)  and (Data0278.Prod_Unit_base='P')
end
go

CREATE PROCEDURE wzcx98;12 --选择报废单号
--with encryption
AS
begin
  SELECT RMA_NUMBER
  FROM data0098
  WHERE (RMA_NUMBER <> '' )
end
go

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
/*

 select 'set @tabl2='''+表名 +'''' as a1,'set @column2='''+字段名+'''' as a2,
'set @Description2='''+ltrim(rtrim(convert(varchar(1000),描述)))+'''' as a3,
'set @smallid2='''+ltrim(rtrim(convert(varchar(10),smallid)))+'''' as a4 
 from #a2 where 表名 in ('data0445','data0448','data0449','data0459','data0442','data0447','data0446','data0372','data0454','data0453','data0421','data0422','data0452','data0441','data0411','data0410','data0464')
 order by 表名,smallid 
*/
 drop table #a2



select * from data0419 where description like '%退货%'

SELECT *, PROGRAME AS Expr1, ANCESTOR_PTR AS Expr2, PARENT_PTR AS Expr3, 
      SEQ_NO AS Expr4
FROM Data0419
WHERE (ANCESTOR_PTR = 70) AND (PARENT_PTR = 77)
ORDER BY SEQ_NO
*/
