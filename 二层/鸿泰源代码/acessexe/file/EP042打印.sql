EP042打印
SELECT data0096.REJ_NO,data0096.rkey,data0096.tstatus,'96<--|-->906',data0906.REJ_NO,data0906.rkey,data0906.Status,Create_Date FROM data0096 
JOIN data0906 ON data0096.d0906_ptr =data0906.rkey
--UPDATE data0096 SET rej_no='RJ201200000034' WHERE rkey=85
-----------------------------------------------------
--打印 要求DATA0096.TSTATUS=1 --0：未审；1：已审；2：已取消；
--Exec XP_SP_REJReport'RJ201200000034'

--CREATE Procedure XP_SP_REJReport
DECLARE 
@REJ_NO varchar(20)='RJ201200000034'  
--As      
    SELECT  Data0096.RKEY, Data0096.REJ_NO
    
    /*,data0016.location,
            Data0096.REJ_PTR, Data0096.INV_TRAN_PTR, Data0096.EMPL_PTR, 
            Data0096.USER_PTR,Data0005.employee_name as Creater_Name,Data0096.TDATE, 
            Data0096.QUAN_REJD /*AS 申请数量*/, Data0096.FLAG /*AS 拒收退回标记*/, 
            Data0096.REFERENCE_NUMBER /*AS 参考号*/, Data0096.Tstatus /*AS 状态*/, 
            Data0096.Audited_By,Data0005_1.employee_name as Audited_Name,
            Data0096.Audited_Date /*AS 审核日期*/, 
            Data0096.Req_Quan_REJD /*AS 提交退货数量*/, 
            Data0076.REJECT_DESCRIPTION /*AS 原因*/, 
            Data0017.INV_PART_NUMBER /*AS 材料代码*/, 
            Data0017.INV_NAME /*AS 材料名称*/, Data0017.INV_DESCRIPTION /*AS 材料规格*/, 
            Data0022.RKEY AS DATA0022RKEY,
            PRICE=Round(Data0022.PRICE*(1+Data0022.TAX_2/100),4),
            Amount=Round(Round(Data0022.PRICE*(1+Data0022.TAX_2/100),4)*Data0096.QUAN_REJD,2),
            Data0023.CODE,Data0023.ABBR_NAME,data0023.SUPPLIER_NAME,Data0002.UNIT_CODE,Data0002.UNIT_NAME,
            data0070.po_number,data0070.po_date,data0071.QUAN_ORD,data0071.QUAN_RECD
*/
    FROM Data0096
        /*  LEFT OUTER JOIN Data0005 Data0005_1 ON Data0096.Audited_By = Data0005_1.RKEY LEFT OUTER JOIN
         Data0005 ON Data0096.EMPL_PTR = Data0005.RKEY LEFT OUTER JOIN
         Data0017 ON Data0096.INVT_PTR = Data0017.RKEY LEFT OUTER JOIN
         Data0076 ON Data0096.REJ_PTR = Data0076.RKEY LEFT OUTER JOIN
         Data0022 ON Data0096.INV_TRAN_PTR = Data0022.RKEY LEFT OUTER JOIN
         Data0023 ON Data0022.SUPPLIER_PTR=Data0023.RKEY LEFT OUTER JOIN
         Data0002 ON Data0017.STOCK_UNIT_PTR=Data0002.RKEY left join 
         data0016 on Data0022.location_ptr=data0016.rkey left join 
         data0071 on data0022.source_ptr=data0071.rkey left join 
         data0070 on data0071.po_ptr=data0070.rkey
   */      
    WHERE Data0096.Tstatus=1 and ISNULL(Data0096.REJ_NO,'')=@REJ_NO
    ORDER BY Data0022.RKEY
go


-----------------------------------------------------------------


--查询

SELECT distinct rkey,rej_no,tran_tp,tran_tpDesc,warehouse_code,warehouse_name,code23,supplier_name,status,statusdesc,create_date,Create_bycode,Create_byname,check_date,Check_byname,REF_NUMBER,sys_id,sys_rq,PRINTED 
FROM vData0096_1 
WHERE isnull(tran_tp,0) in(8,19,20,38) and convert(varchar(10),create_date,120)>='2013-08-31' and convert(varchar(10),create_date,120)<='2013-09-30'  

Order by rkey ASC