--自动分配
SELECT isnull(SUM(isnull(Data0053.QTY_ON_HAND,0)-isnull(data0053.qty_alloc,0)),0)  AS sumQTY_ON_HAND  
  FROM Data0053 INNER JOIN
      Data0050 ON Data0053.CUST_PART_PTR = Data0050.RKEY inner join 
      data0016 on data0053.LOC_PTR=data0016.rkey  WHERE (isnull(Data0053.QTY_ON_HAND,0)>0) and (Data0050.customer_part_number ='P2G251003') and (0 =0 or Data0053.loc_ptr=0)
 --保存存     
Update Data0053 Set qty_on_hand=qty_on_hand-205 ,WaitShip=WaitShip+205 Where Rkey=20137


------------------------------------------------------------------------------------
--增加成品装运指派表
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0064" 
("SO_PTR","ENT_EMPL_PTR","ENT_CSI_USER_PTR","DATE_ASSIGN","PACKING_SLIP_FLAG","SHIPMENT_NO","QUAN_SHIPPED","RMA_PTR","part_price","rush_charge","prod_tax_flag","tool_tax_flag","discount","TAX_2","reg_tax_fixed_unused","remark","assign_type","WO_DateCode","PLANDATE","QUAN_STOCKED","ovsh_qty1","Spare_shipped")
 VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 datetime,@P5 varchar(1),@P6 smallint,@P7 int,@P8 int,@P9 float,@P10 numeric(5,2),@P11 varchar(1),@P12 varchar(1),@P13 numeric(4,2),@P14 numeric(4,2),@P15 tinyint,@P16 varchar(1),@P17 tinyint,@P18 varchar(4),@P19 datetime,@P20 int,@P21 float,@P22 float',
 6566,1,1,'2013-09-02 09:15:40','0',0,500,0,0.14399999999999999,0,'Y','Y',0,0,1,'',0,'1318','2013-09-02 00:00:00',0,0,0
--更改53表 
  Update Data0053 Set qty_on_hand=qty_on_hand-500 ,WaitShip=WaitShip+500 Where Rkey=18783
--增加装运指派表(成品出仓)
exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0052" 
("DATA0053_PTR","SO_SHP_PTR","QUAN_SHP","ttype") 
VALUES (@P1,@P2,@P3,@P4);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 float,@P4 int',
 18783,7381,500,0