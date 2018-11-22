
(SELECT TOP 100 PERCENT dbo.Data0496.GROUP_NAME, dbo.Data0496.GROUP_DESC, 
      ROUND(AVG(dbo.data0328.old_price * dbo.Data0001.BASE_TO_OTHER), 2)    AS old_price, 
      ROUND(AVG(dbo.data0328.new_price * dbo.Data0001.BASE_TO_OTHER), 2)  AS new_price, 
      ROUND(AVG(dbo.data0328.new_price * dbo.Data0001.BASE_TO_OTHER - 
                             dbo.data0328.old_price * dbo.Data0001.BASE_TO_OTHER), 2) AS avg_changeprice, 

      case when avg((data0328.old_price * Data0001.BASE_TO_OTHER) )<>0 then 
      ROUND(AVG(((data0328.new_price * Data0001.BASE_TO_OTHER - data0328.old_price * Data0001.BASE_TO_OTHER) * 100) )
      / avg((data0328.old_price * Data0001.BASE_TO_OTHER) ), 2) else 100 end AS change_rate

FROM dbo.data0328 INNER JOIN
      dbo.Data0028 ON dbo.data0328.price_ptr = dbo.Data0028.RKEY INNER JOIN
      dbo.Data0017 ON dbo.Data0028.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN
      dbo.Data0001 ON dbo.Data0028.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN
      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = dbo.Data0496.RKEY
GROUP BY dbo.Data0496.GROUP_NAME, dbo.Data0496.GROUP_DESC
 )a  