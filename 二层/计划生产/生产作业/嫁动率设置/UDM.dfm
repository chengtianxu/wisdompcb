object DM: TDM
  OldCreateOrder = False
  Left = 192
  Top = 130
  Height = 283
  Width = 600
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 
      'C:\Program Files\Common Files\System\Ole DB\Data Links\'#19996#33694'_172.18' +
      '.0.8.udl'
    Left = 112
    Top = 40
  end
  object qry_temp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 168
    Top = 80
  end
  object qry1: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      '  declare @TempTable table(IsSelected bit)      '
      '  insert @TempTable'
      '  values (0)'
      'select b. IsSelected,a.rkey,a.dept_code,a.dept_name'
      'from  data0034  a '
      ' join @TempTable b on 1=1')
    Left = 400
    Top = 112
    object blnfldqry1IsSelected: TBooleanField
      FieldName = 'IsSelected'
    end
    object atncfldqry1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object strngfldqry1dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object strngfldqry1dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
  end
end
