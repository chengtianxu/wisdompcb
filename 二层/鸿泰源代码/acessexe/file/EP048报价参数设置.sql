--EP048报价参数设置
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0429" 
SET "data_type"=@P1,"mark"=@P2,"PARAMETER_INFO"=@P3 
WHERE "RKEY"=@P4 AND "data_type"=@P5 AND "mark"=@P6 AND "PARAMETER_INFO"=@P7',
N'@P1 tinyint,@P2 varchar(1),@P3 varchar(19),@P4 int,@P5 tinyint,@P6 varchar(1),@P7 varchar(1)',
1,'',' COST0002( 3 , 2 ) ',1,1,'',''


----------------------
--报价成员函数
select * from data0337 where parameter_ptr=20  ---429表RKEY
ORDER by Sequence_no

--------------------------------------------窗口显示

select * from Data0429
--------------------------------------------增加参数

select data0278.rkey,data0278.parameter_name,data0278.parameter_desc,
data0277.category_name,data0278.data_type
from data0277,data0278 where data0278.category_ptr=data0277.rkey
order by data0277.category_name,parameter_name,parameter_desc


