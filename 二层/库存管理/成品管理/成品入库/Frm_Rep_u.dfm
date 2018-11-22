object Frm_Rep: TFrm_Rep
  Left = 451
  Top = 165
  Width = 389
  Height = 403
  Caption = 'Frm_Rep'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADOQ53: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RKEY416'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0025.MANU_PART_NUMBER AS '#26412#21378#32534#21495', '
      
        '      Data0025.MANU_PART_DESC AS '#23458#25143#22411#21495', data0010.cust_code as '#23458#25143#20195 +
        #30721','
      '      Data0006.WORK_ORDER_NUMBER AS '#20316#19994#21333#21495', '
      '      Data0053.MFG_DATE AS '#20837#20179#26102#38388', Data0053.QUANTITY AS '#25968#37327
      'FROM Data0025 INNER JOIN'
      '      Data0053 ON '
      '      Data0025.RKEY = Data0053.CUST_PART_PTR LEFT OUTER JOIN'
      '      Data0006 ON Data0053.WORK_ORDER_PTR = Data0006.RKEY'
      '      left join data0010 on Data0025.CUSTOMER_PTR=data0010.rkey'
      'WHERE Data0053.npad_ptr = :RKEY416'
      'order by Data0025.MANU_PART_NUMBER'
      '')
    Left = 48
    Top = 104
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB0053'
    Left = 144
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = ADOQ53
    Left = 96
    Top = 104
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
    Left = 240
    Top = 160
  end
  object ADOQ416: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RKEY416'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0416.number AS '#20837#20179#21333#21495', data0416.quantity AS '#20837#20179#24635#25968#37327', '
      '      data0416.sys_date AS '#20837#20179#26102#38388', '
      '      Data0005.EMPLOYEE_NAME AS '#23457#26680#20154
      'FROM data0416 INNER JOIN'
      '      Data0005 ON data0416.empl_ptr = Data0005.RKEY'
      ''
      'WHERE data0416.RKEY = :RKEY416')
    Left = 48
    Top = 160
  end
  object ppDBPipeline2: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB416'
    Left = 144
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = ADOQ416
    Left = 96
    Top = 160
  end
  object ADOQ493: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Company_Name AS '#20844#21496#21517#31216', Company_Icon AS '#20844#21496#22270#26631', Company_Name2' +
        ', '
      
        '      Company_Name3, ship_address, SITE_INFO_ADD_1, SITE_INFO_AD' +
        'D_2, '
      '      SITE_INFO_ADD_3, SITE_INFO_PHONE AS '#30005#35805
      'FROM dbo.data0493')
    Left = 48
    Top = 208
  end
  object ppDBPipeline3: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB493'
    Left = 144
    Top = 208
  end
  object DataSource3: TDataSource
    DataSet = ADOQ493
    Left = 96
    Top = 208
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = #20449#32440
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'R:\NIERP\Report\REP0053.RTM'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    SavePrinterSetup = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 200
    Top = 104
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand2: TppHeaderBand
      BeforePrint = ppHeaderBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 39158
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = #26412#21378#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2117
        mmTop = 33338
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #23458#25143#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 26458
        mmTop = 33338
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = #20316#19994#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 100542
        mmTop = 33338
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = #25968#37327'(PCS)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 145786
        mmTop = 32808
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText15'
        DataField = #20844#21496#21517#31216
        DataPipeline = ppDBPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 5630
        mmLeft = 23283
        mmTop = 265
        mmWidth = 159809
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = #20844#21496#22270#26631
        DataPipeline = ppDBPipeline3
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 13758
        mmLeft = 1588
        mmTop = 1323
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label17'
        CharWrap = True
        Caption = #25104#21697#20837#24211'('#26126#32454')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 71967
        mmTop = 6615
        mmWidth = 60061
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = #20837#20179#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 1852
        mmTop = 18256
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText16'
        DataField = #20837#20179#21333#21495
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4826
        mmLeft = 22225
        mmTop = 18256
        mmWidth = 48683
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = #20837#20179#26102#38388#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 1852
        mmTop = 24342
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText17'
        DataField = #20837#20179#26102#38388
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4826
        mmLeft = 22225
        mmTop = 24342
        mmWidth = 58208
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = #20837#20179#24635#25968'(PCS)'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 116681
        mmTop = 25135
        mmWidth = 32808
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText18'
        DataField = #20837#20179#24635#25968#37327
        DataPipeline = ppDBPipeline2
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4763
        mmLeft = 150548
        mmTop = 25135
        mmWidth = 23283
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line3'
        Pen.Color = clRed
        Weight = 1.000000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 31221
        mmWidth = 186796
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 157163
        mmTop = 14023
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label4'
        Caption = #39029#30721#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146315
        mmTop = 14023
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = #23458#25143#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 76729
        mmTop = 33602
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        OnPrint = ppDBText11Print
        UserName = 'DBText1'
        DataField = #26412#21378#32534#21495
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText12'
        DataField = #23458#25143#22411#21495
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 26723
        mmTop = 794
        mmWidth = 47625
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = #25968#37327
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 146579
        mmTop = 1323
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText13'
        DataField = #20316#19994#21333#21495
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 794
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText9'
        DataField = #23458#25143#20195#30721
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 76200
        mmTop = 794
        mmWidth = 20902
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppDBText16: TppDBText
        UserName = 'DBText2'
        DataField = #23457#26680#20154
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4022
        mmLeft = 19844
        mmTop = 2646
        mmWidth = 17198
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label1'
        Caption = #23457'  '#26680#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 5027
        mmTop = 2646
        mmWidth = 14161
        BandType = 8
      end
      object ppLabel16: TppLabel
        UserName = 'Label21'
        Caption = #25171#21360#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3620
        mmLeft = 126471
        mmTop = 2646
        mmWidth = 14288
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        DisplayFormat = 'yyyy-MM-dd hh:mm:ss'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 2646
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel17: TppLabel
        UserName = 'Label2'
        Caption = #25171'  '#21360#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68792
        mmTop = 2646
        mmWidth = 14288
        BandType = 8
      end
      object ppLabel18: TppLabel
        OnPrint = ppLabel18Print
        UserName = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 83079
        mmTop = 2646
        mmWidth = 23283
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel31: TppLabel
        UserName = 'Label5'
        Caption = #24635'  '#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4128
        mmLeft = 133086
        mmTop = 1588
        mmWidth = 12679
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = #25968#37327
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4128
        mmLeft = 146050
        mmTop = 1588
        mmWidth = 23548
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = #26412#21378#32534#21495
      DataPipeline = ppDBPipeline1
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDBPipeline1'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc3'
          DataField = #25968#37327
          DataPipeline = ppDBPipeline1
          DisplayFormat = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDBPipeline1'
          mmHeight = 4233
          mmLeft = 145786
          mmTop = 529
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label22'
          Caption = #23567'  '#35745#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4128
          mmLeft = 132821
          mmTop = 529
          mmWidth = 12679
          BandType = 5
          GroupNo = 0
        end
      end
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
    Left = 240
    Top = 104
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = #20449#32440
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'R:\NIERP\Report\REP00531.RTM'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    SavePrinterSetup = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 200
    Top = 160
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39158
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = #26412#21378#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2117
        mmTop = 33338
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #23458#25143#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 26458
        mmTop = 33338
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = #25968#37327'(PCS)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 145786
        mmTop = 32808
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText15'
        DataField = #20844#21496#21517#31216
        DataPipeline = ppDBPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 5630
        mmLeft = 23283
        mmTop = 265
        mmWidth = 159809
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = #20844#21496#22270#26631
        DataPipeline = ppDBPipeline3
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDBPipeline3'
        mmHeight = 13758
        mmLeft = 1588
        mmTop = 1058
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label17'
        CharWrap = True
        Caption = #25104#21697#20837#20179#21333'('#27719#24635')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 76729
        mmTop = 7144
        mmWidth = 54240
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = #20837#20179#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 1852
        mmTop = 18256
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText16'
        DataField = #20837#20179#21333#21495
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4826
        mmLeft = 22225
        mmTop = 18256
        mmWidth = 48683
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = #20837#20179#26102#38388#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 1852
        mmTop = 24342
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText17'
        DataField = #20837#20179#26102#38388
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4826
        mmLeft = 22225
        mmTop = 24342
        mmWidth = 58208
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = #20837#20179#24635#25968'(PCS)'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 118004
        mmTop = 25135
        mmWidth = 32808
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText18'
        DataField = #20837#20179#24635#25968#37327
        DataPipeline = ppDBPipeline2
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4763
        mmLeft = 150548
        mmTop = 25135
        mmWidth = 17727
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        Pen.Color = clRed
        Weight = 1.000000000000000000
        mmHeight = 265
        mmLeft = 2117
        mmTop = 31221
        mmWidth = 186796
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 157163
        mmTop = 14023
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label4'
        Caption = #39029#30721#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146315
        mmTop = 14023
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = #23458#25143#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 88106
        mmTop = 33073
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = #23458#25143#20195#30721
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 88371
        mmTop = 794
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = #23458#25143#22411#21495
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 26723
        mmTop = 794
        mmWidth = 60325
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = #26412#21378#32534#21495
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText1'
        DataField = #25968#37327
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 146579
        mmTop = 1323
        mmWidth = 23019
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppDBText20: TppDBText
        UserName = 'DBText2'
        DataField = #23457#26680#20154
        DataPipeline = ppDBPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline2'
        mmHeight = 4022
        mmLeft = 19844
        mmTop = 2646
        mmWidth = 17198
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'Label1'
        Caption = #23457'  '#26680#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 5027
        mmTop = 2646
        mmWidth = 14161
        BandType = 8
      end
      object ppLabel27: TppLabel
        UserName = 'Label21'
        Caption = #25171#21360#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3620
        mmLeft = 126471
        mmTop = 2646
        mmWidth = 14288
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        DisplayFormat = 'yyyy-MM-dd hh:mm:ss'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 2646
        mmWidth = 32279
        BandType = 8
      end
      object ppLabel28: TppLabel
        UserName = 'Label2'
        Caption = #25171'  '#21360#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68792
        mmTop = 2646
        mmWidth = 14288
        BandType = 8
      end
      object ppLabel29: TppLabel
        OnPrint = ppLabel29Print
        UserName = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 83079
        mmTop = 2646
        mmWidth = 23283
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel30: TppLabel
        UserName = 'Label5'
        Caption = #24635'  '#35745#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4128
        mmLeft = 133086
        mmTop = 1588
        mmWidth = 12679
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc1'
        DataField = #25968#37327
        DataPipeline = ppDBPipeline1
        DisplayFormat = '#,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4128
        mmLeft = 146050
        mmTop = 1588
        mmWidth = 23548
        BandType = 7
      end
    end
  end
end
