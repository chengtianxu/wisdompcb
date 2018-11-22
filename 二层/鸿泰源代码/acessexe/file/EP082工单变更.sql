--EP082工单变更
exec EP082;40 13288,13893 --可变更的版本

SELECT * FROM data0006 WHERE rkey=24538 --工单
SELECT data0056.*
from data0056
WHERE data0056.rkey=35887 --在线信息
                          --
Select data0034.rkey,data0034.dept_name --可变更位置后一个格
From Data0034 t1 
left JOIN  Data0034 on t1.dept_ptr=Data0034.dept_ptr
Where data0034.ttype=2
  and t1.Rkey=361
  
exec EP082;42 13288  --流号
go
exec EP082;41 13902,0 --工序
GO
--做入仓单，56表，QTY_BACKLOG＝0，TO_BE_STOCKED=数量，53表 QUANTITY=数量，QTY_ON_HNAD=0
--入仓审核，56表TO_BE_STOCKED＝0，53表QTY_ON_HNAD＝数量
--下次进入入仓审核再删除QTY_BACKLOG＝0，TO_BE_STOCKED＝0的记录


