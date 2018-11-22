
--重印GRN入仓单 
exec sp_executesql N'if exists(select 1 from tempdb..sysobjects where id=object_id(''tempdb..#Data0096''))
drop table #Data0096

select inv_tran_ptr,flag=case when flag=''9'' then ''2'' else flag end,quan_rejd=sum(quan_rejd)
into #Data0096
from data0096
Where flag=''1'' or flag=''2'' or flag=''9''
group by inv_tran_ptr,case when flag=''9'' then ''2'' else flag end

SELECT  Data0496.GROUP_NAME, Data0019.inv_group_name, Data0070.PO_NUMBER, Data0070.PO_DATE,data0022.remark,Data0071.extra_req,
          Data0022.EXCHANGE_RATE, Data0070.FOB, Data0022.PRICE * data0071.conversion_factor as price, Data0017.INV_PART_NUMBER, data0002.unit_name,
          data0017.INV_NAME,data0017.inv_description,Data0017.INV_PART_DESCRIPTION, Data0002.UNIT_CODE, Data0071.QUAN_ORD, Data0071.QUAN_RECD,
          Data0071.QUAN_RETN, Data0001.CURR_CODE, Data0456.REF_NUMBER, Data0456.GRN_NUMBER,Data0456.PrintNum,Data0022.TDATE,Data0022.Stock_Date,Data0022.Ref_BarCodeID,
          Data0023.CODE, Data0023.SUPPLIER_NAME, Data0017.INSPECT, Data0023.ANALYSIS_CODE1, Data0023.ANALYSIS_CODE2,
          Data0023.ANALYSIS_CODE3, Data0015.WAREHOUSE_CODE, Data0005_1.EMPLOYEE_NAME AS creator, Data0070.ANALYSIS_CODE_1,
          Data0070.ANALYSIS_CODE_2, Data0070.ANALYSIS_CODE_3, Data0070.ANALYSIS_CODE_4, Data0070.ANALYSIS_CODE_5,
          code_16=data0016.code,Location_16=data0016.Location,sum(data0022.quantity/data0071.conversion_factor) as qty1,
          sum(data0022.quantity*data0022.price) as Receiveamount,
          sum(data0022.quantity*(1 + Data0022.TAX_2 / 100.0)*data0022.price) as Tax_Receiveamount,
          sum((data0022.quantity-data0022.quan_in_insp-data0022.quan_in_insp1-data0022.quan_to_be_stocked-data0022.quan_to_be_stocked1-data0022.quan_useasis-IsNull(t1.quan_rejd,0)-IsNull(t2.quan_rejd,0))/data0071.conversion_factor) as qty_stocked,
          sum((data0022.quantity-data0022.quan_in_insp-data0022.quan_in_insp1-data0022.quan_to_be_stocked-data0022.quan_to_be_stocked1-data0022.quan_useasis-IsNull(t1.quan_rejd,0)-IsNull(t2.quan_rejd,0))*data0022.price) as amount,
          Data0022.TAX_2, (1 + Data0022.TAX_2 / 100.0) * Data0022.PRICE * data0071.conversion_factor AS tax_price,
          sum((data0022.quantity-data0022.quan_in_insp-data0022.quan_in_insp1-data0022.quan_to_be_stocked-data0022.quan_to_be_stocked1-data0022.quan_useasis-IsNull(t1.quan_rejd,0)-IsNull(t2.quan_rejd,0))*(1 + Data0022.TAX_2 / 100.0)*data0022.price) as Tax_amount,
          sum(data0022.quantity*data0071.tax_price/isnull(data0071.conversion_factor,1)) as Tax_amount1,
          Data0005.EMPLOYEE_NAME AS auditor,
         sum(IsNull(t1.quan_rejd,0)) as quan_Rej,sum(IsNull(t2.quan_rejd,0)) as quan_Return,data0022.expire_Date
