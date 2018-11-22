object DM: TDM
  OldCreateOrder = False
  Left = 482
  Top = 258
  Height = 385
  Width = 374
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=wisdompcb_bak;Data Source=W001057'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 32
  end
  object ADS193: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT * ,'#13#10'case SPEC_RKEY when '#39'Y'#39' then '#39#21472#29255#39' else '#39#27169#26495#39#13#10'end as ' +
      'type'#13#10'from data0193'
    IndexFieldNames = 'CODE'
    Parameters = <>
    Left = 168
    Top = 96
    object ADS193RECORD_KEY: TAutoIncField
      FieldName = 'RECORD_KEY'
      ReadOnly = True
    end
    object ADS193CODE: TStringField
      DisplayLabel = #23618#21387#20195#30721
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object ADS193DESCRIPTION: TStringField
      DisplayLabel = #23618#21387#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object ADS193NUMBER_OF_LINES: TSmallintField
      FieldName = 'NUMBER_OF_LINES'
    end
    object ADS193SPEC_RKEY: TStringField
      FieldName = 'SPEC_RKEY'
      FixedChar = True
      Size = 1
    end
    object ADS193THK_NESS: TFloatField
      FieldName = 'THK_NESS'
    end
    object ADS193layers_info: TMemoField
      FieldName = 'layers_info'
      BlobType = ftMemo
    end
    object ADS193type: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'type'
      ReadOnly = True
      Size = 4
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS193
    Left = 112
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 40
  end
end
