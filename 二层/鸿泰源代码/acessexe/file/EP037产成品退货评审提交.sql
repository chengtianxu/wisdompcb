--产成品退货
--RMA_STATUS,0为未提交 ,1为提交后未审 , 2为已经审核
exec sp_executesql N'declare @flag int
select @flag=ep037_flag from data0195
declare @user_ptr int
Set @user_ptr =0
if @flag=1
Select @user_ptr =isnull(data0009.RKEY,0) from data0009 where isnull(class,0)=0 and employee_ptr in (select employee_ptr from data0073 where rkey=@P1)

select data0098.rma_number,data0098.note_pad_ptr,data0098.rma_date,data0098.QTY_AUTH,data0098.qty_ship,data0098.so_ptr,data0098.co_Price,data0098.audited_by_ptr,data0098.EFFECT_TP,data0098.Re_purchase_order_ptr,
 data0098.RMA_STATUS,data0098.rkey,data0098.customer_ptr,data0098.customer_part_ptr,isnull(data0098.REQUEST_D0050_RKEY,data0098.customer_part_ptr) as REQUEST_D0050_RKEY,Data0098.Qty_shipd,data0098.ReDate,
 data0060.sales_order,data0098.shipment_ptr,data0098.qty_recd,data0098.audited_date,Data0098.qty_planned,d05a.employee_name as audit_name,data0098.required_amount,data0098.actual_Retn_Qty,
 data0010.cust_code, data0050.customer_part_number,data0050.cp_rev ,data0098.curr_ptr,data0098.ref_number,data0005.employee_name,data0098.sys_date,isnull(data0098.whse_ptr,0) as whse_ptr,
isnull(data0098.srce_ptr,0) as srce_ptr,data0098.lost_amount,LASTMOD_DATE,d60.SALES_ORDER as RMA_SALES_ORDER,data0097.PO_NUMBER,d60.PARTS_SHIPPED as RMA_PARTS_SHIPPED,isnull(d60.STATUS,0) as RMAORDER_STATUS    
from data0098 left outer join data0060 on data0098.SO_PTR=data0060.rkey 
  left join data0060 d60 on data0098.rkey=d60.RMA_PTR  --退货订单  
  left join data0005 d05a on data0098.audited_by_ptr=d05a.rkey
  inner join data0010  on data0098.customer_ptr=data0010.rkey
  inner join data0050 on data0098.customer_part_ptr=data0050.rkey
  left join data0005 on data0098.auth_by_empl_ptr=data0005.rkey
  left join data0097 on data0098.Re_purchase_order_ptr=data0097.rkey
where (data0098.rma_date>=@P2) and (data0098.rma_date<=@P3)
and (isnull(@user_ptr,0)=0 or data0010.rkey in (select customer_ptr from data0012
 where srep_ptr_1 =@user_ptr or srep_ptr_2 =@user_ptr or srep_ptr_3 =@user_ptr or srep_ptr_4 =@user_ptr or srep_ptr_5 =@user_ptr ))

order by rma_number
',N'@P1 int,@P2 datetime,@P3 datetime',294,'2013-02-25 00:00:00','2013-04-27 00:00:00'


--查看审核信息
-- exec ep037;5 1925


SELECT user_id,user_full_name,
       auth_date,ranking,user_ptr,RMA_Remark
FROM data0274 inner join data0073
     On data0274.user_ptr=data0073.rkey
WHERE (rma_ptr =1925) --退货指针
  
ORDER BY
  ranking
  
  
  --提交审核
 
  --条件过滤
  exec sp_executesql N'SELECT USER_PTR,seq_no FROM data0077
WHERE  ttype=2 and (UPPER_LIMIT >=@P1) AND (LOWER_LIMIT <= @P2) and (whouse_ptr = 0 or whouse_ptr =@P3) 
ORDER BY SEQ_NO
',N'@P1 money,@P2 money,@P3 int',$1.0000,$1.0000,2

--如果原来存在审核人相信就删除他
exec sp_executesql N'DELETE FROM "SJ_V20_live".."data0274" WHERE "rkey"=@P1',N'@P1 int',14347

