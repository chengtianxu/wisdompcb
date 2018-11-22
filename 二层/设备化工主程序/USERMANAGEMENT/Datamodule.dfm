object DM: TDM
  OldCreateOrder = False
  Left = 231
  Top = 244
  Height = 436
  Width = 676
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 7
  end
  object ADOData0073: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = ADOData0073CalcFields
    Parameters = <
      item
        Name = 'vptr'
        DataType = ftString
        Size = 1
        Value = '1'
      end>
    SQL.Strings = (
      'select data0073.*'
      'from data0073'
      'where ACTIVE_FLAG<>:vptr'
      'order by user_id')
    Left = 168
    Top = 8
    object ADOData0073RKEY: TIntegerField
      FieldName = 'RKEY'
    end
    object ADOData0073USER_ID: TStringField
      DisplayWidth = 10
      FieldName = 'USER_ID'
      Size = 10
    end
    object ADOData0073USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADOData0073USER_LOGIN_NAME: TStringField
      DisplayWidth = 15
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADOData0073USER_PASSWORD: TStringField
      FieldName = 'USER_PASSWORD'
      FixedChar = True
      Size = 32
    end
    object ADOData0073USER_GROUP_FLAG: TSmallintField
      FieldName = 'USER_GROUP_FLAG'
    end
    object ADOData0073LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOData0073GROUP_PTR: TIntegerField
      FieldName = 'GROUP_PTR'
    end
    object ADOData0073EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
    object ADOData0073TTYPE: TStringField
      FieldKind = fkCalculated
      FieldName = 'TTYPE'
      Calculated = True
    end
    object ADOData0073TGROUP: TStringField
      FieldKind = fkLookup
      FieldName = 'TGROUP'
      LookupDataSet = ADO0073
      LookupKeyFields = 'rkey'
      LookupResultField = 'user_id'
      KeyFields = 'GROUP_PTR'
      Lookup = True
    end
    object ADOData0073EMPLOYEE_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'EMPLOYEE_NAME'
      LookupDataSet = ADO0005
      LookupKeyFields = 'rkey'
      LookupResultField = 'employee_name'
      KeyFields = 'EMPLOYEE_PTR'
      Lookup = True
    end
    object ADOData0073ACTIVE_FLAG: TSmallintField
      FieldName = 'ACTIVE_FLAG'
    end
    object ADOData0073rpl_pr_ptr: TIntegerField
      FieldName = 'rpl_pr_ptr'
    end
    object ADOData0073rpl_po_ptr: TIntegerField
      FieldName = 'rpl_po_ptr'
    end
    object ADOData0073epiboly_ptr: TIntegerField
      FieldName = 'epiboly_ptr'
    end
    object ADOData0073draw_materiel_ptr: TIntegerField
      FieldName = 'draw_materiel_ptr'
    end
  end
  object ADOData0419: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0419'
      'order by ttype,seq_no')
    Left = 245
    Top = 8
  end
  object ADO0073: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select rkey,user_id,user_full_name from data0073'
      'where user_group_flag=0')
    Left = 320
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOData0073
    Left = 80
    Top = 56
  end
  object ADO0005: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select rkey,empl_code,employee_name from data0005'
      'order by empl_code')
    Left = 392
    Top = 8
    object ADO0005rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0005empl_code: TStringField
      FieldName = 'empl_code'
      Size = 10
    end
    object ADO0005employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object ADOData0074: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0074.*'
      'from data0074'
      'where user_ptr=:vptr')
    Left = 168
    Top = 56
  end
  object ADO0074: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0074.*'
      'from data0074'
      'where user_ptr=:vptr')
    Left = 245
    Top = 56
  end
  object ADOData0074A: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0074.*'
      'from data0074'
      'where user_ptr=:vptr')
    Left = 324
    Top = 57
  end
  object ADOData0074bk: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0074.*'
      'from data0074'
      'where user_ptr=:vptr'
      'and user_rights>0')
    Left = 168
    Top = 104
  end
end
