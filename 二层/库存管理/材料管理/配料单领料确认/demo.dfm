object DM: TDM
  OldCreateOrder = False
  Left = 380
  Top = 317
  Height = 327
  Width = 448
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
        Name = 'CUT_NO'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.data0492.rkey, dbo.data0492.CUT_NO, dbo.data0492.' +
        'ConfMan, employeemsg.chinesename, employeemsg.employeecode'
      'FROM       dbo.data0492 LEFT  JOIN'
      
        '           employeemsg ON dbo.data0492.ConfMan = employeemsg.emp' +
        'loyeecode'
      'where CUT_NO= :CUT_NO ')
    Left = 92
    Top = 80
    object ADOQuery1rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOQuery1CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1ConfMan: TWideStringField
      FieldName = 'ConfMan'
      Size = 10
    end
    object ADOQuery1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object ADOQuery1employeecode: TWideStringField
      FieldName = 'employeecode'
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
        Name = 'CUT_NO'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 12
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0468.CUT_NO,dbo.Data0468.QUAN_BOM,dbo.Data046' +
        '8.QUAN_ISSUED'
      ', dbo.Data0468.remark,dbo.Data0034.DEPT_NAME'
      'FROM       dbo.Data0468 LEFT OUTER JOIN'
      
        '           dbo.Data0034 ON dbo.Data0468.DEPT_PTR = dbo.Data0034.' +
        'RKEY'
      'WHERE      CUT_NO= :CUT_NO')
    Left = 96
    Top = 140
    object ADOQuery2CUT_NO: TStringField
      DisplayLabel = #37197#26009#21333#21495
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object ADOQuery2DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ADOQuery2QUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
    end
    object ADOQuery2QUAN_ISSUED: TFloatField
      FieldName = 'QUAN_ISSUED'
    end
    object ADOQuery2remark: TStringField
      FieldName = 'remark'
      Size = 500
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
  object Ado6: TADOQuery
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
      'select user_full_name,rkey'
      'from data0073'
      'where rkey = :rkey')
    Left = 260
    Top = 216
    object Ado6user_full_name: TStringField
      FieldName = 'user_full_name'
      Size = 30
    end
    object Ado6rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
  end
end
