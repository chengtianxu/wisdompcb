object Form_report1: TForm_report1
  Left = 574
  Top = 213
  Width = 297
  Height = 312
  Caption = #35774#35745'ECN'#23653#21382#34920#26684#24335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
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
    Left = 168
    Top = 48
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB35
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Duplex = dpVertical
    PrinterSetup.PaperName = 'A4 210x297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'R:\NIERP\Report\ECN_LIST.RTM'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 136
    Top = 48
    Version = '7.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB35'
    object ppHeaderBand5: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 38100
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 14817
        mmLeft = 794
        mmTop = 0
        mmWidth = 23548
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 6456
        mmLeft = 62706
        mmTop = 1323
        mmWidth = 68072
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'ECN'#23653#21382#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 81227
        mmTop = 8467
        mmWidth = 29898
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 157957
        mmTop = 4233
        mmWidth = 36777
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 170657
        mmTop = 9525
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = #26412#21378#32534#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 529
        mmTop = 23813
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = #23458#25143#22411#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 103452
        mmTop = 23813
        mmWidth = 19050
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'manu_part_number'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 4763
        mmLeft = 19844
        mmTop = 23813
        mmWidth = 37571
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'manu_part_desc'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 4763
        mmLeft = 123561
        mmTop = 23813
        mmWidth = 60061
        BandType = 0
      end
      object ppLine48: TppLine
        UserName = 'Line48'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 265
        mmTop = 29369
        mmWidth = 196057
        BandType = 0
      end
      object ppLine49: TppLine
        UserName = 'Line49'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 265
        mmTop = 29369
        mmWidth = 2117
        BandType = 0
      end
      object ppLine50: TppLine
        UserName = 'Line50'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 8996
        mmTop = 29369
        mmWidth = 2117
        BandType = 0
      end
      object ppLine51: TppLine
        UserName = 'Line51'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 28575
        mmTop = 29369
        mmWidth = 1588
        BandType = 0
      end
      object ppLine52: TppLine
        UserName = 'Line52'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 103452
        mmTop = 29369
        mmWidth = 2117
        BandType = 0
      end
      object ppLine53: TppLine
        UserName = 'Line53'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 121444
        mmTop = 29369
        mmWidth = 2117
        BandType = 0
      end
      object ppLine54: TppLine
        UserName = 'Line54'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 136261
        mmTop = 29369
        mmWidth = 2117
        BandType = 0
      end
      object ppLine55: TppLine
        UserName = 'Line55'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 152400
        mmTop = 29369
        mmWidth = 2117
        BandType = 0
      end
      object ppLine56: TppLine
        UserName = 'Line56'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 194205
        mmTop = 29369
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        AutoSize = False
        Caption = #24207#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 1058
        mmTop = 31750
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        AutoSize = False
        Caption = #21378#32534#29256#26412
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4064
        mmLeft = 10054
        mmTop = 31750
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        AutoSize = False
        Caption = #21464#26356#20869#23481#25688#35201
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 29633
        mmTop = 31750
        mmWidth = 73025
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        AutoSize = False
        Caption = #26469#28304
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 104246
        mmTop = 31750
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = #26032#25991#20214
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 122238
        mmTop = 31750
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        AutoSize = False
        Caption = #24037#31243#24072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 137054
        mmTop = 31750
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        AutoSize = False
        Caption = #21019#24314#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 152929
        mmTop = 31750
        mmWidth = 19315
        BandType = 0
      end
      object ppLine57: TppLine
        UserName = 'Line57'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 172773
        mmTop = 29369
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        AutoSize = False
        Caption = 'ECN'#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 173832
        mmTop = 31750
        mmWidth = 21431
        BandType = 0
      end
      object ppLine68: TppLine
        UserName = 'Line68'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 265
        mmTop = 37835
        mmWidth = 196057
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppLine58: TppLine
        UserName = 'Line58'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 265
        mmTop = 9525
        mmWidth = 196057
        BandType = 4
      end
      object ppLine59: TppLine
        UserName = 'Line59'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 265
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine60: TppLine
        UserName = 'Line501'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 8996
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine61: TppLine
        UserName = 'Line61'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 28575
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine62: TppLine
        UserName = 'Line62'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 103452
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine63: TppLine
        UserName = 'Line63'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 121444
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine64: TppLine
        UserName = 'Line64'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 136261
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine65: TppLine
        UserName = 'Line65'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 152400
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine66: TppLine
        UserName = 'Line66'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 172773
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppLine67: TppLine
        UserName = 'Line67'
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 9525
        mmLeft = 194205
        mmTop = 0
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'serial_no'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 2910
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'part_number'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 3969
        mmLeft = 9790
        mmTop = 2910
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        CharWrap = True
        DataField = 'text'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 3969
        mmLeft = 29369
        mmTop = 2910
        mmWidth = 73554
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'source'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 3969
        mmLeft = 104246
        mmTop = 2910
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'if_gerber'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 3969
        mmLeft = 122238
        mmTop = 2910
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText40'
        DataField = 'engineer'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 3969
        mmLeft = 136790
        mmTop = 2910
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText41'
        DataField = 'enter_date'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 3969
        mmLeft = 152929
        mmTop = 2910
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'ecn_no'
        DataPipeline = ppDB35
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB35'
        mmHeight = 3969
        mmLeft = 173832
        mmTop = 2910
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLabel53: TppLabel
        UserName = 'Label53'
        AutoSize = False
        Caption = 'Wisdompcb.ERP(Rev:3.0.0.4)'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #21326#25991#34892#26999
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 3175
        mmWidth = 59002
        BandType = 8
      end
      object ppLine69: TppLine
        UserName = 'Line69'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        AutoSize = False
        Caption = #28145#22323#24066#38156#27954#40527#35802#36719#20214#26377#38480#20844#21496
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #21326#25991#34892#26999
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5292
        mmLeft = 130969
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
    end
  end
  object ppDB35: TppDBPipeline
    DataSource = DS35
    UserName = 'DB35'
    Left = 104
    Top = 48
  end
  object DS35: TDataSource
    DataSet = aq35
    Left = 72
    Top = 48
  end
  object aq35: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey25'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      
        'select d35.serial_no,d35.part_number,d35.text,d35.source,d35.if_' +
        'gerber,'
      '       d35.engineer,d35.enter_date,d35.ecn_no,'
      '       d25.manu_part_number,d25.manu_part_desc '
      
        'from data0035 d35 inner join data0025 d25 on d35.part_ptr=d25.rk' +
        'ey'
      'where d35.part_ptr=:rkey25'
      'order by d35.serial_no')
    Left = 40
    Top = 48
    object aq35serial_no: TIntegerField
      FieldName = 'serial_no'
    end
    object aq35part_number: TStringField
      FieldName = 'part_number'
    end
    object aq35text: TStringField
      FieldName = 'text'
      Size = 100
    end
    object aq35source: TStringField
      FieldName = 'source'
      Size = 10
    end
    object aq35if_gerber: TStringField
      FieldName = 'if_gerber'
      Size = 10
    end
    object aq35engineer: TStringField
      FieldName = 'engineer'
    end
    object aq35enter_date: TDateTimeField
      FieldName = 'enter_date'
    end
    object aq35ecn_no: TStringField
      FieldName = 'ecn_no'
      Size = 15
    end
    object aq35manu_part_number: TStringField
      FieldName = 'manu_part_number'
    end
    object aq35manu_part_desc: TStringField
      FieldName = 'manu_part_desc'
      Size = 40
    end
  end
  object ads493: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 40
    Top = 88
    object ads493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ads493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ads493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ads493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ads493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ads493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DS493: TDataSource
    DataSet = ads493
    Left = 72
    Top = 88
  end
  object ppDB493: TppDBPipeline
    DataSource = DS493
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 104
    Top = 88
  end
end
