object DM: TDM
  OldCreateOrder = False
  Left = 412
  Top = 167
  Height = 313
  Width = 349
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 64
    Top = 48
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 136
    Top = 48
  end
  object ADOTable1: TADOTable
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    AfterDelete = ADOTable1AfterDelete
    OnDeleteError = ADOTable1DeleteError
    OnPostError = ADOTable1PostError
    IndexFieldNames = 'PR_GRP_CODE'
    TableName = 'Data0007'
    Left = 136
    Top = 104
    object ADOTable1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTable1PR_GRP_CODE: TStringField
      DisplayLabel = #20135#21697#31181#31867#20195#30721
      DisplayWidth = 29
      FieldName = 'PR_GRP_CODE'
      Size = 5
    end
    object ADOTable1PRODUCT_GROUP_NAME: TStringField
      DisplayLabel = #20135#21697#31181#31867#21517#31216
      DisplayWidth = 43
      FieldName = 'PRODUCT_GROUP_NAME'
      Size = 30
    end
  end
end
