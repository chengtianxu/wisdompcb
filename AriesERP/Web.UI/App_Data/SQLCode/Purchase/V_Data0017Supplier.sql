(
SELECT dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME,dbo.Data0028.SUPPLIER_PART_NO, dbo.Data0028.LEAD_TIME, 
      dbo.Data0028.PRICE_1,inventory_ptr
FROM dbo.Data0023 INNER JOIN
      dbo.Data0028 ON dbo.Data0023.RKEY = dbo.Data0028.SUPPLIER_PTR
) a