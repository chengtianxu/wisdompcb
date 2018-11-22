exec EP191;3 0,106

CREATE PROCEDURE ep191;3
@rkey50 int,
@prodtype int
AS
if @rkey50>0
begin
  declare @vptr3 int
  select @vptr3= group_ptr from Data0859(nolock) 
  where prod_ptr in (select prod_code_ptr from data0025(nolock) where parent_ptr=0 and ancestor_ptr=@rkey50)

  select data0087.* 
  from data0087(nolock) inner join data0278(nolock) on data0087.parameter_ptr=data0278.rkey
  where data0087.group_ptr=@vptr3
  order by Data0087.seq_no
end
if @rkey50=0
begin
  select data0087.* 
  from data0087(nolock) inner join data0278(nolock) on data0087.parameter_ptr=data0278.rkey
  where data0087.group_ptr=(select group_ptr from Data0859 where prod_ptr=@prodtype)
  order by Data0087.seq_no
end
Go