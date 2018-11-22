object DM: TDM
  OldCreateOrder = False
  Left = 650
  Top = 220
  Height = 470
  Width = 732
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object DataSource_cx: TDataSource
    DataSet = ADOTMP
    Left = 128
    Top = 8
  end
  object ADOTMP: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 128
    Top = 64
  end
  object ADOTMP_DEL: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 208
    Top = 65
  end
  object adotmp2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Filter = 'price>=0'
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey, devid, dev_ip, devaddr, purpose, mealtype, posi' +
        'tion, price, departmentidstring, pbreakfast, plunch, psupper, pn' +
        'ysnack, pallowance'
      'FROM         dbo.dev_detail'
      'WHERE     (devaddr = '#39'local'#39') AND (purpose = '#39'm'#39') ')
    Left = 34
    Top = 74
  end
  object ds2: TDataSource
    DataSet = adotmp2
    Left = 41
    Top = 159
  end
end
