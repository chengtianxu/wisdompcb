object dm: Tdm
  OldCreateOrder = True
  Left = 272
  Top = 223
  Height = 364
  Width = 396
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 29
  end
  object DS64: TDataSource
    DataSet = ADS64
    Left = 24
    Top = 79
  end
  object ADS64: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT     D60.SALES_ORDER, D64.RKEY, D25.RKEY AS rkey25, D60.RK' +
      'EY AS rkey60, D97.RKEY AS rkey97, D64.SHIPMENT_NO, D64.QUAN_SHIP' +
      'PED, '#13#10'                      D64.QUAN_SHIPPED * D25.unit_sq AS a' +
      'rea, D64.assign_type, d64.custshipno,'#13#10'                    CASE ' +
      'D64.assign_type WHEN 0 THEN '#39#27491#24120#25351#27966#39' WHEN 1 THEN '#39#36864#36135#25351#27966#39' END AS v_a' +
      'ssign_type, '#13#10'                      CASE D64.packing_slip_flag W' +
      'HEN 0 THEN '#39#26410#35013#36816#39' WHEN 1 THEN '#39#24050#35013#36816#39' END AS if_ship, D64.DATE_ASSI' +
      'GN, D64.REMARK, D64.cust_decl, '#13#10'                      D05.EMPLO' +
      'YEE_NAME, D97.PO_NUMBER, D60.SCH_DATE, D60.PARTS_ORDERED, D60.PA' +
      'RTS_SHIPPED, D60.PARTS_RETURNED, D60.RETURNED_SHIP, '#13#10'          ' +
      '            D60.PARTS_SHIPPED - D60.PARTS_RETURNED + D60.RETURNE' +
      'D_SHIP AS total_shipped, D25.ANALYSIS_CODE_2,'#13#10'                 ' +
      '     D60.PARTS_ORDERED - D60.PARTS_SHIPPED + D60.PARTS_RETURNED ' +
      '- D60.RETURNED_SHIP AS parts_margin, '#13#10'                      CAS' +
      'E D60.status WHEN 1 THEN '#39#26377#25928#39' WHEN 2 THEN '#39#26242#32531#39' WHEN 3 THEN '#39#20851#38381#39' ' +
      #13#10'                     WHEN 4 THEN '#39#23436#25104#39' WHEN 5 THEN '#39#21462#28040#39' WHEN 6 ' +
      'THEN '#39#26410#25552#20132#39' END AS v_status,'#13#10'                       CASE D60.so_' +
      'tp WHEN 0 THEN '#39#33258#21046#39' WHEN 1 THEN '#39#22806#21457#39' WHEN 2 THEN '#39#21322#21046#31243#39' END AS v_' +
      'type, d60.REPUT_APPR_BY,'#13#10'                      CASE D60.commisi' +
      'on_on_tooling WHEN '#39'Y'#39' THEN '#39#36716#21378#39' WHEN '#39'N'#39' THEN '#39#20869#38144#39' END AS v_kin' +
      'd, D60.COMMISION_ON_TOOLING, D60.REFERENCE_NUMBER, '#13#10'           ' +
      '           D60.CUSTOMER_PTR, D10.CUST_CODE, D10.CUSTOMER_NAME, D' +
      '25.MANU_PART_NUMBER, D25.MANU_PART_DESC, D25.ANALYSIS_CODE_1, '#13#10 +
      '                      D25.REPORT_UNIT_VALUE1, D25.QTY_ON_HAND, D' +
      '25.set_qty, dbo.Data0023.ABBR_NAME AS abbrname23, D60.ENT_DATE, ' +
      ' '#13#10'                      D97.PO_DATE, D60.SHIPPING_METHOD, D12.L' +
      'OCATION, D15.ABBR_NAME, d64.cartons_no,'#13#10'                      D' +
      '64.REPORT_UNIT_VALUE1 AS REPORT_UNIT_VALUE1_1, dbo.data0439.deli' +
      'very_no'#13#10'FROM         dbo.Data0064 AS D64 INNER JOIN'#13#10'          ' +
      '            dbo.Data0060 AS D60 ON D64.SO_PTR = D60.RKEY INNER J' +
      'OIN'#13#10'                      dbo.Data0025 AS D25 ON D60.CUST_PART_' +
      'PTR = D25.RKEY INNER JOIN'#13#10'                      dbo.Data0097 AS' +
      ' D97 ON D60.PURCHASE_ORDER_PTR = D97.RKEY INNER JOIN'#13#10'          ' +
      '            dbo.Data0010 AS D10 ON D60.CUSTOMER_PTR = D10.RKEY I' +
      'NNER JOIN'#13#10'                      dbo.Data0012 AS D12 ON D60.CUST' +
      '_SHIP_ADDR_PTR = D12.RKEY INNER JOIN'#13#10'                      dbo.' +
      'Data0005 AS D05 ON D64.ENT_EMPL_PTR = D05.RKEY INNER JOIN'#13#10'     ' +
      '                 dbo.Data0015 AS D15 ON D60.SHIP_REG_TAX_ID = D1' +
      '5.RKEY LEFT OUTER JOIN'#13#10'                      dbo.data0439 ON D6' +
      '4.packing_list_ptr = dbo.data0439.rkey LEFT OUTER JOIN'#13#10'        ' +
      '              dbo.Data0023 ON D60.supplier_ptr = dbo.Data0023.RK' +
      'EY'#13#10'WHERE d64.date_assign>=:dtpk1 and d64.date_assign<=:dtpk2'#13#10
    IndexFieldNames = 'date_assign DESC'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    Prepared = True
    Left = 72
    Top = 80
    object ADS64sales_order: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ADS64shipment_no: TSmallintField
      DisplayLabel = #25209#21495
      FieldName = 'shipment_no'
    end
    object ADS64quan_shipped: TIntegerField
      DisplayLabel = #25351#27966#25968#37327
      FieldName = 'quan_shipped'
    end
    object ADS64v_assign_type: TStringField
      DisplayLabel = #25351#27966#31867#22411
      FieldName = 'v_assign_type'
      ReadOnly = True
      Size = 8
    end
    object ADS64if_ship: TStringField
      DisplayLabel = #35013#36816#29366#24577
      DisplayWidth = 6
      FieldName = 'if_ship'
      ReadOnly = True
      Size = 6
    end
    object ADS64date_assign: TDateTimeField
      DisplayLabel = #25351#27966#26085#26399
      FieldName = 'date_assign'
    end
    object ADS64remark: TStringField
      DisplayLabel = #35013#36816#22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object ADS64po_number: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'po_number'
      Size = 25
    end
    object ADS64sch_date: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'sch_date'
    end
    object ADS64parts_ordered: TFloatField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'parts_ordered'
    end
    object ADS64parts_shipped: TFloatField
      DisplayLabel = #25351#27966#25968#37327
      FieldName = 'parts_shipped'
    end
    object ADS64parts_margin: TFloatField
      DisplayLabel = #35746#21333#27424#25968
      FieldName = 'parts_margin'
      ReadOnly = True
    end
    object ADS64v_status: TStringField
      DisplayLabel = #35746#21333#29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object ADS64v_type: TStringField
      DisplayLabel = #21152#24037#24418#24335
      FieldName = 'v_type'
      ReadOnly = True
      Size = 6
    end
    object ADS64v_kind: TStringField
      DisplayLabel = #35746#21333#24615#36136
      FieldName = 'v_kind'
      ReadOnly = True
      Size = 4
    end
    object ADS64reference_number: TStringField
      DisplayLabel = #35746#21333#22791#27880
      FieldName = 'reference_number'
      Size = 30
    end
    object ADS64cust_code: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'cust_code'
      Size = 10
    end
    object ADS64manu_part_number: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'manu_part_number'
    end
    object ADS64manu_part_desc: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'manu_part_desc'
      Size = 40
    end
    object ADS64ANALYSIS_CODE_1: TStringField
      DisplayLabel = #20132#36135#23610#23544
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object ADS64report_unit_value1: TBCDField
      DisplayLabel = #21333#20301#37325#37327
      FieldName = 'report_unit_value1'
      Precision = 9
    end
    object ADS64rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS64rkey25: TAutoIncField
      FieldName = 'rkey25'
      ReadOnly = True
    end
    object ADS64customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object ADS64ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADS64po_date: TDateTimeField
      FieldName = 'po_date'
    end
    object ADS64shipping_method: TStringField
      FieldName = 'shipping_method'
      FixedChar = True
    end
    object ADS64location: TStringField
      FieldName = 'location'
      Size = 80
    end
    object ADS64rkey60: TAutoIncField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ADS64rkey97: TAutoIncField
      FieldName = 'rkey97'
      ReadOnly = True
    end
    object ADS64assign_type: TWordField
      FieldName = 'assign_type'
    end
    object ADS64parts_returned: TFloatField
      FieldName = 'parts_returned'
    end
    object ADS64returned_ship: TIntegerField
      FieldName = 'returned_ship'
    end
    object ADS64total_shipped: TFloatField
      DisplayLabel = #35013#36816#25968#37327
      FieldName = 'total_shipped'
      ReadOnly = True
    end
    object ADS64qty_on_hand: TIntegerField
      FieldName = 'qty_on_hand'
    end
    object ADS64commision_on_tooling: TStringField
      FieldName = 'commision_on_tooling'
      FixedChar = True
      Size = 1
    end
    object ADS64employee_name: TStringField
      DisplayLabel = #25351#27966#38599#21592
      FieldName = 'employee_name'
      Size = 16
    end
    object ADS64area: TFloatField
      DisplayLabel = #25351#27966#38754#31215'm2'
      FieldName = 'area'
      ReadOnly = True
      DisplayFormat = '0.0000'
    end
    object ADS64abbr_name: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'abbr_name'
      ReadOnly = True
      Size = 10
    end
    object ADS64REPORT_UNIT_VALUE1_1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1_1'
      Precision = 9
    end
    object ADS64set_qty: TIntegerField
      DisplayLabel = #20132#36135#21333#20803#25968
      FieldName = 'set_qty'
    end
    object ADS64CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADS64abbrname23: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'abbrname23'
      Size = 16
    end
    object ADS64cust_decl: TStringField
      DisplayLabel = #25253#20851#21333#21495
      FieldName = 'cust_decl'
      Size = 50
    end
    object ADS64delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADS64cartons_no: TIntegerField
      DisplayLabel = #20986#36135#31665#25968
      FieldName = 'cartons_no'
    end
    object ADS64REPUT_APPR_BY: TIntegerField
      FieldName = 'REPUT_APPR_BY'
    end
    object ADS64ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object ADS64custshipno: TStringField
      FieldName = 'custshipno'
      Size = 100
    end
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 24
    Top = 136
  end
  object AQ64: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey64'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0064 where rkey=:rkey64')
    Left = 128
    Top = 80
    object AQ64RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ64SO_PTR: TIntegerField
      FieldName = 'SO_PTR'
    end
    object AQ64ENT_EMPL_PTR: TIntegerField
      FieldName = 'ENT_EMPL_PTR'
    end
    object AQ64ENT_CSI_USER_PTR: TIntegerField
      FieldName = 'ENT_CSI_USER_PTR'
    end
    object AQ64packing_list_ptr: TIntegerField
      FieldName = 'packing_list_ptr'
    end
    object AQ64DATE_ASSIGN: TDateTimeField
      FieldName = 'DATE_ASSIGN'
    end
    object AQ64DATE_SHIPPED: TDateTimeField
      FieldName = 'DATE_SHIPPED'
    end
    object AQ64PACKING_SLIP_FLAG: TStringField
      FieldName = 'PACKING_SLIP_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ64SHIPMENT_NO: TSmallintField
      FieldName = 'SHIPMENT_NO'
    end
    object AQ64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object AQ64QUAN_CREDITED: TIntegerField
      FieldName = 'QUAN_CREDITED'
    end
    object AQ64RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object AQ64part_price: TFloatField
      FieldName = 'part_price'
    end
    object AQ64rush_charge: TBCDField
      FieldName = 'rush_charge'
      Precision = 5
      Size = 2
    end
    object AQ64prod_tax_flag: TStringField
      FieldName = 'prod_tax_flag'
      FixedChar = True
      Size = 1
    end
    object AQ64tool_tax_flag: TStringField
      FieldName = 'tool_tax_flag'
      FixedChar = True
      Size = 1
    end
    object AQ64discount: TBCDField
      FieldName = 'discount'
      Precision = 5
      Size = 2
    end
    object AQ64TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object AQ64ovsh_qty: TIntegerField
      FieldName = 'ovsh_qty'
    end
    object AQ64ovsh_discount: TBCDField
      FieldName = 'ovsh_discount'
      Precision = 5
      Size = 2
    end
    object AQ64reg_tax_fixed_unused: TWordField
      FieldName = 'reg_tax_fixed_unused'
    end
    object AQ64REMARK: TStringField
      FieldName = 'REMARK'
      Size = 50
    end
    object AQ64assign_type: TWordField
      FieldName = 'assign_type'
    end
    object AQ64REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object AQ64cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object AQ64custshipno: TStringField
      FieldName = 'custshipno'
      Size = 100
    end
  end
end
