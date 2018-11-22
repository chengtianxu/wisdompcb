object Frmreport6: TFrmreport6
  Left = 566
  Top = 197
  Width = 269
  Height = 328
  Caption = #25104#21697#36827#20179
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource3: TDataSource
    DataSet = DM.ADO53
    Left = 72
    Top = 100
  end
  object DataSource1: TDataSource
    DataSet = DM.ADOdata0493
    Left = 72
    Top = 129
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 104
    Top = 128
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
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
  object ppReport2: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\received_custpart.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport2PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 136
    Top = 104
    Version = '7.01'
    mmColumnWidth = 0
  end
  object ppDesigner2: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport2
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 168
    Top = 104
  end
  object ppDB53_in: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB53_in'
    Left = 104
    Top = 96
    object ppDB53_inppField1: TppField
      FieldAlias = 'WORK_ORDER_NUMBER'
      FieldName = 'WORK_ORDER_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB53_inppField2: TppField
      FieldAlias = 'PROD_CODE'
      FieldName = 'PROD_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDB53_inppField3: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppDB53_inppField4: TppField
      FieldAlias = 'WAREHOUSE_CODE'
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 3
    end
    object ppDB53_inppField5: TppField
      FieldAlias = 'LOCATION'
      FieldName = 'LOCATION'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDB53_inppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB53_inppField7: TppField
      FieldAlias = 'number'
      FieldName = 'number'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppDB53_inppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'type'
      FieldName = 'type'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 7
    end
    object ppDB53_inppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'in_mianqi'
      FieldName = 'in_mianqi'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDB53_inppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'so_mianqi'
      FieldName = 'so_mianqi'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDB53_inppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTY_ON_HAND'
      FieldName = 'QTY_ON_HAND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDB53_inppField12: TppField
      FieldAlias = 'MFG_DATE'
      FieldName = 'MFG_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppDB53_inppField13: TppField
      FieldAlias = 'REFERENCE_NUMBER'
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppDB53_inppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'RMA_PTR'
      FieldName = 'RMA_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
    object ppDB53_inppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'inweight'
      FieldName = 'inweight'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDB53_inppField16: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object ppDB53_inppField17: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 16
    end
    object ppDB53_inppField18: TppField
      FieldAlias = 'ANALYSIS_CODE_2'
      FieldName = 'ANALYSIS_CODE_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 17
    end
    object ppDB53_inppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'LATEST_PRICE'
      FieldName = 'LATEST_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppDB53_inppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAXLATEST_PRICE'
      FieldName = 'TAXLATEST_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppDB53_inppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'exch_rate'
      FieldName = 'exch_rate'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppDB53_inppField22: TppField
      FieldAlias = 'so_no'
      FieldName = 'so_no'
      FieldLength = 12
      DisplayWidth = 12
      Position = 21
    end
    object ppDB53_inppField23: TppField
      FieldAlias = 'zhuanchang'
      FieldName = 'zhuanchang'
      FieldLength = 4
      DisplayWidth = 4
      Position = 22
    end
    object ppDB53_inppField24: TppField
      FieldAlias = 'c_type'
      FieldName = 'c_type'
      FieldLength = 16
      DisplayWidth = 16
      Position = 23
    end
  end
end
