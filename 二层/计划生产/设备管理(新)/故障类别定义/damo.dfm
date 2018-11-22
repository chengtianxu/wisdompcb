object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 160
  Height = 275
  Width = 255
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 24
  end
  object ADS845: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS845AfterScroll
    CommandText = 'select rkey,FaultDesc from data0845'
    IndexFieldNames = 'FaultDesc'
    Parameters = <>
    Left = 104
    Top = 96
    object ADS845rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS845FaultDesc: TStringField
      FieldName = 'FaultDesc'
      Size = 50
    end
  end
  object ADS846: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select rkey,D845_ptr,FaultName,stdDate from data0846  '#13#10'where D8' +
      '45_ptr=:rkey'
    DataSource = DataSource1
    IndexFieldNames = 'D845_ptr'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 120
    Top = 152
    object ADS846rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS846D845_ptr: TIntegerField
      FieldName = 'D845_ptr'
    end
    object ADS846FaultName: TStringField
      FieldName = 'FaultName'
      Size = 50
    end
    object ADS846stdDate: TBCDField
      FieldName = 'stdDate'
      Precision = 9
      Size = 2
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 200
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ADS845
    Left = 40
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = ADS846
    Left = 48
    Top = 144
  end
end
