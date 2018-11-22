object DM: TDM
  OldCreateOrder = False
  Left = 382
  Top = 297
  Height = 191
  Width = 215
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=sj_v20_sample;Data Source=kmerp_wz'
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    OnCalcFields = ADOQuery1CalcFields
    OnDeleteError = ADOQuery1DeleteError
    Parameters = <>
    SQL.Strings = (
      'select * '
      'from data0515'
      'order by rkey')
    Left = 88
    Top = 16
    object ADOQuery1RKEY: TSmallintField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQuery1FASSET_ALT_TYPE: TStringField
      DisplayLabel = #36164#20135#21464#21160#26041#24335
      FieldName = 'FASSET_ALT_TYPE'
      FixedChar = True
    end
    object ADOQuery1ALT_FLAG: TSmallintField
      FieldName = 'ALT_FLAG'
    end
    object ADOQuery1type: TStringField
      DisplayLabel = #21464#21160#32467#26524
      FieldKind = fkCalculated
      FieldName = 'type'
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 144
    Top = 16
  end
  object ado0525: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftSmallint
        Precision = 5
        Size = 2
        Value = 0
      end>
    SQL.Strings = (
      'select * from data0525'
      'where act_ptr=:rkey'
      'order by rkey')
    Left = 88
    Top = 80
  end
end
