object dmLookup: TdmLookup
  OldCreateOrder = False
  Height = 430
  Width = 555
  object cdsLK01: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT RKEY,CURR_CODE,CURR_NAME,EXCH_RATE FROM Data0001'
    Params = <>
    Left = 64
    Top = 56
    object atncfldLK01RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldLK01CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object strngfldLK01CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object fltfldLK01EXCH_RATE: TFloatField
      FieldName = 'EXCH_RATE'
    end
  end
  object cdsLK34: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT RKEY,DEPT_CODE,DEPT_NAME,TTYPE FROM data0034'
    Params = <>
    Left = 248
    Top = 56
    object atncfldLK34RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldLK34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object strngfldLK34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object strngfldLK34TTYPE: TStringField
      FieldName = 'TTYPE'
      Size = 1
    end
  end
  object cdsLK02: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT RKEY,UNIT_CODE,UNIT_NAME FROM data0002'
    Params = <>
    Left = 120
    Top = 56
    object atncfldLK02RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldLK02UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object strngfldLK02UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
  end
  object cdsLK05: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT RKEY,EMPL_CODE,EMPLOYEE_NAME FROM Data0005'
    Params = <>
    Left = 184
    Top = 56
    object atncfldLK05RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldLK05EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object strngfldLK05EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object cdsLK278: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT d278.RKEY,d278.PARAMETER_NAME,d278.PARAMETER_DESC,d278.CA' +
      'TEGORY_PTR,d278.UNIT_PTR,UNIT_CODE,UNIT_NAME,DATA_TYPE ,'#13#10'CASE d' +
      '278.CATEGORY_PTR WHEN 2 then '#39#20840#23616#21442#25968#39' WHEN 3 THEN '#39#21046#31243#21442#25968#39' END as CA' +
      'TEGORY,'#13#10'CASE d278.DATA_TYPE WHEN 1 then '#39#25968#23383#22411#39' WHEN 2 then '#39#23383#31526#22411#39 +
      ' END as datadesc'#13#10'FROM Data0278 d278'#13#10'INNER JOIN Data0002 d02 ON' +
      ' UNIT_PTR = d02.RKEY'#13#10
    Params = <>
    Left = 312
    Top = 56
    object atncfldLK278RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object strngfldLK278PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object strngfldLK278PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
    object intgrfldLK278CATEGORY_PTR: TIntegerField
      FieldName = 'CATEGORY_PTR'
    end
    object intgrfldLK278UNIT_PTR: TIntegerField
      FieldName = 'UNIT_PTR'
    end
    object strngfldLK278UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object strngfldLK278UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object wrdfldLK278DATA_TYPE: TWordField
      FieldName = 'DATA_TYPE'
    end
    object strngfldLK278CATEGORY: TStringField
      FieldName = 'CATEGORY'
      ReadOnly = True
      Size = 8
    end
    object strngfldLK278datadesc: TStringField
      FieldName = 'datadesc'
      ReadOnly = True
      Size = 6
    end
  end
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 200
    Top = 288
  end
  object ads1: TADODataSet
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    Left = 248
    Top = 288
  end
  object cdsLK73: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT d73.RKEY,d73.USER_FULL_NAME,d73.USER_LOGIN_NAME,d73.EMPLO' +
      'YEE_PTR,d73.warehouse_ptr,d05.EMPL_CODE,d05.EMPLOYEE_NAME FROM d' +
      'ata0073 d73'#13#10'INNER JOIN Data0005 d05 ON d73.EMPLOYEE_PTR = d05.R' +
      'KEY'#13#10
    Params = <>
    Left = 376
    Top = 56
  end
end
