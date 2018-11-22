--请购单审核状态信息查询
SELECT user_id,user_full_name,
       auth_date,ranking,user_ptr,auth_type
FROM data0276 inner join data0073
     On data0276.user_ptr=data0073.rkey
WHERE purchase_ptr = 1098--@purch_ptr data0068.rkey
  
ORDER BY
  ranking
go


--请购单查询