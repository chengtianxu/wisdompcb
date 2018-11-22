(--工厂同步设置列表
select a.rkey,a.rkey17,a.rkey15,b.ABBR_NAME,a.INV_PART_NUMBER,a.isSelect,a.isSync
from data0017_15 a left outer join data0015 b on a.rkey15=b.RKEY
) a