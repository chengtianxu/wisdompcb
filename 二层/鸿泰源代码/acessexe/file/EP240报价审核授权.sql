--EP240报价审核授权
--查询
select * from Data0264

--增加
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0264" 
("CODE","QTE_APPROV_DESC") 
VALUES (@P1,@P2); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 varchar(3),@P2 varchar(8)',
'001','报价审核'
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0265" 
("AUTH_GROUP_PTR","USER_PTR","LOWER_LIMIT","UPPER_LIMIT","ALLOW_MODI_FLAG") 
VALUES (@P1,@P2,@P3,@P4,@P5); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 float,@P4 float,@P5 varchar(1)',
5,1,9999999999,0,'Y'