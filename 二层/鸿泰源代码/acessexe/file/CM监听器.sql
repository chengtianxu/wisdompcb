高工  14:55:04
create TRIGGER [data0056_lisenter] ON [dbo].[data0056] 
FOR update
AS
  --用于监控更改值触发器
  if update(to_be_stocked)
  begin
    declare @beforettype float
    declare @afterttype float
  
    select @beforettype=to_be_stocked from inserted --更改之前的值
    select @afterttype=to_be_stocked from deleted   --更改之后的值
   
    if @afterttype<0
    begin
       select * from data0056监控to_be_stocked触发器
    end 
  end
go

高工  14:55:04
create TRIGGER [data0056_lisenter] ON [dbo].[data0056] 
FOR update
AS
  --用于监控更改值触发器
  if update(to_be_stocked)
  begin
    declare @beforettype float
    declare @afterttype float
  
    select @beforettype=to_be_stocked from inserted --更改之前的值
    select @afterttype=to_be_stocked from deleted   --更改之后的值
   
    if @afterttype<0
    begin
       select * from data0056监控to_be_stocked触发器
    end 
  end
go
