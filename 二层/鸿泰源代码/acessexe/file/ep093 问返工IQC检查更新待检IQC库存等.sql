ep093 问返工IQC检查更新待检IQC库存等
update data0022 set quan_in_insp1=isnull(a.quan_in_insp1,0)-isnull(b.quantity,0),
quan_on_hand=isnull(a.quan_on_hand,0)+isnull(b.quan_passed,0)+isnull(b.QUAN_USEASIS,0),
quan_to_be_shipped1=isnull(a.quan_to_be_shipped1,0)+isnull(b.QUAN_returned,0),
quan_to_be_scr1=isnull(a.quan_to_be_scr1,0)+isnull(b.QUAN_scrapd,0),EXPIRE_DATE='2013-11-19 23:59:59'
 from data0022 a,
 ( select Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed, sum(case isnull(data0911.FLAG,0) when 3 then data0911.quan_rejd else 0 end) as QUAN_USEASIS, sum(case isnull(data0911.FLAG,0) when 2 then data0911.quan_rejd else 0 end) as QUAN_returned, sum(case isnull(data0911.FLAG,0) when 1 then data0911.quan_rejd else 0 end) as QUAN_scrapd from Data0910 left join Data0911 on Data0910.rkey=data0911.d0910_ptr where Data0910.rkey=4 group by Data0910.d0909_ptr,data0910.quantity,Data0910.quan_passed) 
 b where a.rkey=b.d0909_ptr and a.rkey=23000
 
 当这批料有发过料，个人认为库存就不对,而且这是后面运行
 
 返工IQC不需要再入仓