--增加审核人到审核表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0274" ("user_ptr","ranking","rma_ptr") VALUES 
(@P1,@P2,@P3); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',N'@P1 int,@P2 tinyint,@P3 int',294,0,1925

exec sp_executesql N'UPDATE "SJ_V20_live".."data0098" SET "RMA_STATUS"=@P1 WHERE "RMA_STATUS"=@P2 AND "rkey"=@P3',N'@P1 smallint,@P2 smallint,@P3 int',1,0,1925


--审核时

exec sp_executesql N'select rkey,parts_returned,quan_to_re_delivery
from data0060
where rkey=@P1
',N'@P1 int',82046
--修改销售订单
exec sp_executesql N'UPDATE "SJ_V20_live".."data0060" 
SET "parts_returned"=@P1,"quan_to_re_delivery"=@P2 
WHERE "rkey"=@P3 AND "parts_returned"=@P4 AND "quan_to_re_delivery"=@P5',
N'@P1 float,@P2 int,@P3 int,@P4 float,@P5 int',
1,1,82046,0,0
--修改审核时间
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0274" 
SET "auth_date"=@P1 WHERE "auth_date" IS NULL AND "rkey"=@P2',
N'@P1 datetime,@P2 int',
'2013-04-26 00:00:00',48167
--最后修改退货单状态
exec sp_executesql N'UPDATE "SJ_V20_live".."data0098"
 SET "RMA_STATUS"=@P1,"audited_by_ptr"=@P2,"audited_date"=@P3 
 WHERE "RMA_STATUS"=@P4 AND "rkey"=@P5 AND "audited_by_ptr" IS NULL AND "audited_date" IS NULL',
 N'@P1 smallint,@P2 int,@P3 datetime,@P4 smallint,@P5 int',
 2,3,'2013-04-26 00:00:00',1,1925
 


 
 
 


--审核退回 
 exec sp_executesql N'UPDATE "SJ_V20_live".."data0098" 
 SET "RMA_STATUS"=@P1,"audited_by_ptr"=@P2,"audited_date"=@P3 
 WHERE "RMA_STATUS"=@P4 AND "rkey"=@P5 AND "audited_by_ptr" IS NULL AND "audited_date" IS NULL',
 N'@P1 smallint,@P2 int,@P3 datetime,@P4 smallint,@P5 int',
 7,1,'2013-05-30 00:00:00',1,246
 
 
 
 
 

--取消评审

删除返单
select rkey,sales_order,PARTS_SHIPPED from data0060 where rma_ptr=246
delete from data0060 where rkey =6255
--修改审核记录
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0274" 
SET "auth_date"=@P1 
WHERE "auth_date"=@P2 AND "rkey"=@P3',N'@P1 datetime,@P2 datetime,@P3 int',NULL,'2013-05-30 00:00:00',14364
--修改退货单
exec sp_executesql N'UPDATE "SJ_V20_live".."data0098" 
SET "RMA_STATUS"=@P1,"audited_by_ptr"=@P2,"audited_date"=@P3 
WHERE "RMA_STATUS"=@P4 AND "rkey"=@P5 AND "audited_by_ptr"=@P6 AND "audited_date"=@P7',
N'@P1 smallint,@P2 int,@P3 datetime,@P4 smallint,@P5 int,@P6 int,@P7 datetime',
1,1,NULL,2,246,1,'2013-05-30 00:00:00'

--更改销售订单
exec sp_executesql N'UPDATE "SJ_V20_live".."data0060" 
SET "parts_returned"=@P1 
WHERE "rkey"=@P2 AND "parts_returned"=@P3',
N'@P1 float,@P2 int,@P3 float',
0,5449,30 
 
 










declare @p1 int
set @p1=0
declare @p2 varchar(100)
set @p2=NULL
declare @p5 varchar(20)
set @p5='RT130530-001'
exec ep267 @p1 output,@p2 output,246,2,@p5 output,1
select @p1, @p2, @p5
 
 create PROCEDURE EP267
