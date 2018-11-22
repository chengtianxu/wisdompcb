object Form_report: TForm_report
  Left = 618
  Top = 267
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#34920#25968#25454#23450#20041
  ClientHeight = 234
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = ADS721
    Left = 128
    Top = 48
  end
  object ADS721: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.data0721.*, '#13#10'             case when data0721.sta' +
      'tus=0 then '#39#26410#25552#20132#39#13#10'                      when data0721.status=1 t' +
      'hen '#39#24453#23457#26680#39#13#10'                      when data0721.status=2 then '#39#24050#23457 +
      #26680#39#13#10'                      when data0721.status=3 then '#39#34987#36864#22238#39' end ' +
      'status_c,'#13#10'             dbo.Data0073.USER_FULL_NAME, dbo.Data007' +
      '3.USER_LOGIN_NAME, '#13#10'              Data0073_1.USER_FULL_NAME  US' +
      'ER_FULL_NAME_A,'#13#10'              Data0073_1.USER_LOGIN_NAME USER_L' +
      'OGIN_NAME_A            '#13#10'FROM         dbo.data0721 INNER JOIN'#13#10' ' +
      '                     dbo.Data0073 ON dbo.data0721.salesID = dbo.' +
      'Data0073.RKEY left JOIN'#13#10'                      dbo.Data0073 AS D' +
      'ata0073_1 ON  dbo.data0721.AuditID = Data0073_1.RKEY'#13#10'where data' +
      '0721.rkey=:rkey721'
    Parameters = <
      item
        Name = 'rkey721'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 97
    Top = 48
    object ADS721RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS721LogNo: TStringField
      FieldName = 'LogNo'
      FixedChar = True
      Size = 8
    end
    object ADS721CustName: TStringField
      FieldName = 'CustName'
      Size = 40
    end
    object ADS721VistPlace: TStringField
      FieldName = 'VistPlace'
      Size = 40
    end
    object ADS721VistDate: TDateTimeField
      FieldName = 'VistDate'
    end
    object ADS721visitors: TStringField
      FieldName = 'visitors'
      Size = 150
    end
    object ADS721visitedMan: TStringField
      FieldName = 'visitedMan'
      Size = 150
    end
    object ADS721Influence: TStringField
      FieldName = 'Influence'
      Size = 150
    end
    object ADS721aims: TStringField
      FieldName = 'aims'
      Size = 150
    end
    object ADS721subjects: TStringField
      FieldName = 'subjects'
      Size = 250
    end
    object ADS721feedback: TStringField
      FieldName = 'feedback'
      Size = 250
    end
    object ADS721others: TStringField
      FieldName = 'others'
      Size = 150
    end
    object ADS721NextVistDate: TDateTimeField
      FieldName = 'NextVistDate'
    end
    object ADS721nextSub: TStringField
      FieldName = 'nextSub'
      Size = 50
    end
    object ADS721actions: TStringField
      FieldName = 'actions'
      Size = 250
    end
    object ADS721isUpdate: TBooleanField
      FieldName = 'isUpdate'
    end
    object ADS721status: TIntegerField
      FieldName = 'status'
    end
    object ADS721salesID: TIntegerField
      FieldName = 'salesID'
    end
    object ADS721AuditID: TIntegerField
      FieldName = 'AuditID'
    end
    object ADS721AuditRemark: TStringField
      FieldName = 'AuditRemark'
      Size = 150
    end
    object ADS721AuditDate: TDateTimeField
      FieldName = 'AuditDate'
    end
    object ADS721ent_Date: TDateTimeField
      FieldName = 'ent_Date'
    end
    object ADS721status_c: TStringField
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADS721USER_FULL_NAME: TStringField
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADS721USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADS721USER_FULL_NAME_A: TStringField
      FieldName = 'USER_FULL_NAME_A'
      Size = 30
    end
    object ADS721USER_LOGIN_NAME_A: TStringField
      FieldName = 'USER_LOGIN_NAME_A'
      Size = 15
    end
  end
  object ppDB721: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB721'
    Left = 160
    Top = 48
    object ppDB721ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDB721ppField2: TppField
      FieldAlias = 'LogNo'
      FieldName = 'LogNo'
      FieldLength = 8
      DisplayWidth = 8
      Position = 1
    end
    object ppDB721ppField3: TppField
      FieldAlias = 'CustName'
      FieldName = 'CustName'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDB721ppField4: TppField
      FieldAlias = 'VistPlace'
      FieldName = 'VistPlace'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object ppDB721ppField5: TppField
      FieldAlias = 'VistDate'
      FieldName = 'VistDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppDB721ppField6: TppField
      FieldAlias = 'visitors'
      FieldName = 'visitors'
      FieldLength = 150
      DisplayWidth = 150
      Position = 5
    end
    object ppDB721ppField7: TppField
      FieldAlias = 'visitedMan'
      FieldName = 'visitedMan'
      FieldLength = 150
      DisplayWidth = 150
      Position = 6
    end
    object ppDB721ppField8: TppField
      FieldAlias = 'Influence'
      FieldName = 'Influence'
      FieldLength = 150
      DisplayWidth = 150
      Position = 7
    end
    object ppDB721ppField9: TppField
      FieldAlias = 'aims'
      FieldName = 'aims'
      FieldLength = 150
      DisplayWidth = 150
      Position = 8
    end
    object ppDB721ppField10: TppField
      FieldAlias = 'subjects'
      FieldName = 'subjects'
      FieldLength = 250
      DisplayWidth = 250
      Position = 9
    end
    object ppDB721ppField11: TppField
      FieldAlias = 'feedback'
      FieldName = 'feedback'
      FieldLength = 250
      DisplayWidth = 250
      Position = 10
    end
    object ppDB721ppField12: TppField
      FieldAlias = 'others'
      FieldName = 'others'
      FieldLength = 150
      DisplayWidth = 150
      Position = 11
    end
    object ppDB721ppField13: TppField
      FieldAlias = 'NextVistDate'
      FieldName = 'NextVistDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppDB721ppField14: TppField
      FieldAlias = 'nextSub'
      FieldName = 'nextSub'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object ppDB721ppField15: TppField
      FieldAlias = 'actions'
      FieldName = 'actions'
      FieldLength = 250
      DisplayWidth = 250
      Position = 14
    end
    object ppDB721ppField16: TppField
      FieldAlias = 'isUpdate'
      FieldName = 'isUpdate'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 15
    end
    object ppDB721ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'status'
      FieldName = 'status'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object ppDB721ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'salesID'
      FieldName = 'salesID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object ppDB721ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'AuditID'
      FieldName = 'AuditID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object ppDB721ppField20: TppField
      FieldAlias = 'AuditRemark'
      FieldName = 'AuditRemark'
      FieldLength = 150
      DisplayWidth = 150
      Position = 19
    end
    object ppDB721ppField21: TppField
      FieldAlias = 'AuditDate'
      FieldName = 'AuditDate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 20
    end
    object ppDB721ppField22: TppField
      FieldAlias = 'ent_Date'
      FieldName = 'ent_Date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object ppDB721ppField23: TppField
      FieldAlias = 'status_c'
      FieldName = 'status_c'
      FieldLength = 6
      DisplayWidth = 6
      Position = 22
    end
    object ppDB721ppField24: TppField
      FieldAlias = 'USER_FULL_NAME'
      FieldName = 'USER_FULL_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 23
    end
    object ppDB721ppField25: TppField
      FieldAlias = 'USER_LOGIN_NAME'
      FieldName = 'USER_LOGIN_NAME'
      FieldLength = 15
      DisplayWidth = 15
      Position = 24
    end
    object ppDB721ppField26: TppField
      FieldAlias = 'USER_FULL_NAME_A'
      FieldName = 'USER_FULL_NAME_A'
      FieldLength = 30
      DisplayWidth = 30
      Position = 25
    end
    object ppDB721ppField27: TppField
      FieldAlias = 'USER_LOGIN_NAME_A'
      FieldName = 'USER_LOGIN_NAME_A'
      FieldLength = 15
      DisplayWidth = 15
      Position = 26
    end
  end
  object ads493: TADODataSet
    Connection = DM.ADOCon
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 96
    Top = 80
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
  object DataSource5: TDataSource
    DataSet = ads493
    Left = 128
    Top = 80
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource5
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 80
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
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
    WindowState = wsMaximized
    Left = 232
    Top = 88
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB721
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Documents and Settings\XPUSER\'#26700#38754'\sale_Log.rtm'
    Units = utMillimeters
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextFileName = 'R:\NIERP\Report\sale_Log.rtm'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 48
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB721'
    object ppTitleBand1: TppTitleBand
      Visible = False
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 279136
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25308#35775#26085#26399'/'#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 95515
        mmTop = 23813
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'CustName'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 23548
        mmWidth = 14224
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
        mmHeight = 14552
        mmLeft = 794
        mmTop = 0
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
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
        mmHeight = 6435
        mmLeft = 62669
        mmTop = 1323
        mmWidth = 68072
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #25308#35775#23458#25143#20449#24687#35760#24405#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 66411
        mmTop = 8467
        mmWidth = 53181
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1852
        mmTop = 21696
        mmWidth = 186532
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1852
        mmTop = 28840
        mmWidth = 186532
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1852
        mmTop = 36248
        mmWidth = 186532
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1852
        mmTop = 44715
        mmWidth = 186532
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1852
        mmTop = 53446
        mmWidth = 186532
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1852
        mmTop = 62971
        mmWidth = 186532
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1852
        mmTop = 71967
        mmWidth = 186532
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1852
        mmTop = 80963
        mmWidth = 186532
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1852
        mmTop = 89694
        mmWidth = 186532
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 67733
        mmLeft = 81492
        mmTop = 21960
        mmWidth = 265
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 256646
        mmLeft = 188119
        mmTop = 21960
        mmWidth = 3969
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 257176
        mmLeft = 1588
        mmTop = 21696
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #25308#35775#22320#28857':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 31221
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'VistPlace'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 3969
        mmLeft = 22490
        mmTop = 31221
        mmWidth = 16002
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #25105#21496#25308#35775#20154#21592#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 30163
        mmTop = 38894
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #23458#25143#21463#25308#35775#20154#21592#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 124884
        mmTop = 38894
        mmWidth = 31750
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 233892
        mmLeft = 29898
        mmTop = 44715
        mmWidth = 3969
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 44979
        mmLeft = 55033
        mmTop = 44715
        mmWidth = 3704
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 44979
        mmLeft = 105569
        mmTop = 44715
        mmWidth = 3969
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 44979
        mmLeft = 129382
        mmTop = 44715
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #22995'  '#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 47625
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #37096'  '#38376
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 37306
        mmTop = 47625
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #32844'  '#21153
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 63500
        mmTop = 48154
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #22995'  '#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 88900
        mmTop = 47625
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #37096'  '#38376
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 111919
        mmTop = 47625
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #32844'  '#21153
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 138113
        mmTop = 47625
        mmWidth = 10583
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line101'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1588
        mmTop = 122502
        mmWidth = 186532
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1588
        mmTop = 143404
        mmWidth = 186532
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1588
        mmTop = 165894
        mmWidth = 186532
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line201'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1588
        mmTop = 196057
        mmWidth = 186532
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 215107
        mmWidth = 186532
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 238125
        mmWidth = 186532
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 278607
        mmWidth = 186796
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1588
        mmTop = 264055
        mmWidth = 186532
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        CharWrap = True
        Caption = #21463#25308#35775#32773'/'#25104#21592#22312#26412#21496#30340#20915#31574#24433#21709#33539#22260
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 12171
        mmLeft = 2910
        mmTop = 91811
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        CharWrap = True
        Caption = #25308#35775#23458#25143#30446#30340
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 129911
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        CharWrap = True
        Caption = #21452#26041#27807#36890#32467#26524
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 152400
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        CharWrap = True
        Caption = #23458#25143#21453#39304#38382#39064#20107#39033
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 179388
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        CharWrap = True
        Caption = #24403#21069#23458#25143#39118#38505#25552#31034
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 4498
        mmLeft = 2117
        mmTop = 202936
        mmWidth = 27781
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        CharWrap = True
        Caption = #21452#26041#32422#23450#19979#27425#25308#35775#26085#26399#21450#27807#36890#20027#39064
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8996
        mmLeft = 2117
        mmTop = 222780
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        CharWrap = True
        Caption = #25308#35775#23458#25143#21518#25105#21496#19994#21153#20154#21592#34892#21160#35745#21010#21450#24515#24471#20307#20250
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 11906
        mmLeft = 2381
        mmTop = 245798
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        CharWrap = True
        Caption = #24635#32463#29702'/'#21103#24635'('#31614#23383')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8043
        mmLeft = 2381
        mmTop = 266965
        mmWidth = 24638
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'Influence'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 14023
        mmLeft = 30427
        mmTop = 90488
        mmWidth = 157163
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'aims'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 19050
        mmLeft = 30692
        mmTop = 123561
        mmWidth = 156634
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'subjects'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 20638
        mmLeft = 30956
        mmTop = 144463
        mmWidth = 156634
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo4'
        CharWrap = False
        DataField = 'feedback'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 28310
        mmLeft = 30692
        mmTop = 166952
        mmWidth = 156634
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo5: TppDBMemo
        UserName = 'DBMemo5'
        CharWrap = False
        DataField = 'others'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 17463
        mmLeft = 30692
        mmTop = 196850
        mmWidth = 156634
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo6: TppDBMemo
        UserName = 'DBMemo6'
        CharWrap = False
        DataField = 'nextSub'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 21167
        mmLeft = 30956
        mmTop = 216165
        mmWidth = 156634
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo7: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = False
        DataField = 'actions'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 24606
        mmLeft = 30956
        mmTop = 238919
        mmWidth = 156634
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo8: TppDBMemo
        UserName = 'DBMemo8'
        CharWrap = False
        DataField = 'AuditRemark'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 12700
        mmLeft = 30692
        mmTop = 265113
        mmWidth = 156898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'VistDate'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 3969
        mmLeft = 121709
        mmTop = 23813
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #23458#25143#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 23283
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #26412#27425#25308#35775#26377#20851#20449#24687#26159#21542#38656#35201#26356#26032#21040#23458#25143#26723':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 95515
        mmTop = 30956
        mmWidth = 65088
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'isUpdate'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 30956
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30427
        mmTop = 56621
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 56621
        mmTop = 56621
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 65881
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 65088
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 56356
        mmTop = 65352
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 74877
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30427
        mmTop = 74877
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 56356
        mmTop = 74613
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2646
        mmTop = 83344
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30692
        mmTop = 83608
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 56356
        mmTop = 83608
        mmWidth = 22490
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 82815
        mmTop = 56092
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 106363
        mmTop = 56886
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 57150
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83079
        mmTop = 65617
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 106627
        mmTop = 65881
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130704
        mmTop = 65881
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83079
        mmTop = 75406
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 106627
        mmTop = 74877
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130704
        mmTop = 75142
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 83344
        mmTop = 83079
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 106627
        mmTop = 83079
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130440
        mmTop = 84138
        mmWidth = 24077
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 1588
        mmTop = 105304
        mmWidth = 186532
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        CharWrap = True
        Caption = #21830#26426#23450#20041
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 4763
        mmLeft = 6350
        mmTop = 110596
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = #19994#21153#20154#21592#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 17198
        mmWidth = 17568
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 44979
        mmLeft = 156898
        mmTop = 44715
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = #30005' '#35805
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 169789
        mmTop = 47096
        mmWidth = 8805
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 157957
        mmTop = 56621
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 158221
        mmTop = 65352
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 158221
        mmTop = 74613
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 157957
        mmTop = 83608
        mmWidth = 27252
        BandType = 0
      end
      object myCheckBox3: TmyCheckBox
        UserName = 'CheckBox1'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 32279
        mmTop = 110596
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = #30830#23450'10%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 37835
        mmTop = 111654
        mmWidth = 12435
        BandType = 0
      end
      object myCheckBox4: TmyCheckBox
        UserName = 'CheckBox4'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 54240
        mmTop = 110596
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = #25509#35302'25%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 59796
        mmTop = 111654
        mmWidth = 12435
        BandType = 0
      end
      object myCheckBox5: TmyCheckBox
        UserName = 'CheckBox5'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 76994
        mmTop = 110331
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        Caption = #25343#21040#36164#26684'50%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 82550
        mmTop = 111654
        mmWidth = 19315
        BandType = 0
      end
      object myCheckBox6: TmyCheckBox
        UserName = 'CheckBox6'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 108215
        mmTop = 110596
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = #25253#20215'70%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 113771
        mmTop = 111654
        mmWidth = 12700
        BandType = 0
      end
      object myCheckBox7: TmyCheckBox
        UserName = 'CheckBox7'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 131763
        mmTop = 110596
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label60'
        Caption = #31614#35746#21512#21516'90%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 138642
        mmTop = 111654
        mmWidth = 18256
        BandType = 0
      end
      object myCheckBox8: TmyCheckBox
        UserName = 'CheckBox8'
        Checked = False
        Transparent = True
        mmHeight = 6350
        mmLeft = 161661
        mmTop = 110596
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        Caption = #36194#21333'100%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'MS Sans Serif'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 167217
        mmTop = 111654
        mmWidth = 15346
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'USER_FULL_NAME'
        DataPipeline = ppDB721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB721'
        mmHeight = 4022
        mmLeft = 20638
        mmTop = 17198
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 2910
        mmTop = 56356
        mmWidth = 20362
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
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #25171#21360#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 124354
        mmTop = 264
        mmWidth = 15875
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 140494
        mmTop = 264
        mmWidth = 45244
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'SOURCE_PTR'
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
