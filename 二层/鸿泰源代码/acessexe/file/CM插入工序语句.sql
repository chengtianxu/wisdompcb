CM²åÈë¹¤ÐòÓï¾ä
SELECT * INTO DATA0038_20111026 
FROM DATA0038
declare @rkey25 int,@rkey38 int,@line int,@TEMPSTEP INT

DECLARE @TEMP  TABLE(rkey int)
insert into @TEMP (rkey)

 select data0025.rkey
 --into data0025_bak
   from data0025
   where rkey not in (
                      select source_ptr
                      from data0038
                      where data0038.dept_ptr =595
                      )
   and data0025.rkey in 
         ( 
           select    data0025.rkey 
           from data0025 
           inner join data0050 on data0025.ancestor_ptr=data0050.rkey and data0025.parent_ptr=0
           where data0050.TSTATUS=9 AND DATA0025.RKEY NOT IN (10740,17087,18285)
         )
    --and data0025.rkey=10685
declare rst cursor LOCAL FAST_FORWARD 
   for  select rkey from @TEMP
 open rst
 fetch rst into  @rkey25 
 while @@fetch_status=0
 begin
    SELECT  @TEMPSTEP=STEP_NUMBER  FROM data0038 WHERE SOURCE_PTR=@rkey25 AND dept_ptr =331
    if isnull(@TEMPSTEP,0)>0 
    begin   
       DECLARE @TEMPBOM TABLE(rkey int,STEP int)
       insert into @TEMPBOM (rkey,STEP)
       select data0038.rkey,STEP_NUMBER
            from data0038 where SOURCE_PTR=@rkey25 AND STEP_NUMBER>@TEMPSTEP order by STEP_NUMBER
       --set @line=1
       declare rst2 cursor LOCAL FAST_FORWARD  
       for  select rkey,STEP from  @TEMPBOM order by  STEP
       open rst2
       fetch rst2 into  @rkey38,@line 
       while @@fetch_status=0
       begin
           update data0038 set STEP_NUMBER=@line+1 where rkey=@rkey38 and STEP_NUMBER=@line
           fetch rst2 into  @rkey38,@line 
       end
       close rst2
       deallocate rst2
       delete @TEMPBOM   

       insert into data0038
              (SOURCE_PTR,DEPT_PTR,DEF_ROUT_INST,FLOW_NO,STEP_NUMBER)

        values ( @rkey25,595,'',0,@TEMPSTEP+1)
       --print @rkey25 
     end  
     fetch rst into  @rkey25
   
 end
 close rst
 deallocate rst



SELECT data0056.step,data0038.step_number,data0056.rkey,data0006.work_order_number,data0006.ENT_DATETIME,data0034.dept_code,data0056.* ,data0034.big_dept_ptr,
data0034.dept_name,data0034.rkey as d0034_rkey,data0034.dept_ptr as deptptr,data0025.parent_ptr,data0006.panel_a_b,
data0034.Barcode_Entry_Flag,data0025.manu_part_number,data0025.rkey as data0025_rkey,data0025.ancestor_ptr,
data0050.customer_part_number,data0050.cp_rev,data0006.sch_compl_date,data0006.whouse_ptr,data0006.wipmat_status
,data0050.ttype,Data0006.CUT_NO,Data0006.WO_DATECODE

from data0056,data0006,data0025,data0050,data0034,data0038
WHERE data0056.wo_ptr=data0006.rkey
and data0006.bom_ptr=data0025.rkey
and data0056.outsource=0
and data0050.rkey=data0025.ancestor_ptr
and data0056.dept_ptr=data0034.rkey
--and data0006.work_order_number=@vptr
and data0006.prod_status=3

and data0038.flow_no=0
and data0038.source_ptr=data0025.rkey
and data0038.dept_ptr=data0034.dept_ptr

and data0056.step<>data0038.step_number
and data0038.step_number-data0056.step=1
--and  data0006.work_order_number='101007007-0-1-1'

--and data0056.rkey=data0056.rkey










SELECT * INTO data0056_20111026 FROM data0056


update data0056 set step=data0038.step_number 
from data0056,data0006,data0025,data0050,data0034,data0038
WHERE data0056.wo_ptr=data0006.rkey
and data0006.bom_ptr=data0025.rkey
and data0056.outsource=0
and data0050.rkey=data0025.ancestor_ptr
and data0056.dept_ptr=data0034.rkey
--and data0006.work_order_number=@vptr
and data0006.prod_status=3

and data0038.flow_no=0
and data0038.source_ptr=data0025.rkey
and data0038.dept_ptr=data0034.dept_ptr

and data0056.step<>data0038.step_number
and data0038.step_number-data0056.step=1
