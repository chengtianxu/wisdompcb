object dmSvrIntf: TdmSvrIntf
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 285
  Width = 402
  object con1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=192.168.8.33'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b')
    Left = 128
    Top = 104
    UniqueId = '{8340C715-2CB7-4BD3-91F0-256A661AEB7B}'
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 288
    Top = 40
  end
  object FDPhysDSDriverLink1: TFDPhysDSDriverLink
    Left = 280
    Top = 112
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 280
    Top = 184
  end
end
