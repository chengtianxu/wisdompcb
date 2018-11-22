-- 材料申请单提交审核条件过滤
select Data0275.USER_PTR,Data0275.auth_type,Data0275.SEQ_NO 
FROM Data0068 --材料请购单主表
inner join Data0275 --
on Data0068.AUTH_TYPE=Data0275.AUTH_GROUP_PTR 
where data0068.total<=Data0275.upper_limit  and data0068.total>=Data0275.lower_limit and Data0068.rkey = 4699 
AND (DATA0275.CONFIRMTYPE=1 OR DATA0275.CONFIRMTYPE=2)  
ORDER BY Data0275.auth_type, Data0275.SEQ_NO 

--写入DATA0276 请购审批人员明细表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_Sample".."data0276" 
("purchase_ptr","user_ptr","ranking","Auth_type") 
VALUES (@P1,@P2,@P3,@P4); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 tinyint,@P4 tinyint',
4699,883,1,0

--修改申请单参数
exec sp_executesql N'UPDATE "SJ_V20_Sample".."data0068" 
SET "APPD_BY"=@P1,"ENT_DATE"=@P2,"STATUS"=@P3,"TSTATE"=@P4 
WHERE "RKEY"=@P5 AND "APPD_BY" IS NULL AND "ENT_DATE" IS NULL AND "STATUS"=@P6 AND "TSTATE"=@P7',
N'@P1 int,@P2 datetime,@P3 tinyint,@P4 tinyint,@P5 int,@P6 tinyint,@P7 tinyint',
883,'2013-05-12 09:30:00',8,0,4699,7,0

--查看审核信息
--exec ep054;4 4699
select * from data0276
where purchase_ptr=4699 --@v_purchase
--查看请购单
exec sp_executesql N'SELECT "RKEY","PO_REQ_NUMBER","USER_PTR","REQ_BY","BUYER_PTR","APPD_BY","DATA275_PTR","AUTH_TYPE","WHSE_PTR","budget_ptr","NPAD_PTR","ENT_DATE","REQ_DATE","AUTH_DATE","STATUS","DEPARTMENT_NAME","FLAG","EDITED_DATE","EDITED_BY_USER_PTR","EDITED_BY_EMP_PTR","TOTAL","CURRENY_PTR","EXCHANGE_RATE","v_year","v_month","mrp_flg","OVER_FLAG","TSTATE","WF_TYPE","BindGroupPtr","TranOut","sys_id","sys_rq","mod_rq" 
FROM "SJ_V20_Sample".."data0068"
 WHERE "RKEY"=@P1',N'@P1 int',4699