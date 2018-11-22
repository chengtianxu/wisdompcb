select SRCE_PTR,LINE_01+CHAR(13)+LINE_02+CHAR(13)+LINE_03+CHAR(13)+LINE_04+CHAR(13)+
LINE_05+CHAR(13)+LINE_06+CHAR(13)+LINE_07+CHAR(13)+LINE_08+CHAR(13)+LINE_09+CHAR(13)+LINE_10+CHAR(13)+
LINE_11+CHAR(13)+LINE_12+CHAR(13)+LINE_13+CHAR(13)+LINE_14+CHAR(13)+LINE_15+CHAR(13)+
LINE_16+CHAR(13)+LINE_17+CHAR(13)+LINE_18+CHAR(13)+LINE_19+CHAR(13)+LINE_20 +CHAR(13) as cy into #33 from [192.168.1.253].sj_v20_live.dbo.Data0046
where SEQNO=1


select SRCE_PTR,LINE_01+CHAR(13)+LINE_02+CHAR(13)+LINE_03+CHAR(13)+LINE_04+CHAR(13)+
LINE_05+CHAR(13)+LINE_06+CHAR(13)+LINE_07+CHAR(13)+LINE_08+CHAR(13)+LINE_09+CHAR(13)+LINE_10+CHAR(13)+
LINE_11+CHAR(13)+LINE_12+CHAR(13)+LINE_13+CHAR(13)+LINE_14+CHAR(13)+LINE_15+CHAR(13)+
LINE_16+CHAR(13)+LINE_17+CHAR(13)+LINE_18+CHAR(13)+LINE_19+CHAR(13)+LINE_20 +CHAR(13) as cy into #11 from [192.168.1.253].sj_v20_live.dbo.Data0046
where SEQNO=2


select * from data0492

select * from #55 where SRCE_PTR =12652

select * from Data0025 where rkey =12652

select #33.SRCE_PTR, case when #11.cy is not null then #33.cy+#11.cy else #33.cy end as cy into #55
from #33 left join #11  on #11.SRCE_PTR=#33.SRCE_PTR


select layers_info,* from Data0025
--update data0025 set layers_info=(select cy from #55 where #55.SRCE_PTR=data0025.RKEY )
where RKEY in (select srce_ptr from #55 where #55.SRCE_PTR=data0025.RKEY)

select * from data0089 
select layers_info,* from Data0025
--update data0025 set layers_info=(select cy from #33 where #33.SRCE_PTR=12652)
where RKEY=12652 