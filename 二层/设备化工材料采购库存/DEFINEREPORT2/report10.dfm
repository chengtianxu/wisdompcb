object Frmreport10: TFrmreport10
  Left = 326
  Top = 178
  Width = 431
  Height = 420
  Caption = #24037#20855#21457#31080#28165#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppDBt112: TppDBPipeline
    DataSource = DataSource5
    UserName = 'DBt112'
    Left = 129
    Top = 158
    object ppDBt112ppField1: TppField
      FieldAlias = 'invoice_number'
      FieldName = 'invoice_number'
      FieldLength = 10
      DisplayWidth = 14
      Position = 0
    end
    object ppDBt112ppField2: TppField
      FieldAlias = 'CUST_CODE'
      FieldName = 'CUST_CODE'
      FieldLength = 5
      DisplayWidth = 10
      Position = 1
    end
    object ppDBt112ppField3: TppField
      FieldAlias = 'INVOICE_DATE'
      FieldName = 'INVOICE_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 15
      Position = 2
    end
    object ppDBt112ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOOLING_CHARGES'
      FieldName = 'TOOLING_CHARGES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 3
    end
    object ppDBt112ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'ship_tax_amount'
      FieldName = 'ship_tax_amount'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 4
    end
    object ppDBt112ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'INVOICE_TOTAL'
      FieldName = 'INVOICE_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 5
    end
    object ppDBt112ppField7: TppField
      FieldAlias = 'SALES_ORDER'
      FieldName = 'SALES_ORDER'
      FieldLength = 10
      DisplayWidth = 12
      Position = 6
    end
    object ppDBt112ppField8: TppField
      FieldAlias = 'CUSTOMER_PART_NUMBER'
      FieldName = 'CUSTOMER_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 21
      Position = 7
    end
    object ppDBt112ppField9: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 25
      DisplayWidth = 23
      Position = 8
    end
    object ppDBt112ppField10: TppField
      FieldAlias = 'PO_DATE'
      FieldName = 'PO_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 16
      Position = 9
    end
  end
  object DataSource5: TDataSource
    DataSet = DM.ADO0112
    Left = 93
    Top = 159
  end
  object DataSource1: TDataSource
    DataSet = DM.ADOdata0493
    Left = 90
    Top = 117
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB493'
    Left = 127
    Top = 117
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
  object ppReport4: TppReport
    AutoStop = False
    DataPipeline = ppDBt112
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
    Template.FileName = 'R:\NIERP\Report\tool_invoice_list.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 168
    Top = 160
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBt112'
  end
  object ppDesigner4: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport4
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 208
    Top = 160
  end
end
