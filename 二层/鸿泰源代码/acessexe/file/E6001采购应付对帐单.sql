E6001采购应付对帐单
--已经对帐
exec sp_executesql N'SELECT	Data0882.*,data0023.CODE,data0023.SUPPLIER_NAME
from Data0882 Left join data0023 on Data0882.supp_ptr=data0023.rkey
where Data0882.CheckMonth >=@P1 and Data0882.CheckMonth <=@P2

order by CheckCode
',N'@P1 datetime,@P2 datetime','2014-01-01 00:00:00','2014-04-01 00:00:00'

--未对帐的

--按收货日期
exec Ep0882_chklist;1 '2014-01-31 00:00:00','2014-04-01 00:00:00',0
--按入仓日期
exec Ep0882_chklist;1 '2014-01-31 00:00:00','2014-04-01 00:00:00',1




Create Procedure Ep0882_chklist 
@vDateFm  datetime,
@vDateTo datetime,
@vflag tinyint
as
if @vflag=0
	select data0023.code,data0023.supplier_name 
	from Data0023 where 
	--入仓
	RKEY in ( select data0456.SUPP_PTR from data0456 left join data0022 on data0022.grn_ptr=data0456.rkey
		where data0456.CREATE_DATE>=@vDateFm and data0456.CREATE_DATE<@vDateTo
		AND Data0022.TType in (2,3) --2：PO收;3:从不带PO收货;5:盘点入;6:转移入;7:车间退到货仓入
		and round(Data0022.QUANTITY,6)>=0
		and round(Data0022.QUAN_STOCKED,6)>=0
		and isnull(Data0022.quan_send,0)<=0 and isnull(Data0022.quan_transferin,0)=0
		and isnull(data0022.INVOICE_PTR,0)<=0
		and IsNull(Data0022.APCheckFlag,0)=0
		and isnull(Data0022.QUAN_STOCKED,0)-isnull(data0022.quan_send,0)>isnull(data0022.apcheckqnty,0)	)
		--退货
	or RKEY in (select Data0022.SUPPLIER_PTR from data0096 left join data0022 on Data0096.INV_TRAN_PTR=Data0022.RKEY
		where Data0096.Audited_Date>=@vDateFm and Data0096.Audited_Date<@vDateTo
		and data0096.quan_rejd+isnull(data0096.apcheckqnty,0)>0
		and Data0022.QUANTITY>=0
		and Data0022.QUAN_STOCKED>=0
		and isnull(data0022.INVOICE_PTR,0)<=0
		and IsNull(Data0096.APCheckFlag,0)=0
		AND Data0022.TType in (2,3) )
else if @vflag=1
	select data0023.code,data0023.supplier_name from Data0023 where 
	RKEY in ( select data0456.SUPP_PTR from data0456 left join data0022 on data0022.grn_ptr=data0456.rkey
		where data0022.Stock_Date>=@vDateFm and data0022.Stock_Date<@vDateTo
		AND Data0022.TType in (2,3) 
		and round(Data0022.QUANTITY,6)>=0
		and round(Data0022.QUAN_STOCKED,6)>=0
		and isnull(Data0022.quan_send,0)<=0 and isnull(Data0022.quan_transferin,0)=0
		and isnull(data0022.INVOICE_PTR,0)<=0
		and IsNull(Data0022.APCheckFlag,0)=0
		and isnull(Data0022.QUAN_STOCKED,0)-isnull(data0022.quan_send,0)>isnull(data0022.apcheckqnty,0)	)
	or RKEY in (select Data0022.SUPPLIER_PTR from data0096 left join data0022 on Data0096.INV_TRAN_PTR=Data0022.RKEY
		where Data0096.Audited_Date>=@vDateFm and Data0096.Audited_Date<@vDateTo
		and data0096.quan_rejd+isnull(data0096.apcheckqnty,0)>0 --退货对帐以负数形式出现
		and Data0022.QUANTITY>=0
		and Data0022.QUAN_STOCKED>=0
		and isnull(data0022.INVOICE_PTR,0)<=0
		and IsNull(Data0096.APCheckFlag,0)=0
		AND Data0022.TType in (2,3) )
 go
 




