
--报废主表DATA0158
--报废明细DATA0058
SELECT rkey,v_STATUS,mrb_no,TDATETIME,EMPL_PTR,employee_name,dept_name,V_mrb_flag,panels58,STATUS,mrb_flag,d264_ptr,sys_id,sys_rq,mod_rq,dept_ptr,rkey058,WO_PTR,flow_no,step,reject_ptr,resp_dept_ptr,cust_code,customer_part_number,cp_rev,work_order_number,rej_code,reject_description,QTY_ORG_REJ,QTY_REJECT,SETS_QTY,PANELS,dept_code_1,dept_name_1,warehouse_name,issued_qty,dept_codeGx,dept_nameGxMc,customer_part_desc,customer_matl_desc,remark 
FROM vData0158_1 
WHERE step>0 and TDATETIME>='2013-05-09 00:00:00' and TDATETIME<='2013-05-12 00:00:00'  
--全选
Order by mrb_no,work_order_number Desc


SELECT rkey,v_STATUS,mrb_no,TDATETIME,EMPL_PTR,employee_name,dept_name,V_mrb_flag,panels58,STATUS,mrb_flag,d264_ptr,sys_id,sys_rq,mod_rq,dept_ptr,rkey058,WO_PTR,flow_no,step,reject_ptr,resp_dept_ptr,cust_code,customer_part_number,cp_rev,work_order_number,rej_code,reject_description,QTY_ORG_REJ,QTY_REJECT,SETS_QTY,PANELS,dept_code_1,dept_name_1,warehouse_name,issued_qty,dept_codeGx,dept_nameGxMc,customer_part_desc,customer_matl_desc,remark 
FROM vData0158_1 WHERE step>0 and TDATETIME>='2013-05-09 00:00:00' and TDATETIME<='2013-05-12 00:00:00' 
and status<>0  --未提交
and status<>1  --待审批
and status<>2  -- 已审核
and status<>3  -- 被退回
Order by mrb_no,work_order_number Desc



if exists(SELECT * FROM DBO.SYSOBJECTS B WHERE B.XTYPE = 'V' AND B.NAME = 'vData0158_1' ) 
	DROP VIEW [dbo].[vData0158_1]  
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  VIEW  [dbo].[vData0158_1]
AS
select Data0158.rkey,Data0158.mrb_no,Data0158.TDATETIME,Data0158.EMPL_PTR,data0005.employee_name,cast(Data0158.panels as decimal(16,6)) as panels58
   ,case when data0034b.ttype<4 then data0034a.dept_name else data0034b.dept_name end as dept_name
   ,case when data0034b.ttype<4 then data0034a.d264_ptr else data0034b.d264_ptr end as d264_ptr
   ,data0158.status,Data0158.mrb_flag,Data0158.ttype,Data0158.sys_id,Data0158.sys_rq,Data0158.mod_rq
   ,Data0158.AUDIT_EMPL_PTR,Data0158.AUDIT_DATETIME,data0005a.employee_name as AUDIT_NAME    
   ,case 
      WHEN Data0158.STATUS=0 THEN '未提交'
      WHEN Data0158.STATUS=1 THEN '待审核'
      WHEN Data0158.STATUS=2 THEN '已审核'
      WHEN Data0158.STATUS=3 THEN '被退回'
    end as v_STATUS
   ,case 
      WHEN Data0158.mrb_flag=0 THEN '单只交货'
      WHEN Data0158.mrb_flag=1 THEN 'SET交货'
    END AS V_mrb_flag
   ,Data0058.panels,Data0058.SETS_QTY,Data0058.remark,Data0058.QTY_ORG_REJ,Data0058.QTY_REJECT,Data0058.step,data0058.wo_ptr
   ,Data0058.flow_no,Data0058.rkey as rkey058,data0058.dept_ptr,data0058.reject_ptr,data0058.resp_dept_ptr
   ,Data0058.remark_matl,Data0058.remark_matl_desc,Data0058.remark_resp_people  
   ,data0006.work_order_number,data0034.dept_code as dept_codeGx,data0034.dept_name as dept_nameGxMc
   ,b.dept_code as dept_code_1,b.dept_name as dept_name_1,data0006.parts_per_panel
   ,data0006.prod_status,data0039.rej_code,data0039.reject_description
   ,data0050.customer_part_number,data0050.cp_rev,data0025.manu_part_number
   ,data0059.customer_part_desc,data0059.customer_matl_desc
   ,data0015.ABBR_NAME AS warehouse_name,data0492.issued_qty,data0010.cust_code,data0010.abbr_name
   ,data0050.LAYERS,data0047.PARAMETER_VALUE*data0058.QTY_REJECT  as SQMT2
   ,cast(Data0058.QTY_REJECT*data0060.part_price/data0060.exch_rate as decimal(16,3)) as QTY_REJECTJE
  from Data0158 
  inner join Data0058 on data0058.mrb_no=data0158.mrb_no
  left join data0005 on Data0158.EMPL_PTR=data0005.rkey
  left join data0034 data0034b on data0005.employee_id=data0034b.rkey
  left join data0034 data0034a on data0034b.dept_ptr=data0034a.rkey
  left join data0005 data0005a on Data0158.AUDIT_EMPL_PTR=data0005a.rkey
  inner join data0006 on data0058.wo_ptr=data0006.rkey 
  left join data0039 on data0058.reject_ptr=data0039.rkey 
  left join data0025 on data0006.bom_ptr=data0025.rkey 
  left join data0050 on data0025.ancestor_ptr=data0050.rkey 
  left join data0034 on data0058.dept_ptr=data0034.rkey 
  left join data0034 b on data0058.resp_dept_ptr=b.rkey 
  left join data0015 on data0006.whouse_ptr=data0015.rkey 
  left join data0492 on data0006.cut_no=data0492.cut_no 
  left join data0060 on data0492.so_no=data0060.sales_order 
  left join data0010 on data0492.customer_ptr=data0010.rkey
  left join Data0059 on Data0059.customer_ptr=data0492.CUSTOMER_PTR and Data0059.cust_part_ptr=Data0050.rkey
  inner join  data0047  on data0047.SOURCE_POINTER=data0025.rkey  
  inner join  data0278 on data0047.PARAMETER_PTR=data0278.rkey 
    and data0278.SPEC_RKEY =(Select  case when Search_Unit_flag=0 then 'L' else 'K' end as Search_Unit_flag From Data0195)
  where Data0058.step>0
