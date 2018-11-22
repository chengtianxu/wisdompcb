--EP294MRBMRB评审中
SELECT CP_REV,* FROM data0050 WHERE CUSTOMER_PART_NUMBER LIKE 'P0B053427' --

--create PROCEDURE ep294;2
DECLARE @vptr int
  SET @vptr=11461 
--as
declare @vcust varchar(20)
declare @vcp varchar(3)
select @vcust=customer_part_number,@vcp=cp_rev1 from data0050(nolock) where rkey=@vptr

SELECT data0016.location,data0053.WO_DATECODE,data0053.REFERENCE_NUMBER,SUM(DATA0053.QTY_on_hand) as QTY_on_hand
 FROM data0050(nolock),DATA0053(nolock) left join data0016(nolock) on data0053.loc_ptr=data0016.rkey
WHERE DATA0053.cust_part_ptr=data0050.rkey
and data0050.customer_part_NUMBER=@vcust
and data0050.cp_rev1=@vcp
--and isnull(data0016.ISHUb,0)=0
and DATA0053.QTY_on_hand>0
group by data0016.location,data0053.WO_DATECODE,data0053.REFERENCE_NUMBER
union all

SELECT 'MRB评审中',null,null,isnull(sum(Qty_to_be_reworked-data0415.qty_rewked+qty_to_be_stocked-qty_stocked),0) as QTY_on_hand
FROM DATA0414(nolock),data0415(nolock),data0050(nolock)
where data0414.status<3
and data0414.d415_PTR=DATA0415.RKEY
and data0415.custpart_ptr=data0050.rkey
and data0050.customer_part_NUMBER=@vcust
and data0050.cp_rev1=@vcp  --这样只取大版本

go
