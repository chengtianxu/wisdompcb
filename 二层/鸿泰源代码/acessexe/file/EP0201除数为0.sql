EP0201除数为0

1、qty_backlog+to_be_stocked<>0因下面语句做除数
Update data0056 set panels=round(panels*qty_backlog/(qty_backlog+to_be_stocked),0), to_be_stocked=to_be_stocked-94,
to_be_cancd=to_be_cancd-0
Where Rkey=112
2、data0006.parts_per_panel因为下面语句，在程序里
qryData0053.FieldByName('Panels').AsFloat:=int(qryData0053.Fieldbyname('quantity').AsInteger/Adoquery4.Fieldbyname('parts_per_panel').AsInteger+0.99);

3、50表时的SET_X_QTY和SET_Y_QTY不能数据，不然SQ_UNIT出错
4、下面语句不能一个53表RKEY有两条或多条记录，不然第一次后就会出现0除数
SELECT data0060.sales_order,Data0050.CUSTOMER_PART_NUMBER,Data0050.CP_REV, data0059.customer_part_desc,
    data0059.customer_matl_desc,data0416.post_date,data0005.employee_name,data0053.quantity  ,data0053.NPAD_PTR,
    data0053.quantity/(data0050.set_x_qty*data0050.set_y_qty) as strips,data0053.WO_DATECODE,Data0416.ToRemainStock,
    data0053.to_be_cancd,Data0053.LOC_PTR,data0053.location_flag,data0053.qty_on_hand, data0053.d0056_ptr,
    location=case when data0053.location_flag=1 then data0016.location
                  else '' end ,data0006.work_order_number,data0060.parts_ordered,Rkey25=Data0025.Rkey,
    round(Data0053.quantity* data0047.parameter_value,4) as area,data0016.whouse_ptr,data0053.Rkey,
    data0053.customer_ptr,data0056.qty_backlog,Rkey06=Data0006.rkey,Rkey50=Data0050.Rkey,data0056.intime,
    data0056.flow_no,data0056.step,data0056.wtype,data0056.dept_ptr,data0006.parts_per_panel,
      type_desc=case Data0492.ttype when 0 then '正常生产' when 1 then '非退货补料' when 2 then '退货补料' 
                                    when 3 then '仓库返工' when 4 then '退货返工' end 
  ,data0060.COMMISION_ON_TOOLING,Dsum59.parts_margin2 ,data0053.serial_no  
     ,case data0060.COMMISION_ON_TOOLING when 0 then '内销' when 1 then '保税' when 2 then '外销' end as COMMISION_ON_TOOLING_desc    --增加订单销售类型 LLL 20121025  
FROM data0053 inner join
     data0416 on data0053.npad_ptr=data0416.rkey left join
     data0056 on data0053.d0056_ptr=data0056.rkey and isnull(data0053.dept_ptr,0)<>0left join
     data0006 on data0053.work_order_ptr=data0006.rkey left join
     data0492 on data0006.cut_no=data0492.cut_no left join
     data0060 on data0006.so_ptr=data0060.rkey left join
     data0025 on data0006.bom_ptr=data0025.rkey left join
     --data0050 on data0025.ancestor_ptr=data0050.rkey left join
     data0050 on data0053.cust_part_ptr=data0050.rkey left join
     Data0047 ON Data0025.RKEY = Data0047.SOURCE_POINTER 
             AND Data0047.PARAMETER_PTR = 7 left join
     data0059 on data0053.cust_part_ptr=data0059.cust_part_ptr
             and data0053.customer_ptr=data0059.customer_ptr left join
     data0005 on data0416.post_empl_ptr=data0005.rkey left join
     data0016 on data0053.loc_ptr=data0016.rkey
      left join 
      ( select  data0059.rkey ,isnull(sum(Data0060.PARTS_ORDERED-Data0060.PARTS_SHIPPED+Data0060.quan_to_re_delivery-Data0060.returned_ship+part_ovsh),0) as parts_margin2 from data0060  
      left join data0059 on data0060.CUSTOMER_PTR=data0059.CUSTOMER_PTR and data0060.CUST_PART_PTR=data0059.CUST_PART_PTR   where data0060.status=1 
       group by data0059.rkey, data0059.rkey ) as Dsum59 on data0059.rkey=Dsum59.rkey --20130615  
   WHERE data0416.rkey=:d416Rkey 
   AND data0053.rkey= --调试增加的
--ORDER BY Data0050.CUSTOMER_PART_NUMBER,data0050.cp_rev
  order by data0053.rkey
  
上面多条记录，从第二条开始就会有0除数问题，所以应在EP200里限制
Update data0056 set panels=round(panels*qty_backlog/(qty_backlog+to_be_stocked),0), to_be_stocked=to_be_stocked-94,
to_be_cancd=to_be_cancd-0
Where Rkey=112



