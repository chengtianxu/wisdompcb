object Report_Frm: TReport_Frm
  Left = 861
  Top = 193
  Width = 320
  Height = 242
  Caption = #29983#20135#39046#26009#25171#21360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppDB268: TppDBPipeline
    DataSource = DS1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB268'
    Left = 152
    Top = 48
    object ppDB268ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 0
    end
    object ppDB268ppField2: TppField
      FieldAlias = #30003#39046#21333#21495
      FieldName = #30003#39046#21333#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDB268ppField3: TppField
      FieldAlias = #30003#39046#26085#26399
      FieldName = #30003#39046#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppDB268ppField4: TppField
      FieldAlias = #30003#35831#20154
      FieldName = #30003#35831#20154
      FieldLength = 16
      DisplayWidth = 16
      Position = 3
    end
    object ppDB268ppField5: TppField
      FieldAlias = #23457#25209#20154
      FieldName = #23457#25209#20154
      FieldLength = 16
      DisplayWidth = 16
      Position = 4
    end
    object ppDB268ppField6: TppField
      FieldAlias = #23457#25209#26085#26399
      FieldName = #23457#25209#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppDB268ppField7: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object ppDB268ppField8: TppField
      FieldAlias = #37096#38376#21517#31216
      FieldName = #37096#38376#21517#31216
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDB268ppField9: TppField
      FieldAlias = #24037#21378#21517#31216
      FieldName = #24037#21378#21517#31216
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDB268ppField10: TppField
      FieldAlias = #20801#35768#25552#20132#20154#21592#24037#21495
      FieldName = #20801#35768#25552#20132#20154#21592#24037#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppDB268ppField11: TppField
      FieldAlias = #20801#35768#25552#20132#20154#21592
      FieldName = #20801#35768#25552#20132#20154#21592
      FieldLength = 16
      DisplayWidth = 16
      Position = 10
    end
    object ppDB268ppField12: TppField
      FieldAlias = #20801#35768#25552#20132#26102#38388
      FieldName = #20801#35768#25552#20132#26102#38388
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
  end
  object DS1: TDataSource
    DataSet = ADS268
    Left = 112
    Top = 48
  end
  object DS2: TDataSource
    DataSet = ADS468
    Left = 112
    Top = 107
  end
  object ADS268: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number AS '#30003#39046#21333#21495', dbo.D' +
      'ATA0268.DATE AS '#30003#39046#26085#26399', dbo.Data0005.EMPLOYEE_NAME AS '#30003#35831#20154', '#13#10'     ' +
      '                 Data0005_1.EMPLOYEE_NAME AS '#23457#25209#20154', dbo.DATA0268.a' +
      'uth_date AS '#23457#25209#26085#26399', dbo.DATA0268.reference AS '#22791#27880', '#13#10'              ' +
      '        dbo.Data0034.DEPT_NAME AS '#37096#38376#21517#31216', dbo.Data0015.ABBR_NAME A' +
      'S '#24037#21378#21517#31216', Data0005_2.EMPL_CODE AS '#20801#35768#25552#20132#20154#21592#24037#21495', Data0005_2.EMPLOYEE_NA' +
      'ME AS '#20801#35768#25552#20132#20154#21592', '#13#10'                      dbo.DATA0268.allow_submit_' +
      'time AS '#20801#35768#25552#20132#26102#38388#13#10'FROM         dbo.DATA0268 INNER JOIN'#13#10'          ' +
      '            dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Data0034' +
      '.RKEY INNER JOIN'#13#10'                      dbo.Data0005 ON dbo.DATA' +
      '0268.EMPL_PTR = dbo.Data0005.RKEY LEFT JOIN'#13#10'                   ' +
      '   dbo.Data0005 AS Data0005_1 ON dbo.DATA0268.auth_emplptr = Dat' +
      'a0005_1.RKEY INNER JOIN'#13#10'                      dbo.Data0015 ON d' +
      'bo.DATA0268.warehouse_ptr = dbo.Data0015.RKEY LEFT  JOIN'#13#10'      ' +
      '                dbo.Data0005 AS Data0005_2 ON dbo.DATA0268.allow' +
      '_submit_person = Data0005_2.RKEY'#13#10#13#10'where dbo.DATA0268.rkey =:rk' +
      'ey268'#13#10
    IndexFieldNames = 'rkey'
    Parameters = <
      item
        Name = 'rkey268'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 64
    Top = 48
    object ADS268rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS268DSDesigner: TStringField
      FieldName = #30003#39046#21333#21495
      Size = 10
    end
    object ADS268DSDesigner2: TDateTimeField
      FieldName = #30003#39046#26085#26399
    end
    object ADS268DSDesigner3: TStringField
      FieldName = #30003#35831#20154
      Size = 16
    end
    object ADS268DSDesigner4: TStringField
      FieldName = #23457#25209#20154
      Size = 16
    end
    object ADS268DSDesigner5: TDateTimeField
      FieldName = #23457#25209#26085#26399
    end
    object ADS268DSDesigner6: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object ADS268DSDesigner7: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object ADS268DSDesigner8: TStringField
      FieldName = #24037#21378#21517#31216
      Size = 10
    end
    object ADS268DSDesigner9: TStringField
      FieldName = #20801#35768#25552#20132#20154#21592#24037#21495
      Size = 10
    end
    object ADS268DSDesigner10: TStringField
      FieldName = #20801#35768#25552#20132#20154#21592
      Size = 16
    end
    object ADS268DSDesigner11: TDateTimeField
      FieldName = #20801#35768#25552#20132#26102#38388
    end
  end
  object ADS468: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    CommandText = 
      '   SELECT     dbo.Data0468.FLOW_NO,dbo.Data0468.QUAN_BOM AS '#30003#35831#25968#37327 +
      ', dbo.Data0468.QUAN_ISSUED AS '#21457#25918#25968#37327', dbo.Data0468.remark AS '#22791#27880', '#13 +
      #10'                      dbo.Data0017.INV_PART_NUMBER AS '#26448#26009#32534#30721', dbo' +
      '.Data0017.INV_PART_DESCRIPTION AS ['#21517#31216'/'#35268#26684'], dbo.Data0002.UNIT_NAM' +
      'E AS '#21333#20301','#13#10'                   data0017.quan_on_hand-data0017.QUAN' +
      '_ASSIGN as '#26377#25928#24211#23384',data0468.vendor as '#20379#24212#21830',ExReason as '#36229#39046#29702#30001#13#10'FROM   ' +
      '      dbo.Data0468 INNER JOIN'#13#10'                      dbo.Data001' +
      '7 ON dbo.Data0468.INVENT_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'   ' +
      '                   dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR =' +
      ' dbo.Data0002.RKEY'#13#10'                   '#13#10'WHERE  dbo.Data0468.FLO' +
      'W_NO=:rkey'
    DataSource = DS1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 64
    Top = 104
    object ADS468DSDesigner: TFloatField
      FieldName = #30003#35831#25968#37327
    end
    object ADS468DSDesigner2: TFloatField
      FieldName = #21457#25918#25968#37327
    end
    object ADS468DSDesigner3: TStringField
      FieldName = #22791#27880
      Size = 15
    end
    object ADS468DSDesigner4: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object ADS468DSDesigner5: TStringField
      FieldName = #21517#31216'/'#35268#26684
      ReadOnly = True
      Size = 100
    end
    object ADS468DSDesigner6: TStringField
      FieldName = #21333#20301
    end
    object ADS468FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object ADS468DSDesigner7: TFloatField
      FieldName = #26377#25928#24211#23384
      ReadOnly = True
    end
    object strngfldADS468DSDesigner8: TStringField
      FieldName = #20379#24212#21830
      Size = 30
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
    Left = 216
    Top = 99
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB468
    OnPrintingComplete = ppReport1PrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A5'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 148000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 11
    SaveAsTemplate = True
    Template.FileName = '..\NIERP\REPORT\rep268_1.rtm '
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
    Left = 208
    Top = 40
    Version = '7.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB468'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = #29983#20135#39046#26009#30003#35831#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 7144
        mmLeft = 70908
        mmTop = 4763
        mmWidth = 67733
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = #30003#39046#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 144198
        mmTop = 10848
        mmWidth = 19050
        BandType = 1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = #30003#39046#21333#21495
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 165100
        mmTop = 10583
        mmWidth = 26723
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = #30003#39046#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 144463
        mmTop = 16933
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = #30003#39046#26085#26399
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 163777
        mmTop = 16669
        mmWidth = 35719
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = #30003' '#35831' '#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 10848
        mmWidth = 17463
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = #30003#35831#20154
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4498
        mmLeft = 24606
        mmTop = 10848
        mmWidth = 28840
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = #37096#38376#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 73554
        mmTop = 15875
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = #37096#38376#21517#31216
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 92604
        mmTop = 15875
        mmWidth = 35454
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = #24037#21378#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 4233
        mmWidth = 17992
        BandType = 1
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = #24037#21378#21517#31216
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 24342
        mmTop = 3969
        mmWidth = 32808
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = #23457' '#25209' '#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5292
        mmLeft = 6085
        mmTop = 16140
        mmWidth = 16404
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = #23457#25209#20154
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 24606
        mmTop = 16933
        mmWidth = 33338
        BandType = 1
      end
      object pdbrcd1: TppDBBarCode
        UserName = 'pdbrcd1'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        DataField = #30003#39046#21333#21495
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 9260
        mmLeft = 146579
        mmTop = 265
        mmWidth = 44450
        BandType = 1
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        mmHeight = 7144
        mmLeft = 0
        mmTop = 0
        mmWidth = 194734
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 39952
        mmTop = 0
        mmWidth = 2910
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 115359
        mmTop = 0
        mmWidth = 2646
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 132027
        mmTop = 0
        mmWidth = 2910
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 158750
        mmTop = 0
        mmWidth = 3440
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = #26448#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10319
        mmTop = 1588
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = #21517#31216'/'#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 60325
        mmTop = 1588
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 148696
        mmTop = 1323
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 165100
        mmTop = 1852
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = #30003#35831#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 115888
        mmTop = 1852
        mmWidth = 13494
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 145786
        mmTop = 0
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = #23454#21457#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 132821
        mmTop = 1852
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 0
        mmTop = 0
        mmWidth = 194734
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = #20379#24212#21830
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 6350
        mmLeft = 159809
        mmTop = 1058
        mmWidth = 32808
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 192882
        mmTop = 0
        mmWidth = 1852
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 0
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 39952
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 115359
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 132027
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 158750
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #26448#26009#32534#30721
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB468'
        mmHeight = 7959
        mmLeft = 1058
        mmTop = 529
        mmWidth = 37592
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = #21517#31216'/'#35268#26684
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB468'
        mmHeight = 8213
        mmLeft = 40746
        mmTop = 265
        mmWidth = 73279
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = #21333#20301
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 4763
        mmLeft = 147109
        mmTop = 1588
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = #30003#35831#25968#37327
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 3969
        mmLeft = 116152
        mmTop = 2117
        mmWidth = 15346
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 145786
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = #23457#25209#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 121444
        mmTop = 6879
        mmWidth = 17992
        BandType = 8
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = #23457#25209#26085#26399
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 141552
        mmTop = 6614
        mmWidth = 42863
        BandType = 8
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = #22791#27880':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 124884
        mmTop = 794
        mmWidth = 9525
        BandType = 8
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = #22791#27880
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 4763
        mmLeft = 135732
        mmTop = 794
        mmWidth = 57150
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #20801#35768#25552#20132#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 6879
        mmWidth = 29104
        BandType = 8
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = #20801#35768#25552#20132#20154#21592
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 3969
        mmLeft = 34131
        mmTop = 6879
        mmWidth = 23283
        BandType = 8
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #20801#35768#25552#20132#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 6879
        mmWidth = 27517
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = #20801#35768#25552#20132#26102#38388
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 3969
        mmLeft = 86784
        mmTop = 6879
        mmWidth = 30427
        BandType = 8
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = #21457#26009#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 529
        mmWidth = 17463
        BandType = 8
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = '__________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 23019
        mmTop = 265
        mmWidth = 27781
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = #39046#26009#20154#31614#25910#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 62971
        mmTop = 1058
        mmWidth = 23019
        BandType = 8
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = '__________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 89429
        mmTop = 1058
        mmWidth = 27781
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppDB468: TppDBPipeline
    DataSource = DS2
    UserName = 'DB468'
    Left = 152
    Top = 104
    object ppDB468ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = #30003#35831#25968#37327
      FieldName = #30003#35831#25968#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppDB468ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = #21457#25918#25968#37327
      FieldName = #21457#25918#25968#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppDB468ppField3: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppDB468ppField4: TppField
      FieldAlias = #26448#26009#32534#30721
      FieldName = #26448#26009#32534#30721
      FieldLength = 25
      DisplayWidth = 25
      Position = 3
    end
    object ppDB468ppField5: TppField
      FieldAlias = #21517#31216'/'#35268#26684
      FieldName = #21517#31216'/'#35268#26684
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object ppDB468ppField6: TppField
      FieldAlias = #21333#20301
      FieldName = #21333#20301
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDB468ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLOW_NO'
      FieldName = 'FLOW_NO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDB468ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = #26377#25928#24211#23384
      FieldName = #26377#25928#24211#23384
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDB468ppField9: TppField
      FieldAlias = #20379#24212#21830
      FieldName = #20379#24212#21830
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object pfldDB468ppField10: TppField
      FieldAlias = #36229#39046#29702#30001
      FieldName = #36229#39046#29702#30001
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
  end
end
