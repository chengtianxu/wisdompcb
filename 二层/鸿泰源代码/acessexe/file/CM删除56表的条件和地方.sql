删除56表的条件和地方
delete data0056 where data0056.QTY_BACKLOG=0 and data0056.TO_BE_STOCKED=0--待入仓数据和在线数量
是入仓审核的时候会触发这个条件。 
