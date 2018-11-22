--ep6001采购对账单
--界面查询
SELECT	Data0882.*,data0023.CODE,data0023.SUPPLIER_NAME
from Data0882 
Left join data0023 on Data0882.supp_ptr=data0023.rkey
where Data0882.CheckMonth >='2014-01-01 00:00:00' and Data0882.CheckMonth <='2014-04-01 00:00:00'
order by CheckCode

--
--建立查询
--exec Ep0882;1 0,1,'2014-03-01','2014-03-31','1FXG'

exec sp_executesql N'update data0004
Set seed_value=@P1
where  Table_name=''data0882''
',N'@P1 varchar(20)','CK00000366'
go
SET NO_BROWSETABLE ON
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "sj_v20_sample".."Data0882" 
("CheckCode","CheckMonth","supp_ptr","tstatus","invoice_ptr","datetype","CheckBDate","CheckEDate","TAmount","RAmount","QAmount","AAmount","SumAmount","employee_ptr") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 varchar(10),@P2 datetime,@P3 int,@P4 int,@P5 int,@P6 tinyint,@P7 datetime,@P8 datetime,@P9 numeric(18,6),@P10 numeric(18,6),@P11 numeric(18,6),@P12 numeric(18,6),@P13 numeric(18,6),@P14 int',
'CK00000366','2014-03-01 00:00:00',13,0,0,0,'2014-01-01 00:00:00','2014-03-31 00:00:00',690.000000,0,0,0,690.000000,1
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "sj_v20_sample".."Data0883" 
("Rkey882","rkey_ptr","type","qnty","price","Stock_Date","actty","tax") 
VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8); SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 int,@P4 numeric(18,6),@P5 float,@P6 datetime,@P7 numeric(18,6),@P8 numeric(18,6)',
0,33228,1,2.000000,294.87179500000002,'2014-02-07 13:55:00',2.000000,17.000000
go



