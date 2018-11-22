EP047快速报价过程
--选客户
--如果报价汇率为0就会报被0除数出错
CREATE PROCEDURE EP047;47
AS
select data0010.rkey,data0010.cust_code,customer_name,EDI_FLAG_FOR_SOACK,customer_type,data0012.STATE_TOOL_TAX_FLAG,Data0189.STATE_TAX
 from data0010 ,data0012,DATA0189
where data0012.customer_ptr=data0010.rkey and data0010.customer_type<>4 --状态1,2,3,4正常,试用,保留,作废
and data0010.cust_active_flag=3 --审核 0未审核1退回，2待审，3已审
and data0012.SHIP_CTAX_PTR=data0189.rkey
AND data0010.RKEY IN (61, 394)
order by cust_code
GO

--本厂编号
exec EP047;34 3,'%','001%'

create PROCEDURE EP047;34  /*这里select 是设置最多显示的记录数量以在远程调用的时候避免海量查询*/
@vptr int,
@vpart varchar(20),
@vcust varchar(20)
with encryption
as
	if @vptr<3
	begin
	select  data0050.rkey,data0050.customer_part_number,data0050.layers,data0050.set_x_qty,data0050.set_y_qty,
	data0059.customer_part_desc,data0050.cp_rev,data0010.cust_code,data0059.customer_matl_desc,
	data0025.prod_CODE_PTR,data0008.product_name,data0025.rkey as d025_rkey,data0050.set_Lngth,data0050.set_width
	from data0050(nolock),data0059(nolock),data0010(nolock),data0025(nolock),data0008(nolock)
	where data0050.ttype=@vptr
	and data0050.rkey=data0059.cust_part_ptr
	and data0059.customer_ptr=data0010.rkey
	and data0050.customer_part_number like @vpart
	and data0010.cust_code like @vcust
	and data0025.ancestor_ptr=data0050.rkey
	and data0025.parent_ptr=0
	and data0025.prod_code_ptr=data0008.rkey
	and data0059.onhold_sales_flag=0
	order by data0050.customer_part_number,data0050.cp_rev desc
	end
	if @vptr=3
	begin
	select  data0050.rkey,data0050.customer_part_number,data0050.layers,data0050.set_x_qty,data0050.set_y_qty,
	data0059.customer_part_desc,data0050.cp_rev,data0010.cust_code,data0059.customer_matl_desc,
	data0025.prod_CODE_PTR,data0008.product_name,data0025.rkey as d025_rkey,data0050.set_Lngth,data0050.set_width
	from data0050(nolock),data0059(nolock),data0010(nolock),data0025(nolock),data0008(nolock)
	where data0050.rkey=data0059.cust_part_ptr
	and data0059.customer_ptr=data0010.rkey
	and data0050.customer_part_number like @vpart
	and data0010.cust_code like @vcust
	and data0025.ancestor_ptr=data0050.rkey
	and data0025.parent_ptr=0
	and data0025.prod_code_ptr=data0008.rkey
	and data0059.onhold_sales_flag=0
	order by data0050.customer_part_number,data0050.cp_rev desc
	end

GO


----------------
保存

