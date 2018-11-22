EP159根据入仓单新建
--请单
exec EP159;3 0,'%','2014-03-22 00:00:00','2014-04-22 00:00:00'
明细
exec EP159;11 1
-------------------------------------
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0107" 
("INVOICE_NO","SUPP_PTR","INV_TP","EMPL_PTR","INV_DATE","STATUS","INV_TOTAL","MATL_TOT","FED_TAX","EX_RATE","ENT_DATE","FED_SHIP_TAX_FLAG","FED_MISC_TAX_FLAG","DUE_DATE","MISC_TOT","FED_RATE","CURRENCY_PTR","gl_acct_ptr","ttype") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(6),@P2 int,@P3 varchar(1),@P4 int,@P5 datetime,@P6 smallint,@P7 money,@P8 money,@P9 money,@P10 float,@P11 datetime,@P12 varchar(1),@P13 varchar(1),@P14 datetime,@P15 money,@P16 float,@P17 int,@P18 int,@P19 tinyint',
'fp0002',2,'2',1,'2014-04-21 00:00:00',1,$24.0000,$20.5100,$3.4900,1,'2014-04-21 00:00:00','N','N','2014-06-01 00:00:00',$0.0000,0,1,30,0
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0105" 
("VOUCHER","BATCH_NUMBER","VOU_TYPE","TRANS_TYPE","SOURCE_PTR","ENTERED_BY_EMPL_PTR","ENTERED_DT","ATTACHED","FYEAR","PERIOD","SUPP_PTR") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(12),@P2 varchar(13),@P3 smallint,@P4 smallint,@P5 int,@P6 int,@P7 datetime,@P8 smallint,@P9 int,@P10 smallint,@P11 int','TD140400002 ','fp0002 sup002',0,1,2,1,'2014-04-21 00:00:00',2,2014,4,2
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0106" 
("GL_HEADER_PTR","GL_ACCT_NO_PTR","REF_NUMBER","DESCRIPTION","SRCE_PTR","AMOUNT","D_C","FYEAR","PERIOD","CURR_PTR","EXCH_RATE","ORIG_AMOUNT")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 varchar(6),@P4 varchar(10),@P5 int,@P6 numeric(18,2),@P7 varchar(1),@P8 int,@P9 smallint,@P10 int,@P11 float,@P12 numeric(18,2)',2,11,'sup002','购买原材料',1,20.51,'D',NULL,NULL,1,1,20.51
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0106" 
("GL_HEADER_PTR","GL_ACCT_NO_PTR","REF_NUMBER","DESCRIPTION","SRCE_PTR","AMOUNT","D_C","FYEAR","PERIOD","CURR_PTR","EXCH_RATE","ORIG_AMOUNT")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 varchar(6),@P4 varchar(21),@P5 int,@P6 numeric(18,2),@P7 varchar(1),@P8 int,@P9 smallint,@P10 int,@P11 float,@P12 numeric(18,2)',2,65,'fp0002','购买原材料PO200534502',1,3.49,'D',NULL,NULL,1,1,3.49
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0106" 
("GL_HEADER_PTR","GL_ACCT_NO_PTR","REF_NUMBER","DESCRIPTION","SRCE_PTR","AMOUNT","D_C","FYEAR","PERIOD","CURR_PTR","EXCH_RATE","ORIG_AMOUNT")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 varchar(6),@P4 varchar(21),@P5 int,@P6 numeric(18,2),@P7 varchar(1),@P8 int,@P9 smallint,@P10 int,@P11 float,@P12 numeric(18,2)',
 2,30,'fp0002','购买原材料PO200534502',1,24.00,'C',NULL,NULL,1,1,24.00
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0079" 
("INVOICE_PTR","GRN_PTR","quan_invd","D0022_PTR","TAX_2","PRICE","EXCH_RATE") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 float,@P4 int,@P5 float,@P6 float,@P7 float',
2,6,200,5,17,0.102564102564103,1
go

