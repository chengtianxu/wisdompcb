--EP1054外发受理查询
SELECT data0068.rkey,po_req_number,status,flag,req_date,data0068.TOTAL,
       data0068.req_by,data0068.buyer_ptr,data0068.APPD_BY,data0068.AUTH_TYPE,
       data0068.department_name,data0068.data275_ptr,
       data0005.empl_code,data0005.employee_name,data0068.auth_date,
       data0015.abbr_name,data0068.tstate,data0068.ent_date,a.employee_name as purchaser
from data0005,data0015,data0068 left join data0005 a on data0068.buyer_ptr=a.rkey
where data0068.WHSE_PTR=data0015.rkey and (isnull(data0068.buyer_ptr,0)=0 or data0068.buyer_ptr=:vptr) 
--在68表data0068.buyer_ptr有值在这个界面出来数据和在采购里也导不出数据
      and data0068.req_by=data0005.rkey and
      data0068.flag<>:flag1 and data0068.flag<>:flag2 and
      data0068.status <> :v1 and data0068.status <> :v2 and
      data0068.status <> :v3 and data0068.status <> :v4 and
      data0068.status <> :v5 and data0068.status <> :v6 and
      data0068.status <> :v7 and data0068.status <> :v8 and
      data0068.status <> :v9 and
      data0068.req_date >= :dtpk1 and
      data0068.req_date <= :dtpk2
      
order by po_req_number  
