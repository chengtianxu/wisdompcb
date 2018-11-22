object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 312
  Top = 292
  Height = 212
  Width = 692
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=koimy1234;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=Sample;Data Source=.'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 16
  end
  object DtAddList: TADODataSet
    Connection = ADOConnection1
    LockType = ltReadOnly
    Parameters = <>
    Left = 112
    Top = 8
  end
  object DtUsSysTableName: TADODataSet
    Connection = ADOConnection1
    CommandText = 'select * from UsSysTableName'
    Parameters = <>
    Left = 112
    Top = 64
  end
  object DtFrozCols: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from usSYS_FrozCols'
    Parameters = <>
    Left = 16
    Top = 64
  end
  object DtPrimaryCheck: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 224
    Top = 64
  end
  object DtIndexsQty: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 304
    Top = 64
  end
  object DtGetDate: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 272
    Top = 8
  end
  object DtData0014: TADODataSet
    Connection = ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0014 where 1=2'
    Parameters = <>
    Left = 433
    Top = 62
  end
  object DtData0314: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 416
    Top = 8
  end
  object DtData0844Last: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 614
    Top = 66
  end
  object Dtdata0845: TADODataSet
    Connection = ADOConnection1
    CommandText = 'select * from data0845'
    Parameters = <>
    Left = 614
    Top = 10
  end
  object DtData0844: TADODataSet
    Connection = ADOConnection1
    CommandText = 
      'select * from data0844 where TableName=:TableName and SEQ_NO='#13#10'(' +
      'select min(SEQ_NO) from data0844 where TableName=:TableName  and' +
      ' SEQ_NO>:SEQ_NO)'#13#10'and (User_ptr=:User_ptr) or (AgenUser_ptr=:Age' +
      'nUser_ptr)'
    Parameters = <
      item
        Name = 'TableName'
        Size = -1
        Value = Null
      end
      item
        Name = 'TableName'
        Size = -1
        Value = Null
      end
      item
        Name = 'SEQ_NO'
        Size = -1
        Value = Null
      end
      item
        Name = 'User_ptr'
        Size = -1
        Value = Null
      end
      item
        Name = 'AgenUser_ptr'
        Size = -1
        Value = Null
      end>
    Left = 552
    Top = 10
  end
  object DtData0005: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 16
    Top = 128
  end
  object DtData0843: TADODataSet
    Connection = ADOConnection1
    CommandText = 'select * from data0843'
    Parameters = <>
    Left = 552
    Top = 64
  end
  object DtData0849: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 552
    Top = 120
  end
  object DtData0849Last: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 624
    Top = 120
  end
  object cmdUpdate: TADOCommand
    Connection = ADOConnection1
    Parameters = <>
    Left = 344
    Top = 8
  end
  object Dtdata0828: TADODataSet
    Connection = ADOConnection1
    CommandText = 'select * from data0828'
    Parameters = <>
    Left = 440
    Top = 120
  end
  object DtSQLResultValue: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 376
    Top = 120
  end
  object DtData0073: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 368
    Top = 64
  end
  object DtUsFieldDispSet1: TADODataSet
    Connection = ADOConnection1
    CommandText = 'UsFieldDispSet1'
    CommandType = cmdStoredProc
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@TableName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@ProgName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@EMPLOYEE_PTR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end>
    Left = 104
    Top = 120
  end
  object spDtFieldSet: TADOStoredProc
    Connection = ADOConnection1
    CursorType = ctStatic
    ProcedureName = 'UsFieldDispSet;1'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = Null
      end
      item
        Name = '@TableName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 10
        Value = Null
      end
      item
        Name = '@ProgName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@CompName'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end
      item
        Name = '@EMPLOYEE_PTR'
        Attributes = [paNullable]
        DataType = ftString
        Size = 100
        Value = Null
      end>
    Left = 192
    Top = 8
  end
end
