object dmSvrIntf: TdmSvrIntf
  OldCreateOrder = False
  Height = 271
  Width = 415
  object con1: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'Port=211'
      'HostName=127.0.0.1'
      'CommunicationProtocol=tcp/ip'
      'DSAuthenticationPassword=wisdomtopcb1077'
      'DSAuthenticationUser=admin'
      'DatasnapContext=datasnap/')
    Left = 48
    Top = 40
    UniqueId = '{8B53A41A-1576-4312-B872-70D12EF9AB98}'
  end
end