@error_id 	int=0 output,			--ERROR ID
@error_msg 	varchar(100)='' output,	--ERROR Description
@d0098_rkey int,					--指针:data0098.rkey
@newsono_flg	tinyint=4,			--新销售定单号码规则：
/*
0=直接使用传入串;
1=控制码-xx，相同客户定单号和本厂型号内流水xx位置，同时更新控制码。
2=RTyyMMdd-xx,同日内流水xx位置;
3=原订单号码后加加A,B,C...Z;如果按照型号退货的，则自动转采用规则1.
4=HY规则（2种）
*/
@newsono varchar(20) output,		--传入新销售定单号，返回所使用的新销售定单号码。
@d0073_rkey	int						--系统用户指针	
WITH ENCRYPTION
AS
--定义局部变量
declare @d0005_rkey int,@cust_part_ptr int,@customer_ptr int,@cust_ship_addr_ptr int,
	@so_ptr int,@purchase_order_ptr int,@sales_order varchar(20),@nowdate_short datetime,
	@qty_ship int,@redate datetime,@redate_short datetime,@price money,@setprice money,@curr_ptr int,@exch_rate dec(18,8),
	@new_so_no varchar(20),@new_so_ptr int,@tax_in_price char(1),@p_code tinyint,
	@ttype tinyint,@aptax char(1),@artax char(1),@status tinyint,@quote_price tinyint,
    @shipping_method varchar(20), @whse_ptr int,@vunitptr int,@sets int,@Return_so_tp int,
    @Return_fob varchar(50),@Return_REFERENCE_NUMBER varchar(1000)

--开启事物处理。
begin tran

if not @newsono_flg in (0,1,2,3,4)
begin
	select @error_id=20001,@error_msg='传入新销售定单编号规则不合法！'
	goto error
end

select @d0005_rkey=employee_ptr from data0073 where rkey=@d0073_rkey
IF (@@error>0) or (@@rowcount=0)
BEGIN
	select @error_id=20002,@error_msg='搜索传入系统用户对应雇员信息出错！'
	goto error
END

if (@newsono_flg=0) and (@newsono='')
begin
	select @error_id=20001,@error_msg='直接指定的新销售定单编号不合法！'
	goto error
end
	
if (@newsono_flg=0)
begin
	select rkey from data0060 where sales_order=@newsono
	IF (@@error>0) or (@@rowcount=0)
	BEGIN
		select @error_id=20001,@error_msg='直接指定的新销售定单编号已经使用了！'
		goto error
	END
end

--搜索data0098/data0060相关信息：数量、单价等。。。
select @cust_part_ptr=IsNull(Request_D0050_Rkey,customer_part_ptr),
	@customer_ptr=data0098.customer_ptr,
	@purchase_order_ptr=data0098.Re_purchase_order_ptr,
	@so_ptr=data0098.so_ptr,
	@sales_order=data0060.sales_order,
	@cust_ship_addr_ptr=data0060.cust_ship_addr_ptr,
  @shipping_method=shipping_method,
	@qty_ship=isnull(qty_ship,0),
	@redate=isnull(redate,getdate()),
	@vunitptr=data0050.SALES_ORDER_UNIT_PTR,
	@sets=data0050.set_x_qty*data0050.set_y_qty,
	@price=isnull(part_price,co_price),
	@setprice=isnull(set_price,case when data0050.SALES_ORDER_UNIT_PTR=0 then co_price else co_price*data0050.set_x_qty*data0050.set_y_qty end),
	@curr_ptr=curr_ptr,
	@exch_rate=IsNull(data0098.exch_rate,1),
	@tax_in_price=case data0010.EDI_FLAG_FOR_INVOICE when 1 then 'Y' else 'N' end,
	@ttype=data0050.ttype,
	@p_code=case data0050.ttype when 0 then data0010.p_code_def_prod else data0010.p_code_def_samp end,
	@whse_ptr=data0060.whse_ptr,@Return_so_tp =isnull(data0098.Return_so_tp,0),@Return_fob = data0098.Return_fob, 
    @Return_REFERENCE_NUMBER = data0098.Return_REFERENCE_NUMBER
