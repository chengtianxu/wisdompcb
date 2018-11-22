select data0070.PO_NUMBER ,data0070.rkey as '0070rkey',data0909.rkey as '0909rkey', 
data0908.rkey as '0908rkey',data0456.RKEY as '0456rkey',data0022.rkey as '0022rkey',
data0070.SUPPLIER_POINTER,data0909.SUPPLIER_PTR,data0908.SUPP_PTR ,
data0022.SUPPLIER_PTR,data0456.SUPP_PTR,GRN_NUMBER,data0908.RC_NUMBER from Data0909 
join Data0908 on data0909.rc_ptr=Data0908.rkey 
join Data0071 on data0909.SOURCE_PTR=data0071.RKEY
join Data0070 on data0071.PO_PTR=data0070.rkey
join Data0022 on data0022.D0909_ptr=data0909.rkey
join Data0456 on data0456.RKEY=data0022.GRN_PTR
where data0070.PO_NUMBER='PO2016030270'--PO2016010673
----------2.------------
select *from  Data0070 where PO_NUMBER='PO2016010673'
select *from  Data0023 where SUPPLIER_NAME like '%金环宇%'--1041
select *from  Data0023 where SUPPLIER_NAME like '%华科源%'--198
----------3.----------------
update Data0070 set SUPPLIER_POINTER='1041'where rkey in (17929,17929)
update Data0909 set SUPPLIER_PTR='1041' where rkey in (49072,49073)
update Data0908 set SUPP_PTR='1041' where RKEY in(19845,19845)
update Data0456 set SUPP_PTR='1041' where RKEY in (27838,27838)
update Data0022 set SUPPLIER_PTR='1041' where rkey in (52109,52110)