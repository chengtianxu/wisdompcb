select  PO_NUMBER,INV_PART_NUMBER,QUAN_ORD as 订购数量,QUAN_RECD 收货数量,QUAN_RETN as 退回数量,*from Data0070    
 inner join Data0071  on data0071.PO_PTR=data0070.rkey
 inner join Data0017 on data0017.rkey=Data0071.INVT_PTR
 where /*data0017.INV_PART_NUMBER in ('MS2-2500-00001','MS2-2700-00001')*/
 PO_NUMBER='PO2015120244'