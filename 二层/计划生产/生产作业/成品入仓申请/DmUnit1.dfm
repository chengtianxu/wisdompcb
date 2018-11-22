object DM: TDM
  OldCreateOrder = False
  Left = 491
  Top = 190
  Height = 457
  Width = 503
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 24
  end
  object TemADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Prepared = True
    Left = 56
    Top = 168
  end
  object ADOQS0056: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT TOP 100 PERCENT Data0025.MANU_PART_NUMBER, '
      '      Data0025.MANU_PART_DESC, '
      '    SUM(Data0056.TO_BE_STOCKED)  AS qty,'
      '    SUM(Data0056.TO_BE_CANCD)  AS qty_panel,'
      
        '   SUM(Data0056.TO_BE_STOCKED*data0025.unit_sq)  AS sq,data0056.' +
        'po_number'
      'FROM Data0056 INNER JOIN'
      '      Data0006 ON Data0056.WO_PTR = Data0006.RKEY INNER JOIN'
      '      Data0025 ON Data0006.BOM_PTR = Data0025.RKEY'
      'WHERE (Data0025.PARENT_PTR IS NULL) '
      
        'GROUP BY Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,data' +
        '0056.po_number'
      'HAVING (SUM(Data0056.TO_BE_STOCKED) > 0)'
      'ORDER BY Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC')
    Left = 233
    Top = 88
    object ADOQS0056MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQS0056MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQS0056qty: TFloatField
      DisplayLabel = #25552#20132'pcs'#24635#25968
      FieldName = 'qty'
    end
    object ADOQS0056qty_panel: TIntegerField
      DisplayLabel = #25552#20132'panel'#24635#25968
      FieldName = 'qty_panel'
      ReadOnly = True
    end
    object ADOQS0056sq: TFloatField
      DisplayLabel = #38754#31215
      FieldName = 'sq'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object ADOQS0056po_number: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'po_number'
      Size = 25
    end
  end
  object ADOQD0056: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT     TOP (100) PERCENT dbo.Data0025.MANU_PART_NUMBER,'
      
        '        dbo.Data0025.MANU_PART_DESC, dbo.data0025.REPORT_UNIT_VA' +
        'LUE1,dbo.Data0056.TO_BE_STOCKED,'
      
        '     dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0056.tobestock_date' +
        ','
      
        '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0056.QTY_BACKLOG, dbo.' +
        'Data0056.RKEY,'
      
        '     dbo.Data0056.TO_BE_CANCD, dbo.Data0056.PANELS,data0056.UNIT' +
        '_PTR,'
      
        '      dbo.Data0015.ABBR_NAME, dbo.Data0056.PO_NUMBER , dbo.Data0' +
        '056.REFERENCE'
      'FROM         dbo.Data0056 INNER JOIN'
      
        '          dbo.Data0006 ON dbo.Data0056.WO_PTR = dbo.Data0006.RKE' +
        'Y INNER JOIN'
      
        '          dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data0025.RK' +
        'EY LEFT OUTER JOIN'
      
        '          dbo.Data0005 ON dbo.Data0056.EMPLOYEE_PTR = dbo.Data00' +
        '05.RKEY INNER JOIN'
      
        '          dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT' +
        '_NO INNER JOIN'
      
        '          dbo.Data0015 ON dbo.Data0056.LOC_PTR = dbo.Data0015.RK' +
        'EY'
      
        'WHERE     (dbo.Data0025.PARENT_PTR IS NULL) AND (dbo.Data0056.TO' +
        '_BE_STOCKED > 0)')
    Left = 136
    Top = 88
    object ADOQD0056MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQD0056MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQD0056WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOQD0056EMPLOYEE_NAME: TStringField
      DisplayLabel = #25552#20132#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQD0056tobestock_date: TDateTimeField
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'tobestock_date'
    end
    object ADOQD0056TO_BE_STOCKED: TFloatField
      DisplayLabel = #24453#20837#20179#25968'pcs'
      FieldName = 'TO_BE_STOCKED'
    end
    object ADOQD0056qty_backlog: TFloatField
      DisplayLabel = #22312#32447#25968#37327
      FieldName = 'qty_backlog'
    end
    object ADOQD0056rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQD0056to_be_cancd: TIntegerField
      DisplayLabel = #24453#20837#24211'panel'
      FieldName = 'to_be_cancd'
    end
    object ADOQD0056panels: TIntegerField
      FieldName = 'panels'
    end
    object ADOQD0056abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQD0056po_number: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'po_number'
      Size = 25
    end
    object ADOQD0056REFERENCE: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE'
    end
    object ADOQD0056REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object ADOQD0056UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
  end
  object ADOQALL2: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT dbo.Data0056.RKEY, dbo.Data0025.MANU_PART_NUMBER, dbo.Dat' +
      'a0025.MANU_PART_DESC, dbo.Data0025.REPORT_UNIT_VALUE1, '#13#10'      d' +
      'bo.Data0006.WORK_ORDER_NUMBER, dbo.Data0034.DEPT_NAME, dbo.Data0' +
      '056.INTIME, '#13#10'      dbo.Data0056.QTY_BACKLOG - dbo.Data0006.QUAN' +
      '_ALLREJ AS QTYBACKLOG, dbo.Data0056.QTY_BACKLOG, dbo.Data0056.PA' +
      'NELS, dbo.Data0056.UNIT_PTR, '#13#10'      dbo.Data0056.FLOW_NO, dbo.D' +
      'ata0056.STEP, dbo.Data0025.RKEY AS data0025_rkey, dbo.Data0056.T' +
      'O_BE_STOCKED, dbo.Data0056.tobestock_date, '#13#10'      dbo.Data0056.' +
      'EMPLOYEE_PTR, dbo.Data0025.ANCESTOR_PTR, dbo.Data0056.WO_PTR, db' +
      'o.Data0056.DEPT_PTR, '#13#10'      dbo.Data0056.PANELS - dbo.Data0006.' +
      'QUAN_ALLPNL AS allPANELS, dbo.Data0025.ttype, '#13#10'      dbo.Data00' +
      '60.PARTS_ORDERED + dbo.Data0060.PARTS_RETURNED - dbo.Data0060.PA' +
      'RTS_SHIPPED - dbo.Data0060.RETURNED_SHIP AS own, '#13#10'      dbo.Dat' +
      'a0006.QUAN_ALLREJ, dbo.Data0056.TO_BE_CANCD, dbo.Data0006.QUAN_A' +
      'LLPNL, dbo.Data0006.PARTS_PER_PANEL, dbo.Data0015.ABBR_NAME, '#13#10' ' +
      '     dbo.Data0056.REFERENCE, dbo.Data0056.QTY_BACKLOG * dbo.Data' +
      '0025.unit_sq AS Sq, dbo.Data0060.SALES_ORDER, dbo.Data0097.PO_NU' +
      'MBER, '#13#10'      dbo.data0492.CUT_NO, dbo.data0492.PLANNED_QTY, dbo' +
      '.data0492.ISSUED_QTY, dbo.data0492.FG_QTY, dbo.data0492.WIP_QTY,' +
      ' dbo.data0492.QTY_REJECT, '#13#10'      dbo.data0492.ORD_REQ_QTY, dbo.' +
      'data0492.waitfor_release, dbo.Data0056.PO_NUMBER AS po_number56,' +
      ' dbo.Data0060.RKEY AS rkey60, '#13#10'      CASE WHEN data0060.custome' +
      'r_ptr IS NOT NULL THEN data0010_1.cust_code ELSE data0010.cust_c' +
      'ode END AS cust_code'#13#10'FROM  dbo.Data0056 INNER JOIN'#13#10'      dbo.D' +
      'ata0006 ON dbo.Data0056.WO_PTR = dbo.Data0006.RKEY INNER JOIN'#13#10' ' +
      '     dbo.Data0034 ON dbo.Data0056.DEPT_PTR = dbo.Data0034.RKEY I' +
      'NNER JOIN'#13#10'      dbo.Data0025 ON dbo.Data0006.BOM_PTR = dbo.Data' +
      '0025.RKEY INNER JOIN'#13#10'      dbo.data0492 ON dbo.Data0006.CUT_NO ' +
      '= dbo.data0492.CUT_NO INNER JOIN'#13#10'      dbo.Data0015 ON dbo.Data' +
      '0056.LOC_PTR = dbo.Data0015.RKEY INNER JOIN'#13#10'      dbo.Data0010 ' +
      'ON dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN' +
      #13#10'      dbo.Data0097 RIGHT OUTER JOIN'#13#10'      dbo.Data0060 ON dbo' +
      '.Data0097.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR ON dbo.data0492' +
      '.SO_NO = dbo.Data0060.SALES_ORDER LEFT OUTER JOIN'#13#10'      dbo.Dat' +
      'a0010 AS Data0010_1 ON dbo.Data0060.CUSTOMER_PTR = Data0010_1.RK' +
      'EY'#13#10'WHERE (dbo.Data0025.PARENT_PTR IS NULL) AND (dbo.Data0056.QT' +
      'Y_BACKLOG > 0) AND (dbo.Data0006.PROD_STATUS = 5) AND (dbo.Data0' +
      '006.WIPMAT_STATUS = 1)'
    IndexFieldNames = 'work_order_number'
    Parameters = <>
    Prepared = True
    Left = 40
    Top = 88
    object ADOQALL2RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQALL2MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQALL2MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQALL2WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #24037#20316#35746#21333
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOQALL2DEPT_NAME: TStringField
      DisplayLabel = #24037#24207#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQALL2INTIME: TDateTimeField
      DisplayLabel = #25509#25910#26102#38388
      FieldName = 'INTIME'
    end
    object ADOQALL2QTY_BACKLOG: TFloatField
      DisplayLabel = #22312#32447#25968#37327
      FieldName = 'QTY_BACKLOG'
    end
    object ADOQALL2FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ADOQALL2STEP: TSmallintField
      DisplayLabel = #27493#39588
      FieldName = 'STEP'
    end
    object ADOQALL2data0025_rkey: TAutoIncField
      FieldName = 'data0025_rkey'
      ReadOnly = True
    end
    object ADOQALL2TO_BE_STOCKED: TFloatField
      DisplayLabel = #24453#20837#20179#25968#37327
      FieldName = 'TO_BE_STOCKED'
    end
    object ADOQALL2tobestock_date: TDateTimeField
      FieldName = 'tobestock_date'
    end
    object ADOQALL2EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADOQALL2ANCESTOR_PTR: TIntegerField
      FieldName = 'ANCESTOR_PTR'
    end
    object ADOQALL2WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADOQALL2DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOQALL2own: TFloatField
      DisplayLabel = #27424#36135#25968
      FieldName = 'own'
      ReadOnly = True
    end
    object ADOQALL2ttype: TWordField
      FieldName = 'ttype'
    end
    object ADOQALL2QUAN_ALLREJ: TIntegerField
      FieldName = 'QUAN_ALLREJ'
    end
    object ADOQALL2QUAN_ALLPNL: TIntegerField
      FieldName = 'QUAN_ALLPNL'
    end
    object ADOQALL2TO_BE_CANCD: TIntegerField
      DisplayLabel = #24453#20837#24211'PAN'
      FieldName = 'to_be_cancd'
    end
    object ADOQALL2PANELS: TIntegerField
      DisplayLabel = #22312#32447'PAN'
      FieldName = 'PANels'
    end
    object ADOQALL2QTYBACKLOG: TFloatField
      DisplayLabel = #22312#32447#25968#37327
      FieldName = 'QTYBACKLOG'
      ReadOnly = True
    end
    object ADOQALL2allPANELS: TIntegerField
      DisplayLabel = #22312#32447'PAN'
      FieldName = 'allPANELS'
      ReadOnly = True
    end
    object ADOQALL2PARTS_PER_PANEL: TFloatField
      FieldName = 'PARTS_PER_PANEL'
    end
    object ADOQALL2abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADOQALL2REFERENCE: TStringField
      DisplayLabel = #22791#27880#29983#20135#21608#26399
      FieldName = 'REFERENCE'
    end
    object ADOQALL2Sq: TFloatField
      DisplayLabel = #22312#32447#38754#31215
      FieldName = 'Sq'
      ReadOnly = True
      DisplayFormat = '#,##0.00'
    end
    object ADOQALL2sales_order: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'sales_order'
      FixedChar = True
      Size = 12
    end
    object ADOQALL2PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQALL2cut_no: TStringField
      FieldName = 'cut_no'
      FixedChar = True
      Size = 12
    end
    object ADOQALL2issued_qty: TIntegerField
      FieldName = 'issued_qty'
    end
    object ADOQALL2FG_QTY: TIntegerField
      FieldName = 'FG_QTY'
    end
    object ADOQALL2WIP_QTY: TIntegerField
      FieldName = 'WIP_QTY'
    end
    object ADOQALL2QTY_reject: TIntegerField
      FieldName = 'QTY_reject'
    end
    object ADOQALL2waitfor_release: TIntegerField
      FieldName = 'waitfor_release'
    end
    object ADOQALL2PLANNED_QTY: TIntegerField
      FieldName = 'PLANNED_QTY'
    end
    object ADOQALL2po_number56: TStringField
      FieldName = 'po_number56'
      Size = 25
    end
    object ADOQALL2REPORT_UNIT_VALUE1: TBCDField
      FieldName = 'REPORT_UNIT_VALUE1'
      Precision = 9
    end
    object ADOQALL2ORD_REQ_QTY: TIntegerField
      DisplayLabel = #24453#35745#21010#25968
      FieldName = 'ORD_REQ_QTY'
    end
    object ADOQALL2rkey60: TAutoIncField
      FieldName = 'rkey60'
      ReadOnly = True
    end
    object ADOQALL2UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object ADOQALL2cust_code: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'cust_code'
      ReadOnly = True
      Size = 10
    end
  end
  object ADO53: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Prepared = True
    Left = 224
    Top = 264
  end
  object DataSource1: TDataSource
    DataSet = ADO53
    Left = 160
    Top = 264
  end
end
