declare
@vwhere1 int,
@vdate1 datetime,
@vdate2 datetime
select @vwhere1=1,@vdate1='2013-06-04 08:00:00',@vdate2='2013-06-05 08:00:00'
select 11 id,Data0048.rkey rkey,Data0006.WORK_ORDER_NUMBER,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0050.CATALOG_NUMBER,D34.SEQ_NR,cast(D34.SEQ_NR+10 as varchar)+'.'+D34.DEPT_NAME as dept_name,
Data0048.PANELS,Data0048.QTY_PROD*Data0047.PARAMETER_VALUE as jcmj
into #temp1 
from data0048
                    INNER JOIN Data0006 ON Data0048.WO_PTR=Data0006.RKEY
                    INNER JOIN Data0025 ON Data0006.BOM_PTR=Data0025.RKEY
                    INNER JOIN Data0050 ON Data0025.ANCESTOR_PTR=Data0050.RKEY
                    inner join Data0034 on Data0048.FM_DEPT_PTR=Data0034.RKEY
                    INNER JOIN Data0034 D34 ON Data0034.DEPT_PTR=D34.RKEY
                    left join data0047 on Data0025.RKEY=Data0047.SOURCE_POINTER and Data0047.PARAMETER_PTR=7 
WHERE  Data0048.INTIME<=@vdate2 AND Data0048.OUTTIME>=@vdate2 and 1=@vwhere1
       and D34.BARCODE_ENTRY_FLAG='y' and  data0050.customer_part_number like '%3112%'  and D34.seq_nr=114

--ORDER BY D34.DEPT_NAME
insert into #temp1
select 12 id,Data0056.rkey rkey,data0006.WORK_ORDER_NUMBER,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0050.CATALOG_NUMBER,D34.SEQ_NR,cast(D34.SEQ_NR+10 as varchar)+'.'+D34.DEPT_NAME as dept_name, data0056.PANELS,Data0056.QTY_BACKLOG*Data0047.PARAMETER_VALUE as jcmj
  from data0056   
         inner join Data0034 on Data0056.DEPT_PTR=Data0034.RKEY
         inner join Data0034 d34 on Data0034.DEPT_PTR=d34.rkey
         inner join data0006 on Data0056.WO_PTR=Data0006.RKEY
         INNER JOIN Data0025 ON Data0006.BOM_PTR=Data0025.RKEY
         INNER JOIN Data0050 ON Data0025.ANCESTOR_PTR=Data0050.RKEY
          left join data0047 on Data0025.RKEY=Data0047.SOURCE_POINTER and Data0047.PARAMETER_PTR=7 
where  Data0056.INTIME<=@vdate2  and D34.BARCODE_ENTRY_FLAG='y' and  data0050.customer_part_number like '%3112%'  and D34.seq_nr=114
--2.本期进的数量                            
select 21 id,Data0048.rkey rkey,Data0006.WORK_ORDER_NUMBER,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0050.CATALOG_NUMBER,D34.SEQ_NR,cast(D34.SEQ_NR+10 as varchar)+'.'+D34.DEPT_NAME as dept_name,Data0048.PANELS,Data0048.QTY_PROD*Data0047.PARAMETER_VALUE as rmj 
into #temp2
from data0048
                    INNER JOIN Data0006 ON Data0048.WO_PTR=Data0006.RKEY
                    INNER JOIN Data0025 ON Data0006.BOM_PTR=Data0025.RKEY
                    INNER JOIN Data0050 ON Data0025.ANCESTOR_PTR=Data0050.RKEY
                    inner join Data0034 on Data0048.TO_DEPT_PTR=Data0034.RKEY
                    INNER JOIN Data0034 D34 ON Data0034.DEPT_PTR=D34.RKEY
                    left join data0047 on Data0025.RKEY=Data0047.SOURCE_POINTER and Data0047.PARAMETER_PTR=7
WHERE  Data0048.OUTTIME>=@vdate1 AND Data0048.OUTTIME<=@vdate2 and D34.BARCODE_ENTRY_FLAG='y'   and  data0050.customer_part_number like '%3112%'  and D34.seq_nr=114            
insert into #temp2
select 22 id,Data0056.rkey rkey,Data0006.WORK_ORDER_NUMBER,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0050.CATALOG_NUMBER,D34.SEQ_NR,cast(D34.SEQ_NR+10 as varchar)+'.'+D34.DEPT_NAME as dept_name,
       Data0056.PANELS,Data0056.QTY_BACKLOG*Data0047.PARAMETER_VALUE as rmj
 from Data0056 inner join Data0034 on Data0056.DEPT_PTR=Data0034.RKEY 
               INNER JOIN Data0034 D34 ON Data0034.DEPT_PTR=D34.RKEY
               inner join Data0006 on Data0056.WO_PTR=Data0006.RKEY
               inner join Data0025 on Data0006.BOM_PTR=Data0025.RKEY
               inner join Data0050 on Data0025.ANCESTOR_PTR=Data0050.RKEY
               left join data0047 on Data0025.RKEY=Data0047.SOURCE_POINTER and Data0047.PARAMETER_PTR=7
