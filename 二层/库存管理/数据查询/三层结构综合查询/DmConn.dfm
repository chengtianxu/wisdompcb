object pdmConn: TpdmConn
  OldCreateOrder = False
  Left = 339
  Top = 224
  Height = 176
  Width = 279
  object SocketConnection1: TSocketConnection
    SupportCallbacks = False
    ObjectBroker = SimpleObjectBroker1
    Left = 40
    Top = 8
  end
  object SimpleObjectBroker1: TSimpleObjectBroker
    LoadBalanced = True
    Left = 136
    Top = 8
  end
end