exec sp_executesql N'UPDATE "SJ_V20_live".."data0022" 
SET "quan_invoiced"=@P1 
WHERE "RKEY"=@P2 AND "quan_invoiced"=@P3',N'@P1 numeric(18,6),@P2 int,@P3 numeric(18,6)',
1060.000000,5,860.000000
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0456" 
SET "status"=@P1 
WHERE "rkey"=@P2 AND "status"=@P3',N'@P1 smallint,@P2 int,@P3 smallint',1,6,2
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0079" 
("INVOICE_PTR","GRN_PTR","quan_invd","D0022_PTR","TAX_2","PRICE","EXCH_RATE") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 float,@P4 int,@P5 float,@P6 float,@P7 float',
2,6,200,5,17,0.102564102564103,1
go


-----------------------------------
create PROCEDURE EP159;3
@vtp int,
@vcode varchar(10),
@vdate1 datetime,
@vdate2 datetime

AS
declare @vptr int
select @vptr=isnull(fin_control6,0) from data0192
if @vtp=0
begin
if @vptr=1
begin
SELECT  Data0456.rkey,Data0456.grn_number,data0456.create_date,data0456.status,a.rkey as po_ptr,
data0023.payment_terms,data0023.code,data0023.abbr_name,data0456.supp_ptr,data0456.ref_number,
data0023.supplier_name,data0023.payment_terms_flag,data0001.curr_code,data0456.ttype,
Data0456.Audited_by,data0456.Audited_Date,a.PO_NUMBER,cast(0 as bit) as choose_flag into #tempEp08801
FROM  data0023,data0001,Data0456 ,(
select distinct DATA0022.grn_ptr,data0070.po_number,data0070.rkey,data0022.currency_ptr
from data0022
left join DATA0071 on DATA0071.RKEY=DATA0022.SOURCE_PTR
left join data0070 on DATA0071.PO_PTR=DATA0070.RKEY
left join data0456 on data0022.grn_ptr=data0456.rkey
left join data0096 on data0096.inv_tran_ptr=data0022.rkey and isnull(data0096.invoice_ptr,0)=0 and isnull(data0096.debit_memo_ptr,0)=0
where data0456.ttype<>2 and ((Data0456.status<>2 and data0456.status<>3)
 or (data0096.rkey>0 ))
--where data0456.ttype<>2 and ((Data0456.status<>2 and data0456.status<>3) or data0022.rkey in (select isnull(inv_tran_ptr,0) from data0096 where isnull(debit_memo_ptr,0)=0 and isnull(debit_memo_ptr,0)=0))
) a 
WHERE Data0456.supp_ptr =data0023.rkey
AND data0456.rkey=A.grn_ptr
and data0001.rkey=a.currency_ptr
and data0456.Audited_by>0
and data0023.code like @vcode
and data0456.create_date>=@vdate1
and data0456.create_date<=@vdate2
ORDER BY 
Data0456.grn_number,data0456.create_date,data0456.status

select * from #tempEp08801
end
if (@vptr=0 or @vptr is null)
begin
SELECT  Data0456.rkey,Data0456.grn_number,data0456.create_date,data0456.status,a.rkey as po_ptr,
data0023.payment_terms,data0023.code,data0023.abbr_name,data0456.supp_ptr,data0456.ref_number,
data0023.supplier_name,data0023.payment_terms_flag,data0001.curr_code,data0456.ttype,
Data0456.Audited_by,data0456.Audited_Date,a.PO_NUMBER,cast(0 as bit) as choose_flag into #tempEp08802
FROM  data0023,data0001,Data0456,(
select  distinct DATA0022.grn_ptr,data0070.po_number,data0070.rkey,data0022.currency_ptr
from data0022
left join data0456 on data0022.grn_ptr=data0456.rkey 
left join DATA0071 on DATA0071.RKEY=DATA0022.SOURCE_PTR
left join data0070 on DATA0071.PO_PTR=DATA0070.RKEY
left join data0096 on data0096.inv_tran_ptr=data0022.rkey and isnull(data0096.invoice_ptr,0)=0 and isnull(data0096.debit_memo_ptr,0)=0
where data0456.ttype<>2 
and ((Data0456.status<>2 and data0456.status<>3)
 or (data0096.rkey>0 ))
) a 
WHERE Data0456.supp_ptr =data0023.rkey
AND data0456.rkey=A.grn_ptr
and data0001.rkey=a.currency_ptr
and data0023.code like @vcode
and data0456.create_date>=@vdate1
and data0456.create_date<=@vdate2
ORDER BY 
Data0456.grn_number,data0456.create_date,data0456.status

