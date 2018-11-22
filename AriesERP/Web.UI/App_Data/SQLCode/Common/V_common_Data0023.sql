(--供应商查询
SELECT  a.ABBR_NAME ,a.CODE, a.SUPPLIER_NAME,a.CURRENCY_PTR,c.STATE_TAX,d.curr_code,d.curr_name,a.RKEY,b.SHIPPING_LEAD_TIME,a.status 
FROM  Data0023 a
inner join  data0024  b on a.RKEY=b.SUPPLIER_PTR
inner join Data0189 c on b.CITY_TAX_PTR=c.RKEY 
inner join data0001 d on a.CURRENCY_PTR=d.rkey
) a
