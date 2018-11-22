EP274工具分类
select * from data0030
order by tool_tp_code

exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0030" ("TOOL_TP_CODE","TOOL_TP_NAME","spec1","spec2") VALUES (@P1,@P2,@P3,@P4); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(2),@P2 varchar(5),@P3 varchar(2),@P4 varchar(2)','12','test2','a1','a2'

