
if exists (select * from sysobjects where id = object_id(N'[dbo].[wzcx96]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
  drop PROCEDURE wzcx96
GO


CREATE PROCEDURE wzcx96
  @wher1 varchar(100),
  @wher2 varchar(100),
  @wher3 varchar(100),
  @wher4 varchar(100),
  @wher5 varchar(100),
  @wher6 varchar(100),
  @wher7 varchar(100),

  @ISSUE_DATE1 varchar(20),
  @ISSUE_DATE2 varchar(20),
  @if1 int, --0无条件，1有条件
  @if2 int --1查报报废，2查退货 ０全部

--with encryption
AS
begin
  set @ISSUE_DATE1 =ltrim(rtrim(@ISSUE_DATE1))+' 00:00:00'
  set @ISSUE_DATE2 =ltrim(rtrim(@ISSUE_DATE2))+' 23:59:59'
  declare @sql varchar(4000) 
  set @sql=''

   declare @sql3 varchar(1000)
   set @sql3=ltrim(rtrim(@wher1))+' '+ltrim(rtrim(@wher2))+' '+ltrim(rtrim(@wher3))+' '+ltrim(rtrim(@wher4))+' '
             +ltrim(rtrim(@wher5))+' '+ltrim(rtrim(@wher6))+' '+ltrim(rtrim(@wher7))           

    set @sql=@sql+'select * from (SELECT Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION,' 
                         + 'Data0005.EMPLOYEE_NAME,  ''盘点'' as REJECT_DESCRIPTION,'
                       + ' Data0095.TRAN_DATE as TDATE, Data0095.QUANTITY as QUAN_REJD, Data0022.PRICE,1 as FLAG, ''报废'' as ttype'    
                     
                 + ' FROM Data0095 INNER JOIN'
                       + ' Data0017 ON Data0095.INVT_PTR = Data0017.RKEY INNER JOIN'
                       + ' Data0022 ON Data0095.SRCE_PTR = Data0022.RKEY INNER JOIN'
                       + ' Data0005 ON Data0095.TRAN_BY = Data0005.RKEY'
                   + ' WHERE (Data0095.TRAN_TP = 23)'
      +' and Data0095.TRAN_DATE>= '''+@ISSUE_DATE1+''''
      +' and Data0095.TRAN_DATE<= '''+@ISSUE_DATE2+''''
     /*if @if1=1
     begin
       if ltrim(rtrim(@sql3))<>'' 
          set @sql=@sql+ltrim(rtrim(@sql3))
     end*/

    set @sql=@sql+' union all '  

    set @sql=@sql+'SELECT Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION,' 
                   +' Data0005.EMPLOYEE_NAME, Data0076.REJECT_DESCRIPTION,' 
                   +' Data0096.TDATE, Data0096.QUAN_REJD, Data0022.PRICE,Data0096.FLAG,case when Data0096.FLAG=2 then ''退货'' when Data0096.FLAG=1 then ''报废'' end as ttype'
                  +' FROM Data0096 INNER JOIN'
                       +' Data0017 ON Data0096.INVT_PTR = Data0017.RKEY INNER JOIN'
                       +' Data0076 ON Data0096.REJ_PTR = Data0076.RKEY INNER JOIN'
                      +'  Data0005 ON Data0096.EMPL_PTR = Data0005.RKEY INNER JOIN'
                       +' Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY'
                  +' WHERE ((Data0096.FLAG = 1) OR (Data0096.FLAG = 2))'
                  +' and Data0096.TDATE>= '''+@ISSUE_DATE1+''''
                         +' and Data0096.TDATE<= '''+@ISSUE_DATE2+''''+') as b'
     if @if2=0 
         set @sql=@sql+' where ((FLAG = 1) OR (FLAG = 2))'
     else if @if2=1
         set @sql=@sql+' where (FLAG = 1) '
     else if @if2=2 
         set @sql=@sql+' where (FLAG = 2)'


     if @if1=1
     begin
         if ltrim(rtrim(@sql3))<>'' 
            set @sql=@sql+ltrim(rtrim(@sql3))
      end







--没有投产的订单
/*
  SELECT Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION, 
      Data0005.EMPLOYEE_NAME, Data0076.REJECT_DESCRIPTION, 
      Data0096.TDATE, Data0096.QUAN_REJD, Data0022.PRICE
  FROM Data0096 INNER JOIN
      Data0017 ON Data0096.INVT_PTR = Data0017.RKEY INNER JOIN
      Data0076 ON Data0096.REJ_PTR = Data0076.RKEY INNER JOIN
      Data0005 ON Data0096.EMPL_PTR = Data0005.RKEY INNER JOIN
      Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY
  WHERE (Data0096.FLAG = 1) OR (Data0096.FLAG = 2)
  union all
  SELECT Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION, 
      Data0005.EMPLOYEE_NAME,  '盘点' as REJECT_DESCRIPTION,
      Data0095.TRAN_DATE as TDATE, Data0095.QUANTITY as QUAN_REJD, Data0022.PRICE    
  FROM Data0095 INNER JOIN
      Data0017 ON Data0095.INVT_PTR = Data0017.RKEY INNER JOIN
      Data0022 ON Data0095.SRCE_PTR = Data0022.RKEY INNER JOIN
      Data0005 ON Data0095.TRAN_BY = Data0005.RKEY
  WHERE (Data0095.TRAN_TP = 23)
*/
  --print @sql3
  print @sql
  --print len(@sql)
  exec(@sql)
end
go



CREATE PROCEDURE wzcx96;2
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




CREATE PROCEDURE wzcx96;3
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

CREATE PROCEDURE wzcx96;4
--with encryption
AS
begin
  select DISTINCT sales_order from data0060 where sales_order<>''
end
go

CREATE PROCEDURE wzcx96;5
--with encryption
AS
begin
  select DISTINCT CUT_NO from data0492 where CUT_NO<>''
end
go

CREATE PROCEDURE wzcx96;6
--with encryption
AS
begin
  select DISTINCT CUSTOMER_PART_NUMBER,CP_REV from data0050 where CUSTOMER_PART_NUMBER<>'' and CP_REV<>''
end
go

CREATE PROCEDURE wzcx96;7
--with encryption
AS
begin
  select DISTINCT CUSTOMER_PART_DESC from data0050 where CUSTOMER_PART_DESC<>''
end
go

CREATE PROCEDURE wzcx96;8
--with encryption
AS
begin
  select DISTINCT CUST_CODE from data0010 where CUST_CODE<>''
end
go

CREATE PROCEDURE wzcx96;9
--with encryption
AS
begin
  select DISTINCT INV_PART_NUMBER,INV_PART_DESCRIPTION from data0017  where INV_PART_NUMBER<>''
end
go

CREATE PROCEDURE wzcx96;10
--with encryption
AS
begin
  select DISTINCT CODE,REJECT_DESCRIPTION from data0076 where CODE<>''
  union all
  SELECT   '盘点','盘点'
end
go

--select * from #table_a1

--drop table #table_a1


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



select * from data0419 where description like '%材料进出%'

SELECT *, PROGRAME AS Expr1, ANCESTOR_PTR AS Expr2, PARENT_PTR AS Expr3, 
      SEQ_NO AS Expr4
FROM Data0419
WHERE (ANCESTOR_PTR = 23) AND (PARENT_PTR = 54)
ORDER BY SEQ_NO