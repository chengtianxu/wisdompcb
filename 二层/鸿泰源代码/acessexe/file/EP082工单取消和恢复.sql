--EP082工单取消和恢复
--当部分过数有两个工序在线时，取消恢复后数据会变
--取消
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0156" 
("WO_PTR","DEPT_PTR","UNIT_PTR","EMPLOYEE_PTR","FLOW_NO","STEP","QTY_BACKLOG","PANELS","INTIME","TO_BE_STOCKED","TDATE","LOC_PTR","REFERENCE","WTYPE","PR_PTR","D0069_PTR","D0071_PTR","rework_fm_dept_ptr","rework_fm_step","send_to_dept_ptr","sendtime","d0038_ptr","SETS_QTY","ipqc_flg","qty_rej","qty_rej_to_stocked") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 smallint,@P6 smallint,@P7 float,@P8 int,@P9 datetime,@P10 float,@P11 datetime,@P12 smallint,@P13 varchar(1),@P14 tinyint,@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 datetime,@P22 int,@P23 int,@P24 bit,@P25 int,@P26 int',
 24622,467,0,38,0,15,126,2,'2014-02-20 09:14:14',0,NULL,NULL,'',0,NULL,NULL,NULL,467,15,NULL,NULL,292180,9,0,0,0
 --126为两个工序之和
 
 exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0056" WHERE "RKEY"=@P1',N'@P1 int',36247 --其中一个在线
                                                                                               --
                                                                                               
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011" ("FILE_POINTER","SOURCE_TYPE","NOTE_PAD_LINE_1","NOTE_PAD_LINE_2","NOTE_PAD_LINE_3","NOTE_PAD_LINE_4") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 varchar(2),@P4 varchar(1),@P5 varchar(1),@P6 varchar(1)',24622,2,'te','',''

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0117" ("SOURCE_PTR","SOURCE_TYPE","NOTEPAD_PTR","EMPL_PTR","TDATE","ACTION") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 int,@P4 int,@P5 datetime,@P6 smallint',24622,2,169288,1,'2014-02-20 11:57:22',3 
Update Data0006 set prod_status=203,reference_ptr=1045 Where rkey=24622

--恢复
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011" ("FILE_POINTER","SOURCE_TYPE","NOTE_PAD_LINE_1","NOTE_PAD_LINE_2","NOTE_PAD_LINE_3","NOTE_PAD_LINE_4") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 varchar(4),@P4 varchar(1),@P5 varchar(1),@P6 varchar(1)',24622,2,'11aa','','',''
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0117" ("SOURCE_PTR","SOURCE_TYPE","NOTEPAD_PTR","EMPL_PTR","TDATE","ACTION") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 int,@P4 int,@P5 datetime,@P6 smallint',24622,2,169289,1,'2014-02-20 12:05:53',4
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0056" ("WO_PTR","DEPT_PTR","UNIT_PTR","EMPLOYEE_PTR","FLOW_NO","STEP","QTY_BACKLOG","PANELS","INTIME","TO_BE_STOCKED","TDATE","LOC_PTR","WTYPE","REFERENCE","PR_PTR","D0069_PTR","D0071_PTR","d0038_ptr","rework_fm_dept_ptr","rework_fm_step","send_to_dept_ptr","sendtime","SETS_QTY","ipqc_flg","qty_rej","qty_rej_to_stocked") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 smallint,@P6 smallint,@P7 float,@P8 int,@P9 datetime,@P10 float,@P11 datetime,@P12 smallint,@P13 tinyint,@P14 varchar(1),@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 int,@P22 datetime,@P23 int,@P24 bit,@P25 int,@P26 int',24622,467,0,38,0,15,126,2,'2014-02-20 09:14:14',0,NULL,NULL,0,'',NULL,NULL,NULL,292180,467,15,NULL,NULL,9,0,0,0

exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0156" WHERE "RKEY"=@P1',N'@P1 int',1045


Update Data0006 set prod_status=3 Where rkey=24622
Update Data0006 set RELEASE_DATE='2014-02-20 12:05:53' where rkey=24622

