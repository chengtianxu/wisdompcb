object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 482
  Top = 284
  Height = 381
  Width = 657
  object cn_change: TADOConnection
    ConnectionTimeout = 20
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 24
  end
  object qry_info: TADOQuery
    AutoCalcFields = False
    Connection = cn_change
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    AfterScroll = qry_infoAfterScroll
    EnableBCD = False
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT     alt.*, '
      
        'Data0005.EMPLOYEE_NAME, msg.chinesename, msg.employeecode, msg.o' +
        'ndutytime, msg.employ_type, '
      
        'msg.sex, msg.outdutytime,mdet.item AS rank, rdet.item AS rreason' +
        ', tdet.item AS ttype, pdet.item AS pposition, '
      
        'tdet.dictid, npdet.item AS nposition, opdet.item AS oposition, n' +
        'hdet.item AS nhtype, ohdet.item AS ohtype, hdet.item AS phtype, ' +
        'npdetr.item AS nrank, '
      
        'opdetr.item AS orank, dept.departmentname, ndept.departmentname ' +
        'AS ndepartmentname, odept.departmentname AS odepartmentname, '
      
        '(CASE msg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' ELSE '#39#20854#23427#39' END) AS ' +
        'sexy,Train_NO,msg.starLevel'
      'FROM employee_alteration AS alt LEFT OUTER JOIN'
      'Data0005 ON Data0005.RKEY = alt.oper_person LEFT OUTER JOIN'
      'employeemsg AS msg ON msg.rkey = alt.employeeid LEFT OUTER JOIN'
      'datadetail AS mdet ON mdet.rkey = msg.Rank LEFT OUTER JOIN'
      'datadetail AS rdet ON rdet.rkey = alt.reason JOIN'
      
        'datadetail AS tdet ON tdet.rkey = alt.type and tdet.dictid=7 LEF' +
        'T OUTER JOIN'
      'datadetail AS pdet ON pdet.rkey = msg.Position LEFT OUTER JOIN'
      
        'datadetail AS npdet ON npdet.rkey = alt.new_position LEFT OUTER ' +
        'JOIN'
      
        'datadetail AS opdet ON opdet.rkey = alt.orginal_position LEFT OU' +
        'TER JOIN'
      
        'datadetail AS npdetr ON npdetr.rkey = alt.new_rank LEFT OUTER JO' +
        'IN'
      
        'datadetail AS opdetr ON opdetr.rkey = alt.orginal_rank LEFT OUTE' +
        'R JOIN'
      
        'datadetail AS hdet ON hdet.rkey = msg.employ_type LEFT OUTER JOI' +
        'N'
      
        'datadetail AS nhdet ON nhdet.rkey = alt.new_employ_type LEFT OUT' +
        'ER JOIN'
      
        'datadetail AS ohdet ON ohdet.rkey = alt.orginal_employ_type LEFT' +
        ' OUTER JOIN'
      
        'datadepartment AS dept ON dept.rkey = msg.departmentid LEFT OUTE' +
        'R JOIN'
      
        'datadepartment AS ndept ON ndept.rkey = alt.new_departmentid LEF' +
        'T OUTER JOIN'
      'datadepartment AS odept ON odept.rkey = alt.orginal_departmentid'
      
        'left join Employee_Train on Employee_Train.rkey=alt.employee_tra' +
        'in_ptr'
      'where active<>2 '
      'order by  alterdate desc')
    Left = 72
    Top = 24
    object atncfld_inforkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object intgrfld_infoemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object intgrfld_infotype: TIntegerField
      DisplayLabel = #21464#21160#31867#22411
      FieldName = 'type'
    end
    object intgrfld_inforeason: TIntegerField
      FieldName = 'reason'
    end
    object dtmfld_infoalterdate: TDateTimeField
      DisplayLabel = #21464#26356#26085#26399
      FieldName = 'alterdate'
    end
    object wdstrngfld_infoorginal_employeecode: TWideStringField
      DisplayLabel = #26087#24037#21495
      FieldName = 'orginal_employeecode'
    end
    object intgrfld_infoorginal_departmentid: TIntegerField
      FieldName = 'orginal_departmentid'
    end
    object intgrfld_infoorginal_position: TIntegerField
      FieldName = 'orginal_position'
    end
    object intgrfld_infoorginal_employ_type: TIntegerField
      FieldName = 'orginal_employ_type'
    end
    object intgrfld_infoorginal_politics_face: TIntegerField
      FieldName = 'orginal_politics_face'
    end
    object intgrfld_infoorginal_education: TIntegerField
      FieldName = 'orginal_education'
    end
    object intgrfld_infoorginal_marriage: TIntegerField
      FieldName = 'orginal_marriage'
    end
    object intgrfld_infoorginal_rank: TIntegerField
      FieldName = 'orginal_rank'
    end
    object wdstrngfld_infonew_employeecode: TWideStringField
      DisplayLabel = #26032#24037#21495
      FieldName = 'new_employeecode'
    end
    object intgrfld_infonew_departmentid: TIntegerField
      FieldName = 'new_departmentid'
    end
    object intgrfld_infonew_position: TIntegerField
      FieldName = 'new_position'
    end
    object intgrfld_infonew_employ_type: TIntegerField
      FieldName = 'new_employ_type'
    end
    object intgrfld_infonew_politics_face: TIntegerField
      FieldName = 'new_politics_face'
    end
    object intgrfld_infonew_education: TIntegerField
      FieldName = 'new_education'
    end
    object intgrfld_infonew_marriage: TIntegerField
      FieldName = 'new_marriage'
    end
    object intgrfld_infonew_rank: TIntegerField
      FieldName = 'new_rank'
    end
    object dtmfld_infooper_date: TDateTimeField
      DisplayLabel = #25805#20316#26085#26399
      FieldName = 'oper_date'
    end
    object intgrfld_infoactive: TIntegerField
      FieldName = 'active'
      OnGetText = intgrfld_infoactiveGetText
    end
    object wdstrngfld_infochinesename: TWideStringField
      DisplayLabel = #21592#24037#22995#21517
      FieldName = 'chinesename'
    end
    object wdstrngfld_infoemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object dtmfld_infoondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object intgrfld_infoemploy_type: TIntegerField
      FieldName = 'employ_type'
    end
    object intgrfld_infosex: TIntegerField
      DisplayLabel = #24615#21035
      FieldName = 'sex'
    end
    object dtmfld_infooutdutytime: TDateTimeField
      FieldName = 'outdutytime'
    end
    object wdstrngfld_inforreason: TWideStringField
      DisplayLabel = #21407#22240#21450#22791#27880
      FieldName = 'rreason'
    end
    object wdstrngfld_infottype: TWideStringField
      DisplayLabel = #21464#21160#31867#22411
      FieldName = 'ttype'
    end
    object wdstrngfld_infopposition: TWideStringField
      FieldName = 'pposition'
    end
    object intgrfld_infodictid: TIntegerField
      FieldName = 'dictid'
    end
    object wdstrngfld_infonposition: TWideStringField
      DisplayLabel = #26032#32844#21153
      FieldName = 'nposition'
    end
    object wdstrngfld_infooposition: TWideStringField
      DisplayLabel = #26087#32844#21153
      FieldName = 'oposition'
    end
    object wdstrngfld_infonhtype: TWideStringField
      DisplayLabel = #26032#21512#21516#31867#22411
      FieldName = 'nhtype'
    end
    object wdstrngfld_infoohtype: TWideStringField
      DisplayLabel = #26087#21512#21516#31867#22411
      FieldName = 'ohtype'
    end
    object wdstrngfld_infophtype: TWideStringField
      FieldName = 'phtype'
    end
    object wdstrngfld_infodepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object wdstrngfld_infondepartmentname: TWideStringField
      DisplayLabel = #26032#37096#38376
      FieldName = 'ndepartmentname'
    end
    object wdstrngfld_infoodepartmentname: TWideStringField
      DisplayLabel = #26087#37096#38376
      FieldName = 'odepartmentname'
    end
    object qry_infosexy: TStringField
      DisplayLabel = #24615#21035
      FieldName = 'sexy'
      ReadOnly = True
      Size = 4
    end
    object qry_infoemployee_name: TStringField
      DisplayLabel = #25805#20316#20154#21592
      FieldName = 'employee_name'
    end
    object qry_infoorank: TStringField
      DisplayLabel = #26087#32844#32423
      FieldName = 'orank'
    end
    object qry_infonrank: TStringField
      DisplayLabel = #26032#32844#32423
      FieldName = 'nrank'
    end
    object qry_inforank: TStringField
      FieldName = 'rank'
    end
    object qry_inforemark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 80
    end
    object qry_infoorginal_star: TIntegerField
      DisplayLabel = #26087#26143#32423
      FieldName = 'orginal_star'
    end
    object qry_infonew_star: TIntegerField
      DisplayLabel = #26032#26143#32423
      FieldName = 'new_star'
    end
    object qry_infoTrain_NO: TStringField
      DisplayLabel = #22521#35757#32534#21495
      FieldName = 'Train_NO'
      Size = 50
    end
    object qry_infoemployee_train_flag: TBooleanField
      DisplayLabel = #38656#35201#22521#35757
      FieldName = 'employee_train_flag'
    end
    object qry_infooper_person: TIntegerField
      FieldName = 'oper_person'
    end
    object qry_infoorginal_ondutytime: TWideStringField
      FieldName = 'orginal_ondutytime'
    end
    object qry_infoorginal_outdutytime: TWideStringField
      FieldName = 'orginal_outdutytime'
    end
    object qry_infoemployee_train_ptr: TIntegerField
      FieldName = 'employee_train_ptr'
    end
    object qry_infoorginal_accountid: TIntegerField
      FieldName = 'orginal_accountid'
    end
    object qry_infonew_accountid: TIntegerField
      FieldName = 'new_accountid'
    end
    object qry_infostarLevel: TIntegerField
      FieldName = 'starLevel'
    end
  end
  object ds_info: TDataSource
    DataSet = qry_info
    Left = 160
    Top = 24
  end
  object qry_msg: TADOQuery
    Connection = cn_change
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'select msg.rkey,employeecode,chinesename,status,datadetail.item ' +
        'rankname,[rank],'
      
        '(case sex when 0 then '#39#22899#39' when 1 then '#39#30007#39' else '#39#20854#23427#39'  end) as sex' +
        'y ,'
      
        'ondutytime,outdutytime,province,IDCard,departmentid,pdet.item as' +
        ' pposition,'
      
        'mdet.item as employ_type,dept.departmentname,position,starLevel,' +
        'pdet.train_flag'
      ' from employeemsg msg'
      ' left join datadetail pdet on pdet.rkey=msg.position'
      ' left join datadetail mdet on mdet.rkey=msg.employ_type'
      ' left join datadetail on datadetail.rkey=msg.Rank'
      ' left join datadepartment dept on dept.rkey=msg.departmentid'
      'where status=1'
      'order by  employeecode')
    Left = 72
    Top = 80
    object qry_msgrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object qry_msgemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      DisplayWidth = 8
      FieldName = 'employeecode'
    end
    object qry_msgchinesename: TWideStringField
      DisplayLabel = #22995#21517
      DisplayWidth = 10
      FieldName = 'chinesename'
    end
    object qry_msgdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      DisplayWidth = 15
      FieldName = 'departmentname'
    end
    object qry_msgstatus: TWordField
      DisplayLabel = #29366#24577
      FieldName = 'status'
      Visible = False
    end
    object qry_msgrankname: TWideStringField
      FieldName = 'rankname'
      Visible = False
    end
    object qry_msgrank: TIntegerField
      FieldName = 'rank'
      Visible = False
    end
    object qry_msgsexy: TStringField
      DisplayLabel = #22995#21035
      FieldName = 'sexy'
      ReadOnly = True
      Size = 4
    end
    object qry_msgondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object qry_msgoutdutytime: TDateTimeField
      FieldName = 'outdutytime'
      Visible = False
    end
    object qry_msgprovince: TWideStringField
      FieldName = 'province'
      Visible = False
    end
    object qry_msgIDCard: TWideStringField
      FieldName = 'IDCard'
      Visible = False
    end
    object qry_msgdepartmentid: TIntegerField
      FieldName = 'departmentid'
      Visible = False
    end
    object qry_msgpposition: TWideStringField
      FieldName = 'pposition'
      Visible = False
    end
    object qry_msgemploy_type: TWideStringField
      FieldName = 'employ_type'
      Visible = False
    end
    object qry_msgposition: TIntegerField
      FieldName = 'position'
      Visible = False
    end
    object qry_msgstarLevel: TIntegerField
      FieldName = 'starLevel'
      Visible = False
    end
    object qry_msgtrain_flag: TBooleanField
      FieldName = 'train_flag'
    end
  end
  object qry_detail: TADOQuery
    Connection = cn_change
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from datadetail')
    Left = 74
    Top = 136
    object qry_detailrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_detaildictid: TIntegerField
      FieldName = 'dictid'
    end
    object qry_detailitem: TWideStringField
      FieldName = 'item'
    end
    object qry_detailMemo: TWideStringField
      FieldName = 'Memo'
      Size = 200
    end
    object qry_detailtrain_flag: TBooleanField
      FieldName = 'train_flag'
    end
  end
  object ds_detail: TDataSource
    DataSet = qry_detail
    Left = 160
    Top = 136
  end
  object qryUpdateBD: TADOQuery
    Connection = cn_change
    Parameters = <>
    Left = 256
    Top = 192
  end
  object qryTemp: TADOQuery
    Connection = cn_change
    Parameters = <>
    Left = 72
    Top = 192
  end
  object qry_Employee_Train: TADOQuery
    Connection = cn_change
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'vEmployeeid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select '
      'rkey ,'
      'Train_NO ,'
      'Train_topics ,'
      'startdate ,'
      'enddate'#9','
      'Teacher'#9','
      'Train_place'#9','
      'Train_grade'#9','
      'Train_result ,'
      'Train_content ,'
      'Train_status ,'
      'ptr_flag'
      'from dbo.Employee_Train'
      
        'where (employeeid=:vEmployeeid) and (ptr_flag is null or ptr_fla' +
        'g=0)  '
      
        'and type_ptr =(select rkey from datadetail where dictid=20 and i' +
        'tem ='#39#21319#32844#39')')
    Left = 72
    Top = 248
    object qry_Employee_Trainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object qry_Employee_TrainTrain_NO: TStringField
      DisplayLabel = #22521#35757#32534#21495
      DisplayWidth = 15
      FieldName = 'Train_NO'
      Size = 50
    end
    object qry_Employee_TrainTrain_topics: TWideStringField
      DisplayLabel = #22521#35757#20027#39064
      DisplayWidth = 20
      FieldName = 'Train_topics'
      Size = 50
    end
    object qry_Employee_Trainstartdate: TDateTimeField
      DisplayLabel = #24320#22987#26085
      DisplayWidth = 11
      FieldName = 'startdate'
    end
    object qry_Employee_Trainenddate: TDateTimeField
      DisplayLabel = #32467#26463#26085
      DisplayWidth = 11
      FieldName = 'enddate'
    end
    object qry_Employee_TrainTeacher: TWideStringField
      DisplayLabel = #22521#35757#35762#24072
      DisplayWidth = 10
      FieldName = 'Teacher'
    end
    object qry_Employee_TrainTrain_place: TWideStringField
      DisplayLabel = #22521#35757#22320#28857
      DisplayWidth = 10
      FieldName = 'Train_place'
    end
    object qry_Employee_TrainTrain_grade: TWideStringField
      DisplayLabel = #22521#35757#25104#32489
      FieldName = 'Train_grade'
    end
    object qry_Employee_TrainTrain_result: TWideStringField
      DisplayLabel = #22521#35757#32467#26524
      FieldName = 'Train_result'
    end
    object qry_Employee_TrainTrain_content: TWideStringField
      DisplayLabel = #22521#35757#20869#23481
      DisplayWidth = 30
      FieldName = 'Train_content'
      Size = 200
    end
    object qry_Employee_TrainTrain_status: TIntegerField
      DisplayLabel = #22521#35757#23436#25104
      FieldName = 'Train_status'
    end
  end
  object dsp_alt: TDataSetProvider
    DataSet = dt_alt
    Options = [poPropogateChanges, poAllowCommandText]
    AfterUpdateRecord = dsp_altAfterUpdateRecord
    OnGetTableName = dsp_altGetTableName
    Left = 432
    Top = 80
  end
  object cds_alt: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select pdet.train_flag,msg.employeecode,chinesename,Train_NO,Tra' +
      'in_topics,[status],datadetail.item rankname,[rank],'#13#10'(case sex w' +
      'hen 0 then '#39#22899#39' when 1 then '#39#30007#39' else '#39#20854#23427#39'  end) as sexy ,'#13#10'onduty' +
      'time,outdutytime,province,IDCard,departmentid,pdet.item as pposi' +
      'tion,'#13#10'mdet.item as employ_type,dept.departmentname,position,sta' +
      'rLevel,Data0005.EMPLOYEE_NAME,'#13#10'employee_alteration.* '#13#10'from emp' +
      'loyee_alteration '#13#10'left join Employee_Train Tra on employee_alte' +
      'ration.employee_train_ptr=Tra.rkey'#13#10'left join employeemsg AS msg' +
      ' ON msg.rkey = employee_alteration.employeeid '#13#10'left join datade' +
      'partment dept on dept.rkey=msg.departmentid'#13#10' left join datadeta' +
      'il pdet on pdet.rkey=msg.position'#13#10' left join datadetail mdet on' +
      ' mdet.rkey=msg.employ_type'#13#10' left join datadetail on datadetail.' +
      'rkey=msg.[Rank]'#13#10' left join Data0005 ON Data0005.RKEY = oper_per' +
      'son '#13#10'where 1=2'
    Params = <>
    ProviderName = 'dsp_alt'
    AfterInsert = cds_altAfterInsert
    BeforePost = cds_altBeforePost
    AfterScroll = cds_altAfterScroll
    OnReconcileError = cds_altReconcileError
    Left = 432
    Top = 136
    object cds_altdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      DisplayWidth = 11
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object cds_altchinesename: TWideStringField
      DisplayLabel = #22995#21517
      DisplayWidth = 9
      FieldName = 'chinesename'
      ProviderFlags = []
    end
    object cds_altemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      DisplayWidth = 8
      FieldName = 'employeecode'
      ProviderFlags = []
      OnChange = cds_altemployeecodeChange
    end
    object cds_altondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26102#38388
      DisplayWidth = 15
      FieldName = 'ondutytime'
      ProviderFlags = []
    end
    object cds_altemployee_train_flag: TBooleanField
      DisplayLabel = #22521#35757
      DisplayWidth = 5
      FieldName = 'employee_train_flag'
      OnChange = cds_altemployee_train_flagChange
    end
    object cds_altTrain_NO: TStringField
      DisplayLabel = #22521#35757#32534#21495
      DisplayWidth = 18
      FieldName = 'Train_NO'
      ProviderFlags = []
      OnChange = cds_altTrain_NOChange
      Size = 50
    end
    object cds_altTrain_topics: TWideStringField
      DisplayLabel = #22521#35757#20027#39064
      DisplayWidth = 18
      FieldName = 'Train_topics'
      ProviderFlags = []
      Size = 50
    end
    object cds_altpposition: TWideStringField
      DisplayLabel = #32844#21153
      DisplayWidth = 9
      FieldName = 'pposition'
      ProviderFlags = []
    end
    object cds_altrankname: TWideStringField
      DisplayLabel = #32844#32423
      DisplayWidth = 12
      FieldName = 'rankname'
      ProviderFlags = []
    end
    object cds_altprovince: TWideStringField
      DisplayLabel = #34249#36143
      DisplayWidth = 16
      FieldName = 'province'
      ProviderFlags = []
    end
    object cds_altemploy_type: TWideStringField
      DisplayLabel = #21512#21516#31867#22411
      DisplayWidth = 12
      FieldName = 'employ_type'
      ProviderFlags = []
    end
    object cds_altIDCard: TWideStringField
      DisplayLabel = #36523#20221#35777#21495#30721
      DisplayWidth = 15
      FieldName = 'IDCard'
      ProviderFlags = []
    end
    object cds_altorginal_star: TIntegerField
      FieldName = 'orginal_star'
      Visible = False
    end
    object cds_altnew_star: TIntegerField
      FieldName = 'new_star'
      Visible = False
    end
    object cds_altstatus: TSmallintField
      FieldName = 'status'
      ProviderFlags = []
      Visible = False
    end
    object cds_altrank: TIntegerField
      FieldName = 'rank'
      ProviderFlags = []
      Visible = False
    end
    object cds_altsexy: TStringField
      FieldName = 'sexy'
      ProviderFlags = []
      Visible = False
      Size = 4
    end
    object cds_altoutdutytime: TDateTimeField
      FieldName = 'outdutytime'
      ProviderFlags = []
      Visible = False
    end
    object cds_altdepartmentid: TIntegerField
      FieldName = 'departmentid'
      ProviderFlags = []
      Visible = False
    end
    object cds_altposition: TIntegerField
      FieldName = 'position'
      ProviderFlags = []
      Visible = False
    end
    object cds_altstarLevel: TIntegerField
      FieldName = 'starLevel'
      ProviderFlags = []
      Visible = False
    end
    object cds_altEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object cds_altrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object cds_altemployeeid: TIntegerField
      FieldName = 'employeeid'
      Visible = False
    end
    object cds_alttype: TIntegerField
      FieldName = 'type'
      Visible = False
    end
    object cds_altreason: TIntegerField
      FieldName = 'reason'
      Visible = False
    end
    object cds_altalterdate: TDateTimeField
      FieldName = 'alterdate'
      Visible = False
    end
    object cds_altorginal_employeecode: TWideStringField
      FieldName = 'orginal_employeecode'
      Visible = False
    end
    object cds_altorginal_departmentid: TIntegerField
      FieldName = 'orginal_departmentid'
      Visible = False
    end
    object cds_altorginal_position: TIntegerField
      FieldName = 'orginal_position'
      Visible = False
    end
    object cds_altorginal_employ_type: TIntegerField
      FieldName = 'orginal_employ_type'
      Visible = False
    end
    object cds_altorginal_politics_face: TIntegerField
      FieldName = 'orginal_politics_face'
      Visible = False
    end
    object cds_altorginal_education: TIntegerField
      FieldName = 'orginal_education'
      Visible = False
    end
    object cds_altorginal_marriage: TIntegerField
      FieldName = 'orginal_marriage'
      Visible = False
    end
    object cds_altorginal_rank: TIntegerField
      FieldName = 'orginal_rank'
      Visible = False
    end
    object cds_altorginal_accountid: TIntegerField
      FieldName = 'orginal_accountid'
      Visible = False
    end
    object cds_altnew_employeecode: TWideStringField
      FieldName = 'new_employeecode'
      Visible = False
    end
    object cds_altnew_departmentid: TIntegerField
      FieldName = 'new_departmentid'
      Visible = False
    end
    object cds_altnew_position: TIntegerField
      FieldName = 'new_position'
      Visible = False
    end
    object cds_altnew_employ_type: TIntegerField
      FieldName = 'new_employ_type'
      Visible = False
    end
    object cds_altnew_politics_face: TIntegerField
      FieldName = 'new_politics_face'
      Visible = False
    end
    object cds_altnew_education: TIntegerField
      FieldName = 'new_education'
      Visible = False
    end
    object cds_altnew_marriage: TIntegerField
      FieldName = 'new_marriage'
      Visible = False
    end
    object cds_altnew_rank: TIntegerField
      FieldName = 'new_rank'
      Visible = False
    end
    object cds_altnew_accountid: TIntegerField
      FieldName = 'new_accountid'
      Visible = False
    end
    object cds_altoper_person: TIntegerField
      FieldName = 'oper_person'
      Visible = False
    end
    object cds_altoper_date: TDateTimeField
      FieldName = 'oper_date'
      Visible = False
    end
    object cds_altactive: TIntegerField
      FieldName = 'active'
      Visible = False
    end
    object cds_altremark: TWideStringField
      FieldName = 'remark'
      Visible = False
      Size = 80
    end
    object cds_altorginal_ondutytime: TWideStringField
      FieldName = 'orginal_ondutytime'
      Visible = False
    end
    object cds_altorginal_outdutytime: TWideStringField
      FieldName = 'orginal_outdutytime'
      Visible = False
    end
    object cds_altemployee_train_ptr: TIntegerField
      FieldName = 'employee_train_ptr'
      Visible = False
    end
    object cds_alttrain_flag: TBooleanField
      FieldName = 'train_flag'
    end
  end
  object dt_alt: TADODataSet
    Connection = cn_change
    CursorType = ctStatic
    CommandText = 
      'select pdet.train_flag,employeecode,chinesename,Train_NO,Train_t' +
      'opics,[status],datadetail.item rankname,[rank],'#13#10'(case sex when ' +
      '0 then '#39#22899#39' when 1 then '#39#30007#39' else '#39#20854#23427#39'  end) as sexy ,'#13#10'ondutytime' +
      ',outdutytime,province,IDCard,departmentid,pdet.item as pposition' +
      ','#13#10'mdet.item as employ_type,dept.departmentname,position,starLev' +
      'el,Data0005.EMPLOYEE_NAME,'#13#10'employee_alteration.* '#13#10'from employe' +
      'e_alteration '#13#10'left join Employee_Train Tra on employee_alterati' +
      'on.employee_train_ptr=Tra.rkey'#13#10'left join employeemsg AS msg ON ' +
      'msg.rkey = employee_alteration.employeeid '#13#10'left join datadepart' +
      'ment dept on dept.rkey=msg.departmentid'#13#10' left join datadetail p' +
      'det on pdet.rkey=msg.position'#13#10' left join datadetail mdet on mde' +
      't.rkey=msg.employ_type'#13#10' left join datadetail on datadetail.rkey' +
      '=msg.[Rank]'#13#10' left join Data0005 ON Data0005.RKEY = oper_person ' +
      #13#10'where 1=2'
    Parameters = <>
    Left = 432
    Top = 24
    object dt_altemployeecode: TWideStringField
      FieldName = 'employeecode'
      ProviderFlags = []
    end
    object dt_altchinesename: TWideStringField
      FieldName = 'chinesename'
      ProviderFlags = []
    end
    object dt_altTrain_NO: TStringField
      FieldName = 'Train_NO'
      ProviderFlags = []
      Size = 50
    end
    object dt_altTrain_topics: TWideStringField
      FieldName = 'Train_topics'
      ProviderFlags = []
      Size = 50
    end
    object dt_altstatus: TWordField
      FieldName = 'status'
      ProviderFlags = []
    end
    object dt_altrankname: TWideStringField
      FieldName = 'rankname'
      ProviderFlags = []
    end
    object dt_altrank: TIntegerField
      FieldName = 'rank'
      ProviderFlags = []
    end
    object dt_altsexy: TStringField
      FieldName = 'sexy'
      ProviderFlags = []
      ReadOnly = True
      Size = 4
    end
    object dt_altondutytime: TDateTimeField
      FieldName = 'ondutytime'
      ProviderFlags = []
    end
    object dt_altoutdutytime: TDateTimeField
      FieldName = 'outdutytime'
      ProviderFlags = []
    end
    object dt_altprovince: TWideStringField
      FieldName = 'province'
      ProviderFlags = []
    end
    object dt_altIDCard: TWideStringField
      FieldName = 'IDCard'
      ProviderFlags = []
    end
    object dt_altdepartmentid: TIntegerField
      FieldName = 'departmentid'
      ProviderFlags = []
    end
    object dt_altpposition: TWideStringField
      FieldName = 'pposition'
      ProviderFlags = []
    end
    object dt_altemploy_type: TWideStringField
      FieldName = 'employ_type'
      ProviderFlags = []
    end
    object dt_altdepartmentname: TWideStringField
      FieldName = 'departmentname'
      ProviderFlags = []
    end
    object dt_altposition: TIntegerField
      FieldName = 'position'
      ProviderFlags = []
    end
    object dt_altstarLevel: TIntegerField
      FieldName = 'starLevel'
      ProviderFlags = []
    end
    object dt_altEMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      ProviderFlags = []
      Size = 16
    end
    object dt_altrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dt_altemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object dt_alttype: TIntegerField
      FieldName = 'type'
    end
    object dt_altreason: TIntegerField
      FieldName = 'reason'
    end
    object dt_altalterdate: TDateTimeField
      FieldName = 'alterdate'
    end
    object dt_altorginal_employeecode: TWideStringField
      FieldName = 'orginal_employeecode'
    end
    object dt_altorginal_departmentid: TIntegerField
      FieldName = 'orginal_departmentid'
    end
    object dt_altorginal_position: TIntegerField
      FieldName = 'orginal_position'
    end
    object dt_altorginal_employ_type: TIntegerField
      FieldName = 'orginal_employ_type'
    end
    object dt_altorginal_politics_face: TIntegerField
      FieldName = 'orginal_politics_face'
    end
    object dt_altorginal_education: TIntegerField
      FieldName = 'orginal_education'
    end
    object dt_altorginal_marriage: TIntegerField
      FieldName = 'orginal_marriage'
    end
    object dt_altorginal_rank: TIntegerField
      FieldName = 'orginal_rank'
    end
    object dt_altorginal_accountid: TIntegerField
      FieldName = 'orginal_accountid'
    end
    object dt_altnew_employeecode: TWideStringField
      FieldName = 'new_employeecode'
    end
    object dt_altnew_departmentid: TIntegerField
      FieldName = 'new_departmentid'
    end
    object dt_altnew_position: TIntegerField
      FieldName = 'new_position'
    end
    object dt_altnew_employ_type: TIntegerField
      FieldName = 'new_employ_type'
    end
    object dt_altnew_politics_face: TIntegerField
      FieldName = 'new_politics_face'
    end
    object dt_altnew_education: TIntegerField
      FieldName = 'new_education'
    end
    object dt_altnew_marriage: TIntegerField
      FieldName = 'new_marriage'
    end
    object dt_altnew_rank: TIntegerField
      FieldName = 'new_rank'
    end
    object dt_altnew_accountid: TIntegerField
      FieldName = 'new_accountid'
    end
    object dt_altoper_person: TIntegerField
      FieldName = 'oper_person'
    end
    object dt_altoper_date: TDateTimeField
      FieldName = 'oper_date'
    end
    object dt_altactive: TIntegerField
      FieldName = 'active'
    end
    object dt_altremark: TWideStringField
      FieldName = 'remark'
      Size = 80
    end
    object dt_altorginal_ondutytime: TWideStringField
      FieldName = 'orginal_ondutytime'
    end
    object dt_altorginal_outdutytime: TWideStringField
      FieldName = 'orginal_outdutytime'
    end
    object dt_altemployee_train_ptr: TIntegerField
      FieldName = 'employee_train_ptr'
    end
    object dt_altemployee_train_flag: TBooleanField
      FieldName = 'employee_train_flag'
      ProviderFlags = []
      Required = True
    end
    object dt_altorginal_star: TIntegerField
      FieldName = 'orginal_star'
    end
    object dt_altnew_star: TIntegerField
      FieldName = 'new_star'
    end
    object dt_alttrain_flag: TBooleanField
      FieldName = 'train_flag'
      ProviderFlags = []
    end
  end
  object ds_alt: TDataSource
    DataSet = cds_alt
    Left = 432
    Top = 192
  end
  object cdsTemp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 432
    Top = 248
  end
  object dt_temp: TADODataSet
    Connection = cn_change
    Parameters = <>
    Left = 160
    Top = 192
  end
  object qry_dept: TADOQuery
    Connection = cn_change
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from datadepartment')
    Left = 256
    Top = 24
  end
end
