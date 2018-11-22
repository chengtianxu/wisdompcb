--两个地方PNLPCS数不一样

select * from Data0050 where CUSTOMER_PART_NUMBER like ''--本厂编号
---在统计单位
SELECT data0047.* FROM DATA0025,data0047,data0278
WHERE 
data0047.source_pointer=data0025.rkey
and data0025.ancestor_ptr in 
(4877)
and data0025.parent_ptr=0
and data0047.parameter_ptr=data0278.rkey
and data0278.spec_rkey='C'

-----在全局参数

exec sp_executesql N'DECLARE @vptr int
set @vptr =@P1
select *
into #testxx01
from (
SELECT Data0025.RKEY, Data0278.SPEC_RKEY,Data0278.SEQUENCE_NO,
      Data0278.PARAMETER_DESC AS parameter_name,
      rtrim(Data0279.PARAMETER_VALUE) as parameter_value,1 as flag
FROM Data0278 left JOIN
      Data0279 ON Data0279.PARAMETER_PTR = Data0278.RKEY left JOIN
      Data0025 ON Data0279.SOURCE_PTR = Data0025.RKEY
WHERE  (Data0278.SPEC_RKEY IN (''1'', ''2'', ''3'', ''4'', ''10'', ''11'',  ''12'', ''13'', ''H'', ''I'', ''S'', ''T'',''B'',''P'',''24'',''25'',''26'',''27'',''28'',''29'',''30'',''31''))
 AND  data0025.ancestor_ptr=@vptr
union
SELECT Data0025.RKEY, Data0278.SPEC_RKEY,Data0278.SEQUENCE_NO,
      Data0278.PARAMETER_DESC AS parameter_name,
      rtrim(Data0047.PARAMETER_VALUE) as parameter_value,2 as flag
FROM Data0278 left JOIN
      Data0047 ON Data0047.PARAMETER_PTR = Data0278.RKEY left JOIN
      Data0025 ON Data0047.SOURCE_Pointer = Data0025.RKEY
WHERE  Data0278.SPEC_RKEY=''B''
 AND  data0025.ancestor_ptr=@vptr) a

select * from  #testxx01
ORDER BY SEQUENCE_NO,PARAMETER_NAME

drop table #testxx01
 
 
',N'@P1 int',4877 --data0050.rkey