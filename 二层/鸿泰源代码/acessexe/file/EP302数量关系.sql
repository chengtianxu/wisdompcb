EP302数量关系
parts_margin (总欠计划装运数量)=Data0060.PARTS_ORDERED(订单数量)-Data0060.PARTS_SHIPPED(交货数量=正交货+溢装+备品)+Data0060.quan_to_re_delivery(退货需补数量)-Data0060.returned_ship(退货已交数量)  
parts_margin2(总净欠交数量)    =Data0060.PARTS_ORDERED(订单数量)-Data0060.PARTS_SHIPPED(交货数量=正交货+溢装+备品)+Data0060.quan_to_re_delivery(退货需补数量)-Data0060.returned_ship(退货已交数量) + part_ovsh(订单已指派溢装数量)  
ship_size(交货尺寸及形式)=LTRIM(STR(data0050.set_lngth, 18, 2)) + 'mm*' + LTRIM(STR(data0050.set_width, 18, 2)) + 'mm' + '(/' + LTRIM(STR(data0050.set_x_qty * data0050.set_y_qty, 8, 0)) + ')'
Strips_order订货数量(SET)=data0060.PARTS_ORDERED / NULLIF(data0050.set_y_qty, 0) / NULLIF(data0050.set_x_qty, 0)
ROUND(parts_ordered * part_price + TOTAL_ADD_L_PRICE, 4) AS SO_Sum_money --订单总费用=订单金额+额外费用
                                                                         --
                                                                         
 
 EP032净欠交数：用这几个字段计算的啊：订单数-已交货数量（包括备品和溢装）+退货需补数量-退货已交数量+已指派溢装数量(包括备品）


part_ovsh=(CONVERT([int],(isnull([ovsh_qty1],(0))+isnull([Returned_ovsh],(0)))+isnull([Spare_shipped],(0)),(0)))





 Data0060.PARTS_ORDERED-Data0060.PARTS_SHIPPED+Data0060.quan_to_re_delivery-Data0060.returned_ship as parts_margin

EP032总欠计划装运数：用这几个字段计算的啊：订单数-已交货数量（包括备品和溢装）+退货需补数量-退货已交数量

                                                                        