exec ep032;2 1985,113,'双面沉金板，2004BMC(厚1.5mm)123*100mm',3,3,3,3

CREATE PROCEDURE ep032;2
@vptr1 int ,
@vptr2 int ,
@part_number varchar(100),
@vst01 int,
@vst02 int,
@vst03 int,
@vst04 int
AS

--AMENDED BY WANG TIE MIN 20110511
--修改原因：把报价单根据不同数量的所有报价全部UNION出来
SELECT Data0085.RKEY, Data0085.TNUMBER, Data0085.CUST_NAME, 
      Data0085.CUST_PART_NO, Data0085.QTE_UNITS,data0259.VATAX,
Data0259.QUANTITY1, Data0259.PRICE1,Data0259.TAXPRICE1,data0085.audited_status,
Data0085.Quote_type,data0085.qte_unit_ptr,isnull(data0259.tool_price1,0)+isnull(data0259.tool_price2,0)+isnull(data0259.tool_price3,0)+
isnull(data0259.tool_price4,0)+isnull(data0259.tool_price5,0)+isnull(data0259.tool_price6,0)+
isnull(data0259.tool_price7,0)+isnull(data0259.tool_price8,0)+isnull(data0259.tool_price9,0)+
isnull(data0259.tool_price10,0)+isnull(data0259.tool_price11,0)+isnull(data0259.tool_price12,0)+isnull(data0259.tool_price13,0)+
isnull(data0259.tool_price14,0)+isnull(data0259.tool_price15,0)+isnull(data0259.tool_price16,0)+
isnull(data0259.tool_price17,0)+isnull(data0259.tool_price18,0)+isnull(data0259.tool_price19,0)+
isnull(data0259.tool_price20,0) as tool_price,data0085.curr_rate,data0085.curr_ptr,
case Data0085.Quote_type when 0 then '内销 ' when  1 then  '保税' when 2 then  '外销' end  as Quote_type_desc,data0010.CUST_CODE  --20130809 LLL 
FROM Data0085 
     INNER JOIN  Data0259 ON Data0085.RKEY = Data0259.QTE_PTR 
     left join data0010 on data0085.CUST_PTR=data0010.rkey  --20130809 LLL 
     
where (data0085.audited_status=@vst01 or data0085.audited_status=@vst02 or data0085.audited_status=@vst03 or data0085.audited_status=@vst04 )and 
      data0085.expiration_date>=getdate() and
(Data0085.CUST_PART_NO=@part_number
or (data0085.cust_part_ptr=@vptr1
and data0085.cust_ptr=@vptr2))
UNION
SELECT Data0085.RKEY, Data0085.TNUMBER, Data0085.CUST_NAME, 
      Data0085.CUST_PART_NO, Data0085.QTE_UNITS,data0259.VATAX,
QUANTITY1 = Data0259.QUANTITY2, PRICE1 = Data0259.PRICE2,TAXPRICE1=Data0259.TAXPRICE2,data0085.audited_status,
Data0085.Quote_type,data0085.qte_unit_ptr,isnull(data0259.tool_price1,0)+isnull(data0259.tool_price2,0)+isnull(data0259.tool_price3,0)+
isnull(data0259.tool_price4,0)+isnull(data0259.tool_price5,0)+isnull(data0259.tool_price6,0)+
isnull(data0259.tool_price7,0)+isnull(data0259.tool_price8,0)+isnull(data0259.tool_price9,0)+
isnull(data0259.tool_price10,0)+isnull(data0259.tool_price11,0)+isnull(data0259.tool_price12,0)+isnull(data0259.tool_price13,0)+
isnull(data0259.tool_price14,0)+isnull(data0259.tool_price15,0)+isnull(data0259.tool_price16,0)+
isnull(data0259.tool_price17,0)+isnull(data0259.tool_price18,0)+isnull(data0259.tool_price19,0)+
isnull(data0259.tool_price20,0) as tool_price,data0085.curr_rate,data0085.curr_ptr,
case Data0085.Quote_type when 0 then '内销 ' when  1 then  '保税' when 2 then  '外销' end  as Quote_type_desc,data0010.CUST_CODE  --20130809 LLL 
FROM Data0085 INNER JOIN
      Data0259 ON Data0085.RKEY = Data0259.QTE_PTR 
      left join data0010 on data0085.CUST_PTR=data0010.rkey  --20130809 LLL  
where (data0085.audited_status=@vst01 or data0085.audited_status=@vst02 or data0085.audited_status=@vst03 or data0085.audited_status=@vst04 )and 
      data0085.expiration_date>=getdate() and
