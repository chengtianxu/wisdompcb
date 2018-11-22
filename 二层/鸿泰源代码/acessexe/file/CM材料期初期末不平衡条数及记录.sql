--原料207是领料明细457材料出仓单主表，96表是退回给供应商 ,EP034转移主表EP0027

select * from data0017 where inv_part_number like 'CBG000633'--料号

select * from data0456 where grn_number like 'R100036240' --材料入仓主表
select * from data0456 where grn_number like 'R100039543' --材料入仓主表

select quan_on_hand,* from data0022 where grn_ptr =35185 and inventory_ptr =9221 --78590 入库明细数量
select quan_on_hand,* from data0022 where grn_ptr =38549  and inventory_ptr =9221 --78590 入库明细数量

select * from data0207 --领料明细表
join Data0457 --领料主表
on data0207.GON_PTR=data0457.RKEY
where GON_NUMBER like 'X10001048' --领料单号

select data0207.quantity,* from data0207  where d0022_ptr=72973


--update data0022 set quan_on_hand=7 where rkey=80206

--update data0022 set quan_on_hand=0 where rkey=72973

--update data0207 set d0022_ptr=80206 where rkey=233731

--update data0207 set quantity=0 where rkey=234482
--delete from data0207 where rkey =234482



----------查询材料期初期末不平衡条数及记录

select a.*,a.quantity-quan_returned-out1-out2-quan_on_hand
from (
select data0022.rkey,data0022.barcode_id,data0022.inventory_ptr,data0017.inv_part_number,
 data0022.tdate,data0022.quantity,data0022.quan_returned1,
data0022.quan_returned,sum(data0207.quantity) as out1,sum(data0096.QUAN_REJD) as out2,data0022.quan_on_hand
from data0022 
inner join data0017 on data0022.inventory_ptr=data0017.rkey
left join data0207 on data0022.rkey=data0207.d0022_ptr
left join data0096 on data0022.rkey=data0096.INV_TRAN_PTR
where data0022.tdate>'2013-1-1'
group by data0022.rkey,data0022.barcode_id,data0022.inventory_ptr,
  data0017.inv_part_number,data0022.tdate,data0022.quantity,data0022.quan_returned1,
  data0022.quan_on_hand,data0022.quan_returned,data0017.inv_part_number
) a
where a.quantity-quan_returned-out1-out2-quan_on_hand<>0
order by rkey

--select * from data0022 where rkey=151
--select * from data0207 where d0022_ptr=151
--delete from data0207 where  rkey in(1032)
--update data0022 set quan_on_hand=0.5 where rkey=395
--select * from data0022 where rkey=146
--select * from data0207 where d0022_ptr=1009


----删除有退货给供应商但没发货的采购单
--PO201304918

select quan_rejd,invt_ptr,inv_tran_ptr,* from data0096 where rej_no in('20120706','20120707','20120708','20120709','20120710')
--delete  from data0096 where rej_no in('20120706','20120707','20120708','20120709','20120710')
select * from data0070 where po_number='PO201304918' --24415

select * from data0071 where po_ptr=24415 --

select quantity,quan_on_hand,* from data0022 where source_ptr in (select rkey from data0071 where po_ptr=24415)

--delete from data0022 where source_ptr in (select rkey from data0071 where po_ptr=24415)
--delete from data0071 where po_ptr=24415
--delete from data0070 where po_number='PO201304918'
