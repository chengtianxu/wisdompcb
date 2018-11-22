object DM: TDM
  OldCreateOrder = False
  Left = 556
  Top = 298
  Height = 375
  Width = 336
  object ADOCon: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 264
    Top = 96
  end
  object DS1: TDataSource
    DataSet = ADO94
    Left = 8
    Top = 88
  end
  object DS2: TDataSource
    DataSet = ADO275
    Left = 8
    Top = 155
  end
  object ADO94: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterOpen = ADO94AfterScroll
    AfterScroll = ADO94AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT    dbo.Data0094.RKEY, dbo.Data0094.CODE, dbo.Data0094.PUR' +
        'CHASE_APPROV_DESC, dbo.Data0094.dept_ptr, dbo.Data0094.mode, '
      
        '                dbo.Data0094.type, dbo.Data0034.DEPT_CODE, dbo.D' +
        'ata0034.DEPT_NAME,'
      '      case  when Data0094.type=0 then '#39#35831#36141#23457#25209#39
      '                when Data0094.type=1 then '#39#22806#21457#23457#25209#39' '
      '                when Data0094.type=2 then '#39#39046#26009#23457#25209#39' end type_c'
      'FROM      dbo.Data0094 INNER JOIN'
      
        '                dbo.Data0034 ON dbo.Data0094.dept_ptr = dbo.Data' +
        '0034.RKEY'
      'where 1=1')
    Left = 56
    Top = 88
    object ADO94CODE: TStringField
      DisplayLabel = #23457#25209#20195#30721
      FieldName = 'CODE'
      Size = 15
    end
    object ADO94PURCHASE_APPROV_DESC: TStringField
      DisplayLabel = #35828#26126
      FieldName = 'PURCHASE_APPROV_DESC'
      Size = 40
    end
    object ADO94DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO94DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO94type_c: TStringField
      DisplayLabel = #23457#25209#31867#21035
      FieldName = 'type_c'
      ReadOnly = True
      Size = 8
    end
    object ADO94dept_ptr: TIntegerField
      FieldName = 'dept_ptr'
    end
    object ADO94type: TWordField
      FieldName = 'type'
    end
    object ADO94mode: TWordField
      FieldName = 'mode'
    end
    object ADO94RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object ADO275: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey94'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT    dbo.Data0275.RKEY, dbo.Data0275.USER_PTR, dbo.Data0275' +
        '.AUTH_GROUP_PTR, dbo.Data0275.LOWER_LIMIT, dbo.Data0275.UPPER_LI' +
        'MIT, '
      
        '                dbo.Data0073.USER_FULL_NAME, dbo.Data0073.USER_L' +
        'OGIN_NAME,'
      
        '       case  dbo.Data0073.ACTIVE_FLAG when '#39'1'#39' then '#39#31163#32844#20154#21592#39'  else' +
        ' '#39#22312#32844#20154#21592#39' end  as '#39'ACTIVE_FLAG'#39
      'FROM      dbo.Data0275 INNER JOIN'
      
        '                dbo.Data0073 ON dbo.Data0275.USER_PTR = dbo.Data' +
        '0073.RKEY'
      'where      dbo.DATA0275.auth_group_ptr=:rkey94'
      'order by data0275.rkey')
    Left = 57
    Top = 152
    object ADO275USER_LOGIN_NAME: TStringField
      DisplayLabel = #20154#21592#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADO275USER_FULL_NAME: TStringField
      DisplayLabel = #20154#21592#21517#31216
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO275LOWER_LIMIT: TFloatField
      DisplayLabel = #37329#39069#19979#38480
      FieldName = 'LOWER_LIMIT'
    end
    object ADO275UPPER_LIMIT: TFloatField
      DisplayLabel = #37329#39069#19978#38480
      FieldName = 'UPPER_LIMIT'
    end
    object ADO275RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO275AUTH_GROUP_PTR: TIntegerField
      FieldName = 'AUTH_GROUP_PTR'
    end
    object ADO275USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object adsADO275ACTIVE_FLAG: TStringField
      FieldName = 'ACTIVE_FLAG'
      ReadOnly = True
      Size = 8
    end
  end
  object ADO94_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey94'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select  dbo.Data0094.RKEY, dbo.Data0094.CODE, dbo.Data0094.PURCH' +
        'ASE_APPROV_DESC, '
      'dbo.Data0094.dept_ptr, dbo.Data0094.mode,dbo.Data0094.type '
      'from data0094 where rkey=:rkey94')
    Left = 129
    Top = 87
  end
  object ADO275_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey94'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select  dbo.Data0275.RKEY, dbo.Data0275.USER_PTR, dbo.Data0275.A' +
        'UTH_GROUP_PTR, dbo.Data0275.LOWER_LIMIT, dbo.Data0275.UPPER_LIMI' +
        'T'
      'from data0275 where auth_group_ptr=:rkey94'
      'order by data0275.rkey')
    Left = 128
    Top = 152
  end
  object DS1_1: TDataSource
    DataSet = ADO94_1
    Left = 184
    Top = 88
  end
end
