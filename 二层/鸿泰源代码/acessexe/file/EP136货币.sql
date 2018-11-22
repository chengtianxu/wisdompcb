--EP136»õ±Ò
--²éÑ¯
select * from Data0001

--Ã÷Ï¸
exec sp_executesql N'select * from data0003 where curr_ptr=@P1
order by fyear,fmonth
',N'@P1 int',
