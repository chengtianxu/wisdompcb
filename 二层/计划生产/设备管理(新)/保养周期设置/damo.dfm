object DM: TDM
  OldCreateOrder = False
  Left = 469
  Top = 292
  Height = 312
  Width = 215
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=demo2;Data Source=192.168.8.37;' +
      'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096' +
      ';Workstation ID=PC-20150130VGBU;Use Encryption for Data=False;Ta' +
      'g with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object ADS811: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 'select DeviType,TypeName,TypeDesc from data0811'
    IndexFieldNames = 'DeviType'
    Parameters = <>
    Left = 24
    Top = 72
    object ADS811DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object ADS811TypeName: TStringField
      FieldName = 'TypeName'
    end
    object ADS811TypeDesc: TStringField
      FieldName = 'TypeDesc'
      Size = 100
    end
  end
  object ADS812: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select  DeviType,MainCycl,cycl_duration ,AdvanceDays'#13#10'from data0' +
      '812 '#13#10'where data0812.DeviType=:DeviType'#13#10'order by'#13#10' (select rkey' +
      ' from data0816 where data0812.MainCycl = Data0816.MainCycl)'
    DataSource = DataSource1
    MasterFields = 'DeviType'
    Parameters = <
      item
        Name = 'DeviType'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    Left = 16
    Top = 136
    object ADS812MainCycl: TStringField
      FieldName = 'MainCycl'
      Size = 10
    end
    object ADS812cycl_duration: TIntegerField
      FieldName = 'cycl_duration'
    end
    object ADS812DeviType: TStringField
      FieldName = 'DeviType'
      Size = 10
    end
    object ADS812AdvanceDays: TIntegerField
      DisplayLabel = #20445#20859#25552#21069#36890#30693#22825#25968
      FieldName = 'AdvanceDays'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS811
    Left = 88
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = ADS812
    Left = 96
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 48
    Top = 200
  end
end
