object DM: TDM
  OldCreateOrder = False
  Left = 422
  Top = 155
  Height = 359
  Width = 385
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 72
  end
  object qry1: TADOQuery
    Connection = ADOConnection1
    LockType = ltBatchOptimistic
    Parameters = <>
    Left = 136
    Top = 72
  end
  object qry2: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 116
  end
  object qrytemp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 136
    Top = 168
  end
  object ds2: TDataSource
    DataSet = qry2
    Left = 176
    Top = 116
  end
  object ds1: TDataSource
    DataSet = qry1
    Left = 176
    Top = 72
  end
  object qrytemp1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 176
    Top = 168
  end
  object ADOTMP: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 304
    Top = 104
  end
  object ADOhideitem: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select employeecode,departmentname,chinesename,position_item,ond' +
      'utytime,f2,f79,f80, f2+f79-f80 as [f81] '#13#10'from v_employeemsg a j' +
      'oin employeebasicsalary b '#13#10'on a.rkey=b.employeeid'#13#10'where (statu' +
      's=1 or (outdutytime between dateadd(month,-2,getdate()) and date' +
      'add(day,1,getdate())))'
    Parameters = <>
    Left = 136
    Top = 240
    object ADOhideitememployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOhideitemdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object ADOhideitemchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOhideitemposition_item: TWideStringField
      FieldName = 'position_item'
      ReadOnly = True
    end
    object ADOhideitemondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object ADOhideitemf2: TBCDField
      FieldName = 'f2'
      Precision = 19
    end
    object ADOhideitemf79: TBCDField
      FieldName = 'f79'
      Precision = 19
    end
    object ADOhideitemf80: TBCDField
      FieldName = 'f80'
      Precision = 19
    end
    object ADOhideitemf81: TBCDField
      FieldName = 'f81'
      ReadOnly = True
      Precision = 19
    end
  end
  object ds3: TDataSource
    DataSet = ADOhideitem
    Left = 184
    Top = 240
  end
end
