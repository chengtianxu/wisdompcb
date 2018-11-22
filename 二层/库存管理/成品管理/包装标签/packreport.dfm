object packreport_Form: Tpackreport_Form
  Left = 336
  Top = 239
  Width = 510
  Height = 333
  Caption = #25253#34920#23450#20041
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ADS699: TADODataSet
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select data0699.order_no as '#24207#21495','#13#10'data0699.MANU_PART_NUMBER as '#26412#21378 +
      #32534#21495','#13#10'data0699.MANU_PART_DESC as '#23458#25143#22411#21495','#13#10'data0699.ANALYSIS_CODE_2 ' +
      'as '#23458#25143#29289#26009#21495',  '#13#10'data0699.PO_NUMBER as '#23458#25143#35746#21333#21495','#13#10'data0699.qty as '#25968#37327','#13#10 +
      'data0699.code as '#20195#30721','#13#10'data0699.lotno as '#25209#27425','#13#10'data0699.barcode_id' +
      ' as '#26465#24418#30721','#13#10'data0699.description as '#25551#36848','#13#10'data0699.notes as '#22791#27880','#13#10'da' +
      'ta0698.notes as '#22791#27880'698,'#13#10'data0698.v_date as '#21019#24314#26085#26399#13#10' from data0699 ' +
      'inner join data0698'#13#10'on data0699.pack_ptr=data0698.rkey'#13#10' where ' +
      'data0699.pack_ptr =:rkey'
    DataSource = DM.DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 8
      end>
    Left = 112
    Top = 104
    object ADS699DSDesigner: TSmallintField
      FieldName = #24207#21495
    end
    object ADS699DSDesigner2: TStringField
      FieldName = #26412#21378#32534#21495
    end
    object ADS699DSDesigner3: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 40
    end
    object ADS699DSDesigner4: TStringField
      FieldName = #23458#25143#29289#26009#21495
      Size = 50
    end
    object ADS699DSDesigner5: TStringField
      FieldName = #23458#25143#35746#21333#21495
      Size = 25
    end
    object ADS699DSDesigner6: TIntegerField
      FieldName = #25968#37327
    end
    object ADS699DSDesigner7: TStringField
      FieldName = #20195#30721
      Size = 15
    end
    object ADS699DSDesigner8: TStringField
      FieldName = #25209#27425
      Size = 10
    end
    object ADS699DSDesigner9: TStringField
      FieldName = #26465#24418#30721
      Size = 80
    end
    object ADS699DSDesigner10: TStringField
      FieldName = #25551#36848
      Size = 50
    end
    object ADS699DSDesigner11: TStringField
      FieldName = #22791#27880
      Size = 50
    end
    object ADS699DSDesigner12: TDateTimeField
      FieldName = #21019#24314#26085#26399
    end
    object ADS699DSDesigner698: TStringField
      FieldName = #22791#27880'698'
      Size = 50
    end
  end
  object DB699: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB699'
    Left = 208
    Top = 104
    object DB699ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object DB699ppField2: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = #26412#21378#32534#21495
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object DB699ppField3: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = #23458#25143#22411#21495
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object DB699ppField4: TppField
      FieldAlias = #23458#25143#29289#26009#21495
      FieldName = #23458#25143#29289#26009#21495
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object DB699ppField5: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = #23458#25143#35746#21333#21495
      FieldLength = 25
      DisplayWidth = 25
      Position = 4
    end
    object DB699ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #25968#37327
      FieldName = #25968#37327
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object DB699ppField7: TppField
      FieldAlias = #20195#30721
      FieldName = #20195#30721
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object DB699ppField8: TppField
      FieldAlias = #25209#27425
      FieldName = #25209#27425
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object DB699ppField9: TppField
      FieldAlias = #26465#24418#30721
      FieldName = #26465#24418#30721
      FieldLength = 80
      DisplayWidth = 80
      Position = 8
    end
    object DB699ppField10: TppField
      FieldAlias = #25551#36848
      FieldName = #25551#36848
      FieldLength = 50
      DisplayWidth = 50
      Position = 9
    end
    object DB699ppField11: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 50
      DisplayWidth = 50
      Position = 10
    end
    object DB699ppField12: TppField
      FieldAlias = #21019#24314#26085#26399
      FieldName = #21019#24314#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object DB699ppField13: TppField
      FieldAlias = #22791#27880'698'
      FieldName = #22791#27880'698'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS699
    Left = 160
    Top = 104
  end
  object ppReport1: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '1000'
      '71000'
      '141000')
    DataPipeline = DB699
    OnPrintingComplete = ppReport1PrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
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
    Left = 256
    Top = 104
    Version = '7.01'
    mmColumnWidth = 68000
    DataPipelineName = 'DB699'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      ColumnTraversal = ctLeftToRight
      mmBottomOffset = 2000
      mmHeight = 69586
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 69586
        mmLeft = 0
        mmTop = 0
        mmWidth = 68000
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #32534#30721'(ITEM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 7408
        mmTop = 8996
        mmWidth = 17695
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #23458#25143#22411#21495
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 42365
        mmTop = 8996
        mmWidth = 14224
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #25551#36848'(DESCRIPTION)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 14288
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = #25551#36848
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 44207
        mmTop = 14552
        mmWidth = 10541
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #22411#21495'\'#29256#26412'(MODEL)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 19579
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #23458#25143#29289#26009#21495
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 37032
        mmTop = 19844
        mmWidth = 24892
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 42863
        mmLeft = 33073
        mmTop = 7938
        mmWidth = 2117
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 13494
        mmWidth = 68000
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 19050
        mmWidth = 68000
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 24077
        mmWidth = 68000
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #20379#24212#21830':'#20116#26666#30005#36335#26495#26377#38480#20844#21496
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 4499
        mmTop = 1588
        mmWidth = 58716
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 7938
        mmWidth = 68000
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #25968#37327'(QTY)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 8202
        mmTop = 24871
        mmWidth = 15875
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 29369
        mmWidth = 68000
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #20195#30721'(CODE)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 7408
        mmTop = 30163
        mmWidth = 17727
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 39952
        mmWidth = 68000
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #25968#37327
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 42747
        mmTop = 24871
        mmWidth = 3556
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'PCS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 48154
        mmTop = 24871
        mmWidth = 5292
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #21512#21516#21495'(PO.NO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 35454
        mmWidth = 23019
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 34660
        mmWidth = 68000
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25209#27425'(LOTNO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 40746
        mmWidth = 19579
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 45244
        mmWidth = 68000
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #22791#27880'(NOTES)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 46038
        mmWidth = 19579
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 50536
        mmWidth = 68000
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #20195#30721
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 44144
        mmTop = 30163
        mmWidth = 10668
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #23458#25143#35746#21333#21495
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 41609
        mmTop = 35454
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #25209#27425
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 46054
        mmTop = 40746
        mmWidth = 7112
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #22791#27880
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 3429
        mmLeft = 41015
        mmTop = 46038
        mmWidth = 17187
        BandType = 4
      end
      object ppDBBarCode1: TppDBBarCode
        UserName = 'DBBarCode1'
        BarCodeType = bcCode39
        BarColor = clWindowText
        DataField = #26465#24418#30721
        DataPipeline = DB699
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 34375
        mmLeft = 12435
        mmTop = 53446
        mmWidth = 103632
        BandType = 4
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
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
    WindowState = wsMaximized
    Left = 256
    Top = 144
  end
  object ppReport2: TppReport
    AutoStop = False
    Columns = 3
    ColumnPositions.Strings = (
      '3000'
      '66000'
      '129000')
    DataPipeline = DB699
    OnPrintingComplete = ppReport1PrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 1350
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 7350
    PrinterSetup.mmPaperHeight = 269000
    PrinterSetup.mmPaperWidth = 194000
    PrinterSetup.PaperSize = 256
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
    Left = 312
    Top = 104
    Version = '7.01'
    mmColumnWidth = 62000
    DataPipelineName = 'DB699'
    object ppTitleBand2: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppColumnHeaderBand2: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      ColumnTraversal = ctLeftToRight
      mmBottomOffset = 2000
      mmHeight = 49477
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 49477
        mmLeft = 0
        mmTop = 0
        mmWidth = 62000
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label1'
        Caption = #32534#30721'(ITEM)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 7408
        mmTop = 8731
        mmWidth = 17695
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #23458#25143#22411#21495
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 39423
        mmTop = 8731
        mmWidth = 14224
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label2'
        Caption = #25551#36848'(DESCRIPTION)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 14023
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = #25551#36848
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 41296
        mmTop = 14023
        mmWidth = 10541
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label3'
        Caption = #22411#21495'\'#29256#26412'(MODEL)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 19050
        mmWidth = 28310
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #23458#25143#29289#26009#21495
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 33063
        mmTop = 19050
        mmWidth = 24892
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 41540
        mmLeft = 31750
        mmTop = 7937
        mmWidth = 2117
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 13229
        mmWidth = 62000
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 18521
        mmWidth = 62000
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23548
        mmWidth = 62000
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label4'
        Caption = #20379#24212#21830':'#20116#26666#30005#36335#26495#26377#38480#20844#21496
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4445
        mmLeft = 6593
        mmTop = 1588
        mmWidth = 49234
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 7938
        mmWidth = 62000
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label5'
        Caption = #25968#37327'(QTY)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 8202
        mmTop = 24342
        mmWidth = 15875
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line6'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 28575
        mmWidth = 62000
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label6'
        Caption = #20195#30721'(CODE)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 7408
        mmTop = 29369
        mmWidth = 17727
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line7'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 39158
        mmWidth = 62000
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #25968#37327
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 40894
        mmTop = 24342
        mmWidth = 3556
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label7'
        Caption = 'PCS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 45244
        mmTop = 24342
        mmWidth = 5292
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label8'
        Caption = #21512#21516#21495'(PO.NO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 34660
        mmWidth = 23019
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 33867
        mmWidth = 62000
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label9'
        Caption = #25209#27425'(LOTNO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 39952
        mmWidth = 19579
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line9'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 44450
        mmWidth = 62000
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label10'
        Caption = #22791#27880'(NOTES)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 45244
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #20195#30721
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 41275
        mmTop = 29369
        mmWidth = 10668
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #23458#25143#35746#21333#21495
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 38724
        mmTop = 34660
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #25209#27425
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 4022
        mmLeft = 43127
        mmTop = 39952
        mmWidth = 7112
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #22791#27880
        DataPipeline = DB699
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB699'
        mmHeight = 3429
        mmLeft = 38100
        mmTop = 45244
        mmWidth = 17187
        BandType = 4
      end
    end
    object ppColumnFooterBand2: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppDesigner2: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport2
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 312
    Top = 144
  end
end
