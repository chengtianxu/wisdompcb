object Form_BzReport: TForm_BzReport
  Left = 308
  Top = 174
  Width = 471
  Height = 315
  Caption = 'Form_BzReport'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADO493: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 40
    Top = 64
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
  object DataSource1: TDataSource
    DataSet = ADO22
    Left = 88
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = ADO493
    Left = 88
    Top = 64
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB22
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 2540
    PrinterSetup.mmMarginLeft = 11430
    PrinterSetup.mmMarginRight = 7620
    PrinterSetup.mmMarginTop = 7620
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\SJSYS\NIERP\Report\Wlbzreport.rtm'
    Units = utMillimeters
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 280
    Top = 24
    Version = '7.01'
    mmColumnWidth = 196850
    DataPipelineName = 'ppDB22'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 105304
      mmPrintPosition = 0
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
        mmLeft = 4233
        mmTop = 3175
        mmWidth = 20638
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 6435
        mmLeft = 58245
        mmTop = 3175
        mmWidth = 73745
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #29289#26009#26631#35782#21345
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 74613
        mmTop = 15081
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'Company_Name3'
        DataPipeline = ppDB493
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4022
        mmLeft = 62754
        mmTop = 10583
        mmWidth = 50969
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 17992
        mmLeft = 3704
        mmTop = 32015
        mmWidth = 116152
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 17992
        mmLeft = 3704
        mmTop = 49213
        mmWidth = 116152
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 17992
        mmLeft = 3704
        mmTop = 67204
        mmWidth = 116152
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 17992
        mmLeft = 3704
        mmTop = 85196
        mmWidth = 116152
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 8467
        mmLeft = 119856
        mmTop = 23813
        mmWidth = 69056
        BandType = 0
      end
      object ppDBBarCode1: TppDBBarCode
        UserName = 'DBBarCode1'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = #26465#24418#30721
        DataPipeline = ppDB22
        PrintHumanReadable = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        DataPipelineName = 'ppDB22'
        mmHeight = 5821
        mmLeft = 141288
        mmTop = 25135
        mmWidth = 22754
        BandType = 0
        mmBarWidth = 254
        mmWideBarRatio = 25400
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 70908
        mmLeft = 119856
        mmTop = 32279
        mmWidth = 69056
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20379' '#24212' '#21830':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 4498
        mmTop = 32808
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #26448#26009#21517#31216':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 4498
        mmTop = 50006
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #35268#26684#22411#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 4498
        mmTop = 67998
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #26448#26009#32534#30721':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 4498
        mmTop = 85725
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 124619
        mmTop = 33338
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #25910#20837
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 138642
        mmTop = 33338
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #21457#20986
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 150813
        mmTop = 33338
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #32467#23384
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 163248
        mmTop = 33338
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #32463#25163#20154
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 175419
        mmTop = 33338
        mmWidth = 12700
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #20379#24212#21830#21517#31216
        DataPipeline = ppDB22
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 15610
        mmLeft = 24077
        mmTop = 33073
        mmWidth = 94721
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = #26448#26009#21517#31216
        DataPipeline = ppDB22
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 15610
        mmLeft = 24077
        mmTop = 50271
        mmWidth = 94721
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = #35268#26684#22411#21495
        DataPipeline = ppDB22
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 15610
        mmLeft = 24077
        mmTop = 67998
        mmWidth = 94721
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = #26448#26009#32534#30721
        DataPipeline = ppDB22
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 15610
        mmLeft = 24077
        mmTop = 85990
        mmWidth = 94721
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 120121
        mmTop = 39158
        mmWidth = 68527
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 46038
        mmWidth = 68527
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 53181
        mmWidth = 68527
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 60061
        mmWidth = 68527
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 67469
        mmWidth = 68527
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 74877
        mmWidth = 68527
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 82286
        mmWidth = 68527
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 89429
        mmWidth = 68527
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 96573
        mmWidth = 68527
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 70908
        mmLeft = 137319
        mmTop = 32279
        mmWidth = 2646
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 70908
        mmLeft = 174361
        mmTop = 32279
        mmWidth = 2646
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line102'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 70908
        mmLeft = 161661
        mmTop = 32279
        mmWidth = 2646
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line103'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 70908
        mmLeft = 148961
        mmTop = 32015
        mmWidth = 2646
        BandType = 0
      end
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
    Left = 280
    Top = 56
  end
  object ADO22: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    OnCalcFields = ADO22CalcFields
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0017.rkey as rkey17,data0023.rkey as rkey23,cast(data' +
        '0017.rkey as varchar)+'#39'#'#39'+cast(data0023.rkey as varchar) as '#26465#24418#30721','
      'data0023.CODE as '#20379#24212#21830#20195#30721',data0023.SUPPLIER_NAME as '#20379#24212#21830#21517#31216','
      'data0023.ABBR_NAME as '#20379#24212#21830',data0017.INV_NAME as '#26448#26009#21517#31216','
      
        'data0017.INV_DESCRIPTION as '#35268#26684#22411#21495',data0017.INV_PART_NUMBER as '#26448#26009#32534 +
        #30721','
      'data0134.quantity as '#25910#20837','
      'CONVERT(varchar(100), data0133.ship_date, 23) as '#26085#26399
      'from data0134'
      'inner join data0133 on data0134.GRN_PTR=data0133.rkey'
      'inner join data0023 on data0133.supp_ptr=data0023.rkey'
      'inner join data0017 on data0134.INVENTORY_PTR=data0017.rkey'
      'where data0134.rkey=:rkey')
    Left = 40
    Top = 24
    object ADO22DSDesigner: TStringField
      FieldName = #26465#24418#30721
      ReadOnly = True
      Size = 61
    end
    object ADO22DSDesigner2: TStringField
      FieldName = #20379#24212#21830#20195#30721
      Size = 10
    end
    object ADO22DSDesigner3: TStringField
      FieldName = #20379#24212#21830#21517#31216
      Size = 100
    end
    object ADO22DSDesigner4: TStringField
      FieldName = #20379#24212#21830
      Size = 16
    end
    object ADO22DSDesigner5: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object ADO22DSDesigner6: TStringField
      FieldName = #35268#26684#22411#21495
      Size = 70
    end
    object ADO22DSDesigner7: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object ADO22DSDesigner8: TFloatField
      FieldName = #25910#20837
    end
    object ADO22DSDesigner10: TStringField
      FieldName = #26085#26399
      ReadOnly = True
      Size = 100
    end
    object ADO22rkey17: TAutoIncField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object ADO22rkey23: TAutoIncField
      FieldName = 'rkey23'
      ReadOnly = True
    end
    object ADO22FloatField: TFloatField
      FieldKind = fkCalculated
      FieldName = #32467#23384
      Calculated = True
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB493'
    Left = 144
    Top = 64
    object ppDBP493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBP493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBP493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBP493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBP493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBP493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBP493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBP493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBP493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object ADOQuery1: TADOQuery
    Connection = dm.ADOConnection1
    Parameters = <
      item
        Name = 'rkey17'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'rkey23'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select sum(data0134.quan_on_hand) as qty from data0134'
      'inner join data0133 on data0134.grn_ptr=data0133.rkey'
      'inner join data0023 on data0133.supp_ptr=data0023.rkey'
      'inner join data0017 on data0134.INVENTORY_PTR=data0017.rkey'
      'where data0017.rkey=:rkey17 and data0023.rkey=:rkey23'
      'group by data0017.rkey,data0023.rkey')
    Left = 136
    Top = 112
    object ADOQuery1qty: TBCDField
      FieldName = 'qty'
      ReadOnly = True
      Precision = 32
    end
  end
  object ppDB22: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB22'
    Left = 144
    Top = 24
  end
end
