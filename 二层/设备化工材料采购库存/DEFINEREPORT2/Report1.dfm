object Frmreport1: TFrmreport1
  Left = 304
  Top = 255
  Width = 295
  Height = 212
  Caption = #25104#21697#24211#23384
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
    Left = 72
    Top = 62
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 104
    Top = 61
    object ppDB493ppField1: TppField
      FieldAlias = #20844#21496#21517#31216
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB493ppField3: TppField
      FieldAlias = #20844#21496#22270#26631
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object ppDB53: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'DB53'
    Left = 104
    Top = 28
    object ppDB53ppField1: TppField
      FieldAlias = #20135#21697#31867#22411
      FieldName = 'PROD_CODE'
      FieldLength = 5
      DisplayWidth = 10
      Position = 0
    end
    object ppDB53ppField2: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = 'CUSTOMER_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 24
      Position = 1
    end
    object ppDB53ppField3: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = 'CUSTOMER_PART_DESC'
      FieldLength = 40
      DisplayWidth = 53
      Position = 2
    end
    object ppDB53ppField4: TppField
      FieldAlias = #29256#26412
      FieldName = 'CP_REV'
      FieldLength = 5
      DisplayWidth = 8
      Position = 3
    end
    object ppDB53ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = #25968#37327
      FieldName = 'quantity_hand'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 4
    end
    object ppDB53ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #37329#39069
      FieldName = 'amount'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 5
    end
    object ppDB53ppField7: TppField
      FieldAlias = #23458#25143
      FieldName = 'abbr_name10'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppDB53ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = #38754#31215
      FieldName = 'mianji'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object DataSource2: TDataSource
    DataSet = DM.Aq53
    Left = 72
    Top = 29
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB53
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
    Template.FileName = 'R:\NIERP\Report\custpart_lucre.rtm'
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
    Top = 32
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB53'
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
    Top = 40
  end
end
