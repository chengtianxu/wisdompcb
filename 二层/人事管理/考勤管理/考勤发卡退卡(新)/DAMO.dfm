object DM: TDM
  OldCreateOrder = False
  Left = 419
  Top = 288
  Height = 336
  Width = 360
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 138
    Top = 12
  end
  object adoMain: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.v_employeemsg.employeecode, dbo.employeecardMsg.e' +
      'mployeeid, dbo.v_employeemsg.chinesename, dbo.employeecardMsg.ca' +
      'rdno_dec, '#13#10'                      dbo.employeecardMsg.begin_time' +
      ', dbo.employeecardMsg.end_time, dbo.employeecardMsg.oper_person,' +
      ' dbo.employeecardMsg.oper_date, '#13#10'                       dbo.emp' +
      'loyeecardMsg.rkey, dbo.Data0005.EMPLOYEE_NAME,employeecardMsg.st' +
      'atus,employeecardMsg.ICCardno,v_employeemsg.departmentname,'#13#10'   ' +
      '         Case employeecardMsg.status when 1 then '#39#26377#25928#39' when 2 the' +
      'n '#39#25346#22833#39' when 3 then '#39#36864#21345#39' when 4 then '#39#25439#22351#39' end AS msgstatus'#13#10'FROM ' +
      '        dbo.employeecardMsg INNER JOIN'#13#10'                      db' +
      'o.v_employeemsg ON dbo.employeecardMsg.employeeid = dbo.v_employ' +
      'eemsg.rkey INNER JOIN'#13#10'                      dbo.Data0005 ON dbo' +
      '.employeecardMsg.oper_person = dbo.Data0005.RKEY'#13#10'where 1=1 '#13#10
    IndexFieldNames = 'employeecode'
    Parameters = <>
    Left = 36
    Top = 82
    object adoMainrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object adoMainemployeecode: TWideStringField
      DisplayLabel = #24037#21495
      FieldName = 'employeecode'
    end
    object adoMainemployeeid: TIntegerField
      FieldName = 'employeeid'
    end
    object adoMainchinesename: TWideStringField
      DisplayLabel = #22995#21517
      FieldName = 'chinesename'
    end
    object adoMaincardno_dec: TStringField
      DisplayLabel = 'ID'#21345#21495
      FieldName = 'cardno_dec'
    end
    object adoMainbegin_time: TDateTimeField
      DisplayLabel = #21457#21345#26102#38388
      FieldName = 'begin_time'
    end
    object adoMainend_time: TDateTimeField
      DisplayLabel = #36864#21345#25110#25346#22833#26102#38388
      FieldName = 'end_time'
    end
    object adoMainEMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#20154
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object adoMainoper_person: TIntegerField
      FieldName = 'oper_person'
    end
    object adoMainstatus: TIntegerField
      FieldName = 'status'
    end
    object adoMainoper_date: TDateTimeField
      DisplayLabel = #25805#20316#26102#38388
      FieldName = 'oper_date'
    end
    object adoMainmsgstatus: TStringField
      DisplayLabel = #21345#29366#24577
      FieldName = 'msgstatus'
      ReadOnly = True
      Size = 4
    end
    object adoMainICCardno: TWideStringField
      DisplayLabel = 'IC'#21345#21495
      FieldName = 'ICCardno'
      FixedChar = True
    end
    object adoMaindepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      FieldName = 'departmentname'
    end
  end
  object DataSource1: TDataSource
    DataSet = adoMain
    Left = 105
    Top = 79
  end
  object adoTmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 36
    Top = 166
  end
  object adoTime: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 104
    Top = 168
  end
  object adoInsert: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 224
    Top = 160
  end
end