from data0098 left join 
     data0060 on data0098.so_ptr=data0060.rkey inner join 
     data0010 on data0098.customer_ptr=data0010.rkey inner join 
     data0050 on data0098.customer_part_ptr=data0050.rkey
where data0098.rkey=@d0098_rkey


IF (@@error>0) or (@@rowcount=0)
BEGIN
	select @error_id=20003,@error_msg='搜索本退货单的data0098表数据出错！'
	goto error
END

if @exch_rate=0 set @exch_rate=1

select @redate_short=convert(datetime,
	right(datepart(yy,@redate)+10000,4)+'-'+
	right(datepart(mm,@redate)+100,2)+'-'+
	right(datepart(dd,@redate)+100,2)),
	@nowdate_short=convert(datetime,
	right(datepart(yy,getdate())+10000,4)+'-'+
	right(datepart(mm,getdate())+100,2)+'-'+
	right(datepart(dd,getdate())+100,2))

if @qty_ship<=0 
begin
	select @error_id=20004,@error_msg='退货单的需补交数量不正确，无法建立新销售定单！'
	goto error
end

if exists(select rkey from data0060 where data0060.rma_ptr=@d0098_rkey)
begin
	select @error_id=20005,@error_msg='本退货单已经建立了销售定单，不能再次建立销售定单！'
	goto error
end

--搜索客户装运地点
if isnull(@cust_ship_addr_ptr,0)=0
begin
	select @cust_ship_addr_ptr=data0012.rkey,@shipping_method=ship_shipping_method
	from data0012 where customer_ptr=@customer_ptr
	order by data0012.rkey
	IF (@@error>0) or (@@rowcount=0)
	BEGIN
		select @error_id=20006,@error_msg='搜索本客户首个装运地点出错！'
		goto error
	END
end

--如果98.so_ptr is null插入data0097记录。
IF (isnull(@purchase_order_ptr,0)=0) 
begin
	if NOT EXISTS(select rkey from data0097
		where po_number='/' and customer_ptr=@customer_ptr)
	begin
		insert data0097(po_number,customer_ptr,po_date,open_sos)
		select '/',@customer_ptr,@nowdate_short,1
		IF (@@error>0) or (@@rowcount=0)
		BEGIN
			select @error_id=20007,@error_msg='插入新采购定单到data0097表发生错误！'
			goto error
		END
	end
	else
	begin
		update data0097 set open_sos=open_sos+1
		where po_number='/' and customer_ptr=@customer_ptr
	end
	select @purchase_order_ptr=data0097.rkey 
	from data0097 where po_number='/' and customer_ptr=@customer_ptr
	order by rkey desc
	IF (@@error>0) or (@@rowcount=0)
	BEGIN
		select @error_id=20008,@error_msg='搜索采购定单data0097指针发生错误！'
		goto error
	END
end

declare @tempstr varchar(20),@seedcode varchar(20)
/*	0=直接使用传入串;
	1=控制码-xx，相同客户定单号和本厂型号内流水xx位置，同时更新控制码。
	2=RTyyMMdd-xx,同日内流水xx位置;
	3=原订单号码后加A,B,C...Z;如果是按照本厂型号退货的，则自动采用规则1.
	4=HY规则（2种）
*/
--以下代码，根据传入的规则来建立新单号码。
--0:直接使用传入的字符串做为新单号码
if @newsono_flg=0 set @new_so_no=@newsono

