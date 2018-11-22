select spec_rkey,* from data0278 where spec_rkey in('A','B','C' ,'D','E','F','G','K','L') or RKEY=7

declare @vflag int
select @vflag=isnull(sqft_sqmt_flag,0) from data0195
declare @v1 int
declare @v2 int
if @vflag=0
begin
select @v1=rkey from data0278 where spec_rkey='D' 
select @v2=rkey from data0278 where spec_rkey='L' 
end else
begin
select @v1=rkey from data0278 where spec_rkey='E'
select @v2=rkey from data0278 where spec_rkey='K'
end

declare @gs_sq_per_unit float
declare @sq_per_unit float
SELECT @gs_sq_per_unit=a.parameter_value 
FROM DATA0047 a
WHERE a.source_pointer=12568 and a.parameter_ptr=@v1

SELECT @sq_per_unit=a.parameter_value 
FROM DATA0047 a
WHERE a.source_pointer=12568 and a.parameter_ptr=@v2

select @vflag,@v1,@v2,@gs_sq_per_unit as gs_sq_per_unit,@sq_per_unit as sq_per_unit