(Data0085.CUST_PART_NO=@part_number
or (data0085.cust_part_ptr=@vptr1
and data0085.cust_ptr=@vptr2))
and (data0259.PRICE2>0)
UNION
SELECT Data0085.RKEY, Data0085.TNUMBER, Data0085.CUST_NAME, 
      Data0085.CUST_PART_NO, Data0085.QTE_UNITS,data0259.VATAX,
QUANTITY1 = Data0259.QUANTITY3, PRICE1 = Data0259.PRICE3,TAXPRICE1=Data0259.TAXPRICE3,data0085.audited_status,
Data0085.Quote_type,data0085.qte_unit_ptr,isnull(data0259.tool_price1,0)+isnull(data0259.tool_price2,0)+isnull(data0259.tool_price3,0)+
isnull(data0259.tool_price4,0)+isnull(data0259.tool_price5,0)+isnull(data0259.tool_price6,0)+
isnull(data0259.tool_price7,0)+isnull(data0259.tool_price8,0)+isnull(data0259.tool_price9,0)+
isnull(data0259.tool_price10,0)+isnull(data0259.tool_price11,0)+isnull(data0259.tool_price12,0)+isnull(data0259.tool_price13,0)+
isnull(data0259.tool_price14,0)+isnull(data0259.tool_price15,0)+isnull(data0259.tool_price16,0)+
isnull(data0259.tool_price17,0)+isnull(data0259.tool_price18,0)+isnull(data0259.tool_price19,0)+
isnull(data0259.tool_price20,0) as tool_price,data0085.curr_rate,data0085.curr_ptr,
case Data0085.Quote_type when 0 then '内销 ' when  1 then  '保税' when 2 then  '外销' end  as Quote_type_desc,data0010.CUST_CODE  --20130809 LLL  
FROM Data0085 INNER JOIN
      Data0259 ON Data0085.RKEY = Data0259.QTE_PTR 
      left join data0010 on data0085.CUST_PTR=data0010.rkey  --20130809 LLL  
where (data0085.audited_status=@vst01 or data0085.audited_status=@vst02 or data0085.audited_status=@vst03 or data0085.audited_status=@vst04 )and 
      data0085.expiration_date>=getdate() and
(Data0085.CUST_PART_NO=@part_number
or (data0085.cust_part_ptr=@vptr1
and data0085.cust_ptr=@vptr2))
and (data0259.PRICE3>0)
UNION
SELECT Data0085.RKEY, Data0085.TNUMBER, Data0085.CUST_NAME, 
      Data0085.CUST_PART_NO, Data0085.QTE_UNITS,data0259.VATAX,
QUANTITY1 = Data0259.QUANTITY4, PRICE1 = Data0259.PRICE4,TAXPRICE1=Data0259.TAXPRICE4,data0085.audited_status,
Data0085.Quote_type,data0085.qte_unit_ptr,isnull(data0259.tool_price1,0)+isnull(data0259.tool_price2,0)+isnull(data0259.tool_price3,0)+
isnull(data0259.tool_price4,0)+isnull(data0259.tool_price5,0)+isnull(data0259.tool_price6,0)+
isnull(data0259.tool_price7,0)+isnull(data0259.tool_price8,0)+isnull(data0259.tool_price9,0)+
isnull(data0259.tool_price10,0)+isnull(data0259.tool_price11,0)+isnull(data0259.tool_price12,0)+isnull(data0259.tool_price13,0)+
isnull(data0259.tool_price14,0)+isnull(data0259.tool_price15,0)+isnull(data0259.tool_price16,0)+
isnull(data0259.tool_price17,0)+isnull(data0259.tool_price18,0)+isnull(data0259.tool_price19,0)+
isnull(data0259.tool_price20,0) as tool_price,data0085.curr_rate,data0085.curr_ptr,
case Data0085.Quote_type when 0 then '内销 ' when  1 then  '保税' when 2 then  '外销' end  as Quote_type_desc,data0010.CUST_CODE  --20130809 LLL 
FROM Data0085 INNER JOIN
      Data0259 ON Data0085.RKEY = Data0259.QTE_PTR 
      left join data0010 on data0085.CUST_PTR=data0010.rkey  --20130809 LLL  
where (data0085.audited_status=@vst01 or data0085.audited_status=@vst02 or data0085.audited_status=@vst03 or data0085.audited_status=@vst04 )and 
      data0085.expiration_date>=getdate() and
