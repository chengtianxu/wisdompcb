object frmReports: TfrmReports
  Left = 467
  Top = 139
  Width = 579
  Height = 442
  Caption = 'frmReports'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
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
    Left = 304
    Top = 8
  end
  object dsRpt167: TDataSource
    DataSet = adsRpt167
    Left = 88
    Top = 8
  end
  object ppDB493: TppDBPipeline
    DataSource = dsRpt493
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 76
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
  object dsRpt493: TDataSource
    DataSet = adsRpt493
    Left = 88
    Top = 76
  end
  object adsRpt493: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'SELECT * FROM DATA0493'
    Parameters = <>
    Left = 24
    Top = 76
    object adsRpt493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object adsRpt493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object adsRpt493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object adsRpt493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object adsRpt493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object adsRpt493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object adsRpt493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object adsRpt493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object adsRpt493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object adsRpt167: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'Exec Rpt0167 :RKEY167'
    Parameters = <
      item
        Name = 'RKEY167'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 16
    Top = 16
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB167
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8.5x11 '#33521#23544
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 8
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB167'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object daDataModule1: TdaDataModule
    end
  end
  object ppDB167: TppDBPipeline
    DataSource = dsRpt167
    OpenDataSource = False
    UserName = 'DB167'
    Left = 160
    Top = 8
    object ppDB167ppField1: TppField
      FieldAlias = 'RKEY165'
      FieldName = 'RKEY165'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField2: TppField
      FieldAlias = 'ContractNo'
      FieldName = 'ContractNo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField3: TppField
      FieldAlias = 'Cust_Id'
      FieldName = 'Cust_Id'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField4: TppField
      FieldAlias = 'Cust_Name'
      FieldName = 'Cust_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField5: TppField
      FieldAlias = 'Cust_Addr'
      FieldName = 'Cust_Addr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField6: TppField
      FieldAlias = 'SalesMan'
      FieldName = 'SalesMan'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField7: TppField
      FieldAlias = 'Contact'
      FieldName = 'Contact'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField8: TppField
      FieldAlias = 'Tel'
      FieldName = 'Tel'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField9: TppField
      FieldAlias = 'Fax'
      FieldName = 'Fax'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField10: TppField
      FieldAlias = 'Mail'
      FieldName = 'Mail'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField11: TppField
      FieldAlias = 'ContractAmt'
      FieldName = 'ContractAmt'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField12: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField13: TppField
      FieldAlias = 'Position'
      FieldName = 'Position'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField14: TppField
      FieldAlias = 'Notes'
      FieldName = 'Notes'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField15: TppField
      FieldAlias = 'CreateId'
      FieldName = 'CreateId'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField16: TppField
      FieldAlias = 'CreateDate'
      FieldName = 'CreateDate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField17: TppField
      FieldAlias = 'LastModifyId'
      FieldName = 'LastModifyId'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField18: TppField
      FieldAlias = 'LastModifyDate'
      FieldName = 'LastModifyDate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField19: TppField
      FieldAlias = 'AuditId'
      FieldName = 'AuditId'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField20: TppField
      FieldAlias = 'AuditDate'
      FieldName = 'AuditDate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField21: TppField
      FieldAlias = 'RFQNo'
      FieldName = 'RFQNo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField22: TppField
      FieldAlias = 'RFQ'
      FieldName = 'RFQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField23: TppField
      FieldAlias = 'FileName'
      FieldName = 'FileName'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField24: TppField
      FieldAlias = 'PartsId'
      FieldName = 'PartsId'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField25: TppField
      FieldAlias = 'BoardThick'
      FieldName = 'BoardThick'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField26: TppField
      FieldAlias = 'Layers'
      FieldName = 'Layers'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField27: TppField
      FieldAlias = 'SetSize'
      FieldName = 'SetSize'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField28: TppField
      FieldAlias = 'Qnty'
      FieldName = 'Qnty'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField29: TppField
      FieldAlias = 'UPS'
      FieldName = 'UPS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField30: TppField
      FieldAlias = 'Price'
      FieldName = 'Price'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField31: TppField
      FieldAlias = 'AfterPrice'
      FieldName = 'AfterPrice'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField32: TppField
      FieldAlias = 'EngAmount'
      FieldName = 'EngAmount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField33: TppField
      FieldAlias = 'FLAmount'
      FieldName = 'FLAmount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField34: TppField
      FieldAlias = 'TestAmount'
      FieldName = 'TestAmount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField35: TppField
      FieldAlias = 'MakeAmount'
      FieldName = 'MakeAmount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField36: TppField
      FieldAlias = 'OtherAmount'
      FieldName = 'OtherAmount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField37: TppField
      FieldAlias = 'TotalAmount'
      FieldName = 'TotalAmount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField38: TppField
      FieldAlias = 'AftDiscountAmount'
      FieldName = 'AftDiscountAmount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField39: TppField
      FieldAlias = 'Area'
      FieldName = 'Area'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField40: TppField
      FieldAlias = 'Area_M2'
      FieldName = 'Area_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField41: TppField
      FieldAlias = 'DueDate'
      FieldName = 'DueDate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField42: TppField
      FieldAlias = 'File_Number'
      FieldName = 'File_Number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField43: TppField
      FieldAlias = 'POType'
      FieldName = 'POType'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField44: TppField
      FieldAlias = 'LAM2'
      FieldName = 'LAM2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField45: TppField
      FieldAlias = 'SurfaceDeal'
      FieldName = 'SurfaceDeal'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField46: TppField
      FieldAlias = 'WCCPTH'
      FieldName = 'WCCPTH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField47: TppField
      FieldAlias = 'NCCPTH'
      FieldName = 'NCCPTH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField48: TppField
      FieldAlias = 'Version'
      FieldName = 'Version'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField49: TppField
      FieldAlias = 'TZFL'
      FieldName = 'TZFL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField50: TppField
      FieldAlias = 'GoldFingerAmount'
      FieldName = 'GoldFingerAmount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField51: TppField
      FieldAlias = 'UrgentAmount'
      FieldName = 'UrgentAmount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField52: TppField
      FieldAlias = 'Discount'
      FieldName = 'Discount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField53: TppField
      FieldAlias = 'UrgentDays'
      FieldName = 'UrgentDays'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField54: TppField
      FieldAlias = 'DueDays'
      FieldName = 'DueDays'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField55: TppField
      FieldAlias = 'NotesDtl'
      FieldName = 'NotesDtl'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField56: TppField
      FieldAlias = 'UpperContractAmt'
      FieldName = 'UpperContractAmt'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField57: TppField
      FieldAlias = 'TPOType'
      FieldName = 'TPOType'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField58: TppField
      FieldAlias = 'TH'
      FieldName = 'TH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField59: TppField
      FieldAlias = 'DueArea'
      FieldName = 'DueArea'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField60: TppField
      FieldAlias = 'FED_TAX_ID_NO'
      FieldName = 'FED_TAX_ID_NO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField61: TppField
      FieldAlias = 'INVOICE_TYPE'
      FieldName = 'INVOICE_TYPE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField62: TppField
      FieldAlias = 'PCS_SET'
      FieldName = 'PCS_SET'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField63: TppField
      FieldAlias = 'StdCheck'
      FieldName = 'StdCheck'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField64: TppField
      FieldAlias = 'AllStdCheck'
      FieldName = 'AllStdCheck'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppDB167ppField65: TppField
      FieldAlias = 'AllDueDays'
      FieldName = 'AllDueDays'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
  end
  object ppDBProd: TppDBPipeline
    DataSource = dsProd
    UserName = 'DBProd'
    Left = 160
    Top = 144
  end
  object adsProd: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'Exec Rpt0167;3 :RKEY167 , :RFQNo'
    Parameters = <
      item
        Name = 'RKEY167'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'RFQNo'
        Attributes = [paSigned]
        DataType = ftString
        Size = 15
        Value = Null
      end>
    Left = 24
    Top = 144
  end
  object dsProd: TDataSource
    DataSet = adsProd
    Left = 88
    Top = 144
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDBProd
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter 8.5x11 '#33521#23544
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 144
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBProd'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
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
    Left = 304
    Top = 144
  end
end
