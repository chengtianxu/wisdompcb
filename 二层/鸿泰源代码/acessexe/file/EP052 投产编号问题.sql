EP052 投产编号问题

就是DATA0492.CUT_NO

有一阵子用按月流不的
exec sp_executesql N'select top 1 cut_no 
from data0492 
where cut_no like @P1
order by cut_no desc
',N'@P1 varchar(7)','1310%'

现在又改回按日流水
exec sp_executesql N'select top 1 cut_no 
from data0492 
where cut_no like @P1
order by len(cut_no) desc,cut_no desc
',N'@P1 varchar(7)','140217%'

但只要有一个140217009－05格式,而不是140217009－5
不管是因有第9个投产单号，上面语句只要查到最大值是140217009－05，而不对
没办法知道为什么有140217009－05格式


exec sp_executesql N'select top 1 cut_no 
from data0492 
where cut_no like @P1
order by len(substring(cut_no,1,patindex(''%-%'',cut_no))) desc,cut_no desc
',N'@P1 varchar(7)','131012%'  