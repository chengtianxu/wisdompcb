 SELECT DATA0070.PO_NUMBER 
 FROM DATA0070 --采购单主表
 INNER JOIN DATA0071 ON DATA0070.RKEY =DATA0071.PO_PTR --采购标准物料明细表  
 INNER JOIN DATA0022 ON DATA0071.RKEY = DATA0022.SOURCE_PTR  
 WHERE DATA0070.STATUS =5 --状态1-8 ,8未提交 1,待审核,2被退回,5已经审核,按反审核回到待审核状态
 AND DATA0070.PO_NUMBER ='wf12-06-00003'
 
 --外发采购单审核信息查询
select * from Data0070 order by 1 desc 
exec ep053;4 3389

SELECT user_id,user_full_name,
              auth_date,ranking,user_ptr
FROM data0078 inner join data0073
     On data0078.user_ptr=data0073.rkey
WHERE po_ptr =3389 --@po_ptr外发采购单号
  
ORDER BY
 ranking
