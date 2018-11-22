object DM: TDM
  OldCreateOrder = False
  Left = 361
  Top = 242
  Height = 403
  Width = 503
  object con1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object ADO0053: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0053 where rkey=null'
      '')
    Left = 40
    Top = 144
    object ADO0053RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO0053WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADO0053LOC_PTR: TIntegerField
      FieldName = 'LOC_PTR'
    end
    object ADO0053WORK_ORDER_PTR: TIntegerField
      FieldName = 'WORK_ORDER_PTR'
    end
    object ADO0053CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADO0053QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object ADO0053QTY_ON_HAND: TFloatField
      FieldName = 'QTY_ON_HAND'
    end
    object ADO0053QTY_ALLOC: TFloatField
      FieldName = 'QTY_ALLOC'
    end
    object ADO0053MFG_DATE: TDateTimeField
      FieldName = 'MFG_DATE'
    end
    object ADO0053RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ADO0053NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object ADO0053REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADO0053USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ADO0053barcode_ptr: TIntegerField
      FieldName = 'barcode_ptr'
    end
    object ADO0053DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO0053STEP: TSmallintField
      FieldName = 'STEP'
    end
    object ADO0053PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADO0053EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADO0053PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADO0053spec_place: TStringField
      FieldName = 'spec_place'
    end
  end
  object ADO0048: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0048 where rkey=null')
    Left = 96
    Top = 144
    object ADO0048RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO0048WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADO0048FM_DEPT_PTR: TIntegerField
      FieldName = 'FM_DEPT_PTR'
    end
    object ADO0048WORK_CENTER_PTR: TIntegerField
      FieldName = 'WORK_CENTER_PTR'
    end
    object ADO0048TO_DEPT_PTR: TIntegerField
      FieldName = 'TO_DEPT_PTR'
    end
    object ADO0048INTIME: TDateTimeField
      FieldName = 'INTIME'
    end
    object ADO0048OUTTIME: TDateTimeField
      FieldName = 'OUTTIME'
    end
    object ADO0048QTY_PROD: TIntegerField
      FieldName = 'QTY_PROD'
    end
    object ADO0048QTY_REJECT: TIntegerField
      FieldName = 'QTY_REJECT'
    end
    object ADO0048PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADO0048FLOW_NO: TSmallintField
      FieldName = 'FLOW_NO'
    end
    object ADO0048STEP_NO: TSmallintField
      FieldName = 'STEP_NO'
    end
    object ADO0048ACTION_REF: TStringField
      FieldName = 'ACTION_REF'
      FixedChar = True
    end
    object ADO0048EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO0048WTYPE: TWordField
      FieldName = 'WTYPE'
    end
    object ADO0048put_type: TWordField
      FieldName = 'put_type'
    end
    object ADO0048warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
  end
  object ADOQ416: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Filtered = True
    AfterScroll = ADOQ416AfterScroll
    Parameters = <
      item
        Name = 'vdate1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39083d
      end
      item
        Name = 'vdate2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 39295d
      end>
    SQL.Strings = (
      'SELECT data0416.rkey, data0416.number, data0416.type, '
      '      data0416.empl_ptr, data0416.sys_date, data0416.quantity, '
      '      data0416.reference, data0416.rma_ptr, data0416.so_ptr, '
      '      Data0005.EMPLOYEE_NAME'
      'FROM data0416 LEFT OUTER JOIN'
      '      Data0005 ON data0416.empl_ptr = Data0005.RKEY'
      'WHERE (data0416.type = 2)'
      ''
      'AND (data0416.sys_date >= :vdate1 ) '
      'and (data0416.sys_date <= :vdate2 )')
    Left = 40
    Top = 64
    object ADOQ416rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQ416number: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'number'
      Size = 15
    end
    object ADOQ416type: TWordField
      FieldName = 'type'
    end
    object ADOQ416empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADOQ416sys_date: TDateTimeField
      DisplayLabel = #26102#38388
      FieldName = 'sys_date'
    end
    object ADOQ416quantity: TIntegerField
      DisplayLabel = #24635#25968#37327
      FieldName = 'quantity'
    end
    object ADOQ416reference: TStringField
      FieldName = 'reference'
      Size = 50
    end
    object ADOQ416rma_ptr: TIntegerField
      FieldName = 'rma_ptr'
    end
    object ADOQ416so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADOQ416EMPLOYEE_NAME: TStringField
      DisplayLabel = #20837#20179#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 240
    Top = 96
  end
  object ADOQ53: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey416'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0053.RKEY, dbo.Data0053.WHSE_PTR, dbo.Data005' +
        '3.LOC_PTR, dbo.Data0053.WORK_ORDER_PTR, dbo.Data0053.CUST_PART_P' +
        'TR, '
      
        '                      dbo.Data0053.QUANTITY, dbo.Data0053.QTY_ON' +
        '_HAND, dbo.Data0053.QTY_ALLOC, dbo.Data0053.MFG_DATE, dbo.Data00' +
        '53.RMA_PTR, dbo.Data0053.NPAD_PTR, '
      
        '                      dbo.Data0053.REFERENCE_NUMBER, dbo.Data005' +
        '3.USER_DATE, dbo.Data0053.barcode_ptr, dbo.Data0053.DEPT_PTR, db' +
        'o.Data0053.STEP, dbo.Data0053.PANELS, '
      
        '                      dbo.Data0053.EMPLOYEE_PTR, dbo.Data0016.CO' +
        'DE, dbo.Data0016.LOCATION, dbo.Data0006.WORK_ORDER_NUMBER, dbo.D' +
        'ata0025.MANU_PART_NUMBER, '
      
        '                      dbo.Data0025.MANU_PART_DESC, dbo.Data0010.' +
        'CUST_CODE, dbo.Data0010.CUSTOMER_NAME, dbo.data0492.CUT_NO, dbo.' +
        'Data0053.PO_NUMBER, '
      
        '                      dbo.Data0060.SALES_ORDER AS so_no, dbo.Dat' +
        'a0053.spec_place, dbo.Data0005.EMPLOYEE_NAME'
      'FROM         dbo.Data0006 RIGHT OUTER JOIN'
      '                      dbo.data0251 INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0251.cuser_ptr = d' +
        'bo.Data0005.RKEY RIGHT OUTER JOIN'
      '                      dbo.Data0010 INNER JOIN'
      '                      dbo.Data0016 INNER JOIN'
      
        '                      dbo.Data0053 ON dbo.Data0016.RKEY = dbo.Da' +
        'ta0053.LOC_PTR INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0053.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY ON dbo.Data0010.RKEY = dbo.Data0025.CUSTOME' +
        'R_PTR ON '
      
        '                      dbo.data0251.D53_ptr = dbo.Data0053.RKEY L' +
        'EFT OUTER JOIN'
      
        '                      dbo.Data0060 ON dbo.Data0053.barcode_ptr =' +
        ' dbo.Data0060.RKEY ON dbo.Data0006.RKEY = dbo.Data0053.WORK_ORDE' +
        'R_PTR LEFT OUTER JOIN'
      
        '                      dbo.data0492 ON dbo.Data0006.CUT_NO = dbo.' +
        'data0492.CUT_NO'
      ''
      
        'where Data0053.NPAD_PTR = :rkey416 order by Data0025.MANU_PART_N' +
        'UMBER')
    Left = 104
    Top = 64
    object ADOQ53MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQ53MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQ53CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQ53CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOQ53CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQ53SO_NO: TStringField
      DisplayLabel = #35746#21333#21495
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQ53WORK_ORDER_NUMBER: TStringField
      DisplayLabel = #20316#19994#21333#21495
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object ADOQ53QUANTITY: TFloatField
      DisplayLabel = #20837#20179#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADOQ53MFG_DATE: TDateTimeField
      DisplayLabel = #20837#20179#26085#26399
      FieldName = 'MFG_DATE'
    end
    object ADOQ53CODE: TStringField
      DisplayLabel = #20179#24211#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADOQ53LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
    end
    object ADOQ53REFERENCE_NUMBER: TStringField
      DisplayLabel = #20301#32622
      FieldName = 'REFERENCE_NUMBER'
    end
    object ADOQ53RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ53WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADOQ53LOC_PTR: TIntegerField
      FieldName = 'LOC_PTR'
    end
    object ADOQ53WORK_ORDER_PTR: TIntegerField
      FieldName = 'WORK_ORDER_PTR'
    end
    object ADOQ53CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADOQ53QTY_ON_HAND: TFloatField
      FieldName = 'QTY_ON_HAND'
    end
    object ADOQ53QTY_ALLOC: TFloatField
      FieldName = 'QTY_ALLOC'
    end
    object ADOQ53RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ADOQ53NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object ADOQ53USER_DATE: TDateTimeField
      FieldName = 'USER_DATE'
    end
    object ADOQ53barcode_ptr: TIntegerField
      FieldName = 'barcode_ptr'
    end
    object ADOQ53DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADOQ53STEP: TSmallintField
      FieldName = 'STEP'
    end
    object ADOQ53PANELS: TIntegerField
      FieldName = 'PANELS'
    end
    object ADOQ53EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADOQ53po_number: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'po_number'
      Size = 25
    end
    object ADOQ53spec_place: TStringField
      DisplayLabel = #20855#20307#20301#32622
      FieldName = 'spec_place'
    end
    object ADOQ53EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
end
