object Frmreport8: TFrmreport8
  Left = 328
  Top = 187
  Width = 383
  Height = 423
  Caption = #21457#36135#36890#30693#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppDB530: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB530'
    Left = 128
    Top = 88
    object ppDB530ppField1: TppField
      FieldAlias = 'MAWB_NO'
      FieldName = 'MAWB_NO'
      FieldLength = 20
      DisplayWidth = 18
      Position = 0
    end
    object ppDB530ppField2: TppField
      FieldAlias = 'HAWB_NO'
      FieldName = 'HAWB_NO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDB530ppField3: TppField
      FieldAlias = 'FLIGHT_NO'
      FieldName = 'FLIGHT_NO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object ppDB530ppField4: TppField
      FieldAlias = 'DEPA_DATE'
      FieldName = 'DEPA_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 22
      Position = 3
    end
    object ppDB530ppField5: TppField
      FieldAlias = 'delivery_no'
      FieldName = 'delivery_no'
      FieldLength = 10
      DisplayWidth = 17
      Position = 4
    end
    object ppDB530ppField6: TppField
      FieldAlias = 'invoice_number'
      FieldName = 'invoice_number'
      FieldLength = 10
      DisplayWidth = 16
      Position = 5
    end
    object ppDB530ppField7: TppField
      FieldAlias = 'CUST_CODE'
      FieldName = 'CUST_CODE'
      FieldLength = 5
      DisplayWidth = 12
      Position = 6
    end
    object ppDB530ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'cartons_no'
      FieldName = 'cartons_no'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 12
      Position = 7
    end
    object ppDB530ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'charge'
      FieldName = 'charge'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 8
    end
    object ppDB530ppField10: TppField
      FieldAlias = 'SALES_ORDER'
      FieldName = 'SALES_ORDER'
      FieldLength = 10
      DisplayWidth = 18
      Position = 9
    end
    object ppDB530ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SHIPMENT_NO'
      FieldName = 'SHIPMENT_NO'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 11
      Position = 10
    end
    object ppDB530ppField12: TppField
      FieldAlias = 'CUSTOMER_PART_NUMBER'
      FieldName = 'CUSTOMER_PART_NUMBER'
      FieldLength = 20
      DisplayWidth = 21
      Position = 11
    end
    object ppDB530ppField13: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 25
      DisplayWidth = 21
      Position = 12
    end
    object ppDB530ppField14: TppField
      FieldAlias = 'PO_DATE'
      FieldName = 'PO_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 14
      Position = 13
    end
    object ppDB530ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUAN_SHIPPED'
      FieldName = 'QUAN_SHIPPED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 14
    end
    object ppDB530ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'part_price'
      FieldName = 'part_price'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 15
    end
    object ppDB530ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'amount'
      FieldName = 'amount'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 16
    end
  end
  object DataSource3: TDataSource
    DataSet = DM.ADO530
    Left = 91
    Top = 89
  end
  object DataSource1: TDataSource
    DataSet = DM.ADOdata0493
    Left = 90
    Top = 133
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB493'
    Left = 127
    Top = 133
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
    AutoStop = False
    DataPipeline = ppDB530
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A5 148 x 210 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 148000
    PrinterSetup.PaperSize = 11
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\shipadvice_list.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport2PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 168
    Top = 88
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB530'
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
    Left = 208
    Top = 88
  end
end
