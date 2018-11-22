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
    DataSet = ADS268
    Left = 80
    Top = 110
  end
  object ADS268: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT DISTINCT d268.rkey,d268.number,d268.dept_ptr,d34.DEPT_COD' +
      'E,d34.DEPT_NAME,d268.DATE,'#13#10'd268.EMPL_PTR,d05_1.EMPL_CODE,d05_1.' +
      'EMPLOYEE_NAME,d268.status,'#13#10'CASE d268.status WHEN 0 THEN '#39#24453#25552#20132#39' W' +
      'HEN 1 THEN '#39#24453#23457#26680#39' WHEN 2 THEN '#39#24050#23457#26680#39' WHEN 3 THEN '#39#34987#36864#22238#39'  WHEN 4 THE' +
      'N '#39#24050#21457#25918#39' END AS C_STATUS,'#13#10'd268.auth_emplptr,d05_2.EMPL_CODE AS a' +
      'uth_EMPL_CODE, d05_2.EMPLOYEE_NAME AS auth_EMPLOYEE_NAME,'#13#10'd268.' +
      'auth_date, d268.auth_ptr, d268.reference'#13#10'FROM DATA0268 d268'#13#10'IN' +
      'NER JOIN Data0034 d34 ON d268.dept_ptr = d34.RKEY'#13#10'INNER JOIN Da' +
      'ta0005 d05_1 ON d268.EMPL_PTR = d05_1.RKEY'#13#10'LEFT JOIN Data0005 d' +
      '05_2 ON d268.auth_emplptr = d05_2.RKEY'#13#10'inner JOIN DATA0368 d368' +
      ' ON d368.apply_ptr = d268.rkey'#13#10'INNER JOIN Data0073 d73 ON d73.R' +
      'KEY = d368.user_ptr'#13#10'WHERE ((d268.DATE >= :dtpk1 AND d268.DATE <' +
      '= :dtpk2) OR (:fd <> 1)) AND'#13#10'd268.status <> :v0 and'#13#10'd268.statu' +
      's <> :v1 and'#13#10'd268.status <> :v2 and'#13#10'd268.status <> :v3 and'#13#10'd2' +
      '68.status <> :v4 AND'#13#10'((d368.auth_flag = :DispRang) OR (d368.aut' +
      'h_flag = :DispRang2))'#13#10'and d73.draw_materiel_ptr = :Rkey73'
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
        Name = 'fd'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
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
      end
      item
        Name = 'v4'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 4
      end
      item
        Name = 'DispRang'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = 'Y'
      end
      item
        Name = 'DispRang2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = 'Y'
      end
      item
        Name = 'RKEY73'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    Left = 156
    Top = 114
    object ADS268rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS268number: TStringField
      DisplayLabel = #39046#26009#21333#21495
      FieldName = 'number'
      Size = 50
    end
    object ADS268dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADS268DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS268DEPT_NAME: TStringField
      DisplayLabel = #30003#35831#37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS268DATE: TDateTimeField
      DisplayLabel = #30003#39046#26085#26399
      FieldName = 'DATE'
    end
    object ADS268EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADS268EMPL_CODE: TStringField
      DisplayLabel = #30003#39046#21592#24037#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS268EMPLOYEE_NAME: TStringField
      DisplayLabel = #30003#39046#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS268status: TWordField
      FieldName = 'status'
    end
    object ADS268C_STATUS: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'C_STATUS'
      ReadOnly = True
      Size = 6
    end
    object ADS268auth_emplptr: TIntegerField
      FieldName = 'auth_emplptr'
    end
    object ADS268auth_EMPL_CODE: TStringField
      DisplayLabel = #23457#25209#20154#20195#30721
      FieldName = 'auth_EMPL_CODE'
      Size = 10
    end
    object ADS268auth_EMPLOYEE_NAME: TStringField
      DisplayLabel = #23457#25209#20154
      FieldName = 'auth_EMPLOYEE_NAME'
      Size = 16
    end
    object ADS268auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object ADS268auth_ptr: TIntegerField
      FieldName = 'auth_ptr'
    end
    object ADS268reference: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'reference'
      Size = 100
    end
  end
  object DataSource2: TDataSource
    DataSet = ADS468
    Left = 80
    Top = 176
  end
  object ADS468: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0468.RKEY, dbo.Data0468.FLOW_NO, dbo.Data0468' +
      '.STEP, dbo.Data0468.DEPT_PTR, dbo.Data0468.INVENT_PTR, '#13#10'       ' +
      '               dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PA' +
      'RT_DESCRIPTION, dbo.Data0468.QUAN_BOM, dbo.Data0468.QUAN_ISSUED,' +
      ' '#13#10'                      dbo.Data0002.UNIT_NAME, dbo.Data0468.ST' +
      'ATUS, dbo.Data0468.VENDOR'#13#10'FROM         dbo.Data0002 INNER JOIN'#13 +
      #10'                      dbo.Data0017 ON dbo.Data0002.RKEY = dbo.D' +
      'ata0017.STOCK_UNIT_PTR INNER JOIN'#13#10'                      dbo.Dat' +
      'a0468 ON dbo.Data0017.RKEY = dbo.Data0468.INVENT_PTR'#13#10'WHERE     ' +
      'dbo.Data0468.FLOW_NO=:rkey'
    DataSource = DataSource1
    IndexFieldNames = 'Rkey'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 5
      end>
    Left = 155
    Top = 178
    object ADS468RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS468FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object ADS468STEP: TSmallintField
      DisplayLabel = #27493#39588#21495
      FieldName = 'STEP'
    end
    object ADS468DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS468INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object ADS468INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS468INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#25551#36848
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADS468QUAN_BOM: TFloatField
      DisplayLabel = #30003#39046#25968#37327
      FieldName = 'QUAN_BOM'
    end
    object ADS468QUAN_ISSUED: TFloatField
      DisplayLabel = #24050#21457#25918#25968#37327
      FieldName = 'QUAN_ISSUED'
    end
    object ADS468UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADS468STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADS468VENDOR: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'VENDOR'
      Size = 15
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 156
    Top = 50
  end
  object qrytmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 456
    Top = 136
  end
end