--------------------------------------
--取消
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0156" ("WO_PTR","DEPT_PTR","UNIT_PTR","EMPLOYEE_PTR","FLOW_NO","STEP","QTY_BACKLOG","PANELS","INTIME","TO_BE_STOCKED","TDATE","LOC_PTR","REFERENCE","WTYPE","PR_PTR","D0069_PTR","D0071_PTR","rework_fm_dept_ptr","rework_fm_step","send_to_dept_ptr","sendtime","d0038_ptr","SETS_QTY","ipqc_flg","qty_rej","qty_rej_to_stocked") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 smallint,@P6 smallint,@P7 float,@P8 int,@P9 datetime,@P10 float,@P11 datetime,@P12 smallint,@P13 varchar(1),@P14 tinyint,@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 datetime,@P22 int,@P23 int,@P24 bit,@P25 int,@P26 int',24622,448,0,25,0,14,46,0,'2013-10-14 03:30:44',0,NULL,NULL,'',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,292194,5,0,NULL,0
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0156" ("WO_PTR","DEPT_PTR","UNIT_PTR","EMPLOYEE_PTR","FLOW_NO","STEP","QTY_BACKLOG","PANELS","INTIME","TO_BE_STOCKED","TDATE","LOC_PTR","REFERENCE","WTYPE","PR_PTR","D0069_PTR","D0071_PTR","rework_fm_dept_ptr","rework_fm_step","send_to_dept_ptr","sendtime","d0038_ptr","SETS_QTY","ipqc_flg","qty_rej","qty_rej_to_stocked") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 smallint,@P6 smallint,@P7 float,@P8 int,@P9 datetime,@P10 float,@P11 datetime,@P12 smallint,@P13 varchar(1),@P14 tinyint,@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 datetime,@P22 int,@P23 int,@P24 bit,@P25 int,@P26 int',24622,467,0,38,0,15,80,2,'2014-02-20 09:14:14',0,NULL,NULL,'',0,NULL,NULL,NULL,467,15,NULL,NULL,292180,9,0,0,0
go
exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0056" WHERE "RKEY"=@P1',N'@P1 int',36246
go
exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0056" WHERE "RKEY"=@P1',N'@P1 int',36248
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011" ("FILE_POINTER","SOURCE_TYPE","NOTE_PAD_LINE_1","NOTE_PAD_LINE_2","NOTE_PAD_LINE_3","NOTE_PAD_LINE_4") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 varchar(2),@P4 varchar(1),@P5 varchar(1),@P6 varchar(1)',24622,2,'ss','','',''
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0117" ("SOURCE_PTR","SOURCE_TYPE","NOTEPAD_PTR","EMPL_PTR","TDATE","ACTION") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 int,@P4 int,@P5 datetime,@P6 smallint',24622,2,169293,1,'2014-02-22 09:10:41',3
go

--恢复
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0011" ("FILE_POINTER","SOURCE_TYPE","NOTE_PAD_LINE_1","NOTE_PAD_LINE_2","NOTE_PAD_LINE_3","NOTE_PAD_LINE_4") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 varchar(1),@P4 varchar(1),@P5 varchar(1),@P6 varchar(1)',24622,2,'s','','',''
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0117" ("SOURCE_PTR","SOURCE_TYPE","NOTEPAD_PTR","EMPL_PTR","TDATE","ACTION") VALUES (@P1,@P2,@P3,@P4,@P5,@P6); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 smallint,@P3 int,@P4 int,@P5 datetime,@P6 smallint',24622,2,169294,1,'2014-02-22 09:13:02',4
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0056" ("WO_PTR","DEPT_PTR","UNIT_PTR","EMPLOYEE_PTR","FLOW_NO","STEP","QTY_BACKLOG","PANELS","INTIME","TO_BE_STOCKED","TDATE","LOC_PTR","WTYPE","REFERENCE","PR_PTR","D0069_PTR","D0071_PTR","d0038_ptr","rework_fm_dept_ptr","rework_fm_step","send_to_dept_ptr","sendtime","SETS_QTY","ipqc_flg","qty_rej","qty_rej_to_stocked") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22,@P23,@P24,@P25,@P26); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 smallint,@P6 smallint,@P7 float,@P8 int,@P9 datetime,@P10 float,@P11 datetime,@P12 smallint,@P13 tinyint,@P14 varchar(1),@P15 int,@P16 int,@P17 int,@P18 int,@P19 int,@P20 int,@P21 int,@P22 datetime,@P23 int,@P24 bit,@P25 int,@P26 int',24622,448,0,25,0,14,46,0,'2013-10-14 03:30:44',0,NULL,NULL,0,'',NULL,NULL,NULL,292194,NULL,NULL,NULL,NULL,5,0,NULL,0
go
exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0156" WHERE "RKEY"=@P1',N'@P1 int',1046
go
exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0156" WHERE "RKEY"=@P1',N'@P1 int',1047
go
Update Data0006 set prod_status=3 Where rkey=24622
Update Data0006 set RELEASE_DATE='2014-02-22 09:13:02' where rkey=24622

go