--1:控制码-xx，相同客户定单号和本厂型号内流水xx位置，同时更新控制码。
select @tempstr='',@seedcode=''
if (@newsono_flg=1) or ((@newsono_flg=3) and (@so_ptr is null)) 
begin
	select @seedcode=rtrim(seed_value) from data0004 where rkey=17 and table_name='data0060'
	select @new_so_no=isnull(max(sales_order),@seedcode+'-00')
	from data0060 where sales_order like '%' and 
		purchase_order_ptr=@purchase_order_ptr and cust_part_ptr=@cust_part_ptr

	select @new_so_no=left(@new_so_no,charindex('-',@new_so_no))+
		right(convert(varchar(4),right(@new_so_no,len(@new_so_no)-charindex('-',@new_so_no))+1001),len(@new_so_no)-charindex('-',@new_so_no))
	--更新控制码
	IF (@@error>0) or (@@rowcount=0)
	BEGIN
		select @error_id=20009,@error_msg='搜索新销售定单号码出错！'
		goto error
	END
	if left(@new_so_no,charindex('-',@new_so_no)-1)=@seedcode
	begin
		update data0004 set seed_value=left(@seedcode,len(@seedcode)-4)+
			right(convert(varchar(5),right(@seedcode,4)+10001),4)
		where rkey=17 and table_name='data0060'
		IF (@@error>0) or (@@rowcount=0)
		BEGIN
			select @error_id=20010,@error_msg='更新销售定单号码控制码出错！'
			goto error
		END
	end
end

--2:建立新退货类定单号码sales_order(RTyyMMdd-xxx,同日内流水xxx位置);
select @tempstr='',@seedcode=''
if @newsono_flg=2 
begin
	select @new_so_no='RT'+right(convert(varchar(4),datepart(yy,getdate())),2)+
	right(convert(varchar(3),100+datepart(mm,getdate())),2)+
	right(convert(varchar(3),100+datepart(dd,getdate())),2)+'-'
    select @new_so_no=MAX(sales_order) from Data0060 where SALES_ORDER like ''+@new_so_no+'___'

   if @new_so_no<>null or @new_so_no<>''
   begin
			declare @rightno varchar(5)
			select @rightno=right(@new_so_no,3)+1
			if LEN(@rightno)=1
			begin
			   select @new_so_no=left(@new_so_no,9)+'00'+@rightno
			end
			if LEN(@rightno)=2
			begin
			   select @new_so_no=left(@new_so_no,9)+'0'+@rightno
			end
			if LEN(@rightno)=3
			begin
			   select @new_so_no=left(@new_so_no,9)+@rightno
			end
	end 
	else
	begin
			select @new_so_no='RT'+right(convert(varchar(4),datepart(yy,getdate())),2)+
			right(convert(varchar(3),100+datepart(mm,getdate())),2)+
			right(convert(varchar(3),100+datepart(dd,getdate())),2)+'-001'
	end
	    
	IF (@@error>0) or (@new_so_no='')
	BEGIN
	   select @error_id=20011,@error_msg='搜索新销售定单号码出错！'
	   goto error
	END
end

--3:建立新定单号码sales_order(Format:原来单号后A.B.C...Z流水，如果按照型号退，自动采用规则1)
select @tempstr='',@seedcode=''
if (@newsono_flg=3) and (@so_ptr is not null)
begin
	declare @fixstr varchar(1)
	--取得当前退货所对应旧销售订单的号码
	set @newsono=@sales_order	
	set @seedcode=upper(right(@newsono,1))
	if @seedcode in ('0','1','2','3','4','5','6','7','8','9') set @seedcode=''
	select @new_so_no=isnull(max(sales_order),left(@newsono,len(@newsono)-len(@seedcode))+'@')
	from data0060 where sales_order like left(@newsono,len(@newsono)-len(@seedcode))+'%'
	set @tempstr=upper(right(@new_so_no,1))
	if @tempstr in ('0','1','2','3','4','5','6','7','8','9') set @tempstr=''
	--取得@new_so_no最后一位字符,进行递加
	if @tempstr='' set @tempstr='@'
	if @tempstr='Z'
	begin
		select @error_id=20012,@error_msg='原销售定单尾号已经用到Z,无法继续使用本前缀！'
		goto error
	end
	set @tempstr=char(ascii(@tempstr)+1)
	select @new_so_no=left(@newsono,len(@newsono)-len(@seedcode))+@tempstr
	IF (@@error>0) or (@@rowcount=0)
	BEGIN
		select @error_id=20013,@error_msg='搜索新销售定单号码出错！'
		goto error
	END
