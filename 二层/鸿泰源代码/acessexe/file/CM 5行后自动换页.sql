CM 5行后自动换页
ALTER PROCEDURE [dbo].[user_defined_sp_ep031]
@rkey439 int
AS
--需提供64的so_ptr

if object_id('TmpJH01','U') is not null
 begin
    drop table TmpJH01
 end

  create table TmpJH01(id int identity(1,1) not null, 
     SALES_ORDER varchar(16),
     customer_part_number nvarchar(20),
     cp_rev nvarchar(6),
     customer_part_desc nvarchar(200),
     po_number nvarchar(50),
     quan_shipped int,
     tax_price float,
     amount float,
     so_ptr int)

declare @count smallint
     declare @i smallint,
     @row int
     set @count= 0
     set @i= 0
     set @row=5
  insert into TmpJH01(SALES_ORDER,customer_part_number,cp_rev,customer_part_desc,
          po_number,quan_shipped,tax_price,amount,so_ptr) 
  select data0060.SALES_ORDER,data0050.customer_part_number,data0050.cp_rev,data0059.customer_part_desc,
  data0097.po_number,data0064.quan_shipped,round(case data0060.tax_in_price when 'Y' then data0060.part_price else data0060.part_price*(1+tax_2/100) end,4) as tax_price,
  round(data0064.QUAN_SHIPPED*(round(case data0060.tax_in_price when 'Y' then convert(dec(18,4),data0060.part_price) else convert(dec(18,4),data0060.part_price)*(1+tax_2/100) end,4))
+(100.0-ovsh_discount)*data0064.ovsh_qty*(round(case data0060.tax_in_price when 'Y' then convert(dec(18,4),data0060.part_price) else convert(dec(18,4),data0060.part_price)*(1+tax_2/100) end,4))*0.01,2) as amount,
  data0064.so_ptr 
  from data0439
  inner join data0064 on data0439.rkey=data0064.packing_list_ptr
  inner join Data0060 on Data0064.SO_PTR = Data0060.RKEY
  inner join Data0050 on Data0060.CUST_PART_PTR = Data0050.RKEY
  inner join Data0097 ON Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY
  inner join data0059 ON Data0060.CUSTOMER_PTR = data0059.customer_ptr AND Data0060.CUST_PART_PTR = data0059.cust_part_ptr 
  where data0439.rkey=@rkey439
  order by data0060.ent_date
 
  select @count = count(*) from TmpJH01

  if (@count % @row) >= 1
   begin
      while @i < @row - (@count % @row)
      begin        
        insert into TmpJH01(SALES_ORDER,customer_part_number,cp_rev,customer_part_desc,
          po_number,quan_shipped,tax_price,amount,so_ptr)
        values ('','','','','',null ,null ,null,null)      
          set @i = @i + 1
       end
   end

 select id,SALES_ORDER,customer_part_number,cp_rev,customer_part_desc,
          po_number,quan_shipped,tax_price,amount,so_ptr from TmpJH01
       order by id 
 drop table TmpJH01

/*
exec user_defined_sp_ep031 2913
select * from data0439
select * from data0064


*/