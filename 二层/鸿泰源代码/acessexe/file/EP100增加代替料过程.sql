--EP100增加代替料过程
--
MI里的是EP100;4查BOM材料
-------------------------单独修改BOM材料需求
exec sp_executesql N'UPDATE "SJ_V20_live".."data0026" 
SET "INVENTORY_PTR"=@P1,"QTY_BOM"=@P2,"DOC_FLAG"=@P3,"pcbcut_ptr"=@P4,"alt_flag"=@P5,"remark"=@P6,"CUST_PART_PTR"=@P7,"length"=@P8,"width"=@P9,"thickness"=@P10,"uset"=@P11,"sys"=@P12,"supp_ptr"=@P13,"key_flag"=@P14 
                     WHERE "RKEY"=@P15 AND "INVENTORY_PTR"=@P16 AND "QTY_BOM"=@P17 AND "DOC_FLAG"=@P18 AND "pcbcut_ptr" IS NULL AND "alt_flag"=@P19 AND "remark"=@P20 AND "CUST_PART_PTR" IS NULL AND "length"=@P21 AND "width"=@P22 AND "thickness" IS NULL AND "uset"=@P23 AND "sys"=@P24 AND "supp_ptr" IS NULL AND "key_flag" IS NULL',N'@P1 int,@P2 float,@P3 varchar(1),@P4 int,@P5 bit,@P6 varchar(1),@P7 int,@P8 float,@P9 float,@P10 float,@P11 float,@P12 float,@P13 int,@P14 varchar(1),@P15 int,@P16 int,@P17 float,@P18 varchar(1),@P19 bit,@P20 varchar(1),@P21 float,@P22 float,@P23 float,@P24 float',
2833,9.6296296296296296e-005,'Y',NULL,0,'b',NULL,5,8,3,8,1,23,'Y',
42935,2833,9.629629629629631e-005,' ',0,'b',5,8,8,1
--------------下面是增加替代料过程
exec sp_executesql N'UPDATE "SJ_V20_live".."data0026" 
SET "INVENTORY_PTR"=@P1,"QTY_BOM"=@P2,"DOC_FLAG"=@P3,"pcbcut_ptr"=@P4,"alt_flag"=@P5,"remark"=@P6,"CUST_PART_PTR"=@P7,"length"=@P8,"width"=@P9,"thickness"=@P10,"uset"=@P11,"sys"=@P12,"supp_ptr"=@P13,"key_flag"=@P14 
WHERE "RKEY"=@P15 AND "INVENTORY_PTR"=@P16 AND "QTY_BOM"=@P17 AND "DOC_FLAG"=@P18 AND "pcbcut_ptr" IS NULL AND "alt_flag"=@P19 AND "remark"=@P20 AND "CUST_PART_PTR" IS NULL AND "length"=@P21 AND "width"=@P22 AND "thickness"=@P23 AND "uset"=@P24 AND "sys"=@P25 AND "supp_ptr"=@P26 AND "key_flag"=@P27',N'@P1 int,@P2 float,@P3 varchar(1),
@P4 int,@P5 bit,@P6 varchar(1),@P7 int,@P8 float,@P9 float,@P10 float,@P11 float,@P12 float,@P13 int,@P14 varchar(1),@P15 int,@P16 int,@P17 float,@P18 varchar(1),@P19 bit,@P20 varchar(1),@P21 float,@P22 float,@P23 float,@P24 float,@P25 float,@P26 int,@P27 varchar(1)',
      2833,9.6296296296296296e-005,'Y',NULL,0,'b',NULL,5,8,3,8,1,23,'',
42935,2833,9.6296296296296296e-005,'Y',     0,'b',     5,8,3,8,1,23,''



exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0226" 
("SOURCE_PTR","d26_PTR","DEPT_PTR","alt_invent_ptr","INVENTORY_PTR") 
VALUES (@P1,@P2,@P3,@P4,@P5); 
SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 int',
11157,42935,364,2833,1161
go
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0226"
 ("SOURCE_PTR","d26_PTR","DEPT_PTR","alt_invent_ptr","INVENTORY_PTR") 
 VALUES (@P1,@P2,@P3,@P4,@P5);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 int,@P5 int',
 11157,42935,364,2833,1163
