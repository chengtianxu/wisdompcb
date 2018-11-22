object dm1: Tdm1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 357
  Width = 517
  object cdsSvrEng: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsSvrEngIndex1'
        Fields = 'Handle'
      end>
    IndexName = 'cdsSvrEngIndex1'
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 56
    object strngfldSvrEngEngName: TStringField
      FieldName = 'EngName'
    end
    object lrgntfldSvrEngCallCount: TLargeintField
      FieldName = 'AllCallCount'
    end
    object intgrfldSvrEngIntfGetDataBySql: TIntegerField
      FieldName = 'IntfGetDataBySql'
    end
    object intgrfldSvrEngIntfPostDataByTable: TIntegerField
      FieldName = 'IntfPostDataByTable'
    end
    object intgrfldSvrEngIntfGetDataBySqlArr: TIntegerField
      FieldName = 'IntfGetDataBySqlArr'
    end
    object intgrfldSvrEngIntfPostDataBySqlArr: TIntegerField
      FieldName = 'IntfPostDataBySqlArr'
    end
    object intgrfldSvrEngIntfPostModData: TIntegerField
      FieldName = 'IntfPostModData'
    end
    object intgrfldSvrEngIntfspGetDataByID: TIntegerField
      FieldName = 'IntfspGetData'
    end
    object intgrfldSvrEngIntfspExecByID: TIntegerField
      FieldName = 'IntfspExec'
    end
    object intgrfldSvrEngHandle: TIntegerField
      FieldName = 'Handle'
    end
  end
  object dsSvrEng: TDataSource
    DataSet = cdsSvrEng
    Left = 144
    Top = 56
  end
  object cdsUser: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsUserIndex1'
        Fields = 'PConObj'
      end>
    IndexName = 'cdsUserIndex1'
    Params = <>
    StoreDefs = True
    Left = 72
    Top = 136
    object intgrfldUserPConObj: TIntegerField
      FieldName = 'PConObj'
    end
    object strngfldUserIP: TStringField
      FieldName = 'IP'
      Size = 50
    end
    object intgrfldUserPort: TIntegerField
      FieldName = 'Port'
    end
    object strngfldUserProtocol: TStringField
      FieldName = 'Protocol'
      Size = 50
    end
    object dtmfldUserConTime: TDateTimeField
      FieldName = 'ConTime'
    end
    object cdsUserAlive: TBooleanField
      FieldName = 'Alive'
    end
  end
  object dsUser: TDataSource
    DataSet = cdsUser
    Left = 144
    Top = 136
  end
end
