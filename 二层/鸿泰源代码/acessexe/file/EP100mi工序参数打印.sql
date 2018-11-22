EP100mi工序参数打印
--exec EP100;57 279318,''
-CREATE PROCEDURE EP100;57
DECLARE 
@rkey int,
@vptr varchar(30)
-with encryption
-AS
SELECT @rkey=279318,@vptr=''
IF @vptr=''
select data0278.parameter_desc,data0494.parameter_value,data0002.unit_name as unit_code,
data0002.rkey,data0494.production_flag
 from data0278,data0002,Data0494 left join data0506 on 
 data0506.rkey=data0494.source_ptr
where data0494.route_step_ptr=@rkey  --指向38表RKEY
and data0494.parameter_ptr=data0278.rkey
--and data0506.doc_flag='Y' 
and (data0506.doc_flag='Y' or isnull(data0506.rkey,0)=0)  --这个是显示以前输入目前不需要的参数
and data0002.rkey=data0278.unit_ptr
and data0494.parameter_value<>@vptr
--and data0494.parameter_value<>'0'
ORDER BY 
data0506.seq_no
IF @vptr<>''
select data0278.parameter_desc,data0494.parameter_value,data0002.unit_name as unit_code,
data0002.rkey,data0494.production_flag
 from data0278,data0002,Data0494 left join data0506 on 
 data0506.rkey=data0494.source_ptr 
where data0494.route_step_ptr=@rkey
and data0494.parameter_ptr=data0278.rkey
--and data0506.doc_flag='Y' 
and (data0506.doc_flag='Y' or isnull(data0506.rkey,0)=0)  --这个是显示以前输入目前不需要的参数
and data0002.rkey=data0278.unit_ptr
ORDER BY 
data0506.seq_no
go

-----------------------------
如果删除工序参数，在MI里默认是不显示的
如果不想，重新增加，并修改494相关的指针到新的指
EP062制程参数

SELECT * FROM data0034 WHERE rkey=348

select data0278.rkey,data0278.parameter_name,data0278.parameter_desc,data0506.* from data0506
LEFT join data0278 ON data0506.parameter_ptr=data0278.rkey
where data0506.ttype=3 and data0506.source_ptr=348 --data0034.rkey工序
ORDER by seq_no

UPDATE data0494 SET SOURCE_PTR=1372 --新的506表RKEY
WHERE PARAMETER_PTR=925 --278表里RKEY

