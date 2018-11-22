CM取当前电脑IP
--开启xp_cmdshell  
exec sp_configure 'show advanced options', 1  
reconfigure with override  
exec sp_configure 'xp_cmdshell', 1  
reconfigure with override  
exec sp_configure 'show advanced options', 0  
reconfigure with override  
go  
   
begin  
declare @ipline varchar(200)  
declare @pos int  
declare @ip varchar(40)   
set nocount on  
set @ip = null  
    if object_id('tempdb..#temp') is not null drop table #temp  
    create table #temp (ipline varchar(200))  
    insert #temp exec master..xp_cmdshell 'ipconfig'  
    select @ipline = ipline  
    from #temp  
    where upper (ipline) like '%IPv4 地址%'--这里需要注意一下，系统不同这里的匹配值就不同  
    if @ipline is not null  
    begin   
        set @pos = charindex (':',@ipline,1);  
        set @ip = rtrim(ltrim(substring (@ipline ,   
        @pos + 1 ,  
        len (@ipline) - @pos)))  
    end   
    select distinct(rtrim(ltrim(substring (@ipline ,   
    @pos + 1 ,  
    len (@ipline) - @pos)))) as ipaddress from #temp  
drop table #temp  
 
  
set nocount off  
end   
go  