where  Data0056.INTIME>=@vdate1 AND Data0056.INTIME<=@vdate2 and Data0056.WO_PTR not in(select wo_ptr from data0048)
and  RIGHT(Data0006.WORK_ORDER_NUMBER,1) not in('A','B','C','E','F','G','H','I')
and d34.BARCODE_ENTRY_FLAG='y' and  data0050.customer_part_number like '%3112%'  and D34.seq_nr=114
--3.本期出的数量
select 31 id ,Data0048.rkey rkey,Data0006.WORK_ORDER_NUMBER,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0050.CATALOG_NUMBER,D34.SEQ_NR,cast(D34.SEQ_NR+10 as varchar)+'.'+D34.DEPT_NAME as dept_name,Data0048.PANELS,Data0048.QTY_PROD*Data0047.PARAMETER_VALUE as cmj
into #temp3
 from data0048
                    INNER JOIN Data0006 ON Data0048.WO_PTR=Data0006.RKEY
                    INNER JOIN Data0025 ON Data0006.BOM_PTR=Data0025.RKEY
                    INNER JOIN Data0050 ON Data0025.ANCESTOR_PTR=Data0050.RKEY
                    inner join Data0034 on Data0048.FM_DEPT_PTR=Data0034.RKEY
                    INNER JOIN Data0034 D34 ON Data0034.DEPT_PTR=D34.RKEY
                    left join data0047 on Data0025.RKEY=Data0047.SOURCE_POINTER and Data0047.PARAMETER_PTR=7
WHERE  Data0048.OUTTIME>=@vdate1 AND Data0048.OUTTIME<=@vdate2   and D34.BARCODE_ENTRY_FLAG='y' and  data0050.customer_part_number like '%3112%'  and D34.seq_nr=114
--4.本期报废
select  43 id,Data0058.rkey rkey,Data0006.WORK_ORDER_NUMBER,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0050.CATALOG_NUMBER,D34.SEQ_NR,cast(D34.SEQ_NR+10 as varchar)+'.'+D34.DEPT_NAME as dept_name,Data0058.QTY_REJECT,Data0058.QTY_REJECT*Data0047.PARAMETER_VALUE as bfmj
into #temp_bf
from data0058 
         inner join Data0006 on Data0058.WO_PTR=Data0006.RKEY
         inner join Data0025 on Data0006.BOM_PTR=Data0025.RKEY
         inner join Data0050 on Data0025.ANCESTOR_PTR=Data0050.RKEY
         inner join Data0034 on Data0058.DEPT_PTR=Data0034.RKEY
         inner join Data0034 d34 on Data0034.DEPT_PTR=d34.rkey
         left join data0047 on Data0025.RKEY=Data0047.SOURCE_POINTER and Data0047.PARAMETER_PTR=7
where   Data0058.TDATETIME>=@vdate1 and Data0058.TDATETIME<=@vdate2 and D34.BARCODE_ENTRY_FLAG='y' and  data0050.customer_part_number like '%3112%'  and D34.seq_nr=114
         
select work_order_number,customer_part_number,cp_rev,SEQ_NR,dept_name,CATALOG_NUMBER,SUM(panels) panels,SUM(jcmj) jcmj into #temp4 from #temp1
       group by work_order_number,customer_part_number,cp_rev,CATALOG_NUMBER,SEQ_NR,dept_name
       
select work_order_number,customer_part_number,cp_rev,SEQ_NR,dept_name,CATALOG_NUMBER,SUM(panels) panels,SUM(rmj) rmj into #temp5 from #temp2
       group by work_order_number,customer_part_number,cp_rev,CATALOG_NUMBER,SEQ_NR,dept_name     

select work_order_number,customer_part_number,cp_rev,SEQ_NR,dept_name,CATALOG_NUMBER,SUM(panels) panels,SUM(cmj) cmj into #temp6 from #temp3
       group by work_order_number,customer_part_number,cp_rev,CATALOG_NUMBER,SEQ_NR,dept_name  
