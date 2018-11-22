object DM: TDM
  OldCreateOrder = False
  Left = 382
  Top = 274
  Height = 214
  Width = 347
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 80
  end
  object ADODict: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 'select rkey, item from datadict'
    Parameters = <>
    Left = 104
    Top = 40
    object ADODictrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADODictitem: TWideStringField
      FieldName = 'item'
    end
  end
  object ADODetail: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    AfterInsert = ADODetailAfterInsert
    CommandText = 
      'select dictid, item,memo,train_flag,user_defined1,user_defined2 ' +
      'from datadetail where dictid=:dictid'
    Parameters = <
      item
        Name = 'dictid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 104
    Top = 112
    object ADODetaildictid: TIntegerField
      DisplayLabel = #31867#22411#21517#31216
      FieldName = 'dictid'
    end
    object ADODetailitem: TWideStringField
      DisplayLabel = #31867#22411#26126#32454#21517#31216
      FieldName = 'item'
    end
    object ADODetailtrain_flag: TBooleanField
      DisplayLabel = #20851#32852#22521#35757
      FieldName = 'train_flag'
    end
    object ADODetailmemo: TWideStringField
      DisplayLabel = #35828#26126
      DisplayWidth = 60
      FieldName = 'memo'
      Size = 200
    end
    object ADODetailuser_defined1: TIntegerField
      FieldName = 'user_defined1'
    end
    object ADODetailuser_defined2: TIntegerField
      FieldName = 'user_defined2'
    end
  end
  object DSDict: TDataSource
    DataSet = ADODict
    Left = 176
    Top = 40
  end
  object DSDetail: TDataSource
    DataSet = ADODetail
    OnStateChange = DSDetailStateChange
    Left = 176
    Top = 112
  end
  object AQTemp: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 256
    Top = 40
  end
end
