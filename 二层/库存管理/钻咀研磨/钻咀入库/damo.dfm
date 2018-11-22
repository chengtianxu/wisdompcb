object dm: Tdm
  OldCreateOrder = False
  Left = 332
  Top = 204
  Height = 363
  Width = 426
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 40
  end
  object ADS219: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.DATA0219.*, dbo.Data0005.EMPLOYEE_NAME,'#13#10'case dat' +
      'a0219.ttype when 0 then '#39#30452#25509#20837#24211#39#13#10'when 1 then '#39#24211#25151#21040#38075#26426#39' when 2 then ' +
      #39#38075#26426#22238#20179#39#13#10'when 3 then '#39#20379#24212#21830#30740#30952#39' when 4 then '#39#30740#30952#22238#20179#39' end as type'#13#10'FROM' +
      '         dbo.DATA0219 INNER JOIN dbo.Data0005 '#13#10'ON dbo.DATA0219.' +
      'CREATE_BY = dbo.Data0005.RKEY'#13#10'WHERE'#13#10'DATA0219.CREATE_DATE >= :d' +
      'tpk1 and'#13#10'DATA0219.CREATE_DATE <= :dtpk2 and'#13#10'DATA0219.TTYPE <> ' +
      ':v0 and'#13#10'DATA0219.TTYPE <> :v1 and'#13#10'DATA0219.TTYPE <> :v2 and'#13#10'D' +
      'ATA0219.TTYPE <> :v3 and'#13#10'DATA0219.TTYPE <> :v4'#13#10
    IndexFieldNames = 'GRN_NUMBER'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39814d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 40179d
      end
      item
        Name = 'v0'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 1
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 2
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 3
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 4
      end>
    Left = 112
    Top = 120
    object ADS219RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS219GRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ADS219CREATE_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object ADS219SYSTEM_DATE: TDateTimeField
      FieldName = 'SYSTEM_DATE'
    end
    object ADS219TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object ADS219location_fromptr: TIntegerField
      FieldName = 'location_fromptr'
    end
    object ADS219location_endptr: TIntegerField
      FieldName = 'location_endptr'
    end
    object ADS219CREATE_BY: TIntegerField
      FieldName = 'CREATE_BY'
    end
    object ADS219handle_name: TStringField
      DisplayLabel = #32463#21150#20154
      FieldName = 'handle_name'
      Size = 50
    end
    object ADS219REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object ADS219EMPLOYEE_NAME: TStringField
      DisplayLabel = #20837#24211#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS219type: TStringField
      DisplayLabel = #20837#24211#31867#22411
      FieldName = 'type'
      ReadOnly = True
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS219
    Left = 40
    Top = 120
  end
  object DataSource2: TDataSource
    DataSet = ADS220
    Left = 40
    Top = 176
  end
  object ADS220: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
      #13#10'dbo.Data0017.INV_DESCRIPTION, dbo.DATA0160.LOCATION_NAME, '#13#10'  ' +
      '                    dbo.Data0023.ABBR_NAME, dbo.DATA0220.QUANTIT' +
      'Y, '#13#10'dbo.DATA0220.OH_degree, dbo.DATA0220.REMARK,'#13#10'DATA0220.INVE' +
      'NTORY_PTR,DATA0220.LOCATION_PTR,'#13#10'DATA0220.SUPPLIER_PTR'#13#10'FROM   ' +
      '      dbo.DATA0220 INNER JOIN'#13#10'dbo.Data0017 ON dbo.DATA0220.INVE' +
      'NTORY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'dbo.DATA0160 ON dbo.DA' +
      'TA0220.LOCATION_PTR = dbo.DATA0160.RKEY INNER JOIN'#13#10'dbo.Data0023' +
      ' ON dbo.DATA0220.SUPPLIER_PTR = dbo.Data0023.RKEY'#13#10'WHERE DATA022' +
      '0.GRN_PTR = :rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 176
    object ADS220INV_PART_NUMBER: TStringField
      DisplayLabel = #38075#21632#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS220INV_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADS220INV_DESCRIPTION: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADS220LOCATION_NAME: TStringField
      DisplayLabel = #23384#25918#20301#32622
      FieldName = 'LOCATION_NAME'
      Size = 50
    end
    object ADS220ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS220QUANTITY: TIntegerField
      DisplayLabel = #20837#24211#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADS220OH_degree: TWordField
      DisplayLabel = #30740#30952#27425#25968
      FieldName = 'OH_degree'
    end
    object ADS220REMARK: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object ADS220INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADS220LOCATION_PTR: TIntegerField
      FieldName = 'LOCATION_PTR'
    end
    object ADS220SUPPLIER_PTR: TIntegerField
      FieldName = 'SUPPLIER_PTR'
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 192
    Top = 24
  end
  object ado04: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select SEED_VALUE,SEED_FLAG from data0004'
      'where rkey=63')
    Left = 309
    Top = 77
    object ado04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object ado04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object aq160: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select rkey,LOCATION_NAME '
      'from data00160'
      ''
      'order by rkey')
    Left = 307
    Top = 132
    object aq160rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq160LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 264
    Top = 16
  end
end
