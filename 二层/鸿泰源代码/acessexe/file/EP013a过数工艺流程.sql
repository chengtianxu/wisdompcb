--exec EP013;3 '130416005-0-2-1'
--exec EP013;4 0,0,11431
--CREATE PROCEDURE EP013;4
declare
@vflow int=0,
@vstep int=0,
@vsource int=11431
--with encryption
--AS
declare @vflag int
select @vflag=isnull(BCODE_FLAG,0) from data0195
select data0034.dept_name,dept_code,data0034.rkey as d034_rkey,data0034.ttype as dept_tp,
data0034.dept_ptr,data0034.group_ptr,data0038.*,
data0034.dept_code,
case when @vflag=0 then data0034.barcode_entry_flag else (case when data0038.BCODE_ENTRY_FLAG=1 then 'Y' else '' end) end as barcode_entry_flag,
data0050.ttype,data0034.big_dept_ptr
 from data0038 ,data0034,data0025,data0050
where data0038.flow_no=@vflow
and data0038.source_ptr=@vsource
and data0038.dept_ptr=data0034.rkey
and data0038.step_number>@vstep
and data0038.source_ptr=data0025.rkey
and data0025.ancestor_ptr=data0050.rkey
order by data0038.step_number