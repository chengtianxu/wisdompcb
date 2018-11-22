object dm: Tdm
  OldCreateOrder = True
  Left = 600
  Top = 347
  Height = 336
  Width = 319
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ds05: TDataSource
    DataSet = ads05
    Left = 56
    Top = 72
  end
  object aq34: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'F01'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0034 where rkey=:F01')
    Left = 16
    Top = 120
    object aq34RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aq34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aq34BIG_DEPT_PTR: TIntegerField
      FieldName = 'BIG_DEPT_PTR'
    end
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 16
    Top = 176
  end
  object ads05: TADODataSet
    AutoCalcFields = False
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select empl_code,employee_name,abbr_name,employee_id,'#13#10'address_l' +
      'ine_1,state,zip,phone,active_flag,buyer_flag,'#13#10'comein_date,inact' +
      'ive_date,tpostion,email,popedom,case popedom '#13#10'when 0 then '#39#26080#39' w' +
      'hen 1 then '#39#36319#21333#21592#39' when 2 then '#39#19994#21153#21592#39' when 3 then '#39#33829#38144#32463#29702#39' when 4 the' +
      'n '#39#24320#21457#21103#24635#39' end as popedom_,'#13#10'born,gender,school_age,identity_card,' +
      'nation,LAST_UPDT'#13#10'from data0005 '#13#10'where 1=1 '
    IndexFieldNames = 'empl_code'
    Parameters = <>
    Left = 16
    Top = 72
    object ads05empl_code: TStringField
      FieldName = 'empl_code'
      Size = 10
    end
    object ads05employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ads05abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ads05employee_id: TIntegerField
      FieldName = 'employee_id'
    end
    object ads05address_line_1: TStringField
      FieldName = 'address_line_1'
      Size = 70
    end
    object ads05state: TStringField
      FieldName = 'state'
      Size = 10
    end
    object ads05zip: TStringField
      FieldName = 'zip'
      Size = 10
    end
    object ads05phone: TStringField
      FieldName = 'phone'
      Size = 14
    end
    object ads05active_flag: TStringField
      FieldName = 'active_flag'
      FixedChar = True
      Size = 1
    end
    object ads05buyer_flag: TStringField
      FieldName = 'buyer_flag'
      FixedChar = True
      Size = 1
    end
    object ads05comein_date: TDateTimeField
      FieldName = 'comein_date'
    end
    object ads05inactive_date: TDateTimeField
      FieldName = 'inactive_date'
    end
    object ads05tpostion: TStringField
      FieldName = 'tpostion'
      Size = 30
    end
    object ads05email: TStringField
      FieldName = 'email'
      Size = 50
    end
    object ads05popedom: TWordField
      FieldName = 'popedom'
    end
    object ads05born: TDateTimeField
      FieldName = 'born'
    end
    object ads05gender: TStringField
      FieldName = 'gender'
      Size = 2
    end
    object ads05school_age: TStringField
      FieldName = 'school_age'
      Size = 10
    end
    object ads05identity_card: TStringField
      FieldName = 'identity_card'
    end
    object ads05nation: TStringField
      FieldName = 'nation'
    end
    object ads05dept_name: TStringField
      FieldKind = fkLookup
      FieldName = 'dept_name'
      LookupDataSet = aq034
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'employee_id'
      Lookup = True
    end
    object ads05popedom_: TStringField
      FieldName = 'popedom_'
      ReadOnly = True
      Size = 8
    end
    object ads05LAST_UPDT: TDateTimeField
      FieldName = 'LAST_UPDT'
    end
  end
  object aq04: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CONTROL_NO_LENGTH,SEED_VALUE,SEED_FLAG from data0004 wher' +
        'e rkey=4')
    Left = 56
    Top = 176
    object aq04CONTROL_NO_LENGTH: TSmallintField
      FieldName = 'CONTROL_NO_LENGTH'
    end
    object aq04SEED_VALUE: TStringField
      FieldName = 'SEED_VALUE'
    end
    object aq04SEED_FLAG: TWordField
      FieldName = 'SEED_FLAG'
    end
  end
  object aq034: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      'select * from data0034 ')
    Left = 56
    Top = 120
    object AutoIncField1: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object StringField1: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object IntegerField1: TIntegerField
      FieldName = 'BIG_DEPT_PTR'
    end
  end
end
