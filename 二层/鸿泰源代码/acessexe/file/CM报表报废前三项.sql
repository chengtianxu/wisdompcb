USE [sj_v20_live]
GO
/****** 对象:  StoredProcedure [dbo].[zxtc_gx_002]    脚本日期: 08/24/2013 17:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[zxtc_gx_002]
  @VWhere1 int=1,
  @vdate1 datetime,
  @vdate2 datetime
as 

if object_id('zxtc_002','U') is not null
 begin
    drop table zxtc_002
 end

create table zxtc_002
(cust_code varchar(20),
 customer_part_number nvarchar(30),
 cp_rev varchar(4),
 layers int,
 qty_reject float,
 mj float
 )

--单面板报废面积前三项目
insert into zxtc_002
select top 3 data0010.cust_code,data0050.customer_part_number,data0050.cp_rev,data0050.layers,
  sum(data0058.qty_reject) as qty_reject,round(sum(data0047.parameter_value * data0058.qty_reject),4)as mj  
  from data0058
  inner join data0006 on data0058.wo_ptr=data0006.rkey
  inner join data0039 on data0058.reject_ptr=data0039.rkey
         and Data0039.spec_type=0 and (data0039.REJECT_DESCRIPTION<>'%盘点调数据%')
  inner join data0492 on data0006.cut_no=data0492.cut_no
  inner join data0060 on data0492.so_no=data0060.sales_order
  inner join data0050 on data0060.cust_part_ptr=data0050.rkey
    and data0050.layers=1
  inner join data0025 on data0050.rkey=data0025.ancestor_ptr
  inner join data0010 on data0060.customer_ptr=data0010.rkey
  inner join data0047 on data0025.rkey=data0047.source_pointer
         and data0047.parameter_ptr=7
  where data0058.tdatetime>=@vdate1 
      and data0058.tdatetime<=@vdate2
  group by data0010.cust_code,data0050.customer_part_number,data0050.cp_rev,data0050.layers 
order by mj desc

--双面板报废面积前三项目
insert into zxtc_002
select top 3 data0010.cust_code,data0050.customer_part_number,data0050.cp_rev,data0050.layers,
  sum(data0058.qty_reject) as qty_reject,round(sum(data0047.parameter_value * data0058.qty_reject),4)as mj  
  from data0058
  inner join data0006 on data0058.wo_ptr=data0006.rkey
  inner join data0039 on data0058.reject_ptr=data0039.rkey
         and Data0039.spec_type=0 and (data0039.REJECT_DESCRIPTION<>'%盘点调数据%')
  inner join data0492 on data0006.cut_no=data0492.cut_no
  inner join data0060 on data0492.so_no=data0060.sales_order
  inner join data0050 on data0060.cust_part_ptr=data0050.rkey
    and data0050.layers=2
  inner join data0025 on data0050.rkey=data0025.ancestor_ptr
  inner join data0010 on data0060.customer_ptr=data0010.rkey
  inner join data0047 on data0025.rkey=data0047.source_pointer
         and data0047.parameter_ptr=7
  where data0058.tdatetime>=@vdate1 
      and data0058.tdatetime<=@vdate2
  group by data0010.cust_code,data0050.customer_part_number,data0050.cp_rev,data0050.layers 
order by mj desc

--4层以上板报废面积前三项目
insert into zxtc_002
select top 3 data0010.cust_code,data0050.customer_part_number,data0050.cp_rev,4 as layers,
  sum(data0058.qty_reject) as qty_reject,round(sum(data0047.parameter_value * data0058.qty_reject),4)as mj  
  from data0058
  inner join data0006 on data0058.wo_ptr=data0006.rkey
  inner join data0039 on data0058.reject_ptr=data0039.rkey
         and Data0039.spec_type=0 and (data0039.REJECT_DESCRIPTION<>'%盘点调数据%')
  inner join data0492 on data0006.cut_no=data0492.cut_no
  inner join data0060 on data0492.so_no=data0060.sales_order
  inner join data0050 on data0060.cust_part_ptr=data0050.rkey
    and data0050.layers>2
  inner join data0025 on data0050.rkey=data0025.ancestor_ptr
  inner join data0010 on data0060.customer_ptr=data0010.rkey
  inner join data0047 on data0025.rkey=data0047.source_pointer
         and data0047.parameter_ptr=7
  where data0058.tdatetime>=@vdate1 
      and data0058.tdatetime<=@vdate2
  group by data0010.cust_code,data0050.customer_part_number,data0050.cp_rev
order by mj desc

select * from zxtc_002 order by layers

