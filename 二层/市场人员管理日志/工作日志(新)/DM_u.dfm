object DM: TDM
  OldCreateOrder = False
  Left = 583
  Top = 242
  Height = 375
  Width = 336
  object ADOCon: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 32
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Filtered = True
    Parameters = <>
    Left = 256
    Top = 104
  end
  object DS1: TDataSource
    DataSet = ADO721
    Left = 16
    Top = 160
  end
  object ADO721: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT     dbo.data0721.*, '
      '             case when data0721.status=0 then '#39#26410#25552#20132#39
      '                      when data0721.status=1 then '#39#24453#23457#26680#39
      '                      when data0721.status=2 then '#39#24050#23457#26680#39
      
        '                      when data0721.status=3 then '#39#34987#36864#22238#39' end stat' +
        'us_c,'
      
        '             dbo.Data0073.USER_FULL_NAME, dbo.Data0073.USER_LOGI' +
        'N_NAME, '
      '              Data0073_1.USER_FULL_NAME  USER_FULL_NAME_A,'
      
        '              Data0073_1.USER_LOGIN_NAME USER_LOGIN_NAME_A      ' +
        '      '
      'FROM         dbo.data0721 INNER JOIN'
      
        '                      dbo.Data0073 ON dbo.data0721.salesID = dbo' +
        '.Data0073.RKEY left JOIN'
      
        '                      dbo.Data0073 AS Data0073_1 ON  dbo.data072' +
        '1.AuditID = Data0073_1.RKEY'
      '')
    Left = 64
    Top = 160
    object ADO721rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO721LogNo: TStringField
      DisplayLabel = #26085#24535#21333#21495
      FieldName = 'LogNo'
      FixedChar = True
      Size = 8
    end
    object ADO721CustName: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CustName'
      Size = 40
    end
    object ADO721VistPlace: TStringField
      DisplayLabel = #25308#35775#22320#28857
      FieldName = 'VistPlace'
      Size = 40
    end
    object ADO721VistDate: TDateTimeField
      DisplayLabel = #25308#35775#26102#38388
      FieldName = 'VistDate'
    end
    object ADO721visitors: TStringField
      DisplayLabel = #25308#35775#20154#21592
      FieldName = 'visitors'
      Size = 150
    end
    object ADO721visitedMan: TStringField
      DisplayLabel = #21463#35775#20154#21592
      FieldName = 'visitedMan'
      Size = 150
    end
    object ADO721Influence: TStringField
      DisplayLabel = #24433#21709
      FieldName = 'Influence'
      Size = 150
    end
    object ADO721aims: TStringField
      DisplayLabel = #25308#35775#30446#30340
      FieldName = 'aims'
      Size = 150
    end
    object ADO721subjects: TStringField
      DisplayLabel = #27807#36890#20027#39064
      FieldName = 'subjects'
      Size = 250
    end
    object ADO721feedback: TStringField
      DisplayLabel = #23458#25143#21453#39304
      FieldName = 'feedback'
      Size = 500
    end
    object ADO721others: TStringField
      DisplayLabel = #20854#23427
      FieldName = 'others'
      Size = 500
    end
    object ADO721NextVistDate: TDateTimeField
      DisplayLabel = #19979#27425#25308#35775#26085#26399
      FieldName = 'NextVistDate'
    end
    object ADO721nextSub: TStringField
      DisplayLabel = #19979#27425#27807#36890#20027#39064
      FieldName = 'nextSub'
      Size = 50
    end
    object ADO721actions: TStringField
      DisplayLabel = #34892#21160#35745#21010
      FieldName = 'actions'
      Size = 500
    end
    object ADO721isUpdate: TBooleanField
      DisplayLabel = #26356#26032#23458#25143#26723#26696
      FieldName = 'isUpdate'
    end
    object ADO721status: TIntegerField
      FieldName = 'status'
    end
    object ADO721status_c: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADO721salesID: TIntegerField
      FieldName = 'salesID'
    end
    object ADO721AuditID: TIntegerField
      FieldName = 'AuditID'
    end
    object ADO721AuditRemark: TStringField
      DisplayLabel = #23457#26680#35780#20215
      FieldName = 'AuditRemark'
      Size = 150
    end
    object ADO721USER_FULL_NAME: TStringField
      DisplayLabel = #19994#21153#21592#21517#31216
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO721USER_LOGIN_NAME: TStringField
      DisplayLabel = #19994#21153#21592#20195#30721
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADO721USER_FULL_NAME_A: TStringField
      DisplayLabel = #23457#26680#21592#21517#31216
      FieldName = 'USER_FULL_NAME_A'
      Size = 30
    end
    object ADO721USER_LOGIN_NAME_A: TStringField
      DisplayLabel = #23457#26680#21592#20195#30721
      FieldName = 'USER_LOGIN_NAME_A'
      Size = 15
    end
    object ADO721AuditDate: TDateTimeField
      DisplayLabel = #23457#26680#26085#26399
      FieldName = 'AuditDate'
    end
    object ADO721ent_Date: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'ent_Date'
    end
  end
  object ADO721_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey721'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from data0721 where rkey=:rkey721')
    Left = 64
    Top = 224
  end
  object DS2: TDataSource
    DataSet = ADO721_1
    Left = 16
    Top = 224
  end
end
