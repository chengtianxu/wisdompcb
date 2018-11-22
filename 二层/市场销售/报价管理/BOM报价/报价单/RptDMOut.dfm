object dmRptOut: TdmRptOut
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 482
  Width = 621
  object cdsBP06: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 72
  end
  object cdsBP10: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 128
    object strngfldBP10PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
    object strngfldBP10Param_Value: TStringField
      FieldName = 'Param_Value'
      Size = 255
    end
    object strngfldBP10unit_code: TStringField
      FieldName = 'unit_code'
      Size = 50
    end
    object strngfldBP10PARAMETER_Name: TStringField
      FieldName = 'PARAMETER_Name'
      Size = 50
    end
  end
  object cdsOther: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 240
    object strngfldOtherShipTo: TStringField
      FieldName = 'ShipTo'
      Size = 100
    end
  end
  object cdsBP09: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 79
    Top = 191
  end
end