end
--4=HY规则（2种）
--4.1
select @tempstr='',@seedcode=''
if @newsono_flg=4
begin
	if @so_ptr is null
	begin
		select @seedcode=rtrim(seed_value)+'-8' from data0004 where rkey=17 and table_name='data0060'
		select @new_so_no=rtrim(isnull(max(sales_order),@seedcode+'0'))
		from data0060 where sales_order like '%' and 
			purchase_order_ptr=@purchase_order_ptr and cust_part_ptr=@cust_part_ptr
	end
	else
	begin
		select @tempstr=left(@sales_order,charindex('-',@sales_order))+'8'
		select @new_so_no=rtrim(isnull(max(sales_order),@tempstr+'0'))
		from data0060 where sales_order like @tempstr+'%' 
	end
	select @new_so_no=left(@new_so_no,charindex('-',@new_so_no)+1)+
	 cast(substring(right(@new_so_no,len(@new_so_no)-charindex('-',@new_so_no)),2,1)+1 as varchar(5))
	--select @new_so_no
	--更新控制码
	if left(@new_so_no,charindex('-',@new_so_no)+1)=@seedcode
	begin
		update data0004 set seed_value=left(@seedcode,charindex('-',@seedcode)-5)+
			right(convert(varchar(5),
			substring(@seedcode,charindex('-',@seedcode)-4,4)+10001),4)
		where rkey=17 and table_name='data0060'
		IF (@@error>0) or (@@rowcount=0)
		BEGIN
			select @error_id=20014,@error_msg='建立新销售定单号码出错！'
			goto error
		END
	end
end

IF isnull(@new_so_no,'')=''
BEGIN
	select @error_id=20015,@error_msg='未能成功搜索新销售定单号码，操作无法继续！'
	goto error
END

IF EXISTS(select rkey from data0060 where sales_order=@new_so_no)
BEGIN
	select @error_id=20016,@error_msg='新销售定单号码 '+@new_so_no+' 已经被使用！'
	goto error
END

--查询总控制开关的状态，设置是否需要评审以及定单状态
select @aptax=isnull(aptaxontax,'Y'),@artax=isnull(artaxontax,'Y') from data0192(nolock)
/*
if @ttype=0			--量产
begin
	if @aptax='Y'	--需要评审
		select @status=6,@quote_price=0
	else			--不需要评审
		select @status=1,@quote_price=3
end
else				--样品
begin
	if @artax='Y'	--需要评审
		select @status=6,@quote_price=0
	else			--不需要评审
		select @status=1,@quote_price=3
end
*/
select @status=1,@quote_price=3 --设置不需要评审
if exists(Select 1 From Data0098 Where Rkey=@d0098_rkey and NOTE_PAD_PTR=1)
begin
  Select @price=0
end
--插入data0060记录。
insert data0060(sales_order,customer_ptr,cust_part_ptr,cust_ship_addr_ptr,shipping_method,
	comm_assigned_by_e_p,conf_by_empl_ptr,csi_user_ptr,entered_by_empl_ptr,
	modified_by_empl_ptr,purchase_order_ptr,p_code,status,prod_rel,
	part_price,set_price,parts_ordered,set_ordered,parts_shipped,parts_returned,
	exch_rate,ent_date,sch_date,orig_request_date,orig_sched_ship_date,
	state_prod_tax_flag,state_tool_tax_flag,reg_tax_fixed_unused,
	currency_ptr,CONSUME_FORECASTS,TO_BE_CONFIRMED,TO_BE_PLANNED,DISCOUNT,RUSH_CHARGE,
	qty_plannned,quote_price,so_tp,so_style,so_oldnew,tax_in_price,ttype,rma_ptr,
	TOTAL_ADD_L_PRICE,conf_date,whse_ptr,qty_sure,fob,REFERENCE_NUMBER)
