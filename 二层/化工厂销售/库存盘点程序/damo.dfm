object dm: Tdm
  OldCreateOrder = False
  Left = 536
  Top = 322
  Height = 424
  Width = 412
  object ADOConnection1: TADOConnection
    CommandTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object ado0214: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'date1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'date2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0214.* ,dbo.Data0005.EMPLOYEE_NAME, '
      '      dbo.Data0005.EMPL_CODE,'
      
        'case dbo.data0214.status when 1 then '#39#24050#23436#25104#39' when 0 then '#39#36827#34892#20013#39' end' +
        ' as v_status'
      'FROM dbo.Data0214 INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0214.EMPLOYEE_PTR = dbo.Data0005.R' +
        'KEY'
      'where dbo.data0214.date_created between :date1 and :date2')
    Left = 176
    Top = 8
    object ado0214RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ado0214FG_COUNT_CODE: TStringField
      DisplayLabel = #30424#28857#20195#30721
      FieldName = 'FG_COUNT_CODE'
      Size = 10
    end
    object ado0214DATE_CREATED: TDateTimeField
      DisplayLabel = #26597#21019#24314#26085#26399
      FieldName = 'DATE_CREATED'
    end
    object ado0214EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ado0214BEG_LOCCODE_PTR: TIntegerField
      FieldName = 'BEG_LOCCODE_PTR'
    end
    object ado0214END_LOCCODE_PTR: TIntegerField
      FieldName = 'END_LOCCODE_PTR'
    end
    object ado0214BEG_CUSTPART_PTR: TIntegerField
      FieldName = 'BEG_CUSTPART_PTR'
    end
    object ado0214END_CUSTPART_PTR: TIntegerField
      FieldName = 'END_CUSTPART_PTR'
    end
    object ado0214STATUS: TWordField
      DisplayWidth = 1
      FieldName = 'STATUS'
      MaxValue = 1
    end
    object ado0214EMPLOYEE_NAME: TStringField
      DisplayLabel = #21019#24314#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado0214EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ado0214v_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'v_status'
      ReadOnly = True
      Size = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = ado0214
    Left = 112
    Top = 8
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 32
    Top = 64
  end
  object ADO0215: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CODE1'
        Size = -1
        Value = Null
      end
      item
        Name = 'CODE2'
        Size = -1
        Value = Null
      end
      item
        Name = 'CODE3'
        Size = -1
        Value = Null
      end
      item
        Name = 'CODE4'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.WZCP0001.rkey,dbo.WZCP0001.qty_on_hand'
      'FROM dbo.Data0007 INNER JOIN'
      '      dbo.Data0008 ON '
      '      dbo.Data0007.RKEY = dbo.Data0008.PR_GRP_POINTER INNER JOIN'
      
        '      dbo.WZCP0001 ON dbo.Data0008.RKEY = dbo.WZCP0001.proc_ptr ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.WZCP0001.location_ptr = dbo.Data0016.R' +
        'KEY'
      'where data0016.LOCATION_TYPE=1'
      'and data0007.PR_GRP_CODE >= :CODE1 '
      'and data0007.PR_GRP_CODE <= :CODE2  '
      'and data0016.CODE >= :CODE3'
      'and data0016.CODE<= :CODE4')
    Left = 112
    Top = 64
  end
  object ADOData0215: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select * from data0215'#13#10'where (fg_list_ptr=:rkey)  and  (status<' +
      '>2)'
    CommandTimeout = 25
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 112
    Top = 120
  end
  object Aq0215: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    CommandTimeout = 25
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0005.EMPLOYEE_NAME, dbo.Data0007.PRODUCT_GROUP_NA' +
        'ME, '
      
        '      dbo.Data0008.PRODUCT_NAME, dbo.Data0016.LOCATION, dbo.Data' +
        '0215.*'
      'FROM dbo.Data0007 INNER JOIN'
      '      dbo.Data0008 ON '
      '      dbo.Data0007.RKEY = dbo.Data0008.PR_GRP_POINTER INNER JOIN'
      
        '      dbo.WZCP0001 ON dbo.Data0008.RKEY = dbo.WZCP0001.proc_ptr ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.WZCP0001.location_ptr = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0215 ON dbo.WZCP0001.rkey = dbo.Data0215.wzcp0001_' +
        'PTR INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0215.counted_by_empl_ptr = dbo.Dat' +
        'a0005.RKEY'
      
        'where (dbo.Data0215.FG_LIST_PTR=:rkey) and (dbo.Data0215.status<' +
        '>2)')
    Left = 176
    Top = 64
  end
  object ADO0113: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandTimeout = 25
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0113'
      'where srce_ptr=:RKEY')
    Left = 176
    Top = 120
  end
  object checkout: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = checkoutCalcFields
    CommandTimeout = 25
    Parameters = <
      item
        Name = 'rkey'
        DataType = ftInteger
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, data0008.P' +
        'RODUCT_DESC,'
      'dbo.Data0007.PRODUCT_GROUP_NAME,'
      
        '      dbo.Data0016.LOCATION, dbo.Data0005.EMPLOYEE_NAME, dbo.Dat' +
        'a0008.new_price, '
      
        '      dbo.Data0215.old_quantity, dbo.Data0215.QUANTITY, dbo.Data' +
        '0215.status, '
      '      dbo.Data0215.check_no'
      'FROM dbo.Data0007 INNER JOIN'
      '      dbo.Data0008 ON '
      '      dbo.Data0007.RKEY = dbo.Data0008.PR_GRP_POINTER INNER JOIN'
      
        '      dbo.WZCP0001 ON dbo.Data0008.RKEY = dbo.WZCP0001.proc_ptr ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.WZCP0001.location_ptr = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0215 ON dbo.WZCP0001.rkey = dbo.Data0215.wzcp0001_' +
        'PTR INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0215.COUNTED_BY_EMPL_PTR = dbo.Dat' +
        'a0005.RKEY'
      'where data0215.fg_list_ptr=:rkey')
    Left = 104
    Top = 184
    object checkoutPROD_CODE: TStringField
      DisplayLabel = #24037#31243#32534#30721
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object checkoutPRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object checkoutPRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object checkoutPRODUCT_GROUP_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object checkoutLOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object checkoutEMPLOYEE_NAME: TStringField
      DisplayLabel = #28165#28857#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object checkoutnew_price: TBCDField
      DisplayLabel = #26368#26032#20215#26684
      FieldName = 'new_price'
      Precision = 8
      Size = 2
    end
    object checkoutold_quantity: TBCDField
      DisplayLabel = #21407#24211#23384
      FieldName = 'old_quantity'
      Precision = 10
      Size = 3
    end
    object checkoutnewquantity: TStringField
      DisplayLabel = #30424#28857#25968#37327
      FieldKind = fkCalculated
      FieldName = 'newquantity'
      Calculated = True
    end
    object checkoutv_status: TStringField
      DisplayLabel = #30424#28857#29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Calculated = True
    end
    object checkoutcheck_no: TStringField
      DisplayLabel = #30424#28857#33778#21495
      FieldName = 'check_no'
      Size = 50
    end
    object checkoutstatus: TWordField
      FieldName = 'status'
    end
    object checkoutQUANTITY: TBCDField
      DisplayLabel = #30424#28857#24211#23384
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
  end
  object difference: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    CommandTimeout = 25
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT dbo.Data0007.PRODUCT_GROUP_NAME, dbo.Data0008.PRODUCT_NAM' +
        'E, '
      
        '      dbo.Data0016.LOCATION, dbo.Data0005.EMPLOYEE_NAME, dbo.Dat' +
        'a0008.new_price, '
      '      dbo.Data0215.old_quantity, dbo.Data0215.QUANTITY, '
      
        '      (dbo.Data0215.QUANTITY-dbo.Data0215.old_quantity)as diff_s' +
        'tock,'
      
        '      (dbo.Data0215.QUANTITY-dbo.Data0215.old_quantity)*dbo.Data' +
        '0008.new_price as diff_price '
      'FROM dbo.Data0007 INNER JOIN'
      '      dbo.Data0008 ON '
      '      dbo.Data0007.RKEY = dbo.Data0008.PR_GRP_POINTER INNER JOIN'
      
        '      dbo.WZCP0001 ON dbo.Data0008.RKEY = dbo.WZCP0001.proc_ptr ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.WZCP0001.location_ptr = dbo.Data0016.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0215 ON dbo.WZCP0001.rkey = dbo.Data0215.wzcp0001_' +
        'PTR INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0215.COUNTED_BY_EMPL_PTR = dbo.Dat' +
        'a0005.RKEY'
      'WHERE (Data0215.FG_LIST_PTR = :rkey) and'
      '      (data0215.quantity-data0215.old_quantity<>0) and'
      '      (data0215.status<>0)')
    Left = 176
    Top = 184
    object differencePRODUCT_GROUP_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
    object differencePRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object differenceLOCATION: TStringField
      DisplayLabel = #25152#22312#20179#24211
      FieldName = 'LOCATION'
      Size = 10
    end
    object differenceEMPLOYEE_NAME: TStringField
      DisplayLabel = #28165#28857#20154#21592#21517#31216
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object differencenew_price: TBCDField
      DisplayLabel = #26368#26032#20215#26684
      FieldName = 'new_price'
      Precision = 8
      Size = 2
    end
    object differenceold_quantity: TBCDField
      DisplayLabel = #21407#22987#24211#23384
      FieldName = 'old_quantity'
      Precision = 10
      Size = 3
    end
    object differenceQUANTITY: TBCDField
      DisplayLabel = #30424#28857#24211#23384
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object differencediff_stock: TBCDField
      DisplayLabel = #24046#24322#24211#23384
      FieldName = 'diff_stock'
      ReadOnly = True
      Precision = 11
      Size = 3
    end
    object differencediff_price: TBCDField
      DisplayLabel = #24046#24322#20215#26684
      FieldName = 'diff_price'
      ReadOnly = True
      Precision = 20
      Size = 5
    end
  end
  object ADO493: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandTimeout = 25
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 104
    Top = 240
  end
end
