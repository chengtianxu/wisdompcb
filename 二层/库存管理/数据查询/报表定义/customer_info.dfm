object Form4: TForm4
  Left = 236
  Top = 111
  Width = 382
  Height = 354
  Caption = #23458#25143#21672#35810#35843#26597#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 120
    Top = 89
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB10
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\customer_info.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 82
    Top = 144
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB10'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #23458#25143#21672#20449#35843#26597#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 76994
        mmTop = 14023
        mmWidth = 29633
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3246
        mmLeft = 164571
        mmTop = 8467
        mmWidth = 25894
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #25171#21360#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3246
        mmLeft = 150813
        mmTop = 8467
        mmWidth = 12065
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #25253#34920#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3246
        mmLeft = 150548
        mmTop = 14552
        mmWidth = 12065
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #20869#37096#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3246
        mmLeft = 150284
        mmTop = 19844
        mmWidth = 12065
        BandType = 1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 7408
        mmLeft = 52123
        mmTop = 3175
        mmWidth = 83344
        BandType = 1
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
        mmHeight = 13229
        mmLeft = 8996
        mmTop = 1058
        mmWidth = 17727
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 91546
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppDB09: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB09'
    Left = 122
    Top = 127
    object ppDB09ppField1: TppField
      FieldAlias = #38144#21806#20195#34920#20195#30721
      FieldName = 'REP_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB09ppField2: TppField
      FieldAlias = #38144#21806#20195#34920#22995#21517
      FieldName = 'SALES_REP_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object ppDB10: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB10'
    Left = 122
    Top = 159
    object ppDB10ppField2: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField3: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField4: TppField
      FieldAlias = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField5: TppField
      FieldAlias = #22320#22336
      FieldName = 'BILLING_ADDRESS_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField6: TppField
      FieldAlias = #32593#22336
      FieldName = 'BILLING_ADDRESS_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField7: TppField
      FieldAlias = #27861#20154#20195#34920
      FieldName = 'BILLING_ADDRESS_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField8: TppField
      FieldAlias = #30465#20221
      FieldName = 'STATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField9: TppField
      FieldAlias = #37038#32534
      FieldName = 'ZIP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField10: TppField
      FieldAlias = #30005#35805
      FieldName = 'PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField11: TppField
      FieldAlias = #20256#30495
      FieldName = 'FAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField12: TppField
      FieldAlias = #32593#19978#32534#21495
      FieldName = 'TELEX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField15: TppField
      FieldAlias = #19994#21153#32852#31995#20154
      FieldName = 'CONTACT_NAME_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField16: TppField
      FieldAlias = #24037#31243#32852#31995#20154
      FieldName = 'CONTACT_NAME_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField17: TppField
      FieldAlias = #21697#31649#32852#31995#20154
      FieldName = 'CONTACT_NAME_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField18: TppField
      FieldAlias = #36130#21153#32852#31995#20154
      FieldName = 'CONTACT_NAME_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField19: TppField
      FieldAlias = #25253#20851#32852#31995#20154
      FieldName = 'CONTACT_NAME_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField20: TppField
      FieldAlias = 'IQC '#32852#31995#20154
      FieldName = 'CONTACT_NAME_6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField21: TppField
      FieldAlias = #19994#21153#32852#31995#30005#35805
      FieldName = 'CONT_PHONE_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField22: TppField
      FieldAlias = #24037#31243#32852#31995#30005#35805
      FieldName = 'CONT_PHONE_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField23: TppField
      FieldAlias = #21697#36136#32852#31995#30005#35805
      FieldName = 'CONT_PHONE_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField24: TppField
      FieldAlias = #36130#21153#32852#31995#30005#35805
      FieldName = 'CONT_PHONE_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField25: TppField
      FieldAlias = #25253#20851#32852#31995#30005#35805
      FieldName = 'CONT_PHONE_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField26: TppField
      FieldAlias = 'IQC '#32852#31995#30005#35805
      FieldName = 'CONT_PHONE_6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField27: TppField
      FieldAlias = #20184#27454#26041#27861
      FieldName = 'FED_TAX_ID_NO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField28: TppField
      FieldAlias = #26684#24335#25991#20214
      FieldName = 'COFC_FILENAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField29: TppField
      FieldAlias = #36135#21040#20184#27454
      FieldName = 'COD_FLAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField31: TppField
      FieldAlias = #29616#37329#25240#25187'%'
      FieldName = 'DISCOUNT_PCT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField32: TppField
      FieldAlias = #26368#39640#20313#27454
      FieldName = 'HIGH_BALANCE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField33: TppField
      FieldAlias = #20449#29992#38480#39069
      FieldName = 'CREDIT_LIMIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField37: TppField
      FieldAlias = #25240#25187#22825#25968
      FieldName = 'DISCOUNT_DAYS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField39: TppField
      FieldAlias = #20928#20184#27454#22825#25968
      FieldName = 'NET_PAY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField40: TppField
      FieldAlias = #25104#31435#26085#26399
      FieldName = 'LAST_ACTIVE_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField42: TppField
      FieldAlias = #23458#25143#21517#31216'('#33521#25991')'
      FieldName = 'BILLING_ADDRESS_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField46: TppField
      FieldAlias = #21407#20379#24212#21830
      FieldName = 'OUTGOING_FORM_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField47: TppField
      FieldAlias = #20225#19994#24615#36136
      FieldName = 'OUTGOING_FORM_ADDR1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField48: TppField
      FieldAlias = #27861#20154#30005#35805
      FieldName = 'OUTGOING_FORM_ADDR2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField49: TppField
      FieldAlias = #27861#20154#25163#26426
      FieldName = 'OUTGOING_FORM_ADDR3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField50: TppField
      FieldAlias = #20998#26512#20195#30721'1'
      FieldName = 'ANALYSIS_CODE1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField51: TppField
      FieldAlias = #20998#26512#20195#30721'2'
      FieldName = 'ANALYSIS_CODE2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField52: TppField
      FieldAlias = #20998#26512#20195#30721'3'
      FieldName = 'ANALYSIS_CODE3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField53: TppField
      FieldAlias = #24320#22987#21512#20316#26085#26399
      FieldName = 'CUST_ENT_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField54: TppField
      FieldAlias = #20027#35201#20135#21697
      FieldName = 'EDI_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField57: TppField
      FieldAlias = #32467#24080#26085
      FieldName = 'EDI_FLAG_CREDIT_MEMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField58: TppField
      FieldAlias = #30005#23376#37038#20214
      FieldName = 'GEN_EMAIL_ADDRESS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField59: TppField
      FieldAlias = #19994#21153#32852#31995#37038#20214
      FieldName = 'EMAIL_FOR_CONTACT1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField60: TppField
      FieldAlias = #24037#31243#32852#31995#37038#20214
      FieldName = 'EMAIL_FOR_CONTACT2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField61: TppField
      FieldAlias = #21697#36136#32852#31995#37038#20214
      FieldName = 'EMAIL_FOR_CONTACT3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField62: TppField
      FieldAlias = #36130#21153#32852#31995#37038#20214
      FieldName = 'EMAIL_FOR_CONTACT4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField63: TppField
      FieldAlias = #25253#20851#32852#31995#37038#20214
      FieldName = 'EMAIL_FOR_CONTACT5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField64: TppField
      FieldAlias = 'IQC '#32852#31995#37038#20214
      FieldName = 'EMAIL_FOR_CONTACT6'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField72: TppField
      FieldAlias = #35745#21010#25552#21069#22825#25968
      FieldName = 'DAYS_EARLY_SCHEDULE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField76: TppField
      FieldAlias = #21592#24037#20154#25968
      FieldName = 'SMOOTHING_THRESHOLD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField77: TppField
      FieldAlias = #20998#26512#20195#30721'4'
      FieldName = 'ANALYSIS_CODE4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField78: TppField
      FieldAlias = #20998#26512#20195#30721'5'
      FieldName = 'ANALYSIS_CODE5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField90: TppField
      FieldAlias = #25253#20215#25215#21463#33021#21147'%'
      FieldName = 'quote_factor'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField91: TppField
      FieldAlias = #19994#21153#21592#35780#35821
      FieldName = 'REP_EVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField92: TppField
      FieldAlias = #24066#22330#37096#35780#35821
      FieldName = 'MAK_EVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField93: TppField
      FieldAlias = #36130#21153#37096#35780#35821
      FieldName = 'FIN_EVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField94: TppField
      FieldAlias = #24635#32463#29702#35780#35821
      FieldName = 'MARMANG_EVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField95: TppField
      FieldAlias = #19994#21153#21592#20449#29992#39069
      FieldName = 'REP_CREDIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField96: TppField
      FieldAlias = #24066#22330#37096#20449#29992#39069
      FieldName = 'MAK_CREDIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField97: TppField
      FieldAlias = #36130#21153#37096#20449#29992#39069
      FieldName = 'FIN_CREDIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField98: TppField
      FieldAlias = #24635#32463#29702#20449#29992#39069
      FieldName = 'MARMANG_CREDIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField99: TppField
      FieldAlias = #19994#21153#21592#26368#39640#27424#27454
      FieldName = 'REP_HIGH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField100: TppField
      FieldAlias = #24066#22330#37096#26368#39640#27424#27454
      FieldName = 'MAK_HIGH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField101: TppField
      FieldAlias = #36130#21153#37096#26368#39640#27424#27454
      FieldName = 'FIN_HIGH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField102: TppField
      FieldAlias = #24635#32463#29702#26368#39640#27424#27454
      FieldName = 'MARMANG_HIGH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField103: TppField
      FieldAlias = #19994#21153#21592#31614#21517
      FieldName = 'REP_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField104: TppField
      FieldAlias = #24066#22330#37096#31614#21517
      FieldName = 'MAK_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField105: TppField
      FieldAlias = #36130#21153#37096#31614#21517
      FieldName = 'FIN_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField106: TppField
      FieldAlias = #24635#32463#29702#31614#21517
      FieldName = 'MARMANG_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField107: TppField
      FieldAlias = #19994#21153#21592#26085#26399
      FieldName = 'REP_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField108: TppField
      FieldAlias = #24066#22330#37096#26085#26399
      FieldName = 'MAK_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField109: TppField
      FieldAlias = #36130#21153#37096#26085#26399
      FieldName = 'FIN_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField110: TppField
      FieldAlias = #24635#32463#29702#26085#26399
      FieldName = 'MARMANG_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 74
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField111: TppField
      FieldAlias = #21378#25151#36164#20135
      FieldName = 'HOUSE_FIXED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 75
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField112: TppField
      FieldAlias = #22266#23450#36164#20135#35268#27169
      FieldName = 'FIXED_SCOPE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 76
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField113: TppField
      FieldAlias = #38144#21806#25317#37329'%'
      FieldName = 'SALES_DISCOUNT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 77
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField114: TppField
      FieldAlias = #26376#38144#21806#39069
      FieldName = 'MONTH_AMOUNT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 78
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField115: TppField
      FieldAlias = 'PCB'#26376#29992#37327
      FieldName = 'MONTH_PCBAMOUNT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 79
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField116: TppField
      FieldAlias = #27880#20876#36164#37329
      FieldName = 'CAPITAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 80
      Searchable = False
      Sortable = False
    end
    object ppDB10ppField1: TppField
      FieldAlias = #26159#21542#36716#21378
      FieldName = #26159#21542#36716#21378
      FieldLength = 10
      DisplayWidth = 10
      Position = 81
    end
    object ppDB10ppField13: TppField
      FieldAlias = #26159#21542#21547#31246
      FieldName = #26159#21542#21547#31246
      FieldLength = 10
      DisplayWidth = 10
      Position = 82
    end
    object ppDB10ppField14: TppField
      FieldAlias = #29366#24577
      FieldName = #29366#24577
      FieldLength = 10
      DisplayWidth = 10
      Position = 83
    end
    object ppDB10ppField30: TppField
      FieldAlias = #20449#29992#31561#32423
      FieldName = #20449#29992#31561#32423
      FieldLength = 10
      DisplayWidth = 10
      Position = 84
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 157
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = ADO09
    Left = 156
    Top = 128
  end
  object ADO09: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'SALES_REP_PTR'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT REP_CODE,SALES_REP_NAME'
      'from data0009'
      'where rkey=:SALES_REP_PTR')
    Left = 191
    Top = 127
    object ADO09REP_CODE: TStringField
      FieldName = 'REP_CODE'
      Size = 5
    end
    object ADO09SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
  end
  object ADOTable1: TADOTable
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltPessimistic
    IndexFieldNames = 'cust_code'
    TableName = 'Data0010'
    Left = 192
    Top = 159
    object ADOTable1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOTable1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOTable1CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOTable1ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADOTable1BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object ADOTable1BILLING_ADDRESS_2: TStringField
      FieldName = 'BILLING_ADDRESS_2'
      Size = 50
    end
    object ADOTable1BILLING_ADDRESS_3: TStringField
      FieldName = 'BILLING_ADDRESS_3'
      Size = 30
    end
    object ADOTable1STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object ADOTable1ZIP: TStringField
      FieldName = 'ZIP'
      FixedChar = True
      Size = 10
    end
    object ADOTable1PHONE: TStringField
      FieldName = 'PHONE'
      FixedChar = True
    end
    object ADOTable1FAX: TStringField
      FieldName = 'FAX'
      FixedChar = True
    end
    object ADOTable1TELEX: TStringField
      FieldName = 'TELEX'
    end
    object ADOTable1SALES_REP_PTR: TIntegerField
      FieldName = 'SALES_REP_PTR'
    end
    object ADOTable1CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object ADOTable1CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_2: TStringField
      FieldName = 'CONTACT_NAME_2'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_3: TStringField
      FieldName = 'CONTACT_NAME_3'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_4: TStringField
      FieldName = 'CONTACT_NAME_4'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_5: TStringField
      FieldName = 'CONTACT_NAME_5'
      FixedChar = True
    end
    object ADOTable1CONTACT_NAME_6: TStringField
      FieldName = 'CONTACT_NAME_6'
      FixedChar = True
    end
    object ADOTable1CONT_PHONE_1: TStringField
      FieldName = 'CONT_PHONE_1'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_2: TStringField
      FieldName = 'CONT_PHONE_2'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_3: TStringField
      FieldName = 'CONT_PHONE_3'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_4: TStringField
      FieldName = 'CONT_PHONE_4'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_5: TStringField
      FieldName = 'CONT_PHONE_5'
      FixedChar = True
      Size = 14
    end
    object ADOTable1CONT_PHONE_6: TStringField
      FieldName = 'CONT_PHONE_6'
      FixedChar = True
      Size = 14
    end
    object ADOTable1FED_TAX_ID_NO: TStringField
      FieldName = 'FED_TAX_ID_NO'
      FixedChar = True
    end
    object ADOTable1COFC_FILENAME: TStringField
      FieldName = 'COFC_FILENAME'
      FixedChar = True
      Size = 15
    end
    object ADOTable1COD_FLAG: TStringField
      FieldName = 'COD_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOTable1REG_TAX_FIXED_UNUSED: TStringField
      FieldName = 'REG_TAX_FIXED_UNUSED'
      FixedChar = True
      Size = 1
    end
    object ADOTable1DISCOUNT_PCT: TBCDField
      FieldName = 'DISCOUNT_PCT'
      Precision = 4
      Size = 2
    end
    object ADOTable1HIGH_BALANCE: TFloatField
      FieldName = 'HIGH_BALANCE'
    end
    object ADOTable1CREDIT_LIMIT: TFloatField
      FieldName = 'CREDIT_LIMIT'
    end
    object ADOTable1CREDIT_RATING: TWordField
      FieldName = 'CREDIT_RATING'
    end
    object ADOTable1BALANCE_DUE: TFloatField
      FieldName = 'BALANCE_DUE'
    end
    object ADOTable1OUTSTANDING_CREDIT: TFloatField
      FieldName = 'OUTSTANDING_CREDIT'
    end
    object ADOTable1DISCOUNT_DAYS: TSmallintField
      FieldName = 'DISCOUNT_DAYS'
    end
    object ADOTable1CURRENT_BOOKINGS: TFloatField
      FieldName = 'CURRENT_BOOKINGS'
    end
    object ADOTable1NET_PAY: TSmallintField
      FieldName = 'NET_PAY'
    end
    object ADOTable1LAST_ACTIVE_DATE: TDateTimeField
      FieldName = 'LAST_ACTIVE_DATE'
      EditMask = '!0000-!90-90;1;_'
    end
    object ADOTable1LANGUAGE_FLAG: TStringField
      FieldName = 'LANGUAGE_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADOTable1BILLING_ADDRESS_4: TStringField
      FieldName = 'BILLING_ADDRESS_4'
      Size = 100
    end
    object ADOTable1COUNTRY_PTR: TIntegerField
      FieldName = 'COUNTRY_PTR'
    end
    object ADOTable1INTERNAL_ECN_COUNT: TSmallintField
      FieldName = 'INTERNAL_ECN_COUNT'
    end
    object ADOTable1EXTERNAL_ECN_COUNT: TSmallintField
      FieldName = 'EXTERNAL_ECN_COUNT'
    end
    object ADOTable1OUTGOING_FORM_NAME: TStringField
      FieldName = 'OUTGOING_FORM_NAME'
      Size = 50
    end
    object ADOTable1OUTGOING_FORM_ADDR1: TStringField
      FieldName = 'OUTGOING_FORM_ADDR1'
      Size = 70
    end
    object ADOTable1OUTGOING_FORM_ADDR2: TStringField
      FieldName = 'OUTGOING_FORM_ADDR2'
      Size = 45
    end
    object ADOTable1OUTGOING_FORM_ADDR3: TStringField
      FieldName = 'OUTGOING_FORM_ADDR3'
      Size = 45
    end
    object ADOTable1ANALYSIS_CODE1: TStringField
      FieldName = 'ANALYSIS_CODE1'
    end
    object ADOTable1ANALYSIS_CODE2: TStringField
      FieldName = 'ANALYSIS_CODE2'
    end
    object ADOTable1ANALYSIS_CODE3: TStringField
      FieldName = 'ANALYSIS_CODE3'
    end
    object ADOTable1CUST_ENT_DATE: TDateTimeField
      FieldName = 'CUST_ENT_DATE'
      EditMask = '!0000-!90-90;1;_'
    end
    object ADOTable1EDI_ID: TStringField
      FieldName = 'EDI_ID'
      Size = 50
    end
    object ADOTable1EDI_FLAG_FOR_SOACK: TSmallintField
      FieldName = 'EDI_FLAG_FOR_SOACK'
    end
    object ADOTable1EDI_FLAG_FOR_INVOICE: TSmallintField
      FieldName = 'EDI_FLAG_FOR_INVOICE'
    end
    object ADOTable1EDI_FLAG_CREDIT_MEMO: TSmallintField
      FieldName = 'EDI_FLAG_CREDIT_MEMO'
    end
    object ADOTable1GEN_EMAIL_ADDRESS: TStringField
      FieldName = 'GEN_EMAIL_ADDRESS'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT1: TStringField
      FieldName = 'EMAIL_FOR_CONTACT1'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT2: TStringField
      FieldName = 'EMAIL_FOR_CONTACT2'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT3: TStringField
      FieldName = 'EMAIL_FOR_CONTACT3'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT4: TStringField
      FieldName = 'EMAIL_FOR_CONTACT4'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT5: TStringField
      FieldName = 'EMAIL_FOR_CONTACT5'
      FixedChar = True
      Size = 50
    end
    object ADOTable1EMAIL_FOR_CONTACT6: TStringField
      FieldName = 'EMAIL_FOR_CONTACT6'
      FixedChar = True
      Size = 50
    end
    object ADOTable1ACC_REC_PTR: TIntegerField
      FieldName = 'ACC_REC_PTR'
    end
    object ADOTable1CONSUME_FORECASTS: TWordField
      FieldName = 'CONSUME_FORECASTS'
    end
    object ADOTable1BACKWARD_DAYS: TIntegerField
      FieldName = 'BACKWARD_DAYS'
    end
    object ADOTable1FORWARD_DAYS: TIntegerField
      FieldName = 'FORWARD_DAYS'
    end
    object ADOTable1PLANNING_HORIZON: TIntegerField
      FieldName = 'PLANNING_HORIZON'
    end
    object ADOTable1RAW_HORIZON: TIntegerField
      FieldName = 'RAW_HORIZON'
    end
    object ADOTable1VISIBILITY_HORIZON: TIntegerField
      FieldName = 'VISIBILITY_HORIZON'
    end
    object ADOTable1DAYS_EARLY_SCHEDULE: TIntegerField
      FieldName = 'DAYS_EARLY_SCHEDULE'
    end
    object ADOTable1APPLY_IN_TRANSIT: TWordField
      FieldName = 'APPLY_IN_TRANSIT'
    end
    object ADOTable1CUSTOMER_TYPE: TIntegerField
      FieldName = 'CUSTOMER_TYPE'
    end
    object ADOTable1DO_SMOOTHING: TWordField
      FieldName = 'DO_SMOOTHING'
    end
    object ADOTable1SMOOTHING_THRESHOLD: TIntegerField
      FieldName = 'SMOOTHING_THRESHOLD'
    end
    object ADOTable1ANALYSIS_CODE4: TStringField
      FieldName = 'ANALYSIS_CODE4'
    end
    object ADOTable1ANALYSIS_CODE5: TStringField
      FieldName = 'ANALYSIS_CODE5'
    end
    object ADOTable1EDI_OUT_FOR_SOACK: TWordField
      FieldName = 'EDI_OUT_FOR_SOACK'
    end
    object ADOTable1EDI_OUT_FOR_INVOICE: TWordField
      FieldName = 'EDI_OUT_FOR_INVOICE'
    end
    object ADOTable1EDI_OUT_FOR_CRMEMO: TWordField
      FieldName = 'EDI_OUT_FOR_CRMEMO'
    end
    object ADOTable1EDI_OUT_FOR_PACKSL: TWordField
      FieldName = 'EDI_OUT_FOR_PACKSL'
    end
    object ADOTable1EDI_IN_FORCST_MAN: TWordField
      FieldName = 'EDI_IN_FORCST_MAN'
    end
    object ADOTable1EDI_IN_FORCST_AUT: TWordField
      FieldName = 'EDI_IN_FORCST_AUT'
    end
    object ADOTable1EDI_IN_SONEW_MAN: TWordField
      FieldName = 'EDI_IN_SONEW_MAN'
    end
    object ADOTable1EDI_IN_SONEW_AUT: TWordField
      FieldName = 'EDI_IN_SONEW_AUT'
    end
    object ADOTable1EDI_IN_LOGGING: TWordField
      FieldName = 'EDI_IN_LOGGING'
    end
    object ADOTable1EDI_IN_ADD_CUSTPART: TWordField
      FieldName = 'EDI_IN_ADD_CUSTPART'
    end
    object ADOTable1EDI_IN_PROD_CODE_PTR: TIntegerField
      FieldName = 'EDI_IN_PROD_CODE_PTR'
    end
    object ADOTable1quote_factor: TFloatField
      FieldName = 'quote_factor'
    end
    object ADOTable1REP_EVAL: TStringField
      FieldName = 'REP_EVAL'
      Size = 70
    end
    object ADOTable1MAK_EVAL: TStringField
      FieldName = 'MAK_EVAL'
      Size = 70
    end
    object ADOTable1FIN_EVAL: TStringField
      FieldName = 'FIN_EVAL'
      Size = 70
    end
    object ADOTable1MARMANG_EVAL: TStringField
      FieldName = 'MARMANG_EVAL'
      Size = 70
    end
    object ADOTable1REP_CREDIT: TFloatField
      FieldName = 'REP_CREDIT'
    end
    object ADOTable1MAK_CREDIT: TFloatField
      FieldName = 'MAK_CREDIT'
    end
    object ADOTable1FIN_CREDIT: TFloatField
      FieldName = 'FIN_CREDIT'
    end
    object ADOTable1MARMANG_CREDIT: TFloatField
      FieldName = 'MARMANG_CREDIT'
    end
    object ADOTable1REP_HIGH: TFloatField
      FieldName = 'REP_HIGH'
    end
    object ADOTable1MAK_HIGH: TFloatField
      FieldName = 'MAK_HIGH'
    end
    object ADOTable1FIN_HIGH: TFloatField
      FieldName = 'FIN_HIGH'
    end
    object ADOTable1MARMANG_HIGH: TFloatField
      FieldName = 'MARMANG_HIGH'
    end
    object ADOTable1REP_NAME: TStringField
      FieldName = 'REP_NAME'
      Size = 16
    end
    object ADOTable1MAK_NAME: TStringField
      FieldName = 'MAK_NAME'
      Size = 16
    end
    object ADOTable1FIN_NAME: TStringField
      FieldName = 'FIN_NAME'
      Size = 16
    end
    object ADOTable1MARMANG_NAME: TStringField
      FieldName = 'MARMANG_NAME'
      Size = 16
    end
    object ADOTable1REP_DATE: TDateTimeField
      FieldName = 'REP_DATE'
    end
    object ADOTable1MAK_DATE: TDateTimeField
      FieldName = 'MAK_DATE'
    end
    object ADOTable1FIN_DATE: TDateTimeField
      FieldName = 'FIN_DATE'
    end
    object ADOTable1MARMANG_DATE: TDateTimeField
      FieldName = 'MARMANG_DATE'
    end
    object ADOTable1HOUSE_FIXED: TStringField
      FieldName = 'HOUSE_FIXED'
      Size = 4
    end
    object ADOTable1FIXED_SCOPE: TStringField
      FieldName = 'FIXED_SCOPE'
      Size = 30
    end
    object ADOTable1SALES_DISCOUNT: TBCDField
      FieldName = 'SALES_DISCOUNT'
      DisplayFormat = '0.00'
      Precision = 4
      Size = 2
    end
    object ADOTable1MONTH_AMOUNT: TFloatField
      FieldName = 'MONTH_AMOUNT'
    end
    object ADOTable1MONTH_PCBAMOUNT: TFloatField
      FieldName = 'MONTH_PCBAMOUNT'
    end
    object ADOTable1CAPITAL: TFloatField
      FieldName = 'CAPITAL'
    end
    object ADOTable1StringField: TStringField
      FieldKind = fkCalculated
      FieldName = #26159#21542#21547#31246
      Size = 4
      Calculated = True
    end
    object ADOTable1Field: TStringField
      FieldKind = fkCalculated
      FieldName = #26159#21542#36716#21378
      Size = 4
      Calculated = True
    end
    object ADOTable1Field2: TStringField
      FieldKind = fkCalculated
      FieldName = #29366#24577
      Size = 4
      Calculated = True
    end
    object ADOTable1StringField2: TStringField
      FieldKind = fkCalculated
      FieldName = #20449#29992#31561#32423
      Size = 4
      Calculated = True
    end
  end
  object DataSource3: TDataSource
    DataSet = DM.ADOdata0493
    Left = 155
    Top = 89
  end
  object ppDesigner1: TppDesigner
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
    Left = 40
    Top = 144
  end
  object ppDB01: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    UserName = 'DB01'
    Left = 120
    Top = 56
    object ppDBPipeline1ppField1: TppField
      FieldAlias = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
  end
  object DataSource4: TDataSource
    DataSet = ADO01
    Left = 156
    Top = 56
  end
  object ADO01: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'CURRENCY_PTR'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select CURR_CODE,CURR_NAME'
      'from data0001'
      'where rkey=:CURRENCY_PTR')
    Left = 192
    Top = 55
    object ADO01CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADO01CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
  end
end
