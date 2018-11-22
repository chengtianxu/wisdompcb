object FrmReport5: TFrmReport5
  Left = 353
  Top = 277
  Width = 342
  Height = 360
  Caption = #24050#21457#25918#30340#26448#26009
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = DM.ADOdata0493
    Left = 73
    Top = 164
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 105
    Top = 164
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
  object ppDB207: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB207'
    Left = 107
    Top = 122
    object ppDB207ppField1: TppField
      FieldAlias = 'GON_NUMBER'
      FieldName = 'GON_NUMBER'
      FieldLength = 10
      DisplayWidth = 14
      Position = 0
    end
    object ppDB207ppField2: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 26
      Position = 1
    end
    object ppDB207ppField3: TppField
      FieldAlias = 'INV_PART_DESCRIPTION'
      FieldName = 'INV_PART_DESCRIPTION'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDB207ppField4: TppField
      FieldAlias = 'GROUP_NAME'
      FieldName = 'GROUP_NAME'
      FieldLength = 10
      DisplayWidth = 12
      Position = 3
    end
    object ppDB207ppField5: TppField
      FieldAlias = 'GROUP_DESC'
      FieldName = 'GROUP_DESC'
      FieldLength = 30
      DisplayWidth = 16
      Position = 4
    end
    object ppDB207ppField6: TppField
      FieldAlias = 'DEPT_CODE'
      FieldName = 'DEPT_CODE'
      FieldLength = 10
      DisplayWidth = 12
      Position = 5
    end
    object ppDB207ppField7: TppField
      FieldAlias = 'DEPT_NAME'
      FieldName = 'DEPT_NAME'
      FieldLength = 30
      DisplayWidth = 18
      Position = 6
    end
    object ppDB207ppField8: TppField
      FieldAlias = 'TDATE'
      FieldName = 'TDATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 22
      Position = 7
    end
    object ppDB207ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 8
    end
    object ppDB207ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'RTN_QUANTITY'
      FieldName = 'RTN_QUANTITY'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 9
    end
    object ppDB207ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'STANDARD_COST'
      FieldName = 'STANDARD_COST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 10
    end
    object ppDB207ppField12: TppField
      FieldAlias = 'CUT_NO'
      FieldName = 'CUT_NO'
      FieldLength = 12
      DisplayWidth = 15
      Position = 11
    end
    object ppDB207ppField13: TppField
      FieldAlias = 'SO_NO'
      FieldName = 'SO_NO'
      FieldLength = 10
      DisplayWidth = 12
      Position = 12
    end
    object ppDB207ppField14: TppField
      FieldAlias = 'BARCODE_ID'
      FieldName = 'BARCODE_ID'
      FieldLength = 12
      DisplayWidth = 12
      Position = 13
    end
  end
  object DataSource2: TDataSource
    DataSet = DM.ado207
    Left = 72
    Top = 123
  end
  object ppReport3: TppReport
    AutoStop = False
    DataPipeline = ppDB207
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
    Template.FileName = 'R:\NIERP\Report\exhale_inventory.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport3PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 152
    Top = 120
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB207'
  end
  object ppDesigner3: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport3
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 192
    Top = 128
  end
end
