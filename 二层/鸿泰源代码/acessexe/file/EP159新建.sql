exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0107" ("INVOICE_NO","SUPP_PTR","INV_TP","EMPL_PTR","INV_DATE","STATUS","INV_TOTAL","MATL_TOT","FED_TAX","EX_RATE","ENT_DATE","FED_SHIP_TAX_FLAG","FED_MISC_TAX_FLAG","DUE_DATE","MISC_TOT","FED_RATE","CURRENCY_PTR","gl_acct_ptr","ttype","ap_check_list_ptr") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(10),@P2 int,@P3 varchar(1),@P4 int,@P5 datetime,@P6 smallint,@P7 money,@P8 money,@P9 money,@P10 float,@P11 datetime,@P12 varchar(1),@P13 varchar(1),@P14 datetime,@P15 money,@P16 float,@P17 int,@P18 int,@P19 tinyint,@P20 int','CK00000004',1,'6',1,'2014-04-30 00:00:00',1,$40.0000,$38.4600,$1.5400,1,'2014-04-30 00:00:00','N','N','2014-05-01 00:00:00',$0.0000,0,1,30,0,2
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0105" ("VOUCHER","BATCH_NUMBER","VOU_TYPE","TRANS_TYPE","SOURCE_PTR","ENTERED_BY_EMPL_PTR","ENTERED_DT","ATTACHED","FYEAR","PERIOD","SUPP_PTR") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(12),@P2 varchar(15),@P3 smallint,@P4 smallint,@P5 int,@P6 int,@P7 datetime,@P8 smallint,@P9 int,@P10 smallint,@P11 int','TD140400003 ','CK00000004 思方',0,1,3,1,'2014-04-30 00:00:00',2,2014,4,1
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0106" ("GL_HEADER_PTR","GL_ACCT_NO_PTR","REF_NUMBER","DESCRIPTION","SRCE_PTR","AMOUNT","D_C","FYEAR","PERIOD","CURR_PTR","EXCH_RATE","ORIG_AMOUNT") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 varchar(4),@P4 varchar(10),@P5 int,@P6 numeric(18,2),@P7 varchar(1),@P8 int,@P9 smallint,@P10 int,@P11 float,@P12 numeric(18,2)',3,11,'思方','购买原材料',1,38.46,'D',NULL,NULL,1,1,38.46
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0456" SET "status"=@P1,"Audited_by"=@P2,"Audited_date"=@P3 WHERE "rkey"=@P4 AND "status"=@P5 AND "Audited_by" IS NULL AND "Audited_date" IS NULL',N'@P1 smallint,@P2 int,@P3 datetime,@P4 int,@P5 smallint',2,1,'2014-04-30 16:05:16',1,0
go
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0022" SET "quan_invoiced"=@P1 WHERE "RKEY"=@P2 AND "quan_invoiced"=@P3',N'@P1 numeric(18,6),@P2 int,@P3 numeric(18,6)',4.000000,1,0
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0456" SET "status"=@P1 WHERE "rkey"=@P2 AND "status"=@P3',N'@P1 smallint,@P2 int,@P3 smallint',1,1,2
go
exec sp_executesql N'UPDATE "SJ_V20_live".."data0096" SET "invoice_ptr"=@P1 WHERE "RKEY"=@P2 AND "invoice_ptr" IS NULL',N'@P1 int,@P2 int',3,1
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0079" ("INVOICE_PTR","GRN_PTR","quan_invd","D0022_PTR","TAX_2","PRICE","EXCH_RATE") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 float,@P4 int,@P5 float,@P6 float,@P7 float',3,1,4,1,4,9.6153846153846096,1
go
