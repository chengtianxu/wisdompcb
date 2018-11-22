
alter table Data0279  alter column PARAMETER_VALUE varchar(50)

select RKEY,IES_FLOW,IES_CRP,IES_COST,IES_PROD,PARAMETER_PTR,PARAMETER_VALUE,SOURCE_PTR into #KD0279 from [192.168.1.253].sj_v20_live.dbo.data0279 where SOURCE_PTR in (select RKEY from data0025) 

SET IDENTITY_INSERT data0279 ON
insert into Data0279( RKEY,IES_FLOW,IES_CRP,IES_COST,IES_PROD,PARAMETER_PTR,PARAMETER_VALUE,SOURCE_PTR  )
select RKEY,IES_FLOW,IES_CRP,IES_COST,IES_PROD,PARAMETER_PTR,PARAMETER_VALUE,SOURCE_PTR  from #KD0279
WHERE NOT EXISTS(SELECT RKEY FROM Data0279 WHERE Data0279.RKEY=#KD0279.RKEY)
go
drop table #KD0279

go
SET IDENTITY_INSERT data0279 off


sp_help Data0038 

delete from Data0038 

select RKEY,SOURCE_PTR,DEPT_PTR,DEF_ROUT_INST,FLOW_NO,STEP_NUMBER,
FLOW_SPFC,OUTP_SPFC,tooling_rev,tool_old_rev,confirmed,confirmed_by,confirmed_DATE,
TOOL_REMARK into #KD0038 from [192.168.1.253].sj_v20_live.dbo.data0038 
where SOURCE_PTR in (select RKEY from data0025) and flow_no=0

drop table #KD0038

select COUNT(SOURCE_PTR) ,COUNT(STEP_NUMBER), SOURCE_PTR,STEP_NUMBER from  #KD0038 
group by SOURCE_PTR,STEP_NUMBER
having COUNT(SOURCE_PTR)>1 and count(STEP_NUMBER)>1




SET IDENTITY_INSERT data0038 ON
insert into Data0038( RKEY,SOURCE_PTR,DEPT_PTR,DEF_ROUT_INST,FLOW_NO,STEP_NUMBER,
FLOW_SPFC,OUTP_SPFC,tooling_rev,tool_old_rev,confirmed,confirmed_by,confirmed_DATE,
TOOL_REMARK  )
select RKEY,SOURCE_PTR,DEPT_PTR,DEF_ROUT_INST,FLOW_NO,STEP_NUMBER,
FLOW_SPFC,OUTP_SPFC,tooling_rev,tool_old_rev,confirmed,confirmed_by,confirmed_DATE,
TOOL_REMARK from #KD0038
WHERE NOT EXISTS(SELECT RKEY FROM Data0038 WHERE Data0038.RKEY=#KD0038.RKEY)
go
drop table #KD0038 
go
SET IDENTITY_INSERT data0038 off


select RKEY,SOURCE_PTR,UNIT,MARK,HOLES_DIA,TOLERANCE,DRILL_DIA,
PANEL_A,PANEL_B,PTH,REMARK,SEQ_NO,SEQ_NR,PANEL_D into #KD0029
 from [192.168.1.253].sj_v20_live.dbo.data0029
where SOURCE_PTR in (select RKEY from data0025) and  flow_no=0

drop table #KD0029

alter table Data0029  alter column TOLERANCE varchar(25)

alter table Data0029  alter column  HOLES_DIA varchar(30)
alter table Data0029  alter column  PANEL_A varchar(25)
alter table Data0029  alter column PANEL_B varchar(25)
alter table Data0029  alter column PANEL_D varchar(25)
alter table Data0029  alter column PTH varchar(5)

SET IDENTITY_INSERT data0029 ON
insert into Data0029( RKEY,SOURCE_PTR,UNIT,MARK,HOLES_DIA,TOLERANCE,DRILL_DIA,
PANEL_A,PANEL_B,PTH,REMARK,SEQ_NO,SEQ_NR,PANEL_D )
select RKEY,SOURCE_PTR,UNIT,MARK,HOLES_DIA,TOLERANCE,DRILL_DIA,
PANEL_A,PANEL_B,PTH,REMARK,SEQ_NO,SEQ_NR,PANEL_D  from #KD0029
WHERE NOT EXISTS(SELECT RKEY FROM Data0029 WHERE Data0029.RKEY=#KD0029.RKEY)
go

SET IDENTITY_INSERT data0029 Off


sp_help Data0494 

sp_help sData0494 



select PARAMETER_PTR,PARAMETER_VALUE,
custpart_ptr,step_number from Data0494 


select data0494.PARAMETER_PTR,data0494.PARAMETER_VALUE,data0038.SOURCE_PTR as custpart_ptr,data0038.STEP_NUMBER into #KD0494
 from [192.168.1.253].sj_v20_live.dbo.Data0494 inner join [192.168.1.253].sj_v20_live.dbo.Data0038 on data0038.RKEY=data0494.ROUTE_STEP_PTR
 where data0494.SOURCE_PTR in (select RKEY from data0025) and data0038.FLOW_NO=0
 

 
alter table Data0494  alter column PARAMETER_VALUE varchar(100)

select row_number() over (partition by custpart_ptr,step_number 
order by custpart_ptr,step_number ) as seq_no,PARAMETER_PTR,
PARAMETER_VALUE,custpart_ptr,step_number into #D494 from #KD0494

insert into Data0494( PARAMETER_PTR,PARAMETER_VALUE,
custpart_ptr,step_number,seq_no )
select PARAMETER_PTR,PARAMETER_VALUE,
custpart_ptr,step_number,seq_no from #D494




select SOURCE_PTR ,data0038.STEP_NUMBER,  * from Data0038 









select * from #D494

select * from  data0502

select * from Data0025  where MANU_PART_NUMBER='s12729C4A'

select top 10  source_ptr,sheet_BMP,pnl2_bmp into #11 from Data0502 where source_ptr=15377


insert into Data0502(source_ptr,sheet_BMP,pnl2_bmp)
select source_ptr,sheet_BMP,pnl2_bmp from #11 



select RKEY as  FILE_POINTER,6010 as SOURCE_TYPE,general_req as memo_text into #22 from [192.168.1.253].sj_v20_live.dbo.data0010


insert into data0011( FILE_POINTER,SOURCE_TYPE,memo_text )
select  FILE_POINTER,SOURCE_TYPE,memo_text from #22