select data0070.PO_NUMBER ,data0071.tax_price,data0070.rkey as '0070rkey',data0909.rkey as '0909rkey', 
data0908.rkey as '0908rkey',data0456.RKEY as '0456rkey',data0022.rkey as '0022rkey',
data0070.SUPPLIER_POINTER,data0909.SUPPLIER_PTR,data0908.SUPP_PTR ,
data0022.SUPPLIER_PTR,data0456.SUPP_PTR,GRN_NUMBER,data0908.RC_NUMBER, *from Data0909 
join Data0908 on data0909.rc_ptr=Data0908.rkey 
join Data0071 on data0909.SOURCE_PTR=data0071.RKEY
join Data0070 on data0071.PO_PTR=data0070.rkey
join Data0022 on data0022.D0909_ptr=data0909.rkey
join Data0456 on data0456.RKEY=data0022.GRN_PTR
where data0070.PO_NUMBER='PO2016040147'--PO2016040147

select *from  Data0023 where SUPPLIER_NAME like '%重庆莱宝科技有限公司%'--1410
select *from  Data0023 where SUPPLIER_NAME like '%深圳莱宝高科%'--296

update Data0070 set SUPPLIER_POINTER='1410'where rkey=19228--in (17929,17929)
update Data0909 set SUPPLIER_PTR='1410' where rkey=52824 --in (49072,49073)
update Data0908 set SUPP_PTR='1410' where RKEY=21173  -- in(19845,19845)
update Data0456 set SUPP_PTR='1410' where RKEY=30056 -- in (27838,27838)
UPDATE Data0022 SET SUPPLIER_PTR='1410' WHERE RKEY =55896