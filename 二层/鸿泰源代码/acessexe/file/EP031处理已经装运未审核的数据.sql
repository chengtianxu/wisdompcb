EP031处理已经装运未审核的数据
if exists(select 1 from tempdb..sysobjects where id=object_id('tempdb..#tmp'))
drop table #tmp

select data0053.rkey,quan_shp=sum(data0052.quan_shp)
into #tmp
From Data0439 inner join
     Data0064 on Data0439.Rkey=Data0064.packing_list_ptr inner join
     Data0052 on Data0064.Rkey=Data0052.so_shp_ptr inner join
     Data0053 on Data0052.Data0053_ptr=Data0053.Rkey
where isnull(Data0439.audited_by_ptr,0)=0
group by data0053.rkey

Update Data0053
Set Data0053.to_be_audit=IsNull(#tmp.quan_shp,0)
From Data0053 left join
     #tmp on Data0053.Rkey=#tmp.Rkey
where Data0053.to_be_audit<>IsNull(#tmp.quan_shp,0)

go
