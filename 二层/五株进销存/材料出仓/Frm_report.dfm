object report_issue: Treport_issue
  Left = 451
  Top = 178
  Width = 608
  Height = 329
  Caption = #20986#20179#25171#21360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = DM.ADOinvt_issue1
    Left = 104
    Top = 104
  end
  object ppDB1: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB1'
    Left = 152
    Top = 104
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    SaveAsTemplate = True
    Template.FileName = 'D:\JINXIAOCUN\issue.rtm'
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    SavePrinterSetup = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 192
    Top = 104
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB2'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37571
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = #20844#21496#21517#31216'1'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 6350
        mmLeft = 62971
        mmTop = 4763
        mmWidth = 77258
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #20986#24211#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5630
        mmLeft = 89429
        mmTop = 13758
        mmWidth = 14796
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20986#20179#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12435
        mmTop = 24606
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'GON_NUMBER'
        DataPipeline = ppDB1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB1'
        mmHeight = 4022
        mmLeft = 34130
        mmTop = 24605
        mmWidth = 21336
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #26448#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 16404
        mmTop = 30427
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #26448#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 56622
        mmTop = 30427
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #26448#26009#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 102395
        mmTop = 30427
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 144463
        mmTop = 30427
        mmWidth = 7145
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4021
        mmLeft = 164308
        mmTop = 30427
        mmWidth = 7069
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 5027
        mmTop = 35189
        mmWidth = 188913
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20179#24211
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4021
        mmLeft = 181240
        mmTop = 30427
        mmWidth = 7069
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #39046#26009#20154#21592#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4021
        mmLeft = 61913
        mmTop = 24605
        mmWidth = 17673
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB1'
        mmHeight = 4022
        mmLeft = 80432
        mmTop = 24605
        mmWidth = 10605
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'INV_PART_NUMBER'
        DataPipeline = ppDB2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 4022
        mmLeft = 13494
        mmTop = 1588
        mmWidth = 17780
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'INV_NAME'
        DataPipeline = ppDB2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 4022
        mmLeft = 51064
        mmTop = 1588
        mmWidth = 31814
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'INV_DESCRIPTION'
        DataPipeline = ppDB2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 4022
        mmLeft = 97630
        mmTop = 1588
        mmWidth = 35348
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 4022
        mmLeft = 143139
        mmTop = 1588
        mmWidth = 3535
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'QUANTITY'
        DataPipeline = ppDB2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 4022
        mmLeft = 162189
        mmTop = 1588
        mmWidth = 1778
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'LOCATION'
        DataPipeline = ppDB2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB2'
        mmHeight = 4022
        mmLeft = 179652
        mmTop = 1588
        mmWidth = 10605
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object DataSource3: TDataSource
    DataSet = ADO493
    Left = 104
    Top = 184
  end
  object ADO493: TADOQuery
    Active = True
    Connection = DM.ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT Company_Name as '#20844#21496#21517#31216'1, '
      'Company_Name2 as '#20844#21496#21517#31216'2, '
      'Company_Name3 as '#20844#21496#21517#31216'3, '
      'ship_address as '#20844#21496#22320#22336','
      'Company_Icon as '#20844#21496#22270#26631', '
      'SITE_INFO_ADD_1 as '#20844#21496#20301#32622'1, '
      'SITE_INFO_ADD_2 as '#20844#21496#20301#32622'2, '
      'SITE_INFO_ADD_3 as '#20844#21496#20301#32622'3, '
      'SITE_INFO_PHONE as '#30005#35805
      'FROM DATA0493')
    Left = 152
    Top = 184
    object ADO493DSDesigner1: TStringField
      FieldName = #20844#21496#21517#31216'1'
      Size = 50
    end
    object ADO493DSDesigner2: TStringField
      FieldName = #20844#21496#21517#31216'2'
      Size = 50
    end
    object ADO493DSDesigner3: TStringField
      FieldName = #20844#21496#21517#31216'3'
      Size = 50
    end
    object ADO493DSDesigner: TStringField
      FieldName = #20844#21496#22320#22336
      Size = 50
    end
    object ADO493DSDesigner4: TBlobField
      FieldName = #20844#21496#22270#26631
    end
    object ADO493DSDesigner12: TStringField
      FieldName = #20844#21496#20301#32622'1'
      FixedChar = True
      Size = 50
    end
    object ADO493DSDesigner22: TStringField
      FieldName = #20844#21496#20301#32622'2'
      FixedChar = True
      Size = 50
    end
    object ADO493DSDesigner32: TStringField
      FieldName = #20844#21496#20301#32622'3'
      FixedChar = True
      Size = 50
    end
    object ADO493DSDesigner5: TStringField
      FieldName = #30005#35805
      FixedChar = True
      Size = 30
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB493'
    Left = 200
    Top = 200
    object ppDBPipeline3ppField1: TppField
      FieldAlias = #20844#21496#21517#31216'1'
      FieldName = #20844#21496#21517#31216'1'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline3ppField2: TppField
      FieldAlias = #20844#21496#21517#31216'2'
      FieldName = #20844#21496#21517#31216'2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline3ppField3: TppField
      FieldAlias = #20844#21496#21517#31216'3'
      FieldName = #20844#21496#21517#31216'3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline3ppField4: TppField
      FieldAlias = #20844#21496#22320#22336
      FieldName = #20844#21496#22320#22336
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline3ppField5: TppField
      FieldAlias = #20844#21496#22270#26631
      FieldName = #20844#21496#22270#26631
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline3ppField6: TppField
      FieldAlias = #20844#21496#20301#32622'1'
      FieldName = #20844#21496#20301#32622'1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline3ppField7: TppField
      FieldAlias = #20844#21496#20301#32622'2'
      FieldName = #20844#21496#20301#32622'2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipeline3ppField8: TppField
      FieldAlias = #20844#21496#20301#32622'3'
      FieldName = #20844#21496#20301#32622'3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBPipeline3ppField9: TppField
      FieldAlias = #30005#35805
      FieldName = #30005#35805
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
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
    Left = 192
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = DM.ADOinvt_issue1
    Left = 104
    Top = 152
  end
  object ppDB2: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB2'
    Left = 152
    Top = 144
    object ppDB2ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 0
      Position = 0
    end
    object ppDB2ppField2: TppField
      FieldAlias = 'GON_NUMBER'
      FieldName = 'GON_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDB2ppField3: TppField
      FieldAlias = 'TDATE'
      FieldName = 'TDATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppDB2ppField4: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object ppDB2ppField5: TppField
      FieldAlias = 'GROUP_DESC'
      FieldName = 'GROUP_DESC'
      FieldLength = 70
      DisplayWidth = 70
      Position = 4
    end
    object ppDB2ppField6: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 25
      DisplayWidth = 25
      Position = 5
    end
    object ppDB2ppField7: TppField
      FieldAlias = 'INV_NAME'
      FieldName = 'INV_NAME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object ppDB2ppField8: TppField
      FieldAlias = 'INV_DESCRIPTION'
      FieldName = 'INV_DESCRIPTION'
      FieldLength = 200
      DisplayWidth = 200
      Position = 7
    end
    object ppDB2ppField9: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object ppDB2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 11
      Position = 9
    end
    object ppDB2ppField11: TppField
      FieldAlias = 'CODE'
      FieldName = 'CODE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object ppDB2ppField12: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 16
      DisplayWidth = 16
      Position = 11
    end
    object ppDB2ppField13: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 16
      DisplayWidth = 16
      Position = 12
    end
    object ppDB2ppField14: TppField
      FieldAlias = 'LOCATION'
      FieldName = 'LOCATION'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppDB2ppField15: TppField
      FieldAlias = 'WAREHOUSE_CODE'
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 14
    end
    object ppDB2ppField16: TppField
      FieldAlias = 'DEPT_NAME'
      FieldName = 'DEPT_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 15
    end
    object ppDB2ppField17: TppField
      FieldAlias = 'issue_EMPLOYEENAME'
      FieldName = 'issue_EMPLOYEENAME'
      FieldLength = 16
      DisplayWidth = 16
      Position = 16
    end
    object ppDB2ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'issue_area'
      FieldName = 'issue_area'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppDB2ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'issue_weight'
      FieldName = 'issue_weight'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppDB2ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'unit_sq'
      FieldName = 'unit_sq'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppDB2ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'unit_weight'
      FieldName = 'unit_weight'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
  end
end
