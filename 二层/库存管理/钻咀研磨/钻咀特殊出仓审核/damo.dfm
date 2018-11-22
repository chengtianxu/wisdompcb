object DM: TDM
  OldCreateOrder = False
  Left = 277
  Top = 169
  Height = 454
  Width = 560
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = ADS221
    Left = 80
    Top = 104
  end
  object ADS221: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT    data0221.rkey,dbo.DATA0221.number , dbo.DATA0221.type,' +
      ' dbo.DATA0221.status, '#13#10'dbo.Data0005.EMPLOYEE_NAME, Data0005_1.E' +
      'MPLOYEE_NAME AS QUTH_EMPLNAME, '#13#10' dbo.DATA0221.sys_date, dbo.DAT' +
      'A0221.auth_date, dbo.DATA0221.quantity, dbo.DATA0221.reference,'#13 +
      #10'case DATA0221.type when 1 then '#39#24211#25151#20986#20179#39' when 2 then '#39#24453#32763#30952#20986#20179#39#13#10' whe' +
      'n 3 then '#39#38075#26426#20986#20179#39' when 5 then '#39#25253#24223#20986#20179#39' end as c_type,'#13#10'case DATA0221' +
      '.status when 0 then '#39#24453#25552#20132#39' when 1 then '#39#24453#23457#26680#39#13#10'  when 2 then '#39#24050#23457#26680#39 +
      ' when 3 then '#39#34987#36864#22238#39' end as c_status,'#13#10'DATA0221.auth_empl_ptr '#13#10'FR' +
      'OM     dbo.DATA0221 INNER JOIN'#13#10'   dbo.Data0005 ON dbo.DATA0221.' +
      'empl_ptr = dbo.Data0005.RKEY left outer JOIN'#13#10'   dbo.Data0005 AS' +
      ' Data0005_1 ON dbo.DATA0221.auth_empl_ptr = Data0005_1.RKEY'#13#10'WHE' +
      'RE DATA0221.SYS_DATE >= :dtpk1 and'#13#10'               DATA0221.SYS_' +
      'DATE <= :dtpk2 and'#13#10'               DATA0221.status <> :v0 and'#13#10' ' +
      '              DATA0221.status <> :v1 and'#13#10'               DATA022' +
      '1.status <> :v2 and'#13#10'               DATA0221.status <> :v3'
    IndexFieldNames = 'number'
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
        Value = 0
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 9
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
      end>
    Left = 144
    Top = 104
    object ADS221rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS221number: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'number'
      Size = 10
    end
    object ADS221type: TWordField
      FieldName = 'type'
    end
    object ADS221status: TWordField
      FieldName = 'status'
    end
    object ADS221EMPLOYEE_NAME: TStringField
      DisplayLabel = #20986#20179#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS221QUTH_EMPLNAME: TStringField
      DisplayLabel = #23457#26680#20154#21592
      FieldName = 'QUTH_EMPLNAME'
      Size = 16
    end
    object ADS221sys_date: TDateTimeField
      DisplayLabel = #20986#20179#26085#26399
      FieldName = 'sys_date'
    end
    object ADS221auth_date: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'auth_date'
    end
    object ADS221quantity: TIntegerField
      DisplayLabel = #20986#20179#24635#37327
      FieldName = 'quantity'
    end
    object ADS221reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 100
    end
    object ADS221c_type: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'c_type'
      ReadOnly = True
      Size = 10
    end
    object ADS221c_status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'c_status'
      ReadOnly = True
      Size = 6
    end
    object ADS221auth_empl_ptr: TIntegerField
      FieldName = 'auth_empl_ptr'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS222
    Left = 80
    Top = 176
  end
  object ADS222: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, ' +
      'dbo.Data0017.INV_DESCRIPTION,'#13#10' dbo.DATA0160.LOCATION_NAME, '#13#10'  ' +
      '                    dbo.Data0023.ABBR_NAME, dbo.DATA0220.OH_degr' +
      'ee, dbo.DATA0222.quantity, dbo.DATA0222.reference'#13#10'FROM         ' +
      'dbo.DATA0220 INNER JOIN'#13#10'                      dbo.Data0017 ON d' +
      'bo.DATA0220.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'      ' +
      '                dbo.DATA0160 ON dbo.DATA0220.LOCATION_PTR = dbo.' +
      'DATA0160.RKEY INNER JOIN'#13#10'                      dbo.Data0023 ON ' +
      'dbo.DATA0220.SUPPLIER_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      ' +
      '                dbo.DATA0222 ON dbo.DATA0220.RKEY = dbo.DATA0222' +
      '.bach_ptr'#13#10'WHERE DATA0222.head_ptr = :rkey'
    DataSource = DataSource1
    IndexFieldNames = 'INV_PART_NUMBER'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 145
    Top = 176
    object ADS222INV_PART_NUMBER: TStringField
      DisplayLabel = #38075#21632#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS222INV_NAME: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADS222INV_DESCRIPTION: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADS222LOCATION_NAME: TStringField
      DisplayLabel = #23384#25918#20301#32622
      FieldName = 'LOCATION_NAME'
      Size = 50
    end
    object ADS222ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS222QUANTITY: TIntegerField
      DisplayLabel = #20986#24211#25968#37327
      FieldName = 'QUANTITY'
    end
    object ADS222OH_degree: TWordField
      DisplayLabel = #30740#30952#27425#25968
      FieldName = 'OH_degree'
    end
    object ADS222reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 50
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 192
    Top = 24
  end
end
