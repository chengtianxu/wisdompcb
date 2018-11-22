object DM: TDM
  OldCreateOrder = False
  Left = 313
  Top = 237
  Height = 374
  Width = 527
  object ADOCon: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 54
    Top = 40
  end
  object ADOinvt_incept: TADOQuery
    Connection = ADOCon
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      'select * from invt_incept')
    Left = 56
    Top = 128
    object ADOinvt_inceptrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADOinvt_inceptGRN_NUMBER: TStringField
      DisplayLabel = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
    end
    object ADOinvt_inceptship_DATE: TDateTimeField
      DisplayLabel = #25910#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object ADOinvt_inceptDELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object ADOinvt_inceptPO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ADOinvt_inceptGROUP_DESC: TStringField
      DisplayLabel = #26448#26009#31867#22411
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ADOinvt_inceptINV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADOinvt_inceptINV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADOinvt_inceptINV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADOinvt_inceptUNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ADOinvt_inceptQUANTITY: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
      OnChange = ADOinvt_inceptQUANTITYChange
      Precision = 10
      Size = 2
    end
    object ADOinvt_inceptCODE: TStringField
      DisplayLabel = #20379#24212#21830#32534#30721
      FieldName = 'CODE'
      Size = 50
    end
    object ADOinvt_inceptABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ADOinvt_inceptEMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOinvt_inceptLOCATION: TStringField
      DisplayLabel = #20179#24211
      FieldName = 'LOCATION'
    end
    object ADOinvt_inceptWAREHOUSE_CODE: TStringField
      DisplayLabel = #25910#26009#24037#21378
      FieldName = 'WAREHOUSE_CODE'
      Size = 50
    end
    object ADOinvt_inceptincept_area: TFloatField
      DisplayLabel = #25509#25910#38754#31215
      FieldName = 'incept_area'
    end
    object ADOinvt_inceptincept_weight: TFloatField
      DisplayLabel = #25910#36135#37325#37327
      FieldName = 'incept_weight'
    end
    object ADOinvt_inceptunit_sq: TFloatField
      FieldName = 'unit_sq'
      OnChange = ADOinvt_inceptunit_sqChange
    end
    object ADOinvt_inceptunit_weight: TFloatField
      FieldName = 'unit_weight'
      OnChange = ADOinvt_inceptunit_weightChange
    end
  end
  object DS: TDataSource
    DataSet = ADOinvt_incept
    Left = 56
    Top = 192
  end
  object tmp: TADOQuery
    Connection = ADOCon
    Parameters = <>
    Left = 239
    Top = 92
  end
end
