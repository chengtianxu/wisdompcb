object DM: TDM
  OldCreateOrder = False
  Left = 501
  Top = 249
  Height = 455
  Width = 507
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 224
    Top = 24
  end
  object adoMain: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.v_employeemsg.chinesename, dbo.v_employeemsg.empl' +
      'oyeecode, dbo.v_employeemsg.departmentname, dbo.v_employeemsg.on' +
      'dutytime, '#13#10'                      dbo.v_employeemsg.position, db' +
      'o.datadetail.item as contracttype, dbo.employee_contract.code, d' +
      'bo.employee_contract.startdate, '#13#10'                      dbo.empl' +
      'oyee_contract.probationdate, dbo.employee_contract.enddate, dbo.' +
      'employee_contract.type, dbo.employee_contract.status, '#13#10'        ' +
      '              case dbo.employee_contract.status when 1 then '#39#26377#25928#39 +
      ' when 2 then '#39#26080#25928#39' end as statusname,'#13#10'                      dbo.' +
      'employee_contract.remark, dbo.employee_contract.opration_person,' +
      ' dbo.employee_contract.inputdate, dbo.Data0005.EMPLOYEE_NAME, '#13#10 +
      '                      dbo.employee_contract.rkey, datadetail_1.i' +
      'tem AS PositionName,cast(datediff(day,v_employeemsg.birthday,get' +
      'date())/365.25 as decimal(4,2)) as age,'#13#10'                      c' +
      'ast(datediff(month,dbo.v_employeemsg.ondutytime,getdate())/12.0 ' +
      'as numeric(4,1)) as workage,v_employeemsg.birthday,v_employeemsg' +
      '.sex'#13#10'                      ,case when v_employeemsg.sex = 1  th' +
      'en '#39#30007#39' else '#39#22899#39' end as strsex'#13#10'FROM         dbo.employee_contrac' +
      't INNER JOIN'#13#10'                      dbo.Data0005 ON dbo.employee' +
      '_contract.opration_person = dbo.Data0005.RKEY INNER JOIN'#13#10'      ' +
      '                dbo.datadetail ON dbo.employee_contract.type = d' +
      'bo.datadetail.rkey INNER JOIN'#13#10'                      dbo.v_emplo' +
      'yeemsg ON dbo.employee_contract.employeeid = dbo.v_employeemsg.r' +
      'key LEFT JOIN'#13#10'                      dbo.datadetail AS datadetai' +
      'l_1 ON dbo.v_employeemsg.position = datadetail_1.rkey INNER JOIN' +
      #13#10#9'      (select distinct departmentid from hr_permission where ' +
      'program_ptr = (select rkey from data0419 where programe = '#39'Contr' +
      'actOfEmployee.exe'#39' )'#13#10#9'     and  operator_ptr=:user ) as depart ' +
      'on v_employeemsg.departmentid=depart.departmentid'#13#10#13#10'where 1=1'#13#10
    Parameters = <
      item
        Name = 'user'
        DataType = ftString
        Size = 2
        Value = Null
      end>
    Left = 32
    Top = 120
    object adoMainchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
      ReadOnly = True
    end
    object adoMainemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
      ReadOnly = True
    end
    object adoMaindepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
      ReadOnly = True
    end
    object adoMainondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
      ReadOnly = True
    end
    object adoMainposition: TIntegerField
      FieldName = 'position'
      ReadOnly = True
    end
    object adoMainPositionName: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'PositionName'
      ReadOnly = True
    end
    object adoMaincode: TWideStringField
      DisplayLabel = #21512#21516#32534#21495
      FieldName = 'code'
      ReadOnly = True
    end
    object adoMainstartdate: TDateTimeField
      DisplayLabel = #21512#21516#24320#22987#26085#26399
      FieldName = 'startdate'
      ReadOnly = True
    end
    object adoMainprobationdate: TDateTimeField
      DisplayLabel = #35797#29992#26399#28385#26085#26399
      FieldName = 'probationdate'
      ReadOnly = True
    end
    object adoMainenddate: TDateTimeField
      DisplayLabel = #21512#21516#32467#26463#26085#26399
      FieldName = 'enddate'
      ReadOnly = True
    end
    object adoMaincontracttype: TWideStringField
      DisplayLabel = #21512#21516#31867#22411
      FieldName = 'contracttype'
      ReadOnly = True
    end
    object adoMaintype: TIntegerField
      FieldName = 'type'
      ReadOnly = True
    end
    object adoMainstatus: TIntegerField
      FieldName = 'status'
      ReadOnly = True
    end
    object adoMainremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      ReadOnly = True
      Size = 300
    end
    object adoMainopration_person: TIntegerField
      FieldName = 'opration_person'
      ReadOnly = True
    end
    object adoMaininputdate: TDateTimeField
      DisplayLabel = #25805#20316#26085#26399
      FieldName = 'inputdate'
      ReadOnly = True
    end
    object adoMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #36755#20837#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object adoMainrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoMainstatusname: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'statusname'
      ReadOnly = True
      Size = 4
    end
    object adoMainage: TFloatField
      DisplayLabel = #24180#40836
      FieldName = 'age'
      ReadOnly = True
    end
    object adoMainworkage: TBCDField
      DisplayLabel = #24037#40836
      FieldName = 'workage'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 4
      Size = 1
    end
    object adoMainbirthday: TDateTimeField
      FieldName = 'birthday'
    end
    object adoMainsex: TIntegerField
      FieldName = 'sex'
    end
    object adoMainstrsex: TStringField
      DisplayLabel = #24615#21035
      FieldName = 'strsex'
      ReadOnly = True
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = adoMain
    Left = 32
    Top = 192
  end
  object adoTime: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 168
    Top = 320
  end
  object adoWill: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.v_employeemsg.chinesename, dbo.v_employeemsg.empl' +
      'oyeecode, dbo.v_employeemsg.departmentname,datadetail.memo, '#13#10'  ' +
      '                       cast(datediff(month,dbo.v_employeemsg.ond' +
      'utytime,getdate())/12.0 as numeric(4,1)) as workage,'#13#10#9#9#9#9#9'   db' +
      'o.employee_contract.code,dbo.employee_contract.enddate, dbo.empl' +
      'oyee_contract.type, '#13#10'                      dbo.datadetail.item ' +
      'as contracttype,dbo.employee_contract.rkey ,datadetail_1.item as' +
      ' position,dbo.employee_contract.startdate'#13#10'FROM         dbo.empl' +
      'oyee_contract inner JOIN'#13#10'                      dbo.v_employeems' +
      'g ON dbo.employee_contract.employeeid = dbo.v_employeemsg.rkey l' +
      'eft JOIN'#13#10'                      dbo.datadetail ON dbo.employee_c' +
      'ontract.type = dbo.datadetail.rkey left JOIN'#13#10#9#9#9#9#9'  dbo.datadet' +
      'ail as datadetail_1 ON v_employeemsg.position = datadetail_1.rke' +
      'y INNER JOIN'#13#10#9#9#9#9#9' (select distinct departmentid from hr_permis' +
      'sion where program_ptr = ('#13#10#9#9#9#9#9#9#9#9#9'select rkey from data0419 w' +
      'here programe = '#39'ContractOfEmployee.exe'#39' )'#13#10#9#9#9#9#9#9#9#9#9'and  operat' +
      'or_ptr= :willuser ) as b on v_employeemsg.departmentid=b.departm' +
      'entid'#13#10'where dbo.employee_contract.enddate between getdate() and' +
      ' dateadd(month,3,getdate())'#13#10'and (v_employeemsg.status=1 or v_em' +
      'ployeemsg.status=0)'#13#10'and employee_contract.status=1'#13#10'and datadet' +
      'ail.item like '#39'%'#27491#24335'%'#39#13#10'and datadetail_1.item not like '#39'%'#32463#29702'%'#39#13#10'and' +
      ' datadetail_1.item not like '#39'%'#24635'%'#39#13#10
    Parameters = <
      item
        Name = 'willuser'
        DataType = ftString
        Size = 2
        Value = Null
      end>
    Left = 112
    Top = 120
    object adoWillchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoWillemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoWilldepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoWillposition: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position'
      Size = 32
    end
    object adoWillmemo: TWideStringField
      FieldName = 'memo'
      Size = 200
    end
    object adoWillenddate: TDateTimeField
      DisplayLabel = #21512#21516#32467#26463#26085#26399
      FieldName = 'enddate'
    end
    object adoWillcode: TWideStringField
      DisplayLabel = #21512#21516#32534#21495
      FieldName = 'code'
    end
    object adoWillcontracttype: TWideStringField
      DisplayLabel = #21512#21516#31867#22411
      FieldName = 'contracttype'
    end
    object adoWillrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoWillstartdate: TDateTimeField
      DisplayLabel = #21512#21516#24320#22987#26085#26399
      FieldName = 'startdate'
    end
    object adoWillworkage: TBCDField
      DisplayLabel = #24037#40836
      FieldName = 'workage'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 4
      Size = 1
    end
    object adoWilltype: TIntegerField
      FieldName = 'type'
    end
  end
  object adoNot: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'SELECT departmentname,employeecode,v_employeemsg.departmentid,ch' +
      'inesename,ondutytime,position_item,isnull(datadetail.item,'#39#26080#39') a' +
      's employee_typeitem'#13#10'FROM  v_employeemsg left join '#13#10#9#9#9#9#9#9'datad' +
      'etail on v_employeemsg.employ_type=datadetail.rkey  INNER JOIN'#13#10 +
      #9#9#9#9#9' (select distinct departmentid from hr_permission where pro' +
      'gram_ptr = ('#13#10#9#9#9#9#9#9#9#9#9'select rkey from data0419 where programe ' +
      '= '#39'ContractOfEmployee.exe'#39' )'#13#10#9#9#9#9#9#9#9#9#9'and  operator_ptr= :notus' +
      'er) as b on v_employeemsg.departmentid=b.departmentid'#13#10'where (v_' +
      'employeemsg.status=1 or v_employeemsg.status=0)'#13#10'and v_employeem' +
      'sg.rkey not in (select employeeid from dbo.employee_contract whe' +
      're status=1 and getdate() between dateadd(day,-2,startdate) and ' +
      'enddate  )'#13#10'and datadetail.item like '#39'%'#27491#24335'%'#39
    Parameters = <
      item
        Name = 'notuser'
        DataType = ftString
        Size = 2
        Value = Null
      end>
    Left = 192
    Top = 120
    object adoNotdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoNotemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoNotdepartmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object adoNotchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoNotondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object adoNotposition_item: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position_item'
      ReadOnly = True
    end
    object adoNotemployee_typeitem: TWideStringField
      DisplayLabel = #21512#21516#31867#22411
      FieldName = 'employee_typeitem'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = adoWill
    Left = 120
    Top = 192
  end
  object DataSource3: TDataSource
    DataSet = adoNot
    Left = 200
    Top = 192
  end
  object DataSource4: TDataSource
    DataSet = adoOut
    Left = 280
    Top = 192
  end
  object adoOut: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.v_employeemsg.chinesename, dbo.v_employeemsg.empl' +
      'oyeecode, dbo.v_employeemsg.departmentname,datadetail.memo, '#13#10#9#9 +
      #9#9#9'   dbo.employee_contract.code,dbo.employee_contract.enddate, ' +
      '--dbo.employee_contract.type, '#13#10'                      dbo.datade' +
      'tail.item as contracttype,dbo.employee_contract.rkey ,v_employee' +
      'msg.position_item,'#13#10'                     cast(datediff(month, db' +
      'o.v_employeemsg.ondutytime,getdate())/12.0 as numeric(4,1)) as w' +
      'orkage'#13#10'FROM         dbo.employee_contract inner JOIN'#13#10'         ' +
      '             dbo.v_employeemsg ON dbo.employee_contract.employee' +
      'id = dbo.v_employeemsg.rkey left JOIN'#13#10'                      dbo' +
      '.datadetail ON dbo.employee_contract.type = dbo.datadetail.rkey ' +
      'INNER JOIN'#13#10#9#9#9#9#9' (select distinct departmentid from hr_permissi' +
      'on where program_ptr = ('#13#10#9#9#9#9#9#9#9#9#9'select rkey from data0419 whe' +
      're programe = '#39'ContractOfEmployee.exe'#39' )'#13#10#9#9#9#9#9#9#9#9#9'and  operator' +
      '_ptr= :outuser) as b on v_employeemsg.departmentid=b.departmenti' +
      'd'#13#10'where enddate<getdate()'#13#10'and dbo.employee_contract.status=1'#13#10 +
      'and datadetail.item like '#39'%'#27491#24335'%'#39
    Parameters = <
      item
        Name = 'outuser'
        DataType = ftString
        Size = 2
        Value = Null
      end>
    Left = 272
    Top = 120
    object adoOutchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoOutemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoOutdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoOutmemo: TWideStringField
      FieldName = 'memo'
      Size = 200
    end
    object adoOutcode: TWideStringField
      DisplayLabel = #21512#21516#32534#21495
      FieldName = 'code'
    end
    object adoOutenddate: TDateTimeField
      DisplayLabel = #21512#21516#32467#26463#26085#26399
      FieldName = 'enddate'
    end
    object adoOutcontracttype: TWideStringField
      DisplayLabel = #21512#21516#31867#22411
      FieldName = 'contracttype'
    end
    object adoOutrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoOutposition_item: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position_item'
      ReadOnly = True
      Size = 50
    end
    object adoOutworkage: TBCDField
      DisplayLabel = #24037#40836
      FieldName = 'workage'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 4
      Size = 1
    end
  end
  object adoTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 280
    Top = 320
  end
  object adoManager: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.v_employeemsg.chinesename, dbo.v_employeemsg.empl' +
      'oyeecode, dbo.v_employeemsg.departmentname,'#13#10'                   ' +
      '   dbo.v_employeemsg.position, dbo.datadetail.item as contractty' +
      'pe, dbo.employee_contract.code, dbo.employee_contract.startdate,' +
      ' '#13#10'                      dbo.employee_contract.probationdate, db' +
      'o.employee_contract.enddate, dbo.employee_contract.type, dbo.emp' +
      'loyee_contract.status, '#13#10'                      case dbo.employee' +
      '_contract.status when 1 then '#39#26377#25928#39' when 2 then '#39#26080#25928#39' end as status' +
      'name,dbo.v_employeemsg.ondutytime,'#13#10'                      cast(d' +
      'atediff(month,dbo.v_employeemsg.ondutytime,getdate())/12.0 as nu' +
      'meric(4,1)) as workage,'#13#10'                      dbo.employee_cont' +
      'ract.remark,dbo.employee_contract.rkey, datadetail_1.item AS Pos' +
      'itionName'#13#10'FROM         dbo.employee_contract INNER JOIN'#13#10'      ' +
      '                dbo.Data0005 ON dbo.employee_contract.opration_p' +
      'erson = dbo.Data0005.RKEY INNER JOIN'#13#10'                      dbo.' +
      'datadetail ON dbo.employee_contract.type = dbo.datadetail.rkey I' +
      'NNER JOIN'#13#10'                      dbo.v_employeemsg ON dbo.employ' +
      'ee_contract.employeeid = dbo.v_employeemsg.rkey LEFT JOIN'#13#10'     ' +
      '                 dbo.datadetail AS datadetail_1 ON dbo.v_employe' +
      'emsg.position = datadetail_1.rkey INNER JOIN'#13#10#9#9#9#9#9'  (select dis' +
      'tinct departmentid from hr_permission where program_ptr = (selec' +
      't rkey from data0419 where programe = '#39'ContractOfEmployee.exe'#39' )' +
      #13#10#9#9#9#9#9' and  operator_ptr= :userManager ) as depart on v_employe' +
      'emsg.departmentid=depart.departmentid'#13#10#13#10'where enddate between g' +
      'etdate() and dateadd(month,6,getdate())'#13#10'and  (v_employeemsg.sta' +
      'tus=1 or v_employeemsg.status=0)'#13#10'and employee_contract.status=1' +
      #13#10'and datadetail_1.item like '#39'%'#32463#29702'%'#39#13#10'and datadetail_1.item not l' +
      'ike '#39'%'#24635'%'#39#13#10'and datadetail.item like '#39'%'#27491#24335'%'#39
    Parameters = <
      item
        Name = 'userManager'
        DataType = ftString
        Size = 4
        Value = Null
      end>
    Left = 352
    Top = 120
    object adoManagerchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoManageremployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoManagerdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoManagerposition: TIntegerField
      FieldName = 'position'
      ReadOnly = True
    end
    object adoManagercontracttype: TWideStringField
      DisplayLabel = #21512#21516#31867#22411
      FieldName = 'contracttype'
    end
    object adoManagercode: TWideStringField
      DisplayLabel = #21512#21516#32534#21495
      FieldName = 'code'
    end
    object adoManagerstartdate: TDateTimeField
      DisplayLabel = #21512#21516#24320#22987#26085#26399
      FieldName = 'startdate'
      DisplayFormat = 'YYYY-MM-DD'
    end
    object adoManagerprobationdate: TDateTimeField
      DisplayLabel = #35797#29992#26399
      FieldName = 'probationdate'
      DisplayFormat = 'YYYY-MM-DD'
    end
    object adoManagerenddate: TDateTimeField
      DisplayLabel = #21512#21516#32467#26463#26085#26399
      FieldName = 'enddate'
      DisplayFormat = 'YYYY-MM-DD'
    end
    object adoManagertype: TIntegerField
      FieldName = 'type'
    end
    object adoManagerstatus: TIntegerField
      FieldName = 'status'
    end
    object adoManagerstatusname: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'statusname'
      ReadOnly = True
      Size = 4
    end
    object adoManagerremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 300
    end
    object adoManagerrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoManagerPositionName: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'PositionName'
    end
    object adoManagerondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object adoManagerworkage: TBCDField
      DisplayLabel = #24037#40836
      FieldName = 'workage'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 4
      Size = 1
    end
  end
  object adoTopManager: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.v_employeemsg.chinesename, dbo.v_employeemsg.empl' +
      'oyeecode, dbo.v_employeemsg.departmentname,'#13#10'                   ' +
      '   dbo.v_employeemsg.position, dbo.datadetail.item as contractty' +
      'pe, dbo.employee_contract.code, dbo.employee_contract.startdate,' +
      ' '#13#10'                      dbo.employee_contract.probationdate, db' +
      'o.employee_contract.enddate, dbo.employee_contract.type, dbo.emp' +
      'loyee_contract.status, '#13#10'                      case dbo.employee' +
      '_contract.status when 1 then '#39#26377#25928#39' when 2 then '#39#26080#25928#39' end as status' +
      'name,dbo.v_employeemsg.ondutytime,'#13#10'                      cast(d' +
      'atediff(month,dbo.v_employeemsg.ondutytime,getdate())/12.0 as nu' +
      'meric(4,1)) as workage,'#13#10'                      dbo.employee_cont' +
      'ract.remark,dbo.employee_contract.rkey, datadetail_1.item AS Pos' +
      'itionName'#13#10'FROM         dbo.employee_contract INNER JOIN'#13#10'      ' +
      '                dbo.Data0005 ON dbo.employee_contract.opration_p' +
      'erson = dbo.Data0005.RKEY INNER JOIN'#13#10'                      dbo.' +
      'datadetail ON dbo.employee_contract.type = dbo.datadetail.rkey I' +
      'NNER JOIN'#13#10'                      dbo.v_employeemsg ON dbo.employ' +
      'ee_contract.employeeid = dbo.v_employeemsg.rkey LEFT JOIN'#13#10'     ' +
      '                 dbo.datadetail AS datadetail_1 ON dbo.v_employe' +
      'emsg.position = datadetail_1.rkey INNER JOIN'#13#10#9#9#9#9#9'  (select dis' +
      'tinct departmentid from hr_permission where program_ptr = (selec' +
      't rkey from data0419 where programe = '#39'ContractOfEmployee.exe'#39' )' +
      #13#10#9#9#9#9#9' and  operator_ptr= :userTopManager ) as depart on v_empl' +
      'oyeemsg.departmentid=depart.departmentid'#13#10#13#10'where enddate betwee' +
      'n getdate() and dateadd(year,1,getdate())'#13#10'and  (v_employeemsg.s' +
      'tatus=1 or v_employeemsg.status=0)'#13#10'and employee_contract.status' +
      '=1'#13#10'and datadetail_1.item like '#39'%'#24635'%'#39#13#10'and datadetail.item like '#39 +
      '%'#27491#24335'%'#39
    Parameters = <
      item
        Name = 'userTopManager'
        DataType = ftString
        Size = 4
        Value = Null
      end>
    Left = 424
    Top = 120
    object adoTopManagerchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoTopManageremployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoTopManagerdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoTopManagerposition: TIntegerField
      FieldName = 'position'
      ReadOnly = True
    end
    object adoTopManagercontracttype: TWideStringField
      DisplayLabel = #21512#21516#31867#22411
      FieldName = 'contracttype'
    end
    object adoTopManagercode: TWideStringField
      DisplayLabel = #21512#21516#32534#21495
      FieldName = 'code'
    end
    object adoTopManagerstartdate: TDateTimeField
      DisplayLabel = #21512#21516#24320#22987#26085#26399
      FieldName = 'startdate'
      DisplayFormat = 'YYYY-MM-DD'
    end
    object adoTopManagerprobationdate: TDateTimeField
      DisplayLabel = #35797#29992#26399
      FieldName = 'probationdate'
      DisplayFormat = 'YYYY-MM-DD'
    end
    object adoTopManagerenddate: TDateTimeField
      DisplayLabel = #21512#21516#32467#26463#26085#26399
      FieldName = 'enddate'
      DisplayFormat = 'YYYY-MM-DD'
    end
    object adoTopManagertype: TIntegerField
      FieldName = 'type'
    end
    object adoTopManagerstatus: TIntegerField
      FieldName = 'status'
    end
    object adoTopManagerstatusname: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'statusname'
      ReadOnly = True
      Size = 4
    end
    object adoTopManagerremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 300
    end
    object adoTopManagerrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoTopManagerPositionName: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'PositionName'
    end
    object adoTopManagerondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object adoTopManagerworkage: TBCDField
      DisplayLabel = #24037#40836
      FieldName = 'workage'
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 4
      Size = 1
    end
  end
  object DataSource5: TDataSource
    DataSet = adoManager
    Left = 352
    Top = 192
  end
  object DataSource6: TDataSource
    DataSet = adoTopManager
    Left = 424
    Top = 192
  end
  object DataSource7: TDataSource
    DataSet = adoOver
    Left = 32
    Top = 336
  end
  object adoOver: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      #13#10'SELECT     dbo.v_employeemsg.chinesename, dbo.v_employeemsg.em' +
      'ployeecode, dbo.v_employeemsg.departmentname,dbo.employee_contra' +
      'ct.rkey,v_employeemsg.birthday'#13#10#9#9#9#9#9#9',cast(datediff(day,v_emplo' +
      'yeemsg.birthday,getdate())/365.25 as decimal(4,2)) as age,'#13#10'    ' +
      '                  cast(datediff(month,dbo.v_employeemsg.ondutyti' +
      'me,getdate())/12.0 as numeric(4,1)) as workage'#13#10'FROM         dbo' +
      '.employee_contract INNER JOIN'#13#10'                      dbo.Data000' +
      '5 ON dbo.employee_contract.opration_person = dbo.Data0005.RKEY I' +
      'NNER JOIN'#13#10'                      dbo.datadetail ON dbo.employee_' +
      'contract.type = dbo.datadetail.rkey INNER JOIN'#13#10'                ' +
      '      dbo.v_employeemsg ON dbo.employee_contract.employeeid = db' +
      'o.v_employeemsg.rkey LEFT JOIN'#13#10'                      dbo.datade' +
      'tail AS datadetail_1 ON dbo.v_employeemsg.position = datadetail_' +
      '1.rkey INNER JOIN'#13#10#9'      (select distinct departmentid from hr_' +
      'permission where program_ptr = (select rkey from data0419 where ' +
      'programe = '#39'ContractOfEmployee.exe'#39' )'#13#10#9'     and  operator_ptr= ' +
      ':overuser) as depart on v_employeemsg.departmentid=depart.depart' +
      'mentid'#13#10'where 1=1 and employee_contract.status=1 AND datediff(da' +
      'y,getdate(),dateadd(year,case v_employeemsg.sex when 1 then 60 e' +
      'lse 50 end,v_employeemsg.birthday))<=60'
    Parameters = <
      item
        Name = 'overuser'
        DataType = ftString
        Size = 4
        Value = '3022'
      end>
    Left = 32
    Top = 280
    object adoOverchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoOveremployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoOverdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoOverrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoOverbirthday: TDateTimeField
      FieldName = 'birthday'
    end
    object adoOverage: TBCDField
      DisplayLabel = #24180#40836
      FieldName = 'age'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object adoOverworkage: TBCDField
      FieldName = 'workage'
      ReadOnly = True
      Precision = 4
      Size = 1
    end
  end
end
