--EP122收货--不要IQC检查
 --修改4表
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0004" 
SET "SEED_VALUE"=@P1 WHERE "SEED_VALUE"=@P2',
N'@P1 varchar(11),@P2 varchar(11)',
'RC100000007','RC100000006'
--收货主表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0908" 
("RC_NUMBER","SUPP_PTR","TTYPE","CREATE_DATE","CREATE_BY","REF_NUMBER","PRINTED","TDATE","EXCHANGE_RATE","CURRENCY_PTR","whouse_ptr","sys_id","sys_rq","CUSTOMSCODE") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 varchar(11),@P2 int,@P3 smallint,@P4 datetime,@P5 int,@P6 varchar(3),@P7 varchar(1),@P8 datetime,@P9 float,@P10 int,@P11 int,@P12 varchar(5),@P13 datetime,@P14 varchar(2)',
 'RC100000007',3,1,'2013-12-19 11:11:39',1,'123','N','2013-12-19 11:11:39',1,1,2,'ADMIN','2013-12-19 11:11:39','aa'
 
 --收货明细 
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0909" 
("TTYPE","INVENTORY_PTR","RC_PTR","SOURCE_PTR","WHOUSE_PTR","LOCATION_PTR","SUPPLIER_PTR","QUANTITY","CURRENCY_PTR","EXCHANGE_RATE","PRICE","DISCOUNT","QUAN_TO_BE_STOCKED",--这边是待入仓数量
"TDATE","EXPIRE_DATE","TAX_2","Prod_Date","tax_price","conversion_factor") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 float,@P9 int,@P10 float,@P11 float,@P12 float,@P13 numeric(18,6),@P14 datetime,@P15 datetime,@P16 float,@P17 datetime,@P18 float,@P19 float',
2,4702,6,18406,2,NULL,3,21,1,1,139.95726495726495,0,21.000000,'2013-12-19 11:11:39','2014-12-10 00:00:00',17,'2013-12-10 00:00:00',163.75,1
 --采购明细 收货数量
update data0071 
set quan_recd=isnull(a.quan_recd,0)+isnull(b.quantity,0)/isnull(a.conversion_factor,1) 
from data0071 a,(select data0909.source_ptr,sum(quantity) as quantity from data0909 where data0909.rc_ptr=6 group by data0909.source_ptr) b where a.rkey=b.source_ptr

 --采购明细 收货日期
 update data0071 set AccptDate=b.TDate 
  from data0071 a,  (select top 1 data0909.source_ptr,convert(varchar(100),data0909.TDATE,20) AS TDate from data0909 where data0909.rc_ptr=6   order by rkey asc) b where a.rkey=b.source_ptr and a.AccptDate is null

go



---------------------------------
--EP122收货--要IQC检查
--收货主表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0908" 
("RC_NUMBER","SUPP_PTR","TTYPE","CREATE_DATE","CREATE_BY","REF_NUMBER","PRINTED","TDATE","EXCHANGE_RATE","CURRENCY_PTR","whouse_ptr","sys_id","sys_rq","CUSTOMSCODE")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 varchar(11),@P2 int,@P3 smallint,@P4 datetime,@P5 int,@P6 varchar(2),@P7 varchar(1),@P8 datetime,@P9 float,@P10 int,@P11 int,@P12 varchar(5),@P13 datetime,@P14 varchar(2)',
 'RC100000006',46,1,'2013-12-18 17:38:43',1,'11','N','2013-12-18 17:38:43',1,1,2,'ADMIN','2013-12-18 17:38:43','22'