select * from #tempEp08802
end
end
if @vtp=1
begin
if @vptr=1
begin
SELECT  Data0456.rkey,Data0456.grn_number,data0456.create_date,data0456.status,a.rkey as po_ptr,
data0023.payment_terms,data0023.code,data0023.abbr_name,data0456.supp_ptr,data0456.ref_number,
data0023.supplier_name,data0023.payment_terms_flag,data0001.curr_code,data0456.ttype,
Data0456.Audited_by,data0456.Audited_Date,a.PO_NUMBER,cast(0 as bit) as choose_flag into #tempEp08803
FROM  data0023,data0001,Data0456,(
select distinct DATA0022.grn_ptr,data0070.po_number,data0070.rkey,data0022.currency_ptr
from data0022 left join DATA0071 on DATA0071.RKEY=DATA0022.SOURCE_PTR
left join data0070 on DATA0071.PO_PTR=DATA0070.RKEY
left join data0456 on data0022.grn_ptr=data0456.rkey
and data0456.ttype<>2
and data0456.status<>2 
and data0456.status=3) a 
WHERE Data0456.supp_ptr =data0023.rkey
AND data0456.rkey=A.grn_ptr
and data0001.rkey=a.currency_ptr
and Data0456.status=3
and data0456.Audited_by>0
and data0023.code like @vcode
and data0456.create_date>=@vdate1
and data0456.create_date<=@vdate2
ORDER BY 
Data0456.grn_number,data0456.create_date,data0456.status

select * from #tempEp08803
end
if (@vptr=0 or @vptr is null)
begin
SELECT  Data0456.rkey,Data0456.grn_number,data0456.create_date,data0456.status,a.rkey as po_ptr,
data0023.payment_terms,data0023.code,data0023.abbr_name,data0456.supp_ptr,data0456.ref_number,
data0023.supplier_name,data0023.payment_terms_flag,data0001.curr_code,data0456.ttype,
Data0456.Audited_by,data0456.Audited_Date,a.PO_NUMBER,cast(0 as bit) as choose_flag into #tempEp08804
FROM  data0023,data0001,Data0456,(
select distinct DATA0022.grn_ptr,data0070.po_number,data0070.rkey,data0022.currency_ptr
from data0022 left join DATA0071 on DATA0071.RKEY=DATA0022.SOURCE_PTR
left join data0070 on DATA0071.PO_PTR=DATA0070.RKEY
left join data0456 on data0022.grn_ptr=data0456.rkey
and data0456.ttype<>2
and data0456.status<>2 
and data0456.status=3) a 
WHERE Data0456.supp_ptr =data0023.rkey
AND data0456.rkey=A.grn_ptr
and data0001.rkey=a.currency_ptr
and Data0456.status=3
and data0023.code like @vcode
and data0456.create_date>=@vdate1
and data0456.create_date<=@vdate2
ORDER BY 
Data0456.grn_number,data0456.create_date,data0456.status

select * from #tempEp08804
end
end
GO

--------------
create PROCEDURE EP159;11
@vptr int
with encryption
AS
select data0022.APCheckFlag,DATA0022.APCheckQnty,data0017.inv_part_number,data0002.unit_code,data0017.inv_part_description,
data0001.curr_code,data0022.exchange_rate,data0022.price,data0022.quantity,data0022.tax_2,
isnull(data0022.quan_returned,0)+isnull(data0022.quan_to_be_shipped,0)+isnull(data0022.quan_returned1,0)+isnull(data0022.quan_to_be_shipped1,0) as quan_returned,data0022.quan_invoiced,
data0022.quan_stocked,data0022.quan_to_be_stocked
FROM  dbo.Data0017(nolock) 
INNER JOIN    dbo.Data0022(nolock) ON dbo.Data0017.RKEY = dbo.Data0022.INVENTORY_PTR 
INNER JOIN    dbo.Data0002(nolock) ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY 
INNER JOIN    dbo.Data0001(nolock) ON dbo.Data0022.CURRENCY_PTR = dbo.Data0001.RKEY
where data0022.grn_ptr =@VPTR
go
