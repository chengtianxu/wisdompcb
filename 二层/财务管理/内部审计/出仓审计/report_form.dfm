object Form_report1: TForm_report1
  Left = 412
  Top = 185
  Width = 270
  Height = 305
  AutoSize = True
  Caption = #20986#20179#21333#25253#34920'--'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB207
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210x297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'R:\NIERP\Report\putout_invtreport.rtm'
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
    Left = 176
    Top = 96
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB207'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 9260
        mmLeft = 5027
        mmTop = 25929
        mmWidth = 186532
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #20844#21496#21517#31216'1'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 6615
        mmLeft = 79904
        mmTop = 2117
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #39046#26009#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 85196
        mmTop = 10848
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #39046#26009#37096#38376':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 14817
        mmTop = 11377
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DEPT_NAME'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 35719
        mmTop = 11377
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #20986#20179#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 147638
        mmTop = 10848
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'GON_NUMBER'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 167746
        mmTop = 10848
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #39046#26009#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 147109
        mmTop = 18521
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'REF_NUMBER'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 167746
        mmTop = 18521
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #39046#26009#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 14552
        mmTop = 18521
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 35454
        mmTop = 18521
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #39046#26009#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 61913
        mmTop = 18521
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CREATE_DATE'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 81492
        mmTop = 18521
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #29289#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 55298
        mmTop = 27781
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #29289#26009#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 99748
        mmTop = 27781
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 132821
        mmTop = 27781
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 149754
        mmTop = 27781
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #29615#20445#26631#35782
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 164307
        mmTop = 27781
        mmWidth = 17198
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 86784
        mmTop = 25929
        mmWidth = 2910
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 130440
        mmTop = 25929
        mmWidth = 5292
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 144463
        mmTop = 25929
        mmWidth = 5292
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 161396
        mmTop = 25929
        mmWidth = 5292
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 47890
        mmTop = 25929
        mmWidth = 4498
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #26448#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4953
        mmLeft = 17198
        mmTop = 27781
        mmWidth = 17272
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 5292
        mmTop = 0
        mmWidth = 186002
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'INV_NAME'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 5027
        mmLeft = 50536
        mmTop = 1323
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 5027
        mmLeft = 135996
        mmTop = 1852
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'QUANTITY'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 5027
        mmLeft = 149754
        mmTop = 1852
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'rohs'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 5027
        mmLeft = 170657
        mmTop = 1852
        mmWidth = 7938
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 5027
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 86784
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 130440
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 144463
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 161396
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 191294
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8731
        mmLeft = 47890
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = True
        DataField = 'INV_DESCRIPTION'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 5556
        mmLeft = 88636
        mmTop = 1323
        mmWidth = 39952
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = True
        DataField = 'INV_PART_NUMBER'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 5821
        mmLeft = 6615
        mmTop = 1058
        mmWidth = 40217
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #21457#26009#20154#21592
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 4064
        mmLeft = 8467
        mmTop = 4233
        mmWidth = 14224
        BandType = 7
      end
    end
  end
  object DataSource4: TDataSource
    DataSet = aq493
    Left = 96
    Top = 136
  end
  object aq493: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
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
    Left = 64
    Top = 136
    object aq493DSDesigner1: TStringField
      FieldName = #20844#21496#21517#31216'1'
      Size = 50
    end
    object aq493DSDesigner2: TStringField
      FieldName = #20844#21496#21517#31216'2'
      Size = 50
    end
    object aq493DSDesigner3: TStringField
      FieldName = #20844#21496#21517#31216'3'
      Size = 50
    end
    object aq493DSDesigner: TStringField
      FieldName = #20844#21496#22320#22336
      Size = 50
    end
    object aq493DSDesigner4: TBlobField
      FieldName = #20844#21496#22270#26631
    end
    object aq493DSDesigner12: TStringField
      FieldName = #20844#21496#20301#32622'1'
      FixedChar = True
      Size = 50
    end
    object aq493DSDesigner22: TStringField
      FieldName = #20844#21496#20301#32622'2'
      FixedChar = True
      Size = 50
    end
    object aq493DSDesigner32: TStringField
      FieldName = #20844#21496#20301#32622'3'
      FixedChar = True
      Size = 50
    end
    object aq493DSDesigner5: TStringField
      FieldName = #30005#35805
      FixedChar = True
      Size = 30
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 136
    Top = 136
    object ppDBPipeline1ppField1: TppField
      FieldAlias = #20844#21496#21517#31216'1'
      FieldName = #20844#21496#21517#31216'1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = #20844#21496#21517#31216'2'
      FieldName = #20844#21496#21517#31216'2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = #20844#21496#21517#31216'3'
      FieldName = #20844#21496#21517#31216'3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = #20844#21496#22320#22336
      FieldName = #20844#21496#22320#22336
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = #20844#21496#22270#26631
      FieldName = #20844#21496#22270#26631
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = #20844#21496#20301#32622'1'
      FieldName = #20844#21496#20301#32622'1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = #20844#21496#20301#32622'2'
      FieldName = #20844#21496#20301#32622'2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = #20844#21496#20301#32622'3'
      FieldName = #20844#21496#20301#32622'3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = #30005#35805
      FieldName = #30005#35805
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object ppDB207: TppDBPipeline
    DataSource = DataSource6
    OpenDataSource = False
    UserName = 'DB207'
    Left = 136
    Top = 96
  end
  object ppDB457: TppDBPipeline
    DataSource = DataSource5
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB457'
    Left = 136
    Top = 56
  end
  object DataSource5: TDataSource
    DataSet = aq457
    Left = 96
    Top = 56
  end
  object DataSource6: TDataSource
    DataSet = ADO207
    Left = 96
    Top = 96
  end
  object ADO207: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_D' +
      'ESCRIPTION,Data0207.QUANTITY, '#13#10'       Data0207.RTN_QUANTITY,Dat' +
      'a0002.UNIT_NAME,Data0022.rohs,Data0022.SUPPLIER2,Data0207.D0022_' +
      'PTR, '#13#10'       Data0022.QUAN_ON_HAND,Data0207.INVENTORY_PTR,Data0' +
      '207.RKEY,Data0017.QUAN_ON_HAND AS hand17, '#13#10'       Data0023.ABBR' +
      '_NAME'#13#10'FROM   Data0207 INNER JOIN'#13#10'       Data0017 ON Data0207.I' +
      'NVENTORY_PTR = Data0017.RKEY INNER JOIN'#13#10'       Data0022 ON Data' +
      '0207.D0022_PTR = Data0022.RKEY INNER JOIN'#13#10'       Data0002 ON Da' +
      'ta0022.LOCATION_PTR_FROM = Data0002.RKEY INNER JOIN'#13#10'       Data' +
      '0456 ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN'#13#10'       Data' +
      '0023 ON Data0456.SUPP_PTR = Data0023.RKEY'#13#10'where gon_ptr=:rkey'
    DataSource = DataSource5
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 64
    Top = 96
    object StringField1: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object StringField2: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ado207INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object BCDField1: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object ado207RTN_QUANTITY: TBCDField
      DisplayLabel = #36864#20179#25968#37327
      FieldName = 'RTN_QUANTITY'
      Precision = 10
      Size = 3
    end
    object StringField3: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object StringField4: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ado207SUPPLIER2: TStringField
      DisplayLabel = #21407#21046#36896#21830
      FieldName = 'SUPPLIER2'
      Size = 10
    end
    object ado207D0022_PTR: TIntegerField
      FieldName = 'D0022_PTR'
    end
    object ado207QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ado207INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ado207rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado207hand17: TFloatField
      FieldName = 'hand17'
    end
    object ADO207ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
  end
  object aq457: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0457.RKEY, dbo.Data0457.GON_NUMBER, '#13#10'     dbo.Da' +
      'ta0457.REF_NUMBER, '#13#10'      dbo.Data0457.CREATE_DATE, '#13#10'      dbo' +
      '.Data0015.ABBR_NAME, data0457.TTYPE,'#13#10'      dbo.Data0034.DEPT_CO' +
      'DE, dbo.Data0034.DEPT_NAME, '#13#10'      dbo.Data0005.EMPLOYEE_NAME,'#13 +
      #10'Data0005_1.EMPLOYEE_NAME as '#21457#26009#20154#21592','#13#10'case data0457.ttype when 1 t' +
      'hen '#39#25353#37197#26009#21333#39#13#10'when 2 then '#39#25353#37096#38376#39' when 3 then '#39#21457#26009#21040#36710#38388#39#13#10'when 4 then '#39 +
      #29289#26009#36864#20179#39' when 5 then '#39#26434#39033#29289#21697#39#13#10'when 6 then '#39#26434#39033#36864#20179#39#13#10'end as '#20986#20179#31867#22411','#13#10'case' +
      ' data0457.status when 0 then '#39#26410#23457#35745#39#13#10'when 1 then '#39#24050#23457#35745#39#13#10'end as '#29366#24577 +
      ',Data0457.Cut_No as '#22791#27880#13#10'FROM dbo.Data0457 INNER JOIN'#13#10'      dbo.' +
      'Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.RKEY INNER' +
      ' JOIN'#13#10'      dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data003' +
      '4.RKEY INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0457.RECD_BY = ' +
      'dbo.Data0005.RKEY INNER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON d' +
      'bo.Data0457.CREATE_BY = Data0005_1.RKEY'#13#10'where data0457.rkey=:rk' +
      'ey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 64
    Top = 56
    object aq457RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq457GON_NUMBER: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object aq457REF_NUMBER: TStringField
      DisplayLabel = #39046#26009#21333#21495
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object aq457CREATE_DATE: TDateTimeField
      DisplayLabel = #39046#26009#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object aq457ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq457DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aq457DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aq457EMPLOYEE_NAME: TStringField
      DisplayLabel = #39046#26009#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq457DSDesigner: TStringField
      FieldName = #20986#20179#31867#22411
      ReadOnly = True
      Size = 10
    end
    object aq457DSDesigner2: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object aq457TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object aq457DSDesigner3: TStringField
      FieldName = #21457#26009#20154#21592
      Size = 16
    end
    object aq457DSDesigner4: TStringField
      FieldName = #22791#27880
      Size = 40
    end
  end
end
