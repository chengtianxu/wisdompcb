object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 451
  Top = 225
  Height = 322
  Width = 475
  object ADOCon: TADOConnection
    CommandTimeout = 180
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=wisdompcb_xinsheng;Data Source=' +
      '172.17.0.104'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 16
  end
  object Tmp1: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandTimeout = 180
    Parameters = <>
    Left = 200
    Top = 16
  end
  object Data01031: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Data0103 order by gl_acc_number')
    Left = 112
    Top = 72
  end
  object Data01032: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Data0103 order by gl_acc_number')
    Left = 112
    Top = 120
  end
  object Data01033: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Data0103 order by gl_acc_number')
    Left = 112
    Top = 168
  end
  object Data01034: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Data0103 order by gl_acc_number')
    Left = 112
    Top = 224
  end
  object Data01030: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Data0103 order by gl_acc_number')
    Left = 112
    Top = 24
  end
end
