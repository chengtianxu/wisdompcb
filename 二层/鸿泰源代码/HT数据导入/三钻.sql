select distinct SOURCE_PTR  into #11 from [192.168.1.253].sj_v20_live.dbo.Data0029
where flow_no=2



select MAX(SEQ_NO) seq_no,SOURCE_PTR into #12  from Data0029 
group by SOURCE_PTR 
having SOURCE_PTR in (select * from #11 )

select distinct  #12.* into #13 from [192.168.1.253].sj_v20_live.dbo.Data0029 inner join #12 on #12.SOURCE_PTR=data0029.SOURCE_PTR
where flow_no=2 

select top 100 * from data0029

select  seq_no+1 as s1,SOURCE_PTR into #14 from #12 
select  s1+1 as s2,SOURCE_PTR,'Èý×ê' as REmark  into #15 from #14 

select SOURCE_PTR,UNIT,MARK,HOLES_DIA,TOLERANCE,DRILL_DIA,
PANEL_A,PANEL_B,PTH,REMARK,SEQ_NO,SEQ_NR,PANEL_D into #16 from [192.168.1.253].sj_v20_live.dbo.Data0029
 where SOURCE_PTR in (select SOURCE_PTR from #12 ) and flow_no=2 
 


select #16.SOURCE_PTR,UNIT,MARK,HOLES_DIA,TOLERANCE,DRILL_DIA,
PANEL_A,PANEL_B,PTH,#16.REMARK,#15.s2+SEQ_NO as SEQ_NO,SEQ_NR,PANEL_D 
into #17
 from #16 left join #15 on #15.SOURCE_PTR=#16.source_ptr
 
 
insert into #17( SOURCE_PTR,UNIT,MARK,HOLES_DIA,TOLERANCE,DRILL_DIA,
PANEL_A,PANEL_B,PTH,REMARK,SEQ_NO,SEQ_NR,PANEL_D )
 select SOURCE_PTR, '' as UNIT,'' as MARK,  '' as HOLES_DIA, '' as TOLERANCE,'' as DRILL_DIA,
'' as PANEL_A, '' as PANEL_B,'' as PTH, '' as REMARK, s1 as SEQ_NO,'' as SEQ_NR,'' as PANEL_D from #14


insert into #17( SOURCE_PTR,UNIT,MARK,HOLES_DIA,TOLERANCE,DRILL_DIA,
PANEL_A,PANEL_B,PTH,REMARK,SEQ_NO,SEQ_NR,PANEL_D )
 select SOURCE_PTR, '' as UNIT,'' as MARK,  '' as HOLES_DIA, '' as TOLERANCE,'' as DRILL_DIA,
'' as PANEL_A, '' as PANEL_B,'' as PTH, REMARK, s2 as SEQ_NO,'' as SEQ_NR,'' as PANEL_D from #15

select * from  #17
order by SOURCE_PTR,SEQ_NO


insert into Data0029( SOURCE_PTR,UNIT,MARK,HOLES_DIA,TOLERANCE,DRILL_DIA,
PANEL_A,PANEL_B,PTH,REMARK,SEQ_NO,SEQ_NR,PANEL_D )
select SOURCE_PTR,UNIT,MARK,HOLES_DIA,TOLERANCE,DRILL_DIA,
PANEL_A,PANEL_B,PTH,REMARK,SEQ_NO,SEQ_NR,PANEL_D  from #17

select * from Data0025 where RKEY =10535