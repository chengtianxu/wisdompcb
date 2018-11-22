--EP082作业单发放
SELECT * FROM DATA0400 Where status=0

insert into Data0056
(unit_ptr,wo_ptr,dept_ptr,intime,qty_backlog,panels,sets_qty,flow_no,step,employee_ptr,wtype,put_type,d0038_ptr)  
VALUES
(0,24700,932,'2013-12-13 09:27:11',2240,28,560,0,1,1,0,0,233717)

Update data0006 set orig_quan_sch=quan_sch,user_ptr=1
 ,prod_status=3,release_date='2013-12-13 09:27:11' Where Rkey=24700

选不到发放工序或为空，这是选择工艺第一道工序，这第一个工序要有工作组中心
 
 



