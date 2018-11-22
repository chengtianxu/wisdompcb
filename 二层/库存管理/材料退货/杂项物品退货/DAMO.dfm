object DM: TDM
  OldCreateOrder = False
  Left = 500
  Top = 299
  Height = 306
  Width = 414
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=sj_v20_sample;Data Source=KMERP_WZ'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 296
    Top = 16
  end
  object AQ72: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0072.DESCRIPTION, dbo.Data0072.GUI_GE, '
      '      dbo.Data0072.DESCRIPTION2, dbo.Data0072.QUAN_ORD, '
      '      dbo.Data0072.QUANTITY_RECEIVED, dbo.Data0072.QUAN_RETN, '
      
        '      dbo.Data0072.DEL_DATE, dbo.Data0002.UNIT_NAME, dbo.Data007' +
        '2.RKEY'
      'FROM dbo.Data0072 INNER JOIN'
      '      dbo.Data0002 ON dbo.Data0072.UNIT_PTR = dbo.Data0002.RKEY'
      'where data0072.poptr=:rkey')
    Left = 48
    Top = 63
    object AQ72DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object AQ72GUI_GE: TStringField
      DisplayLabel = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object AQ72DESCRIPTION2: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object AQ72QUAN_ORD: TFloatField
      DisplayLabel = #35746#21333#36141#25968#37327
      FieldName = 'QUAN_ORD'
    end
    object AQ72QUANTITY_RECEIVED: TFloatField
      DisplayLabel = #24050#25509#25910#25968#37327
      FieldName = 'QUANTITY_RECEIVED'
    end
    object AQ72QUAN_RETN: TFloatField
      DisplayLabel = #24050#36864#36135#25968#37327
      FieldName = 'QUAN_RETN'
    end
    object AQ72DEL_DATE: TDateTimeField
      DisplayLabel = #35201#27714#26085#26399
      FieldName = 'DEL_DATE'
    end
    object AQ72UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object AQ72RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ72
    Left = 48
    Top = 112
  end
  object AQ235: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0235.DATE_RECD, dbo.Data0235.QUAN_RECD, '
      '      dbo.Data0235.QUAN_ON_HAND, dbo.Data0235.quan_to_ship, '
      '      dbo.Data0235.quan_returned, dbo.Data0456.GRN_NUMBER, '
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0235.RKEY,'
      '      data0235.D0072_PTR'
      'FROM dbo.Data0235 INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY'
      'where data0235.d0072_PTR =:rkey')
    Left = 128
    Top = 64
    object AQ235DATE_RECD: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'DATE_RECD'
    end
    object AQ235QUAN_RECD: TFloatField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
    end
    object AQ235QUAN_ON_HAND: TFloatField
      DisplayLabel = #29616#26377#24211#23384
      FieldName = 'QUAN_ON_HAND'
    end
    object AQ235quan_to_ship: TFloatField
      DisplayLabel = #24453#35013#36816#25968#37327
      FieldName = 'quan_to_ship'
    end
    object AQ235quan_returned: TFloatField
      DisplayLabel = #24050#36864#36135#25968#37327
      FieldName = 'quan_returned'
    end
    object AQ235GRN_NUMBER: TStringField
      DisplayLabel = #25910#36135#21333#21495
      FieldName = 'GRN_NUMBER'
      FixedChar = True
      Size = 10
    end
    object AQ235EMPLOYEE_NAME: TStringField
      DisplayLabel = #25509#25910#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ235rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ235D0072_PTR: TIntegerField
      FieldName = 'D0072_PTR'
    end
  end
  object DataSource2: TDataSource
    DataSet = AQ235
    Left = 128
    Top = 112
  end
  object ado95: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 168
  end
  object ado9511: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 168
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 12
  end
  object aq96: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource2
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
      'select data0209.tdate,data0209.quantity,'
      '       data0076.REJECT_DESCRIPTION,'
      '       data0005.employee_name,data0209.rkey'
      'from data0209,data0076,data0005'
      'where'
      '     data0209.GL_HDR_PTR=data0076.rkey and'
      '     data0209.EMPL_PTR=data0005.rkey and'
      '     data0209.srce_ptr=:rkey ')
    Left = 201
    Top = 65
    object aq96quantity: TFloatField
      FieldName = 'quantity'
    end
    object aq96REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
    end
    object aq96employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object aq96rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq96tdate: TDateTimeField
      FieldName = 'tdate'
    end
  end
  object DataSource3: TDataSource
    DataSet = aq96
    Left = 202
    Top = 111
  end
end
