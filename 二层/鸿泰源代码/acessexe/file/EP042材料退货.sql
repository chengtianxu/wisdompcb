--EP042²ÄÁÏÍË»õ
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0906" 
("REJ_NO","whouse_ptr","supp_ptr","Location_ptr","REF_Number","tran_tp","PRINTED","Create_Date","Create_By","Status","Remark","sys_id","sys_rq") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 nvarchar(13),@P2 int,@P3 int,@P4 int,@P5 nvarchar(3),@P6 int,@P7 varchar(1),@P8 datetime,@P9 int,@P10 int,@P11 nvarchar(3),@P12 varchar(5),@P13 datetime',
 N'RJ20120200377',2,178,2,N'ads',19,'N','2013-11-14 10:08:14',1,5,N'adf','ADMIN','2013-11-14 10:08:14'
 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0096" 
 ("INVT_PTR","REJ_PTR","INV_TRAN_PTR","EMPL_PTR","USER_PTR","TDATE","QUAN_REJD","FLAG","REFERENCE_NUMBER","D0035Flag","tstatus","TRAN_TP","REJ_NO","Remark","d0906_ptr")
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 float,@P8 varchar(1),@P9 varchar(20),@P10 smallint,@P11 tinyint,@P12 smallint,@P13 varchar(13),@P14 nvarchar(1),@P15 int',
  24,1,24217,1,1,'2013-11-14 10:08:14',8,'2','ads                 ',0,5,19,'RJ20120200377',N's',1