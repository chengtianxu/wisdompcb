object DM: TDM
  OldCreateOrder = False
  Left = 477
  Top = 231
  Height = 227
  Width = 313
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 24
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 136
    Top = 24
  end
  object Ado578: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vDt1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'vDt2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0060.RKEY, dbo.Data0060.SALES_ORDER,dbo.data0008.' +
        'PRODUCT_NAME,'
      
        '       case dbo.Data0060.STATUS when 1 then '#39#26377#25928#39' when 2 then '#39#26242#32531 +
        #39' when 3 then '#39#20851#38381#39' when 4 then '#39#23436#25104#39' when 5 then '#39#21462#28040#39' when 6 then' +
        ' '#39#26410#25552#20132#39' end as STATUS60,'
      
        '       dbo.Data0060.PART_PRICE, dbo.Data0060.PARTS_ORDERED,dbo.D' +
        'ata0060.PARTS_ALLOC/dbo.data0060.EXCH_RATE as PARTS_ALLOC,  '
      
        '       dbo.Data0060.EXCH_RATE, dbo.Data0060.ENT_DATE, dbo.Data00' +
        '60.SCH_DATE,'
      
        '       case dbo.Data0060.COMMISION_ON_TOOLING when '#39'Y'#39' then '#39#36716#21378#39 +
        ' when '#39'N'#39' then '#39#20869#38144#39' end as COMMISION_ON_TOOLING,'
      
        '       case dbo.Data0060.so_tp when 0 then '#39#33258#21046#39' when 1 then '#39#22806#21457#39 +
        ' when 2 then '#39#21322#21046#31243#39' end as so_tp,'
      
        '       dbo.Data0060.so_oldnew, dbo.data0025.MANU_PART_NUMBER,dbo' +
        '.data0025.MANU_PART_DESC,dbo.data0060.REFERENCE_NUMBER,dbo.data0' +
        '060.PARTS_ALLOC,dbo.data0060.RUSH_CHARGE,'
      
        '       dbo.data0015.ABBR_NAME as Factory,dbo.data0097.PO_NUMBER,' +
        'dbo.data0025.LAYERS,dbo.data0025.pcs_sq*dbo.Data0060.PARTS_ORDER' +
        'ED as Area,'
      
        '       case dbo.data0025.ttype when 0 then '#39#37327#26495#39' when 1 then '#39#26679#26495#39 +
        ' end as ttype,dbo.data0010.CUST_CODE,dbo.data0010.ABBR_NAME,'
      
        '       dbo.data0005.EMPLOYEE_NAME as SALES_REP_NAME,dbo.data0579' +
        '.PriceName,'
      
        '       case dbo.data0060.tax_in_price when '#39'N'#39' then (dbo.data057' +
        '8.Price*dbo.Data0060.PARTS_ORDERED)/dbo.data0060.EXCH_RATE '
      '       when '#39'Y'#39' then case dbo.data0001.CURR_CODE when '#39'RMB'#39' then'
      
        ' ((dbo.data0578.Price*dbo.Data0060.PARTS_ORDERED)/dbo.data0060.E' +
        'XCH_RATE)/((100+dbo.data0060.RUSH_CHARGE)*0.01) else (dbo.data05' +
        '78.Price*dbo.Data0060.PARTS_ORDERED)/dbo.data0060.EXCH_RATE end ' +
        'end as Amount,'
      
        '       data0060.parts_shipped,data0060.parts_returned,data0060.p' +
        'arts_invoiced,'
      
        '       case dbo.data0060.tax_in_price when '#39'N'#39' then dbo.data0578' +
        '.Price/dbo.data0060.EXCH_RATE when '#39'Y'#39' then'
      
        ' case dbo.data0001.CURR_CODE when '#39'RMB'#39' then (dbo.data0578.Price' +
        '/dbo.data0060.EXCH_RATE)/((100+dbo.data0060.RUSH_CHARGE)*0.01) e' +
        'lse dbo.data0578.Price/dbo.data0060.EXCH_RATE end end as Price,'
      
        '       CASE WHEN data0060.parts_ordered - data0060.parts_shipped' +
        ' > 0 THEN data0060.parts_ordered - data0060.parts_shipped ELSE 0' +
        ' END AS parts_needed'
      'FROM  dbo.Data0060 INNER JOIN'
      
        '      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data' +
        '0097.RKEY INNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0578 ON dbo.Data0060.RKEY = dbo.Data0578.d60_Ptr I' +
        'NNER JOIN'
      
        '      dbo.Data0579 ON dbo.Data0578.d579_Ptr = dbo.Data0579.Rkey ' +
        'left JOIN'
      
        '      dbo.Data0005 ON dbo.Data0060.COMM_ASSIGNED_BY_E_P = dbo.Da' +
        'ta0005.RKEY INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data001' +
        '5.RKEY inner join'
      
        '      dbo.data0001 on dbo.data0060.CURRENCY_PTR=dbo.data0001.RKe' +
        'y'
      
        'where (dbo.Data0060.ENT_DATE>=:vDt1) and (dbo.Data0060.ENT_DATE<' +
        '=:vDt2)')
    Left = 40
    Top = 96
    object Ado578RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Ado578SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object Ado578PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object Ado578STATUS60: TStringField
      FieldName = 'STATUS60'
      ReadOnly = True
      Size = 6
    end
    object Ado578PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object Ado578PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object Ado578PARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
      ReadOnly = True
    end
    object Ado578EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object Ado578ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object Ado578SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object Ado578COMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      ReadOnly = True
      Size = 4
    end
    object Ado578so_tp: TStringField
      FieldName = 'so_tp'
      ReadOnly = True
      Size = 6
    end
    object Ado578so_oldnew: TStringField
      FieldName = 'so_oldnew'
      FixedChar = True
      Size = 4
    end
    object Ado578MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado578MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Ado578Factory: TStringField
      FieldName = 'Factory'
      Size = 10
    end
    object Ado578PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object Ado578LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object Ado578Area: TFloatField
      FieldName = 'Area'
      ReadOnly = True
    end
    object Ado578ttype: TStringField
      FieldName = 'ttype'
      ReadOnly = True
      Size = 4
    end
    object Ado578CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object Ado578ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado578SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
      Size = 16
    end
    object Ado578PriceName: TStringField
      FieldName = 'PriceName'
    end
    object Ado578Amount: TFloatField
      FieldName = 'Amount'
      ReadOnly = True
    end
    object Ado578parts_shipped: TFloatField
      FieldName = 'parts_shipped'
    end
    object Ado578parts_returned: TFloatField
      FieldName = 'parts_returned'
    end
    object Ado578parts_invoiced: TFloatField
      FieldName = 'parts_invoiced'
    end
    object Ado578Price: TFloatField
      FieldName = 'Price'
      ReadOnly = True
    end
    object Ado578parts_needed: TFloatField
      FieldName = 'parts_needed'
      ReadOnly = True
    end
    object Ado578REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object Ado578PARTS_ALLOC_1: TFloatField
      FieldName = 'PARTS_ALLOC_1'
    end
    object Ado578RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
  end
  object Ado64: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vDt1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vDt2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  dbo.Data0060.SALES_ORDER, dbo.Data0064.RKEY, dbo.Data006' +
        '4.SHIPMENT_NO, dbo.Data0064.QUAN_SHIPPED, dbo.Data0064.QUAN_SHIP' +
        'PED * dbo.Data0025.unit_sq AS area,  '
      
        #9#9'CASE dbo.Data0064.assign_type WHEN 0 THEN '#39#27491#24120#25351#27966#39' WHEN 1 THEN '#39 +
        #36864#36135#25351#27966#39' END AS v_assign_type,'
      
        '        case dbo.data0060.tax_in_price when '#39'N'#39' then (dbo.Data00' +
        '64.QUAN_SHIPPED* dbo.data0578.Price)/dbo.data0060.EXCH_RATE'
      
        #9#9'when '#39'Y'#39' then case dbo.data0001.CURR_CODE when '#39'RMB'#39' then ((db' +
        'o.Data0064.QUAN_SHIPPED* dbo.data0578.Price)/dbo.data0060.EXCH_R' +
        'ATE)/((100+dbo.data0060.RUSH_CHARGE)*0.01) '
      
        'else (dbo.Data0064.QUAN_SHIPPED* dbo.data0578.Price)/dbo.data006' +
        '0.EXCH_RATE end end as Money,'
      
        #9#9'CASE dbo.Data0064.packing_slip_flag WHEN 0 THEN '#39#26410#35013#36816#39' WHEN 1 T' +
        'HEN '#39#24050#35013#36816#39' END AS if_ship, dbo.Data0064.DATE_ASSIGN, dbo.Data0064' +
        '.REMARK, dbo.Data0064.cust_decl, '
      
        #9#9'd5a.EMPLOYEE_NAME, dbo.Data0097.PO_NUMBER, dbo.Data0060.SCH_DA' +
        'TE, dbo.Data0060.PARTS_ORDERED, dbo.Data0060.PARTS_SHIPPED, dbo.' +
        'Data0060.PARTS_RETURNED, dbo.Data0060.RETURNED_SHIP, '
      
        #9#9'dbo.Data0060.PARTS_SHIPPED - dbo.Data0060.PARTS_RETURNED + dbo' +
        '.Data0060.RETURNED_SHIP AS total_shipped, '
      
        #9#9'dbo.Data0060.PARTS_ORDERED - dbo.Data0060.PARTS_SHIPPED + dbo.' +
        'Data0060.PARTS_RETURNED - dbo.Data0060.RETURNED_SHIP AS parts_ma' +
        'rgin, '
      
        #9#9'CASE dbo.Data0060.status WHEN 1 THEN '#39#26377#25928#39' WHEN 2 THEN '#39#26242#32531#39' WHE' +
        'N 3 THEN '#39#20851#38381#39' WHEN 4 THEN '#39#23436#25104#39' WHEN 5 THEN '#39#21462#28040#39' WHEN 6 THEN '#39#26410#25552#20132 +
        #39' END AS v_status,'
      
        #9#9'CASE dbo.Data0060.so_tp WHEN 0 THEN '#39#33258#21046#39' WHEN 1 THEN '#39#22806#21457#39' WHEN' +
        ' 2 THEN '#39#21322#21046#31243#39' END AS v_type,'
      
        #9#9'CASE dbo.Data0060.commision_on_tooling WHEN '#39'Y'#39' THEN '#39#36716#21378#39' WHEN' +
        ' '#39'N'#39' THEN '#39#20869#38144#39' END AS v_kind,  '
      
        #9#9'dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME, dbo.Data00' +
        '25.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.A' +
        'NALYSIS_CODE_1, '
      
        #9#9'dbo.Data0025.REPORT_UNIT_VALUE1, dbo.Data0025.QTY_ON_HAND, dbo' +
        '.Data0025.set_qty, dbo.Data0023.ABBR_NAME AS abbrname23, dbo.Dat' +
        'a0060.ENT_DATE,  '
      
        #9#9'dbo.Data0097.PO_DATE, dbo.Data0060.SHIPPING_METHOD, dbo.Data00' +
        '12.LOCATION, dbo.Data0015.ABBR_NAME, dbo.Data0064.cartons_no,'
      
        #9#9'dbo.Data0064.REPORT_UNIT_VALUE1 AS REPORT_UNIT_VALUE1_1, dbo.d' +
        'ata0008.PRODUCT_NAME,dbo.data0060.REFERENCE_NUMBER,dbo.data0060.' +
        'PARTS_ALLOC,dbo.data0060.RUSH_CHARGE,'
      
        '        case dbo.data0060.tax_in_price when '#39'N'#39' then dbo.data057' +
        '8.Price/dbo.data0060.EXCH_RATE when '#39'Y'#39' then case dbo.data0001.C' +
        'URR_CODE when '#39'RMB'#39' then'
      
        ' (dbo.data0578.Price/dbo.data0060.EXCH_RATE)/((100+dbo.data0060.' +
        'RUSH_CHARGE)*0.01) else dbo.data0578.Price/dbo.data0060.EXCH_RAT' +
        'E end end as Price,'
      
        '        dbo.data0579.PriceName,d5b.EMPLOYEE_NAME as SALES_REP_NA' +
        'ME,dbo.data0060.PART_PRICE,dbo.Data0060.PARTS_ALLOC/dbo.data0060' +
        '.EXCH_RATE as PARTS_ALLOC  '
      'FROM  dbo.Data0064 INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY LEFT OUTER JOIN'
      
        #9'  dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKE' +
        'Y INNER JOIN'
      
        '      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data' +
        '0097.RKEY INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY left JOIN'
      
        #9'  dbo.Data0005 d5b ON dbo.Data0060.COMM_ASSIGNED_BY_E_P = d5b.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0012 ON dbo.Data0060.CUST_SHIP_ADDR_PTR = dbo.Data' +
        '0012.RKEY INNER JOIN'
      
        '      dbo.Data0005 d5a ON dbo.Data0064.ENT_EMPL_PTR = d5a.RKEY L' +
        'EFT OUTER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data001' +
        '5.RKEY LEFT OUTER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0060.supplier_ptr = dbo.Data0023.R' +
        'KEY inner join'
      
        #9'  dbo.Data0578 ON dbo.Data0060.RKEY = dbo.Data0578.d60_Ptr INNE' +
        'R JOIN'
      
        #9'  dbo.Data0579 ON dbo.Data0578.d579_Ptr = dbo.Data0579.Rkey inn' +
        'er join'
      
        '      dbo.data0001 on dbo.data0060.CURRENCY_PTR=dbo.data0001.RKe' +
        'y'
      
        'WHERE dbo.Data0064.date_assign>=:vDt1 and dbo.Data0064.date_assi' +
        'gn<=:vDt2')
    Left = 104
    Top = 96
    object Ado64SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object Ado64RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Ado64SHIPMENT_NO: TSmallintField
      FieldName = 'SHIPMENT_NO'
    end
    object Ado64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object Ado64area: TFloatField
      FieldName = 'area'
      ReadOnly = True
    end
    object Ado64v_assign_type: TStringField
      FieldName = 'v_assign_type'
      ReadOnly = True
      Size = 8
    end
    object Ado64Money: TFloatField
      FieldName = 'Money'
      ReadOnly = True
    end
    object Ado64if_ship: TStringField
      FieldName = 'if_ship'
      ReadOnly = True
      Size = 6
    end
    object Ado64DATE_ASSIGN: TDateTimeField
      FieldName = 'DATE_ASSIGN'
    end
    object Ado64REMARK: TStringField
      FieldName = 'REMARK'
      Size = 50
    end
    object Ado64cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
    object Ado64EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Ado64PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object Ado64SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object Ado64PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object Ado64PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object Ado64PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object Ado64RETURNED_SHIP: TIntegerField
      FieldName = 'RETURNED_SHIP'
    end
    object Ado64total_shipped: TFloatField
      FieldName = 'total_shipped'
      ReadOnly = True
    end
    object Ado64parts_margin: TFloatField
      FieldName = 'parts_margin'
      ReadOnly = True
    end
    object Ado64v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object Ado64v_type: TStringField
      FieldName = 'v_type'
      ReadOnly = True
      Size = 6
    end
    object Ado64v_kind: TStringField
      FieldName = 'v_kind'
      ReadOnly = True
      Size = 4
    end
    object Ado64CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object Ado64CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object Ado64MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado64MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Ado64ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object Ado64REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object Ado64QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object Ado64set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object Ado64abbrname23: TStringField
      FieldName = 'abbrname23'
      Size = 16
    end
    object Ado64ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object Ado64PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object Ado64SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object Ado64LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object Ado64ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado64cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object Ado64REPORT_UNIT_VALUE1_1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1_1'
      Precision = 9
    end
    object Ado64PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object Ado64Price: TFloatField
      FieldName = 'Price'
      ReadOnly = True
    end
    object Ado64PriceName: TStringField
      FieldName = 'PriceName'
    end
    object Ado64SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
      Size = 16
    end
    object Ado64PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object Ado64PARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
      ReadOnly = True
    end
    object Ado64REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object Ado64PARTS_ALLOC_1: TFloatField
      FieldName = 'PARTS_ALLOC_1'
      ReadOnly = True
    end
    object Ado64RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
  end
  object Ado98: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vDt1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vDt2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT  dbo.Data0060.SALES_ORDER, dbo.Data0098.RKEY, dbo.Data009' +
        '8.RMA_NUMBER, dbo.Data0098.QTY_AUTH, dbo.Data0098.QTY_AUTH * dbo' +
        '.Data0025.unit_sq AS area,  '
      
        #9#9'CASE dbo.Data0098.NOTE_PAD_PTR WHEN 0 THEN '#39#20801#35768#25187#27454#39' WHEN 1 THEN ' +
        #39#19981#20801#35768#25187#27454#39' END AS NOTE_PAD_PTR,'
      
        '        case dbo.data0060.tax_in_price when '#39'N'#39' then (dbo.Data00' +
        '98.QTY_AUTH* dbo.data0578.Price)/dbo.data0060.EXCH_RATE'
      
        #9#9'when '#39'Y'#39' then case dbo.data0001.CURR_CODE when '#39'RMB'#39' then ((db' +
        'o.Data0098.QTY_AUTH* dbo.data0578.Price)/dbo.data0060.EXCH_RATE)' +
        '/((100+dbo.data0060.RUSH_CHARGE)*0.01) else (dbo.Data0098.QTY_AU' +
        'TH* dbo.data0578.Price)/dbo.data0060.EXCH_RATE end end as Money,'
      
        #9#9'CASE dbo.Data0098.RMA_STATUS WHEN 1 THEN '#39#26410#25552#20132#39' WHEN 2 THEN '#39#24453#20837 +
        #20179#39' when 3 then '#39#24050#20837#20179#39' when 4 then '#39#24050#20805#24080#39' END AS RMA_STATUS, dbo.Da' +
        'ta0098.RMA_DATE, dbo.Data0098.ANALYSIS_CODE_1 as Remark1, dbo.Da' +
        'ta0098.ANALYSIS_CODE_2 as Remark2, '
      
        #9#9'd5a.EMPLOYEE_NAME, dbo.Data0097.PO_NUMBER, dbo.Data0060.SCH_DA' +
        'TE, dbo.Data0060.PARTS_ORDERED, dbo.Data0060.PARTS_SHIPPED, dbo.' +
        'Data0060.PARTS_RETURNED, dbo.Data0060.RETURNED_SHIP, '
      
        #9#9'dbo.Data0060.PARTS_SHIPPED - dbo.Data0060.PARTS_RETURNED + dbo' +
        '.Data0060.RETURNED_SHIP AS total_shipped, '
      
        #9#9'dbo.Data0060.PARTS_ORDERED - dbo.Data0060.PARTS_SHIPPED + dbo.' +
        'Data0060.PARTS_RETURNED - dbo.Data0060.RETURNED_SHIP AS parts_ma' +
        'rgin, '
      
        #9#9'CASE dbo.Data0060.status WHEN 1 THEN '#39#26377#25928#39' WHEN 2 THEN '#39#26242#32531#39' WHE' +
        'N 3 THEN '#39#20851#38381#39' WHEN 4 THEN '#39#23436#25104#39' WHEN 5 THEN '#39#21462#28040#39' WHEN 6 THEN '#39#26410#25552#20132 +
        #39' END AS v_status,'
      
        #9#9'CASE dbo.Data0060.so_tp WHEN 0 THEN '#39#33258#21046#39' WHEN 1 THEN '#39#22806#21457#39' WHEN' +
        ' 2 THEN '#39#21322#21046#31243#39' END AS v_type,'
      
        #9#9'CASE dbo.Data0060.commision_on_tooling WHEN '#39'Y'#39' THEN '#39#36716#21378#39' WHEN' +
        ' '#39'N'#39' THEN '#39#20869#38144#39' END AS v_kind,dbo.data0060.REFERENCE_NUMBER,dbo.d' +
        'ata0060.PARTS_ALLOC,dbo.data0060.RUSH_CHARGE,  '
      
        #9#9'dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME, dbo.Data00' +
        '25.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.A' +
        'NALYSIS_CODE_1, '
      
        #9#9'dbo.Data0025.REPORT_UNIT_VALUE1, dbo.Data0025.QTY_ON_HAND, dbo' +
        '.Data0025.set_qty, dbo.Data0023.ABBR_NAME AS abbrname23, dbo.Dat' +
        'a0060.ENT_DATE,  '
      
        #9#9'dbo.Data0097.PO_DATE, dbo.Data0060.SHIPPING_METHOD, dbo.Data00' +
        '12.LOCATION, dbo.Data0015.ABBR_NAME, dbo.data0008.PRODUCT_NAME,'
      
        '        case dbo.data0060.tax_in_price when '#39'N'#39' then dbo.data057' +
        '8.Price/dbo.data0060.EXCH_RATE when '#39'Y'#39' then case dbo.data0001.C' +
        'URR_CODE when '#39'RMB'#39' then (dbo.data0578.Price/dbo.data0060.EXCH_R' +
        'ATE)/((100+dbo.data0060.RUSH_CHARGE)*0.01) else dbo.data0578.Pri' +
        'ce/dbo.data0060.EXCH_RATE end end as Price,'
      
        '        dbo.data0579.PriceName,d5b.EMPLOYEE_NAME as SALES_REP_NA' +
        'ME,dbo.data0060.PART_PRICE,dbo.Data0060.PARTS_ALLOC/dbo.data0060' +
        '.EXCH_RATE as PARTS_ALLOC  '
      'FROM  dbo.Data0098 LEFT OUTER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY LEFT OUTER JOIN'
      
        #9'  dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKE' +
        'Y INNER JOIN'
      
        '      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data' +
        '0097.RKEY INNER JOIN'
      
        '      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.R' +
        'KEY left JOIN'
      
        #9'  dbo.Data0005 d5b ON dbo.Data0060.COMM_ASSIGNED_BY_E_P = d5b.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0012 ON dbo.Data0060.CUST_SHIP_ADDR_PTR = dbo.Data' +
        '0012.RKEY INNER JOIN'
      
        '      dbo.Data0005 d5a ON dbo.Data0098.AUTH_BY_EMPL_PTR = d5a.RK' +
        'EY LEFT OUTER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data001' +
        '5.RKEY LEFT OUTER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0060.supplier_ptr = dbo.Data0023.R' +
        'KEY inner join'
      
        #9'  dbo.Data0578 ON dbo.Data0060.RKEY = dbo.Data0578.d60_Ptr INNE' +
        'R JOIN'
      
        #9'  dbo.Data0579 ON dbo.Data0578.d579_Ptr = dbo.Data0579.Rkey inn' +
        'er join'
      
        '      dbo.data0001 on dbo.data0060.CURRENCY_PTR=dbo.data0001.RKe' +
        'y'
      
        'WHERE dbo.Data0098.RMA_DATE>=:vDt1 and dbo.Data0098.RMA_DATE<=:v' +
        'Dt2')
    Left = 168
    Top = 96
    object Ado98SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object Ado98RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Ado98RMA_NUMBER: TStringField
      FieldName = 'RMA_NUMBER'
      FixedChar = True
      Size = 10
    end
    object Ado98QTY_AUTH: TIntegerField
      FieldName = 'QTY_AUTH'
    end
    object Ado98area: TFloatField
      FieldName = 'area'
      ReadOnly = True
    end
    object Ado98NOTE_PAD_PTR: TStringField
      FieldName = 'NOTE_PAD_PTR'
      ReadOnly = True
      Size = 10
    end
    object Ado98Money: TFloatField
      FieldName = 'Money'
      ReadOnly = True
    end
    object Ado98RMA_STATUS: TStringField
      FieldName = 'RMA_STATUS'
      ReadOnly = True
      Size = 6
    end
    object Ado98RMA_DATE: TDateTimeField
      FieldName = 'RMA_DATE'
    end
    object Ado98Remark1: TStringField
      FieldName = 'Remark1'
      Size = 50
    end
    object Ado98Remark2: TStringField
      FieldName = 'Remark2'
      Size = 50
    end
    object Ado98EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Ado98PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object Ado98SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object Ado98PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object Ado98PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object Ado98PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object Ado98RETURNED_SHIP: TIntegerField
      FieldName = 'RETURNED_SHIP'
    end
    object Ado98total_shipped: TFloatField
      FieldName = 'total_shipped'
      ReadOnly = True
    end
    object Ado98parts_margin: TFloatField
      FieldName = 'parts_margin'
      ReadOnly = True
    end
    object Ado98v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object Ado98v_type: TStringField
      FieldName = 'v_type'
      ReadOnly = True
      Size = 6
    end
    object Ado98v_kind: TStringField
      FieldName = 'v_kind'
      ReadOnly = True
      Size = 4
    end
    object Ado98CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object Ado98CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object Ado98MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado98MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Ado98ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object Ado98REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object Ado98QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object Ado98set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object Ado98abbrname23: TStringField
      FieldName = 'abbrname23'
      Size = 16
    end
    object Ado98ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object Ado98PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object Ado98SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object Ado98LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object Ado98ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado98PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object Ado98Price: TFloatField
      FieldName = 'Price'
      ReadOnly = True
    end
    object Ado98PriceName: TStringField
      FieldName = 'PriceName'
    end
    object Ado98SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
      Size = 16
    end
    object Ado98PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object Ado98PARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
      ReadOnly = True
    end
    object Ado98REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object Ado98PARTS_ALLOC_1: TFloatField
      FieldName = 'PARTS_ALLOC_1'
      ReadOnly = True
    end
    object Ado98RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
  end
  object Ado114: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vDt1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'vDt2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0112.invoice_number, dbo.data0439.delivery_no' +
        ', dbo.Data0060.SALES_ORDER, dbo.Data0064.QUAN_SHIPPED, '
      
        '                      dbo.Data0064.QUAN_SHIPPED * dbo.Data0025.u' +
        'nit_sq AS area, '
      
        '                      CASE dbo.Data0114.TTYPE WHEN 1 THEN '#39#29616#38134#25910#27454#39 +
        ' WHEN 5 THEN '#39#36716#24080#25910#27454#39' END AS v_assign_type, dbo.Data0064.TAX_2, '
      
        '                      dbo.Data0112.POSTED_DATE, dbo.Data0085.rat' +
        'e_margin, '
      
        '                      CASE dbo.data0060.tax_in_price WHEN '#39'N'#39' TH' +
        'EN (dbo.Data0064.QUAN_SHIPPED * dbo.data0578.Price) '
      
        '                      / dbo.data0060.EXCH_RATE WHEN '#39'Y'#39' THEN CAS' +
        'E dbo.data0001.CURR_CODE WHEN '#39'RMB'#39' THEN ((dbo.Data0064.QUAN_SHI' +
        'PPED * dbo.data0578.Price)'
      
        '                       / dbo.data0060.EXCH_RATE) / ((100 + dbo.d' +
        'ata0064.TAX_2) * 0.01) ELSE (dbo.Data0064.QUAN_SHIPPED * dbo.dat' +
        'a0578.Price) '
      
        '                      / dbo.data0060.EXCH_RATE END END AS dMoney' +
        ', '
      
        '                      CASE dbo.data0060.tax_in_price WHEN '#39'Y'#39' TH' +
        'EN dbo.Data0064.QUAN_SHIPPED * dbo.data0578.Price WHEN '#39'N'#39' THEN ' +
        'CASE dbo.data0001.CURR_CODE'
      
        '                       WHEN '#39'RMB'#39' THEN ((dbo.Data0064.QUAN_SHIPP' +
        'ED * dbo.data0578.Price) * ((100 + dbo.data0064.TAX_2) * 0.01)) '
      
        '                      ELSE dbo.Data0064.QUAN_SHIPPED * dbo.data0' +
        '578.Price END END AS AMOUNT2, dbo.Data0114.RKEY AS RKey114, dbo.' +
        'Data0114.TDATE, '
      
        '                      dbo.Data0114.REMARK, dbo.Data0112.INVOICE_' +
        'DATE, dbo.Data0112.RKEY AS Rkey112, '
      
        '                      CASE dbo.data0064.prod_tax_flag WHEN '#39'N'#39' T' +
        'HEN Round((dbo.data0115.AMOUNT / dbo.data0060.EXCH_RATE), 4) '
      
        '                      WHEN '#39'Y'#39' THEN CASE dbo.data0001.CURR_CODE ' +
        'WHEN '#39'RMB'#39' THEN Round(((dbo.data0115.AMOUNT / dbo.data0060.EXCH_' +
        'RATE) '
      
        '                      / ((100 + dbo.data0064.TAX_2) * 0.01)), 4)' +
        ' ELSE Round((dbo.data0115.AMOUNT / dbo.data0060.EXCH_RATE), 4) E' +
        'ND END AS AMOUNT, '
      
        '                      d5a.EMPLOYEE_NAME, dbo.Data0097.PO_NUMBER,' +
        ' dbo.Data0060.SCH_DATE, dbo.Data0060.PARTS_ORDERED, dbo.Data0060' +
        '.PARTS_SHIPPED, '
      
        '                      dbo.Data0060.PARTS_RETURNED, dbo.Data0060.' +
        'RETURNED_SHIP,dbo.data0060.REFERENCE_NUMBER,dbo.data0060.PARTS_A' +
        'LLOC, dbo.data0060.RUSH_CHARGE,'
      
        '                      dbo.Data0060.PARTS_SHIPPED - dbo.Data0060.' +
        'PARTS_RETURNED + dbo.Data0060.RETURNED_SHIP AS total_shipped, '
      
        '                      dbo.Data0060.PARTS_ORDERED - dbo.Data0060.' +
        'PARTS_SHIPPED + dbo.Data0060.PARTS_RETURNED - dbo.Data0060.RETUR' +
        'NED_SHIP AS parts_margin,'
      
        '                       CASE dbo.Data0060.status WHEN 1 THEN '#39#26377#25928#39 +
        ' WHEN 2 THEN '#39#26242#32531#39' WHEN 3 THEN '#39#20851#38381#39' WHEN 4 THEN '#39#23436#25104#39' WHEN 5 THEN ' +
        #39#21462#28040#39' WHEN 6 THEN'
      
        '                       '#39#26410#25552#20132#39' END AS v_status, CASE dbo.Data0060.' +
        'so_tp WHEN 0 THEN '#39#33258#21046#39' WHEN 1 THEN '#39#22806#21457#39' WHEN 2 THEN '#39#21322#21046#31243#39' END AS' +
        ' v_type, '
      
        '                      CASE dbo.Data0060.commision_on_tooling WHE' +
        'N '#39'Y'#39' THEN '#39#36716#21378#39' WHEN '#39'N'#39' THEN '#39#20869#38144#39' END AS v_kind, dbo.Data0025.L' +
        'AYERS, '
      
        '                      dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTO' +
        'MER_NAME, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_' +
        'DESC, '
      
        '                      dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025' +
        '.REPORT_UNIT_VALUE1, dbo.Data0025.QTY_ON_HAND, dbo.Data0025.set_' +
        'qty, '
      
        '                      dbo.Data0023.ABBR_NAME AS abbrname23, dbo.' +
        'Data0060.ENT_DATE, dbo.Data0097.PO_DATE, dbo.Data0060.SHIPPING_M' +
        'ETHOD, '
      
        '                      dbo.Data0015.ABBR_NAME, dbo.Data0008.PRODU' +
        'CT_NAME, dbo.Data0001.CURR_CODE, dbo.Data0060.EXCH_RATE, '
      
        '                      CASE dbo.data0060.tax_in_price WHEN '#39'N'#39' TH' +
        'EN dbo.data0578.Price / dbo.data0060.EXCH_RATE WHEN '#39'Y'#39' THEN CAS' +
        'E dbo.data0001.CURR_CODE WHEN'
      
        '                       '#39'RMB'#39' THEN (dbo.data0578.Price / dbo.data' +
        '0060.EXCH_RATE) / ((100 + dbo.data0064.TAX_2) * 0.01) '
      
        '                      ELSE dbo.data0578.Price / dbo.data0060.EXC' +
        'H_RATE END END AS Price, dbo.Data0579.PriceName, d5b.EMPLOYEE_NA' +
        'ME AS SALES_REP_NAME, '
      
        '                      dbo.Data0060.PART_PRICE, dbo.Data0060.PART' +
        'S_ALLOC / dbo.Data0060.EXCH_RATE AS PARTS_ALLOC, dbo.Data0115.SR' +
        'CE_PTR'
      'FROM         dbo.data0439 LEFT OUTER JOIN'
      
        '                      dbo.Data0112 ON dbo.data0439.invoice_ptr =' +
        ' dbo.Data0112.RKEY LEFT OUTER JOIN'
      '                      dbo.Data0005 AS d5a INNER JOIN'
      
        '                      dbo.Data0114 ON d5a.RKEY = dbo.Data0114.EM' +
        'PL_PTR INNER JOIN'
      
        '                      dbo.Data0115 ON dbo.Data0114.RKEY = dbo.Da' +
        'ta0115.SRCE_PTR ON dbo.Data0112.RKEY = dbo.Data0115.INV_PTR LEFT' +
        ' OUTER JOIN'
      '                      dbo.Data0060 INNER JOIN'
      
        '                      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Da' +
        'ta0064.SO_PTR INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0578 ON dbo.Data0060.RKEY = dbo.Da' +
        'ta0578.d60_Ptr INNER JOIN'
      
        '                      dbo.Data0579 ON dbo.Data0578.d579_Ptr = db' +
        'o.Data0579.Rkey INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY ON dbo.data0439.rkey = dbo.Data0064.packing_' +
        'list_ptr LEFT OUTER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS d5b ON dbo.Data0060.COMM_A' +
        'SSIGNED_BY_E_P = d5b.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_' +
        'ID = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0060.supplier_ptr ' +
        '= dbo.Data0023.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0085 ON dbo.Data0060.QTE_PTR = dbo' +
        '.Data0085.RKEY'
      
        'where (dbo.data0112.INVOICE_STATUS=2 or dbo.data0112.INVOICE_STA' +
        'TUS=1) and dbo.data0114.STATUS=1'
      'and dbo.data0114.TDATE>=:vDt1 and dbo.data0114.TDATE<=:vDt2')
    Left = 232
    Top = 96
    object Ado114invoice_number: TStringField
      FieldName = 'invoice_number'
      Size = 12
    end
    object Ado114delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object Ado114SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object Ado114QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object Ado114area: TFloatField
      FieldName = 'area'
      ReadOnly = True
    end
    object Ado114v_assign_type: TStringField
      FieldName = 'v_assign_type'
      ReadOnly = True
      Size = 8
    end
    object Ado114TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object Ado114dMoney: TFloatField
      FieldName = 'dMoney'
      ReadOnly = True
    end
    object Ado114RKey114: TIntegerField
      FieldName = 'RKey114'
      ReadOnly = True
    end
    object Ado114TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object Ado114REMARK: TStringField
      FieldName = 'REMARK'
      Size = 60
    end
    object Ado114INVOICE_DATE: TDateTimeField
      FieldName = 'INVOICE_DATE'
    end
    object Ado114Rkey112: TIntegerField
      FieldName = 'Rkey112'
      ReadOnly = True
    end
    object Ado114AMOUNT: TFloatField
      FieldName = 'AMOUNT'
      ReadOnly = True
    end
    object Ado114EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Ado114PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object Ado114SCH_DATE: TDateTimeField
      FieldName = 'SCH_DATE'
    end
    object Ado114PARTS_ORDERED: TFloatField
      FieldName = 'PARTS_ORDERED'
    end
    object Ado114PARTS_SHIPPED: TFloatField
      FieldName = 'PARTS_SHIPPED'
    end
    object Ado114PARTS_RETURNED: TFloatField
      FieldName = 'PARTS_RETURNED'
    end
    object Ado114RETURNED_SHIP: TIntegerField
      FieldName = 'RETURNED_SHIP'
    end
    object Ado114total_shipped: TFloatField
      FieldName = 'total_shipped'
      ReadOnly = True
    end
    object Ado114parts_margin: TFloatField
      FieldName = 'parts_margin'
      ReadOnly = True
    end
    object Ado114v_status: TStringField
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
    object Ado114v_type: TStringField
      FieldName = 'v_type'
      ReadOnly = True
      Size = 6
    end
    object Ado114v_kind: TStringField
      FieldName = 'v_kind'
      ReadOnly = True
      Size = 4
    end
    object Ado114LAYERS: TWordField
      FieldName = 'LAYERS'
    end
    object Ado114REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      Size = 30
    end
    object Ado114CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object Ado114CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object Ado114MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object Ado114MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object Ado114ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
      Size = 30
    end
    object Ado114REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object Ado114QTY_ON_HAND: TIntegerField
      FieldName = 'QTY_ON_HAND'
    end
    object Ado114set_qty: TIntegerField
      FieldName = 'set_qty'
    end
    object Ado114abbrname23: TStringField
      FieldName = 'abbrname23'
      Size = 16
    end
    object Ado114ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object Ado114PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object Ado114SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
      FixedChar = True
    end
    object Ado114ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Ado114PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object Ado114Price: TFloatField
      FieldName = 'Price'
      ReadOnly = True
    end
    object Ado114PriceName: TStringField
      FieldName = 'PriceName'
    end
    object Ado114SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
    object Ado114PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object Ado114PARTS_ALLOC: TFloatField
      FieldName = 'PARTS_ALLOC'
      ReadOnly = True
    end
    object Ado114POSTED_DATE: TDateTimeField
      FieldName = 'POSTED_DATE'
    end
    object Ado114rate_margin: TBCDField
      FieldName = 'rate_margin'
      Precision = 6
      Size = 2
    end
    object Ado114AMOUNT2: TFloatField
      FieldName = 'AMOUNT2'
      ReadOnly = True
    end
    object Ado114CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Ado114EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
    object Ado114SRCE_PTR: TIntegerField
      FieldName = 'SRCE_PTR'
    end
    object Ado114PARTS_ALLOC_1: TFloatField
      FieldName = 'PARTS_ALLOC_1'
      ReadOnly = True
    end
    object Ado114RUSH_CHARGE: TBCDField
      FieldName = 'RUSH_CHARGE'
      Precision = 5
      Size = 2
    end
  end
  object ado114s: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'SELECT  dbo.data0112.invoice_number,dbo.data0439.delivery_no,dbo' +
        '.Data0060.SALES_ORDER,dbo.Data0064.QUAN_SHIPPED, dbo.Data0064.QU' +
        'AN_SHIPPED * dbo.Data0025.unit_sq AS area,  '
      
        #9#9'CASE dbo.Data0114.TTYPE WHEN 1 THEN '#39#29616#38134#25910#27454#39' WHEN 5 THEN '#39#36716#24080#25910#27454#39' ' +
        'END AS v_assign_type,dbo.data0064.TAX_2,dbo.data0112.POSTED_DATE' +
        ',dbo.data0085.rate_margin,'
      
        '        case dbo.data0060.tax_in_price when '#39'N'#39' then (dbo.Data00' +
        '64.QUAN_SHIPPED* dbo.data0578.Price)/dbo.data0060.EXCH_RATE'
      
        #9#9'when '#39'Y'#39' then case dbo.data0001.CURR_CODE when '#39'RMB'#39' then ((db' +
        'o.Data0064.QUAN_SHIPPED* dbo.data0578.Price)/dbo.data0060.EXCH_R' +
        'ATE)/((100+dbo.data0064.TAX_2)*0.01) '
      
        'else (dbo.Data0064.QUAN_SHIPPED* dbo.data0578.Price)/dbo.data006' +
        '0.EXCH_RATE end end as dMoney,'
      
        '        case dbo.data0060.tax_in_price when '#39'Y'#39' then dbo.Data006' +
        '4.QUAN_SHIPPED* dbo.data0578.Price'
      
        #9#9'when '#39'N'#39' then case dbo.data0001.CURR_CODE when '#39'RMB'#39' then ((db' +
        'o.Data0064.QUAN_SHIPPED* dbo.data0578.Price)*((100+dbo.data0064.' +
        'TAX_2)*0.01)) '
      
        'else dbo.Data0064.QUAN_SHIPPED* dbo.data0578.Price end end as AM' +
        'OUNT2,'
      
        #9#9'dbo.data0114.RKey as RKey114,dbo.Data0114.TDATE, dbo.Data0114.' +
        'REMARK,dbo.data0112.INVOICE_DATE,dbo.data0112.RKey as Rkey112,'
      
        '        case dbo.data0064.prod_tax_flag when '#39'N'#39' then Round((dbo' +
        '.data0115.AMOUNT/dbo.data0060.EXCH_RATE),4) when '#39'Y'#39' then case d' +
        'bo.data0001.CURR_CODE when '#39'RMB'#39' then Round(((dbo.data0115.AMOUN' +
        'T/dbo.data0060.EXCH_RATE)/((100+dbo.data0064.TAX_2)*0.01)),4) el' +
        'se Round((dbo.data0115.AMOUNT/dbo.data0060.EXCH_RATE),4) end end' +
        ' as AMOUNT,'
      
        #9#9'd5a.EMPLOYEE_NAME, dbo.Data0097.PO_NUMBER, dbo.Data0060.SCH_DA' +
        'TE, dbo.Data0060.PARTS_ORDERED, dbo.Data0060.PARTS_SHIPPED, dbo.' +
        'Data0060.PARTS_RETURNED, dbo.Data0060.RETURNED_SHIP, '
      
        #9#9'dbo.Data0060.PARTS_SHIPPED - dbo.Data0060.PARTS_RETURNED + dbo' +
        '.Data0060.RETURNED_SHIP AS total_shipped, '
      
        #9#9'dbo.Data0060.PARTS_ORDERED - dbo.Data0060.PARTS_SHIPPED + dbo.' +
        'Data0060.PARTS_RETURNED - dbo.Data0060.RETURNED_SHIP AS parts_ma' +
        'rgin, '
      
        #9#9'CASE dbo.Data0060.status WHEN 1 THEN '#39#26377#25928#39' WHEN 2 THEN '#39#26242#32531#39' WHE' +
        'N 3 THEN '#39#20851#38381#39' WHEN 4 THEN '#39#23436#25104#39' WHEN 5 THEN '#39#21462#28040#39' WHEN 6 THEN '#39#26410#25552#20132 +
        #39' END AS v_status,'
      
        #9#9'CASE dbo.Data0060.so_tp WHEN 0 THEN '#39#33258#21046#39' WHEN 1 THEN '#39#22806#21457#39' WHEN' +
        ' 2 THEN '#39#21322#21046#31243#39' END AS v_type,'
      
        #9#9'CASE dbo.Data0060.commision_on_tooling WHEN '#39'Y'#39' THEN '#39#36716#21378#39' WHEN' +
        ' '#39'N'#39' THEN '#39#20869#38144#39' END AS v_kind,  dbo.data0025.LAYERS, '
      
        #9#9'dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTOMER_NAME, dbo.Data00' +
        '25.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, dbo.Data0025.A' +
        'NALYSIS_CODE_1, '
      
        #9#9'dbo.Data0025.REPORT_UNIT_VALUE1, dbo.Data0025.QTY_ON_HAND, dbo' +
        '.Data0025.set_qty, dbo.Data0023.ABBR_NAME AS abbrname23, dbo.Dat' +
        'a0060.ENT_DATE,  '
      
        #9#9'dbo.Data0097.PO_DATE, dbo.Data0060.SHIPPING_METHOD, dbo.Data00' +
        '15.ABBR_NAME, dbo.data0008.PRODUCT_NAME,dbo.data0001.CURR_CODE,d' +
        'bo.data0060.EXCH_RATE,'
      
        '        case dbo.data0060.tax_in_price when '#39'N'#39' then dbo.data057' +
        '8.Price/dbo.data0060.EXCH_RATE when '#39'Y'#39' then case dbo.data0001.C' +
        'URR_CODE when '#39'RMB'#39' then'
      
        ' (dbo.data0578.Price/dbo.data0060.EXCH_RATE)/((100+dbo.data0064.' +
        'TAX_2)*0.01) else dbo.data0578.Price/dbo.data0060.EXCH_RATE end ' +
        'end as Price,'
      
        '        dbo.data0579.PriceName,d5b.EMPLOYEE_NAME as SALES_REP_NA' +
        'ME,dbo.data0060.PART_PRICE,dbo.Data0060.PARTS_ALLOC/dbo.data0060' +
        '.EXCH_RATE as PARTS_ALLOC  '
      'FROM  dbo.Data0114 INNER JOIN '
      
        #9#9'dbo.Data0115 ON dbo.Data0114.RKEY = dbo.Data0115.SRCE_PTR INNE' +
        'R JOIN'
      
        #9#9'dbo.Data0112 ON dbo.Data0115.INV_PTR = dbo.Data0112.RKEY left ' +
        'outer join'
      
        #9#9'dbo.data0439 ON dbo.Data0112.RKEY = dbo.data0439.invoice_ptr l' +
        'eft outer join'
      
        #9#9'dbo.Data0064 ON dbo.data0439.rkey=dbo.Data0064.packing_list_pt' +
        'r INNER JOIN'
      
        #9#9'dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER ' +
        'JOIN'
      
        #9#9'dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY' +
        ' LEFT OUTER JOIN'
      
        #9#9'dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY' +
        ' INNER JOIN'
      
        #9#9'dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097' +
        '.RKEY INNER JOIN'
      
        #9#9'dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR = dbo.Data0010.RKEY ' +
        'left JOIN'
      
        #9#9'dbo.Data0005 d5b ON dbo.Data0060.COMM_ASSIGNED_BY_E_P = d5b.RK' +
        'EY LEFT OUTER JOIN'
      
        #9#9'dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data0015.RK' +
        'EY LEFT OUTER JOIN'
      
        #9#9'dbo.Data0023 ON dbo.Data0060.supplier_ptr = dbo.Data0023.RKEY ' +
        'inner join'
      
        #9#9'dbo.Data0578 ON dbo.Data0060.RKEY = dbo.Data0578.d60_Ptr INNER' +
        ' JOIN'
      
        #9#9'dbo.Data0579 ON dbo.Data0578.d579_Ptr = dbo.Data0579.Rkey inne' +
        'r join'
      
        #9#9'dbo.Data0005 d5a ON dbo.Data0114.EMPL_PTR = d5a.RKEY inner joi' +
        'n'
      
        #9#9'dbo.data0001 on dbo.data0060.CURRENCY_PTR=dbo.data0001.RKey le' +
        'ft outer join'
      '        dbo.data0085 on dbo.data0060.QTE_PTR=dbo.data0085.Rkey'
      
        'where (dbo.data0112.INVOICE_STATUS=2 or dbo.data0112.INVOICE_STA' +
        'TUS=1) and dbo.data0114.STATUS=1'
      'and dbo.data0114.TDATE>=:vDt1 and dbo.data0114.TDATE<=:vDt2')
    Left = 200
    Top = 40
  end
  object ado114ss: TADOQuery
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     dbo.Data0112.invoice_number, dbo.data0439.delivery_no' +
        ', dbo.Data0060.SALES_ORDER, dbo.Data0064.QUAN_SHIPPED, '
      
        '                      dbo.Data0064.QUAN_SHIPPED * dbo.Data0025.u' +
        'nit_sq AS area, '
      
        '                      CASE dbo.Data0114.TTYPE WHEN 1 THEN '#39#29616#38134#25910#27454#39 +
        ' WHEN 5 THEN '#39#36716#24080#25910#27454#39' END AS v_assign_type, dbo.Data0064.TAX_2, '
      
        '                      dbo.Data0112.POSTED_DATE, dbo.Data0085.rat' +
        'e_margin, '
      
        '                      CASE dbo.data0060.tax_in_price WHEN '#39'N'#39' TH' +
        'EN (dbo.Data0064.QUAN_SHIPPED * dbo.data0578.Price) '
      
        '                      / dbo.data0060.EXCH_RATE WHEN '#39'Y'#39' THEN CAS' +
        'E dbo.data0001.CURR_CODE WHEN '#39'RMB'#39' THEN ((dbo.Data0064.QUAN_SHI' +
        'PPED * dbo.data0578.Price)'
      
        '                       / dbo.data0060.EXCH_RATE) / ((100 + dbo.d' +
        'ata0064.TAX_2) * 0.01) ELSE (dbo.Data0064.QUAN_SHIPPED * dbo.dat' +
        'a0578.Price) '
      
        '                      / dbo.data0060.EXCH_RATE END END AS dMoney' +
        ', '
      
        '                      CASE dbo.data0060.tax_in_price WHEN '#39'Y'#39' TH' +
        'EN dbo.Data0064.QUAN_SHIPPED * dbo.data0578.Price WHEN '#39'N'#39' THEN ' +
        'CASE dbo.data0001.CURR_CODE'
      
        '                       WHEN '#39'RMB'#39' THEN ((dbo.Data0064.QUAN_SHIPP' +
        'ED * dbo.data0578.Price) * ((100 + dbo.data0064.TAX_2) * 0.01)) '
      
        '                      ELSE dbo.Data0064.QUAN_SHIPPED * dbo.data0' +
        '578.Price END END AS AMOUNT2, dbo.Data0114.RKEY AS RKey114, dbo.' +
        'Data0114.TDATE, '
      
        '                      dbo.Data0114.REMARK, dbo.Data0112.INVOICE_' +
        'DATE, dbo.Data0112.RKEY AS Rkey112, '
      
        '                      CASE dbo.data0064.prod_tax_flag WHEN '#39'N'#39' T' +
        'HEN Round((dbo.data0115.AMOUNT / dbo.data0060.EXCH_RATE), 4) '
      
        '                      WHEN '#39'Y'#39' THEN CASE dbo.data0001.CURR_CODE ' +
        'WHEN '#39'RMB'#39' THEN Round(((dbo.data0115.AMOUNT / dbo.data0060.EXCH_' +
        'RATE) '
      
        '                      / ((100 + dbo.data0064.TAX_2) * 0.01)), 4)' +
        ' ELSE Round((dbo.data0115.AMOUNT / dbo.data0060.EXCH_RATE), 4) E' +
        'ND END AS AMOUNT, '
      
        '                      d5a.EMPLOYEE_NAME, dbo.Data0097.PO_NUMBER,' +
        ' dbo.Data0060.SCH_DATE, dbo.Data0060.PARTS_ORDERED, dbo.Data0060' +
        '.PARTS_SHIPPED, '
      
        '                      dbo.Data0060.PARTS_RETURNED, dbo.Data0060.' +
        'RETURNED_SHIP, '
      
        '                      dbo.Data0060.PARTS_SHIPPED - dbo.Data0060.' +
        'PARTS_RETURNED + dbo.Data0060.RETURNED_SHIP AS total_shipped, '
      
        '                      dbo.Data0060.PARTS_ORDERED - dbo.Data0060.' +
        'PARTS_SHIPPED + dbo.Data0060.PARTS_RETURNED - dbo.Data0060.RETUR' +
        'NED_SHIP AS parts_margin,'
      
        '                       CASE dbo.Data0060.status WHEN 1 THEN '#39#26377#25928#39 +
        ' WHEN 2 THEN '#39#26242#32531#39' WHEN 3 THEN '#39#20851#38381#39' WHEN 4 THEN '#39#23436#25104#39' WHEN 5 THEN ' +
        #39#21462#28040#39' WHEN 6 THEN'
      
        '                       '#39#26410#25552#20132#39' END AS v_status, CASE dbo.Data0060.' +
        'so_tp WHEN 0 THEN '#39#33258#21046#39' WHEN 1 THEN '#39#22806#21457#39' WHEN 2 THEN '#39#21322#21046#31243#39' END AS' +
        ' v_type, '
      
        '                      CASE dbo.Data0060.commision_on_tooling WHE' +
        'N '#39'Y'#39' THEN '#39#36716#21378#39' WHEN '#39'N'#39' THEN '#39#20869#38144#39' END AS v_kind, dbo.Data0025.L' +
        'AYERS, '
      
        '                      dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTO' +
        'MER_NAME, dbo.Data0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_' +
        'DESC, '
      
        '                      dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025' +
        '.REPORT_UNIT_VALUE1, dbo.Data0025.QTY_ON_HAND, dbo.Data0025.set_' +
        'qty, '
      
        '                      dbo.Data0023.ABBR_NAME AS abbrname23, dbo.' +
        'Data0060.ENT_DATE, dbo.Data0097.PO_DATE, dbo.Data0060.SHIPPING_M' +
        'ETHOD, '
      
        '                      dbo.Data0015.ABBR_NAME, dbo.Data0008.PRODU' +
        'CT_NAME, dbo.Data0001.CURR_CODE, dbo.Data0060.EXCH_RATE, '
      
        '                      CASE dbo.data0060.tax_in_price WHEN '#39'N'#39' TH' +
        'EN dbo.data0578.Price / dbo.data0060.EXCH_RATE WHEN '#39'Y'#39' THEN CAS' +
        'E dbo.data0001.CURR_CODE WHEN'
      
        '                       '#39'RMB'#39' THEN (dbo.data0578.Price / dbo.data' +
        '0060.EXCH_RATE) / ((100 + dbo.data0064.TAX_2) * 0.01) '
      
        '                      ELSE dbo.data0578.Price / dbo.data0060.EXC' +
        'H_RATE END END AS Price, dbo.Data0579.PriceName, d5b.EMPLOYEE_NA' +
        'ME AS SALES_REP_NAME, '
      
        '                      dbo.Data0060.PART_PRICE, dbo.Data0060.PART' +
        'S_ALLOC / dbo.Data0060.EXCH_RATE AS PARTS_ALLOC, dbo.Data0115.SR' +
        'CE_PTR'
      'FROM         dbo.data0439 LEFT OUTER JOIN'
      
        '                      dbo.Data0112 ON dbo.data0439.invoice_ptr =' +
        ' dbo.Data0112.RKEY LEFT OUTER JOIN'
      '                      dbo.Data0005 AS d5a INNER JOIN'
      
        '                      dbo.Data0114 ON d5a.RKEY = dbo.Data0114.EM' +
        'PL_PTR INNER JOIN'
      
        '                      dbo.Data0115 ON dbo.Data0114.RKEY = dbo.Da' +
        'ta0115.SRCE_PTR ON dbo.Data0112.RKEY = dbo.Data0115.INV_PTR LEFT' +
        ' OUTER JOIN'
      '                      dbo.Data0060 INNER JOIN'
      
        '                      dbo.Data0064 ON dbo.Data0060.RKEY = dbo.Da' +
        'ta0064.SO_PTR INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.Data0060.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0578 ON dbo.Data0060.RKEY = dbo.Da' +
        'ta0578.d60_Ptr INNER JOIN'
      
        '                      dbo.Data0579 ON dbo.Data0578.d579_Ptr = db' +
        'o.Data0579.Rkey INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY ON dbo.data0439.rkey = dbo.Data0064.packing_' +
        'list_ptr LEFT OUTER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0005 AS d5b ON dbo.Data0060.COMM_A' +
        'SSIGNED_BY_E_P = d5b.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0060.SHIP_REG_TAX_' +
        'ID = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0060.supplier_ptr ' +
        '= dbo.Data0023.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0085 ON dbo.Data0060.QTE_PTR = dbo' +
        '.Data0085.RKEY'
      
        'where (dbo.data0112.INVOICE_STATUS=2 or dbo.data0112.INVOICE_STA' +
        'TUS=1) and dbo.data0114.STATUS=1'
      'and dbo.data0114.TDATE>=:vDt1 and dbo.data0114.TDATE<=:vDt2')
    Left = 264
    Top = 40
  end
end
