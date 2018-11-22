 
(
SELECT Data0496.GROUP_NAME, Data0496.GROUP_DESC,
      Data0017.INV_PART_NUMBER, Data0017.INV_PART_DESCRIPTION,
      Data0023.CODE, data0328.old_price,data0023.abbr_name,
      data0328.new_price, data0328.sys_longdate, data0328.reason,
      Data0005.EMPLOYEE_NAME,
      data0328.new_price-data0328.old_price as change_price,
      case when data0328.old_price<>0 then round((data0328.new_price-data0328.old_price)*100/data0328.old_price,2)
      else 100 end 
      as change_rate,Data0001.CURR_CODE,data0002.unit_code,data0028.rkey
FROM Data0017 INNER JOIN
      Data0028 ON Data0017.RKEY = Data0028.INVENTORY_PTR INNER JOIN
      data0328 ON Data0028.RKEY = data0328.price_ptr INNER JOIN
      Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY INNER JOIN
      Data0023 ON Data0028.SUPPLIER_PTR = Data0023.RKEY INNER JOIN
      Data0005 ON data0328.user_ptr = Data0005.RKEY INNER JOIN
      dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN
      dbo.Data0002 ON dbo.Data0028.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY
)a
 