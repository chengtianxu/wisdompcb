object DM: TDM
  OldCreateOrder = False
  Left = 387
  Top = 294
  Height = 327
  Width = 498
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 92
    Top = 16
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'number'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number,dbo.data0005.E' +
        'MPLOYEE_NAME,'
      
        ' dbo.DATA0268.DATE,  employeemsg.chinesename, employeemsg.employ' +
        'eecode, dbo.Data0034.DEPT_NAME, dbo.DATA0268.EMPL_PTR, '
      '                      dbo.DATA0268.ConfMan'
      'FROM         dbo.DATA0268 INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.DATA0268.dept_ptr = db' +
        'o.Data0034.RKEY LEFT OUTER JOIN'
      
        '                      employeemsg ON dbo.DATA0268.ConfMan = empl' +
        'oyeemsg.employeecode'
      
        '                      inner join dbo.data0005 on dbo.DATA0268.EM' +
        'PL_PTR = data0005.rkey'
      ''
      ' '
      'where number = :number '
      '')
    Left = 92
    Top = 80
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1number: TStringField
      DisplayLabel = #39046#26009#21333#21495
      FieldName = 'number'
      Size = 10
    end
    object ADOQuery1DATE: TDateTimeField
      DisplayLabel = #30003#35831#26102#38388
      FieldName = 'DATE'
    end
    object ADOQuery1DEPT_NAME: TStringField
      DisplayLabel = #37096#38376
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery1EMPL_PTR: TIntegerField
      FieldName = 'EMPL_PTR'
    end
    object ADOQuery1ConfMan: TStringField
      DisplayLabel = #39046#26009#21592#24037#24037#21495
      FieldName = 'ConfMan'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOQuery1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 160
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 164
    Top = 140
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'FLOW_NO'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0468.FLOW_NO, dbo.Data0468.CUT_NO AS Expr1, d' +
        'bo.Data0468.QUAN_ISSUED AS Expr2, dbo.Data0468.quan_alloc, dbo.D' +
        'ata0468.remark'
      'FROM         dbo.Data0468 INNER JOIN'
      
        '                      dbo.DATA0268 ON dbo.Data0468.FLOW_NO = dbo' +
        '.DATA0268.rkey'
      ''
      'where FLOW_NO = :FLOW_NO'
      '')
    Left = 96
    Top = 140
    object ADOQuery2Expr1: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'Expr1'
      FixedChar = True
      Size = 12
    end
    object ADOQuery2Expr2: TFloatField
      DisplayLabel = #24050#21457#25918#25968#37327
      FieldName = 'Expr2'
    end
    object ADOQuery2quan_alloc: TBCDField
      DisplayLabel = #24050#20998#37197#25968#37327
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object ADOQuery2remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 500
    end
    object ADOQuery2FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 96
    Top = 216
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 168
    Top = 208
  end
  object ADOQuery4: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'number'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.DATA0268.number AS nld, dbo.Data0005.EMPL_CODE AS' +
        ' zdrrgh, dbo.Data0005.EMPLOYEE_NAME AS zdrrxm, Data0005_1.EMPLOY' +
        'EE_NAME AS nldsqrr, '
      
        '                      Data0005_1.EMPL_CODE AS nldsqgh, dbo.DATA0' +
        '268.Pman_ptr, dbo.DATA0268.ConfMan'
      'FROM         dbo.Data0005 AS Data0005_1 INNER JOIN'
      
        '                      dbo.DATA0268 ON Data0005_1.RKEY = dbo.DATA' +
        '0268.EMPL_PTR LEFT OUTER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0268.Pman_ptr = db' +
        'o.Data0005.RKEY'
      'WHERE   number= :number'
      ''
      ''
      ''
      ''
      '')
    Left = 252
    Top = 80
    object ADOQuery4nld: TStringField
      FieldName = 'nld'
      Size = 10
    end
    object ADOQuery4zdrrgh: TStringField
      FieldName = 'zdrrgh'
      Size = 10
    end
    object ADOQuery4zdrrxm: TStringField
      FieldName = 'zdrrxm'
      Size = 16
    end
    object ADOQuery4nldsqrr: TStringField
      FieldName = 'nldsqrr'
      Size = 16
    end
    object ADOQuery4nldsqgh: TStringField
      FieldName = 'nldsqgh'
      Size = 10
    end
    object ADOQuery4Pman_ptr: TIntegerField
      FieldName = 'Pman_ptr'
    end
    object ADOQuery4ConfMan: TStringField
      FieldName = 'ConfMan'
      FixedChar = True
      Size = 10
    end
  end
  object ADOQuery5: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ICCardno'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 20
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     ICCardno, employeecode, chinesename'
      'FROM         dbo.employeemsg'
      'where ICCardno= :ICCardno')
    Left = 252
    Top = 140
    object ADOQuery5ICCardno: TWideStringField
      FieldName = 'ICCardno'
      FixedChar = True
    end
    object ADOQuery5employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object ADOQuery5chinesename: TWideStringField
      FieldName = 'chinesename'
    end
  end
  object ADO6: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     USER_FULL_NAME, RKEY'
      'FROM         dbo.Data0073'
      'where rkey = :rkey')
    Left = 248
    Top = 204
    object ADO6USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADO6RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
  end
end
