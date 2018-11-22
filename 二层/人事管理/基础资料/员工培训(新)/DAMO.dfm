object DM: TDM
  OldCreateOrder = False
  Left = 454
  Top = 267
  Height = 381
  Width = 421
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 177
    Top = 5
  end
  object adoMain: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Employee_Train.rkey, dbo.Employee_Train.employeei' +
      'd, dbo.v_employeemsg.employeecode, dbo.v_employeemsg.chinesename' +
      ', '#13#10'                      dbo.v_employeemsg.departmentname, dbo.' +
      'Employee_Train.Train_NO, dbo.Employee_Train.Train_topics, dbo.Em' +
      'ployee_Train.startdate, '#13#10'                      dbo.Employee_Tra' +
      'in.starttime, dbo.Employee_Train.enddate, dbo.Employee_Train.end' +
      'time, dbo.Employee_Train.Train_time, '#13#10'                      dbo' +
      '.Employee_Train.Teacher, dbo.Employee_Train.Train_place, dbo.Emp' +
      'loyee_Train.Train_grade, dbo.Employee_Train.Train_result, '#13#10'    ' +
      '                  dbo.Employee_Train.Train_content, dbo.Employee' +
      '_Train.Train_status ,v_employeemsg.ondutytime,'#13#10#9#9#9#9#9'  case dbo.' +
      'Employee_Train.Train_status when 0 then '#39#26410#23436#25104#39' when 1 then '#39#23436#25104#39' e' +
      'nd as status, dbo.Employee_Train.type_ptr, dbo.datadetail.item, ' +
      #13#10'                      case  when dbo.Employee_Train.ptr_flag=0' +
      ' then '#39#26410#29992#39' when dbo.Employee_Train.ptr_flag=1 then '#39#24341#29992#39' end as f' +
      'lag, dbo.Employee_Train.ptr_flag,'#13#10#9#9#9#9#9'  dbo.Employee_Train.tra' +
      'in_feels, dbo.Employee_Train.effective_date, dbo.Employee_Train.' +
      'feels_payed, '#13#10'                      case dbo.Employee_Train.fee' +
      'ls_payed when 0 then '#39#26410#32467#28165#39' when 1 then '#39#24050#32467#28165#39' end as payed,actual' +
      'ly_feels,'#13#10'                      dbo.Employee_Train.oprator_ptr,' +
      ' data0005.employee_name,dbo.Employee_Train.oprate_time,hr_KeyPos' +
      'ition.positionname'#13#10'FROM         dbo.Employee_Train INNER JOIN'#13#10 +
      '                      dbo.v_employeemsg ON dbo.Employee_Train.em' +
      'ployeeid = dbo.v_employeemsg.rkey INNER JOIN'#13#10'                  ' +
      '    dbo.datadetail ON dbo.Employee_Train.type_ptr = dbo.datadeta' +
      'il.rkey LEFT OUTER JOIN'#13#10'                      dbo.Data0005 ON d' +
      'bo.Employee_Train.oprator_ptr = dbo.Data0005.RKEY LEFT JOIN'#13#10'   ' +
      '                   hr_KeyPosition ON dbo.Employee_Train.KeyPosit' +
      'ionId = hr_KeyPosition.rkey'#13#10#13#10'where startdate between :dtpk1 an' +
      'd :dtpk2 '#13#10#13#10
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 40
    Top = 72
    object adoMainrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoMainemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object adoMainemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoMainchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoMaindepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoMainTrain_NO: TStringField
      DisplayLabel = #22521#35757#32534#21495
      FieldName = 'Train_NO'
      Size = 50
    end
    object adoMainTrain_topics: TWideStringField
      DisplayLabel = #22521#35757#20027#39064
      FieldName = 'Train_topics'
      Size = 50
    end
    object adoMainstartdate: TDateTimeField
      DisplayLabel = #24320#22987#26085#26399
      FieldName = 'startdate'
    end
    object adoMainstarttime: TStringField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'starttime'
    end
    object adoMainenddate: TDateTimeField
      DisplayLabel = #32467#26463#26085#26399
      FieldName = 'enddate'
    end
    object adoMainendtime: TStringField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'endtime'
    end
    object adoMainTrain_time: TFloatField
      DisplayLabel = #22521#35757#26102#38271
      FieldName = 'Train_time'
    end
    object adoMainTeacher: TWideStringField
      DisplayLabel = #22521#35757#35762#24072
      FieldName = 'Teacher'
      Size = 50
    end
    object adoMainTrain_place: TWideStringField
      DisplayLabel = #22521#35757#22320#28857
      FieldName = 'Train_place'
    end
    object adoMainTrain_grade: TWideStringField
      DisplayLabel = #22521#35757#25104#32489
      FieldName = 'Train_grade'
    end
    object adoMainTrain_result: TWideStringField
      DisplayLabel = #22521#35757#32467#26524
      FieldName = 'Train_result'
    end
    object adoMainTrain_status: TIntegerField
      DisplayLabel = #22521#35757#23436#25104
      FieldName = 'Train_status'
    end
    object adoMaintype_ptr: TIntegerField
      FieldName = 'type_ptr'
    end
    object adoMainitem: TWideStringField
      DisplayLabel = #22521#35757#31867#22411
      FieldName = 'item'
    end
    object adoMainptr_flag: TBooleanField
      DisplayLabel = #26159#21542#34987#24341#29992
      FieldName = 'ptr_flag'
    end
    object adoMaintrain_feels: TBCDField
      DisplayLabel = #22521#35757#36153#29992
      FieldName = 'train_feels'
      Precision = 19
    end
    object adoMaineffective_date: TDateTimeField
      DisplayLabel = #36153#29992#26377#25928#26399
      FieldName = 'effective_date'
    end
    object adoMainfeels_payed: TBooleanField
      DisplayLabel = #36153#29992#26159#21542#32467#28165
      FieldName = 'feels_payed'
    end
    object adoMainoprator_ptr: TIntegerField
      FieldName = 'oprator_ptr'
    end
    object adoMainemployee_name: TStringField
      DisplayLabel = #25805#20316#20154
      FieldName = 'employee_name'
      Size = 16
    end
    object adoMainoprate_time: TDateTimeField
      DisplayLabel = #25805#20316#26102#38388
      FieldName = 'oprate_time'
    end
    object adoMainTrain_content: TWideStringField
      DisplayLabel = #22521#35757#20869#23481
      FieldName = 'Train_content'
      Size = 200
    end
    object adoMainstatus: TStringField
      DisplayLabel = #22521#35757#29366#24577
      FieldName = 'status'
      ReadOnly = True
      Size = 6
    end
    object adoMainflag: TStringField
      DisplayLabel = #26159#21542#34987#24341#29992
      FieldName = 'flag'
      ReadOnly = True
      Size = 4
    end
    object adoMainpayed: TStringField
      DisplayLabel = #26159#21542#32467#26696
      FieldName = 'payed'
      ReadOnly = True
      Size = 6
    end
    object adoMainondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object adoMainactually_feels: TBCDField
      DisplayLabel = #23454#38469#25187#36153
      FieldName = 'actually_feels'
      Precision = 19
    end
    object adoMainpositionname: TWideStringField
      DisplayLabel = #20851#38190#23703#20301
      FieldName = 'positionname'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = adoMain
    Left = 96
    Top = 72
  end
  object adoTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 144
    Top = 280
  end
  object adoTime: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 200
    Top = 280
  end
  object adoLoadData: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'declare @Isselect bit,@devip varchar(20),@devid varchar(10)'#13#10'dec' +
      'lare @devtime datetime, @connctstatus varchar(20),@note varchar(' +
      '40)'#13#10'set @Isselect = 0'#13#10'select @isselect as selected,dev_ip as d' +
      'evip, devid , '#13#10'@devtime as devtime, @connctstatus as connctstat' +
      'us, @note as note'#13#10'fROM dev_detail WHERE devaddr = '#39'local'#39' and p' +
      'urpose like '#39'%train%'#39
    Parameters = <>
    Left = 43
    Top = 141
    object adoLoadDataselected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
    end
    object adoLoadDatadevip: TWideStringField
      DisplayLabel = #26426#22120#22320#22336
      FieldName = 'devip'
      Size = 50
    end
    object adoLoadDatadevid: TWideStringField
      DisplayLabel = #26426#22120#21495
      FieldName = 'devid'
      FixedChar = True
      Size = 10
    end
    object adoLoadDatadevtime: TDateTimeField
      DisplayLabel = #26426#22120#26102#38388
      FieldName = 'devtime'
    end
    object adoLoadDatanote: TStringField
      DisplayLabel = #25805#20316#29366#24577
      FieldName = 'note'
      Size = 40
    end
    object adoLoadDataconnctstatus: TStringField
      DisplayLabel = #36830#25509#29366#24577
      FieldName = 'connctstatus'
    end
  end
  object DataSource2: TDataSource
    DataSet = cdsLoadData
    Left = 260
    Top = 142
  end
  object dspLoadData: TDataSetProvider
    DataSet = adoLoadData
    Left = 111
    Top = 140
  end
  object cdsLoadData: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLoadData'
    Left = 186
    Top = 142
    object cdsLoadDataselected: TBooleanField
      DisplayLabel = #36873#25321
      FieldName = 'selected'
    end
    object cdsLoadDatadevip: TWideStringField
      DisplayLabel = #26426#22120#22320#22336
      FieldName = 'devip'
      Size = 50
    end
    object cdsLoadDatadevid: TWideStringField
      DisplayLabel = #26426#22120#21495
      FieldName = 'devid'
      Size = 10
    end
    object cdsLoadDatadevtime: TDateTimeField
      DisplayLabel = #26426#22120#26102#38388
      FieldName = 'devtime'
    end
    object cdsLoadDataconnctstatus: TStringField
      DisplayLabel = #36830#25509#29366#24577
      FieldName = 'connctstatus'
    end
    object cdsLoadDatanote: TStringField
      DisplayLabel = #25805#20316#29366#24577
      FieldName = 'note'
      Size = 40
    end
  end
  object adoSelTime: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Employee_Train_eastid.rkey, dbo.v_employeemsg.emp' +
      'loyeecode, dbo.v_employeemsg.chinesename, dbo.v_employeemsg.depa' +
      'rtmentname, '#13#10'                      dbo.Employee_Train_eastid.ca' +
      'rd_datetime, dbo.Employee_Train_eastid.card_date, dbo.Employee_T' +
      'rain_eastid.card_time, dbo.Employee_Train_eastid.employeeid,'#13#10'  ' +
      '                    dbo.v_employeemsg.position_item'#13#10'FROM       ' +
      '  dbo.Employee_Train_eastid INNER JOIN'#13#10'                      db' +
      'o.v_employeemsg ON dbo.Employee_Train_eastid.employeeid = dbo.v_' +
      'employeemsg.rkey'#13#10'where 1=1'#13#10
    Parameters = <>
    Left = 43
    Top = 210
    object adoSelTimerkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoSelTimeemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoSelTimechinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoSelTimedepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoSelTimeposition_item: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position_item'
      ReadOnly = True
    end
    object adoSelTimecard_datetime: TDateTimeField
      DisplayLabel = #25171#21345#26085#26399#26102#38388
      FieldName = 'card_datetime'
    end
    object adoSelTimecard_date: TWideStringField
      DisplayLabel = #25171#21345#26085#26399
      FieldName = 'card_date'
    end
    object adoSelTimecard_time: TWideStringField
      DisplayLabel = #25171#21345#26102#38388
      FieldName = 'card_time'
    end
    object adoSelTimeemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
  end
  object DataSource3: TDataSource
    DataSet = adoSelTime
    Left = 97
    Top = 210
  end
  object adoTmp2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 184
    Top = 216
  end
end
