object Report_Form: TReport_Form
  Left = 643
  Top = 118
  Width = 307
  Height = 206
  Caption = 'Report_Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ADS722: TADODataSet
    Active = True
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.data0722.rkey, '#13#10'                   dbo.data0722.' +
      'LogNo AS '#26085#24535#21333#21495', '#13#10'                   dbo.data0722.CustName AS '#23458#25143#21517 +
      #31216', '#13#10'                   dbo.data0722.VistDate as  '#26469#35775#26085#26399', '#13#10'      ' +
      '             dbo.data0722.visitors as '#26469#35775#20154#21592', '#13#10'                  ' +
      ' dbo.data0722.visitedMan as '#25509#24453#20154#21592', '#13#10'                   dbo.data0' +
      '722.Comp_BckGrd as '#20844#21496#32972#26223#32452#32455#20851#32852', '#13#10'                   dbo.data0722.P' +
      'rod_type as  '#23458#25143#20135#21697#31867#22411#24066#22330#21069#26223', '#13#10'                   dbo.data0722.PCB_R' +
      'eq as PCB'#38656#27714#31181#31867#21450#20854#32456#31471#23458#25143', '#13#10'                   dbo.data0722.Exp_quan ' +
      'as '#39044#26399#35746#21333#37327#19979#21333#29305#28857', '#13#10'                   dbo.data0722.Close_Acc as '#36135#27454#32467 +
      #31639#26041#24335#21450#29305#27530#36153#29992#20998#25674#24773#20917', '#13#10'                   dbo.data0722.Quality_Req as '#21697 +
      #36136#35201#27714#29615#20445#26631#20934', '#13#10'                   dbo.data0722.Ques_Answ as '#23458#25143#25552#38382#21450#25105#21496#35299 +
      #31572#35760#24405', '#13#10'                   dbo.data0722.Conclusion as '#23458#25143#26469#35775#25928#26524#24635#32467#23545#23458#25143 +
      #35780#20215', '#13#10'                   dbo.data0722.others as '#20854#20182', '#13#10'          ' +
      '         dbo.data0722.isUpdate, '#13#10'                   dbo.data072' +
      '2.status, '#13#10'                   dbo.data0722.ReportID, '#13#10'        ' +
      '           dbo.data0722.Ent_Date '#21019#24314#26085#26399', '#13#10'                   dbo.' +
      'data0722.AuditID, '#13#10'                   dbo.data0722.AuditRemark ' +
      'as '#23457#26680#35780#20215', '#13#10'                   dbo.data0722.AuditDate as '#23457#26680#26085#26399', '#13#10 +
      '                      '#13#10'                  CASE WHEN data0722.sta' +
      'tus = 0 THEN '#39#26410#25552#20132#39' WHEN data0722.status = 1 THEN '#39#24453#23457#26680#39' WHEN data' +
      '0722.status = 2 THEN '#39#24050#23457#26680#39' WHEN data0722.status'#13#10'               ' +
      '        = 3 THEN '#39#34987#36864#22238#39' END AS status_c, '#13#10'                  dbo.' +
      'Data0073.USER_FULL_NAME as '#27719#25253#20154#21592', '#13#10'                  dbo.Data007' +
      '3.USER_LOGIN_NAME, '#13#10'                  Data0073_1.USER_FULL_NAME' +
      ' AS USER_FULL_NAME_A, '#13#10'                  Data0073_1.USER_LOGIN_' +
      'NAME AS USER_LOGIN_NAME_A'#13#10'FROM         dbo.Data0073 INNER JOIN'#13 +
      #10'                      dbo.data0722 ON dbo.Data0073.RKEY = dbo.d' +
      'ata0722.ReportID LEFT OUTER JOIN'#13#10'                      dbo.Data' +
      '0073 AS Data0073_1 ON dbo.data0722.AuditID = Data0073_1.RKEY'#13#10'wh' +
      'ere data0722.rkey=:rkey722'
    Parameters = <
      item
        Name = 'rkey722'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 41
    Top = 32
    object ADS722rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS722DSDesigner: TStringField
      FieldName = #26085#24535#21333#21495
      Size = 8
    end
    object ADS722DSDesigner2: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 40
    end
    object ADS722DSDesigner3: TDateTimeField
      FieldName = #26469#35775#26085#26399
    end
    object ADS722DSDesigner4: TStringField
      FieldName = #26469#35775#20154#21592
      Size = 300
    end
    object ADS722DSDesigner5: TStringField
      FieldName = #25509#24453#20154#21592
      Size = 300
    end
    object ADS722DSDesigner6: TStringField
      FieldName = #20844#21496#32972#26223#32452#32455#20851#32852
      Size = 150
    end
    object ADS722DSDesigner7: TStringField
      FieldName = #23458#25143#20135#21697#31867#22411#24066#22330#21069#26223
      Size = 150
    end
    object ADS722PCB: TStringField
      FieldName = 'PCB'#38656#27714#31181#31867#21450#20854#32456#31471#23458#25143
      Size = 150
    end
    object ADS722DSDesigner8: TStringField
      FieldName = #39044#26399#35746#21333#37327#19979#21333#29305#28857
      Size = 150
    end
    object ADS722DSDesigner9: TStringField
      FieldName = #36135#27454#32467#31639#26041#24335#21450#29305#27530#36153#29992#20998#25674#24773#20917
      Size = 150
    end
    object ADS722DSDesigner10: TStringField
      FieldName = #21697#36136#35201#27714#29615#20445#26631#20934
      Size = 150
    end
    object ADS722DSDesigner11: TStringField
      FieldName = #23458#25143#25552#38382#21450#25105#21496#35299#31572#35760#24405
      Size = 500
    end
    object ADS722DSDesigner12: TStringField
      FieldName = #23458#25143#26469#35775#25928#26524#24635#32467#23545#23458#25143#35780#20215
      Size = 500
    end
    object ADS722DSDesigner13: TStringField
      FieldName = #20854#20182
      Size = 150
    end
    object ADS722isUpdate: TBooleanField
      FieldName = 'isUpdate'
    end
    object ADS722status: TIntegerField
      FieldName = 'status'
    end
    object ADS722ReportID: TIntegerField
      FieldName = 'ReportID'
    end
    object ADS722DSDesigner14: TDateTimeField
      FieldName = #21019#24314#26085#26399
    end
    object ADS722AuditID: TIntegerField
      FieldName = 'AuditID'
    end
    object ADS722DSDesigner15: TStringField
      FieldName = #23457#26680#35780#20215
      Size = 150
    end
    object ADS722DSDesigner16: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
    object ADS722status_c: TStringField
      FieldName = 'status_c'
      ReadOnly = True
      Size = 6
    end
    object ADS722DSDesigner17: TStringField
      FieldName = #27719#25253#20154#21592
      Size = 30
    end
    object ADS722USER_LOGIN_NAME: TStringField
      FieldName = 'USER_LOGIN_NAME'
      Size = 15
    end
    object ADS722USER_FULL_NAME_A: TStringField
      FieldName = 'USER_FULL_NAME_A'
      Size = 30
    end
    object ADS722USER_LOGIN_NAME_A: TStringField
      FieldName = 'USER_LOGIN_NAME_A'
      Size = 15
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS722
    Left = 88
    Top = 32
  end
  object ppDB722: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB722'
    Left = 136
    Top = 32
    object ppDB722ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 0
    end
    object ppDB722ppField2: TppField
      FieldAlias = #26085#24535#21333#21495
      FieldName = #26085#24535#21333#21495
      FieldLength = 8
      DisplayWidth = 8
      Position = 1
    end
    object ppDB722ppField3: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = #23458#25143#21517#31216
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDB722ppField4: TppField
      FieldAlias = #26469#35775#26085#26399
      FieldName = #26469#35775#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppDB722ppField5: TppField
      FieldAlias = #26469#35775#20154#21592
      FieldName = #26469#35775#20154#21592
      FieldLength = 300
      DisplayWidth = 300
      Position = 4
    end
    object ppDB722ppField6: TppField
      FieldAlias = #25509#24453#20154#21592
      FieldName = #25509#24453#20154#21592
      FieldLength = 300
      DisplayWidth = 300
      Position = 5
    end
    object ppDB722ppField7: TppField
      FieldAlias = #20844#21496#32972#26223#32452#32455#20851#32852
      FieldName = #20844#21496#32972#26223#32452#32455#20851#32852
      FieldLength = 150
      DisplayWidth = 150
      Position = 6
    end
    object ppDB722ppField8: TppField
      FieldAlias = #23458#25143#20135#21697#31867#22411#24066#22330#21069#26223
      FieldName = #23458#25143#20135#21697#31867#22411#24066#22330#21069#26223
      FieldLength = 150
      DisplayWidth = 150
      Position = 7
    end
    object ppDB722ppField9: TppField
      FieldAlias = 'PCB'#38656#27714#31181#31867#21450#20854#32456#31471#23458#25143
      FieldName = 'PCB'#38656#27714#31181#31867#21450#20854#32456#31471#23458#25143
      FieldLength = 150
      DisplayWidth = 150
      Position = 8
    end
    object ppDB722ppField10: TppField
      FieldAlias = #39044#26399#35746#21333#37327#19979#21333#29305#28857
      FieldName = #39044#26399#35746#21333#37327#19979#21333#29305#28857
      FieldLength = 150
      DisplayWidth = 150
      Position = 9
    end
    object ppDB722ppField11: TppField
      FieldAlias = #36135#27454#32467#31639#26041#24335#21450#29305#27530#36153#29992#20998#25674#24773#20917
      FieldName = #36135#27454#32467#31639#26041#24335#21450#29305#27530#36153#29992#20998#25674#24773#20917
      FieldLength = 150
      DisplayWidth = 150
      Position = 10
    end
    object ppDB722ppField12: TppField
      FieldAlias = #21697#36136#35201#27714#29615#20445#26631#20934
      FieldName = #21697#36136#35201#27714#29615#20445#26631#20934
      FieldLength = 150
      DisplayWidth = 150
      Position = 11
    end
    object ppDB722ppField13: TppField
      FieldAlias = #23458#25143#25552#38382#21450#25105#21496#35299#31572#35760#24405
      FieldName = #23458#25143#25552#38382#21450#25105#21496#35299#31572#35760#24405
      FieldLength = 500
      DisplayWidth = 500
      Position = 12
    end
    object ppDB722ppField14: TppField
      FieldAlias = #23458#25143#26469#35775#25928#26524#24635#32467#23545#23458#25143#35780#20215
      FieldName = #23458#25143#26469#35775#25928#26524#24635#32467#23545#23458#25143#35780#20215
      FieldLength = 500
      DisplayWidth = 500
      Position = 13
    end
    object ppDB722ppField15: TppField
      FieldAlias = #20854#20182
      FieldName = #20854#20182
      FieldLength = 150
      DisplayWidth = 150
      Position = 14
    end
    object ppDB722ppField16: TppField
      FieldAlias = 'isUpdate'
      FieldName = 'isUpdate'
      FieldLength = 0
      DataType = dtBoolean
      DisplayWidth = 5
      Position = 15
    end
    object ppDB722ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'status'
      FieldName = 'status'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object ppDB722ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'ReportID'
      FieldName = 'ReportID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 17
    end
    object ppDB722ppField19: TppField
      FieldAlias = #21019#24314#26085#26399
      FieldName = #21019#24314#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 18
    end
    object ppDB722ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'AuditID'
      FieldName = 'AuditID'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 19
    end
    object ppDB722ppField21: TppField
      FieldAlias = #23457#26680#35780#20215
      FieldName = #23457#26680#35780#20215
      FieldLength = 150
      DisplayWidth = 150
      Position = 20
    end
    object ppDB722ppField22: TppField
      FieldAlias = #23457#26680#26085#26399
      FieldName = #23457#26680#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 21
    end
    object ppDB722ppField23: TppField
      FieldAlias = 'status_c'
      FieldName = 'status_c'
      FieldLength = 6
      DisplayWidth = 6
      Position = 22
    end
    object ppDB722ppField24: TppField
      FieldAlias = #27719#25253#20154#21592
      FieldName = #27719#25253#20154#21592
      FieldLength = 30
      DisplayWidth = 30
      Position = 23
    end
    object ppDB722ppField25: TppField
      FieldAlias = 'USER_LOGIN_NAME'
      FieldName = 'USER_LOGIN_NAME'
      FieldLength = 15
      DisplayWidth = 15
      Position = 24
    end
    object ppDB722ppField26: TppField
      FieldAlias = 'USER_FULL_NAME_A'
      FieldName = 'USER_FULL_NAME_A'
      FieldLength = 30
      DisplayWidth = 30
      Position = 25
    end
    object ppDB722ppField27: TppField
      FieldAlias = 'USER_LOGIN_NAME_A'
      FieldName = 'USER_LOGIN_NAME_A'
      FieldLength = 15
      DisplayWidth = 15
      Position = 26
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB722
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
    Template.FileName = 'D:\ERPProgram\WZPR722\Vst_Log.rtm'
    Units = utMillimeters
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextFileName = 'D:\ERPProgram\WZPR722\Vst_Log.rtm'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 192
    Top = 31
    Version = '7.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB722'
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
      mmHeight = 274903
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = '____________'#23458#25143#26469#35775#35760#24405#19982#24635#32467
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7408
        mmLeft = 54769
        mmTop = 16404
        mmWidth = 97102
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 24871
        mmWidth = 186532
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 32279
        mmWidth = 186532
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 39423
        mmWidth = 186532
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 46567
        mmWidth = 186532
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 55033
        mmWidth = 186532
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 62442
        mmWidth = 186532
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 29898
        mmLeft = 94192
        mmTop = 32544
        mmWidth = 265
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 249767
        mmLeft = 188119
        mmTop = 24871
        mmWidth = 265
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 250032
        mmLeft = 1852
        mmTop = 24871
        mmWidth = 265
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #26469#35775#20154#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 34396
        mmTop = 33602
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #25509#24453#20154#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 131498
        mmTop = 33602
        mmWidth = 16933
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 29898
        mmTop = 39423
        mmWidth = 794
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 60854
        mmTop = 39423
        mmWidth = 1852
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 122238
        mmTop = 39423
        mmWidth = 1852
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 23019
        mmLeft = 152665
        mmTop = 39423
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = #22995'  '#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4445
        mmLeft = 8731
        mmTop = 41010
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = #37096'  '#38376
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 38629
        mmTop = 41010
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = #32844'  '#21153
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 71438
        mmTop = 41010
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = #22995'  '#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 101336
        mmTop = 41010
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = #37096'  '#38376
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 129911
        mmTop = 41010
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = #32844'  '#21153
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4498
        mmLeft = 161925
        mmTop = 41010
        mmWidth = 12700
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line101'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 89694
        mmWidth = 186532
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 108744
        mmWidth = 186532
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 127265
        mmWidth = 186532
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line201'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 146050
        mmWidth = 186532
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 164836
        mmWidth = 186532
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 210609
        mmWidth = 186532
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 274638
        mmWidth = 186532
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 243153
        mmWidth = 186532
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
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 49213
        mmWidth = 16933
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
        mmLeft = 33602
        mmTop = 49213
        mmWidth = 15610
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
        mmLeft = 64823
        mmTop = 49213
        mmWidth = 15610
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
        mmLeft = 5292
        mmTop = 56886
        mmWidth = 16933
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
        mmLeft = 33867
        mmTop = 56886
        mmWidth = 15610
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
        mmLeft = 64558
        mmTop = 56886
        mmWidth = 15610
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
        mmLeft = 98161
        mmTop = 49213
        mmWidth = 15610
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
        mmLeft = 126471
        mmTop = 49213
        mmWidth = 15610
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
        mmLeft = 156369
        mmTop = 49213
        mmWidth = 15610
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
        mmLeft = 98425
        mmTop = 56886
        mmWidth = 15610
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
        mmLeft = 126736
        mmTop = 56886
        mmWidth = 15610
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
        mmLeft = 156634
        mmTop = 56886
        mmWidth = 15610
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = #23458#25143#21517#31216
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB722'
        mmHeight = 5292
        mmLeft = 57944
        mmTop = 15610
        mmWidth = 36777
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = #19968'. '#26469#23486#21450#25509#24453#20154#21592#22522#26412#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 2910
        mmTop = 26194
        mmWidth = 62177
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line102'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 70644
        mmWidth = 186267
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = #20108'. '#23458#25143#20844#21496#37325#35201#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 2910
        mmTop = 64294
        mmWidth = 62177
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = '1. '#20844#21496#32972#26223'/'#32452#32455#20851#32852':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 7408
        mmTop = 72231
        mmWidth = 61119
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = #20844#21496#32972#26223#32452#32455#20851#32852
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB722'
        mmHeight = 10000
        mmLeft = 4498
        mmTop = 78581
        mmWidth = 180711
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = '2. '#23458#25143#20135#21697#31867#22411'/'#24066#22330#21069#26223':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 7408
        mmTop = 91546
        mmWidth = 62177
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = #23458#25143#20135#21697#31867#22411#24066#22330#21069#26223
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB722'
        mmHeight = 10000
        mmLeft = 4233
        mmTop = 97631
        mmWidth = 181240
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = '3. PCB'#38656#27714#31181#31867#21450#20854#32456#31471#23458#25143':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 7408
        mmTop = 110067
        mmWidth = 62177
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PCB'#38656#27714#31181#31867#21450#20854#32456#31471#23458#25143
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB722'
        mmHeight = 10000
        mmLeft = 4233
        mmTop = 116152
        mmWidth = 181769
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = #39044#26399#35746#21333#37327#19979#21333#29305#28857
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB722'
        mmHeight = 10000
        mmLeft = 4233
        mmTop = 134673
        mmWidth = 182034
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = '4. '#39044#26399#35746#21333#37327'/'#19979#21333#29305#28857':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 7408
        mmTop = 128852
        mmWidth = 56886
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = '5. '#36135#27454#32467#31639#26041#24335#21450#29305#27530#36153#29992#20998#25674#24773#20917':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 7408
        mmTop = 147373
        mmWidth = 78317
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = #36135#27454#32467#31639#26041#24335#21450#29305#27530#36153#29992#20998#25674#24773#20917
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB722'
        mmHeight = 10000
        mmLeft = 4233
        mmTop = 153459
        mmWidth = 182298
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = '6. '#21697#36136#35201#27714'/'#29615#20445#26631#20934':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 7408
        mmTop = 165894
        mmWidth = 50271
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = #21697#36136#35201#27714#29615#20445#26631#20934
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB722'
        mmHeight = 10000
        mmLeft = 4233
        mmTop = 171980
        mmWidth = 182563
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 183357
        mmWidth = 186532
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = #19977'. '#23458#25143#25552#38382#21450#25105#21496#35299#31572#35760#24405': ('#35201#27714#35760#24405#20869#23481#31361#20986#37325#28857#65292#31616#26126#25212#35201')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 2910
        mmTop = 184944
        mmWidth = 131234
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = #23458#25143#25552#38382#21450#25105#21496#35299#31572#35760#24405
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB722'
        mmHeight = 17992
        mmLeft = 4233
        mmTop = 191294
        mmWidth = 182034
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = #22235'. '#23458#25143#26469#35775#25928#26524#24635#32467'/'#23545#23458#25143#35780#20215': ('#27492#39033#30001#19994#21153#32463#29702#25110#24320#21457#21103#24635#22635#20889#65292#20869#23481#21253#21547#39044#26399#21512#20316#26426#20250#65292#23458#25143#24847#24895#65292#20184#27454#26041#24335#65292#21512#20316#39118#38505#31561')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 10848
        mmLeft = 2910
        mmTop = 211932
        mmWidth = 181769
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = #23458#25143#26469#35775#25928#26524#24635#32467#23545#23458#25143#35780#20215
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB722'
        mmHeight = 17727
        mmLeft = 2910
        mmTop = 223838
        mmWidth = 183357
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 1852
        mmTop = 257440
        mmWidth = 186532
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 31485
        mmLeft = 31750
        mmTop = 243153
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = #25253#21578#20316#25104
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 4763
        mmTop = 249238
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = #25253#21578#23457#26680
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 4498
        mmTop = 262996
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = #21019#24314#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 35719
        mmTop = 251619
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = #21019#24314#26085#26399
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB722'
        mmHeight = 4763
        mmLeft = 57150
        mmTop = 251355
        mmWidth = 58208
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = #21019#24314#20154#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4445
        mmLeft = 35719
        mmTop = 245005
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = #27719#25253#20154#21592
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB722'
        mmHeight = 4763
        mmLeft = 57150
        mmTop = 245005
        mmWidth = 58208
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = #23457#26680#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4487
        mmLeft = 105834
        mmTop = 259292
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label32'
        AutoSize = False
        Caption = #23457#26680#35780#20215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35983
        mmTop = 266436
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = #23457#26680#35780#20215
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB722'
        mmHeight = 7938
        mmLeft = 57150
        mmTop = 266171
        mmWidth = 128588
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label33'
        AutoSize = False
        Caption = #23457#26680#20154#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 35719
        mmTop = 259292
        mmWidth = 18785
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'USER_FULL_NAME_A'
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB722'
        mmHeight = 4763
        mmLeft = 57150
        mmTop = 259028
        mmWidth = 43656
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = #23457#26680#26085#26399
        DataPipeline = ppDB722
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB722'
        mmHeight = 4763
        mmLeft = 127529
        mmTop = 259028
        mmWidth = 58208
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 12965
        mmLeft = 24606
        mmTop = 1058
        mmWidth = 23283
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
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
        mmHeight = 8996
        mmLeft = 50271
        mmTop = 3175
        mmWidth = 119592
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
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
      mmHeight = 3969
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
        mmLeft = 63236
        mmTop = 0
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
        mmLeft = 80963
        mmTop = 0
        mmWidth = 45244
        BandType = 8
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = #20445#23384#26399#38480#65306#19968#20010#26085#21382#24180
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 7408
        mmTop = 0
        mmWidth = 43392
        BandType = 8
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        AutoSize = False
        Caption = #21463#25511'No '#65306' QMSS03008-006'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 143404
        mmTop = 0
        mmWidth = 43392
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
    Left = 192
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = DM.ADO493
    Left = 88
    Top = 80
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 136
    Top = 80
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
end
