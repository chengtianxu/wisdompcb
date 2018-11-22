--EP097Ä£°å

select * from data0504 

--exec EP097;3 142
--Ã÷Ï¸
CREATE PROCEDURE EP097;3
@vflow_ptr int
with encryption
AS
begin
select * from data0505
where eng_flow_ptr=@vflow_ptr
order by step
end
GO
