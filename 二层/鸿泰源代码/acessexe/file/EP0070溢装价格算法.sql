--EP0070溢装价格算法
--YESTAX_AMOUNT--含税金额
--exec ep070;3 1,'and data0439.date_sailing>=''2013-09-01'' and data0439.date_sailing<''2013-11-21 23:59:59''and data0010.cust_code LIKE ''212%'''
select data0439.delivery_no,Data0060.sales_order,data0060.PART_PRICE,PARTS_ORDERED,data0060.tax_in_price,data0010.Invprice_from_64,
ROUND((
(case data0060.tax_in_price when 'N' then --不含税
       (case isnull(data0010.Invprice_from_64,0)  when 0 then --取64表
			    Data0060.part_price 
			 else--取60表
			  Data0064.part_price end) 
			  
		  * (1+data0189.state_tax/100.00)--税率
		else --含税
			(case isnull(data0010.Invprice_from_64,0)  when 0 then--取64表
			     Data0060.part_price 
			  else--取60表
			     Data0064.part_price 
			 end)
		end) 
			 *Data0064.QUAN_SHIPPED + 
			 --上面是正常金额，下面是溢装金额
			 (case data0060.tax_in_price when 'N' then--不含税
			  (case isnull(data0010.Invprice_from_64,0)  when 0 then 
			         Data0060.part_price 
			      else 
			          Data0064.part_price 
			    end) 
			   *  (1+data0189.state_tax/100.00) --税率
			   else  --含税
			     (case isnull(data0010.Invprice_from_64,0)  when 0 then
			              Data0060.part_price 
			            else 
			              Data0064.part_price
			          end) 
                end)
			   *data0064.ovsh_qty -- 溢装数量ovsh_qty1+Returned_ovsh退回溢装+Spare_shipped备品
			   *(100-Data0064.ovsh_discount)*0.01)+0.0000001,2) YESTAX_AMOUNT
			   
FROM data0439 INNER JOIN Data0010 ON data0439.customer_ptr = Data0010.RKEY 
  inner join data0012 d12 on data0439.ship_addr_ptr=d12.rkey 
  INNER JOIN Data0064 ON data0439.rkey = Data0064.packing_list_ptr
  INNER JOIN Data0060 ON Data0064.SO_PTR = Data0060.RKEY 
  left join data0098  on data0064.RMA_PTR=data0098.rkey   --关联退货表98表  LLL 20120915 
  INNER JOIN Data0050 ON Data0060.CUST_PART_PTR = Data0050.RKEY
  INNER JOIN data0025 on data0050.rkey=data0025.ANCESTOR_PTR and data0025.parent_ptr= 0
 -- LEFT join Data0047 a On data0025.rkey=a.SOURCE_POINTER and a.PARAMETER_PTR=(select top 1 rkey from data0278 where spec_rkey='''+@MUnit+''' )
  --left join data0047 b on data0025.rkey=b.source_pointer and b.parameter_ptr=(select top 1 rkey from data0278 where spec_rkey=''C'' )
  --LEFT JOIN DATA0047 C ON DATA0025.RKEY=C.SOURCE_POINTER AND C.PARAMETER_PTR=(select top 1 rkey from data0278 where spec_rkey='''+@JUnit+''' )
  --left join Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY
  left JOIN Data0097 ON  Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  left JOIN data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND
      Data0060.CUST_PART_PTR = data0059.cust_part_ptr
  LEFT JOIN Data0529 ON  data0439.shipadvice_ptr = Data0529.RKEY
  LEFT JOIN Data0112 ON data0439.invoice_ptr = Data0112.RKEY
  left join Data0001 on data0060.currency_ptr=data0001.rkey
  left join data0012 on data0060.cust_ship_addr_ptr=data0012.rkey
  left join data0189 on data0012.ship_ctax_ptr=data0189.rkey
  left join data0015 on data0060.whse_ptr=data0015.rkey left join Data0008 on Data0025.PROD_CODE_PTR=Data0008.RKEY
  left join data0073  on data0439.audited_by_ptr=data0073.rkey --审核人
WHERE  1=1 AND DATA0439.delivery_no='12034393'