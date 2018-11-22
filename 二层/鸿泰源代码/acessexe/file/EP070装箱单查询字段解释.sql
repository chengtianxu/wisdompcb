装运参考净面积含溢ROUND((Data0064.QUAN_SHIPPED + Data0064.ovsh_qty) * Data0050.unit_sq, 4) AS JingMianJi,--JingMianJi装运参考面积  已装运的数量,溢装数量,取50表的面积
装运毛面积round((Data0064.QUAN_SHIPPED+data0064.ovsh_qty) * a.PARAMETER_value,4)  AS mianji_tot,--已装运的数量,溢装数量,MI平方米(生产) 
单元参考面积 round(Data0050.unit_sq,6) as DYMianJi,取50表的面积
单元毛面积round(a.parameter_value,4) as unit_area, 平方米(生产)SQMT      
单元净面积ROUND(C.PARAMETER_value,4) AS DYJMJ,平方米(出货)SQMT2
装运净面积（含溢装）round((Data0064.QUAN_SHIPPED+data0064.ovsh_qty) * C.PARAMETER_value,4)  AS JMJ_tot   
装运净面积（含溢装）round(Data0064.QUAN_SHIPPED * C.PARAMETER_value,4)  AS JMJ_ship,--装运净面积不含溢装  
                                                                                       