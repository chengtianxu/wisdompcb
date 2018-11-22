object frm_report_zx: Tfrm_report_zx
  Left = 621
  Top = 238
  Width = 525
  Height = 379
  Caption = 'frm_report_zx'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADO493: TADOQuery
    Active = True
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 57
    Top = 52
    object ADO493Company_Name: TStringField
      FieldName = 'Company_Name'
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
    DataSet = ADO493
    Left = 96
    Top = 52
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 137
    Top = 52
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
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
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 304
    Top = 80
  end
  object qry235: TADOQuery
    Active = True
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey235'
        DataType = ftInteger
        Size = 1
        Value = 0
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0235.goods_name , dbo.Data0235.goods_guige, d' +
        'bo.Data0235.goods_type, dbo.Data0002.UNIT_NAME, dbo.Data0016.LOC' +
        'ATION AS '#20179#24211#20301#32622', '
      
        '                      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.' +
        'WAREHOUSE_NAME, dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.CODE, '
      
        '                      dbo.Data0023.ABBR_NAME AS '#20379#24212#21830#31616#31216', dbo.Data0' +
        '456.ship_DATE, '
      
        '                      dbo.Data0235.QUAN_ON_HAND AS '#24403#21069#24211#23384#25968#37327', dbo.D' +
        'ata0235.REF_NUMBER, '
      
        '                      dbo.Data0070.PO_NUMBER,data0235.DATE_RECD,' +
        ' dbo.Data0235.cust_decl '
      'FROM         dbo.Data0002 INNER JOIN'
      
        '                      dbo.Data0235 ON dbo.Data0002.RKEY = dbo.Da' +
        'ta0235.unit_ptr INNER JOIN  '
      
        '                      dbo.Data0456 ON dbo.Data0235.GRN_PTR = dbo' +
        '.Data0456.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0456.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0235.location_ptr ' +
        '= dbo.Data0016.RKEY left JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.' +
        'Data0070.RKEY'
      'WHERE     data0235.rkey = :rkey235')
    Left = 56
    Top = 112
    object qry235goods_name: TStringField
      FieldName = 'goods_name'
      Size = 60
    end
    object qry235goods_guige: TStringField
      FieldName = 'goods_guige'
      Size = 200
    end
    object qry235goods_type: TStringField
      FieldName = 'goods_type'
    end
    object qry235UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object qry235DSDesigner: TStringField
      FieldName = #20179#24211#20301#32622
    end
    object qry235WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object qry235WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object qry235SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object qry235CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object qry235DSDesigner2: TStringField
      FieldName = #20379#24212#21830#31616#31216
      Size = 16
    end
    object qry235ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object qry235DSDesigner3: TBCDField
      FieldName = #24403#21069#24211#23384#25968#37327
      Precision = 10
      Size = 3
    end
    object qry235REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      FixedChar = True
      Size = 15
    end
    object qry235PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object qry235DATE_RECD: TDateTimeField
      FieldName = 'DATE_RECD'
    end
    object qry235cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
  end
  object ds235: TDataSource
    DataSet = qry235
    Left = 104
    Top = 112
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = ds235
    UserName = 'DBPipeline1'
    Left = 152
    Top = 112
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'goods_name'
      FieldName = 'goods_name'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'goods_guige'
      FieldName = 'goods_guige'
      FieldLength = 200
      DisplayWidth = 200
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'goods_type'
      FieldName = 'goods_type'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = #20179#24211#20301#32622
      FieldName = #20179#24211#20301#32622
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'WAREHOUSE_CODE'
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'WAREHOUSE_NAME'
      FieldName = 'WAREHOUSE_NAME'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'SUPPLIER_NAME'
      FieldName = 'SUPPLIER_NAME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'CODE'
      FieldName = 'CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = #20379#24212#21830#31616#31216
      FieldName = #20379#24212#21830#31616#31216
      FieldLength = 16
      DisplayWidth = 16
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'ship_DATE'
      FieldName = 'ship_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = #24403#21069#24211#23384#25968#37327
      FieldName = #24403#21069#24211#23384#25968#37327
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 11
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'REF_NUMBER'
      FieldName = 'REF_NUMBER'
      FieldLength = 15
      DisplayWidth = 15
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 15
      DisplayWidth = 15
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'DATE_RECD'
      FieldName = 'DATE_RECD'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'cust_decl'
      FieldName = 'cust_decl'
      FieldLength = 50
      DisplayWidth = 50
      Position = 15
    end
  end
  object ppReport1: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A5'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 147902
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 11
    Template.FileName = 'D:\sjsys\NIERP\Report\Wlbzreport_zx.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 80
    Version = '7.01'
    mmColumnWidth = 197379
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 131498
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 94456
        mmLeft = 119856
        mmTop = 25665
        mmWidth = 69056
        BandType = 0
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
        mmLeft = 9260
        mmTop = 3440
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
        mmLeft = 63273
        mmTop = 3440
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
        mmLeft = 79640
        mmTop = 14023
        mmWidth = 24871
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
        mmTop = 26723
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
        mmTop = 26723
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
        mmTop = 26723
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
        mmTop = 26723
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
        mmTop = 26723
        mmWidth = 12700
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 120121
        mmTop = 32544
        mmWidth = 68527
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 39423
        mmWidth = 68527
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 46567
        mmWidth = 68527
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 53446
        mmWidth = 68527
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 60854
        mmWidth = 68527
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 68263
        mmWidth = 68527
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 75406
        mmWidth = 68527
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 82550
        mmWidth = 68527
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 119856
        mmTop = 89165
        mmWidth = 69056
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 94456
        mmLeft = 137319
        mmTop = 25665
        mmWidth = 2646
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 94192
        mmLeft = 174361
        mmTop = 25929
        mmWidth = 2646
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line102'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 94456
        mmLeft = 161661
        mmTop = 25665
        mmWidth = 2646
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line103'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 94456
        mmLeft = 148961
        mmTop = 25665
        mmWidth = 2646
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #25910#20837
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 138113
        mmTop = 34131
        mmWidth = 7027
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 95250
        mmWidth = 68527
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 101600
        mmWidth = 68527
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 107950
        mmWidth = 68527
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #32467#23384
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 162454
        mmTop = 34396
        mmWidth = 7027
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 120650
        mmTop = 34396
        mmWidth = 14288
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 120121
        mmTop = 114300
        mmWidth = 68527
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 94456
        mmLeft = 11113
        mmTop = 25665
        mmWidth = 109273
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 44715
        mmWidth = 109009
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 68263
        mmWidth = 109009
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 3175
        mmLeft = 11377
        mmTop = 92869
        mmWidth = 109009
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 94192
        mmLeft = 35190
        mmTop = 25929
        mmWidth = 2910
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #29289#21697#31867#21035
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 15081
        mmTop = 32808
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 16140
        mmTop = 54504
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #29289#21697#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 14817
        mmTop = 77788
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #29289#21697#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 14288
        mmTop = 102659
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'goods_type'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 20
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 7959
        mmLeft = 37571
        mmTop = 31485
        mmWidth = 45773
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #20379#24212#21830#31616#31216
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 26
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 20638
        mmLeft = 37306
        mmTop = 46567
        mmWidth = 80963
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'goods_name'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 26
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 21167
        mmLeft = 37042
        mmTop = 70644
        mmWidth = 81227
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'goods_guige'
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 26
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 23548
        mmLeft = 37571
        mmTop = 94986
        mmWidth = 80698
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
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
end
