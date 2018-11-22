object DM: TDM
  OldCreateOrder = False
  Left = 687
  Top = 269
  Height = 484
  Width = 416
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object ADODict: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'select rkey ,item from  datadict '
    Parameters = <>
    Left = 32
    Top = 96
    object ADODictrkey: TIntegerField
      FieldName = 'rkey'
    end
    object ADODictitem: TWideStringField
      FieldName = 'item'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODict
    Left = 112
    Top = 96
  end
  object ADODetail: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'select rkey,dictid, item,memo,train_flag,user_defined1,user_defi' +
      'ned2 from datadetail where dictid=:dictid'
    Parameters = <
      item
        Name = 'dictid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 40
    Top = 192
    object ADODetaildictid: TIntegerField
      FieldName = 'dictid'
    end
    object ADODetailitem: TWideStringField
      FieldName = 'item'
    end
    object ADODetailmemo: TWideStringField
      FieldName = 'memo'
      Size = 200
    end
    object ADODetailtrain_flag: TBooleanField
      FieldName = 'train_flag'
    end
    object ADODetailuser_defined1: TIntegerField
      FieldName = 'user_defined1'
    end
    object ADODetailuser_defined2: TIntegerField
      FieldName = 'user_defined2'
    end
    object ADODetailrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODetail
    Left = 120
    Top = 192
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Left = 264
    Top = 64
  end
  object ADODict_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'item'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'select * from datadetail where item=:item')
    Left = 32
    Top = 264
  end
  object DataSource3: TDataSource
    DataSet = ADODict_1
    Left = 120
    Top = 272
  end
end