go
exec sp_executesql N'UPDATE "SJ_V20_live".."Data0050" 
SET "bom_appr_by"=@P1,"bom_appr_date"=@P2,"BOM_STATUS"=@P3,"COST_APPR_BY"=@P4 
WHERE "RKEY"=@P5 AND "bom_appr_by"=@P6 AND "bom_appr_date"=@P7 AND "BOM_STATUS"=@P8 AND "COST_APPR_BY"=@P9',
N'@P1 int,@P2 datetime,@P3 tinyint,@P4 int,@P5 int,@P6 int,@P7 datetime,@P8 tinyint,@P9 int',
0,'2014-02-21 15:37:04',0,0,
10990,0,'2014-02-21 15:32:00',0,0
go

EXEC ep100;4 11157

-----------------------ep100;4 11157
create PROCEDURE EP100;4
@vproj_ptr INT  --DATA0025.RKEY
with encryption
AS
begin
select 0 as ttype,data0026.pcbcut_ptr,data0026.rkey,data0026.inventory_ptr,data0026.manu_bom_ptr,data0026.dept_ptr,data0026.QTY_BOM  ,data0026.FLOW_NO      ,data0026.ROUTE_STEP_NO      ,data0026.DOC_FLAG      ,data0026.repl_flag      ,data0026.alt_flag
      ,data0026.remark      ,data0026.CUST_PART_PTR      ,data0026.length      ,data0026.width      ,data0026.thickness
      ,data0026.uset      ,data0026.sys,data0023.ABBR_NAME,Data0026.KEY_FLAG,
data0002.unit_code,case when data0026.inventory_ptr>0 then data0017.inv_part_number else rtrim(data0050.customer_part_number)+' '+rtrim(data0050.cp_rev) end as inv_part_number,
case when  data0026.inventory_ptr>0 then data0017.inv_part_number+' '+data0017.inv_part_description
+(case when isnull(Data0017.MANUFACTURER_NAME,'')<>'' then '[spec:'+Data0017.MANUFACTURER_NAME+']' else '' end) else  '自制品-'+rtrim(data0050.customer_part_number)+' '+rtrim(data0050.cp_rev)+' '+rtrim(data0025.manu_part_number) end 
as inv_part_description,data0034.dept_code,data0502.description 
from data0034,data0026 left outer join data0502
on data0026.pcbcut_ptr=data0502.rkey left join data0017
on data0026.inventory_ptr=data0017.rkey left join data0025
on data0026.cust_part_ptr=data0025.rkey left join data0050
on data0025.ancestor_ptr=data0050.rkey left join data0002
on data0017.stock_unit_ptr=data0002.rkey left join data0023
on Data0026.supp_ptr=data0023.rkey
where data0026.manu_bom_ptr=@vproj_ptr
and data0026.flow_no=0
and data0026.dept_ptr=data0034.rkey
union all
select 
      1 as ttype,data0026.pcbcut_ptr,data0026.rkey,data0026.inventory_ptr,data0026.manu_bom_ptr,data0026.dept_ptr,NULL  ,data0026.FLOW_NO      ,data0026.ROUTE_STEP_NO      ,data0026.DOC_FLAG      ,data0026.repl_flag      ,data0026.alt_flag
      ,'替代'+ltrim(a.inv_part_number) as remark      ,data0026.CUST_PART_PTR      ,NULL as length      ,NULL as width      ,NULL as thickness
      ,NULL as uset      ,NULL as sys,data0023.ABBR_NAME,Data0026.KEY_FLAG,
data0002.unit_code,data0017.inv_part_number, data0017.inv_part_number+' '+data0017.inv_part_description
+(case when isnull(Data0017.MANUFACTURER_NAME,'')<>'' then '[spec:'+Data0017.MANUFACTURER_NAME+']' else '' end)
as inv_part_description,data0034.dept_code,null as description 
from data0034,data0026 inner join data0226
on data0026.rkey=data0226.d26_ptr left join data0017
on data0226.inventory_ptr=data0017.rkey left join data0017 a
on data0026.inventory_ptr=a.rkey left join data0025
on data0026.cust_part_ptr=data0025.rkey left join data0050
on data0025.ancestor_ptr=data0050.rkey left join data0002
on data0017.stock_unit_ptr=data0002.rkey left join data0023
on Data0026.supp_ptr=data0023.rkey
where data0026.manu_bom_ptr=@vproj_ptr
and data0026.flow_no=0
and data0026.dept_ptr=data0034.rkey

order by route_step_no,ttype,data0026.rkey,alt_flag,case when data0026.inventory_ptr>0 then data0017.inv_part_number else rtrim(data0050.customer_part_number)+' '+rtrim(data0050.cp_rev) end
end
GO       
       