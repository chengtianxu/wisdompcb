SELECT rkey,* FROM data0034 WHERE dept_name LIKE '开料%'

SELECT rkey,* FROM data0034 WHERE dept_ptr in (SELECT rkey FROM data0034 WHERE dept_name LIKE '开料%')--工序、组、中心

SELECT * FROM data0505 WHERE DEPT_PTR IN (SELECT rkey FROM data0034 WHERE dept_ptr in(SELECT rkey FROM data0034 WHERE dept_name LIKE '开料%')) --模块

SELECT * FROM data0038 WHERE dept_ptr IN(SELECT rkey FROM data0034 WHERE dept_name LIKE '开料%')--含该工序MI里的工序

SELECT * FROM data0494 WHERE ROUTE_STEP_PTR IN (SELECT rkey FROM data0038 WHERE dept_ptr IN(SELECT rkey FROM data0034 WHERE dept_name LIKE '开料%'))--含该工序MI里的工序参数

SELECT * FROM data0048 WHERE FM_DEPT_PTR IN (SELECT rkey FROM data0034 WHERE dept_ptr in(SELECT rkey FROM data0034 WHERE dept_name LIKE '开料%')) OR TO_DEPT_PTR IN (SELECT rkey FROM data0034 WHERE dept_ptr in(SELECT rkey FROM data0034 WHERE dept_name LIKE '开料%'))--过数记录

SELECT qty_backlog, * FROM data0056 WHERE DEPT_PTR IN (SELECT rkey FROM data0038 WHERE dept_ptr IN(SELECT rkey FROM data0034 WHERE dept_name LIKE '开料%')) --在线的,要看有没数量

SELECT * FROM data0207 WHERE DEPT_PTR IN (SELECT rkey FROM data0038 WHERE dept_ptr IN(SELECT rkey FROM data0034 WHERE dept_name LIKE '开料%'))

