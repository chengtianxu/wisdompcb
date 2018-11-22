object DM: TDM
  OldCreateOrder = False
  Left = 531
  Top = 239
  Height = 334
  Width = 379
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 8
  end
  object ADOQ416: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADOQ416AfterScroll
    AfterScroll = ADOQ416AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT data0416.*,Data0005.EMPLOYEE_NAME,data0034.dept_code,data' +
        '0034.dept_name     '
      'FROM data0416  inner join'
      
        '      Data0005 ON data0416.empl_ptr = Data0005.RKEY inner join d' +
        'ata0034 on data0416.dept_ptr=data0034.rkey')
    Left = 40
    Top = 64
    object ADOQ416rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQ416number: TStringField
      DisplayLabel = #20837#24211#21333#21495
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
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'sys_date'
    end
    object ADOQ416warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object ADOQ416dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADOQ416quantity: TBCDField
      DisplayLabel = #20837#24211#24635#25968
      FieldName = 'quantity'
      Precision = 11
      Size = 3
    end
    object ADOQ416reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 50
    end
    object ADOQ416so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADOQ416EMPLOYEE_NAME: TStringField
      DisplayLabel = #20837#24211#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQ416dept_code: TStringField
      DisplayLabel = #21046#36896#37096#38376#20195#30721
      FieldName = 'dept_code'
      Size = 10
    end
    object ADOQ416dept_name: TStringField
      DisplayLabel = #21046#36896#37096#38376#21517#31216
      FieldName = 'dept_name'
      Size = 30
    end
  end
  object Tmp: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    Left = 96
    Top = 232
  end
  object ADOQ53: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey416'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0053.*, dbo.Data0016.CODE, dbo.Data0016.LOCAT' +
        'ION, dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, '
      
        '                      dbo.Data0008.PRODUCT_DESC,dbo.data0492.CUT' +
        '_NO,dbo.Data0008.remark remark8'
      'FROM         dbo.Data0053 INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo' +
        '.Data0016.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0053.CUST_PART_PTR' +
        ' = dbo.Data0008.RKEY INNER JOIN'
      
        '                      dbo.data0492 ON dbo.Data0053.mo_ptr = dbo.' +
        'data0492.rkey'
      
        'where Data0053.NPAD_PTR = :rkey416  order by dbo.Data0008.PROD_C' +
        'ODE')
    Left = 40
    Top = 144
    object ADOQ53RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ53NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object ADOQ53LOC_PTR: TIntegerField
      FieldName = 'LOC_PTR'
    end
    object ADOQ53CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADOQ53mo_ptr: TIntegerField
      FieldName = 'mo_ptr'
    end
    object ADOQ53QUANTITY: TBCDField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 2
    end
    object ADOQ53REFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
    end
    object ADOQ53CODE: TStringField
      DisplayLabel = #20179#24211#20195#30721
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ADOQ53LOCATION: TStringField
      DisplayLabel = #20179#24211#21517#31216
      FieldName = 'LOCATION'
      Size = 10
    end
    object ADOQ53PROD_CODE: TStringField
      DisplayLabel = #20135#21697#32534#30721
      DisplayWidth = 25
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ADOQ53PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADOQ53PRODUCT_DESC: TStringField
      DisplayLabel = #20135#21697#35268#26684
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
    object ADOQ53CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQ53remark8: TMemoField
      FieldName = 'remark8'
      BlobType = ftMemo
    end
  end
  object DS1: TDataSource
    DataSet = ADOQ416
    Left = 104
    Top = 72
  end
  object DS2: TDataSource
    DataSet = ADOQ53
    Left = 104
    Top = 144
  end
  object ADO416_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQ416AfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM data0416  where 1=2'
      ' '
      ' ')
    Left = 184
    Top = 72
  end
  object ADO53_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterScroll = ADOQ416AfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM data0053  where 1=2')
    Left = 184
    Top = 144
  end
end