select work_order_number,customer_part_number,cp_rev,SEQ_NR,dept_name,CATALOG_NUMBER,SUM(QTY_REJECT) QTY_REJECT,SUM(bfmj) bfmj into #temp_bf1 from #temp_bf
       group by work_order_number,customer_part_number,cp_rev,CATALOG_NUMBER,SEQ_NR,dept_name
       
       select * from #temp1  --第二位1为48流转表，2为56WIP表，3为58报废表
       union
       select * from #temp2
       union
       select * from #temp3
       union
       select * from #temp_bf      
       
       
       select 1,* from #temp4 --1为存，2为进，3为出，4为废
       union
       select 2,* from #temp5
       union
       select 3,* from #temp6
       union
       select 4,* from #temp_bf1

select --case when a.work_order_number IS null then (case when b.work_order_number IS null then c.work_order_number else b.work_order_number end ) else a.work_order_number end as work_order_number,
       case when a.customer_part_number is null then (case when b.customer_part_number is null then (case when c.customer_part_number is null then d.customer_part_number else c.customer_part_number end) else b.customer_part_number end) else a.customer_part_number end as customer_part_number,
       case when a.cp_rev is null then (case when b.cp_rev is null then (case when c.cp_rev is null then d.cp_rev else c.cp_rev end) else b.cp_rev end) else a.cp_rev end as cp_rev,
       case when a.CATALOG_NUMBER is null then (case when b.CATALOG_NUMBER is null then (case when c.CATALOG_NUMBER is null then d.CATALOG_NUMBER else c.CATALOG_NUMBER end) else b.CATALOG_NUMBER end) else a.CATALOG_NUMBER end as CATALOG_NUMBER,
        case when a.dept_name is null then (case when b.dept_name is null then (case when c.dept_name is null then d.dept_name else c.dept_name end) else b.dept_name end) else a.dept_name end as dept_name,
         case when a.SEQ_NR is null then (case when b.SEQ_NR is null then (case when c.SEQ_NR is null then d.SEQ_NR else c.SEQ_NR end) else b.SEQ_NR end) else a.SEQ_NR end as SEQ_NR,
       sum(a.panels) as jc_pnl,sum(a.jcmj) as jc_mj,sum(b.panels) as r_pnl,sum(b.rmj) as r_mj,sum(c.panels) as c_pnl,sum(c.cmj) as c_mj,sum(d.qty_reject) qty_reject, SUM(d.bfmj) as bfmj
         from 
#temp4 a  full join #temp5 b
on a.WORK_ORDER_NUMBER=b.WORK_ORDER_NUMBER and a.dept_name=b.dept_name
full join #temp6 c 
on a.WORK_ORDER_NUMBER=c.WORK_ORDER_NUMBER and a.dept_name=c.dept_name
full join #temp_bf1 d
on a.WORK_ORDER_NUMBER=d.WORK_ORDER_NUMBER and a.dept_name=d.dept_name
group by  case when a.customer_part_number is null then (case when b.customer_part_number is null then (case when c.customer_part_number is null then d.customer_part_number else c.customer_part_number end) else b.customer_part_number end) else a.customer_part_number end,
       case when a.cp_rev is null then (case when b.cp_rev is null then (case when c.cp_rev is null then d.cp_rev else c.cp_rev end) else b.cp_rev end) else a.cp_rev end,
       case when a.CATALOG_NUMBER is null then (case when b.CATALOG_NUMBER is null then (case when c.CATALOG_NUMBER is null then d.CATALOG_NUMBER else c.CATALOG_NUMBER end) else b.CATALOG_NUMBER end) else a.CATALOG_NUMBER end,
        case when a.dept_name is null then (case when b.dept_name is null then (case when c.dept_name is null then d.dept_name else c.dept_name end) else b.dept_name end) else a.dept_name end,
          case when a.SEQ_NR is null then (case when b.SEQ_NR is null then (case when c.SEQ_NR is null then d.SEQ_NR else c.SEQ_NR end) else b.SEQ_NR end) else a.SEQ_NR end
        order by  case when a.SEQ_NR is null then (case when b.SEQ_NR is null then (case when c.SEQ_NR is null then d.SEQ_NR else c.SEQ_NR end) else b.SEQ_NR end) else a.SEQ_NR end
drop table #temp1,#temp2,#temp3,#temp4,#temp5,#temp6,#temp_bf,#temp_bf1	



