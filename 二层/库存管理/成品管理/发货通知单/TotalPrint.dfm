object Form_TotalPrint: TForm_TotalPrint
  Left = 225
  Top = 118
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#20851#27719#24635#25171#21360#26597#35810
  ClientHeight = 483
  ClientWidth = 785
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 785
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label4: TLabel
      Left = 20
      Top = 12
      Width = 86
      Height = 13
      Caption = #20986#36135#26085#26399'  '#20174':'
    end
    object Label3: TLabel
      Left = 207
      Top = 12
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object Label1: TLabel
      Left = 358
      Top = 11
      Width = 65
      Height = 13
      Caption = #27719#24635#26041#24335#65306
    end
    object Button1: TButton
      Left = 501
      Top = 6
      Width = 63
      Height = 24
      Caption = #27719#24635#26597#35810
      TabOrder = 0
      OnClick = Button1Click
    end
    object dtpk1: TDateTimePicker
      Left = 107
      Top = 8
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 1
    end
    object dtpk2: TDateTimePicker
      Left = 229
      Top = 8
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 417
      Top = 7
      Width = 84
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 3
      Text = #20840#37096
      OnClick = ComboBox1Click
      Items.Strings = (
        #20840#37096
        #32654#20803
        #28207#24065
        #27431#20803
        #26085#20803
        #20154#27665#24065)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 442
    Width = 785
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button2: TButton
      Left = 536
      Top = 10
      Width = 75
      Height = 25
      Caption = #20851#38381
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 172
      Top = 9
      Width = 75
      Height = 25
      Caption = #25171#21360#35013#31665#21333
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button5: TButton
      Left = 264
      Top = 10
      Width = 75
      Height = 25
      Caption = #25171#21360#21457#31080
      Enabled = False
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 355
      Top = 10
      Width = 75
      Height = 25
      Caption = #25171#21360#21512#21516
      Enabled = False
      TabOrder = 3
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 445
      Top = 10
      Width = 75
      Height = 25
      Caption = #23548#20986#25968#25454
      Enabled = False
      TabOrder = 4
      OnClick = Button7Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 36
    Width = 785
    Height = 406
    Hint = #21452#20987#21024#38500#19968#26465#35760#24405
    Align = alClient
    DataSource = DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = #24207#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Title.Caption = #23458#25143#22411#21495
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_5'
        Title.Caption = #21333#21482#23610#23544
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'layers'
        Title.Caption = #23618#25968
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part_price'
        Title.Caption = #21333#20215
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#25968#37327
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#20540
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#31665#25968
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#20928#37325
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = #24635#27611#37325
        Visible = True
      end>
  end
  object DB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 373
    Top = 211
    object DB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object DB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object DB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object DB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object DB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object DB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object DB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object DB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = DB64
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'D:\SJSYS\NIERP\Report\TotalPack529.rtm'
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
    Left = 405
    Top = 179
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'DB64'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 25929
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 8202
        mmLeft = 71702
        mmTop = 794
        mmWidth = 55033
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'ship_address'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 4763
        mmLeft = 86519
        mmTop = 10319
        mmWidth = 25135
        BandType = 1
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = DB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'DB493'
        mmHeight = 19050
        mmLeft = 5027
        mmTop = 529
        mmWidth = 25400
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'TEL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 78581
        mmTop = 16668
        mmWidth = 8996
        BandType = 1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'SITE_INFO_PHONE'
        DataPipeline = DB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'DB493'
        mmHeight = 4763
        mmLeft = 88636
        mmTop = 16668
        mmWidth = 39158
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = '383822654'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 37306
        mmTop = 18256
        mmWidth = 21146
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
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
    Left = 403
    Top = 211
  end
  object Aq493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 315
    Top = 209
    object Aq493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object Aq493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object Aq493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object Aq493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object Aq493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object Aq493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource3: TDataSource
    DataSet = Aq493
    Left = 345
    Top = 211
  end
  object DB64: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB64'
    Left = 375
    Top = 181
    object DB64ppField1: TppField
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DB64ppField2: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DB64ppField3: TppField
      FieldAlias = 'layers'
      FieldName = 'layers'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DB64ppField4: TppField
      FieldAlias = 'ANALYSIS_CODE_5'
      FieldName = 'ANALYSIS_CODE_5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DB64ppField5: TppField
      FieldAlias = 'part_price'
      FieldName = 'part_price'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB64ppField6: TppField
      FieldAlias = #24635#20928#37325
      FieldName = #24635#20928#37325
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DB64ppField8: TppField
      FieldAlias = #24635#20540
      FieldName = #24635#20540
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DB64ppField7: TppField
      FieldAlias = #24635#27611#37325
      FieldName = #24635#27611#37325
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DB64ppField9: TppField
      FieldAlias = #24635#25968#37327
      FieldName = #24635#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DB64ppField10: TppField
      FieldAlias = #24635#31665#25968
      FieldName = #24635#31665#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DB64ppField11: TppField
      FieldAlias = 'curr_code'
      FieldName = 'curr_code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DB64ppField12: TppField
      FieldAlias = 'exch_rate'
      FieldName = 'exch_rate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DB64ppField13: TppField
      FieldAlias = #20998#32452
      FieldName = #20998#32452
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    OnCalcFields = ADOQuery1CalcFields
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'str1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'str2'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'str3'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'str4'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT distinct data0530.remark1 as MANU_PART_DESC,data0025.laye' +
        'rs,'
      
        'Data0025.ANALYSIS_CODE_5,data0001.curr_code,data0001.exch_rate,d' +
        'ata0064.part_price'
      'FROM Data0530 Inner  JOIN '
      '      Data0064 ON Data0530.rkey64_ptr=Data0064.rkey  INNER JOIN'
      '      Data0529 ON Data0530.rkey529_ptr=Data0529.rkey inner join'
      '      Data0060 ON Data0064.SO_PTR=Data0060.rkey inner join'
      
        '      Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY inner j' +
        'oin'
      '      Data0001 ON Data0060.CURRENCY_PTR = Data0001.RKEY '
      'WHERE '
      '       (Data0529.DEPA_DATE>=:dtpk1)'
      '      AND (Data0529.DEPA_DATE <=:dtpk2)'
      '      AND (Data0529.tstatus<>:v1)'
      '      AND (Data0529.tstatus<>:v2)'
      '      AND (Data0529.tstatus<>:v3) '
      '      AND (Data0001.curr_code<>:str1)'
      '      AND (Data0001.curr_code<>:str2)'
      '      AND (Data0001.curr_code<>:str3)'
      '      AND (Data0001.curr_code<>:str4)'
      'order by data0025.layers,data0530.remark1'
      '')
    Left = 313
    Top = 181
    object ADOQuery1IntegerField3: TIntegerField
      FieldKind = fkCalculated
      FieldName = #24207#21495
      Calculated = True
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 50
    end
    object ADOQuery1layers: TWordField
      FieldName = 'layers'
    end
    object ADOQuery1ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
      Size = 30
    end
    object ADOQuery1part_price: TFloatField
      FieldName = 'part_price'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
    end
    object ADOQuery1FloatField: TFloatField
      FieldKind = fkCalculated
      FieldName = #24635#20928#37325
      Calculated = True
    end
    object ADOQuery1FloatField2: TFloatField
      FieldKind = fkCalculated
      FieldName = #24635#27611#37325
      Calculated = True
    end
    object ADOQuery1FloatField3: TFloatField
      FieldKind = fkCalculated
      FieldName = #24635#20540
      Calculated = True
    end
    object ADOQuery1IntegerField: TIntegerField
      FieldKind = fkCalculated
      FieldName = #24635#25968#37327
      Calculated = True
    end
    object ADOQuery1IntegerField2: TIntegerField
      FieldKind = fkCalculated
      FieldName = #24635#31665#25968
      Calculated = True
    end
    object ADOQuery1curr_code: TStringField
      FieldName = 'curr_code'
      Size = 5
    end
    object ADOQuery1exch_rate: TFloatField
      FieldName = 'exch_rate'
    end
    object ADOQuery1IntegerField4: TIntegerField
      FieldKind = fkCalculated
      FieldName = #20998#32452
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 344
    Top = 182
  end
  object ADO530: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = Null
      end
      item
        Name = 'v1'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v2'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'v3'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'str1'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'price'
        Attributes = [paSigned]
        DataType = ftFloat
        NumericScale = 255
        Precision = 15
        Size = 8
        Value = Null
      end
      item
        Name = 'layers'
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = Null
      end
      item
        Name = 'str2'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      'SELECT     '
      
        '      round(sum(Data0530.quan_declare*data0064.REPORT_UNIT_VALUE' +
        '1*0.001),2) as '#39#20928#37325#39','
      '      round(sum(Data0530.WEIGHT),2) as '#39#27611#37325#39','
      
        '      sum(data0530.quan_declare) as '#39#25968#37327#39', sum(Data0530.CARTONS_N' +
        'O) as '#39#31665#25968#39','
      '      sum(data0530.quan_declare*data0064.part_price) as '#39#24635#20540#39
      'FROM Data0530 INNER JOIN '
      '      Data0064 ON Data0530.rkey64_ptr=Data0064.rkey  INNER JOIN'
      '      Data0529 ON Data0530.rkey529_ptr=Data0529.rkey INNER JOIN '
      '      Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'
      '      Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY '
      'WHERE '
      '       (Data0529.DEPA_DATE >=:dtpk1)'
      '      AND (Data0529.DEPA_DATE <=:dtpk2)'
      '      AND (Data0529.tstatus<>:v1)'
      '      AND (Data0529.tstatus<>:v2)'
      '      AND (Data0529.tstatus<>:v3)'
      '      and  (Data0530.remark1=:str1)'
      '     and (data0064.part_price=:price)'
      '    and (data0025.layers=:layers)'
      '   and(data0025.ANALYSIS_CODE_5=:str2)')
    Left = 315
    Top = 238
    object ADO530DSDesigner: TBCDField
      FieldName = #20928#37325
      ReadOnly = True
      Precision = 32
      Size = 7
    end
    object ADO530DSDesigner2: TIntegerField
      FieldName = #31665#25968
      ReadOnly = True
    end
    object ADO530DSDesigner3: TBCDField
      FieldName = #27611#37325
      ReadOnly = True
      Precision = 32
      Size = 3
    end
    object ADO530DSDesigner4: TIntegerField
      FieldName = #25968#37327
      ReadOnly = True
    end
    object ADO530DSDesigner5: TFloatField
      FieldName = #24635#20540
      ReadOnly = True
    end
  end
end