--收货明细 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0909" 
 ("TTYPE","INVENTORY_PTR","RC_PTR","SOURCE_PTR","WHOUSE_PTR","LOCATION_PTR","SUPPLIER_PTR","QUANTITY","CURRENCY_PTR","EXCHANGE_RATE","PRICE","DISCOUNT","QUAN_IN_INSP",--这边是待检IQC数量
 "TDATE","EXPIRE_DATE","TAX_2","Prod_Date","tax_price","conversion_factor") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 float,@P9 int,@P10 float,@P11 float,@P12 float,@P13 numeric(18,6),@P14 datetime,@P15 datetime,@P16 float,@P17 datetime,@P18 float,@P19 float',
 2,542,5,17636,2,NULL,46,2,1,1,0.085470085470085472,0,2.000000,'2013-12-18 17:38:43','2014-12-17 00:00:00',17,'2013-12-17 00:00:00',0.10000000000000001,1
 
 --采购明细 收货数量
 update data0071 
 set quan_recd=isnull(a.quan_recd,0)+isnull(b.quantity,0)/isnull(a.conversion_factor,1) 
 from data0071 a,(select data0909.source_ptr,sum(quantity) as quantity from data0909 where data0909.rc_ptr=5 group by data0909.source_ptr) b 
 where a.rkey=b.source_ptr
 --采购明细 收货日期
  update data0071 set AccptDate=b.TDate  from data0071 a, 
   (select top 1 data0909.source_ptr,convert(varchar(100),data0909.TDATE,20) AS TDate from data0909 where data0909.rc_ptr=5   order by rkey asc) b where a.rkey=b.source_ptr and a.AccptDate is NULL
   
   
   ----------------------------
   ----IQC 
   --IQC主表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0910" 
("IQC_Number","d0909_ptr","WHOUSE_PTR","SUPPLIER_PTR","inv_ptr","ttype","quantity","quan_passed","quan_Nopassed","EXPIRE_DATE","CREATE_DATE","CREATE_BY","IQC_date","sys_id","sys_rq","memo","PRINTED","CUSTOMSCODE") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 nvarchar(11),@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 numeric(19,6),@P8 numeric(19,6),@P9 numeric(19,6),@P10 datetime,@P11 datetime,@P12 int,@P13 datetime,@P14 varchar(5),@P15 datetime,@P16 nvarchar(4),@P17 varchar(1),@P18 varchar(2)',
N'IQ100000002',6,2,46,542,0,3.000000,2.000000,1.000000,'2014-12-18 00:00:00','2013-12-18 17:50:17',1,'2013-12-18 17:50:17','ADMIN','2013-12-18 17:50:17',N'test','N','22'
--IQC不良品
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0911" 
("d0910_ptr","REJ_PTR","QUAN_REJD","FLAG","remark") 
VALUES (@P1,@P2,@P3,@P4,@P5); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 numeric(19,6),@P4 int,@P5 nvarchar(2)',
1,54,1.000000,2,N'aa'
go
--
--修改909表检查记录
update data0909 
set 
quan_in_insp=isnull(a.quan_in_insp,0)-isnull(b.quantity,0),
quan_to_be_stocked=isnull(a.quan_to_be_stocked,0)+isnull(b.quan_passed,0)+isnull(b.QUAN_USEASIS,0),
QUAN_RETURNED=isnull(a.QUAN_RETURNED,0)+isnull(b.QUAN_returned,0),
EXPIRE_DATE='2014-12-18 23:59:59' 
from data0909 a,
( select Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed, 
sum(case isnull(data0911.FLAG,0) when 3 then data0911.quan_rejd else 0 end) as QUAN_USEASIS, 
sum(case isnull(data0911.FLAG,3) when 3 then 0 else data0911.quan_rejd end) as QUAN_returned 
  from Data0910 
  left join Data0911 on Data0910.rkey=data0911.d0910_ptr 
  where Data0910.rkey=1 
  group by Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed) b where a.rkey=b.d0909_ptr and a.rkey=6

GO
--修改71表退回
update data0071 set QUAN_RETN=isnull(a.QUAN_RETN,0)+isnull(b.QUAN_returned,0) 
from data0071 a,data0909 c,
( select Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed, 
sum(case isnull(data0911.FLAG,0) when 3 then data0911.quan_rejd else 0 end) as QUAN_USEASIS, 
sum(case isnull(data0911.FLAG,3) when 3 then 0 else data0911.quan_rejd end) as QUAN_returned
 from Data0910 left join Data0911 on Data0910.rkey=data0911.d0910_ptr 
where Data0910.rkey=1 group by Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed) b 
where a.rkey=c.source_ptr and c.rkey=b.d0909_ptr