FROM Data0456 INNER JOIN
          Data0022 ON Data0022.TTYPE = 2 AND Data0022.GRN_PTR = Data0456.RKEY AND Data0456.RKEY = @P1 INNER JOIN
          Data0071 ON Data0022.SOURCE_PTR = Data0071.RKEY INNER JOIN
          Data0070 ON Data0071.PO_PTR = Data0070.RKEY INNER JOIN
          Data0017 ON Data0071.INVT_PTR = Data0017.RKEY LEFT JOIN
          Data0002 ON Data0071.PURCHASE_UNIT_PTR = Data0002.RKEY LEFT JOIN
          Data0001 ON Data0070.CURRENCY_PTR = Data0001.RKEY INNER JOIN
          Data0023 ON Data0070.SUPPLIER_POINTER = Data0023.RKEY INNER JOIN
          Data0015 ON Data0070.WAREHOUSE_POINTER = Data0015.RKEY LEFT JOIN
          Data0005 ON Data0456.AUDITED_BY = Data0005.RKEY LEFT JOIN
          Data0496 ON Data0017.GROUP_PTR = Data0496.RKEY LEFT JOIN
          Data0019 ON Data0496.group_ptr = Data0019.rkey LEFT JOIN
          Data0005 AS Data0005_1 ON Data0456.CREATE_BY = Data0005_1.RKEY LEFT JOIN
          Data0016 on Data0022.location_ptr=data0016.rkey left join
     #Data0096 t1 on Data0022.rkey=t1.inv_tran_ptr
                 and t1.flag=''1'' left join
     #Data0096 t2 on Data0022.rkey=t2.inv_tran_ptr
                 and t1.flag=''2''  
WHERE     (Data0022.QUANTITY > 0) and (isnull(data0022.invoice_ptr,0)<=0)
GROUP BY Data0496.GROUP_NAME, Data0019.inv_group_name, Data0070.PO_NUMBER, Data0070.PO_DATE,data0022.remark,Data0071.extra_req, 
          Data0022.EXCHANGE_RATE, Data0070.FOB, Data0022.PRICE,data0071.conversion_factor, Data0017.INV_PART_NUMBER,data0002.unit_name,data0017.INV_NAME,data0017.inv_description,
          Data0017.INV_PART_DESCRIPTION, Data0002.UNIT_CODE, Data0071.QUAN_ORD, Data0071.QUAN_RECD, 
          Data0071.QUAN_RETN, Data0001.CURR_CODE, Data0456.REF_NUMBER, Data0456.GRN_NUMBER,Data0456.PrintNum, Data0022.TDATE,Data0022.Stock_Date,
          Data0023.CODE, Data0023.SUPPLIER_NAME, Data0023.ANALYSIS_CODE1, Data0023.ANALYSIS_CODE2,
          Data0023.ANALYSIS_CODE3, Data0015.WAREHOUSE_CODE, Data0005_1.EMPLOYEE_NAME, Data0070.ANALYSIS_CODE_1,
          Data0070.ANALYSIS_CODE_2, Data0070.ANALYSIS_CODE_3, Data0070.ANALYSIS_CODE_4, Data0070.ANALYSIS_CODE_5,
          Data0022.Ref_BarCodeID,Data0022.TAX_2, Data0017.INSPECT, Data0005.EMPLOYEE_NAME,data0016.code,data0016.Location,data0022.expire_Date
ORDER BY Data0496.GROUP_NAME, Data0019.inv_group_name, Data0017.INV_PART_NUMBER,Data0017.INV_PART_DESCRIPTION,
          Data0070.PO_NUMBER, Data0070.PO_DATE, Data0022.EXCHANGE_RATE, Data0070.FOB, Data0022.PRICE,
          Data0002.UNIT_CODE, Data0071.QUAN_ORD, Data0071.QUAN_RECD, Data0071.QUAN_RETN, Data0001.CURR_CODE, 
          Data0456.REF_NUMBER, Data0456.GRN_NUMBER, Data0022.TDATE,Data0022.Stock_Date, Data0023.CODE, Data0023.SUPPLIER_NAME,
          Data0015.WAREHOUSE_CODE
 
 
',N'@P1 int',16801

select * from Data0070  where PO_NUMBER like '201304116' 
--查入仓单号
--exec ep122;4 15099 
--data0456材料收获明细
--data0071采购单明细

 CREATE PROCEDURE EP122;4 --FrmMain.ADOQuery2
    @vptr2 int
    with encryption
    AS
    begin
     SELECT DISTINCT  Data0456.RKEY, Data0456.GRN_NUMBER, Data0456.STATUS
     FROM Data0071 INNER JOIN  Data0022 ON Data0071.RKEY = Data0022.SOURCE_PTR INNER JOIN
          Data0456 ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN
          Data0070 ON Data0071.PO_PTR = Data0070.RKEY
     WHERE (Data0022.TTYPE = 2) AND (Data0022.QUANTITY > 0) -- and Data0022.quan_invoiced=0 --2：PO收;3:从不带PO收货;5:盘点入;6:转移入;7:车间退到货仓入
          and isnull(data0022.cost_flag,0)=0 and data0070.rkey = @vptr2
    end
    
    
    go