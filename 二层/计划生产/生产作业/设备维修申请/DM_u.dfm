object DM: TDM
  OldCreateOrder = False
  Left = 583
  Top = 242
  Height = 359
  Width = 336
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 128
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 88
    Top = 208
  end
  object DS1: TDataSource
    DataSet = ADO567
    Left = 168
    Top = 40
  end
  object ADO567: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    AfterScroll = ADO567AfterScroll
    Parameters = <>
    SQL.Strings = (
      
        'SELECT DATA0567.*,Data0034.DEPT_CODE,Data0034.DEPT_NAME,Data0417' +
        '.FASSET_CODE,Data0417.FASSET_NAME, '
      
        '       Data0417.FASSET_DESC,Data0005.EMPL_CODE,Data0005.EMPLOYEE' +
        '_NAME,Data0015.warehouse_code,'
      '       Data0015.ABBR_NAME,Data0514.FASSET_TYPE,'
      
        '       case status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 th' +
        'en '#39#24050#21463#29702#39
      '       when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' '
      '       when 6 then '#39#24050#26242#20572#39' when 7 then '#39#25237#35785#39' when 8 then '#39#39564#25910#36864#22238#39' '
      '       end status_c,d5.EMPLOYEE_NAME  vali_name,'
      '       Data0034.rkey rkey34,d5_1.EMPLOYEE_NAME dispodalMan,'
      
        '       '#39'tslr'#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + remark fr' +
        'om data0841'
      '       where data0841.D567_ptr=data0567.rkey and Status_ptr=7'
      '       FOR XML PATH('#39#39')), 1, 1, '#39#39')),'
      
        '       '#39'thlr'#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + remark fr' +
        'om data0841'
      '       where data0841.D567_ptr=data0567.rkey and Status_ptr=8'
      '       FOR XML PATH('#39#39')), 1, 1, '#39#39'))'
      'FROM   DATA0567 INNER JOIN'
      
        '       Data0034 ON dbo.DATA0567.DEPT_PTR = Data0034.rkey INNER J' +
        'OIN'
      
        '       Data0417 ON dbo.DATA0567.FASSET_PTR = Data0417.RKEY LEFT ' +
        'OUTER JOIN      '
      
        '       Data0514 ON DATA0417.FASSET_TYPE_PTR = Data0514.RKEY INNE' +
        'R JOIN'
      
        '       Data0005 ON dbo.DATA0567.EMPL_PTR = Data0005.RKEY left jo' +
        'in data0005 d5 on'
      
        '       DATA0567.validate_emplPTR=d5.rkey  left join data0005 d5_' +
        '1 on'
      '       DATA0567.disposal_emplPTR=d5_1.rkey inner join'
      '       Data0015 ON Data0567.whouse_ptr=Data0015.rkey')
    Left = 88
    Top = 40
    object ADO567RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO567NUMBER: TStringField
      FieldName = 'NUMBER'
      Size = 15
    end
    object ADO567status_c: TStringField
      DisplayWidth = 8
      FieldName = 'status_c'
      ReadOnly = True
      Size = 8
    end
    object ADO567STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO567DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO567FASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
    end
    object ADO567PLACE: TStringField
      FieldName = 'PLACE'
      Size = 40
    end
    object ADO567equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 10
    end
    object ADO567failure_grade: TStringField
      FieldName = 'failure_grade'
      Size = 4
    end
    object ADO567failure_degree: TStringField
      FieldName = 'failure_degree'
      Size = 8
    end
    object ADO567failure_date: TDateTimeField
      FieldName = 'failure_date'
    end
    object ADO567EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO567ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO567referring_date: TDateTimeField
      FieldName = 'referring_date'
    end
    object ADO567CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
      Size = 10
    end
    object ADO567CONTACT_PHONE: TStringField
      FieldName = 'CONTACT_PHONE'
      Size = 15
    end
    object ADO567failure_circs: TStringField
      FieldName = 'failure_circs'
      Size = 200
    end
    object ADO567disposal_emplptr: TIntegerField
      FieldName = 'disposal_emplptr'
    end
    object ADO567disposal_date: TDateTimeField
      FieldName = 'disposal_date'
    end
    object ADO567maintain_empl: TStringField
      FieldName = 'maintain_empl'
      Size = 50
    end
    object ADO567maintain_text: TStringField
      FieldName = 'maintain_text'
      Size = 200
    end
    object ADO567complete_date: TDateTimeField
      FieldName = 'complete_date'
    end
    object ADO567validate_emplptr: TIntegerField
      FieldName = 'validate_emplptr'
    end
    object ADO567validate_date: TDateTimeField
      FieldName = 'validate_date'
    end
    object ADO567validate_appraise: TStringField
      DisplayLabel = #39564#25910#35780#20215
      FieldName = 'validate_appraise'
      Size = 50
    end
    object ADO567fail_type: TStringField
      FieldName = 'fail_type'
      Size = 30
    end
    object ADO567DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADO567DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADO567FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
    end
    object ADO567FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADO567FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADO567EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADO567EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADO567vali_name: TStringField
      FieldName = 'vali_name'
      Size = 16
    end
    object ADO567rkey34: TIntegerField
      FieldName = 'rkey34'
      ReadOnly = True
    end
    object ADO567dispodalMan: TStringField
      FieldName = 'dispodalMan'
      Size = 16
    end
    object ADO567WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ADO567ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADO567warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADO567validate_Description: TStringField
      DisplayLabel = #39564#25910#24847#35265
      FieldName = 'validate_Description'
      Size = 100
    end
    object ADO567tslr: TStringField
      DisplayLabel = #25237#35785#20869#23481
      FieldName = 'tslr'
      ReadOnly = True
      Size = 50
    end
    object ADO567thlr: TStringField
      DisplayLabel = #39564#25910#26102#36864#22238#21407#22240
      FieldName = 'thlr'
      ReadOnly = True
      Size = 500
    end
    object ADO567D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object ADO567D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADO567suspended_reason: TWideStringField
      FieldName = 'suspended_reason'
      Size = 50
    end
    object ADO567stoppage_time: TDateTimeField
      FieldName = 'stoppage_time'
    end
    object ADO567recovery_time: TDateTimeField
      FieldName = 'recovery_time'
    end
    object ADO567completion_emplptr: TIntegerField
      FieldName = 'completion_emplptr'
    end
    object ADO567stop_house: TBCDField
      FieldName = 'stop_house'
      Precision = 8
      Size = 2
    end
    object ADO567maintain_house: TBCDField
      FieldName = 'maintain_house'
      Precision = 8
      Size = 2
    end
    object ADO567D846_ptr: TIntegerField
      FieldName = 'D846_ptr'
    end
    object ADO567Staff_Sum_house: TBCDField
      FieldName = 'Staff_Sum_house'
      Precision = 8
      Size = 2
    end
    object ADO567FASSET_TYPE: TStringField
      FieldName = 'FASSET_TYPE'
    end
  end
  object ADO567_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey567'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select  * from data0567 where rkey=:rkey567')
    Left = 88
    Top = 96
    object ADO567_1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO567_1NUMBER: TStringField
      FieldName = 'NUMBER'
      Size = 15
    end
    object ADO567_1STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO567_1DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADO567_1FASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
    end
    object ADO567_1PLACE: TStringField
      FieldName = 'PLACE'
      Size = 40
    end
    object ADO567_1equipment_grade: TStringField
      FieldName = 'equipment_grade'
      Size = 10
    end
    object ADO567_1failure_grade: TStringField
      FieldName = 'failure_grade'
      Size = 4
    end
    object ADO567_1failure_degree: TStringField
      FieldName = 'failure_degree'
      Size = 8
    end
    object ADO567_1failure_date: TDateTimeField
      FieldName = 'failure_date'
    end
    object ADO567_1EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADO567_1ent_date: TDateTimeField
      FieldName = 'ent_date'
    end
    object ADO567_1referring_date: TDateTimeField
      FieldName = 'referring_date'
    end
    object ADO567_1CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
      Size = 10
    end
    object ADO567_1CONTACT_PHONE: TStringField
      FieldName = 'CONTACT_PHONE'
      Size = 15
    end
    object ADO567_1failure_circs: TStringField
      FieldName = 'failure_circs'
      Size = 200
    end
    object ADO567_1disposal_emplptr: TIntegerField
      FieldName = 'disposal_emplptr'
    end
    object ADO567_1disposal_date: TDateTimeField
      FieldName = 'disposal_date'
    end
    object ADO567_1maintain_empl: TStringField
      FieldName = 'maintain_empl'
      Size = 50
    end
    object ADO567_1maintain_text: TStringField
      FieldName = 'maintain_text'
      Size = 200
    end
    object ADO567_1complete_date: TDateTimeField
      FieldName = 'complete_date'
    end
    object ADO567_1validate_emplptr: TIntegerField
      FieldName = 'validate_emplptr'
    end
    object ADO567_1validate_date: TDateTimeField
      FieldName = 'validate_date'
    end
    object ADO567_1validate_appraise: TStringField
      FieldName = 'validate_appraise'
      Size = 50
    end
    object ADO567_1fail_type: TStringField
      FieldName = 'fail_type'
      Size = 30
    end
    object ADO567_1WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ADO567_1suspended_reason: TWideStringField
      FieldName = 'suspended_reason'
      Size = 50
    end
    object ADO567_1stoppage_time: TDateTimeField
      FieldName = 'stoppage_time'
    end
    object ADO567_1recovery_time: TDateTimeField
      FieldName = 'recovery_time'
    end
    object ADO567_1completion_emplptr: TIntegerField
      FieldName = 'completion_emplptr'
    end
    object ADO567_1stop_house: TBCDField
      FieldName = 'stop_house'
      Precision = 8
      Size = 2
    end
    object ADO567_1maintain_house: TBCDField
      FieldName = 'maintain_house'
      Precision = 8
      Size = 2
    end
    object ADO567_1validate_Description: TStringField
      FieldName = 'validate_Description'
      Size = 100
    end
    object ADO567_1D846_ptr: TIntegerField
      FieldName = 'D846_ptr'
    end
    object ADO567_1FaultName: TStringField
      FieldKind = fkLookup
      FieldName = 'FaultName'
      LookupDataSet = qry_D0846All
      LookupKeyFields = 'rkey'
      LookupResultField = 'FaultName'
      KeyFields = 'D846_ptr'
      Size = 50
      Lookup = True
    end
    object ADO567_1Staff_Sum_house: TBCDField
      FieldName = 'Staff_Sum_house'
      Precision = 8
      Size = 2
    end
    object ADO567_1D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object ADO567_1D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
  end
  object DS2: TDataSource
    DataSet = ADO567_1
    Left = 168
    Top = 96
  end
  object DS3: TDataSource
    DataSet = ADO568
    Left = 168
    Top = 152
  end
  object ADO568: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey567'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0568 where failure_ptr=:rkey567')
    Left = 88
    Top = 152
    object ADO568rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO568failure_ptr: TIntegerField
      FieldName = 'failure_ptr'
    end
    object ADO568part_name: TStringField
      DisplayLabel = #38646#20214#21517#31216
      FieldName = 'part_name'
    end
    object ADO568part_desc: TStringField
      DisplayLabel = #38646#20214#35268#26684
      FieldName = 'part_desc'
      Size = 50
    end
    object ADO568quantity: TBCDField
      DisplayLabel = #20351#29992#25968#37327
      FieldName = 'quantity'
      Precision = 8
      Size = 2
    end
    object ADO568supplier_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'supplier_name'
      Size = 50
    end
    object ADO568amout: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'amout'
      Precision = 8
      Size = 2
    end
    object ADO568remart: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remart'
      Size = 100
    end
  end
  object ADOQuery1: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 88
    Top = 264
  end
  object qry_841: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vD567_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0073.USER_FULL_NAME,'
      
        'case [Status_ptr]when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then' +
        ' '#39#24050#21463#29702#39
      
        'when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' when 6 the' +
        'n '#39#24050#26242#20572#39' '
      
        'when 7 then '#39#25237#35785#39' when 8 then '#39#39564#25910#36864#22238#39' end as Status,[Record_date],' +
        '[remark] '
      'from DATA0841 '
      'join data0073 on DATA0841.User_ptr= data0073.rkey'
      'where [Status_ptr]<>7 and [D567_ptr]=:vD567_ptr')
    Left = 168
    Top = 208
    object qry_841USER_FULL_NAME: TStringField
      DisplayLabel = #29992#25143
      DisplayWidth = 10
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object qry_841Status: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'Status'
      ReadOnly = True
      Size = 8
    end
    object qry_841Record_date: TDateTimeField
      DisplayLabel = #26085#26399
      DisplayWidth = 22
      FieldName = 'Record_date'
    end
    object qry_841remark: TWideStringField
      DisplayLabel = #25551#36848
      DisplayWidth = 40
      FieldName = 'remark'
      Size = 50
    end
  end
  object qry_841_1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vD567_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select data0073.USER_FULL_NAME,'
      
        'case [Status_ptr]when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then' +
        ' '#39#24050#21463#29702#39
      
        'when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' when 6 the' +
        'n '#39#24050#26242#20572#39' '
      
        'when 7 then '#39#25237#35785#39' when 8 then '#39#39564#25910#36864#22238#39' end as Status,[Record_date],' +
        '[remark] '
      'from DATA0841 '
      'join data0073 on DATA0841.User_ptr= data0073.rkey'
      'where [Status_ptr]=7 and [D567_ptr]=:vD567_ptr')
    Left = 168
    Top = 264
    object StringField1: TStringField
      DisplayLabel = #29992#25143
      DisplayWidth = 10
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object StringField2: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'Status'
      ReadOnly = True
      Size = 8
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #26085#26399
      DisplayWidth = 22
      FieldName = 'Record_date'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = #25551#36848
      DisplayWidth = 40
      FieldName = 'remark'
      Size = 50
    end
  end
  object qry_D0846: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vFASSET_CODE'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'select data0846.rkey,[FaultName]from data0846 '
      'join data0845 on   data0845.rkey=[data0846].[D845_ptr] '
      'join DATA0417 on  data0845.rkey=DATA0417.[D845_ptr] '
      'where DATA0417.FASSET_CODE =:vFASSET_CODE     ')
    Left = 264
    Top = 264
    object qry_D0846rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object qry_D0846FaultName: TStringField
      DisplayLabel = #25925#38556#21517#31216
      FieldName = 'FaultName'
      Size = 50
    end
  end
  object qry_D0846All: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select data0846.rkey,[FaultName]from data0846 '
      'join data0845 on   data0845.rkey=[data0846].[D845_ptr] '
      'join DATA0417 on  data0845.rkey=DATA0417.[D845_ptr] ')
    Left = 264
    Top = 208
    object AutoIncField1: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object StringField3: TStringField
      DisplayLabel = #25925#38556#21517#31216
      FieldName = 'FaultName'
      Size = 50
    end
  end
end
