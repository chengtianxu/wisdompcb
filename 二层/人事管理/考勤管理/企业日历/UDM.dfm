object DM: TDM
  OldCreateOrder = False
  Left = 386
  Top = 183
  Height = 331
  Width = 456
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = FactoryCalendar
    Left = 144
    Top = 64
  end
  object FactoryCalendar: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'SELECT     rkey, CalendarID, RestDate, Type'
      'FROM         dbo.FactoryCalendar')
    Left = 224
    Top = 64
  end
  object FactoryCalendar_1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <
      item
        Name = 'rkeycal'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT     rkey, CalendarID, RestDate, Type'
      'FROM         dbo.FactoryCalendar'
      'Where rkey=:rkeycal')
    Left = 312
    Top = 64
  end
  object Resttypemsg: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'SELECT     rkey, resttype_name, color, remark'
      'FROM         dbo.Resttypemsg')
    Left = 224
    Top = 136
    object Resttypemsgrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Resttypemsgresttype_name: TWideStringField
      FieldName = 'resttype_name'
      Size = 50
    end
    object Resttypemsgcolor: TWideStringField
      FieldName = 'color'
      Size = 12
    end
    object Resttypemsgremark: TWideStringField
      FieldName = 'remark'
      Size = 50
    end
  end
end