select @new_so_no,@customer_ptr,@cust_part_ptr,@cust_ship_addr_ptr,@shipping_method,
	@d0005_rkey,null,@d0073_rkey,@d0005_rkey,
	null,@purchase_order_ptr,@p_code,@status,2,
	@price,@setprice,@qty_ship,
	case when @vunitptr=0 then @qty_ship else @qty_ship/(case when @setprice>0 then round(@setprice/@price,0) else @sets end) end,0,0,
	@exch_rate,getdate(),@redate_short,@redate_short,@redate_short,
	(select top 1 state_prod_tax_flag from data0012 where rkey=@cust_ship_addr_ptr),
	(select top 1 state_tool_tax_flag from data0012 where rkey=@cust_ship_addr_ptr),
	(select top 1 reg_tax_fixed_unused from data0010 where rkey=@customer_ptr),
	@curr_ptr,0,@qty_ship,0,0,0,0,@quote_price,@Return_so_tp,2,'返单',@tax_in_price,@ttype,@d0098_rkey,
	0,getdate(),@whse_ptr,@qty_ship,@Return_fob,@Return_REFERENCE_NUMBER

IF (@@error>0) or (@@rowcount=0)
BEGIN
	select @error_id=20017,@error_msg='插入新销售定单到data0060表发生错误！'
	goto error
END

select @new_so_ptr=data0060.rkey from data0060 where sales_order=@new_so_no
IF (@@error>0) or (@@rowcount=0)
BEGIN
	select @error_id=20018,@error_msg='查询新建立的销售定单发生错误！'
	goto error
END

--建立data0360评审交期子表
insert data0360(so_ptr,quantity,sch_date,planned_qty)
select @new_so_ptr,@qty_ship,@redate_short,0
IF (@@error>0) or (@@rowcount=0)
BEGIN
	select @error_id=20019,@error_msg='建立新销售定单的data0360子表记录发生错误！'
	goto error
END

--根据装运地址表data0012定义的销售代表，建立本定单的销售代表data0102记录。
insert data0102(sales_order_ptr,sales_rep_ptr,commission,credit)
select @new_so_ptr,sales_rep_ptr,commission,credit 
from
(select top 1 rkey,seq_no=convert(int,1),sales_rep_ptr=srep_ptr_1,commission=srep_1_comm,credit=srep_1_alloc 
from data0012(nolock) where rkey=@cust_ship_addr_ptr
union 
select top 1 rkey,seq_no=convert(int,2),sales_rep_ptr=srep_ptr_2,commission=srep_2_comm,credit=srep_1_alloc 
from data0012(nolock) where rkey=@cust_ship_addr_ptr
union 
select top 1 rkey,seq_no=convert(int,3),sales_rep_ptr=srep_ptr_3,commission=srep_3_comm,credit=srep_1_alloc 
from data0012(nolock) where rkey=@cust_ship_addr_ptr
union 
select top 1 rkey,seq_no=convert(int,4),sales_rep_ptr=srep_ptr_4,commission=srep_4_comm,credit=srep_1_alloc 
from data0012(nolock) where rkey=@cust_ship_addr_ptr
union 
select top 1 rkey,seq_no=convert(int,5),sales_rep_ptr=srep_ptr_5,commission=srep_5_comm,credit=srep_1_alloc 
from data0012(nolock) where rkey=@cust_ship_addr_ptr) as t1
where t1.sales_rep_ptr is not null
order by t1.seq_no
IF (@@error>0) or (@@rowcount=0)
BEGIN
	select @error_id=20020,@error_msg='建立新销售定单的data0102销售代表子表记录发生错误！'
	goto error
END

--工具费用清单。。。（待处理）
--合同评审参数清单。。。（待处理）

--更新data0050:活动定单数、未计划定单数的更新。
update data0050 set active_s_orders=active_s_orders+1,
	unplanned_rel_s=unplanned_rel_s+1
where data0050.rkey=@cust_part_ptr
IF (@@error>0) or (@@rowcount=0)
BEGIN
	select @error_id=20021,@error_msg='更新data0050相关字段出错！'
	goto error
END

--传回新的销售定单号码
set @newsono=@new_so_no

--提交所有操作。
commit tran
IF @@error>0
BEGIN
	select @error_id=20099,@error_msg='建立销售定单保存提交发生错误！'
	goto error
END
return

--产生错误后，回滚所有操作。
Error:
BEGIN
    Rollback tran
    Raiserror @error_id @error_msg
	return
END

GO
