object FrmReport: TFrmReport
  Left = 373
  Top = 243
  Width = 292
  Height = 282
  Caption = #26448#26009#24211#23384
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = DM.ADOdata0493
    Left = 74
    Top = 100
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 106
    Top = 100
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
  end
  object ppDB22: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB22'
    Left = 105
    Top = 58
    object ppDB22ppField1: TppField
      FieldAlias = #26448#26009#20195#30721
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 29
      Position = 0
    end
    object ppDB22ppField3: TppField
      FieldAlias = #26448#26009#31867#21035
      FieldName = 'GROUP_NAME'
      FieldLength = 10
      DisplayWidth = 15
      Position = 1
    end
    object ppDB22ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = #24211#23384#25968#37327
      FieldName = 'quan_total'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 2
    end
    object ppDB22ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = #24179#22343#20215#26684
      FieldName = 'avl_price'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 3
    end
    object ppDB22ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #37329#39069
      FieldName = 'amount'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 4
    end
    object ppDB22ppField7: TppField
      FieldAlias = #23384#36135#21333#20301
      FieldName = 'UNIT_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object ppDB22ppField8: TppField
      FieldAlias = #20379#24212#21830
      FieldName = 'ABBR_NAME23'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppDB22ppField2: TppField
      FieldAlias = #26448#26009#21517#31216
      FieldName = 'inv_name'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppDB22ppField9: TppField
      FieldAlias = #26448#26009#35268#26684
      FieldName = 'inv_description'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
  end
  object DataSource3: TDataSource
    DataSet = DM.ADO22
    Left = 72
    Top = 58
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB22
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\warehouse_lucre.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 144
    Top = 56
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB22'
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
    Left = 184
    Top = 56
  end
end
