--MI÷–BOMÃ·Ωª
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050" 
SET "bom_appr_by"=@P1,"bom_appr_date"=@P2,"BOM_STATUS"=@P3 
WHERE "RKEY"=@P4 AND "bom_appr_by"=@P5 AND "bom_appr_date"=@P6 AND "BOM_STATUS"=@P7',N'@P1 int,@P2 datetime,@P3 tinyint,@P4 int,@P5 int,@P6 datetime,@P7 tinyint',1,'2013-06-18 14:02:08',1,12247,559,'2013-05-16 13:31:00',0