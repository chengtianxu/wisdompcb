

INSERT INTO data0156 
(WO_PTR,DEPT_PTR,UNIT_PTR,EMPLOYEE_PTR,FLOW_NO,STEP,QTY_BACKLOG,
  PANELS,INTIME,TO_BE_STOCKED,REFERENCE,WTYPE)
select a.WO_PTR,a.DEPT_PTR,a.UNIT_PTR,a.EMPLOYEE_PTR,a.FLOW_NO,a.STEP,a.QTY_BACKLOG,
  a.PANELS,INTIME,a.TO_BE_STOCKED,a.REFERENCE,a.WTYPE from data0056 a 
inner join data0006 b on a.wo_ptr=b.rkey
where convert(char(10),b.sch_compl_date,120)<='2011-01-15' 

update b set b.prod_status=203,b.reference_ptr=c.rkey from data0056 a 
inner join data0006 b on a.wo_ptr=b.rkey
inner join data0156 c on b.rkey=c.wo_ptr
where convert(char(10),b.sch_compl_date,120)<='2011-01-15' 

insert into data0117(source_ptr,source_type,notepad_ptr,empl_ptr,tdate,action)
select wo_ptr,2,0,1,getdate(),3 from data0156

delete from data0056 where wo_ptr in (select wo_ptr from data0156)









