object DM: TDM
  OldCreateOrder = False
  Left = 357
  Top = 221
  Height = 255
  Width = 306
  object ADOCnn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=WISDOMPCB_BAK;Data Source=172.1' +
      '6.68.8'
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 16
    Top = 7
  end
  object tmp: TADOQuery
    Connection = ADOCnn
    Parameters = <>
    Left = 136
    Top = 40
  end
end
