object DM: TDM
  OldCreateOrder = False
  Left = 584
  Top = 295
  Height = 327
  Width = 215
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 28
    Top = 20
  end
  object AQ81: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT rkey, layers, sufchar'
      'FROM data0081'
      'ORDER BY layers')
    Left = 82
    Top = 20
    object AQ81rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ81layers: TWordField
      DisplayLabel = #23618#25968
      FieldName = 'layers'
    end
    object AQ81sufchar: TStringField
      DisplayLabel = #27969#27700#21495
      FieldName = 'sufchar'
      Size = 10
    end
  end
  object DS81: TDataSource
    DataSet = AQ81
    Left = 136
    Top = 20
  end
  object AQTmp: TADOQuery
    Connection = ADOCon
    Parameters = <
      item
        Name = 'layer'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT rkey, layers, sufchar'
      'FROM data0081'
      'WHERE layers = :layer')
    Left = 82
    Top = 76
  end
end
