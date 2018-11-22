EP141缺少更新或刷新的键列信息

是因为主键问题，可能是RKEY有几个空值，先把手动设置，再设置RKEY主键，但不要自动增加


SELECT rkey,* FROM data0004 ORDER BY rkey 
UPDATE data0004 SET rkey=85 WHERE table_name='data0921'
UPDATE data0004 SET rkey=86 WHERE seed_mean='材料采购变更单编号'
SELECT rkey,COUNT(rkey) FROM data0004 GROUP BY rkey HAVING COUNT(rkey)>1