object DM: TDM
  OldCreateOrder = False
  Left = 583
  Top = 242
  Height = 375
  Width = 336
  object ADOCon: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=172.1' +
      '6.68.8'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 168
    Top = 280
  end
  object DS1: TDataSource
    DataSet = ADO416
    Left = 8
    Top = 88
  end
  object DS2: TDataSource
    DataSet = ADO53
    Left = 8
    Top = 155
  end
  object ADO416: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ADO416AfterScroll
    AfterScroll = ADO416AfterScroll
    Parameters = <>
    SQL.Strings = (
      'SELECT     dbo.data0416.*, '
      '         case when dbo.data0416.status=0 then '#39#26410#25552#20132#39
      '                 when dbo.data0416.status=1 then '#39#24453#23457#26680#39
      '                 when dbo.data0416.status=2 then '#39#24050#20837#24211#39
      
        '                 when dbo.data0416.status=3 then '#39#34987#36864#22238#39' end statu' +
        's_c,'
      '          dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME'
      'FROM         dbo.data0416 INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0416.empl_ptr = db' +
        'o.Data0005.RKEY')
    Left = 56
    Top = 88
    object ADO416rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO416number: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'number'
      Size = 15
    end
    object ADO416type: TWordField
      FieldName = 'type'
    end
    object ADO416empl_ptr: TIntegerField
      FieldName = 'empl_ptr'
    end
    object ADO416sys_date: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'sys_date'
    end
    object ADO416quantity: TIntegerField
      DisplayLabel = #24635#25968#37327
      FieldName = 'quantity'
    end
    object ADO416reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 50
    end
    object ADO416rma_ptr: TIntegerField
      FieldName = 'rma_ptr'
    end
    object ADO416so_ptr: TIntegerField
      FieldName = 'so_ptr'
    end
    object ADO416status: TWordField
      FieldName = 'status'
    end
    object ADO416status_c: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADO416EMPLOYEE_NAME: TStringField
      DisplayLabel = #20837#24211#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ADO53: TADOQuery
    Connection = ADOCon
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
      
        'SELECT     dbo.Data0053.*, dbo.Data0025.MANU_PART_NUMBER, data00' +
        '25.MANU_PART_DESC,dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WARE' +
        'HOUSE_NAME, dbo.Data0016.CODE, '
      '                      dbo.Data0016.LOCATION'
      'FROM         dbo.Data0053 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0053.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0053.WHSE_PTR = db' +
        'o.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo' +
        '.Data0016.RKEY'
      'where dbo.Data0053.NPAD_PTR=:rkey416')
    Left = 56
    Top = 152
    object ADO53RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO53WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADO53LOC_PTR: TIntegerField
      FieldName = 'LOC_PTR'
    end
    object ADO53CUST_PART_PTR: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object ADO53QUANTITY: TFloatField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADO53QTY_ALLOC: TFloatField
      FieldName = 'QTY_ALLOC'
    end
    object ADO53MFG_DATE: TDateTimeField
      FieldName = 'MFG_DATE'
    end
    object ADO53RMA_PTR: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object ADO53NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object ADO53REFERENCE_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object ADO53MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#30721
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO53MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADO53WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ADO53WAREHOUSE_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object ADO53CODE: TStringField
      DisplayLabel = #20179#20301#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object ADO53LOCATION: TStringField
      DisplayLabel = #20179#20301#21517#31216
      FieldName = 'LOCATION'
    end
  end
  object ADO416_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
      'select  * from data0416 where rkey=:rkey416')
    Left = 200
    Top = 96
  end
  object ADO53_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
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
      'select  * from data0053 where npad_ptr=:rkey416')
    Left = 200
    Top = 152
  end
  object DS3: TDataSource
    DataSet = ADO416_1
    Left = 248
    Top = 96
  end
  object DS4: TDataSource
    DataSet = ADO53_2
    Left = 256
    Top = 216
  end
  object ADO53_2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
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
      
        'SELECT     dbo.Data0053.*, dbo.Data0025.MANU_PART_NUMBER, data00' +
        '25.MANU_PART_DESC, dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAR' +
        'EHOUSE_NAME, dbo.Data0016.CODE, '
      '                      dbo.Data0016.LOCATION'
      'FROM         dbo.Data0053 INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0053.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0053.WHSE_PTR = db' +
        'o.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo' +
        '.Data0016.RKEY'
      'where dbo.Data0053.NPAD_PTR=:rkey416')
    Left = 200
    Top = 216
    object IntegerField1: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object IntegerField3: TIntegerField
      FieldName = 'LOC_PTR'
    end
    object IntegerField4: TIntegerField
      FieldName = 'CUST_PART_PTR'
    end
    object FloatField1: TFloatField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'QUANTITY'
    end
    object FloatField2: TFloatField
      FieldName = 'QTY_ALLOC'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'MFG_DATE'
    end
    object IntegerField5: TIntegerField
      FieldName = 'RMA_PTR'
    end
    object IntegerField6: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object StringField1: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object StringField2: TStringField
      DisplayLabel = #26412#21378#32534#30721
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADO53_2MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object StringField3: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object StringField4: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object StringField5: TStringField
      DisplayLabel = #20179#20301#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object StringField6: TStringField
      DisplayLabel = #20179#20301#21517#31216
      FieldName = 'LOCATION'
    end
  end
end
