object DM: TDM
  OldCreateOrder = False
  Left = 621
  Top = 374
  Height = 289
  Width = 375
  object ADOConn: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 192
    Top = 32
  end
  object adsMain: TADODataSet
    Connection = ADOConn
    LockType = ltReadOnly
    CommandTimeout = 60
    Parameters = <>
    Left = 192
    Top = 96
  end
  object dsMain: TDataSource
    DataSet = adsMain
    Left = 192
    Top = 152
  end
  object adoTmp: TADOQuery
    Connection = ADOConn
    Parameters = <>
    Left = 264
    Top = 96
  end
  object qryPost: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT account_type,empcard,empcode,card_time,payed,dev_id,strme' +
        'al_type,strcompany,inport_time'
      'FROM ICCardDataImport'
      'WHERE 1<>1')
    Left = 112
    Top = 104
    object qryPostaccount_type: TWordField
      FieldName = 'account_type'
    end
    object qryPostempcard: TStringField
      FieldName = 'empcard'
      Size = 10
    end
    object qryPostempcode: TStringField
      FieldName = 'empcode'
      Size = 12
    end
    object qryPostcard_time: TDateTimeField
      FieldName = 'card_time'
    end
    object qryPostpayed: TBCDField
      FieldName = 'payed'
      Precision = 19
    end
    object qryPostdev_id: TStringField
      FieldName = 'dev_id'
      FixedChar = True
      Size = 8
    end
    object qryPoststrmeal_type: TStringField
      FieldName = 'strmeal_type'
      Size = 12
    end
    object qryPoststrcompany: TWideStringField
      FieldName = 'strcompany'
      Size = 12
    end
    object qryPostinport_time: TDateTimeField
      FieldName = 'inport_time'
    end
  end
  object qrySTOR: TADOQuery
    Connection = ADOConn
    Parameters = <>
    SQL.Strings = (
      'declare @ICmindate datetime'
      'declare @ICmaxdate datetime'
      ''
      
        'SELECT @ICMINDATE=MIN(CARD_TIME),@ICMAXDATE=MAX(CARD_TIME) FROM ' +
        'ICCardDataImport'
      ''
      
        'UPDATE ICCardDataImport set empid= employee.rkey,factorytype='#39'lo' +
        'cal'#39
      
        'FROM ICCardDataImport inner join ( SELECT RKEY,employeecode FROM' +
        ' employeemsg '
      #9#9#9#9#9#9#9#9#9#9'WHERE (outdutytime is null) or   '
      #9#9#9#9#9#9#9#9#9#9'(outdutytime >= @ICMINDATE) '
      #9#9#9#9#9#9#9#9#9#9') as employee'
      #9#9#9' ON ICCardDataImport.empcode = employee.employeecode'
      ''
      
        'UPDATE ICCardDataImport set empid=alteration.employeeid,factoryt' +
        'ype='#39'local'#39
      'FROM ICCardDataImport INNER JOIN '
      #9#9'( SELECT EMPLOYEEID,orginal_employeecode,NEW_employeecode '
      #9#9'  FROM employee_alteration '
      
        #9#9'  WHERE alterdate between @ICMINDATE and @ICMAXDATE AND NEW_em' +
        'ployeecode IS NOT NULL ) AS alteration'
      #9#9'ON ICCardDataImport.empcode = alteration.orginal_employeecode'
      'WHERE ICCardDataImport.empid IS NULL '
      #9
      'UPDATE ICCardDataImport set company= substring(strcompany,1,1)'
      #9#9#9',meal_type= substring(strmeal_type,1,1)'
      #9#9#9',remark='#39'IC'#39
      #9#9#9',date_e= convert(varchar(10),card_time,23)'
      #9#9#9',time_e= convert(varchar(8),card_time,24)'
      #9#9#9
      'UPDATE ICCardDataImport set flag=1      '
      'FROM ICCardDataImport INNER JOIN '
      
        #9#9'MEAL_ORGINALDATA ON ICCardDataImport.empid = MEAL_ORGINALDATA.' +
        'empid '
      #9#9'AND ICCardDataImport.card_time = MEAL_ORGINALDATA.card_time '
      #9#9'AND ICCardDataImport.dev_id = MEAL_ORGINALDATA.dev_id '
      
        #9#9'AND ICCardDataImport.account_type = MEAL_ORGINALDATA.account_t' +
        'ype '
      
        'WHERE MEAL_ORGINALDATA.DEV_MARK='#39'IC'#39' AND MEAL_ORGINALDATA.card_t' +
        'ime BETWEEN @ICMINDATE AND @ICMAXDATE '
      #9#9'and ICCardDataImport.empid IS NOT NULL '
      #9#9#9
      
        'INSERT INTO MEAL_ORGINALDATA(empno,employeecard,card_time,date_e' +
        ',time_e,dev_id,empid'
      #9#9#9',dev_mark,factorytype,account_type,payed,company,meal_type)'
      'SELECT empcode,empcard,card_time,date_e,time_e,dev_id,empid'
      #9#9#9',remark,factorytype,account_type,payed,company,meal_type'
      'FROM ICCardDataImport'
      'WHERE flag=0 and empid IS NOT NULL '
      ''
      'UPDATE ICCardDataImport set flag=2   '
      'FROM ICCardDataImport left JOIN '
      
        #9#9'employeecard_eastriver_rcd_error ON ICCardDataImport.empcode=e' +
        'mployeecard_eastriver_rcd_error.empno'
      
        #9#9'AND ICCardDataImport.card_time = employeecard_eastriver_rcd_er' +
        'ror.card_time '
      
        #9#9'AND ICCardDataImport.dev_id = employeecard_eastriver_rcd_error' +
        '.dev_id '
      
        #9#9'AND ICCardDataImport.account_type = employeecard_eastriver_rcd' +
        '_error.account_type '
      'WHERE employeecard_eastriver_rcd_error.DEV_MARK='#39'IC'#39' '
      
        #9#9'AND employeecard_eastriver_rcd_error.card_time BETWEEN @ICMIND' +
        'ATE AND @ICMAXDATE'
      #9#9'AND ICCardDataImport.empid IS NULL '
      ''
      
        'INSERT INTO employeecard_eastriver_rcd_error(id,empno,employeeca' +
        'rd,card_time,date_e,time_e,dev_id,empid'
      #9#9#9',dev_mark,factorytype,account_type,payed,company,meal_type)'
      'SELECT 1,empcode,empcard,card_time,date_e,time_e,dev_id,empid'
      #9#9#9',remark,factorytype,account_type,payed,company,meal_type'
      'FROM ICCardDataImport'
      'WHERE flag=0 and empid IS NULL '
      ''
      'UPDATE MEAL_ORGINALDATA'
      'SET remark2='#39'BuKa'#39
      'WHERE DEV_MARK='#39'IC'#39' and employeecard = '#39'000000'#39' '
      #9#9#9'and card_time between @ICMINDATE  and @ICMAXDATE'
      ''
      'UPDATE employeecard_eastriver_rcd_error'
      'SET remark2='#39'BuKa'#39
      'WHERE DEV_MARK='#39'IC'#39' and employeecard = '#39'000000'#39' '
      #9#9'and card_time between @ICMINDATE  and @ICMAXDATE')
    Left = 112
    Top = 40
  end
  object spPost: TADOStoredProc
    ProcedureName = 'hrsp_ICCardImport'
    Parameters = <>
    Left = 112
    Top = 184
  end
end
