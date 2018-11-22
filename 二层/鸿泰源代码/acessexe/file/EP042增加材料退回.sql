EP042增加材料退回
主表 STATUS=5  5未提交,退回，0提交，1审核通过，
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0906"
 ("REJ_NO","whouse_ptr","supp_ptr","Location_ptr","REF_Number","tran_tp","PRINTED","Create_Date","Create_By","Status","Remark","sys_id","sys_rq") 
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13);
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 nvarchar(14),@P2 int,@P3 int,@P4 int,@P5 nvarchar(2),@P6 int,@P7 varchar(1),@P8 datetime,@P9 int,@P10 int,@P11 nvarchar(4),@P12 varchar(5),@P13 datetime',
  N'RJ201200000038',1,77,1,N'23',19,'N','2013-09-30 22:18:48',1,5,N'asdf','admin','2013-09-30 22:18:48'
  
 明细 tstatus=5   5未提交,退回，0提交，1审核通过，
  exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0096" 
  ("INVT_PTR","REJ_PTR","INV_TRAN_PTR","EMPL_PTR","USER_PTR","TDATE","QUAN_REJD","FLAG","REFERENCE_NUMBER","D0035Flag","tstatus","TRAN_TP","REJ_NO","Remark","d0906_ptr") 
  VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); 
  SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
  N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 float,@P8 varchar(1),@P9 varchar(20),@P10 smallint,@P11 tinyint,@P12 smallint,@P13 varchar(14),@P14 nvarchar(2),@P15 int',
  3815,1,991,1,1,'2013-09-30 22:18:48',11,'2','23                  ',0,5,19,'RJ201200000038',N'a1',13
  
   
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0096" ("INVT_PTR","REJ_PTR","INV_TRAN_PTR","EMPL_PTR","USER_PTR","TDATE","QUAN_REJD","FLAG","REFERENCE_NUMBER","D0035Flag","tstatus","TRAN_TP","REJ_NO","Remark","d0906_ptr") VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 int,@P6 datetime,@P7 float,@P8 varchar(1),@P9 varchar(20),@P10 smallint,@P11 tinyint,@P12 smallint,@P13 varchar(14),@P14 nvarchar(2),@P15 int',3816,2,957,1,1,'2013-09-30 22:18:48',22,'2','23                  ',0,5,19,'RJ201200000038',N'a2',13
GO


----------------------------------------------------------
5未提交,退回，0提交，1审核通过，
SELECT TOP 3 RKEY,STATUS FROM DATA0906 ORDER BY 1 DESC
SELECT  TOP 3 RKEY,TSTATUS FROM DATA0096 ORDER BY 1 DESC

提交
update data0906 set status=0 where rkey=13 
update data0096 set tstatus=0 where d0906_ptr=13

审核
update data0906 set status=1 where rkey=13 
update data0096 set tstatus=1 where d0906_ptr=13
--库存
 update data0022 set quan_on_hand=a.quan_on_hand-isnull(b.quantity,0),QUAN_RETURNED=isnull(a.QUAN_RETURNED,0)+isnull(b.quantity,0) 
 from data0022 a,
 (select inv_tran_ptr,sum(data0096.quan_rejd) as quantity  from data0096 where tran_tp in (19,20) and d0906_ptr=13 group by inv_tran_ptr) b 
  where a.rkey=b.inv_tran_ptr
  --入仓单
   update data0909 set QUAN_RETURNED=isnull(a.QUAN_RETURNED,0)+isnull(b.quantity,0) 
   from data0909 a,
   (select data0022.d0909_ptr,sum(data0096.quan_rejd) as quantity  from data0022,data0096 where data0022.rkey=data0096.inv_tran_ptr and data0096.tran_tp in (19,20) and data0096.d0906_ptr=13 group by data0022.d0909_ptr) b  
   where a.rkey=b.d0909_ptr
   
   update data0071 set QUAN_RETN=isnull(a.QUAN_RETN,0)+isnull(b.quantity,0) 
   from data0071 a,(
   select data0022.source_ptr,sum(data0096.quan_rejd) as quantity  from data0022,data0096 where data0022.rkey=data0096.inv_tran_ptr and data0096.tran_tp in (19,20) and data0096.d0906_ptr=13 group by data0022.source_ptr) b 
   where a.rkey=b.source_ptr
   
   -------------------
   反审核
   
   ate data0906 set status=5 where rkey=13 
   update data0096 set tstatus=5 where d0906_ptr=13 
   
   update data0022 set quan_on_hand=a.quan_on_hand+isnull(b.quantity,0),QUAN_RETURNED=a.QUAN_RETURNED-isnull(b.quantity,0) 
   from data0022 a,(select inv_tran_ptr,sum(data0096.quan_rejd) as quantity  from data0096 where tran_tp in (19,20) and d0906_ptr=13 group by inv_tran_ptr) b  
   where a.rkey=b.inv_tran_ptr
  
   update data0909 set QUAN_RETURNED=isnull(a.QUAN_RETURNED,0)-isnull(b.quantity,0) 
   from data0909 a,
   (select data0022.d0909_ptr,sum(data0096.quan_rejd) as quantity  from data0022,data0096 where data0022.rkey=data0096.inv_tran_ptr and data0096.tran_tp in (19,20) and data0096.d0906_ptr=13 group by data0022.d0909_ptr) b  
   where a.rkey=b.d0909_ptr
   
   update data0071 set QUAN_RETN=isnull(a.QUAN_RETN,0)-isnull(b.quantity,0) 
   from data0071 a,
   (select data0022.source_ptr,sum(data0096.quan_rejd) as quantity  from data0022,data0096 where data0022.rkey=data0096.inv_tran_ptr and data0096.tran_tp in (19,20) and data0096.d0906_ptr=13 group by data0022.source_ptr) b  
   where a.rkey=b.source_ptr
  
	

			
