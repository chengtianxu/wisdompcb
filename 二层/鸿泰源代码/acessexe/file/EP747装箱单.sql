exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."data0064" 
("SO_PTR","ENT_EMPL_PTR","ENT_CSI_USER_PTR","DATE_ASSIGN","PACKING_SLIP_FLAG","SHIPMENT_NO","QUAN_SHIPPED","RMA_PTR","part_price","rush_charge","prod_tax_flag","tool_tax_flag","discount","TAX_2","reg_tax_fixed_unused","remark","assign_type","WO_DateCode","PLANDATE","QUAN_STOCKED","ovsh_qty1","Spare_shipped") 

VALUES (@P1,@P2,@P3,@P4,@P5,@P6,@P7,@P8,@P9,@P10,@P11,@P12,@P13,@P14,@P15,@P16,@P17,@P18,@P19,@P20,@P21,@P22);
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 int,@P4 datetime,@P5 varchar(1),@P6 smallint,@P7 int,@P8 int,@P9 float,@P10 numeric(5,2),@P11 varchar(1),@P12 varchar(1),@P13 numeric(4,2),@P14 numeric(4,2),@P15 tinyint,@P16 varchar(1),@P17 tinyint,@P18 varchar(4),@P19 datetime,@P20 int,@P21 float,@P22 float',
 5212,1,1,'2013-07-22 10:52:44','0',0,1,0,20.219999999999999,0,'Y','Y',0,0,0,'',0,'1316','2013-07-22 00:00:00',0,0,0
 
 exec sp_executesql N'SET NOCOUNT OFF; INSERT INTO "SJ_V20_live".."Data0052" 
 ("DATA0053_PTR","SO_SHP_PTR","QUAN_SHP") 
 VALUES (@P1,@P2,@P3); 
 SELECT SCOPE_IDENTITY() AS SCOPE_ID_COLUMN',
 N'@P1 int,@P2 int,@P3 float',16018,7380,1
 
  Update Data0060  
  Set parts_shipped=parts_shipped+1 , ovsh_qty1=ovsh_qty1-0 , Spare_shipped=Spare_shipped -0 ,curr_shipment=2
   Where rkey=5212
   
    update A set parts_stocked=B.sum_quan_shp  
    from data0060 A,(select data0060.rkey,sum(isnull(QUAN_SHP,0)) as sum_quan_shp  from data0060   left join data0064 on data0064.SO_PTR=data0060.rkey   left join data0052 on data0052.SO_SHP_PTR=data0064.rkey   where  data0064.assign_type=0   group by data0060.rkey ) B 
     WHERE A.RKEY=B.RKEY  and A.rkey= 5212
