--EP279╕╢┐ю╔ъ╟ы╜ч├ц

--create Procedure EP279;3
DECLARE
@Vdate1 datetime,
@Vdate2 datetime
--with encryption
SELECT @Vdate1='2014-2-1',@Vdate2='2014-3-5'
--as
declare @vnum int
select @vnum =COUNT(*) from data0103 where spec_rkey='9'
select data0034.dept_name,data0005.employee_name,data0131.*,data0001.curr_code,data0023.abbr_name,data0023.supplier_name,data0023.code,data0005_2.employee_name as auditor,data0005_4.employee_name as printman,data0023.CONTACT_NAME_1,
data0023.CONT_PHONE_1,data0023.EMAIL_FOR_CONTACT1,data0023.tax_id_number as PAYMENT_TERMS,data0070.po_number,
data0103.gl_acc_number,case when Data0023.purchempl_ptr>0 then data0005_1.employee_name else data0005_3.employee_name end as purchaser,
data0023.TELEX ,data0023.GEN_EMAIL_ADDRESS ,data0023.BILLING_ADDRESS_1,Data0023.state,Data0023.ForBankCode,Data0023.SWIFTTID,
case when amount-100000000>=0 and amount-1000000000<0 then 'гд' else cast(cast(floor(amount*0.000000001) -10*floor(amount*0.00000000001) as int) as varchar(2)) end as m12,
case when amount-10000000>=0 and amount-100000000<0 then 'гд' when  amount-10000000<0 then '' else cast(cast(floor(amount*0.00000001) -10*floor(amount*0.000000001) as int) as varchar(2)) end as m11,
case when amount-1000000>=0 and amount-10000000<0 then 'гд' when  amount-1000000<0 then '' else cast(cast(floor(amount*0.0000001) -10*floor(amount*0.00000001) as int) as varchar(2)) end as m10,
case when amount-100000>=0 and amount-1000000<0 then 'гд' when  amount-100000<0 then '' else cast(cast(floor(amount*0.000001) -10*floor(amount*0.0000001) as int) as varchar(2)) end as m9,
case when amount-10000>=0 and amount-100000<0 then 'гд' when  amount-10000<0 then '' else cast(cast(floor(amount*0.00001) -10*floor(amount*0.000001) as int) as varchar(2)) end as m8,
case when amount-1000>=0 and amount-10000<0 then 'гд' when  amount-1000<0 then '' else cast(cast(floor(amount*0.0001) -10*floor(amount*0.00001) as int) as varchar(2)) end as m7,
case when amount-100>=0 and amount-1000<0 then 'гд' when  amount-100<0 then '' else cast(cast(floor(amount*0.001) -10*floor(amount*0.0001) as int) as varchar(2)) end as m6,
case when amount-10>=0 and amount-100<0 then 'гд' when  amount-10<0 then '' else cast(cast(floor(amount*0.01) -10*floor(amount*0.001) as int) as varchar(2)) end as m5,
case when amount-1>=0 and amount-10<0 then 'гд' when amount-1<0 then '' else cast(cast(floor(amount*0.1) -10*floor(amount*0.01) as int) as varchar(2)) end as m4,
case when amount-0.1>=0 and amount-1<0 then 'гд' when  amount-0.1<0 then '' else cast(cast(floor(amount*1) -10*floor(amount*0.1) as int) as varchar(2)) end as m3,
case when amount-0.01>=0 and amount-0.1<0 then 'гд' when  amount-0.01<0 then '' else cast(cast(floor(amount*10) -10*floor(amount*1) as int) as varchar(2)) end as m2,
cast(cast(ROUND(ROUND(amount,2)*100-10*floor(ROUND(amount,2)*10),0) as int) as varchar(1)) as m1
FROM         dbo.Data0131 INNER JOIN
                      dbo.Data0023 ON dbo.Data0131.supp_ptr = dbo.Data0023.RKEY INNER JOIN
                      dbo.Data0001 ON dbo.Data0131.curr_ptr = dbo.Data0001.RKEY INNER JOIN
                      dbo.Data0005 ON dbo.Data0131.created_by = Data0005.RKEY LEFT OUTER JOIN
                      dbo.Data0070 ON dbo.Data0131.po_ptr = Data0070.RKEY LEFT OUTER JOIN
                      dbo.Data0005 AS Data0005_2 ON dbo.Data0131.audited_by = Data0005_2.RKEY LEFT OUTER JOIN
                      dbo.Data0005 AS Data0005_1 ON dbo.Data0023.purchempl_ptr = Data0005_1.RKEY LEFT OUTER JOIN
                      dbo.Data0005 AS Data0005_3 ON dbo.Data0023.purmempl_ptr = Data0005_3.RKEY LEFT OUTER JOIN
                      dbo.Data0005 AS Data0005_4 ON dbo.Data0131.printed_by_ptr = Data0005_4.RKEY LEFT OUTER JOIN
                      dbo.Data0034 ON dbo.Data0023.mgtdept_ptr = dbo.Data0034.RKEY LEFT OUTER JOIN
                      dbo.Data0103 ON dbo.Data0131.gl_acc_ptr = dbo.Data0103.RKEY
where data0131.tdate>=@vdate1
and data0131.tdate<@vdate2
order by data0131.id_no
go
