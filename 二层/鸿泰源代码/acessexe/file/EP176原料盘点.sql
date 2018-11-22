原料盘点主表
select data0092.*,
       data0005.employee_name,
       data0015.warehouse_code,data0015.warehouse_name
from   data0092
 inner join data0005  on data0092.employee_ptr=data0005.rkey
 inner join data0015  on data0092.whouse_ptr=data0015.rkey
 order by TDate desc

--原料盘点明细
exec sp_executesql N'select * from data0093
where (phy_list_ptr=@P1) and  (status<>@P2)
',N'@P1 int,@P2 int',194,9

exec sp_executesql N'SELECT data0093.phy_list_ptr,Data0093.RKEY,data0093.check_no,data0093.Prod_Date,data0001.curr_code,data0001.exch_rate,
       Data0017.INV_PART_NUMBER,Data0017.INV_PART_DESCRIPTION,Data0017.ANALYSIS_CODE1,
       Data0496.GROUP_NAME,Data0016.LOCATION,Data0093.TAX_2,data0093.DISCOUNT,
       Data0093.INV_TRAN_PTR AS rkey22,Data0093.OLD_QUANTITY,
       Data0093.BARCODE_ID,Data0005.EMPLOYEE_NAME,
       Data0093.QUANTITY,Data0093.COUNTED_BY_EMPL_PTR,
       Data0093.LOCATION_PTR,Data0093.EXPIRE_DATE,
       Data0023.ABBR_NAME,data0023.code,
       Data0002.UNIT_CODE,data0002.unit_name, 
       Data0093.SUPPLIER2,PRICE=round(Data0093.PRICE,6),
       Tax_Price=round(Data0093.Tax_Price,6),
       Data0093.RackNo,Data0093.remark
FROM   Data0093 INNER JOIN
       Data0017 ON Data0093.INVENTORY_PTR = Data0017.RKEY INNER JOIN
       Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN
       Data0016 ON Data0093.LOCATION_PTR = Data0016.RKEY INNER JOIN
       Data0002 ON Data0017.STOCK_UNIT_PTR = Data0002.RKEY INNER JOIN
       Data0023 ON Data0093.SUPPLIER_PTR = Data0023.RKEY inner join
       data0001 on data0093.CURRENCY_PTR=data0001.rkey LEFT OUTER JOIN
       Data0005 ON Data0093.COUNTED_BY_EMPL_PTR = Data0005.RKEY
where (data0093.phy_list_ptr=@P1)
     and (data0093.status<>@P2)
ORDER BY Data0093.RackNo,Data0496.GROUP_NAME,Data0017.INV_PART_NUMBER
',N'@P1 int,@P2 int',194,9

SELECT * FROM DATA0093 WHERE INVENTORY_PTR=3716 AND PHY_LIST_PTR IN
(
SELECT RKEY FROM DATA0092 WHERE TDATE BETWEEN '2013-9-1' AND '2013-9-2'
)

SELECT quan_send,quan_transferin,* FROM DATA0022 WHERE INVENTORY_PTR=3716