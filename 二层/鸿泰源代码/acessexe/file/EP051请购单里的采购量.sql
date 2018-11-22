--EP051请购单里的采购量
Select Sum(isnull(PO_QTY,0)-IsNull(PO_CancelQTY,0)) AS Expor From Data0283 where PO_REQ_PTR=17811 and po_req_number=(select po_req_number from data0068 where rkey=6103) group by PO_REQ_PTR


SELECT * FROM  data0068  WHERE rkey in (select distinct rkey from vdata0068_1  where FLAG='S' and req_date>='2013-08-14 00:00:00' and req_date<='2013-09-14 00:00:00' and status<>7 and status<>8 and status<>1  and status<>9 and status<>2 and status<>5)  Order by po_req_number Asc
