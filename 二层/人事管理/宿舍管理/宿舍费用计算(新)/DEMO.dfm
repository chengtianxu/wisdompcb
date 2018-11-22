object DM: TDM
  OldCreateOrder = False
  Left = 912
  Top = 367
  Height = 294
  Width = 269
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 104
    Top = 16
  end
  object dsMain: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'select bedroomfees.rkey, bedroomfees.roomid, bedroomfees.yearmon' +
      'th'#13#10#9',bedroomfees.R_decrease_e, bedroomfees.R_decrease_w, bedroo' +
      'mfees.electic_f'#13#10#9',bedroomfees.last_fees, bedroomfees.water_f, b' +
      'edroomfees.person_freque'#13#10#9', bedroomfees.sould_pay, bedroommsg.r' +
      '_code, bedroommsg.r_name'#13#10#9',dormitorymsg.D_name'#13#10'from bedroomfee' +
      's '#13#10#9'inner join bedroommsg on bedroomfees.roomid=bedroommsg.rkey' +
      #13#10#9'inner join dormitorymsg on bedroommsg.dormitoryid=dormitoryms' +
      'g.rkey'#13#10'where dormitorymsg.effective=1 and bedroommsg.effective=' +
      '1 '#13#10#9'and bedroomfees.yearmonth=:yearmonth'
    IndexFieldNames = 'D_name'
    Parameters = <
      item
        Name = 'yearmonth'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    Left = 16
    Top = 72
    object dsMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dsMainroomid: TIntegerField
      FieldName = 'roomid'
    end
    object dsMainyearmonth: TStringField
      DisplayLabel = #35745#31639#26376#20221
      FieldName = 'yearmonth'
      Size = 50
    end
    object dsMainR_decrease_e: TFloatField
      DisplayLabel = #30005#20943#20813#26631#20934
      FieldName = 'R_decrease_e'
    end
    object dsMainR_decrease_w: TFloatField
      DisplayLabel = #27700#20943#20813#26631#20934
      FieldName = 'R_decrease_w'
    end
    object dsMainelectic_f: TFloatField
      DisplayLabel = #30005#36153
      FieldName = 'electic_f'
    end
    object dsMainwater_f: TFloatField
      DisplayLabel = #27700#36153
      FieldName = 'water_f'
    end
    object dsMainperson_freque: TIntegerField
      DisplayLabel = #24635#22825#25968
      FieldName = 'person_freque'
    end
    object dsMainsould_pay: TFloatField
      DisplayLabel = #24635#36153#29992
      FieldName = 'sould_pay'
    end
    object dsMainr_code: TStringField
      DisplayLabel = #25151#38388#32534#21495
      FieldName = 'r_code'
      Size = 50
    end
    object dsMainr_name: TWideStringField
      DisplayLabel = #25151#38388#21517#31216
      FieldName = 'r_name'
    end
    object dsMainD_name: TWideStringField
      DisplayLabel = #23487#33293#27004#21517#31216
      FieldName = 'D_name'
      Size = 50
    end
    object dsMainlast_fees: TFloatField
      DisplayLabel = #25151#38388#36153#29992
      FieldName = 'last_fees'
    end
  end
  object dsAux: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    CommandText = 
      'select bedroomfees_detail.rkey,bedroomfees_detail.bedroomfeesid'#13 +
      #10#9',bedroomfees_detail.beduseid,bedroomfees_detail.employeeid'#13#10#9',' +
      'bedroomfees_detail.stay_days,bedroomfees_detail.subfees'#13#10#9',bedro' +
      'omfees_detail.effect_flag,bedroomfees_detail.ischecked'#13#10#9',bedroo' +
      'musemsg.startdate,bedroomusemsg.enddate'#13#10#9',bedmsg.B_code,employe' +
      'emsg_extra.employeecode'#13#10#9',employeemsg_extra.chinesename'#13#10'from b' +
      'edroomfees_detail'#13#10#9'inner join bedroomfees on bedroomfees_detail' +
      '.bedroomfeesid=bedroomfees.rkey'#13#10#9'inner join bedroomusemsg on be' +
      'droomfees_detail.beduseid=bedroomusemsg.rkey'#13#10#9'inner join bedmsg' +
      ' on bedroomusemsg.bedid=bedmsg.rkey'#13#10#9'inner join employeemsg_ext' +
      'ra on bedroomfees_detail.employeeid=employeemsg_extra.rkey'#13#10'wher' +
      'e bedroomfees.yearmonth=:yearmonth and bedroomfees_detail.bedroo' +
      'mfeesid=:rkey'#13#10
    DataSource = DataSource1
    IndexFieldNames = 'rkey'
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'yearmonth'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 16
    Top = 136
    object dsAuxrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dsAuxbedroomfeesid: TIntegerField
      FieldName = 'bedroomfeesid'
    end
    object dsAuxbeduseid: TIntegerField
      FieldName = 'beduseid'
    end
    object dsAuxemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object dsAuxstay_days: TIntegerField
      DisplayLabel = #20303#23487#22825#25968
      FieldName = 'stay_days'
    end
    object dsAuxsubfees: TFloatField
      DisplayLabel = #20998#25674#24635#36153#29992
      FieldName = 'subfees'
    end
    object dsAuxstartdate: TDateTimeField
      DisplayLabel = #25644#20837#26085#26399
      FieldName = 'startdate'
    end
    object dsAuxenddate: TDateTimeField
      DisplayLabel = #25644#20986#26085#26399
      FieldName = 'enddate'
    end
    object dsAuxB_code: TStringField
      DisplayLabel = #24202#20301#21495
      FieldName = 'B_code'
      Size = 50
    end
    object dsAuxemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object dsAuxchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
  end
  object dsEmp: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select bedmsg.B_code,employeemsg_extra.employeecode'#13#10#9',employeem' +
      'sg_extra.chinesename,employeemsg_extra.factoryarea'#13#10#9',employeems' +
      'g_extra.departmentname'#13#10#9',bedroommsg.r_name,Dormitorymsg.D_name'#13 +
      #10'    ,employeemsg_extra.StayGrade,employeemsg_extra.position,bed' +
      'roommsg.grade'#13#10'    ,bedroomfees_detail.rkey,bedroomfees_detail.b' +
      'edroomfeesid'#13#10#9',bedroomfees_detail.beduseid,bedroomfees_detail.e' +
      'mployeeid'#13#10#9',bedroomfees_detail.stay_days,bedroomfees_detail.sub' +
      'fees'#13#10#9',bedroomfees_detail.effect_flag,bedroomfees_detail.ischec' +
      'ked'#13#10#9',bedroomusemsg.startdate,bedroomusemsg.enddate'#13#10',bedroomfe' +
      'es_detail.subefees,bedroomfees_detail.subwfees,bedroomfees_detai' +
      'l.subrfees'#13#10#9',round(case when left(HasBuZhu.Memo,3)='#39#26080#34917#21161#39' then 0' +
      ' '#13#10'     else (case when bedroomusemsg.enddate is null then isnul' +
      'l(RFEES.user_defined1,0)'#13#10'     else ((isnull(RFEES.user_defined1' +
      ',0)*1.0/ day(dateadd(MONTH,1,bedroomusemsg.enddate - DAY(bedroom' +
      'usemsg.enddate)+1)-1)) * stay_days )end) end,0) as buzhu'#13#10#9',bedr' +
      'oomfees_detail.subefees+bedroomfees_detail.subwfees+bedroomfees_' +
      'detail.subrfees as totalfees'#13#10'      ,case when iscouple = 1 then' +
      ' '#39#26159#39' else '#39#21542#39' end as strcouple'#13#10'from bedroomfees_detail'#13#10#9'inner ' +
      'join bedroomfees on bedroomfees_detail.bedroomfeesid=bedroomfees' +
      '.rkey'#13#10#9'inner join bedroommsg on bedroomfees.roomid=bedroommsg.r' +
      'key '#13#10#9'inner join bedroomusemsg on bedroomfees_detail.beduseid=b' +
      'edroomusemsg.rkey'#13#10#9'inner join bedmsg on bedroomusemsg.bedid=bed' +
      'msg.rkey'#13#10#9'inner join employeemsg_extra on bedroomfees_detail.em' +
      'ployeeid=employeemsg_extra.rkey'#13#10'    inner join Dormitorymsg on ' +
      'dormitorymsg.rkey=bedroommsg.dormitoryid'#13#10'    left join'#13#10#9#9'('#13#10#9#9 +
      #9'SELECT item,user_defined1'#13#10#9#9#9#9'FROM datadetail '#13#10#9#9#9#9'WHERE dict' +
      'id = 24 '#13#10#9#9') AS RFEES ON RFEES.item = employeemsg_extra.StayGra' +
      'de'#13#10#9'left join'#13#10#9#9'('#13#10#9#9#9'SELECT *'#13#10#9#9#9#9'FROM datadetail '#13#10#9#9#9#9'WHER' +
      'E dictid = 25 '#13#10#9#9') AS HasBuZhu ON HasBuZhu.item = bedroommsg.gr' +
      'ade'#13#10'where bedroomfees.yearmonth=:yearmonth'
    IndexFieldNames = 'D_name'
    Parameters = <
      item
        Name = 'yearmonth'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    Left = 16
    Top = 192
    object dsEmprkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object dsEmpbedroomfeesid: TIntegerField
      FieldName = 'bedroomfeesid'
    end
    object dsEmpbeduseid: TIntegerField
      FieldName = 'beduseid'
    end
    object dsEmpemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object dsEmpstay_days: TIntegerField
      DisplayLabel = #20303#23487#22825#25968
      FieldName = 'stay_days'
    end
    object dsEmpsubfees: TFloatField
      DisplayLabel = #23454#38469#24212#20184
      FieldName = 'subfees'
    end
    object dsEmpeffect_flag: TBooleanField
      FieldName = 'effect_flag'
    end
    object dsEmpischecked: TBooleanField
      FieldName = 'ischecked'
    end
    object dsEmpstartdate: TDateTimeField
      DisplayLabel = #25644#20837#26085#26399
      FieldName = 'startdate'
    end
    object dsEmpenddate: TDateTimeField
      DisplayLabel = #25644#20986#26085#26399
      FieldName = 'enddate'
    end
    object dsEmpB_code: TStringField
      DisplayLabel = #24202#20301#21495
      FieldName = 'B_code'
      Size = 50
    end
    object dsEmpemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object dsEmpchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object dsEmpfactoryarea: TWideStringField
      DisplayLabel = #24037#21378
      FieldName = 'factoryarea'
    end
    object dsEmpdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object dsEmpr_name: TWideStringField
      DisplayLabel = #25151#38388#21517
      FieldName = 'r_name'
    end
    object dsEmpD_name: TWideStringField
      DisplayLabel = #23487#33293#27004#21517#31216
      FieldName = 'D_name'
      Size = 50
    end
    object dsEmpStayGrade: TStringField
      FieldName = 'StayGrade'
    end
    object dsEmpposition: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position'
    end
    object dsEmpgrade: TWideStringField
      DisplayLabel = #23487#33293#31561#32423
      FieldName = 'grade'
      FixedChar = True
      Size = 10
    end
    object dsEmpsubefees: TBCDField
      DisplayLabel = #30005#36153
      FieldName = 'subefees'
      Precision = 12
      Size = 2
    end
    object dsEmpsubwfees: TBCDField
      DisplayLabel = #27700#36153
      FieldName = 'subwfees'
      Precision = 12
      Size = 2
    end
    object dsEmpsubrfees: TBCDField
      DisplayLabel = #25151#36153
      FieldName = 'subrfees'
      Precision = 12
      Size = 2
    end
    object dsEmpbuzhu: TBCDField
      DisplayLabel = #20844#21496#34917#21161
      FieldName = 'buzhu'
      ReadOnly = True
      Precision = 32
      Size = 12
    end
    object dsEmptotalfees: TBCDField
      DisplayLabel = #24212#20184#21512#35745
      FieldName = 'totalfees'
      ReadOnly = True
      Precision = 14
      Size = 2
    end
    object dsEmpstrcouple: TStringField
      DisplayLabel = #22827#22971#25151
      FieldName = 'strcouple'
      ReadOnly = True
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = dsMain
    Left = 80
    Top = 71
  end
  object DataSource2: TDataSource
    DataSet = dsAux
    Left = 80
    Top = 137
  end
  object DataSource3: TDataSource
    DataSet = dsEmp
    Left = 80
    Top = 192
  end
end