GO
修改71表检查
update data0071 
set quan_in_insp=isnull((select sum(quan_in_insp) from data0909 where data0071.rkey=data0909.source_ptr),0)/isnull(conversion_factor,1)
 where rkey in (select data0909.source_ptr from data0909 where data0909.rkey=6)

go


update data0909 set quan_in_insp=isnull(a.quan_in_insp,0)-isnull(b.quantity,0),quan_to_be_stocked=isnull(a.quan_to_be_stocked,0)+isnull(b.quan_passed,0)+isnull(b.QUAN_USEASIS,0),QUAN_RETURNED=isnull(a.QUAN_RETURNED,0)+isnull(b.QUAN_returned,0),EXPIRE_DATE='2014-12-18 23:59:59' from data0909 a,( select Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed, sum(case isnull(data0911.FLAG,0) when 3 then data0911.quan_rejd else 0 end) as QUAN_USEASIS, sum(case isnull(data0911.FLAG,3) when 3 then 0 else data0911.quan_rejd end) as QUAN_returned from Data0910 left join Data0911 on Data0910.rkey=data0911.d0910_ptr where Data0910.rkey=1 group by Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed) b where a.rkey=b.d0909_ptr and a.rkey=6

go
update data0071 set QUAN_RETN=isnull(a.QUAN_RETN,0)+isnull(b.QUAN_returned,0) from data0071 a,data0909 c,( select Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed, sum(case isnull(data0911.FLAG,0) when 3 then data0911.quan_rejd else 0 end) as QUAN_USEASIS, sum(case isnull(data0911.FLAG,3) when 3 then 0 else data0911.quan_rejd end) as QUAN_returned from Data0910 left join Data0911 on Data0910.rkey=data0911.d0910_ptr where Data0910.rkey=1 group by Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed) b where a.rkey=c.source_ptr and c.rkey=b.d0909_ptr

go
update data0071 set quan_in_insp=isnull((select sum(quan_in_insp) from data0909 where data0071.rkey=data0909.source_ptr),0)/isnull(conversion_factor,1) where rkey in (select data0909.source_ptr from data0909 where data0909.rkey=6)

GO
---------------------------
--EP016入仓
--
--查可以入仓的数量
SELECT distinct b.rkey,b.source_ptr,b.rc_ptr,a.rc_number,a.create_date,b.inventory_ptr,e.inv_part_number,e.inv_part_description,e.inspect,e.RackNo,b.quantity,b.quan_to_be_stocked,b.SUPPLIER_PTR,f.code,f.SUPPLIER_NAME,b.quan_stocked,b.price,b.tax_2,b.price*(1+b.tax_2/100) as tax_price,b.prod_date,b.expire_date,b.ref_barcodeId,b.extra_req,a.whouse_ptr,a.REF_NUMBER,a.whouse_ptr,a.ttype as ttypeT,b.CURRENCY_PTR,b.DISCOUNT,b.EXCHANGE_RATE,b.conversion_factor,b.PackWeight,b.TTYPE,g.ttype as costtype,i.po_type, a.po_ptr,i.po_number,a.CUSTOMSCODE 
FROM data0908 a  
inner join  data0909 b  on a.rkey=b.rc_ptr 
inner join data0017 e on b.inventory_ptr=e.rkey 
inner join data0023 f on b.SUPPLIER_PTR=f.rkey 
inner join data0496 g on e.group_ptr=g.rkey 
left join data0071 h on b.source_ptr=h.rkey 
left join data0070 i on h.po_ptr=i.rkey 
where isnull(b.quan_to_be_stocked,0)>0 and a.whouse_ptr=2 
order by a.rc_number ASC
--入仓主表
--exec sp_executesql N'SET NOCOUNT OFF;
 INSERT INTO "SJ_V20_live".."data0456" 
 ("GRN_NUMBER","SUPP_PTR","TTYPE","CREATE_DATE","CREATE_BY","PRINTED","Locationptr","TTYPE_EX","TDATE","EXCHANGE_RATE","CURRENCY_PTR","whouse_ptr","sys_id","sys_rq","Remark") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 nvarchar(10),@P2 int,@P3 smallint,@P4 datetime,@P5 int,@P6 varchar(1),@P7 int,@P8 int,@P9 datetime,@P10 float,@P11 int,@P12 int,@P13 varchar(5),@P14 datetime,@P15 varchar(4)',
 N'R100017569',46,1,'2013-12-19 10:28:35',1,'N',2,4,'2013-12-19 10:28:35',1,1,2,'ADMIN','2013-12-19 10:28:35','test'
 --修改4表
