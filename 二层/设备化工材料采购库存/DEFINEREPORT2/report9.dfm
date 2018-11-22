object Frmreport9: TFrmreport9
  Left = 301
  Top = 174
  Width = 411
  Height = 408
  Caption = #26631#20934#21457#31080#28165#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppDBS112: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DBS112'
    Left = 128
    Top = 123
    object ppDBS112ppField1: TppField
      FieldAlias = 'invoice_number'
      FieldName = 'invoice_number'
      FieldLength = 10
      DisplayWidth = 19
      Position = 0
    end
    object ppDBS112ppField2: TppField
      FieldAlias = 'delivery_no'
      FieldName = 'delivery_no'
      FieldLength = 10
      DisplayWidth = 18
      Position = 1
    end
    object ppDBS112ppField3: TppField
      FieldAlias = 'CUST_CODE'
      FieldName = 'CUST_CODE'
      FieldLength = 5
      DisplayWidth = 15
      Position = 2
    end
    object ppDBS112ppField4: TppField
      FieldAlias = 'INVOICE_DATE'
      FieldName = 'INVOICE_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 15
      Position = 3
    end
    object ppDBS112ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'INVOICE_TOTAL'
      FieldName = 'INVOICE_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 4
    end
    object ppDBS112ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'ship_amount'
      FieldName = 'ship_amount'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 11
      Position = 5
    end
    object ppDBS112ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'OVERSHIP_AMOUNT'
      FieldName = 'OVERSHIP_AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 11
      Position = 6
    end
    object ppDBS112ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'RUSH_CHARGE_AMOUNT'
      FieldName = 'RUSH_CHARGE_AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 7
    end
    object ppDBS112ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DISCOUNT_AMOUNT'
      FieldName = 'DISCOUNT_AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 8
    end
    object ppDBS112ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'FED_TAX_AMOUNT'
      FieldName = 'FED_TAX_AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 9
    end
    object ppDBS112ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SHIPPING_CHARGES'
      FieldName = 'SHIPPING_CHARGES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 11
      Position = 10
    end
    object ppDBS112ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'ship_tax_amount'
      FieldName = 'ship_tax_amount'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 12
      Position = 11
    end
    object ppDBS112ppField13: TppField
      FieldAlias = 'SALES_ORDER'
      FieldName = 'SALES_ORDER'
      FieldLength = 10
      DisplayWidth = 14
      Position = 12
    end
    object ppDBS112ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SHIPMENT_NO'
      FieldName = 'SHIPMENT_NO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 13
      Position = 13
    end
    object ppDBS112ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUAN_SHIPPED'
      FieldName = 'QUAN_SHIPPED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 11
      Position = 14
    end
    object ppDBS112ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'part_price'
      FieldName = 'part_price'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppDBS112ppField17: TppField
      FieldAlias = 'CUSTOMER_PART_NUMBER'
      FieldName = 'CUSTOMER_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 17
      Position = 16
    end
    object ppDBS112ppField18: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 25
      DisplayWidth = 28
      Position = 17
    end
    object ppDBS112ppField19: TppField
      FieldAlias = 'PO_DATE'
      FieldName = 'PO_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 16
      Position = 18
    end
  end
  object DataSource4: TDataSource
    DataSet = DM.ADO112
    Left = 94
    Top = 123
  end
  object DataSource1: TDataSource
    DataSet = DM.ADOdata0493
    Left = 93
    Top = 85
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB493'
    Left = 127
    Top = 85
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
  object ppReport3: TppReport
    AutoStop = False
    DataPipeline = ppDBS112
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
    Template.FileName = 'R:\NIERP\Report\invoice_list.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport3PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 168
    Top = 128
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBS112'
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
    Left = 208
    Top = 136
  end
end
