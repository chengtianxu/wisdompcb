( select b.ABBR_NAME,a.code,a.INV_PART_NUMBER, a.RKEY, a.RKEY28,a.RKEY15,a.isSelect,a.isSync
  From DATA0028_15  a 
 left outer  join data0015 b on a.rkey15=b.RKEY
)a