(Data0085.CUST_PART_NO=@part_number
or (data0085.cust_part_ptr=@vptr1
and data0085.cust_ptr=@vptr2))
and (data0259.PRICE4>0)
UNION
SELECT Data0085.RKEY, Data0085.TNUMBER, Data0085.CUST_NAME, 
      Data0085.CUST_PART_NO, Data0085.QTE_UNITS,data0259.VATAX,
QUANTITY1 = Data0259.QUANTITY5, PRICE1 = Data0259.PRICE5,TAXPRICE1=Data0259.TAXPRICE5,data0085.audited_status,
Data0085.Quote_type,data0085.qte_unit_ptr,isnull(data0259.tool_price1,0)+isnull(data0259.tool_price2,0)+isnull(data0259.tool_price3,0)+
isnull(data0259.tool_price4,0)+isnull(data0259.tool_price5,0)+isnull(data0259.tool_price6,0)+
isnull(data0259.tool_price7,0)+isnull(data0259.tool_price8,0)+isnull(data0259.tool_price9,0)+
isnull(data0259.tool_price10,0)+isnull(data0259.tool_price11,0)+isnull(data0259.tool_price12,0)+isnull(data0259.tool_price13,0)+
isnull(data0259.tool_price14,0)+isnull(data0259.tool_price15,0)+isnull(data0259.tool_price16,0)+
isnull(data0259.tool_price17,0)+isnull(data0259.tool_price18,0)+isnull(data0259.tool_price19,0)+
isnull(data0259.tool_price20,0) as tool_price,data0085.curr_rate,data0085.curr_ptr,
case Data0085.Quote_type when 0 then '内销 ' when  1 then  '保税' when 2 then  '外销' end  as Quote_type_desc,data0010.CUST_CODE  --20130809 LLL 
FROM Data0085 INNER JOIN
      Data0259 ON Data0085.RKEY = Data0259.QTE_PTR 
      left join data0010 on data0085.CUST_PTR=data0010.rkey  --20130809 LLL   
where (data0085.audited_status=@vst01 or data0085.audited_status=@vst02 or data0085.audited_status=@vst03 or data0085.audited_status=@vst04 )and 
      data0085.expiration_date>=getdate() and
(Data0085.CUST_PART_NO=@part_number
or (data0085.cust_part_ptr=@vptr1
and data0085.cust_ptr=@vptr2))
and (data0259.PRICE5>0)
UNION
SELECT Data0085.RKEY, Data0085.TNUMBER, Data0085.CUST_NAME, 
      Data0085.CUST_PART_NO, Data0085.QTE_UNITS,data0259.VATAX,
QUANTITY1 = Data0259.QUANTITY6, PRICE1 = Data0259.PRICE6,TAXPRICE1=Data0259.TAXPRICE6,data0085.audited_status,
Data0085.Quote_type,data0085.qte_unit_ptr,isnull(data0259.tool_price1,0)+isnull(data0259.tool_price2,0)+isnull(data0259.tool_price3,0)+
isnull(data0259.tool_price4,0)+isnull(data0259.tool_price5,0)+isnull(data0259.tool_price6,0)+
isnull(data0259.tool_price7,0)+isnull(data0259.tool_price8,0)+isnull(data0259.tool_price9,0)+
isnull(data0259.tool_price10,0)+isnull(data0259.tool_price11,0)+isnull(data0259.tool_price12,0)+isnull(data0259.tool_price13,0)+
isnull(data0259.tool_price14,0)+isnull(data0259.tool_price15,0)+isnull(data0259.tool_price16,0)+
isnull(data0259.tool_price17,0)+isnull(data0259.tool_price18,0)+isnull(data0259.tool_price19,0)+
isnull(data0259.tool_price20,0) as tool_price,data0085.curr_rate,data0085.curr_ptr,
case Data0085.Quote_type when 0 then '内销 ' when  1 then  '保税' when 2 then  '外销' end  as Quote_type_desc,data0010.CUST_CODE  --20130809 LLL 
FROM Data0085 INNER JOIN
      Data0259 ON Data0085.RKEY = Data0259.QTE_PTR 
      left join data0010 on data0085.CUST_PTR=data0010.rkey  --20130809 LLL   
           
where (data0085.audited_status=@vst01 or data0085.audited_status=@vst02 or data0085.audited_status=@vst03 or data0085.audited_status=@vst04 )and 
      data0085.expiration_date>=getdate() and
(Data0085.CUST_PART_NO=@part_number
or (data0085.cust_part_ptr=@vptr1
and data0085.cust_ptr=@vptr2))
and (data0259.PRICE6>0)
s