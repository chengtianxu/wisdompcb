object Form_report: TForm_report
  Left = 571
  Top = 230
  Width = 411
  Height = 583
  Caption = 'FA'#27979#35797
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB745
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #35746#21333#20449#24687
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'E:\wisdompcb\'#31243#24207#20195#30721'\'#20108#23618'ERP\'#24037#31243#35774#35745'\'#20135#21697#35774#35745'\FA'#25163#20214#27979#35797'\FATest.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 256
    Top = 146
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB745'
    object ppTitleBand1: TppTitleBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 54240
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
        mmHeight = 14552
        mmLeft = 6350
        mmTop = 4233
        mmWidth = 18785
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 5556
        mmLeft = 60854
        mmTop = 4233
        mmWidth = 76994
        BandType = 1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 21431
        mmWidth = 191559
        BandType = 1
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 5556
        mmTop = 44450
        mmWidth = 191559
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'FA'#27979#35797#34920
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 62177
        mmTop = 11377
        mmWidth = 65088
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #29983#20135#22411#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 11113
        mmTop = 24871
        mmWidth = 15833
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #23458#25143#20195#30721':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 29898
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #23458#25143#20195#30721
        DataPipeline = ppDB745
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB745'
        mmHeight = 4022
        mmLeft = 27781
        mmTop = 29633
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #23458#25143#20195#30721':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 11113
        mmTop = 34660
        mmWidth = 15240
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = #23458#25143#21517#31216
        DataPipeline = ppDB745
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB745'
        mmHeight = 3969
        mmLeft = 27517
        mmTop = 34660
        mmWidth = 41010
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #26085#26399':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 154517
        mmTop = 25400
        mmWidth = 8805
        BandType = 1
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 165100
        mmTop = 25400
        mmWidth = 30163
        BandType = 1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #29983#20135#22411#21495
        DataPipeline = ppDB745
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB745'
        mmHeight = 3969
        mmLeft = 28046
        mmTop = 24871
        mmWidth = 17198
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 6085
        mmLeft = 3969
        mmTop = 3704
        mmWidth = 195527
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #27969#31243#24037#24207
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 9525
        mmTop = 4763
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #38590#28857
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 35454
        mmTop = 4763
        mmWidth = 7027
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25511#21046#35201#27714
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 91811
        mmTop = 4763
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'FA'#27979#35797#32467#26524
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 147373
        mmTop = 4763
        mmWidth = 17611
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 29898
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 75936
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6085
        mmLeft = 138907
        mmTop = 3704
        mmWidth = 265
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 3969
        mmTop = 0
        mmWidth = 195527
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 3969
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 29898
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 75671
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 138642
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6350
        mmLeft = 199232
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'DEPT_NAME'
        DataPipeline = ppDB740
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB740'
        mmHeight = 3969
        mmLeft = 6615
        mmTop = 1058
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'DifficultPoint'
        DataPipeline = ppDB740
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB740'
        mmHeight = 3969
        mmLeft = 32544
        mmTop = 1058
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'BEIZHU'
        DataPipeline = ppDB740
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB740'
        mmHeight = 3969
        mmLeft = 88900
        mmTop = 1058
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'TestResult'
        DataPipeline = ppDB740
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB740'
        mmHeight = 3969
        mmLeft = 146844
        mmTop = 1058
        mmWidth = 21431
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB0005
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB0005'
        mmHeight = 3969
        mmLeft = 23019
        mmTop = 7408
        mmWidth = 25929
        BandType = 8
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #21046#20316#34920#20154#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 3704
        mmTop = 7408
        mmWidth = 17568
        BandType = 8
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #23457#26680#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 123031
        mmTop = 8731
        mmWidth = 10541
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 134938
        mmTop = 13494
        mmWidth = 25929
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 22490
        mmTop = 12965
        mmWidth = 26723
        BandType = 8
      end
    end
  end
  object ppDB740: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB740'
    Left = 160
    Top = 152
    object ppDB740ppField1: TppField
      FieldAlias = 'DEPT_CODE'
      FieldName = 'DEPT_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppDB740ppField2: TppField
      FieldAlias = 'DEPT_NAME'
      FieldName = 'DEPT_NAME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDB740ppField3: TppField
      FieldAlias = 'DifficultPoint'
      FieldName = 'DifficultPoint'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppDB740ppField4: TppField
      FieldAlias = 'BEIZHU'
      FieldName = 'BEIZHU'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDB740ppField5: TppField
      FieldAlias = 'TestResult'
      FieldName = 'TestResult'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
  end
  object DataSource3: TDataSource
    DataSet = aq493
    Left = 128
    Top = 208
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 208
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object DataSource4: TDataSource
    DataSet = aq745
    Left = 128
    Top = 288
  end
  object ppDB745: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DB745'
    Left = 159
    Top = 288
    object ppDB738ppField1: TppField
      FieldAlias = #29983#20135#22411#21495
      FieldName = #29983#20135#22411#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppDB738ppField2: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = #23458#25143#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDB738ppField3: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = #23458#25143#21517#31216
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppDB745ppField1: TppField
      FieldAlias = 'QUAN_ON_HAND'
      FieldName = 'QUAN_ON_HAND'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
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
    Top = 184
  end
  object aq493: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 96
    Top = 208
    object aq493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object aq493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object aq493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object aq493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object aq493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object aq493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object aq493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object aq493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object aq493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = aq740
    Left = 128
    Top = 150
  end
  object aq740: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'RKEY745'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select fa0740.Rkey,data0034.DEPT_CODE,data0034.DEPT_NAME,fa0740.' +
        'DifficultPoint,fa0740.BEIZHU,fa0740.TestResult'
      'from dbo.FA0740 inner join dbo.FA0745'
      'on FA0740.RKEY745=FA0745.rkey  inner join dbo.Data0034'
      'on FA0740.RKEY34=dbo.Data0034.rkey'
      'where FA0740.RKEY745=:RKEY745'
      'order by fa0740.Rkey')
    Left = 96
    Top = 152
    object aq740Rkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object aq740DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aq740DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aq740DifficultPoint: TWideStringField
      FieldName = 'DifficultPoint'
      Size = 500
    end
    object aq740BEIZHU: TWideStringField
      FieldName = 'BEIZHU'
      Size = 500
    end
    object aq740TestResult: TWideStringField
      FieldName = 'TestResult'
      Size = 500
    end
  end
  object aq745: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey10'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'select Data0025.MANU_PART_NUMBER as '#39#29983#20135#22411#21495#39',Data0010.CUST_CODE as' +
        ' '#39#23458#25143#20195#30721#39',Data0010.CUSTOMER_NAME as '#39#23458#25143#21517#31216#39', fa0745.QUAN_ON_HAND fr' +
        'om fa0745 '
      'inner join Data0010 on fa0745.rkey10=Data0010.RKEY '
      'inner join Data0025 on fa0745.RKEY25=Data0025.RKEY'
      'where fa0745.rkey10=:rkey10')
    Left = 96
    Top = 288
    object aq745DSDesigner: TStringField
      FieldName = #29983#20135#22411#21495
      Size = 30
    end
    object aq745DSDesigner2: TStringField
      FieldName = #23458#25143#20195#30721
      Size = 10
    end
    object aq745DSDesigner3: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 100
    end
    object aq745QUAN_ON_HAND: TIntegerField
      FieldName = 'QUAN_ON_HAND'
    end
  end
  object aq005: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'AUDITED_ptr'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select Data0005.EMPLOYEE_NAME from Data0005 inner join'
      'FA0745 on Data0005.RKEY=FA0745.AUDITED_ptr'
      'where FA0745.AUDITED_ptr=:AUDITED_ptr')
    Left = 96
    Top = 344
    object aq005EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object DataSource2: TDataSource
    DataSet = aq005
    Left = 128
    Top = 344
  end
  object ppDB0005: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB0005'
    Left = 159
    Top = 344
    object ppDB0005ppField1: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
end
