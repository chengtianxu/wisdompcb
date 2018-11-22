object DM: TDM
  OldCreateOrder = False
  Left = 420
  Top = 260
  Height = 384
  Width = 616
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 88
  end
  object ADOHrcertificate: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    Filtered = True
    AfterOpen = ADOHrcertificateAfterOpen
    CommandText = 
      'SELECT Datadetail.rkey as detarkey,Datadetail.item,v_employeemsg' +
      '.rkey as emplreky,'#13#10'       v_employeemsg.employeecode,v_employee' +
      'msg.chinesename,'#13#10'       v_employeemsg.ondutytime,v_employeemsg.' +
      'departmentname,'#13#10'       v_employeemsg.position_item,D05.employee' +
      '_name,'#13#10'       case v_employeemsg.status when 1 then '#39#22312#32844#39' when 2' +
      ' then '#39#31163#32844#39' end AS status1,'#13#10'       D.rkey,D.code,D.type,D.startd' +
      'ate,D.enddate,D.inputdate,D.remark,'#13#10'       D.[status],D.employe' +
      'eid ,D.datadetail_ptr ,D.opration_person ,'#13#10'       case D.[statu' +
      's] when 0 then '#39#26080#25928#39' when 1 then '#39#26377#25928#39' end as[stts],'#13#10'       case ' +
      'D.type when 0 then '#39#20010#20154#39' when 1 then  '#39#20844#21496#39' end as [type1]     '#13#10'F' +
      'ROM   Hrcertificate AS D INNER JOIN '#13#10'       v_employeemsg  '#13#10'ON' +
      ' D.employeeid=v_employeemsg.rkey INNER JOIN '#13#10'       Datadetail ' +
      'ON D.datadetail_ptr=Datadetail.rkey INNER JOIN '#13#10'       Data0005' +
      ' AS D05 ON D.opration_person=D05.rkey'#13#10'WHERE  D.startdate betwee' +
      'n :dtpk1 and :dtpk2'#13#10
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 104
    Top = 16
    object ADOHrcertificatedetarkey: TAutoIncField
      FieldName = 'detarkey'
      ProviderFlags = []
      ReadOnly = True
    end
    object ADOHrcertificateitem: TWideStringField
      FieldName = 'item'
      ProviderFlags = []
    end
    object ADOHrcertificateemplreky: TIntegerField
      FieldName = 'emplreky'
      ProviderFlags = []
    end
    object ADOHrcertificateemployeecode: TWideStringField
      FieldName = 'employeecode'
      ProviderFlags = []
    end
    object ADOHrcertificatechinesename: TWideStringField
      FieldName = 'chinesename'
      ProviderFlags = []
    end
    object ADOHrcertificateondutytime: TDateTimeField
      FieldName = 'ondutytime'
      ProviderFlags = []
    end
    object ADOHrcertificatedepartmentname: TWideStringField
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object ADOHrcertificateposition_item: TWideStringField
      FieldName = 'position_item'
      ProviderFlags = []
    end
    object ADOHrcertificateemployee_name: TStringField
      FieldName = 'employee_name'
      ProviderFlags = []
      Size = 16
    end
    object ADOHrcertificatestatus1: TStringField
      FieldName = 'status1'
      ProviderFlags = []
      Size = 4
    end
    object ADOHrcertificatecode: TWideStringField
      FieldName = 'code'
      Size = 50
    end
    object ADOHrcertificatetype: TIntegerField
      FieldName = 'type'
    end
    object ADOHrcertificatestartdate: TDateTimeField
      FieldName = 'startdate'
    end
    object ADOHrcertificateenddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ADOHrcertificateinputdate: TDateTimeField
      FieldName = 'inputdate'
    end
    object ADOHrcertificateremark: TWideStringField
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object ADOHrcertificatestatus: TIntegerField
      FieldName = 'status'
    end
    object ADOHrcertificateemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object ADOHrcertificatedatadetail_ptr: TIntegerField
      FieldName = 'datadetail_ptr'
    end
    object ADOHrcertificateopration_person: TIntegerField
      FieldName = 'opration_person'
    end
    object ADOHrcertificatestts: TStringField
      FieldName = 'stts'
      ProviderFlags = []
      OnChange = ADOHrcertificatesttsChange
      Size = 4
    end
    object ADOHrcertificatetype1: TStringField
      FieldName = 'type1'
      ProviderFlags = []
      Size = 4
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsHrcertificate
    OnStateChange = DataSource1StateChange
    Left = 429
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 104
    Top = 192
  end
  object ADOHrcertificate_1: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'SELECT D.rkey,D.code,Datadetail.item,D.type,v_employeemsg.employ' +
      'eecode,'#13#10'       v_employeemsg.chinesename,v_employeemsg.ondutyti' +
      'me,v_employeemsg.departmentname,'#13#10'       v_employeemsg.position_' +
      'item,D.startdate,D.enddate,D.inputdate,D05.employee_name,D.remar' +
      'k,'#13#10'       case D.status when 0 then '#39#26080#25928#39' when 1 then '#39#26377#25928#39' end A' +
      'S status'#13#10'FROM   Hrcertificate AS D INNER JOIN '#13#10'       v_employ' +
      'eemsg ON D.employeeid=v_employeemsg.rkey INNER JOIN '#13#10'       Dat' +
      'adetail ON D.datadetail_ptr=Datadetail.rkey INNER JOIN '#13#10'       ' +
      'Data0005 AS D05 ON D.opration_person=D05.rkey'#13#10'WHERE  D.enddate ' +
      'between :dtpk1 '#13#10'       and dateadd(day,-1,(dateadd(month,1,(con' +
      'vert(datetime,(substring(convert(nvarchar(20),getdate(),120),1,7' +
      ')+'#39'-01'#39'),120 )))))'#13#10'       and D.status=1'#13#10'       and  v_employe' +
      'emsg .status=:ondutyflag'
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ondutyflag'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    Left = 104
    Top = 72
    object ADOHrcertificate_1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOHrcertificate_1code: TWideStringField
      FieldName = 'code'
      Size = 50
    end
    object ADOHrcertificate_1item: TWideStringField
      FieldName = 'item'
    end
    object ADOHrcertificate_1type: TIntegerField
      FieldName = 'type'
    end
    object ADOHrcertificate_1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOHrcertificate_1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOHrcertificate_1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object ADOHrcertificate_1departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADOHrcertificate_1position_item: TWideStringField
      FieldName = 'position_item'
      ReadOnly = True
    end
    object ADOHrcertificate_1startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object ADOHrcertificate_1enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ADOHrcertificate_1inputdate: TDateTimeField
      FieldName = 'inputdate'
    end
    object ADOHrcertificate_1employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADOHrcertificate_1remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADOHrcertificate_1status: TStringField
      FieldName = 'status'
      ReadOnly = True
      Size = 4
    end
  end
  object ADOHrcertificate_2: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 
      'SELECT D.rkey,D.code,Datadetail.item,D.type,v_employeemsg.employ' +
      'eecode,'#13#10'       v_employeemsg.chinesename,v_employeemsg.ondutyti' +
      'me,v_employeemsg.departmentname,'#13#10'       v_employeemsg.position_' +
      'item,D.startdate,D.enddate,D.inputdate,D05.employee_name,D.remar' +
      'k,'#13#10'       case D.status when 0 then '#39#26080#25928#39' when 1 then '#39#26377#25928#39' end A' +
      'S status'#13#10'FROM   Hrcertificate AS D INNER JOIN '#13#10'       v_employ' +
      'eemsg ON D.employeeid=v_employeemsg.rkey INNER JOIN '#13#10'       Dat' +
      'adetail ON D.datadetail_ptr=Datadetail.rkey INNER JOIN '#13#10'       ' +
      'Data0005 AS D05 ON D.opration_person=D05.rkey'#13#10'WHERE  D.enddate<' +
      ':enddate'#13#10'       and  v_employeemsg .status=:ondutyflag'
    Parameters = <
      item
        Name = 'enddate'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'ondutyflag'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    Left = 104
    Top = 128
    object ADOHrcertificate_2rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOHrcertificate_2code: TWideStringField
      FieldName = 'code'
      Size = 50
    end
    object ADOHrcertificate_2item: TWideStringField
      FieldName = 'item'
    end
    object ADOHrcertificate_2type: TIntegerField
      FieldName = 'type'
    end
    object ADOHrcertificate_2employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOHrcertificate_2chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOHrcertificate_2ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object ADOHrcertificate_2departmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADOHrcertificate_2position_item: TWideStringField
      FieldName = 'position_item'
      ReadOnly = True
    end
    object ADOHrcertificate_2startdate: TDateTimeField
      FieldName = 'startdate'
    end
    object ADOHrcertificate_2enddate: TDateTimeField
      FieldName = 'enddate'
    end
    object ADOHrcertificate_2inputdate: TDateTimeField
      FieldName = 'inputdate'
    end
    object ADOHrcertificate_2employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADOHrcertificate_2remark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
    object ADOHrcertificate_2status: TStringField
      FieldName = 'status'
      ReadOnly = True
      Size = 4
    end
  end
  object DataSource2: TDataSource
    DataSet = ADOHrcertificate_1
    Left = 429
    Top = 72
  end
  object DataSource3: TDataSource
    DataSet = ADOHrcertificate_2
    Left = 429
    Top = 128
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 104
    Top = 248
  end
  object dspHrcertificate: TDataSetProvider
    DataSet = ADOHrcertificate
    Options = [poPropogateChanges, poAllowCommandText]
    Left = 224
    Top = 16
  end
  object cdsHrcertificate: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Datadetail.rkey as detarkey,Datadetail.item,v_employeemsg' +
      '.rkey as emplreky,'#13#10'       v_employeemsg.employeecode,v_employee' +
      'msg.chinesename,'#13#10'       v_employeemsg.ondutytime,v_employeemsg.' +
      'departmentname,'#13#10'       v_employeemsg.position_item,D05.employee' +
      '_name,'#13#10'       case v_employeemsg.status when 1 then '#39#22312#32844#39' when 2' +
      ' then '#39#31163#32844#39' end AS status1,'#13#10'       D.rkey,D.code,D.type,D.startd' +
      'ate,D.enddate,D.inputdate,D.remark,'#13#10'       D.[status],D.employe' +
      'eid ,D.datadetail_ptr ,D.opration_person ,'#13#10'       case D.[statu' +
      's] when 0 then '#39#26080#25928#39' when 1 then '#39#26377#25928#39' end as[stts],'#13#10'       case ' +
      'D.type when 0 then '#39#20010#20154#39' when 1 then  '#39#20844#21496#39' end as [type1]     '#13#10'F' +
      'ROM   Hrcertificate AS D INNER JOIN '#13#10'       v_employeemsg  ON D' +
      '.employeeid=v_employeemsg.rkey INNER JOIN '#13#10'       Datadetail ON' +
      ' D.datadetail_ptr=Datadetail.rkey INNER JOIN '#13#10'       Data0005 A' +
      'S D05 ON D.opration_person=D05.rkey'#13#10'WHERE  D.startdate between ' +
      ':dtpk1 and :dtpk2 and'#13#10'             v_employeemsg.status=:onduty' +
      'tflag'#13#10'               '
    FilterOptions = [foCaseInsensitive]
    Params = <
      item
        DataType = ftDateTime
        Name = 'dtpk1'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'dtpk2'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'ondutytflag'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspHrcertificate'
    AfterOpen = cdsHrcertificateAfterOpen
    BeforeClose = cdsHrcertificateBeforeClose
    AfterInsert = cdsHrcertificateAfterInsert
    AfterScroll = cdsHrcertificateAfterScroll
    OnFilterRecord = cdsHrcertificateFilterRecord
    OnReconcileError = cdsHrcertificateReconcileError
    Left = 328
    Top = 16
    object cdsHrcertificatecode: TWideStringField
      DisplayLabel = #35777#20070#32534#21495
      FieldName = 'code'
      Size = 50
    end
    object cdsHrcertificateitem: TWideStringField
      DisplayLabel = #35777#20070#21517#31216
      FieldName = 'item'
      ProviderFlags = []
      OnChange = cdsHrcertificateitemChange
    end
    object cdsHrcertificateemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
      ProviderFlags = []
      OnChange = cdsHrcertificateemployeecodeChange
    end
    object cdsHrcertificatechinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
      ProviderFlags = []
    end
    object cdsHrcertificateondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
      ProviderFlags = []
    end
    object cdsHrcertificatedepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object cdsHrcertificateposition_item: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position_item'
      ProviderFlags = []
    end
    object cdsHrcertificatestartdate: TDateTimeField
      DisplayLabel = #29983#25928#26085#26399
      FieldName = 'startdate'
    end
    object cdsHrcertificateenddate: TDateTimeField
      DisplayLabel = #22833#25928#26085#26399
      FieldName = 'enddate'
    end
    object cdsHrcertificateinputdate: TDateTimeField
      DisplayLabel = #24405#20837#26085#26399
      FieldName = 'inputdate'
    end
    object cdsHrcertificateemployee_name: TStringField
      DisplayLabel = #24405#20837#20154
      FieldName = 'employee_name'
      ProviderFlags = []
      Size = 16
    end
    object cdsHrcertificateremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object cdsHrcertificatedetarkey: TAutoIncField
      FieldName = 'detarkey'
      ProviderFlags = []
      ReadOnly = True
    end
    object cdsHrcertificateemplreky: TIntegerField
      FieldName = 'emplreky'
      ProviderFlags = []
    end
    object cdsHrcertificatestatus1: TStringField
      DisplayLabel = #22312#32844'/'#31163#32844
      FieldName = 'status1'
      ProviderFlags = []
      Size = 4
    end
    object cdsHrcertificatetype: TIntegerField
      DisplayLabel = #35777#20070#24615#36136
      FieldName = 'type'
      OnGetText = cdsHrcertificatetypeGetText
      OnSetText = cdsHrcertificatetypeSetText
    end
    object cdsHrcertificatestatus: TIntegerField
      DisplayLabel = #35777#20070#26377#25928#24615
      FieldName = 'status'
      OnGetText = cdsHrcertificatestatusGetText
      OnSetText = cdsHrcertificatestatusSetText
    end
    object cdsHrcertificateemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object cdsHrcertificatedatadetail_ptr: TIntegerField
      FieldName = 'datadetail_ptr'
    end
    object cdsHrcertificateopration_person: TIntegerField
      FieldName = 'opration_person'
    end
    object cdsHrcertificatestts: TStringField
      DisplayLabel = #35777#20070#26377#25928#24615
      FieldName = 'stts'
      OnChange = cdsHrcertificatesttsChange
      Size = 4
    end
    object cdsHrcertificatetype1: TStringField
      DisplayLabel = #35777#20070#24615#36136
      FieldName = 'type1'
      OnChange = cdsHrcertificatetype1Change
      Size = 4
    end
  end
  object dt_v_employeemsg: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      #13#10'select rkey,chinesename,employeecode,departmentname,ondutytime' +
      ',position_item,'#13#10'case v_employeemsg.status when 1 then '#39#22312#32844#39' when' +
      ' 2 then '#39#31163#32844#39' end AS status from v_employeemsg'#13#10'order by chinesen' +
      'ame'
    Parameters = <>
    Left = 240
    Top = 280
    object dt_v_employeemsgrkey: TIntegerField
      FieldName = 'rkey'
      Visible = False
    end
    object dt_v_employeemsgemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      DisplayWidth = 10
      FieldName = 'employeecode'
    end
    object dt_v_employeemsgchinesename: TWideStringField
      DisplayLabel = #22995#21517
      DisplayWidth = 10
      FieldName = 'chinesename'
    end
    object dt_v_employeemsgdepartmentname: TWideStringField
      DisplayLabel = #37096#38376#21517#31216
      DisplayWidth = 15
      FieldName = 'departmentname'
    end
    object dt_v_employeemsgondutytime: TDateTimeField
      DisplayLabel = #21040#32844#26085#26399
      DisplayWidth = 10
      FieldName = 'ondutytime'
    end
    object dt_v_employeemsgposition_item: TWideStringField
      DisplayLabel = #32844#21153
      DisplayWidth = 10
      FieldName = 'position_item'
      ReadOnly = True
    end
    object dt_v_employeemsgstatus: TStringField
      DisplayLabel = #22312#32844'/'#31163#32844
      FieldName = 'status'
      ReadOnly = True
      Size = 4
    end
  end
  object dt_dictid: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select * from datadetail where dictid in (select rkey from datad' +
      'ict where item='#39#35777#20070#21517#31216#39')'
    Parameters = <>
    Left = 240
    Top = 232
    object dt_dictidrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dt_dictiddictid: TIntegerField
      FieldName = 'dictid'
    end
    object dt_dictiditem: TWideStringField
      FieldName = 'item'
    end
    object dt_dictidMemo: TWideStringField
      FieldName = 'Memo'
      Size = 200
    end
  end
  object dt_0005: TADODataSet
    Connection = ADOConn
    CursorType = ctStatic
    CommandText = 'select rkey,employee_name from Data0005'
    Parameters = <>
    Left = 240
    Top = 184
    object dt_0005rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dt_0005employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
  end
  object cdsHrcertificate1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT Datadetail.rkey as detarkey,Datadetail.item,v_employeemsg' +
      '.rkey as emplreky,'#13#10'       v_employeemsg.employeecode,v_employee' +
      'msg.chinesename,'#13#10'       v_employeemsg.ondutytime,v_employeemsg.' +
      'departmentname,'#13#10'       v_employeemsg.position_item,D05.employee' +
      '_name,'#13#10'       case v_employeemsg.status when 1 then '#39#22312#32844#39' when 2' +
      ' then '#39#31163#32844#39' end AS status1,'#13#10'       D.rkey,D.code,D.type,D.startd' +
      'ate,D.enddate,D.inputdate,D.remark,'#13#10'       D.[status],D.employe' +
      'eid ,D.datadetail_ptr ,D.opration_person ,'#13#10'       case D.[statu' +
      's] when 0 then '#39#26080#25928#39' when 1 then '#39#26377#25928#39' end as[stts],'#13#10'       case ' +
      'D.type when 0 then '#39#20010#20154#39' when 1 then  '#39#20844#21496#39' end as [type1]     '#13#10'F' +
      'ROM   Hrcertificate AS D INNER JOIN '#13#10'       v_employeemsg ON D.' +
      'employeeid=v_employeemsg.rkey INNER JOIN '#13#10'       Datadetail ON ' +
      'D.datadetail_ptr=Datadetail.rkey INNER JOIN '#13#10'       Data0005 AS' +
      ' D05 ON D.opration_person=D05.rkey'#13#10'WHERE  1=2'
    FilterOptions = [foCaseInsensitive]
    Params = <>
    ProviderName = 'dspHrcertificate'
    BeforeClose = cdsHrcertificateBeforeClose
    AfterInsert = cdsHrcertificateAfterInsert
    AfterScroll = cdsHrcertificate1AfterScroll
    OnReconcileError = cdsHrcertificateReconcileError
    Left = 320
    Top = 88
    object WideStringField1: TWideStringField
      DisplayLabel = #35777#20070#32534#21495
      FieldName = 'code'
      Size = 50
    end
    object WideStringField2: TWideStringField
      DisplayLabel = #35777#20070#21517#31216
      FieldName = 'item'
      ProviderFlags = []
      OnChange = cdsHrcertificateitemChange
    end
    object cdsHrcertificate1_employeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
      ProviderFlags = []
      OnChange = cdsHrcertificate1_employeecodeChange
    end
    object WideStringField4: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
      ProviderFlags = []
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
      ProviderFlags = []
    end
    object WideStringField5: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object WideStringField6: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position_item'
      ProviderFlags = []
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #29983#25928#26085#26399
      FieldName = 'startdate'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = #22833#25928#26085#26399
      FieldName = 'enddate'
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = #24405#20837#26085#26399
      FieldName = 'inputdate'
    end
    object StringField1: TStringField
      DisplayLabel = #24405#20837#20154
      FieldName = 'employee_name'
      ProviderFlags = []
      Size = 16
    end
    object WideStringField7: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'detarkey'
      ProviderFlags = []
      ReadOnly = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'emplreky'
      ProviderFlags = []
    end
    object StringField2: TStringField
      DisplayLabel = #22312#32844'/'#31163#32844
      FieldName = 'status1'
      ProviderFlags = []
      Size = 4
    end
    object IntegerField2: TIntegerField
      DisplayLabel = #35777#20070#24615#36136
      FieldName = 'type'
      OnGetText = cdsHrcertificatetypeGetText
      OnSetText = cdsHrcertificatetypeSetText
    end
    object IntegerField3: TIntegerField
      DisplayLabel = #35777#20070#26377#25928#24615
      FieldName = 'status'
      OnGetText = cdsHrcertificatestatusGetText
      OnSetText = cdsHrcertificatestatusSetText
    end
    object IntegerField4: TIntegerField
      FieldName = 'employeeid'
    end
    object IntegerField5: TIntegerField
      FieldName = 'datadetail_ptr'
    end
    object IntegerField6: TIntegerField
      FieldName = 'opration_person'
    end
    object StringField3: TStringField
      DisplayLabel = #35777#20070#26377#25928#24615
      FieldName = 'stts'
      OnChange = cdsHrcertificatesttsChange
      Size = 4
    end
    object StringField4: TStringField
      DisplayLabel = #35777#20070#24615#36136
      FieldName = 'type1'
      OnChange = cdsHrcertificatetype1Change
      Size = 4
    end
  end
end
