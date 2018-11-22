select data0070.PO_NUMBER,data0070.rkey as'0070rkey',data0909.rkey916 as '0909reky',
data0908.RKEY as '0908rkey',data0022.rkey as '0022rkey',data0456.rkey as '0456rkey',
 data0070.SUPPLIER_POINTER, data0909.SUPPLIER_PTR, data0908.SUPP_PTR, 
 data0022.SUPPLIER_PTR,data0456.SUPP_PTR  from Data0909
 join Data0908 on data0909.RC_PTR=data0908.RKEY
 join Data0071 on data0909.SOURCE_PTR=data0071.RKEY
 join Data0070 on data0071.PO_PTR=data0070.rkey
 join Data0022 on data0022.D0909_ptr=data0909.rkey
 join Data0456 on data0456.RKEY=data0022.GRN_PTR