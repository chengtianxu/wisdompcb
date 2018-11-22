--单个打印自定义存储过程
declare @oldname varchar(50)
select @oldname='user_defined_sp_ep032_1-'+convert(varchar(8),year(getdate())*10000+month(getdate())*100+day(getdate()))
IF EXISTS (SELECT name 	FROM   sysobjects 	WHERE  name = 'user_defined_sp_ep032_1' AND  type = 'P')
	IF not EXISTS (SELECT name 	FROM   sysobjects 	WHERE  name = @oldname	AND  type = 'P')
		exec sp_rename 'user_defined_sp_ep032_1',@oldname
	else drop proc user_defined_sp_ep032_1
GO

CREATE PROCEDURE user_defined_sp_ep032_1 
@rkey60 int
with encryption
AS
declare 
@eg_AMOUNT float,
@li_AMOUNT float,
@md_AMOUNT float,
@te_AMOUNT float
select @eg_AMOUNT=AMOUNT  from Data0062 
join Data0061 on data0061.RKEY=data0062.ADDL_CAT_PTR
where SO_PTR=@rkey60 and data0061.CATEGORY like '%工程费%'

select @li_AMOUNT=AMOUNT  from Data0062 
join Data0061 on data0061.RKEY=data0062.ADDL_CAT_PTR
where SO_PTR=@rkey60 and data0061.CATEGORY like '%光绘费%'
select @md_AMOUNT=AMOUNT  from Data0062 
join Data0061 on data0061.RKEY=data0062.ADDL_CAT_PTR
where SO_PTR=@rkey60 and data0061.CATEGORY like '%模具费%'
select @te_AMOUNT=AMOUNT  from Data0062 
join Data0061 on data0061.RKEY=data0062.ADDL_CAT_PTR
where SO_PTR=@rkey60 and data0061.CATEGORY like '%测试费%'

SELECT sales_order,@eg_AMOUNT eg_AMOUNT,
@li_AMOUNT li_AMOUNT,
@md_AMOUNT md_AMOUNT,
@te_AMOUNT te_AMOUNT from Data0060 where rkey=@rkey60
go

--按照合同号打印自定义存储过程
declare @oldname varchar(50)
select @oldname='user_defined_sp_ep032_2-'+convert(varchar(8),year(getdate())*10000+month(getdate())*100+day(getdate()))
IF EXISTS (SELECT name 	FROM   sysobjects 	WHERE  name = 'user_defined_sp_ep032_2' AND  type = 'P')
	IF not EXISTS (SELECT name 	FROM   sysobjects 	WHERE  name = @oldname	AND  type = 'P')
		exec sp_rename 'user_defined_sp_ep032_2',@oldname
	else drop proc user_defined_sp_ep032_2
GO

CREATE PROCEDURE user_defined_sp_ep032_2 
@rkey60 int
with encryption
AS
SELECT sales_order from Data0060 where rkey=@rkey60
go

--按照客户打印自定义存储过程
declare @oldname varchar(50)
select @oldname='user_defined_sp_ep032_3-'+convert(varchar(8),year(getdate())*10000+month(getdate())*100+day(getdate()))
IF EXISTS (SELECT name 	FROM   sysobjects 	WHERE  name = 'user_defined_sp_ep032_3' AND  type = 'P')
	IF not EXISTS (SELECT name 	FROM   sysobjects 	WHERE  name = @oldname	AND  type = 'P')
		exec sp_rename 'user_defined_sp_ep032_3',@oldname
	else drop proc user_defined_sp_ep032_3
GO

CREATE PROCEDURE user_defined_sp_ep032_3 
@rkey60 int
with encryption
AS
SELECT sales_order from Data0060 where rkey=@rkey60
go

--连续订单打印自定义存储过程
declare @oldname varchar(50)
select @oldname='user_defined_sp_ep032_4-'+convert(varchar(8),year(getdate())*10000+month(getdate())*100+day(getdate()))
IF EXISTS (SELECT name 	FROM   sysobjects 	WHERE  name = 'user_defined_sp_ep032_4' AND  type = 'P')
	IF not EXISTS (SELECT name 	FROM   sysobjects 	WHERE  name = @oldname	AND  type = 'P')
		exec sp_rename 'user_defined_sp_ep032_4',@oldname
	else drop proc user_defined_sp_ep032_4
GO

CREATE PROCEDURE user_defined_sp_ep032_4 
@rkey60 int
with encryption
AS
SELECT sales_order from Data0060 where rkey=@rkey60
go

