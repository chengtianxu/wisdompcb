(--工厂同步设置列表
select a.rkey,a.rkey23,a.rkey15,b.ABBR_NAME,a.CODE,a.isSelect,a.isSync
from data0023_15 a left outer join data0015 b on a.rkey15=b.RKEY
) a