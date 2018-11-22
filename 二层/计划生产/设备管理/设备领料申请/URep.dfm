object Report_Frm: TReport_Frm
  Left = 402
  Top = 172
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
  object ppDB468: TppDBPipeline
    DataSource = DS2
    UserName = 'DB468'
    Left = 152
    Top = 88
    MasterDataPipelineName = 'ppDB268'
    object ppDB468ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = #30003#35831#25968#37327
      FieldName = #30003#35831#25968#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
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
  end
  object DS1: TDataSource
    DataSet = ADS268
    Left = 112
    Top = 48
  end
  object DS2: TDataSource
    DataSet = ADS468
    Left = 112
    Top = 91
  end
  object ADS268: TADODataSet
    Connection = DM_frm.ADOConnection1
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
    Connection = DM_frm.ADOConnection1
    CursorType = ctStatic
    CommandText = 
      'SELECT     dbo.Data0468.FLOW_NO,dbo.Data0468.QUAN_BOM AS '#30003#35831#25968#37327', d' +
      'bo.Data0468.QUAN_ISSUED AS '#21457#25918#25968#37327', dbo.Data0468.VENDOR AS '#22791#27880', '#13#10'  ' +
      '                    dbo.Data0017.INV_PART_NUMBER AS '#26448#26009#32534#30721', dbo.Da' +
      'ta0017.INV_PART_DESCRIPTION AS ['#21517#31216'/'#35268#26684'], dbo.Data0002.UNIT_NAME A' +
      'S '#21333#20301#13#10'                      '#13#10'FROM         dbo.Data0468 INNER JO' +
      'IN'#13#10'                      dbo.Data0017 ON dbo.Data0468.INVENT_PT' +
      'R = dbo.Data0017.RKEY INNER JOIN'#13#10'                      dbo.Data' +
      '0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY'#13#10#13#10'WHERE' +
      '  dbo.Data0468.FLOW_NO=:rkey'
    DataSource = DS1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 64
    Top = 88
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
    Left = 208
    Top = 91
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB468
    OnPrintingComplete = ppReport1PrintingComplete
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 0
    PrinterSetup.mmPaperWidth = 0
    PrinterSetup.PaperSize = 150
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 208
    Top = 48
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB468'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 7350404
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
        AutoSize = False
        Caption = #29983#20135#39046#26009#30003#35831#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 1890187
        mmLeft = 18901342
        mmTop = 1050133
        mmWidth = 17921059
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        AutoSize = False
        Caption = #30003#39046#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 1890187
        mmTop = 3430330
        mmWidth = 4760393
        BandType = 1
      end
      object ppDBText8: TppDBText
        UserName = 'ppDBText8'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1260213
        mmLeft = 6930510
        mmTop = 3430330
        mmWidth = 10640769
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        AutoSize = False
        Caption = #30003#39046#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 1750222
        mmTop = 5390367
        mmWidth = 4760393
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1260213
        mmLeft = 6860395
        mmTop = 5250402
        mmWidth = 9450671
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        AutoSize = False
        Caption = #30003#35831#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 19111157
        mmTop = 3430330
        mmWidth = 3640145
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1190098
        mmLeft = 22961646
        mmTop = 3360215
        mmWidth = 7630599
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'ppLabel12'
        AutoSize = False
        Caption = #37096#38376#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 19041307
        mmTop = 5460482
        mmWidth = 4760393
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'ppDBText11'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1260213
        mmLeft = 24081629
        mmTop = 5460482
        mmWidth = 9380556
        BandType = 1
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        AutoSize = False
        Caption = #24037#21378#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 37662454
        mmTop = 3500180
        mmWidth = 4760393
        BandType = 1
      end
      object ppDBText12: TppDBText
        UserName = 'ppDBText12'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1260213
        mmLeft = 42702777
        mmTop = 3500180
        mmWidth = 8680467
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 1890187
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'ppShape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 1890187
        mmLeft = 0
        mmTop = 0
        mmWidth = 53525315
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 1890187
        mmLeft = 12670921
        mmTop = 0
        mmWidth = 769939
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 1890187
        mmLeft = 31711963
        mmTop = 0
        mmWidth = 700089
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 1890187
        mmLeft = 36682436
        mmTop = 0
        mmWidth = 910168
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 1890187
        mmLeft = 42002688
        mmTop = 0
        mmWidth = 910168
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        AutoSize = False
        Caption = #26448#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 2730241
        mmTop = 420159
        mmWidth = 4760393
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        AutoSize = False
        Caption = #21517#31216'/'#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 19951211
        mmTop = 420159
        mmWidth = 5040323
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        AutoSize = False
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1064156
        mmLeft = 38152463
        mmTop = 420159
        mmWidth = 2520161
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        AutoSize = False
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 45712947
        mmTop = 490009
        mmWidth = 2520161
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        AutoSize = False
        Caption = #30003#35831#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 32062008
        mmTop = 560124
        mmWidth = 4480199
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 2240232
      mmPrintPosition = 0
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2240232
        mmLeft = 0
        mmTop = 0
        mmWidth = 53525315
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 2240232
        mmLeft = 52993501
        mmTop = 0
        mmWidth = 560124
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 2240232
        mmLeft = 0
        mmTop = 0
        mmWidth = 1190098
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 2240232
        mmLeft = 12670921
        mmTop = 0
        mmWidth = 420159
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 2240232
        mmLeft = 31711963
        mmTop = 0
        mmWidth = 1190098
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 2240232
        mmLeft = 36682436
        mmTop = 0
        mmWidth = 560124
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 2240232
        mmLeft = 42002688
        mmTop = 0
        mmWidth = 560124
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 1064156
        mmLeft = 560124
        mmTop = 420159
        mmWidth = 11620788
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 1064156
        mmLeft = 13160930
        mmTop = 490009
        mmWidth = 18201253
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 1260213
        mmLeft = 37592604
        mmTop = 420159
        mmWidth = 3710259
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataPipeline = ppDB468
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB468'
        mmHeight = 1064156
        mmLeft = 42632927
        mmTop = 420159
        mmWidth = 10360575
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
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
        mmHeight = 1050133
        mmLeft = 32622132
        mmTop = 560124
        mmWidth = 3500180
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4060304
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        AutoSize = False
        Caption = #23457#25209#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 840054
        mmTop = 769939
        mmWidth = 3640145
        BandType = 8
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1260213
        mmLeft = 4760393
        mmTop = 769939
        mmWidth = 8820697
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        AutoSize = False
        Caption = #23457#25209#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 14630958
        mmTop = 840054
        mmWidth = 4760393
        BandType = 8
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1260213
        mmLeft = 19671281
        mmTop = 840054
        mmWidth = 11340858
        BandType = 8
      end
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        AutoSize = False
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 33042291
        mmTop = 910168
        mmWidth = 2520161
        BandType = 8
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1260213
        mmLeft = 35912496
        mmTop = 769939
        mmWidth = 16311066
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        Caption = #20801#35768#25552#20132#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 769939
        mmTop = 2520161
        mmWidth = 7700449
        BandType = 8
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1050133
        mmLeft = 9030512
        mmTop = 2520161
        mmWidth = 6160306
        BandType = 8
      end
      object ppLabel16: TppLabel
        UserName = 'ppLabel16'
        Caption = #20801#35768#25552#20132#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 1050133
        mmLeft = 15471012
        mmTop = 2520161
        mmWidth = 7280554
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText14'
        DataPipeline = ppDB268
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB268'
        mmHeight = 1050133
        mmLeft = 22961646
        mmTop = 2520161
        mmWidth = 8050493
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
end
