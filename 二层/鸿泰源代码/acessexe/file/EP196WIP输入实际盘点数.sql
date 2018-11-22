--WIP输入实际盘点数

--查询

--create  PROCEDURE ep196;2
declare 
 @rkey400 int=145 --DATA0400.RKEY盘点代码指针
--with encryption
--AS
SELECT Data0006.WORK_ORDER_NUMBER, DATA0401.wip_system_qty, 
      Data0039.REJECT_DESCRIPTION, DATA0401.wip_ptr,Data0010.rkey as rkey10, 
      Data0025.MANU_PART_NUMBER, Data0050.CP_REV,data0047.parameter_value, 
      Data0010.ABBR_NAME AS cust_code, EMPLOYEE_NAME=Data0073.User_Full_Name, 
      DATA0401.physical_count_qty, DATA0401.rkey, DATA0401.reject_ptr, 
      DATA0401.count_ptr, dept34.DEPT_CODE AS DEPT_CODE_1,Data0006.PANEL_A_B, 
      group34.DEPT_CODE AS DEPT_CODE_2, Data0034.DEPT_CODE, 
      data0059.customer_part_desc, Data0006.PARTS_PER_PANEL, 
      DATA0401.panels AS pnls, DATA0401.physical_panels, 
      Data0050.CUSTOMER_PART_NUMBER, DATA0401.check_no,Data0025.RKEY as rkey25, 
      DATA0401.dept_ptr,data0034.dept_name,Data0050.RKEY as rkey50,
      (case data0006.prod_status when 1 then '等待审核' 
      when 2 then '等待生产'  when 3 then '生产中'
      when 9 then '生产结束'  when 101 then '审核暂缓'
      when 102 then '生产前暂缓' when 103 then '生产中暂缓'
      else '取消' end) as prod_status
FROM Data0401 left join
     Data0006 on Data0401.wo_ptr=Data0006.Rkey left join
     Data0034 on Data0401.dept_ptr=Data0034.Rkey left join
     Data0492 on Data0006.cut_no=Data0492.cut_no left join
     Data0025 on Data0006.bom_ptr=Data0025.Rkey left join
     Data0050 on Data0025.ancestor_ptr=Data0050.Rkey left join
     Data0010 on Data0492.customer_ptr=Data0010.Rkey left join
     Data0059 on Data0050.rkey=Data0059.cust_part_ptr
             and Data0010.Rkey=Data0059.customer_ptr left join
     Data0039 on Data0401.reject_ptr=Data0039.Rkey left join
     Data0073 on Data0401.count_ptr=Data0073.Rkey left join
     Data0034 group34 on Data0034.group_ptr=group34.Rkey left join
     Data0034 dept34 on Data0034.dept_ptr=dept34.Rkey left join
      (Select source_pointer,parameter_value 
       from data0047 inner join
            data0278 on data0047.parameter_ptr=data0278.rkey
                    and Data0278.spec_rkey='L')as Data0047 on Data0025.Rkey=Data0047.source_pointer
WHERE (DATA0401.status <> 2) AND (data0401.header_ptr=@rkey400)
ORDER BY dept34.DEPT_CODE, Data0034.DEPT_CODE, 
      Data0025.MANU_PART_NUMBER, Data0006.WORK_ORDER_NUMBER
go

--保存

--status= 0创建时,1 录入保存
exec sp_executesql N'select * from data0401
where status<>2 and 
   rkey=@P1
',N'@P1 int',9206
exec sp_executesql N'UPDATE "SJ_V20_live".."data0401" 
SET "physical_count_qty"=@P1,"enterted_ptr"=@P2,"count_ptr"=@P3,"ent_date"=@P4,"user_ptr"=@P5,"status"=@P6,"panels"=@P7,"physical_panels"=@P8,"check_no"=@P9 
WHERE "rkey"=@P10 AND "physical_count_qty"=@P11 AND "enterted_ptr" IS NULL AND "count_ptr" IS NULL AND "ent_date" IS NULL AND "user_ptr" IS NULL AND "status"=@P12 AND "panels"=@P13 AND "physical_panels"=@P14 AND "check_no" IS NULL',
N'@P1 float,@P2 int,@P3 int,@P4 datetime,@P5 int,@P6 tinyint,@P7 int,@P8 int,@P9 varchar(1),@P10 int,@P11 float,@P12 tinyint,@P13 int,@P14 int',
285,1,1,'2013-06-01 21:07:47',1,1,10,16,'',9206,-2,0,16,1--PNL数量从16变成10

update data0400 set flag=0 where rkey=145 --0:成功，1：失败