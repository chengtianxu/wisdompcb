object DM: TDM
  OldCreateOrder = False
  Left = 393
  Top = 250
  Height = 440
  Width = 395
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 168
    Top = 8
  end
  object adoMain: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'select hrcertificate.PAbility, hrcertificate.rkey,datadepartment' +
      '.departmentname,employeemsg.employeecode,employeemsg.chinesename' +
      ',employeemsg.ondutytime,employeemsg.outdutytime,datadetail_2.ite' +
      'm as position,'#13#10#9#9'case  employeemsg.status when 1 then '#39#22312#32844#39' when' +
      ' 2 then '#39#31163#32844#39' end as onoffduty,hrcertificate.code,datadetail_1.it' +
      'em as proper,employeemsg.status as empstatus,'#13#10#9#9'case when hrcer' +
      'tificate.type=0 then '#39#20010#20154#39' '#13#10#9#9'     when hrcertificate.type=1 the' +
      'n '#39#20851#38190#23703#20301#39#13#10#9#9'     when hrcertificate.type=2 THEN '#39#26222#36890#23703#20301#39' '#13#10#9#9'     ' +
      'when hrcertificate.type=3 then '#39#20844#21496#39' end as ctftype,'#13#10#9#9'hrcertifi' +
      'cate.startdate,hrcertificate.enddate,'#13#10'                         ' +
      '       case when hrcertificate.status=1 then '#39#26377#25928#39' else '#39#22833#25928#39' end ' +
      'as statu,hrcertificate.status,'#13#10#9#9'hrcertificate.remark,hrcertifi' +
      'cate.inputdate,data0005.employee_name,datadetail_3.item as stati' +
      'ons,Hrcertificate.stationid'#13#10'from Hrcertificate inner join emplo' +
      'yeemsg on hrcertificate.employeeid=employeemsg.rkey'#13#10'inner join ' +
      'datadepartment on employeemsg.departmentid= datadepartment.rkey'#13 +
      #10'left join datadetail as datadetail_1 on hrcertificate.datadetai' +
      'l_ptr=datadetail_1.rkey'#13#10'left join datadetail as datadetail_2 on' +
      ' employeemsg.position=datadetail_2.rkey'#13#10'left join datadetail as' +
      ' datadetail_3 on Hrcertificate.stationid=datadetail_3.rkey'#13#10'left' +
      ' join data0005 on hrcertificate.opration_person=data0005.rkey'#13#10'w' +
      'here hrcertificate.startdate between :ondate and :todate'#13#10'and em' +
      'ployeemsg.status= :status '
    Parameters = <
      item
        Name = 'ondate'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'todate'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'status'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end>
    Left = 32
    Top = 80
    object adoMaindepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object adoMainemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoMainchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoMainondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object adoMainoutdutytime: TDateTimeField
      DisplayLabel = #31163#32844#26085#26399
      FieldName = 'outdutytime'
    end
    object adoMainposition: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position'
    end
    object adoMainonoffduty: TStringField
      DisplayLabel = #22312#32844'/'#31163#32844
      FieldName = 'onoffduty'
      ReadOnly = True
      Size = 4
    end
    object adoMaincode: TWideStringField
      DisplayLabel = #35777#20070#32534#21495
      FieldName = 'code'
      Size = 50
    end
    object adoMainproper: TWideStringField
      DisplayLabel = #35777#20070#21517#31216
      FieldName = 'proper'
    end
    object adoMainctftype: TStringField
      DisplayLabel = #35777#20070#24615#36136
      DisplayWidth = 8
      FieldName = 'ctftype'
      ReadOnly = True
      Size = 8
    end
    object adoMainstartdate: TDateTimeField
      DisplayLabel = #29983#25928#26085#26399
      FieldName = 'startdate'
    end
    object adoMainenddate: TDateTimeField
      DisplayLabel = #22833#25928#26085#26399
      FieldName = 'enddate'
    end
    object adoMainstatu: TStringField
      DisplayLabel = #29366#24577
      FieldName = 'statu'
      ReadOnly = True
      Size = 4
    end
    object adoMainremark: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 50
    end
    object adoMainemployee_name: TStringField
      DisplayLabel = #24405#20837#20154
      FieldName = 'employee_name'
      Size = 16
    end
    object adoMaininputdate: TDateTimeField
      DisplayLabel = #24405#20837#26085#26399
      FieldName = 'inputdate'
    end
    object adoMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoMainstatus: TIntegerField
      FieldName = 'status'
    end
    object adoMainempstatus: TWordField
      FieldName = 'empstatus'
    end
    object adoMainstations: TWideStringField
      DisplayLabel = #23703#20301#21517#31216
      FieldName = 'stations'
      Size = 32
    end
    object adoMainstationid: TIntegerField
      FieldName = 'stationid'
    end
    object adoMainPAbility: TStringField
      FieldName = 'PAbility'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = adoMain
    Left = 32
    Top = 144
  end
  object adoTmp: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 88
    Top = 304
  end
  object adoTime: TADOQuery
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 152
    Top = 304
  end
  object adoWillOut: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      '  select employeemsg.employeecode,employeemsg.chinesename,hrcert' +
      'ificate.code,datadetail.item,'#13#10'       case when hrcertificate.ty' +
      'pe=0 then '#39#20010#20154#39' else '#39#20844#21496#39' end as ctftype,'#13#10#9#9'hrcertificate.startd' +
      'ate,hrcertificate.enddate,dd.departmentName'#13#10'from hrcertificate ' +
      #13#10'inner join employeemsg on hrcertificate.employeeid=employeemsg' +
      '.rkey'#13#10'inner join datadetail on hrcertificate.datadetail_ptr=dat' +
      'adetail.rkey'#13#10'inner join datadepartment dd on  employeemsg.depar' +
      'tmentID=dd.rkey'#13#10'where hrcertificate.status=1 and hrcertificate.' +
      'enddate between :beforedate and :enddate'
    Parameters = <
      item
        Name = 'beforedate'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'enddate'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 128
    Top = 80
    object adoWillOutemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoWillOutchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoWillOutcode: TWideStringField
      DisplayLabel = #35777#20070#32534#21495
      FieldName = 'code'
      Size = 50
    end
    object adoWillOutitem: TWideStringField
      DisplayLabel = #35777#20070#21517#31216
      FieldName = 'item'
    end
    object adoWillOutctftype: TStringField
      DisplayLabel = #35777#20070#24615#36136
      FieldName = 'ctftype'
      ReadOnly = True
      Size = 4
    end
    object adoWillOutstartdate: TDateTimeField
      DisplayLabel = #29983#25928#26085#26399
      FieldName = 'startdate'
    end
    object adoWillOutenddate: TDateTimeField
      DisplayLabel = #22833#25928#26085#26399
      FieldName = 'enddate'
    end
    object adoWillOutdepartmentName: TWideStringField
      FieldName = 'departmentName'
    end
  end
  object DataSource2: TDataSource
    DataSet = adoWillOut
    Left = 128
    Top = 144
  end
  object DataSource3: TDataSource
    DataSet = adoOut
    Left = 224
    Top = 144
  end
  object adoOut: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      ' select employeemsg.employeecode,employeemsg.chinesename,hrcerti' +
      'ficate.code,datadetail.item,'#13#10'       case when hrcertificate.typ' +
      'e=0 then '#39#20010#20154#39' else '#39#20844#21496#39' end as ctftype,'#13#10#9#9'hrcertificate.startda' +
      'te,hrcertificate.enddate,dd.departmentName'#13#10'from hrcertificate '#13 +
      #10'inner join employeemsg on hrcertificate.employeeid=employeemsg.' +
      'rkey'#13#10'inner join datadetail on hrcertificate.datadetail_ptr=data' +
      'detail.rkey'#13#10'inner join datadepartment dd on  employeemsg.depart' +
      'mentID=dd.rkey'#13#10'where hrcertificate.status=1 and hrcertificate.e' +
      'nddate < :today'
    Parameters = <
      item
        Name = 'today'
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    Left = 224
    Top = 80
    object adoOutemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoOutchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoOutcode: TWideStringField
      DisplayLabel = #35777#20070#32534#21495
      FieldName = 'code'
      Size = 50
    end
    object adoOutitem: TWideStringField
      DisplayLabel = #35777#20070#21517#31216
      FieldName = 'item'
    end
    object adoOutctftype: TStringField
      DisplayLabel = #35777#20070#24615#36136
      FieldName = 'ctftype'
      ReadOnly = True
      Size = 4
    end
    object adoOutstartdate: TDateTimeField
      DisplayLabel = #29983#25928#26102#38388
      FieldName = 'startdate'
    end
    object adoOutenddate: TDateTimeField
      DisplayLabel = #22833#25928#26102#38388
      FieldName = 'enddate'
    end
    object adoOutdepartmentName: TWideStringField
      FieldName = 'departmentName'
    end
  end
end
