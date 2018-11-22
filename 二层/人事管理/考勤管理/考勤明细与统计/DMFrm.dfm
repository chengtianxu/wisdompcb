object DM1: TDM1
  OldCreateOrder = False
  Left = 482
  Top = 279
  Height = 347
  Width = 493
  object con1: TADOConnection
    CommandTimeout = 900
    ConnectionTimeout = 60
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 16
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 400
    Top = 256
  end
  object cmd1: TADOCommand
    Connection = con1
    Parameters = <>
    Left = 344
    Top = 248
  end
  object adsMain: TADODataSet
    Connection = con1
    MarshalOptions = moMarshalModifiedOnly
    CommandText = 
      'SELECT   d7.item, D1.Rkey,D1.CheckDate,D1.OnDutyTime1,D1.OffDuty' +
      'Time1,D1.OnDutyTime2,D1.OffDutyTime2,D1.OnDutyTime3,'#13#10'D1.OffDuty' +
      'Time3,D1.YTNote,D1.SWT,D1.OWT,D1.RWT,D1.ROT,D1.ClassID,D1.RestTy' +
      'pe,D1.locked,'#13#10'D1.SumCN,D1.SumCT,D1.SumZN,D1.SumZT,D1.SumKN,D1.S' +
      'umKT,D1.SumLN,D1.SumLT,'#13#10'D2.ChineseName,D2.employeecode,D1.workg' +
      'roup,d6.accountname,right(datename(weekday, d1.checkdate),1) AS ' +
      'XQ,'#13#10'd5.departmentname,d1.EmployeeID '#13#10'from onoffdutydata D1 '#13#10'I' +
      'NNER JOIN employeemsg d2 ON d1.EmployeeID = d2.Rkey '#13#10'INNER JOIN' +
      ' datadepartment d5 ON d2.departmentid = d5.RKey  '#13#10'LEFT JOIN sal' +
      'aryaccount D6 ON D6.RKey = D1.editmode left join datadetail  d7 ' +
      'on d2.position=d7.rkey'#13#10
    Parameters = <>
    Prepared = True
    Left = 16
    Top = 120
    object adsMainRkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object adsMainCheckDate: TDateTimeField
      FieldName = 'CheckDate'
    end
    object adsMainOnDutyTime1: TDateTimeField
      FieldName = 'OnDutyTime1'
    end
    object adsMainOffDutyTime1: TDateTimeField
      FieldName = 'OffDutyTime1'
    end
    object adsMainOnDutyTime2: TDateTimeField
      FieldName = 'OnDutyTime2'
    end
    object adsMainOffDutyTime2: TDateTimeField
      FieldName = 'OffDutyTime2'
    end
    object adsMainOnDutyTime3: TDateTimeField
      FieldName = 'OnDutyTime3'
    end
    object adsMainOffDutyTime3: TDateTimeField
      FieldName = 'OffDutyTime3'
    end
    object adsMainYTNote: TWideStringField
      FieldName = 'YTNote'
      Size = 50
    end
    object fltfldMainSWT: TFloatField
      FieldName = 'SWT'
    end
    object fltfldMainOWT: TFloatField
      FieldName = 'OWT'
    end
    object fltfldMainRWT: TFloatField
      FieldName = 'RWT'
    end
    object fltfldMainROT: TFloatField
      FieldName = 'ROT'
    end
    object intgrfldMainClassID: TIntegerField
      FieldName = 'ClassID'
    end
    object intgrfldMainRestType: TIntegerField
      FieldName = 'RestType'
      OnValidate = intgrfldMainRestTypeValidate
    end
    object intgrfldMainlocked: TIntegerField
      FieldName = 'locked'
    end
    object adsMainChineseName: TWideStringField
      FieldName = 'ChineseName'
    end
    object adsMainemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object intgrfldMainworkgroup: TIntegerField
      FieldName = 'workgroup'
    end
    object adsMainaccountname: TWideStringField
      FieldName = 'accountname'
      Size = 50
    end
    object adsMainXQ: TWideStringField
      FieldName = 'XQ'
      ReadOnly = True
      Size = 1
    end
    object adsMaindepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object adsMainRestColor: TStringField
      FieldKind = fkLookup
      FieldName = 'RestColor'
      LookupDataSet = adsLookUpRestColor
      LookupKeyFields = 'rkey'
      LookupResultField = 'resttype_name'
      KeyFields = 'RestType'
      Lookup = True
    end
    object adsMainClassName: TStringField
      FieldKind = fkLookup
      FieldName = 'ClassName'
      LookupDataSet = adsLookUpClass
      LookupKeyFields = 'rkey'
      LookupResultField = 'classname'
      KeyFields = 'ClassID'
      LookupCache = True
      Lookup = True
    end
    object adsMainclassgrouptype: TStringField
      FieldKind = fkLookup
      FieldName = 'classgrouptype'
      LookupDataSet = adsLookClassGroupType
      LookupKeyFields = 'rkey'
      LookupResultField = 'item'
      KeyFields = 'workgroup'
      LookupCache = True
      Lookup = True
    end
    object intgrfldMainEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
    end
    object fltfldMainSumCN: TFloatField
      FieldName = 'SumCN'
    end
    object fltfldMainSumCT: TFloatField
      FieldName = 'SumCT'
    end
    object fltfldMainSumZN: TFloatField
      FieldName = 'SumZN'
    end
    object fltfldMainSumZT: TFloatField
      FieldName = 'SumZT'
    end
    object fltfldMainSumKN: TFloatField
      FieldName = 'SumKN'
    end
    object fltfldMainSumKT: TFloatField
      FieldName = 'SumKT'
    end
    object fltfldMainSumLN: TFloatField
      FieldName = 'SumLN'
    end
    object fltfldMainSumLT: TFloatField
      FieldName = 'SumLT'
    end
    object wdstrngfldMainitem: TWideStringField
      FieldName = 'item'
      Size = 50
    end
  end
  object adsLookUpRestColor: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'select rkey,resttype_name,color from resttypemsg  union all sele' +
      'ct null,'#39#39','#39'clwhite'#39
    Parameters = <>
    Left = 320
    Top = 24
    object adsLookUpRestColorrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsLookUpRestColorresttype_name: TWideStringField
      FieldName = 'resttype_name'
      Size = 50
    end
    object adsLookUpRestColorcolor: TWideStringField
      FieldName = 'color'
      Size = 12
    end
  end
  object adsLookUpClass: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'SELECT rkey, classname,classstatus FROM Class'#13#10'union all'#13#10'select' +
      ' null,'#39#39',1'#13#10'order by  classname'
    Parameters = <>
    Left = 320
    Top = 72
    object intgrfldLookUpClassrkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsLookUpClassclassname: TWideStringField
      FieldName = 'classname'
    end
    object adsLookUpClassclassstatus: TIntegerField
      FieldName = 'classstatus'
      ReadOnly = True
    end
  end
  object adsLookClassGroupType: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'select rkey,item  from Datadetail where dictid = 22'#13#10'union all'#13#10 +
      'select null,'#39#39
    Parameters = <>
    Left = 304
    Top = 144
    object adsLookClassGroupTyperkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsLookClassGroupTypeitem: TWideStringField
      FieldName = 'item'
    end
  end
  object adsBanCi: TADODataSet
    Connection = con1
    CursorType = ctStatic
    CommandText = 
      'SELECT '#13#10'rkey,'#13#10'classname,'#13#10'ontime1,'#13#10'outtime1,'#13#10'ontime2,'#13#10'outti' +
      'me2,'#13#10'ontime3,'#13#10'outtime3,'#13#10'isextra1,'#13#10'isextra2,'#13#10'isextra3,'#13#10'ahea' +
      'dduty,'#13#10'delayduty,'#13#10'isoverzero,'#13#10'cardGap,'#13#10'passsegment,'#13#10'auto_ov' +
      'ertime,'#13#10'worktimesum,'#13#10'work_rest,'#13#10'classdesc,'#13#10'overworktime,'#13#10'ov' +
      'erwork_rest,'#13#10'overtimetype,'#13#10'createdate,'#13#10'username,'#13#10'classstatus' +
      ','#13#10'locked,'#13#10'edit_1,'#13#10'edit_2,'#13#10'edit_3,'#13#10'edit_4,'#13#10'edit_5,'#13#10'edit_6,' +
      #13#10'edit_7,'#13#10'edit_8,'#13#10'edit_9,'#13#10'edit_10,'#13#10'edit_11,'#13#10'edit_12,'#13#10'edit_' +
      '13,'#13#10'edit_14,'#13#10'edit_15,'#13#10'edit_16,'#13#10'edit_17,'#13#10'edit_18,'#13#10'edit_19,'#13 +
      #10'edit_20,'#13#10'edit_21,'#13#10'edit_22,'#13#10'edit_23,'#13#10'edit_24,'#13#10'edit_25,'#13#10'edi' +
      't_26,'#13#10'edit_27,'#13#10'edit_28,'#13#10'edit_29,'#13#10'edit_30,'#13#10'edit_31,'#13#10'edit_32' +
      ','#13#10'edit_33'#13#10'FROM class WHERE classstatus=1'
    IndexFieldNames = 'rkey'
    Parameters = <>
    Left = 112
    Top = 16
    object adsBanCirkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adsBanCiontime1: TDateTimeField
      FieldName = 'ontime1'
    end
    object adsBanCiouttime1: TDateTimeField
      FieldName = 'outtime1'
    end
    object adsBanCiontime2: TDateTimeField
      FieldName = 'ontime2'
    end
    object adsBanCiouttime2: TDateTimeField
      FieldName = 'outtime2'
    end
    object adsBanCiontime3: TDateTimeField
      FieldName = 'ontime3'
    end
    object adsBanCiouttime3: TDateTimeField
      FieldName = 'outtime3'
    end
    object adsBanCiisextra1: TBooleanField
      FieldName = 'isextra1'
    end
    object adsBanCiisextra2: TBooleanField
      FieldName = 'isextra2'
    end
    object adsBanCiisextra3: TBooleanField
      FieldName = 'isextra3'
    end
    object intgrfldBanCiaheadduty: TIntegerField
      FieldName = 'aheadduty'
    end
    object intgrfldBanCidelayduty: TIntegerField
      FieldName = 'delayduty'
    end
    object adsBanCiisoverzero: TBooleanField
      FieldName = 'isoverzero'
    end
    object intgrfldBanCicardGap: TIntegerField
      FieldName = 'cardGap'
    end
    object intgrfldBanCipasssegment: TIntegerField
      FieldName = 'passsegment'
    end
    object intgrfldBanCiauto_overtime: TIntegerField
      FieldName = 'auto_overtime'
    end
    object fltfldBanCiworktimesum: TFloatField
      FieldName = 'worktimesum'
    end
    object fltfldBanCiwork_rest: TFloatField
      FieldName = 'work_rest'
    end
    object adsBanCiclassdesc: TWideStringField
      FieldName = 'classdesc'
      Size = 50
    end
    object fltfldBanCioverworktime: TFloatField
      FieldName = 'overworktime'
    end
    object fltfldBanCioverwork_rest: TFloatField
      FieldName = 'overwork_rest'
    end
    object intgrfldBanCiovertimetype: TIntegerField
      FieldName = 'overtimetype'
    end
    object adsBanCicreatedate: TDateTimeField
      FieldName = 'createdate'
    end
    object adsBanCiusername: TWideStringField
      FieldName = 'username'
      Size = 50
    end
    object intgrfldBanCiclassstatus: TIntegerField
      FieldName = 'classstatus'
    end
    object intgrfldBanCilocked: TIntegerField
      FieldName = 'locked'
    end
    object fltfldBanCiedit_1: TFloatField
      FieldName = 'edit_1'
    end
    object fltfldBanCiedit_2: TFloatField
      FieldName = 'edit_2'
    end
    object fltfldBanCiedit_3: TFloatField
      FieldName = 'edit_3'
    end
    object fltfldBanCiedit_4: TFloatField
      FieldName = 'edit_4'
    end
    object fltfldBanCiedit_5: TFloatField
      FieldName = 'edit_5'
    end
    object fltfldBanCiedit_6: TFloatField
      FieldName = 'edit_6'
    end
    object fltfldBanCiedit_7: TFloatField
      FieldName = 'edit_7'
    end
    object fltfldBanCiedit_8: TFloatField
      FieldName = 'edit_8'
    end
    object fltfldBanCiedit_9: TFloatField
      FieldName = 'edit_9'
    end
    object fltfldBanCiedit_10: TFloatField
      FieldName = 'edit_10'
    end
    object fltfldBanCiedit_11: TFloatField
      FieldName = 'edit_11'
    end
    object fltfldBanCiedit_12: TFloatField
      FieldName = 'edit_12'
    end
    object fltfldBanCiedit_13: TFloatField
      FieldName = 'edit_13'
    end
    object fltfldBanCiedit_14: TFloatField
      FieldName = 'edit_14'
    end
    object fltfldBanCiedit_15: TFloatField
      FieldName = 'edit_15'
    end
    object fltfldBanCiedit_16: TFloatField
      FieldName = 'edit_16'
    end
    object adsBanCiedit_17: TBooleanField
      FieldName = 'edit_17'
    end
    object adsBanCiedit_18: TBooleanField
      FieldName = 'edit_18'
    end
    object adsBanCiedit_19: TBooleanField
      FieldName = 'edit_19'
    end
    object adsBanCiedit_20: TBooleanField
      FieldName = 'edit_20'
    end
    object adsBanCiedit_21: TBooleanField
      FieldName = 'edit_21'
    end
    object adsBanCiedit_22: TBooleanField
      FieldName = 'edit_22'
    end
    object adsBanCiedit_23: TBooleanField
      FieldName = 'edit_23'
    end
    object adsBanCiedit_24: TBooleanField
      FieldName = 'edit_24'
    end
    object adsBanCiedit_25: TBooleanField
      FieldName = 'edit_25'
    end
    object adsBanCiedit_26: TBooleanField
      FieldName = 'edit_26'
    end
    object adsBanCiedit_27: TBooleanField
      FieldName = 'edit_27'
    end
    object adsBanCiedit_28: TBooleanField
      FieldName = 'edit_28'
    end
    object adsBanCiedit_29: TBooleanField
      FieldName = 'edit_29'
    end
    object adsBanCiedit_30: TBooleanField
      FieldName = 'edit_30'
    end
    object adsBanCiedit_31: TBooleanField
      FieldName = 'edit_31'
    end
    object adsBanCiedit_32: TBooleanField
      FieldName = 'edit_32'
    end
    object adsBanCiedit_33: TBooleanField
      FieldName = 'edit_33'
    end
    object adsBanCiclassname: TWideStringField
      FieldName = 'classname'
    end
  end
  object spInit: TADOStoredProc
    Connection = con1
    CommandTimeout = 1200
    ProcedureName = 'hrsp_onoffdutydata_init;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@yearmonth'
        Attributes = [paNullable]
        DataType = ftWideString
        Size = 10
        Value = Null
      end>
    Left = 160
    Top = 104
  end
  object qryOUt: TADOQuery
    Connection = con1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'users'
        DataType = ftString
        Size = 4
        Value = '3022'
      end>
    SQL.Strings = (
      ' ;WITH z as ('
      ' '#9'SELECT employeeid,emp.employeecode,max(date_e) as maxdate'
      #9'FROM OriginalCheckData CHK'
      #9#9'inner join employeemsg emp on CHK.employeeid = emp.rkey'
      
        #9'where card_time BETWEEN convert(varchar(12),dateadd(day,-31,get' +
        'date()),23) AND convert(varchar(12),getdate(),23)'
      #9#9'AND emp.status = 1 AND emp.wagetype = 9'
      #9'group BY employeeid,emp.employeecode'
      #9'union'
      
        #9'SELECT employeeid,emp.employeecode,convert(varchar(12),getdate(' +
        '),23) as maxdate'
      #9'FROM AskLeaveRegister'
      
        #9#9'inner join employeemsg emp on AskLeaveRegister.employeeid = em' +
        'p.rkey'
      #9'where emp.status = 1 AND emp.wagetype = 9'
      
        #9#9' AND AskLeaveRegister.enddate >= convert(varchar(12),dateadd(d' +
        'ay,-4,getdate()),23)'
      #9'group BY employeeid,emp.employeecode'
      #9'union '
      
        #9'SELECT employeeid,emp.employeecode,max(req_cardtime) as maxdate' +
        ' '
      #9'FROM Req '
      #9#9'inner join employeemsg emp on Req.employeeid = emp.rkey'
      
        #9'where emp.status = 1 AND emp.wagetype = 9 AND Req.ReqState = 2 ' +
        'and Req.ReqType = 2 '
      
        #9#9'AND Req.req_cardtime BETWEEN convert(varchar(12),dateadd(day,-' +
        '4,getdate()),23) AND convert(varchar(12),getdate(),23)'
      #9'group BY employeeid,emp.employeecode'
      #9'union '#9
      
        #9'SELECT employeemsg.rkey,employeemsg.employeecode,max(RestDate) ' +
        'as maxdate '
      #9'FROM FactoryCalendar,employeemsg '
      
        #9'where employeemsg.status = 1 AND employeemsg.wagetype = 9 AND R' +
        'estDate >= convert(varchar(12),dateadd(day,-4,getdate()),23)'
      #9'group BY employeemsg.rkey,employeemsg.employeecode'
      #9'UNION '
      
        #9'SELECT employeemsg.rkey,employeemsg.employeecode,max(CheckDate)' +
        ' as maxdate  '
      #9'FROM OnOffDutyData '
      
        #9#9'inner join employeemsg on OnOffDutyData.EmployeeID = employeem' +
        'sg.rkey'
      
        #9'WHERE OnOffDutyData.CheckDate BETWEEN convert(varchar(12),datea' +
        'dd(day,-30,getdate()),23) AND convert(varchar(12),getdate(),23)'
      
        #9#9'and OnOffDutyData.RestType =2 AND employeemsg.status = 1 AND e' +
        'mployeemsg.wagetype = 9'
      #9'group BY employeemsg.rkey,employeemsg.employeecode'#9
      ')'
      
        'Select z.employeeid,v_employeemsg.employeecode,v_employeemsg.chi' +
        'nesename,v_employeemsg.ondutytime'
      
        #9#9',v_employeemsg.position_item,v_employeemsg.departmentname,max(' +
        'maxdate) as maxdate '
      'FROM z'
      #9#9'inner join v_employeemsg on z.employeeid = v_employeemsg.rkey'
      #9#9'INNER JOIN'
      #9'      (select distinct departmentid from hr_permission '
      #9#9#9'where program_ptr = ('
      #9#9#9#9#9'select rkey from data0419 '
      #9#9#9#9#9'where programe = '#39'KQTJ.exe'#39' )'
      
        #9'     and  operator_ptr= :users ) as depart on v_employeemsg.dep' +
        'artmentid=depart.departmentid'
      
        'GROUP BY z.employeeid,v_employeemsg.employeecode,v_employeemsg.c' +
        'hinesename,v_employeemsg.ondutytime'
      #9#9#9',v_employeemsg.position_item,v_employeemsg.departmentname'
      
        'HAVING dateadd(day,4,max(maxdate))< convert(varchar(12),getdate(' +
        '),23)'
      'ORDER BY v_employeemsg.departmentname,v_employeemsg.employeecode'
      ' ')
    Left = 192
    Top = 240
    object qryOUtemployeeid: TIntegerField
      FieldName = 'employeeid'
      ReadOnly = True
    end
    object qryOUtemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object qryOUtchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object qryOUtondutytime: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'ondutytime'
    end
    object qryOUtposition_item: TWideStringField
      DisplayLabel = #32844#21153
      FieldName = 'position_item'
      Size = 50
    end
    object qryOUtdepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
    object qryOUtmaxdate: TDateTimeField
      DisplayLabel = #26368#21518#32771#21220#26085#26399
      FieldName = 'maxdate'
      ReadOnly = True
    end
  end
end
