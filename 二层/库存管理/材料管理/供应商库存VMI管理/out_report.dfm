object Form_outreport: TForm_outreport
  Left = 200
  Top = 107
  Width = 639
  Height = 374
  Caption = 'Form_Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppDB149: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB149'
    Left = 232
    Top = 56
    object ppDB149ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 0
      Position = 0
    end
    object ppDB149ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'GON_PTR'
      FieldName = 'GON_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDB149ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'D0134_PTR'
      FieldName = 'D0134_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDB149ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'INVENTORY_PTR'
      FieldName = 'INVENTORY_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDB149ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 15
      Position = 4
    end
    object ppDB149ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'RTN_QUANTITY'
      FieldName = 'RTN_QUANTITY'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 15
      Position = 5
    end
    object ppDB149ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'tax_price'
      FieldName = 'tax_price'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 13
      Position = 6
    end
    object ppDB149ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAX_2'
      FieldName = 'TAX_2'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 5
      Position = 7
    end
    object ppDB149ppField9: TppField
      FieldAlias = 'supplier_name'
      FieldName = 'supplier_name'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object ppDB149ppField10: TppField
      FieldAlias = 'BILLING_ADDRESS_1'
      FieldName = 'BILLING_ADDRESS_1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object ppDB149ppField11: TppField
      FieldAlias = 'phone'
      FieldName = 'phone'
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object ppDB149ppField12: TppField
      FieldAlias = 'CONTACT_NAME_1'
      FieldName = 'CONTACT_NAME_1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppDB149ppField13: TppField
      FieldAlias = 'po_number'
      FieldName = 'po_number'
      FieldLength = 15
      DisplayWidth = 15
      Position = 12
    end
    object ppDB149ppField14: TppField
      FieldAlias = 'grn_number'
      FieldName = 'grn_number'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object ppDB149ppField15: TppField
      FieldAlias = 'PO_DATE'
      FieldName = 'PO_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object ppDB149ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'quan_ord'
      FieldName = 'quan_ord'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppDB149ppField17: TppField
      FieldAlias = 'unit_name'
      FieldName = 'unit_name'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object ppDB149ppField18: TppField
      FieldAlias = 'inv_part_number'
      FieldName = 'inv_part_number'
      FieldLength = 25
      DisplayWidth = 25
      Position = 17
    end
    object ppDB149ppField19: TppField
      FieldAlias = 'inv_part_description'
      FieldName = 'inv_part_description'
      FieldLength = 100
      DisplayWidth = 100
      Position = 18
    end
    object ppDB149ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'quantity_1'
      FieldName = 'quantity_1'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 20
      Position = 19
    end
    object ppDB149ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'tax_price_1'
      FieldName = 'tax_price_1'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 13
      Position = 20
    end
    object ppDB149ppField22: TppField
      FieldAlias = 'create_date'
      FieldName = 'create_date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object ppDB149ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = #36864#36135#37329#39069
      FieldName = #36864#36135#37329#39069
      FieldLength = 7
      DataType = dtDouble
      DisplayWidth = 28
      Position = 22
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB149
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 139000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 150
    SaveAsTemplate = True
    Template.FileName = 'D:\SJSYS\NIERP\Report\wzpr133.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    PreviewFormSettings.ZoomPercentage = 125
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 360
    Top = 136
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB149'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 94456
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 5800
        mmLeft = 71755
        mmTop = 1588
        mmWidth = 59690
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #20379#24212#21830'VMI'#36864#36135#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 90488
        mmTop = 9260
        mmWidth = 27517
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'supplier_name'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42333
        mmTop = 17992
        mmWidth = 23220
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20379#24212#21830#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 26723
        mmTop = 18256
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #32852#31995#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 26723
        mmTop = 23813
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #30005#35805#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30427
        mmTop = 30163
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #22320#22336#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 36513
        mmWidth = 10583
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 4233
        mmLeft = 0
        mmTop = 41804
        mmWidth = 203300
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #37319#36141#35746#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 20108
        mmTop = 43392
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #25910#36135#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 83608
        mmTop = 43127
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #37319#36141#35746#21333#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 16669
        mmTop = 50006
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #35746#21333#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24077
        mmTop = 56621
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #35746#36141#21333#20301#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 83873
        mmTop = 50006
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #26448#26009#20195#30721#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24077
        mmTop = 63500
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #31246#29575'%'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 87842
        mmTop = 55827
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #26448#26009#21517#31216#35268#26684#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 16404
        mmTop = 70115
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #25509#25910#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24077
        mmTop = 76465
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #25509#25910#21333#20215#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 84138
        mmTop = 63236
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #25910#36135#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24342
        mmTop = 83344
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #36864#36135#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24342
        mmTop = 89165
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #36864#36135#37329#39069#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 84402
        mmTop = 89165
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CONTACT_NAME_1'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42333
        mmTop = 24077
        mmWidth = 33211
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'phone'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42333
        mmTop = 30163
        mmWidth = 9843
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'BILLING_ADDRESS_1'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42333
        mmTop = 36513
        mmWidth = 36534
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'po_number'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42598
        mmTop = 43392
        mmWidth = 17907
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'grn_number'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 43127
        mmWidth = 19092
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'PO_DATE'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42598
        mmTop = 50006
        mmWidth = 16489
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'unit_name'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 49742
        mmWidth = 16510
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'quan_ord'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42598
        mmTop = 56621
        mmWidth = 14965
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'TAX_2'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 102659
        mmTop = 55827
        mmWidth = 10795
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'inv_part_number'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42598
        mmTop = 63236
        mmWidth = 26543
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'tax_price'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 102923
        mmTop = 63236
        mmWidth = 14351
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'inv_part_description'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42863
        mmTop = 70644
        mmWidth = 31665
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'quantity_1'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42598
        mmTop = 76994
        mmWidth = 16298
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'create_date'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42598
        mmTop = 83608
        mmWidth = 18690
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'RTN_QUANTITY'
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 42863
        mmTop = 89334
        mmWidth = 27115
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = #36864#36135#37329#39069
        DataPipeline = ppDB149
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB149'
        mmHeight = 4064
        mmLeft = 103452
        mmTop = 89165
        mmWidth = 14224
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 15610
        mmLeft = 16669
        mmTop = 1323
        mmWidth = 25517
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #25171#21360#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 113771
        mmTop = 17463
        mmWidth = 17780
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 132821
        mmTop = 17463
        mmWidth = 17992
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3704
        mmLeft = 0
        mmTop = 90752
        mmWidth = 203300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #22791#27880#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 31485
        mmTop = 0
        mmWidth = 10583
        BandType = 8
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'ref_number'
        DataPipeline = ppDB724
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB724'
        mmHeight = 4064
        mmLeft = 43127
        mmTop = 0
        mmWidth = 18098
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO149
    Left = 96
    Top = 72
  end
  object ADO149: TADOQuery
    Active = True
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey724'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0149.* ,data0023.supplier_name,data0023.BILLING_ADDRE' +
        'SS_1,data0023.phone,data0023.CONTACT_NAME_1,'
      
        'data0070.po_number,data0133.grn_number,data0070.PO_DATE,data0071' +
        '.quan_ord,data0002.unit_name,'
      
        'data0017.inv_part_number,data0017.inv_part_description,data0134.' +
        'quantity,data0134.tax_price,'
      
        'data0133.create_date,data0149.rtn_quantity*data0149.tax_price as' +
        ' '#36864#36135#37329#39069
      'from data0149'
      'inner join data0017 on data0149.inventory_ptr=data0017.rkey'
      'inner join data0724 on data0149.gon_ptr=data0724.rkey '
      'inner join data0023 on data0724.supplier_ptr=data0023.rkey'
      'inner join data0134 on data0149.d0134_ptr=data0134.rkey  '
      'inner join data0133 on data0134.grn_ptr=data0133.rkey'
      'inner join data0002 on data0134.unit_ptr=data0002.rkey'
      'left join data0070 on data0133.po_ptr=data0070.rkey'
      'inner join data0071 on data0071.po_ptr=data0070.rkey'
      'where data0724.ttype=0 and data0724.rkey=:rkey724')
    Left = 152
    Top = 72
    object ADO149RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO149GON_PTR: TIntegerField
      FieldName = 'GON_PTR'
    end
    object ADO149D0134_PTR: TIntegerField
      FieldName = 'D0134_PTR'
    end
    object ADO149INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ADO149QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 14
    end
    object ADO149RTN_QUANTITY: TBCDField
      FieldName = 'RTN_QUANTITY'
      Precision = 14
    end
    object ADO149tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 12
      Size = 3
    end
    object ADO149TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO149supplier_name: TStringField
      FieldName = 'supplier_name'
      Size = 100
    end
    object ADO149BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADO149phone: TStringField
      FieldName = 'phone'
    end
    object ADO149CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
    end
    object ADO149po_number: TStringField
      FieldName = 'po_number'
      Size = 15
    end
    object ADO149grn_number: TStringField
      FieldName = 'grn_number'
      Size = 10
    end
    object ADO149PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADO149quan_ord: TFloatField
      FieldName = 'quan_ord'
    end
    object ADO149unit_name: TStringField
      FieldName = 'unit_name'
    end
    object ADO149inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADO149inv_part_description: TStringField
      FieldName = 'inv_part_description'
      ReadOnly = True
      Size = 100
    end
    object ADO149quantity_1: TBCDField
      FieldName = 'quantity_1'
      Precision = 19
    end
    object ADO149tax_price_1: TBCDField
      FieldName = 'tax_price_1'
      Precision = 12
      Size = 3
    end
    object ADO149create_date: TDateTimeField
      FieldName = 'create_date'
    end
    object ADO149DSDesigner: TBCDField
      FieldName = #36864#36135#37329#39069
      ReadOnly = True
      Precision = 27
      Size = 7
    end
  end
  object ADO493: TADOQuery
    Active = True
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 160
    Top = 128
    object ADO493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADO493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ADO493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ADO493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ADO493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ADO493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ADO493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO493
    Left = 104
    Top = 128
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB493'
    Left = 256
    Top = 128
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object ppDB724: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB724'
    Left = 248
    Top = 208
    object ppDB724ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDB724ppField2: TppField
      FieldAlias = 'gon_number'
      FieldName = 'gon_number'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDB724ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'ttype'
      FieldName = 'ttype'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDB724ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'status'
      FieldName = 'status'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 3
    end
    object ppDB724ppField5: TppField
      FieldAlias = 'stype'
      FieldName = 'stype'
      FieldLength = 8
      DisplayWidth = 8
      Position = 4
    end
    object ppDB724ppField6: TppField
      FieldAlias = 'sstatus'
      FieldName = 'sstatus'
      FieldLength = 6
      DisplayWidth = 6
      Position = 5
    end
    object ppDB724ppField7: TppField
      FieldAlias = 'create_date'
      FieldName = 'create_date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object ppDB724ppField8: TppField
      FieldAlias = 'ref_number'
      FieldName = 'ref_number'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB724ppField9: TppField
      FieldAlias = 'warehouse_code'
      FieldName = 'warehouse_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 8
    end
    object ppDB724ppField10: TppField
      FieldAlias = 'warehouse_name'
      FieldName = 'warehouse_name'
      FieldLength = 70
      DisplayWidth = 70
      Position = 9
    end
    object ppDB724ppField11: TppField
      FieldAlias = 'employee_name'
      FieldName = 'employee_name'
      FieldLength = 16
      DisplayWidth = 16
      Position = 10
    end
    object ppDB724ppField12: TppField
      FieldAlias = 'employee_name_1'
      FieldName = 'employee_name_1'
      FieldLength = 16
      DisplayWidth = 16
      Position = 11
    end
    object ppDB724ppField13: TppField
      FieldAlias = 'code'
      FieldName = 'code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppDB724ppField14: TppField
      FieldAlias = 'supplier_name'
      FieldName = 'supplier_name'
      FieldLength = 100
      DisplayWidth = 100
      Position = 13
    end
  end
  object DataSource3: TDataSource
    DataSet = Form_Audit.ADS148
    Left = 144
    Top = 224
  end
  object ppDesigner1: TppDesigner
    AllowDataSettingsChange = True
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 408
    Top = 216
  end
end
