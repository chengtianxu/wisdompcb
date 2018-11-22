 If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#tmp'))  
 drop table #tmp  
 If exists(Select 1 From tempdb..sysobjects Where id=object_id('tempdb..#Result'))  
 drop table #Result 
 
 SELECT Data0492.SO_NO/*销售订单号*/,Data0492.CUT_NO/*投料单号*/,Data0025.MANU_PART_NUMBER,
                data0492.ISSUED_QTY as ISSUED_QTYpcs /*投产PCS数*/ ,(data0492.ISSUED_QTY / IsNull(Data0047.PARAMETER_VALUE,1)) AS QTY_PLANNED /*投产数量*/   
                into #tmp 
 From Data0058 Left Join
                        Data0158 on Data0058.mrb_no = Data0158.mrb_no left join 
                        Data0006 On Data0058.WO_PTR=Data0006.RKey Left Join 
                        Data0492 On Data0006.CUT_NO=Data0492.CUT_NO Left Join
                        Data0025 On Data0006.BOM_PTR=Data0025.RKey Left Join
                        Data0050 On Data0025.ANCESTOR_PTR=Data0050.RKey Left Join
                        Data0047 On Data0025.RKey=Data0047.SOURCE_POINTER Left Join
                        Data0034 On Data0058.RESP_DEPT_PTR=Data0034.Rkey left join
                        Data0008 on Data0025.PROD_CODE_PTR=Data0008.Rkey left join
                        Data0039 on Data0058.REJECT_PTR=Data0039.Rkey left join
                        Data0059 on Data0050.Rkey=Data0059.cust_part_ptr
                          and Data0492.customer_ptr=Data0059.customer_ptr 
                        left join data0010 on data0492.customer_ptr=data0010.rkey --20130525 LLL 加客户 
                   where  Data0039.spec_type=0 AND DATA0047.PARAMETER_PTR = 1 and (DATA0050.TTYPE=0 or DATA0050.TTYPE=1)  AND DATA0058.TDATETIME >= '2013-05-16 00:00:00' AND DATA0058.TDATETIME <= '2013-06-15 23:59:59' and DATA0058.QTY_REJECT / IsNull(DATA0047.PARAMETER_VALUE,1) >= 0            and Data0050.CUSTOMER_PART_NUMBER LIKE '%' and Data0006.work_order_number like '%' and Data0058.reject_ptr<>0 
                   
SELECT SO_NO,MANU_PART_NUMBER,
                  ISSUED_QTYpcs=sum(ISSUED_QTYpcs) /*投产PCS数*/
                 ,QTY_PLANNED=sum(QTY_PLANNED) /*投产数量*/   
                
 into #Result 
From (select distinct * from #tmp) a  Group by SO_NO,MANU_PART_NUMBER 



SELECT ABBR_NAME=data0010.cust_code /*客户简称*/, Data0050.CUSTOMER_PART_NUMBER /*本厂编号*/,Data0050.Layers /*层数*/,Data0050.mat_tp /*基材类型*/,
                  Data0050.CP_REV /*版本*/,Data0050.eng_tp, Data0025.MANU_PART_NUMBER /**/, Data0059.CUSTOMER_PART_DESC /*产品描述*/, 
                  Data0008.PRODUCT_NAME /*产品类别*/, data0492.SO_NO /*销售订单号*/,data0492.SCH_COMPL_DATE /*投产日期*/,
                  Data0034.DEPT_NAME /*责任部门*/,Data0039.REJECT_DESCRIPTION /*缺陷名称*/,Data0008.Product_Name /*类型*/,
                  t1.ISSUED_QTYpcs,/*投产PCS数*/t1.QTY_PLANNED/*投产数量*/,factory=Data0015.abbr_name,Data0047.PARAMETER_VALUE,
                  (case Data0050.ttype when 0 then Data0008.EST_SCRAP_LTM when 1 then Data0008.EST_SCRAP1_LMT end) as rej_rate ,parts_order=data0060.parts_ordered/IsNull(Data0047.PARAMETER_VALUE,1) ,SUM(Data0058.QTY_REJECT/ IsNull(Data0047.PARAMETER_VALUE,1)) AS QUANTITY /*报废数量*/,Data0050.Customer_part_number+' '+data0050.cp_rev as cust_part_number 
 From Data0058 left join
     Data0158 on Data0058.mrb_no = Data0158.mrb_no left join 
     Data0006 on Data0058.WO_PTR=Data0006.Rkey left join
     Data0492 on Data0006.cut_no=Data0492.cut_no left join
     Data0060 on Data0492.so_no=Data0060.sales_order left join
     Data0025 on Data0006.bom_ptr=Data0025.Rkey left join
     Data0050 on Data0025.ancestor_ptr=Data0050.Rkey left join
     Data0059 on Data0050.Rkey=Data0059.cust_part_ptr
             and Data0060.customer_ptr=Data0059.customer_ptr left join
     Data0010 on Data0060.customer_ptr=Data0010.Rkey left join
     Data0008 on Data0025.PROD_CODE_PTR=Data0008.Rkey left join
     Data0039 on Data0058.REJECT_PTR=Data0039.Rkey left join
     Data0034 on Data0058.RESP_DEPT_PTR=Data0034.Rkey left join
     #Result t1 On Data0492.SO_NO=t1.SO_NO and t1.MANU_PART_NUMBER =Data0025.MANU_PART_NUMBER left join
     Data0015 on Data0006.whouse_ptr=Data0015.Rkey left join
     Data0047 on Data0025.RKEY = Data0047.SOURCE_POINTER 
             AND DATA0047.PARAMETER_PTR = 1 where  Data0039.spec_type=0  and (DATA0050.TTYPE=0 or DATA0050.TTYPE=1)  AND DATA0058.TDATETIME >= '2013-05-16 00:00:00' AND DATA0058.TDATETIME <= '2013-06-15 23:59:59' and DATA0058.QTY_REJECT / IsNull(DATA0047.PARAMETER_VALUE,1) >= 0            and Data0050.CUSTOMER_PART_NUMBER LIKE '%' and Data0006.work_order_number like '%' and Data0058.reject_ptr<>0 Group by Data0010.Cust_code,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0050.Layers,Data0025.MANU_PART_NUMBER,
                Data0059.CUSTOMER_PART_DESC,Data0008.PRODUCT_NAME,data0492.SO_NO,data0492.SCH_COMPL_DATE,Data0034.DEPT_NAME,
                Data0039.REJECT_DESCRIPTION,Data0008.Product_Name,t1.ISSUED_QTYpcs,t1.QTY_PLANNED,data0060.parts_ordered,Data0050.mat_tp,
                Data0047.PARAMETER_VALUE,Data0015.abbr_name,Data0050.eng_tp,(case Data0050.ttype when 0 then Data0008.EST_SCRAP_LTM when 1 then Data0008.EST_SCRAP1_LMT end) order by Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV,Data0025.MANU_PART_NUMBER,data0492.so_no 