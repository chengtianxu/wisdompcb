object DM: TDM
  OldCreateOrder = False
  Left = 397
  Top = 202
  Height = 357
  Width = 386
  object ADOCon: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 40
  end
  object ADOData720_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = ADOData720_1AfterScroll
    Parameters = <>
    SQL.Strings = (
      'select distinct GrpName from data0720 order by 1')
    Left = 48
    Top = 112
    object ADOData720_1GrpName: TStringField
      DisplayLabel = #19994#21153#32452#21517#31216
      FieldName = 'GrpName'
    end
  end
  object ADOData720_2: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'GrpName'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'select d720.rkey73,d73.user_login_name,user_full_name from data0' +
        '720 d720 inner join data0073 d73 on d720.rkey73=d73.rkey'
      'where GrpName=:GrpName  and ttype=0'
      'order by 2')
    Left = 48
    Top = 168
    object ADOData720_2user_login_name: TStringField
      DisplayLabel = #25805#20316#21592#20195#30721
      FieldName = 'user_login_name'
      Size = 15
    end
    object ADOData720_2user_full_name: TStringField
      DisplayLabel = #25805#20316#21592#21517#31216
      FieldName = 'user_full_name'
      Size = 30
    end
    object ADOData720_2rkey73: TIntegerField
      FieldName = 'rkey73'
    end
  end
  object ADOData720_3: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'GrpName'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      
        'select d720.rkey73,d73.user_login_name,user_full_name from data0' +
        '720 d720 inner join data0073 d73 on d720.rkey73=d73.rkey'
      'where GrpName=:GrpName  and ttype=1'
      'order by 2')
    Left = 48
    Top = 232
    object ADOData720_3user_login_name: TStringField
      DisplayLabel = #25805#20316#21592#20195#30721
      FieldName = 'user_login_name'
      Size = 15
    end
    object ADOData720_3user_full_name: TStringField
      DisplayLabel = #25805#20316#21592#21517#31216
      FieldName = 'user_full_name'
      Size = 30
    end
    object ADOData720_3rkey73: TIntegerField
      FieldName = 'rkey73'
    end
  end
  object DS1: TDataSource
    DataSet = ADOData720_1
    Left = 120
    Top = 120
  end
  object DS2: TDataSource
    DataSet = ADOData720_2
    Left = 120
    Top = 184
  end
  object DS3: TDataSource
    DataSet = ADOData720_3
    Left = 120
    Top = 248
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 256
    Top = 176
  end
end
