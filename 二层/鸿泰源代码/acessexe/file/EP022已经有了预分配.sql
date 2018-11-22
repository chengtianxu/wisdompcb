--EP022已经有了预分配
SELECT Data0060.RKEY, Data0060.SALES_ORDER, Data0060.DUE_DATE,
      Data0060.SCH_DATE, Data0010.CUST_CODE, Data0097.PO_NUMBER,
      Data0050.CUSTOMER_PART_NUMBER, Data0050.CP_REV,
      data0060.parts_ordered+data0060.quan_to_re_delivery-(data0060.parts_shipped+data0060.RETURNED_SHIP) as
       future_ship,sum(Data0063.quan_allocated) as PARTS_ALLOC
FROM Data0063 inner join Data0060 on Data0063.so_ptr=Data0060.rkey
     INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY 
     INNER JOIN Data0010 ON Data0060.CUSTOMER_PTR = Data0010.RKEY 
     INNER JOIN Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
group by Data0060.RKEY, Data0060.SALES_ORDER, Data0060.DUE_DATE,
      Data0060.SCH_DATE, Data0010.CUST_CODE, Data0097.PO_NUMBER,
      Data0050.CUSTOMER_PART_NUMBER, Data0050.CP_REV,
      data0060.parts_ordered+data0060.quan_to_re_delivery-
      (data0060.parts_shipped+data0060.RETURNED_SHIP)
having sum(Data0063.quan_allocated)>0
