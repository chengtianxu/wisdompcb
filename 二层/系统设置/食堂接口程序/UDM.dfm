object DM: TDM
  OldCreateOrder = False
  Left = 246
  Top = 108
  Height = 470
  Width = 714
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=Topcb_0.188;Persist Security Info=T' +
      'rue;User ID=sa;Initial Catalog=eastriver_card;Data Source=172.17' +
      '.0.188;Use Procedure for Prepare=1;Auto Translate=True;Packet Si' +
      'ze=4096;Workstation ID=W000072;Use Encryption for Data=False;Tag' +
      ' with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object ADOADD1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     employeecode, cardno_dec, employeename, case factoryt' +
        'ype when 01 then '#39#28145#22323#20116#26666#39' when 02 then '#39#26757#24030#24535#28009#39' end as factorytype1,'
      'factorytype'
      'FROM         dbo.employeecard_eastriver_needadd_01'
      'order by  employeecode')
    Left = 177
    Top = 213
    object ADOADD1employeecode: TWideStringField
      FieldName = 'employeecode'
      Size = 50
    end
    object ADOADD1cardno_dec: TWideStringField
      FieldName = 'cardno_dec'
    end
    object ADOADD1employeename: TWideStringField
      FieldName = 'employeename'
      Size = 50
    end
    object ADOADD1factorytype1: TStringField
      FieldName = 'factorytype1'
      ReadOnly = True
      Size = 8
    end
    object ADOADD1factorytype: TWideStringField
      FieldName = 'factorytype'
    end
  end
  object ADOREDU1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     employeecode, cardno_dec, employeename, case factoryt' +
        'ype when 01 then '#39#28145#22323#20116#26666#39' when 02 then '#39#26757#24030#24535#28009#39' end as factorytype1,'
      'factorytype'
      'FROM          dbo.employeecard_eastriver_needremove_01'
      'order by  employeecode')
    Left = 425
    Top = 213
    object ADOREDU1employeecode: TWideStringField
      FieldName = 'employeecode'
      Size = 50
    end
    object ADOREDU1cardno_dec: TWideStringField
      FieldName = 'cardno_dec'
    end
    object ADOREDU1employeename: TWideStringField
      FieldName = 'employeename'
      Size = 50
    end
    object ADOREDU1factorytype1: TStringField
      FieldName = 'factorytype1'
      ReadOnly = True
      Size = 8
    end
    object ADOREDU1factorytype: TWideStringField
      FieldName = 'factorytype'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOADD1
    Left = 16
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = ADOREDU1
    Left = 96
    Top = 88
  end
  object ADORCD1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     id, empno, employeecard, card_time, date_e, time_e, d' +
        'ev_id, dev_mark, empid, remark1, remark2, remark3, factorytype,'
      
        '                 CASE factorytype when 01 then '#39#28145#22323#20116#26666#39' when 02 th' +
        'en '#39#26757#24030#24535#28009#39' end as factorytype1'
      'FROM         employeecard_eastriver_rcd_01')
    Left = 94
    Top = 213
    object ADORCD1id: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object ADORCD1empno: TWideStringField
      FieldName = 'empno'
      Size = 50
    end
    object ADORCD1employeecard: TWideStringField
      FieldName = 'employeecard'
      FixedChar = True
      Size = 10
    end
    object ADORCD1card_time: TDateTimeField
      FieldName = 'card_time'
    end
    object ADORCD1date_e: TWideStringField
      FieldName = 'date_e'
      Size = 50
    end
    object ADORCD1time_e: TWideStringField
      FieldName = 'time_e'
      Size = 50
    end
    object ADORCD1dev_id: TWideStringField
      FieldName = 'dev_id'
      FixedChar = True
      Size = 10
    end
    object ADORCD1dev_mark: TWideStringField
      FieldName = 'dev_mark'
      FixedChar = True
      Size = 10
    end
    object ADORCD1empid: TWideStringField
      FieldName = 'empid'
      FixedChar = True
      Size = 10
    end
    object ADORCD1remark1: TIntegerField
      FieldName = 'remark1'
    end
    object ADORCD1remark2: TWideStringField
      FieldName = 'remark2'
      Size = 50
    end
    object ADORCD1remark3: TWideStringField
      FieldName = 'remark3'
      Size = 50
    end
    object ADORCD1factorytype: TWideStringField
      FieldName = 'factorytype'
      FixedChar = True
      Size = 10
    end
    object ADORCD1factorytype1: TStringField
      FieldName = 'factorytype1'
      ReadOnly = True
      Size = 8
    end
  end
  object DataSource3: TDataSource
    DataSet = ADORCD1
    Left = 176
    Top = 88
  end
  object ADOTMP: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 13
    Top = 155
  end
  object ADOGETDATA: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 12
    Top = 213
  end
  object ADODataSet_cx: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 11
    Top = 285
  end
  object DataSource_cx: TDataSource
    DataSet = ADODataSet_cx
    Left = 256
    Top = 88
  end
  object ADOQ_updateccview: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 342
    Top = 213
  end
  object ADODataSet_deplist: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select distinct departmentname from dbo.View_canci_04'#13#10'order by ' +
      'departmentname'
    Parameters = <>
    Left = 148
    Top = 285
  end
  object ADOupdate_cx: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 259
    Top = 213
  end
  object ADODataSet_emplist: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    AfterScroll = ADODataSet_emplistAfterScroll
    Parameters = <>
    Left = 285
    Top = 285
  end
  object DataSource_emplist: TDataSource
    DataSet = ADODataSet_emplist
    Left = 336
    Top = 88
  end
  object ADODataSet_emptrip: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 407
    Top = 285
  end
  object DataSource_emptrip: TDataSource
    DataSet = ADODataSet_emptrip
    Left = 416
    Top = 88
  end
  object ADODataSet_checkempcard: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 544
    Top = 284
  end
end
