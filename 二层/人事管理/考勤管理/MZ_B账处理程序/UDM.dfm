object DM: TDM
  OldCreateOrder = False
  Left = 504
  Top = 356
  Height = 197
  Width = 220
  object qrytemp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 88
    Top = 80
  end
  object con1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=wisdompcb1077;Persist Security Info' +
      '=True;User ID=sa;Initial Catalog=demo2;Data Source=192.168.8.37;' +
      'Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096' +
      ';Workstation ID=HOME;Use Encryption for Data=False;Tag with colu' +
      'mn collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 40
    Top = 48
  end
end
