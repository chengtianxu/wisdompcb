--EP167报价规则化计算模式
--exec EP167;1 
CREATE PROCEDURE EP167
with encryption
AS
select * from data0348
order by ttype,adder_name
go
--增加
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0348" 
("TTYPE","ADDER_NAME","FORMULA","MIN_VALUE","MAX_VALUE","adder_name_e","CLASS_REMARK") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7); SELECT SCOPE_IDENTITY() 
AS SCOPE_ID_COLUMN',
N'@P1 smallint,@P2 varchar(20),@P3 varchar(2),@P4 varchar(1),@P5 varchar(1),@P6 varchar(50),@P7 varchar(5)',1,
'TEST                ','  ','','','test1                                             ','test2'