exec sp_executesql N'UPDATE "SJ_V20_live".."data0004" SET "seed_value"=@P1 
WHERE "rkey"=@P2 AND "seed_value"=@P3',
N'@P1 varchar(12),@P2 int,@P3 varchar(12)',
'100000024576',63,'100000024575'
--入仓明细 新版先收货在DATA0909表，然后再入仓到DATA0022表  通过D0909_ptr关联
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0022" 
("TTYPE","INVENTORY_PTR","GRN_PTR","SOURCE_PTR","WHOUSE_PTR","LOCATION_PTR","SUPPLIER_PTR","QUANTITY","CURRENCY_PTR","EXCHANGE_RATE","PRICE","DISCOUNT","TDATE","QUAN_STOCKED","QUAN_ON_HAND","BARCODE_ID","EXPIRE_DATE","TAX_2","extra_req","stock_date","Ref_BarCodeID","Prod_Date","REFERENCE_NUMBER","tax_price","PackWeight","conversion_factor","D0909_ptr","CUSTOMSCODE") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26,@P27,@P28); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 smallint,@P2 int,@P3 int,@P4 int,@P5 int,@P6 int,@P7 int,@P8 float,@P9 int,@P10 float,@P11 float,@P12 float,@P13 datetime,@P14 float,@P15 numeric(19,6),@P16 varchar(12),@P17 datetime,@P18 float,@P19 varchar(1),@P20 datetime,@P21 varchar(1),@P22 datetime,@P23 varchar(1),@P24 float,@P25 float,@P26 float,@P27 int,@P28 varchar(2)',
2,542,13609,17721,2,2,46,2,1,1,0.0854700854700855,0,'2013-12-19 10:28:35',2,2.000000,'100000024576','2014-12-18 00:00:00',17,'','2013-12-19 10:28:35','','2013-12-18 00:00:00','',0.10000000000000001,NULL,1,6,'22'
--修改909
update data0909 
set quan_to_be_stocked=isnull(data0909.quan_to_be_stocked,0)-isnull(Data0022.quantity,0),
quan_stocked=isnull(data0909.quan_stocked,0)+isnull(Data0022.quantity,0)
 from data0909,Data0022 
 where data0909.rkey=Data0022.d0909_ptr and Data0022.rkey in (select rkey from data0022 where grn_ptr=13609)
 --检查是否收完货关70表
IF not EXISTS (select QUAN_ORD from data0071 where po_ptr=4890 and QUAN_ORD*isnull(data0071.conversion_factor,1)>isnull((select sum(quantity) 
                                                                                                                         from (select data0022.rkey,data0022.source_ptr,sum(isnull(data0022.quantity,0)-isnull(Data0096.QUAN_REJD,0)) as quantity 
                                                                                                                                                    FROM data0071 inner join data0022 on data0071.rkey=data0022.source_ptr left join Data0096 on Data0096.INV_TRAN_PTR=data0022.rkey and (data0096.flag=2 or data0096.flag=9) and (((data0096.TRAN_TP=8 or data0096.TRAN_TP=38 or isnull(data0096.TRAN_TP,0)=0) and data0096.tstatus<>2) or data0096.tstatus=1 or data0096.tstatus=3) where isnull(data0022.quantity,0)>0  and data0071.po_ptr=4890 group by data0022.rkey,data0022.source_ptr )a where a.source_ptr=data0071.rkey ),0)) 
update data0070 set STATUS=6 where rkey=4890
--1待审核,2被退回,3已保留,4已暂缓,5 已审核,6已收货,7已完成,8未提交,9已取消





   
   
   

