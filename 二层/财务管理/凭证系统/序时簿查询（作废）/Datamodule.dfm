object DM: TDM
  OldCreateOrder = False
  Left = 257
  Top = 254
  Height = 416
  Width = 476
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\68.udl'
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 72
    Top = 87
  end
  object ADOData0493: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 192
    Top = 8
  end
  object AdoData0106: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = AdoData0106CalcFields
    CommandText = 
      'SELECT     dbo.Data0105.VOUCHER, dbo.Data0105.ENTERED_DT, a.EMPL' +
      'OYEE_NAME AS operator, b.EMPLOYEE_NAME AS auditor, '#13#10'           ' +
      '           c.EMPLOYEE_NAME AS Postman, dbo.Data0106.DESCRIPTION,' +
      ' dbo.Data0106.D_C, dbo.Data0106.AMOUNT,'#13#10'                     db' +
      'o.Data0103.GL_ACC_NUMBER,  dbo.Data0103.GL_DESCRIPTION, '#13#10'Data01' +
      '03_1.GL_DESCRIPTION AS father_desc, Data0103_2.GL_DESCRIPTION AS' +
      ' grandfather_desc, '#13#10'                      dbo.Data0001.CURR_COD' +
      'E, '#13#10'case when Data0106.EXCH_RATE>0 then'#13#10'round(1 / Data0106.EXC' +
      'H_RATE,4) else 0 end as exch_rate'#13#10'FROM         dbo.Data0105 INN' +
      'ER JOIN'#13#10'                      dbo.Data0106 ON dbo.Data0105.RKEY' +
      ' = dbo.Data0106.GL_HEADER_PTR INNER JOIN'#13#10'                      ' +
      'dbo.Data0103 ON dbo.Data0106.GL_ACCT_NO_PTR = dbo.Data0103.RKEY ' +
      'INNER JOIN'#13#10'                      dbo.Data0005 AS a ON dbo.Data0' +
      '105.ENTERED_BY_EMPL_PTR = a.RKEY INNER JOIN'#13#10'                   ' +
      '   dbo.Data0001 ON dbo.Data0106.CURR_PTR = dbo.Data0001.RKEY LEF' +
      'T OUTER JOIN'#13#10'                      dbo.Data0103 AS Data0103_2 R' +
      'IGHT OUTER JOIN'#13#10'                      dbo.Data0103 AS Data0103_' +
      '1 ON Data0103_2.RKEY = Data0103_1.PARENT_PTR ON '#13#10'              ' +
      '        dbo.Data0103.PARENT_PTR = Data0103_1.RKEY LEFT OUTER JOI' +
      'N'#13#10'                      dbo.Data0005 AS b ON dbo.Data0105.AUDIT' +
      'ED_BY_EMPL_PTR = b.RKEY LEFT OUTER JOIN'#13#10'                      d' +
      'bo.Data0005 AS c ON dbo.Data0105.POSTED_BY_EMPL_PTR = c.RKEY'#13#10'wh' +
      'ere'#13#10'data0105.fyear=:vfyear'#13#10'and data0105.period=:vperiod'#13#10'and d' +
      'ata0105.vou_type<>:vptr1'#13#10'and data0105.vou_type<>:vptr2'#13#10'and dat' +
      'a0105.vou_type<>:vptr3'#13#10'and data0105.vou_type<>:vptr4'#13#10'and data0' +
      '105.vou_type<>:vptr5'#13#10'and data0105.status<>:vstatus1'#13#10'and data01' +
      '05.status<>:vstatus2'#13#10'and data0105.status<>:vstatus3'#13#10'and data01' +
      '05.status<>:vstatus4'#13#10'and data0105.status<>:vstatus5'#13#10'and data01' +
      '05.status<>:vstatus6'#13#10'and Data0103.GL_ACC_NUMBER like :accnumber' +
      #13#10
    FieldDefs = <
      item
        Name = 'VOUCHER'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'ENTERED_DT'
        Attributes = [faFixed]
        DataType = ftDateTime
      end
      item
        Name = 'operator'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'auditor'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'Postman'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'D_C'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 1
      end
      item
        Name = 'AMOUNT'
        Attributes = [faFixed]
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'GL_ACC_NUMBER'
        DataType = ftString
        Size = 18
      end
      item
        Name = 'GL_DESCRIPTION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'father_desc'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'grandfather_desc'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CURR_CODE'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'exch_rate'
        Attributes = [faReadonly, faFixed]
        DataType = ftBCD
        Precision = 22
        Size = 13
      end>
    Parameters = <
      item
        Name = 'vfyear'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 2006
      end
      item
        Name = 'vperiod'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vptr1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vptr2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vptr3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vptr4'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vptr5'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vstatus1'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 9
      end
      item
        Name = 'vstatus2'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 1
      end
      item
        Name = 'vstatus3'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 2
      end
      item
        Name = 'vstatus4'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 3
      end
      item
        Name = 'vstatus5'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 4
      end
      item
        Name = 'vstatus6'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 5
      end
      item
        Name = 'accnumber'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 18
        Value = Null
      end>
    StoreDefs = True
    Left = 104
    Top = 8
    object AdoData0106VOUCHER: TStringField
      FieldName = 'VOUCHER'
      Size = 12
    end
    object AdoData0106ENTERED_DT: TDateTimeField
      FieldName = 'ENTERED_DT'
    end
    object AdoData0106operator: TStringField
      FieldName = 'operator'
      Size = 16
    end
    object AdoData0106auditor: TStringField
      FieldName = 'auditor'
      Size = 16
    end
    object AdoData0106Postman: TStringField
      FieldName = 'Postman'
      Size = 16
    end
    object AdoData0106DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object AdoData0106D_C: TStringField
      FieldName = 'D_C'
      FixedChar = True
      Size = 1
    end
    object AdoData0106AMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
    object AdoData0106GL_ACC_NUMBER: TStringField
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object AdoData0106GL_DESCRIPTION: TStringField
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
    object AdoData0106father_desc: TStringField
      FieldName = 'father_desc'
      Size = 50
    end
    object AdoData0106grandfather_desc: TStringField
      FieldName = 'grandfather_desc'
      Size = 50
    end
    object AdoData0106self_desc: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'self_desc'
      Size = 160
      Calculated = True
    end
    object AdoData0106CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object AdoData0106exch_rate: TBCDField
      FieldName = 'exch_rate'
      ReadOnly = True
      Precision = 22
      Size = 13
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 96
  end
end
