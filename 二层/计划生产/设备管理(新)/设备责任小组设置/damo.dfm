object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 160
  Height = 248
  Width = 252
  object DataSource1: TDataSource
    DataSet = ADS840
    Left = 40
    Top = 64
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object ADS840: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADS840AfterScroll
    CommandText = 
      'select data0840.rkey,data0840.location,case data0840.OutsPrep wh' +
      'en 0 then '#39#21542#39' else '#39#26159#39' end as vOutdPrep,data0840.D015_ptr, '#13#10'cas' +
      'e data0840.active when 0 then '#39#21542#39' else '#39#26159#39' end as vactive,Data00' +
      '15.ABBR_NAME'#13#10'from  data0840 INNER JOIN Data0015 ON data0840.D01' +
      '5_ptr = Data0015.RKEY'#13#10
    IndexFieldNames = 'location'
    Parameters = <>
    Left = 128
    Top = 32
    object ADS840rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS840ABBR_NAME: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS840location: TStringField
      DisplayLabel = #36131#20219#23567#32452
      FieldName = 'location'
    end
    object ADS840vOutdPrep: TStringField
      DisplayLabel = #32534#22806
      FieldName = 'vOutdPrep'
      ReadOnly = True
      Size = 2
    end
    object ADS840vactive: TStringField
      DisplayLabel = #26377#25928
      FieldName = 'vactive'
      ReadOnly = True
      Size = 2
    end
    object ADS840D015_ptr: TIntegerField
      FieldName = 'D015_ptr'
    end
  end
  object ADS855: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT  dbo.Data0855.Rkey, dbo.Data0855.D840_ptr,Data0855.D005_p' +
      'tr,'#13#10'               case dbo.Data0855.TTYPE when 0 then '#39#21542#39' else' +
      ' '#39#26159#39' end as type,'#13#10'               dbo.Data0855.EntrDate, dbo.Dat' +
      'a0855.DepaDate, dbo.Data0005.EMPL_CODE, '#13#10'              dbo.Data' +
      '0005.EMPLOYEE_NAME'#13#10'FROM    dbo.Data0005 INNER JOIN dbo.Data0855' +
      ' ON dbo.Data0005.RKEY = dbo.Data0855.D005_ptr'#13#10'where    dbo.Data' +
      '0855.D840_ptr=:rkey'
    DataSource = DataSource1
    IndexFieldNames = 'D840_ptr'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    Left = 120
    Top = 96
    object ADS855Rkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ADS855EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS855EMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS855type: TStringField
      DisplayLabel = #26159#36127#36131#20154
      FieldName = 'type'
      ReadOnly = True
      Size = 2
    end
    object ADS855EntrDate: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'EntrDate'
    end
    object ADS855DepaDate: TDateTimeField
      DisplayLabel = #31163#32844#26085#26399
      FieldName = 'DepaDate'
    end
    object ADS855D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADS855D005_ptr: TIntegerField
      FieldName = 'D005_ptr'
    end
  end
  object tmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 128
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = ADS855
    Left = 24
    Top = 120
  end
end
