object DM: TDM
  OldCreateOrder = False
  Left = 241
  Top = 152
  Height = 228
  Width = 279
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=sj_v20_sample;Data Source=KMERP_WZ'
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    AfterScroll = ADOQuery1AfterScroll
    OnDeleteError = ADOQuery1DeleteError
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from data0512 '
      'order by rkey')
    Left = 120
    Top = 24
    object ADOQuery1DICT_GRP: TStringField
      FieldName = 'DICT_GRP'
      FixedChar = True
      Size = 30
    end
    object ADOQuery1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    Filtered = True
    OnDeleteError = ADOQuery1DeleteError
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from data0513')
    Left = 120
    Top = 80
    object ADOQuery2DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object ADOQuery2RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery2GRP_PTR: TIntegerField
      FieldName = 'GRP_PTR'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 184
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 184
    Top = 80
  end
  object ADOQ: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 120
    Top = 144
  end
end
