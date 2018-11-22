EP2061更改采购单查询
SELECT distinct PoBg_Status,rkey,v_status,PoBg_Number,PRINT_record,PoBg_Type,v_Type,PoBg_Date,Bg_time,employee_name,AUDITER_NAME,po_number,v_typePO,PO_MAINMATTYPE,InPutTypeDescPO,code,supplier_name,sys_id,sys_rq,SUB_TOTAL,EXCHANGE_RATE,Back_Time,Back_Ptr,warehouse_pointer,rkey923,auth_date,ranking,user_ptr,SECOND_WHSE_PTR,PoBg_Create,CONFIRMATION_NUMBER,Po_Ptr 
FROM vdata2060_2  
WHERE  PoBg_Status=2 and (auth_date is null ) and PoBg_TypePo='S' 
and ( user_ptr IN (SELECT  rkey FROM data0073 WHERE rpl_PoBg_ptr=1)) 
and (second_whse_ptr  IN (SELECT  rkey FROM data0073 WHERE rpl_PoBg_ptr=1 union all select user_ptr from Data0923 where PoBg_ptr=vdata2060_2.rkey and ranking in (select ranking from Data0923 where PoBg_ptr=vdata2060_2.rkey and user_ptr=1))) 
and user_ptr in (select user_ptr from Data0923 where PoBg_ptr=vdata2060_2.rkey and ranking in  (select min(ranking) as ranking from Data0923 where PoBg_ptr=vdata2060_2.rkey and ranking not in (select ranking from Data0923 where Data0923.PoBg_ptr=vdata2060_2.rkey and auth_date is not null))) 
and PoBg_Date>='2013-08-22 00:00:00' and PoBg_Date<='2013-09-22 00:00:00' 
 Order by PoBg_Number  ASC
 
 
审核


