object DM: TDM
  OldCreateOrder = False
  Left = 342
  Top = 220
  Height = 423
  Width = 506
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\Ole DB\Data Links' +
      '\08demo.udl'
    LoginPrompt = False
    Provider = 
      'C:\Program Files\Common Files\System\Ole DB\Data Links\08demo.ud' +
      'l'
    Left = 32
    Top = 32
  end
  object dtRead: TADODataSet
    Connection = ADOConnection1
    Parameters = <>
    Left = 288
    Top = 16
  end
  object AQ_employeemsg_extra: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select rkey,chinesename,employeecode,factoryarea,departmentname,' +
        'position,'
      'case sex when 0 then '#39#22899#39' when 1 then '#39#30007#39'  end sex,'
      'Province,  --'#31821#36143
      'birthday,--'#9#29983#26085
      'phone,--'#32852#31995#30005#35805
      'ondutytime from  employeemsg_extra ')
    Left = 48
    Top = 144
    object AQ_employeemsg_extrarkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
      Visible = False
    end
    object AQ_employeemsg_extraemployeecode: TWideStringField
      DisplayLabel = #38599#21592#20195#30721
      DisplayWidth = 10
      FieldName = 'employeecode'
    end
    object AQ_employeemsg_extrachinesename: TWideStringField
      DisplayLabel = #22995#21517
      DisplayWidth = 10
      FieldName = 'chinesename'
    end
    object AQ_employeemsg_extrafactoryarea: TWideStringField
      DisplayLabel = #21378#21306
      DisplayWidth = 15
      FieldName = 'factoryarea'
    end
    object AQ_employeemsg_extradepartmentname: TWideStringField
      DisplayLabel = #37096#38376
      DisplayWidth = 15
      FieldName = 'departmentname'
    end
    object AQ_employeemsg_extraposition: TWideStringField
      DisplayLabel = #32844#21153
      DisplayWidth = 10
      FieldName = 'position'
    end
    object AQ_employeemsg_extrasex: TStringField
      DisplayLabel = #24615#21035
      DisplayWidth = 4
      FieldName = 'sex'
      ReadOnly = True
      Size = 2
    end
    object AQ_employeemsg_extraondutytime: TWideStringField
      DisplayLabel = #20837#32844#26085#26399
      DisplayWidth = 11
      FieldName = 'ondutytime'
    end
    object AQ_employeemsg_extraProvince: TWideStringField
      DisplayLabel = #31821#36143
      FieldName = 'Province'
    end
    object AQ_employeemsg_extrabirthday: TWideStringField
      DisplayLabel = #29983#26085
      FieldName = 'birthday'
    end
    object AQ_employeemsg_extraphone: TWideStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'phone'
      Size = 50
    end
  end
  object qry_temp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 360
    Top = 16
  end
  object qry_Bedroomusemsg: TADOQuery
    Connection = ADOConnection1
    Parameters = <
      item
        Name = 'vbedid'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'select * from dbo.Bedroomusemsg where bedid=:vbedid')
    Left = 288
    Top = 120
  end
end