exec sp_executesql N'UPDATE "SJ_V20_live".."data0085" SET 
"whse_ptr"=@P1,"TTYPE"=@P2,"ttype2"=@P3,"TNUMBER"=@P4,"CUST_NAME"=@P5,"CUST_ADD1"=@P6,"SHIP_REG_TAX_ID"=@P7,"CUST_STATE"=@P8,"CUST_ZIP"=@P9,"CUST_PHONE"=@P10,"country_ptr"=@P11,"CUST_FAX"=@P12,"CUST_CONTACT"=@P13,"CUST_CONTACT_PHONE"=@P14,"EMAIL"=@P15,"CUST_RFQ"=@P16,"CUST_PTR"=@P17,"CUST_QTE_FACTOR"=@P18,"CURR_PTR"=@P19,"BASE_PRICE"=@P20,"SREP_PTR"=@P21,"PROMISE_SAMP_DATE"=@P22,"last_modified_date"=@P23,"last_modified_by_ptr"=@P24,"QTE_DATE"=@P25,"PROMISE_DATE"=@P26,"CUST_PART_PTR"=@P27,"CUST_PART_NO"=@P28,"REF_PART_NO"=@P29,"CURR_RATE"=@P30,"TUNITS"=@P31,"QUOTE_TYPE"=@P32,"EXPIRATION_DATE"=@P33,"AUDITED_STATUS"=@P34,"PAYMENT"=@P35,"sales_discount"=@P36,"layers"=@P37,"qte_desc1"=@P38,"qte_desc2"=@P39,"qte_desc3"=@P40,"qte_desc4"=@P41,"qte_desc5"=@P42,"qte_desc6"=@P43,"qte_desc7"=@P44,"qte_desc8"=@P45,"qte_desc9"=@P46,"qte_desc10"=@P47,"qte_desc11"=@P48,"qte_desc12"=@P49,"qte_desc13"=@P50,"qte_desc14"=@P51,"qte_desc15"=@P52,"qte_desc16"=@P53 
WHERE "whse_ptr" IS NULL AND "RKEY"=@P54 AND "TTYPE"=@P55 AND "ttype2" IS NULL AND "TNUMBER"=@P56 AND "CUST_NAME" IS NULL AND "CUST_ADD1" IS NULL AND "SHIP_REG_TAX_ID" IS NULL AND "CUST_STATE" IS NULL AND "CUST_ZIP" IS NULL AND "CUST_PHONE" IS NULL AND 
"country_ptr" IS NULL AND "CUST_FAX" IS NULL AND "CUST_CONTACT" IS NULL AND "CUST_CONTACT_PHONE" IS NULL AND "EMAIL" IS NULL AND "CUST_RFQ" IS NULL AND "CUST_PTR" IS NULL AND "CUST_QTE_FACTOR" IS NULL AND "CURR_PTR" IS NULL AND "BASE_PRICE" IS NULL AND 
"SREP_PTR" IS NULL AND "PROMISE_SAMP_DATE"=@P57 AND "last_modified_date" IS NULL AND "last_modified_by_ptr" IS NULL AND "QTE_DATE"=@P58 AND "PROMISE_DATE"=@P59 AND "CUST_PART_PTR" IS NULL AND "CUST_PART_NO"=@P60 AND "REF_PART_NO"=@P61 AND "CURR_RATE" IS NULL 
AND "TUNITS" IS NULL AND "QUOTE_TYPE" IS NULL AND "EXPIRATION_DATE"=@P62 AND "AUDITED_STATUS"=@P63 AND "PAYMENT" IS NULL AND "sales_discount" IS NULL AND "layers" IS NULL AND "qte_desc1" IS NULL AND "qte_desc2" IS NULL AND "qte_desc3" IS NULL AND "qte_desc4" 
IS NULL AND "qte_desc5" IS NULL AND "qte_desc6" IS NULL AND "qte_desc7" IS NULL AND "qte_desc8" IS NULL AND "qte_desc9" IS NULL AND "qte_desc10" IS NULL AND "qte_desc11" IS NULL AND "qte_desc12" IS NULL AND "qte_desc13" IS NULL AND "qte_desc14" IS NULL AND "qte_desc15" IS NULL AND "qte_desc16" IS NULL',N'@P1 int,@P2 smallint,@P3 tinyint,@P4 varchar(10),@P5 varchar(16),@P6 varchar(16),@P7 varchar(1),@P8 varchar(10),@P9 varchar(10),@P10 varchar(1),@P11 int,@P12 varchar(1),@P13 varchar(20),@P14 varchar(11),@P15 varchar(128),@P16 varchar(1),@P17 int,@P18 float,@P19 int,@P20 float,@P21 int,@P22 datetime,@P23 datetime,@P24 int,@P25 datetime,@P26 datetime,@P27 int,@P28 varchar(15),@P29 varchar(20),@P30 float,@P31 int,@P32 smallint,@P33 datetime,@P34 tinyint,@P35 varchar(20),@P36 numeric(4,2),@P37 tinyint,@P38 varchar(2),@P39 varchar(2),@P40 varchar(1),@P41 varchar(1),@P42 varchar(1),@P43 varchar(1),@P44 varchar(1),@P45 varchar(1),@P46 varchar(1),@P47 varchar(1),@P48 varchar(1),@P49 varchar(1),@P50 varchar(1),@P51 varchar(1),@P52 varchar(1),@P53 varchar(1),@P54 int,@P55 smallint,@P56 varchar(10),@P57 datetime,@P58 datetime,@P59 datetime,@P60 varchar(1),@P61 varchar(20),@P62 datetime,@P63 tinyint',NULL,0,0,'QT0000011 ','巨冈电子有限公司','巨冈电子有限公司','Y','          ','          ','',2,'','吴智勇先生          ','15820447066','                                                                                                                                ','',61,0,4,0,2,'2014-01-22 00:00:00','2014-01-07 22:49:11',1,'2014-01-07 00:00:00','2014-01-22 00:00:00',10580,'77-3100-0002_A3','P0B001567           ',1.2820512820512822,1,1,'2014-03-08 00:00:00',0,'月结60天            ',0,0,'11','22','','','','','','','','','','','','','','',57,0,'QT0000011 ','2014-01-22 23:47:00','2014-01-07 22:49:00','2014-01-22 23:47:00','','                    ','2014-03-08 23:47:00',0
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0088" 
("QTE_PTR") VALUES (@P1);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int',57
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0259" 
("QTE_PTR") 
VALUES (@P1); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int',57
GO

exec EP047;2 7,57 特别工艺加价
go
exec EP047;59 7
go

exec EP047;20 2




