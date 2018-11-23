object dmContainer: TdmContainer
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 414
  Width = 673
  object DSServer1: TDSServer
    Left = 64
    Top = 40
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 248
    Top = 40
  end
  object DSAuthenticationManager1: TDSAuthenticationManager
    Roles = <>
    Left = 240
    Top = 192
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    Port = 212
    MaxThreads = 200
    Server = DSServer1
    BufferKBSize = 64
    Filters = <>
    AuthenticationManager = DSAuthenticationManager1
    OnConnect = DSTCPServerTransport1Connect
    OnDisconnect = DSTCPServerTransport1Disconnect
    KeepAliveEnablement = kaEnabled
    Left = 64
    Top = 192
  end
  object FDManager1: TFDManager
    ConnectionDefFileName = 'DBCon.ini'
    SilentMode = True
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 528
    Top = 64
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 528
    Top = 144
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 528
    Top = 232
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 528
    Top = 312
  end
end
