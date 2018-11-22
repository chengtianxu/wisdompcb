object DM: TDM
  OldCreateOrder = False
  Left = 391
  Top = 175
  Height = 557
  Width = 783
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 96
  end
  object ADS567_Delete: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    Filtered = True
    BeforeClose = ADS567_DeleteBeforeClose
    AfterClose = ADS567_DeleteAfterClose
    AfterScroll = ADS567_DeleteAfterScroll
    OnCalcFields = ADS567_DeleteCalcFields
    CommandText = 
      'select * from (SELECT DATA0567.*,'#13#10'Data0034.DEPT_CODE,Data0034.D' +
      'EPT_NAME, '#13#10'       Data0417.FASSET_CODE,Data0417.FASSET_NAME,Dat' +
      'a0417.FASSET_DESC, '#13#10'       Data0005.EMPL_CODE,Data0005.EMPLOYEE' +
      '_NAME,data0015.warehouse_code,data0015.abbr_name,'#13#10'       case d' +
      'ata0567.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' when 2 then '#39 +
      #24050#21463#29702#39#13#10'       when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864 +
      #22238#39' when 6 then '#39#24050#26242#20572#39' '#13#10'       when 8 then '#39#39564#25910#36864#22238#39'  end as V_stat,' +
      #13#10'       Data0005_1.empl_code as disposal_emplcode,Data0005_1.EM' +
      'PLOYEE_NAME as disposal_emplname,'#13#10'       Data0005_2.empl_code a' +
      's completion_emplcode,'#13#10'       Data0005_2.EMPLOYEE_NAME as compl' +
      'etion_emplname,'#13#10'       '#39'tslr'#39'=convert(varchar(500),STUFF((SELEC' +
      'T '#39#65307#39' + remark from data0841'#13#10'       where data0841.D567_ptr=dat' +
      'a0567.rkey and Status_ptr=7'#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39')' +
      '),'#13#10'       '#39'thlr'#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + remar' +
      'k from data0841'#13#10'       where data0841.D567_ptr=data0567.rkey an' +
      'd Status_ptr=8'#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39'))'#13#10'FROM   DAT' +
      'A0567 INNER JOIN'#13#10'       Data0417 ON DATA0567.FASSET_PTR = Data0' +
      '417.RKEY INNER JOIN'#13#10'       Data0034 ON DATA0567.DEPT_PTR = Data' +
      '0034.RKEY INNER JOIN'#13#10'       Data0005 ON DATA0567.EMPL_PTR = Dat' +
      'a0005.RKEY left outer JOIN'#13#10'       Data0005 AS Data0005_1 ON DAT' +
      'A0567.disposal_emplptr = Data0005_1.RKEY left outer join'#13#10'      ' +
      ' Data0005 AS Data0005_2 ON Data0567.completion_emplptr=Data0005_' +
      '2.RKEY left outer join'#13#10'       Data0015 ON DATA0567.whouse_ptr=d' +
      'ata0015.rkey ) f1'#13#10'where  '#13#10'1=2'
    IndexFieldNames = 'NUMBER'
    Parameters = <>
    Prepared = True
    Left = 16
    Top = 216
    object ADS567_DeleteNUMBER: TStringField
      DisplayLabel = #30003#35831#32534#21495
      FieldName = 'NUMBER'
      Size = 15
    end
    object ADS567_DeleteFASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'FASSET_CODE'
    end
    object ADS567_DeleteFASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      Size = 30
    end
    object ADS567_DeleteFASSET_DESC: TStringField
      DisplayLabel = #35774#22791#35268#26684#25551#36848
      FieldName = 'FASSET_DESC'
      Size = 40
    end
    object ADS567_DeleteEMPL_CODE: TStringField
      DisplayLabel = #30003#25253#20154#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ADS567_DeleteEMPLOYEE_NAME: TStringField
      DisplayLabel = #30003#25253#20154#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS567_DeleteRKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS567_DeleteDEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADS567_DeleteDEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADS567_DeleteSTATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADS567_DeleteDEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object ADS567_DeleteFASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
    end
    object ADS567_DeletePLACE: TStringField
      DisplayLabel = #35774#22791#22320#28857
      FieldName = 'PLACE'
      Size = 40
    end
    object ADS567_Deleteequipment_grade: TStringField
      DisplayLabel = #35774#22791#32423#21035
      FieldName = 'equipment_grade'
      Size = 10
    end
    object ADS567_Deletefailure_grade: TStringField
      DisplayLabel = #25925#38556#32423#21035
      FieldName = 'failure_grade'
      Size = 4
    end
    object ADS567_Deletefailure_degree: TStringField
      DisplayLabel = #25925#38556#31243#24230
      FieldName = 'failure_degree'
      Size = 8
    end
    object ADS567_Deletefailure_date: TDateTimeField
      DisplayLabel = #25925#38556#26085#26399
      FieldName = 'failure_date'
    end
    object ADS567_DeleteEMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADS567_Deleteent_date: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'ent_date'
    end
    object ADS567_Deletemaintain_text: TStringField
      DisplayLabel = #32500#20462#35760#24405
      FieldName = 'maintain_text'
      Size = 200
    end
    object ADS567_Deletereferring_date: TDateTimeField
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'referring_date'
    end
    object ADS567_DeleteCONTACT_NAME: TStringField
      DisplayLabel = #32852#32476#20154
      FieldName = 'CONTACT_NAME'
      Size = 10
    end
    object ADS567_DeleteCONTACT_PHONE: TStringField
      DisplayLabel = #32852#32476#30005#35805
      FieldName = 'CONTACT_PHONE'
      Size = 15
    end
    object ADS567_Deletefailure_circs: TStringField
      DisplayLabel = #25925#38556#35828#26126
      FieldName = 'failure_circs'
      Size = 200
    end
    object ADS567_Deletedisposal_emplptr: TIntegerField
      FieldName = 'disposal_emplptr'
    end
    object ADS567_Deletedisposal_date: TDateTimeField
      DisplayLabel = #21463#29702#26085#26399
      FieldName = 'disposal_date'
    end
    object ADS567_Deletemaintain_empl: TStringField
      DisplayLabel = #32500#20462#20154#21592
      FieldName = 'maintain_empl'
      Size = 50
    end
    object ADS567_Deletecomplete_date: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'complete_date'
      OnChange = ADS567_Deletecomplete_dateChange
    end
    object ADS567_Deletevalidate_emplptr: TIntegerField
      FieldName = 'validate_emplptr'
    end
    object ADS567_Deletevalidate_date: TDateTimeField
      DisplayLabel = #39564#25910#26085#26399
      FieldName = 'validate_date'
    end
    object ADS567_Deletevalidate_appraise: TStringField
      DisplayLabel = #39564#25910#35780#20215
      FieldName = 'validate_appraise'
      Size = 50
    end
    object ADS567_Deletestop_house: TBCDField
      DisplayLabel = #26242#20572#23567#26102
      FieldName = 'stop_house'
      OnChange = ADS567_Deletestop_houseChange
      Precision = 8
      Size = 2
    end
    object ADS567_Deletemaintain_house: TBCDField
      DisplayLabel = #32500#20462#20351#29992#23567#26102
      FieldName = 'maintain_house'
      Precision = 8
      Size = 2
    end
    object ADS567_DeleteV_stat: TStringField
      DisplayLabel = #29366#24577
      DisplayWidth = 8
      FieldName = 'V_stat'
      ReadOnly = True
      Size = 8
    end
    object ADS567_Deletedisposal_emplcode: TStringField
      DisplayLabel = #21463#29702#20154#20195#30721
      FieldName = 'disposal_emplcode'
      Size = 10
    end
    object ADS567_Deletedisposal_emplname: TStringField
      DisplayLabel = #21463#29702#20154#22995#21517
      FieldName = 'disposal_emplname'
      Size = 16
    end
    object ADS567_Deletefail_type: TStringField
      DisplayLabel = #24322#24120#31867#21035
      FieldName = 'fail_type'
      Size = 30
    end
    object ADS567_DeleteWHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
    end
    object ADS567_Deletewarehouse_code: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADS567_Deleteabbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADS567_Deletesuspended_reason: TWideStringField
      FieldName = 'suspended_reason'
      Size = 50
    end
    object ADS567_Deletestoppage_time: TDateTimeField
      FieldName = 'stoppage_time'
    end
    object ADS567_Deleterecovery_time: TDateTimeField
      FieldName = 'recovery_time'
    end
    object ADS567_Deletecompletion_emplcode: TStringField
      FieldName = 'completion_emplcode'
      Size = 10
    end
    object ADS567_Deletecompletion_emplname: TStringField
      FieldName = 'completion_emplname'
      Size = 16
    end
    object ADS567_Deletecompletion_emplptr: TIntegerField
      FieldName = 'completion_emplptr'
    end
    object ADS567_Deletevalidate_Description: TStringField
      DisplayLabel = #39564#25910#24847#35265
      FieldName = 'validate_Description'
      Size = 100
    end
    object ADS567_Deletetslr: TStringField
      DisplayLabel = #25237#35785#20869#23481
      FieldName = 'tslr'
      ReadOnly = True
      Size = 500
    end
    object ADS567_Deletethlr: TStringField
      DisplayLabel = #39564#25910#26102#36864#22238#21407#22240
      FieldName = 'thlr'
      ReadOnly = True
      Size = 500
    end
    object ADS567_DeleteD073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object ADS567_DeleteD846_ptr: TIntegerField
      FieldName = 'D846_ptr'
    end
    object ADS567_DeleteStaff_Sum_house: TBCDField
      DisplayLabel = #24037#20154#21512#35745#32500#20462#26102#38388
      FieldName = 'Staff_Sum_house'
      Precision = 8
      Size = 2
    end
    object ADS567_DeleteFaultName: TStringField
      DisplayLabel = #25925#38556#21517#31216
      FieldKind = fkLookup
      FieldName = 'FaultName'
      LookupDataSet = qry_D0846All
      LookupKeyFields = 'rkey'
      LookupResultField = 'FaultName'
      KeyFields = 'D846_ptr'
      Size = 50
      Lookup = True
    end
    object ADS567_DeletestdDate: TBCDField
      DisplayLabel = #26631#20934#32500#20462#26102#38388
      FieldKind = fkLookup
      FieldName = 'stdDate'
      LookupDataSet = qry_D0846All
      LookupKeyFields = 'rkey'
      LookupResultField = 'stdDate'
      KeyFields = 'D846_ptr'
      Precision = 9
      Size = 2
      Lookup = True
    end
    object ADS567_DeleteAchiRate: TFloatField
      DisplayLabel = #36798#25104#29575
      FieldKind = fkCalculated
      FieldName = 'AchiRate'
      OnGetText = ADS567_DeleteAchiRateGetText
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = cds567
    OnStateChange = DataSource1StateChange
    Left = 280
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 120
    Top = 32
  end
  object AQ568: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 2
      end>
    SQL.Strings = (
      'select * from data0568'
      'where failure_ptr=:rkey')
    Left = 120
    Top = 144
    object AQ568rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ568failure_ptr: TIntegerField
      FieldName = 'failure_ptr'
    end
    object AQ568part_name: TStringField
      DisplayLabel = #38646#20214#21517#31216
      FieldName = 'part_name'
    end
    object AQ568part_desc: TStringField
      DisplayLabel = #38646#20214#35268#26684
      FieldName = 'part_desc'
      Size = 50
    end
    object AQ568quantity: TBCDField
      DisplayLabel = #20351#29992#25968#37327
      FieldName = 'quantity'
      Precision = 8
      Size = 2
    end
    object AQ568supplier_name: TStringField
      DisplayLabel = #20379#24212#21830
      FieldName = 'supplier_name'
      Size = 50
    end
    object AQ568amout: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'amout'
      Precision = 8
      Size = 2
    end
    object AQ568remart: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remart'
      Size = 100
    end
  end
  object DataSource2: TDataSource
    DataSet = qry_data0468
    Left = 184
    Top = 144
  end
  object qry0577_1: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    BeforeInsert = qry0577_1BeforeInsert
    AfterInsert = qry0577_1AfterInsert
    BeforePost = qry0577_1BeforePost
    AfterPost = qry0577_1AfterPost
    BeforeDelete = qry0577_1BeforeDelete
    Parameters = <
      item
        Name = 'vRkey567'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0577 where Rkey567 = :vRkey567')
    Left = 184
    Top = 32
    object qry0577_1Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object qry0577_1rkey567: TIntegerField
      FieldName = 'rkey567'
    end
    object qry0577_1stop_begin_date: TDateTimeField
      FieldName = 'stop_begin_date'
    end
    object qry0577_1stop_end_date: TDateTimeField
      FieldName = 'stop_end_date'
    end
    object qry0577_1remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object cmdUpdate1: TADOCommand
    Connection = ADOConnection
    Parameters = <>
    Left = 40
    Top = 160
  end
  object qry_841: TADOQuery
    Connection = ADOConnection
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
    Left = 184
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
    Connection = ADOConnection
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
    Left = 184
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
  object AQ842: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'vWork_ptr'
        DataType = ftString
        Size = 1
        Value = '0'
      end>
    Left = 32
    Top = 328
    object AQ842rkey: TAutoIncField
      FieldName = 'rkey'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object AQ842Work_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object AQ842WorkDate: TDateTimeField
      FieldName = 'WorkDate'
    end
    object AQ842BeginTime: TDateTimeField
      FieldName = 'BeginTime'
    end
    object AQ842EndTime: TDateTimeField
      FieldName = 'EndTime'
    end
    object AQ842TimeCons: TBCDField
      FieldName = 'TimeCons'
      Precision = 8
      Size = 2
    end
    object AQ842TimeRest: TBCDField
      FieldName = 'TimeRest'
      Precision = 8
      Size = 2
    end
    object AQ842Empl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
    end
    object AQ842Status: TIntegerField
      FieldName = 'Status'
    end
    object AQ842WorkTime: TBCDField
      FieldName = 'WorkTime'
      Precision = 5
      Size = 2
    end
    object AQ842Remark: TStringField
      FieldName = 'Remark'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object AQ842EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object AQ842MainexecStat: TStringField
      FieldName = 'MainexecStat'
      ProviderFlags = []
      Size = 10
    end
    object AQ842EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object AQ842DayShift: TWordField
      FieldName = 'DayShift'
    end
  end
  object DS842: TDataSource
    DataSet = cds842
    OnStateChange = DataSource1StateChange
    Left = 192
    Top = 328
  end
  object dsp842: TDataSetProvider
    DataSet = AQ842
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    UpdateMode = upWhereKeyOnly
    AfterUpdateRecord = dsp842AfterUpdateRecord
    Left = 85
    Top = 328
  end
  object cds842: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select Data0842.*,data0005.EMPL_CODE,data0005.EMPLOYEE_NAME,Main' +
      'execStat from Data0842'#13#10'left join data0005 on Data0842.[Empl_ptr' +
      ']=data0005.rkey'#13#10'join data0832 on Data0842.[Status]=data0832.rke' +
      'y'#13#10'where [Work_ptr]= :vWork_ptr'
    Params = <
      item
        DataType = ftString
        Name = 'vWork_ptr'
        ParamType = ptUnknown
        Value = '0'
      end>
    ProviderName = 'dsp842'
    AfterInsert = cds842AfterInsert
    BeforePost = cds842BeforePost
    AfterPost = cds842AfterPost
    BeforeCancel = cds842BeforeCancel
    AfterCancel = cds842AfterCancel
    BeforeScroll = cds842BeforeScroll
    AfterScroll = cds842AfterScroll
    OnReconcileError = cds842ReconcileError
    Left = 138
    Top = 328
    object cds842Work_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object cds842WorkDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'WorkDate'
    end
    object cds842BeginTime: TDateTimeField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'BeginTime'
      OnChange = cds842BeginTimeChange
    end
    object cds842EndTime: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'EndTime'
      OnChange = cds842EndTimeChange
    end
    object cds842TimeCons: TBCDField
      DisplayLabel = #26242#20572#26102#38388
      FieldName = 'TimeCons'
      OnChange = cds842TimeRestChange
      Precision = 8
      Size = 2
    end
    object cds842TimeRest: TBCDField
      DisplayLabel = #20013#36884#20241#24687#26102#38388
      FieldName = 'TimeRest'
      OnChange = cds842TimeRestChange
      Precision = 8
      Size = 2
    end
    object cds842Empl_ptr: TIntegerField
      FieldName = 'Empl_ptr'
    end
    object cds842Status: TIntegerField
      FieldName = 'Status'
      OnChange = cds842StatusChange
    end
    object cds842WorkTime: TBCDField
      DisplayLabel = #38599#21592#24037#20316#26102#38388
      FieldName = 'WorkTime'
      Precision = 5
      Size = 2
    end
    object cds842Remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 200
    end
    object cds842EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      OnChange = cds842EMPL_CODEChange
      Size = 10
    end
    object cds842EMPLOYEE_NAME: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cds842MainexecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainexecStat'
      ProviderFlags = []
      Size = 10
    end
    object cds842rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object cds842DayShift: TSmallintField
      DisplayLabel = #29677#27425
      FieldName = 'DayShift'
    end
  end
  object AQ005: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'
      'where ACTIVE_FLAG='#39'Y'#39)
    Left = 296
    Top = 336
    object AQ005RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object AQ005EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object AQ005EMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object cds0005: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'#13#10'where ACTIVE_' +
      'FLAG='#39'Y'#39
    Params = <>
    ProviderName = 'dsp0005'
    ReadOnly = True
    Left = 448
    Top = 336
    object cds0005RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
      Visible = False
    end
    object cds0005EMPL_CODE: TStringField
      DisplayLabel = #38599#21592#20195#30721
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object cds0005EMPLOYEE_NAME: TStringField
      DisplayLabel = #38599#21592#21517#31216
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object dsp0005: TDataSetProvider
    DataSet = AQ005
    Options = [poAllowCommandText]
    Left = 376
    Top = 336
  end
  object AQ832: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select RKEY,EMPL_CODE,EMPLOYEE_NAME from data0005'
      'where ACTIVE_FLAG='#39'Y'#39)
    Left = 295
    Top = 288
    object AQ832RKEY: TIntegerField
      FieldName = 'RKEY'
    end
    object AQ832MainExecStat: TStringField
      FieldName = 'MainExecStat'
      Size = 10
    end
  end
  object dsp832: TDataSetProvider
    DataSet = AQ832
    Options = [poAllowCommandText]
    Left = 375
    Top = 288
  end
  object cds832: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0832'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dsp832'
    ReadOnly = True
    Left = 447
    Top = 288
    object cds832RKEY: TIntegerField
      FieldName = 'RKEY'
      Visible = False
    end
    object cds832MainExecStat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'MainExecStat'
      Size = 10
    end
  end
  object qry0843: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    AfterInsert = qry0843AfterInsert
    BeforePost = qry0843BeforePost
    AfterPost = qry0843AfterPost
    Parameters = <
      item
        Name = 'Work_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from DATA0843 where [Work_ptr]=:Work_ptr')
    Left = 440
    Top = 224
    object qry0843Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object qry0843Work_ptr: TIntegerField
      FieldName = 'Work_ptr'
    end
    object qry0843stop_begin_date: TDateTimeField
      FieldName = 'stop_begin_date'
    end
    object qry0843stop_end_date: TDateTimeField
      FieldName = 'stop_end_date'
    end
    object qry0843remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object QryResultTime: TADOQuery
    Connection = ADOConnection
    Parameters = <
      item
        Name = 'vbeginTime'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'vEndTime'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '/*'#21151#33021#35828#26126#65292#20256#20837#24320#22987#26102#38388#12289#32467#26463#26102#38388#65292#36820#22238#36825'2'#20010#26102#38388#27573#30340#20013#36884#20241#24687'*/'
      'declare @beginTime datetime,@EndTime datetime,@SumTime dec(9,2)'
      'set @beginTime=:vbeginTime'
      'set @EndTime=:vEndTime'
      'set @SumTime=0     '
      'if (convert(nvarchar(8),@beginTime,14))<'#39'12:00:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'12:00:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime)) '
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'13:30:00'#39')or(datePa' +
        'rt(day,@EndTime)>datePart(day,@beginTime)) '
      '     set @SumTime=90'
      '     else'
      
        '     SELECT @SumTime=cast(datediff(minute,'#39'12:00:00'#39',(convert(nv' +
        'archar(8),@EndTime,14)))as dec(9,2))'
      '     print @SumTime'
      'if (convert(nvarchar(8),@beginTime,14))<'#39'17:30:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'17:30:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime)) '
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'18:30:00'#39')or (dateP' +
        'art(day,@EndTime)>datePart(day,@beginTime))'
      '     set @SumTime=@SumTime+60'
      '     else'
      
        '     SELECT @SumTime=@SumTime+cast(datediff(minute,'#39'17:30:00'#39',(c' +
        'onvert(nvarchar(8),@EndTime,14)))as dec(9,2))'
      '     print @SumTime'
      'if (convert(nvarchar(8),@beginTime,14))<'#39'23:00:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'23:00:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime))'
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'23:30:00'#39')or(datePa' +
        'rt(day,@EndTime)>datePart(day,@beginTime))--((convert(nvarchar(8' +
        '),@EndTime,14))>'#39'00:00:00'#39')'
      '     set @SumTime=@SumTime+30'
      '     else'
      
        '     SELECT @SumTime=@SumTime+cast(datediff(minute,'#39'23:00:00'#39',(c' +
        'onvert(nvarchar(8),@EndTime,14)))as dec(9,2))      '
      'SELECT @SumTime/60')
    Left = 344
    Top = 220
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection
    Parameters = <>
    Left = 384
    Top = 32
  end
  object AQ0034: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select DEPT_CODE,DEPT_NAME from data0034')
    Left = 384
    Top = 112
    object AQ0034DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      DisplayWidth = 10
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object AQ0034DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 20
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object AQ0015: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select WAREHOUSE_CODE,ABBR_NAME from data0015')
    Left = 384
    Top = 168
    object AQ0015WAREHOUSE_CODE: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AQ0015ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#21517#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
  end
  object ad567Copy: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'SELECT  FaultName,stdDate,'
      'Data0034.DEPT_CODE,Data0034.DEPT_NAME, '
      
        '       Data0417.FASSET_CODE,Data0417.FASSET_NAME,Data0417.FASSET' +
        '_DESC,Data0417.EquiType,'
      
        '       d840.Location as D417_Location,Data0417.D840_ptr as D417_' +
        'D840_ptr,'
      
        '       Data0005.EMPL_CODE,Data0005.EMPLOYEE_NAME,data0015.wareho' +
        'use_code,data0015.abbr_name,'
      
        '       case data0567.status when 0 then '#39#26410#25552#20132#39' when 1 then '#39#24453#21463#29702#39' ' +
        'when 2 then '#39#24050#21463#29702#39
      
        '       when 3 then '#39#24050#23436#24037#39' when 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' whe' +
        'n 6 then '#39#24050#26242#20572#39' '
      '       when 8 then '#39#39564#25910#36864#22238#39'  end as V_stat,'
      
        '       Data0005_1.empl_code as disposal_emplcode,Data0005_1.EMPL' +
        'OYEE_NAME as disposal_emplname,'
      '       Data0005_2.empl_code as completion_emplcode,'
      '       Data0005_2.EMPLOYEE_NAME as completion_emplname,'
      '       Data0005_3.EMPLOYEE_NAME as validate_emplname,'
      
        '       '#39'tslr'#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + remark fr' +
        'om data0841'
      '       where data0841.D567_ptr=data0567.rkey and Status_ptr=7'
      '       FOR XML PATH('#39#39')), 1, 1, '#39#39')),'
      
        '       '#39'thlr'#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39' + remark fr' +
        'om data0841'
      '       where data0841.D567_ptr=data0567.rkey and Status_ptr=8'
      
        '       FOR XML PATH('#39#39')), 1, 1, '#39#39')),data0840.Location,DATA0567.' +
        '*'
      'FROM   DATA0567 INNER JOIN'
      '       Data0417 ON DATA0567.FASSET_PTR = Data0417.RKEY '
      '       left join data0840 as d840 on Data0417.D840_ptr=d840.rkey'
      '       INNER JOIN'
      '       Data0034 ON DATA0567.DEPT_PTR = Data0034.RKEY INNER JOIN'
      
        '       Data0005 ON DATA0567.EMPL_PTR = Data0005.RKEY left outer ' +
        'JOIN'
      
        '       Data0005 AS Data0005_1 ON DATA0567.disposal_emplptr = Dat' +
        'a0005_1.RKEY left outer join'
      
        '       Data0005 AS Data0005_2 ON Data0567.completion_emplptr=Dat' +
        'a0005_2.RKEY left outer join'
      
        '       Data0005 AS Data0005_3 ON Data0567.validate_emplptr=Data0' +
        '005_3.RKEY left outer join'
      '       Data0015 ON DATA0567.whouse_ptr=data0015.rkey '
      '       left join data0846 on DATA0567.D846_ptr=data0846.rkey'
      '       left join data0840 on DATA0567.D840_ptr=data0840.rkey')
    Left = 480
    Top = 32
  end
  object dt0417: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select  Data0417.FASSET_CODE,Data0417.FASSET_NAME from Data0417'
    Parameters = <>
    Left = 472
    Top = 120
    object dt0417FASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      DisplayWidth = 15
      FieldName = 'FASSET_CODE'
    end
    object dt0417FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      DisplayWidth = 30
      FieldName = 'FASSET_NAME'
      Size = 30
    end
  end
  object qry_D0846: TADOQuery
    Connection = ADOConnection
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
      'select data0846.rkey,[FaultName],[stdDate] from data0846 '
      'join data0845 on   data0845.rkey=[data0846].[D845_ptr] '
      'join DATA0417 on  data0845.rkey=DATA0417.[D845_ptr] '
      'where DATA0417.FASSET_CODE =:vFASSET_CODE     ')
    Left = 520
    Top = 184
    object qry_D0846rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object qry_D0846FaultName: TStringField
      DisplayLabel = #25925#38556#21517#31216
      DisplayWidth = 30
      FieldName = 'FaultName'
      Size = 50
    end
    object qry_D0846stdDate: TBCDField
      DisplayLabel = #26631#20934#26102#38388
      FieldName = 'stdDate'
      Precision = 9
      Size = 2
    end
  end
  object qry_D0846All: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select data0846.rkey,[FaultName],stdDate from data0846 '
      'join data0845 on   data0845.rkey=[data0846].[D845_ptr] '
      'join DATA0417 on  data0845.rkey=DATA0417.[D845_ptr] ')
    Left = 520
    Top = 248
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
    object qry_D0846AllstdDate: TBCDField
      DisplayLabel = #26631#20934#26102#38388
      FieldName = 'stdDate'
      Precision = 9
      Size = 2
    end
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTemp'
    Left = 688
    Top = 328
  end
  object cds567: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT top 10000  FaultName,stdDate,'#13#10'Data0034.DEPT_CODE,Data003' +
      '4.DEPT_NAME, '#13#10'       Data0417.FASSET_CODE,Data0417.FASSET_NAME,' +
      'Data0417.FASSET_DESC,Data0417.EquiType,'#13#10'       d840.Location as' +
      ' D417_Location,Data0417.D840_ptr as D417_D840_ptr,'#13#10'       Data0' +
      '005.EMPL_CODE,Data0005.EMPLOYEE_NAME,data0015.warehouse_code,dat' +
      'a0015.abbr_name,'#13#10'       case data0567.status when 0 then '#39#26410#25552#20132#39' ' +
      'when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'       when 3 then '#39#24050#23436#24037#39' wh' +
      'en 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' when 6 then '#39#24050#26242#20572#39' '#13#10'       whe' +
      'n 8 then '#39#39564#25910#36864#22238#39'  end as V_stat,'#13#10'       Data0005_1.empl_code as ' +
      'disposal_emplcode,Data0005_1.EMPLOYEE_NAME as disposal_emplname,' +
      #13#10'       Data0005_2.empl_code as completion_emplcode,'#13#10'       Da' +
      'ta0005_2.EMPLOYEE_NAME as completion_emplname,'#13#10'       Data0005_' +
      '3.EMPLOYEE_NAME as validate_emplname,'#13#10'       '#39'tslr'#39'=convert(var' +
      'char(500),STUFF((SELECT '#39#65307#39' + remark from data0841'#13#10'       where' +
      ' data0841.D567_ptr=data0567.rkey and Status_ptr=7'#13#10'       FOR XM' +
      'L PATH('#39#39')), 1, 1, '#39#39')),'#13#10'       '#39'thlr'#39'=convert(varchar(500),STU' +
      'FF((SELECT '#39#65307#39' + remark from data0841'#13#10'       where data0841.D56' +
      '7_ptr=data0567.rkey and Status_ptr=8'#13#10'       FOR XML PATH('#39#39')), ' +
      '1, 1, '#39#39')),data0840.Location,DATA0567.*'#13#10'FROM   DATA0567 INNER J' +
      'OIN'#13#10'       Data0417 ON DATA0567.FASSET_PTR = Data0417.RKEY '#13#10'  ' +
      '     left join data0840 as d840 on Data0417.D840_ptr=d840.rkey'#13#10 +
      '       INNER JOIN'#13#10'       Data0034 ON DATA0567.DEPT_PTR = Data00' +
      '34.RKEY INNER JOIN'#13#10'       Data0005 ON DATA0567.EMPL_PTR = Data0' +
      '005.RKEY left outer JOIN'#13#10'       Data0005 AS Data0005_1 ON DATA0' +
      '567.disposal_emplptr = Data0005_1.RKEY left outer join'#13#10'       D' +
      'ata0005 AS Data0005_2 ON Data0567.completion_emplptr=Data0005_2.' +
      'RKEY left outer join'#13#10'       Data0005 AS Data0005_3 ON Data0567.' +
      'validate_emplptr=Data0005_3.RKEY left outer join'#13#10'       Data001' +
      '5 ON DATA0567.whouse_ptr=data0015.rkey '#13#10'       left join data08' +
      '46 on DATA0567.D846_ptr=data0846.rkey'#13#10'       left join data0840' +
      ' on DATA0567.D840_ptr=data0840.rkey'
    FieldDefs = <
      item
        Name = 'FaultName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'stdDate'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'DEPT_CODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DEPT_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FASSET_CODE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FASSET_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'FASSET_DESC'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'EMPL_CODE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'EMPLOYEE_NAME'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'warehouse_code'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'abbr_name'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'V_stat'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 8
      end
      item
        Name = 'disposal_emplcode'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'disposal_emplname'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'completion_emplcode'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'completion_emplname'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'tslr'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 500
      end
      item
        Name = 'thlr'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 500
      end
      item
        Name = 'RKEY'
        Attributes = [faReadonly]
        DataType = ftAutoInc
      end
      item
        Name = 'NUMBER'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'STATUS'
        DataType = ftSmallint
      end
      item
        Name = 'DEPT_PTR'
        DataType = ftInteger
      end
      item
        Name = 'FASSET_PTR'
        DataType = ftInteger
      end
      item
        Name = 'PLACE'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'equipment_grade'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'failure_grade'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'failure_degree'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'failure_date'
        DataType = ftDateTime
      end
      item
        Name = 'EMPL_PTR'
        DataType = ftInteger
      end
      item
        Name = 'ent_date'
        DataType = ftDateTime
      end
      item
        Name = 'referring_date'
        DataType = ftDateTime
      end
      item
        Name = 'CONTACT_NAME'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CONTACT_PHONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'failure_circs'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'disposal_emplptr'
        DataType = ftInteger
      end
      item
        Name = 'disposal_date'
        DataType = ftDateTime
      end
      item
        Name = 'maintain_empl'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'maintain_text'
        DataType = ftString
        Size = 400
      end
      item
        Name = 'complete_date'
        DataType = ftDateTime
      end
      item
        Name = 'validate_emplptr'
        DataType = ftInteger
      end
      item
        Name = 'validate_date'
        DataType = ftDateTime
      end
      item
        Name = 'validate_appraise'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'fail_type'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'WHOUSE_PTR'
        DataType = ftInteger
      end
      item
        Name = 'suspended_reason'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'stoppage_time'
        DataType = ftDateTime
      end
      item
        Name = 'recovery_time'
        DataType = ftDateTime
      end
      item
        Name = 'completion_emplptr'
        DataType = ftInteger
      end
      item
        Name = 'stop_house'
        DataType = ftBCD
        Precision = 8
        Size = 2
      end
      item
        Name = 'maintain_house'
        DataType = ftBCD
        Precision = 8
        Size = 2
      end
      item
        Name = 'validate_Description'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'D846_ptr'
        DataType = ftInteger
      end
      item
        Name = 'Staff_Sum_house'
        DataType = ftBCD
        Precision = 8
        Size = 2
      end
      item
        Name = 'validate_emplname'
        DataType = ftString
        Size = 16
      end
      item
        Name = 'Location'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'D840_ptr'
        DataType = ftInteger
      end
      item
        Name = 'D417_Location'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'D417_D840_ptr'
        DataType = ftInteger
      end
      item
        Name = 'D073_ptr'
        DataType = ftInteger
      end
      item
        Name = 'EquiType'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dsp567'
    StoreDefs = True
    AfterOpen = cds567AfterOpen
    BeforeClose = cds567BeforeClose
    AfterClose = cds567AfterClose
    BeforePost = cds567BeforePost
    AfterScroll = cds567AfterScroll
    OnCalcFields = cds567CalcFields
    OnFilterRecord = cds567FilterRecord
    OnReconcileError = cds567ReconcileError
    Left = 224
    Top = 96
    object cds567FaultName: TStringField
      DisplayLabel = #25925#38556#21517#31216
      FieldName = 'FaultName'
      ProviderFlags = []
      OnChange = cds567FaultNameChange
      Size = 50
    end
    object cds567stdDate: TBCDField
      DisplayLabel = #26631#20934#32500#20462#26102#38388
      FieldName = 'stdDate'
      ProviderFlags = []
      Precision = 9
      Size = 2
    end
    object cds567DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      ProviderFlags = []
      Size = 10
    end
    object cds567DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cds567FASSET_CODE: TStringField
      DisplayLabel = #35774#22791#20195#30721
      FieldName = 'FASSET_CODE'
      ProviderFlags = []
    end
    object cds567FASSET_NAME: TStringField
      DisplayLabel = #35774#22791#21517#31216
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object cds567FASSET_DESC: TStringField
      DisplayLabel = #35774#22791#35268#26684#25551#36848
      FieldName = 'FASSET_DESC'
      ProviderFlags = []
      Size = 40
    end
    object cds567EMPL_CODE: TStringField
      DisplayLabel = #30003#25253#20154#20195#30721
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object cds567EMPLOYEE_NAME: TStringField
      DisplayLabel = #30003#25253#20154#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cds567warehouse_code: TStringField
      DisplayLabel = #24037#21378#20195#30721
      FieldName = 'warehouse_code'
      ProviderFlags = []
      Size = 5
    end
    object cds567abbr_name: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_name'
      ProviderFlags = []
      Size = 10
    end
    object cds567V_stat: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'V_stat'
      ProviderFlags = []
      Size = 8
    end
    object cds567disposal_emplcode: TStringField
      DisplayLabel = #21463#29702#20154#20195#30721
      FieldName = 'disposal_emplcode'
      ProviderFlags = []
      Size = 10
    end
    object cds567disposal_emplname: TStringField
      DisplayLabel = #21463#29702#20154#22995#21517
      FieldName = 'disposal_emplname'
      ProviderFlags = []
      Size = 16
    end
    object cds567completion_emplcode: TStringField
      DisplayLabel = #23436#24037#20154#20195#30721
      FieldName = 'completion_emplcode'
      ProviderFlags = []
      Size = 10
    end
    object cds567completion_emplname: TStringField
      DisplayLabel = #23436#24037#20154#22995#21517
      FieldName = 'completion_emplname'
      ProviderFlags = []
      Size = 16
    end
    object cds567tslr: TStringField
      DisplayLabel = #25237#35785#20869#23481
      FieldName = 'tslr'
      ProviderFlags = []
      ReadOnly = True
      Size = 500
    end
    object cds567thlr: TStringField
      DisplayLabel = #39564#25910#26102#36864#22238#21407#22240
      FieldName = 'thlr'
      ProviderFlags = []
      ReadOnly = True
      Size = 500
    end
    object cds567RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cds567NUMBER: TStringField
      DisplayLabel = #30003#35831#32534#21495
      FieldName = 'NUMBER'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cds567STATUS: TSmallintField
      FieldName = 'STATUS'
      OnChange = cds567STATUSChange
    end
    object cds567DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object cds567FASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object cds567PLACE: TStringField
      DisplayLabel = #35774#22791#22320#28857
      FieldName = 'PLACE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object cds567equipment_grade: TStringField
      DisplayLabel = #35774#22791#32423#21035
      FieldName = 'equipment_grade'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cds567failure_grade: TStringField
      DisplayLabel = #25925#38556#32423#21035
      FieldName = 'failure_grade'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object cds567failure_degree: TStringField
      DisplayLabel = #25925#38556#31243#24230
      FieldName = 'failure_degree'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object cds567failure_date: TDateTimeField
      DisplayLabel = #25925#38556#26085#26399
      FieldName = 'failure_date'
      ProviderFlags = [pfInUpdate]
    end
    object cds567EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object cds567ent_date: TDateTimeField
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'ent_date'
      ProviderFlags = [pfInUpdate]
    end
    object cds567referring_date: TDateTimeField
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'referring_date'
      ProviderFlags = [pfInUpdate]
    end
    object cds567CONTACT_NAME: TStringField
      DisplayLabel = #32852#32476#20154
      FieldName = 'CONTACT_NAME'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object cds567CONTACT_PHONE: TStringField
      DisplayLabel = #32852#32476#30005#35805
      FieldName = 'CONTACT_PHONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object cds567failure_circs: TStringField
      DisplayLabel = #25925#38556#35828#26126
      FieldName = 'failure_circs'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object cds567disposal_emplptr: TIntegerField
      FieldName = 'disposal_emplptr'
      ProviderFlags = [pfInUpdate]
    end
    object cds567disposal_date: TDateTimeField
      DisplayLabel = #21463#29702#26085#26399
      FieldName = 'disposal_date'
      ProviderFlags = [pfInUpdate]
      OnChange = cds567complete_dateChange
    end
    object cds567maintain_empl: TStringField
      DisplayLabel = #32500#20462#20154#21592
      FieldName = 'maintain_empl'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds567maintain_text: TStringField
      DisplayLabel = #32500#20462#35760#24405
      FieldName = 'maintain_text'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object cds567complete_date: TDateTimeField
      DisplayLabel = #23436#24037#26085#26399
      FieldName = 'complete_date'
      ProviderFlags = [pfInUpdate]
      OnChange = cds567complete_dateChange
    end
    object cds567validate_emplptr: TIntegerField
      FieldName = 'validate_emplptr'
      ProviderFlags = [pfInUpdate]
    end
    object cds567validate_date: TDateTimeField
      DisplayLabel = #39564#25910#26085#26399
      FieldName = 'validate_date'
      ProviderFlags = [pfInUpdate]
    end
    object cds567validate_emplname: TStringField
      DisplayLabel = #39564#25910#20154
      FieldName = 'validate_emplname'
      ProviderFlags = []
      Size = 16
    end
    object cds567validate_appraise: TStringField
      DisplayLabel = #39564#25910#35780#20215
      FieldName = 'validate_appraise'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds567fail_type: TStringField
      DisplayLabel = #24322#24120#31867#21035
      FieldName = 'fail_type'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object cds567WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object cds567suspended_reason: TWideStringField
      DisplayLabel = #26242#20572#21407#22240
      FieldName = 'suspended_reason'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cds567stoppage_time: TDateTimeField
      DisplayLabel = #26242#20572#24320#22987#26102#38388
      FieldName = 'stoppage_time'
      ProviderFlags = [pfInUpdate]
    end
    object cds567recovery_time: TDateTimeField
      DisplayLabel = #26242#20572#32467#26463#26102#38388
      FieldName = 'recovery_time'
      ProviderFlags = [pfInUpdate]
    end
    object cds567completion_emplptr: TIntegerField
      FieldName = 'completion_emplptr'
      ProviderFlags = [pfInUpdate]
    end
    object cds567stop_house: TBCDField
      DisplayLabel = #26242#20572#23567#26102
      FieldName = 'stop_house'
      ProviderFlags = [pfInUpdate]
      OnChange = cds567stop_houseChange
      Precision = 8
      Size = 2
    end
    object cds567maintain_house: TBCDField
      DisplayLabel = #23454#38469#32500#20462#26102#38388
      FieldName = 'maintain_house'
      ProviderFlags = [pfInUpdate]
      Precision = 8
      Size = 2
    end
    object cds567validate_Description: TStringField
      DisplayLabel = #39564#25910#24847#35265
      FieldName = 'validate_Description'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cds567D846_ptr: TIntegerField
      FieldName = 'D846_ptr'
      ProviderFlags = [pfInUpdate]
    end
    object cds567Staff_Sum_house: TBCDField
      DisplayLabel = #24037#20154#21512#35745#32500#20462#26102#38388
      FieldName = 'Staff_Sum_house'
      ProviderFlags = [pfInUpdate]
      Precision = 8
      Size = 2
    end
    object cds567AchiRate: TBCDField
      DisplayLabel = #36798#25104#29575
      FieldKind = fkCalculated
      FieldName = 'AchiRate'
      OnGetText = cds567AchiRateGetText
      Calculated = True
    end
    object cds567Location: TStringField
      DisplayLabel = #35774#22791#36131#20219#23567#32452
      FieldName = 'Location'
      ProviderFlags = []
      OnChange = cds567LocationChange
    end
    object cds567D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object cds567D417_Location: TStringField
      DisplayLabel = #36131#20219#23567#32452
      FieldName = 'D417_Location'
      ProviderFlags = []
    end
    object cds567D417_D840_ptr: TIntegerField
      FieldName = 'D417_D840_ptr'
      ProviderFlags = []
    end
    object cds567D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object cds567EquiType: TBooleanField
      DisplayLabel = #26159#35774#22791#31867#22411
      FieldName = 'EquiType'
      ProviderFlags = []
    end
    object cds567GZSJ: TBCDField
      DisplayLabel = #25925#38556#26102#38388
      FieldKind = fkCalculated
      FieldName = 'GZSJ'
      Size = 2
      Calculated = True
    end
  end
  object dsp567: TDataSetProvider
    DataSet = dt567
    Options = [poPropogateChanges, poAllowCommandText]
    OnGetTableName = dsp567GetTableName
    Left = 160
    Top = 96
  end
  object dt567: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT top 10000  FaultName,stdDate,'#13#10'Data0034.DEPT_CODE,Data003' +
      '4.DEPT_NAME, '#13#10'       Data0417.FASSET_CODE,Data0417.FASSET_NAME,' +
      'Data0417.FASSET_DESC,Data0417.EquiType,'#13#10'       d840.Location as' +
      ' D417_Location,Data0417.D840_ptr as D417_D840_ptr,'#13#10'       Data0' +
      '005.EMPL_CODE,Data0005.EMPLOYEE_NAME,data0015.warehouse_code,dat' +
      'a0015.abbr_name,'#13#10'       case data0567.status when 0 then '#39#26410#25552#20132#39' ' +
      'when 1 then '#39#24453#21463#29702#39' when 2 then '#39#24050#21463#29702#39#13#10'       when 3 then '#39#24050#23436#24037#39' wh' +
      'en 4 then '#39#24050#39564#25910#39' when 5 then '#39#34987#36864#22238#39' when 6 then '#39#24050#26242#20572#39' '#13#10'       whe' +
      'n 8 then '#39#39564#25910#36864#22238#39'  end as V_stat,'#13#10'       Data0005_1.empl_code as ' +
      'disposal_emplcode,Data0005_1.EMPLOYEE_NAME as disposal_emplname,' +
      #13#10'       Data0005_2.empl_code as completion_emplcode,'#13#10'       Da' +
      'ta0005_2.EMPLOYEE_NAME as completion_emplname,'#13#10'       Data0005_' +
      '3.EMPLOYEE_NAME as validate_emplname,'#13#10'       '#39'tslr'#39'=convert(var' +
      'char(500),STUFF((SELECT '#39#65307#39' + remark from data0841'#13#10'       where' +
      ' data0841.D567_ptr=data0567.rkey and Status_ptr=7'#13#10'       FOR XM' +
      'L PATH('#39#39')), 1, 1, '#39#39')),'#13#10'       '#39'thlr'#39'=convert(varchar(500),STU' +
      'FF((SELECT '#39#65307#39' + remark from data0841'#13#10'       where data0841.D56' +
      '7_ptr=data0567.rkey and Status_ptr=8'#13#10'       FOR XML PATH('#39#39')), ' +
      '1, 1, '#39#39')),data0840.Location,DATA0567.*'#13#10'FROM   DATA0567 INNER J' +
      'OIN'#13#10'       Data0417 ON DATA0567.FASSET_PTR = Data0417.RKEY '#13#10'  ' +
      '     left join data0840 as d840 on Data0417.D840_ptr=d840.rkey'#13#10 +
      '       INNER JOIN'#13#10'       Data0034 ON DATA0567.DEPT_PTR = Data00' +
      '34.RKEY INNER JOIN'#13#10'       Data0005 ON DATA0567.EMPL_PTR = Data0' +
      '005.RKEY left outer JOIN'#13#10'       Data0005 AS Data0005_1 ON DATA0' +
      '567.disposal_emplptr = Data0005_1.RKEY left outer join'#13#10'       D' +
      'ata0005 AS Data0005_2 ON Data0567.completion_emplptr=Data0005_2.' +
      'RKEY left outer join'#13#10'       Data0005 AS Data0005_3 ON Data0567.' +
      'validate_emplptr=Data0005_3.RKEY left outer join'#13#10'       Data001' +
      '5 ON DATA0567.whouse_ptr=data0015.rkey '#13#10'       left join data08' +
      '46 on DATA0567.D846_ptr=data0846.rkey'#13#10'       left join data0840' +
      ' on DATA0567.D840_ptr=data0840.rkey'
    Parameters = <>
    Left = 96
    Top = 96
    object dt567FaultName: TStringField
      FieldName = 'FaultName'
      ProviderFlags = []
      Size = 50
    end
    object dt567stdDate: TBCDField
      FieldName = 'stdDate'
      ProviderFlags = []
      Precision = 9
      Size = 2
    end
    object dt567DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dt567DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dt567FASSET_CODE: TStringField
      FieldName = 'FASSET_CODE'
      ProviderFlags = []
    end
    object dt567FASSET_NAME: TStringField
      FieldName = 'FASSET_NAME'
      ProviderFlags = []
      Size = 30
    end
    object dt567FASSET_DESC: TStringField
      FieldName = 'FASSET_DESC'
      ProviderFlags = []
      Size = 40
    end
    object dt567EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      ProviderFlags = []
      Size = 10
    end
    object dt567EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dt567warehouse_code: TStringField
      FieldName = 'warehouse_code'
      ProviderFlags = []
      Size = 5
    end
    object dt567abbr_name: TStringField
      FieldName = 'abbr_name'
      ProviderFlags = []
      Size = 10
    end
    object dt567V_stat: TStringField
      FieldName = 'V_stat'
      ProviderFlags = []
      ReadOnly = True
      Size = 8
    end
    object dt567disposal_emplcode: TStringField
      FieldName = 'disposal_emplcode'
      ProviderFlags = []
      Size = 10
    end
    object dt567disposal_emplname: TStringField
      FieldName = 'disposal_emplname'
      ProviderFlags = []
      Size = 16
    end
    object dt567completion_emplcode: TStringField
      FieldName = 'completion_emplcode'
      ProviderFlags = []
      Size = 10
    end
    object dt567completion_emplname: TStringField
      FieldName = 'completion_emplname'
      ProviderFlags = []
      Size = 16
    end
    object dt567tslr: TStringField
      FieldName = 'tslr'
      ProviderFlags = []
      ReadOnly = True
      Size = 500
    end
    object dt567thlr: TStringField
      FieldName = 'thlr'
      ProviderFlags = []
      ReadOnly = True
      Size = 500
    end
    object dt567RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object dt567NUMBER: TStringField
      FieldName = 'NUMBER'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dt567STATUS: TWordField
      FieldName = 'STATUS'
    end
    object dt567DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object dt567FASSET_PTR: TIntegerField
      FieldName = 'FASSET_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object dt567PLACE: TStringField
      FieldName = 'PLACE'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dt567equipment_grade: TStringField
      FieldName = 'equipment_grade'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dt567failure_grade: TStringField
      FieldName = 'failure_grade'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object dt567failure_degree: TStringField
      FieldName = 'failure_degree'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object dt567failure_date: TDateTimeField
      FieldName = 'failure_date'
      ProviderFlags = [pfInUpdate]
    end
    object dt567EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object dt567ent_date: TDateTimeField
      FieldName = 'ent_date'
      ProviderFlags = [pfInUpdate]
    end
    object dt567referring_date: TDateTimeField
      FieldName = 'referring_date'
      ProviderFlags = [pfInUpdate]
    end
    object dt567CONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
      ProviderFlags = [pfInUpdate]
      Size = 10
    end
    object dt567CONTACT_PHONE: TStringField
      FieldName = 'CONTACT_PHONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object dt567failure_circs: TStringField
      FieldName = 'failure_circs'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object dt567disposal_emplptr: TIntegerField
      FieldName = 'disposal_emplptr'
      ProviderFlags = [pfInUpdate]
    end
    object dt567disposal_date: TDateTimeField
      FieldName = 'disposal_date'
      ProviderFlags = [pfInUpdate]
    end
    object dt567maintain_empl: TStringField
      FieldName = 'maintain_empl'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dt567maintain_text: TStringField
      FieldName = 'maintain_text'
      ProviderFlags = [pfInUpdate]
      Size = 400
    end
    object dt567complete_date: TDateTimeField
      FieldName = 'complete_date'
      ProviderFlags = [pfInUpdate]
    end
    object dt567validate_emplptr: TIntegerField
      FieldName = 'validate_emplptr'
      ProviderFlags = [pfInUpdate]
    end
    object dt567validate_date: TDateTimeField
      FieldName = 'validate_date'
      ProviderFlags = [pfInUpdate]
    end
    object dt567validate_appraise: TStringField
      FieldName = 'validate_appraise'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dt567fail_type: TStringField
      FieldName = 'fail_type'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object dt567WHOUSE_PTR: TIntegerField
      FieldName = 'WHOUSE_PTR'
      ProviderFlags = [pfInUpdate]
    end
    object dt567suspended_reason: TWideStringField
      FieldName = 'suspended_reason'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dt567stoppage_time: TDateTimeField
      FieldName = 'stoppage_time'
      ProviderFlags = [pfInUpdate]
    end
    object dt567recovery_time: TDateTimeField
      FieldName = 'recovery_time'
      ProviderFlags = [pfInUpdate]
    end
    object dt567completion_emplptr: TIntegerField
      FieldName = 'completion_emplptr'
      ProviderFlags = [pfInUpdate]
    end
    object dt567stop_house: TBCDField
      FieldName = 'stop_house'
      ProviderFlags = [pfInUpdate]
      Precision = 8
      Size = 2
    end
    object dt567maintain_house: TBCDField
      FieldName = 'maintain_house'
      ProviderFlags = [pfInUpdate]
      Precision = 8
      Size = 2
    end
    object dt567validate_Description: TStringField
      FieldName = 'validate_Description'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object dt567D846_ptr: TIntegerField
      FieldName = 'D846_ptr'
      ProviderFlags = [pfInUpdate]
    end
    object dt567Staff_Sum_house: TBCDField
      FieldName = 'Staff_Sum_house'
      ProviderFlags = [pfInUpdate]
      Precision = 8
      Size = 2
    end
    object dt567validate_emplname: TStringField
      FieldName = 'validate_emplname'
      ProviderFlags = []
      Size = 16
    end
    object dt567Location: TStringField
      FieldName = 'Location'
      ProviderFlags = []
    end
    object dt567D840_ptr: TIntegerField
      FieldName = 'D840_ptr'
    end
    object dt567D417_Location: TStringField
      FieldName = 'D417_Location'
      ProviderFlags = []
    end
    object dt567D417_D840_ptr: TIntegerField
      FieldName = 'D417_D840_ptr'
      ProviderFlags = []
    end
    object dt567D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object dt567EquiType: TBooleanField
      FieldName = 'EquiType'
      ProviderFlags = []
    end
  end
  object qry_data0468: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vd567_ptr'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select dbo.DATA0268.number, dbo.Data0017.INV_PART_NUMBER, dbo.Da' +
        'ta0017.INV_PART_DESCRIPTION,'
      
        'data0002.unit_name,dbo.Data0468.QUAN_BOM, dbo.Data0468.QUAN_ISSU' +
        'ED '
      'FROM --dbo.data0567  join '
      'dbo.DATA0268  --dbo.data0567.rkey'
      'join data0468 on data0468.FLOW_NO=DATA0268.rkey'
      
        'INNER JOIN dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data001' +
        '7.RKEY'
      'inner join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey'
      'where DATA0268.[d567_ptr]=:vd567_ptr')
    Left = 288
    Top = 32
    object qry_data0468number: TStringField
      DisplayLabel = #39046#26009#21333#32534#21495
      FieldName = 'number'
      Size = 10
    end
    object qry_data0468INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#21495
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qry_data0468INV_PART_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#21517#31216'/'#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object qry_data0468unit_name: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'unit_name'
    end
    object qry_data0468QUAN_BOM: TFloatField
      DisplayLabel = #30003#39046#25968#37327
      FieldName = 'QUAN_BOM'
    end
    object qry_data0468QUAN_ISSUED: TFloatField
      DisplayLabel = #24050#21457#25968#37327
      FieldName = 'QUAN_ISSUED'
    end
  end
  object qry0073: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select USER_LOGIN_NAME,EMPLOYEE_PTR from data0073 ')
    Left = 288
    Top = 152
    object qry0073USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object qry0073EMPLOYEE_PTR: TIntegerField
      FieldName = 'EMPLOYEE_PTR'
    end
  end
  object QryD840: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0840')
    Left = 568
    Top = 32
    object QryD840rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object QryD840Location: TStringField
      DisplayLabel = #35774#22791#36131#20219#23567#32452
      FieldName = 'Location'
    end
  end
  object qry0843ResultTime: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'vbeginTime'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'vEndTime'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '/*'#21151#33021#35828#26126#65292#20256#20837#24320#22987#26102#38388#12289#32467#26463#26102#38388#65292#36820#22238#36825'2'#20010#26102#38388#27573#30340#24037#20316#26102#38388#65292#25187#38500#20013#36884#20241#24687'*/'
      'declare @beginTime datetime,@EndTime datetime,@SumTime dec(9,2)'
      'set @beginTime=:vbeginTime'
      'set @EndTime=:vEndTime'
      'set @SumTime=0'
      'if (convert(nvarchar(8),@beginTime,14))<'#39'12:00:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'12:00:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime)) '
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'13:30:00'#39')or(datePa' +
        'rt(day,@EndTime)>datePart(day,@beginTime)) '
      '     set @SumTime=90'
      '     else'
      
        '     SELECT @SumTime=cast(datediff(minute,'#39'12:00:00'#39',(convert(nv' +
        'archar(8),@EndTime,14)))as dec(9,2))'
      '     print @SumTime'
      'if (convert(nvarchar(8),@beginTime,14))<'#39'17:30:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'17:30:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime)) '
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'18:30:00'#39')or (dateP' +
        'art(day,@EndTime)>datePart(day,@beginTime))'
      '     set @SumTime=@SumTime+60'
      '     else'
      
        '     SELECT @SumTime=@SumTime+cast(datediff(minute,'#39'17:30:00'#39',(c' +
        'onvert(nvarchar(8),@EndTime,14)))as dec(9,2))'
      '     print @SumTime'
      'if (convert(nvarchar(8),@beginTime,14))<'#39'23:00:00'#39
      
        '  if ((convert(nvarchar(8),@EndTime,14))>'#39'23:00:00'#39')or(datePart(' +
        'day,@EndTime)>datePart(day,@beginTime))'
      
        '     if ((convert(nvarchar(8),@EndTime,14))>'#39'23:30:00'#39')or(datePa' +
        'rt(day,@EndTime)>datePart(day,@beginTime))--((convert(nvarchar(8' +
        '),@EndTime,14))>'#39'00:00:00'#39')'
      '     set @SumTime=@SumTime+30'
      '     else'
      
        '     SELECT @SumTime=@SumTime+cast(datediff(minute,'#39'23:00:00'#39',(c' +
        'onvert(nvarchar(8),@EndTime,14)))as dec(9,2))   '
      'SELECT (datediff( minute ,@beginTime,@EndTime)-@SumTime)/60')
    Left = 624
    Top = 144
  end
  object adsTemp: TADODataSet
    Connection = ADOConnection
    Parameters = <>
    Left = 576
    Top = 328
  end
  object dspTemp: TDataSetProvider
    DataSet = adsTemp
    Options = [poAllowCommandText]
    Left = 632
    Top = 328
  end
  object qry577: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    AfterInsert = qry577AfterInsert
    BeforePost = qry577BeforePost
    AfterPost = qry577AfterPost
    BeforeScroll = qry577BeforeScroll
    Parameters = <
      item
        Name = 'vRkey567'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select * from data0577 where Rkey567 = :vRkey567')
    Left = 240
    Top = 13
    object qry577Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object qry577rkey567: TIntegerField
      FieldName = 'rkey567'
    end
    object qry577stop_begin_date: TDateTimeField
      FieldName = 'stop_begin_date'
    end
    object qry577stop_end_date: TDateTimeField
      FieldName = 'stop_end_date'
    end
    object qry577remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
  object cds0849: TClientDataSet
    Aggregates = <>
    CommandText = 
      ' select data0849.* from data0849 '#13#10' join data0419 on data0849.[D' +
      '419_ptr]=data0419.[rkey]'#13#10' where data0419.programe=:vPrograme an' +
      'd data0849.[D073_ptr]=:vD073_ptr '#13#10#13#10'order by data0849 .[FieldOr' +
      'der]'
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'FieldOrder'
    FetchOnDemand = False
    Params = <
      item
        DataType = ftFloat
        Name = 'vPrograme'
        ParamType = ptUnknown
        Value = 0.000000000000000000
      end
      item
        DataType = ftInteger
        Name = 'vD073_ptr'
        ParamType = ptUnknown
        Value = 0
      end>
    ProviderName = 'dsp0849'
    Left = 152
    Top = 408
    object cds0849D419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object cds0849D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object cds0849FormName: TStringField
      DisplayLabel = #31383#20307#21517
      FieldName = 'FormName'
      Size = 50
    end
    object cds0849GridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object cds0849FieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object cds0849FieldCaption: TStringField
      DisplayLabel = #23383#27573#21517
      FieldName = 'FieldCaption'
      Size = 100
    end
    object cds0849FieldOrder: TIntegerField
      DisplayLabel = #39034#24207
      FieldName = 'FieldOrder'
    end
    object cds0849FieldWidth: TIntegerField
      DisplayLabel = #23485#24230
      FieldName = 'FieldWidth'
    end
    object cds0849IsDisplay: TBooleanField
      DisplayLabel = #26159#21542#26174#31034
      FieldName = 'IsDisplay'
    end
  end
  object dsp0849: TDataSetProvider
    DataSet = dt0849
    Options = [poAutoRefresh, poPropogateChanges, poAllowCommandText]
    Left = 90
    Top = 404
  end
  object dt0849: TADODataSet
    Connection = ADOConnection
    CursorType = ctStatic
    CommandText = 
      ' select data0849.* from data0849 '#13#10' join data0419 on data0849.[D' +
      '419_ptr]=data0419.[rkey]'#13#10' where data0419.programe=:vPrograme an' +
      'd data0849.[D073_ptr]=:vD073_ptr '#13#10#13#10'order by data0849 .[FieldOr' +
      'der]'
    Parameters = <
      item
        Name = 'vPrograme'
        DataType = ftFloat
        Value = 0.000000000000000000
      end
      item
        Name = 'vD073_ptr'
        DataType = ftSmallint
        Value = 0
      end>
    Left = 36
    Top = 404
    object dt0849D419_ptr: TIntegerField
      FieldName = 'D419_ptr'
    end
    object dt0849D073_ptr: TIntegerField
      FieldName = 'D073_ptr'
    end
    object dt0849GridName: TStringField
      FieldName = 'GridName'
      Size = 50
    end
    object dt0849FieldName: TStringField
      FieldName = 'FieldName'
      Size = 50
    end
    object dt0849FieldCaption: TStringField
      FieldName = 'FieldCaption'
      Size = 100
    end
    object dt0849FieldOrder: TIntegerField
      FieldName = 'FieldOrder'
    end
    object dt0849FieldWidth: TIntegerField
      FieldName = 'FieldWidth'
    end
    object dt0849IsDisplay: TBooleanField
      FieldName = 'IsDisplay'
    end
    object dt0849FormName: TStringField
      FieldName = 'FormName'
      Size = 50
    end
  end
end
