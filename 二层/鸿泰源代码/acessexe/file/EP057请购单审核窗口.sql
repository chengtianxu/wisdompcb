--´ıÉóºËµÄ
exec sp_executesql N'SELECT     Data0068.RKEY, Data0068.PO_REQ_NUMBER, Data0068.STATUS, Data0068.BUYER_PTR, (select  sum(quantity*tax_price)  from data0069 where purch_req_ptr=data0068.rkey) as TOTAL, Data0068.EXCHANGE_RATE,
                      Data0068.FLAG, Data0068.APPD_BY, Data0068.DEPARTMENT_NAME, Data0068.REQ_DATE, Data0068.DATA275_PTR, data0276.auth_date,
                      data0276.ranking, Data0015.ABBR_NAME, Data0015.WAREHOUSE_CODE, Data0015.WAREHOUSE_NAME, Data0005.EMPL_CODE,
                      Data0005.EMPLOYEE_NAME, data0276.user_ptr, Data0362.CODE AS bud_code, Data0362.DESCRIPTION, Data0094.CODE, data0068.tstate,
                      Data0094.PURCHASE_APPROV_DESC, Data0073.USER_FULL_NAME, Data0068.EDITED_DATE, Data0034.DEPT_NAME,data0276.auth_type,Data0068.USER_PTR AS PRUserPtr,Data0068.WHSE_PTR
FROM        Data0068 INNER JOIN
                      Data0094 ON Data0068.AUTH_TYPE = Data0094.RKEY INNER JOIN
                      Data0015 ON Data0068.WHSE_PTR = Data0015.RKEY INNER JOIN
                      Data0005 ON Data0068.REQ_BY = Data0005.RKEY INNER JOIN
                      Data0362 ON Data0068.budget_ptr = Data0362.RKEY INNER JOIN
                      data0276 ON Data0068.RKEY = data0276.purchase_ptr INNER JOIN
                      Data0073 ON data0276.user_ptr = Data0073.RKEY LEFT OUTER JOIN
                      Data0034 ON Data0068.DEPARTMENT_NAME = Data0034.DEPT_CODE
WHERE  (((Data0068.STATUS=1 or Data0068.STATUS=2)and Data0276.auth_type=1)or((Data0068.STATUS=8 or Data0068.STATUS=9)and Data0276.auth_type=0)) and (data0068.flag in (''S'',''M'')) AND
   (data0276.user_ptr IN (SELECT rkey FROM data0073 WHERE rpl_pr_ptr = @P1)) 
AND (dbo.data0276.auth_date IS not NULL) 

--´ıÉóºËµÄ
 and Data0068.REQ_date>=''2013-02-11 19:38:14''
 and Data0068.REQ_date<=''2013-05-13 19:38:14''
ORDER BY data0068.req_date desc ,data0068.po_req_number,data0276.ranking
',N'@P1 varchar(1)','1'

--´ıÉóºË
exec sp_executesql N'SELECT     Data0068.RKEY, Data0068.PO_REQ_NUMBER, Data0068.STATUS, Data0068.BUYER_PTR, (select  sum(quantity*tax_price)  from data0069 where purch_req_ptr=data0068.rkey) as TOTAL, Data0068.EXCHANGE_RATE,
                      Data0068.FLAG, Data0068.APPD_BY, Data0068.DEPARTMENT_NAME, Data0068.REQ_DATE, Data0068.DATA275_PTR, data0276.auth_date,
                      data0276.ranking, Data0015.ABBR_NAME, Data0015.WAREHOUSE_CODE, Data0015.WAREHOUSE_NAME, Data0005.EMPL_CODE,
                      Data0005.EMPLOYEE_NAME, data0276.user_ptr, Data0362.CODE AS bud_code, Data0362.DESCRIPTION, Data0094.CODE, data0068.tstate,
                      Data0094.PURCHASE_APPROV_DESC, Data0073.USER_FULL_NAME, Data0068.EDITED_DATE, Data0034.DEPT_NAME,data0276.auth_type,Data0068.USER_PTR AS PRUserPtr,Data0068.WHSE_PTR
FROM        Data0068 INNER JOIN
                      Data0094 ON Data0068.AUTH_TYPE = Data0094.RKEY INNER JOIN
                      Data0015 ON Data0068.WHSE_PTR = Data0015.RKEY INNER JOIN
                      Data0005 ON Data0068.REQ_BY = Data0005.RKEY INNER JOIN
                      Data0362 ON Data0068.budget_ptr = Data0362.RKEY INNER JOIN
                      data0276 ON Data0068.RKEY = data0276.purchase_ptr INNER JOIN
                      Data0073 ON data0276.user_ptr = Data0073.RKEY LEFT OUTER JOIN
                      Data0034 ON Data0068.DEPARTMENT_NAME = Data0034.DEPT_CODE
WHERE  (((Data0068.STATUS=1 or Data0068.STATUS=2)and Data0276.auth_type=1)or((Data0068.STATUS=8 or Data0068.STATUS=9)and Data0276.auth_type=0)) 
and (data0068.flag in (''S'',''M'')) 
AND (data0276.user_ptr IN (SELECT rkey FROM data0073 WHERE rpl_pr_ptr = @P1)) 
AND (dbo.data0276.auth_date IS NULL) 
--´ıÉóºËµÄ
and (data0276.ranking not in (select ranking from data0276 where purchase_ptr=Data0068.RKEY and auth_date is not null)) and (data0068.appd_by IN (SELECT rkey FROM data0073 WHERE rpl_pr_ptr = @P2))
and (data0068.APPD_BY  IN (SELECT  rkey FROM data0073 WHERE rpl_pr_ptr=1))
 OR EXISTS (select * from  viewData0068    where Data0068.RKEY= viewData0068.purchase_ptr  AND Data0276.user_ptr = 1 AND Data0276.ranking=VIEWDATA0068.Ranking   and viewData0068.user_ptr!=1 AND Data0276.auth_date is null AND Data0276.ranking = (SELECT top 1  SEQ_NO FROM DATA0275 WHERE user_ptr=1))
 AND dbo.GetPRAuthMinSeqno(data0068.rkey)=data0276.ranking

 and Data0068.REQ_date>=''2013-02-11 19:38:14''
 and Data0068.REQ_date<=''2013-05-13 19:38:14''
ORDER BY data0068.req_date desc ,data0068.po_req_number,data0276.ranking


 
 
',N'@P1 varchar(1),@P2 varchar(1)','1','1'
