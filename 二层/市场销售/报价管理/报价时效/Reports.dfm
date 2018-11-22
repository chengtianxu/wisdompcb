object frmReports: TfrmReports
  Left = 378
  Top = 278
  Width = 375
  Height = 215
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
  object ppDB493: TppDBPipeline
    DataSource = dsRpt493
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 76
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
  object adsRpt: TADODataSet
    Connection = dm.ADOConn
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'IF OBJECT_ID('#39'tempdb..#tmpTable'#39') IS NOT NULL'#13#10'DROP TABLE #tmpTa' +
      'ble'#13#10'SELECT IDENTITY(INT,1,1) AS '#39#24207#21495#39',D85.TNUMBER as '#39#25253#20215#21333#21495#39',D85.' +
      'QTE_DATE AS '#39#25253#20215#26085#26399#39',t242.PaperNO AS '#39#25253#20215#26102#25928#21333#21495#39',t242.CreateTime AS '#39 +
      #25253#20215#26102#25928#26085#26399#39',t242.MANU_PART_DESC AS '#39#23458#25143#22411#21495#39',t5.EMPLOYEE_NAME AS '#39#19994#21153#21592#39',' +
      'D85.EMPLOYEE_NAME AS '#39#25253#20215#21592#39','#13#10#9'ISNULL(t10.CUST_CODE,'#39#39') AS '#39#23458#25143#20195#30721#39 +
      ',t242.CUSTOMER_NAME AS '#39#23458#25143#21517#31216#39',ISNULL(t10.ABBR_NAME,t242.CUSTOMER' +
      '_NAME) AS '#39#23458#25143#31616#31216#39','#13#10#9'ISNULL(t241.Code,'#39#39') AS '#39#25253#20215#31867#22411#20195#30721#39',ISNULL(t241' +
      '.Name,'#39#39') AS '#39#25253#20215#31867#22411#39',ISNULL(t241.Time,0) AS '#39#26631#20934#26102#38388#39',ISNULL(t243.An' +
      'swerTime,t243.DownloadTime) AS '#39#19979#36733#26102#38388#39',t242.Quote_FinishTime AS '#39 +
      #23436#25104#26102#38388#39','#32791#26102'=dbo.fCalcDateDiffNotExistsOffDutyTime(ISNULL(t243.Answe' +
      'rTime,t243.DownloadTime),t242.Quote_FinishTime),'#13#10#9'CASE WHEN ISN' +
      'ULL(t241.Time,0)-dbo.fCalcDateDiffNotExistsOffDutyTime(ISNULL(t2' +
      '43.AnswerTime,t243.DownloadTime),t242.Quote_FinishTime)>=0 THEN ' +
      #39#36798#26631#39' ELSE '#39#19981#36798#26631#39' END AS '#26102#25928#24615','#13#10#9'CASE t242.Quote_Status WHEN 0 THEN' +
      ' '#39#24453#25253#20215#39' WHEN 1 THEN '#39#25253#20215#20013#39' WHEN 2 THEN '#39#24050#23436#25104#39' WHEN 3 THEN '#39#35810#38382#20013#39' WHE' +
      'N 4 THEN '#39#24050#22238#22797#39' WHEN 255 THEN '#39#24050#21462#28040#39' ELSE '#39#39' END AS '#25253#20215#29366#24577#13#10'INTO #tm' +
      'pTable'#13#10'FROM Data0242 t242 LEFT JOIN Data0241 t241 ON t242.Type_' +
      'PTR=t241.RKEY'#13#10'LEFT JOIN Data0010 t10 ON t242.CUST_PTR=t10.RKEY'#13 +
      #10'LEFT JOIN Data0005 t5 ON t242.Sales_Ptr=t5.RKEY'#13#10'LEFT JOIN (SEL' +
      'ECT D1.* FROM Data0243 D1'#13#10#9#9#9'INNER JOIN (SELECT tmp2.PTR_242,MA' +
      'X(ISNULL(tmp2.SeqNO,0)) AS SeqNO'#13#10#9#9#9#9#9#9'FROM Data0242 tmp1 LEFT ' +
      'JOIN Data0243 tmp2 ON tmp1.RKEY = tmp2.PTR_242'#13#10#9#9#9#9#9#9'WHERE tmp1' +
      '.CreateTime >= :BDate AND tmp1.CreateTime < :EDate'#13#10#9#9#9#9#9#9'GROUP ' +
      'BY tmp2.PTR_242) AS D2 ON D2.PTR_242 = D1.PTR_242 AND D2.SeqNO =' +
      ' D1.SeqNO) t243 ON t242.RKEY = t243.PTR_242'#13#10'LEFT JOIN (SELECT t' +
      '85.ptr_242,t85.TNUMBER,t85.QTE_DATE,t5_1.EMPLOYEE_NAME FROM Data' +
      '0085 t85 LEFT JOIN Data0005 t5_1 ON t85.QBY_EMPL_PTR=t5_1.RKEY) ' +
      'D85 ON t242.RKEY=D85.ptr_242'#13#10'WHERE (( :status = -1) or (t242.Qu' +
      'ote_Status = :status ))'#13#10'AND t242.CreateTime >= :BDate AND t242.' +
      'CreateTime < :EDate'#13#10'ORDER BY t242.PaperNO'#13#10#13#10'SELECT * FROM #tmp' +
      'Table'
    Parameters = <
      item
        Name = 'BDate'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'EDate'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'status'
        DataType = ftSmallint
        Size = -1
        Value = Null
      end
      item
        Name = 'status'
        Size = -1
        Value = Null
      end
      item
        Name = 'BDate'
        Size = -1
        Value = Null
      end
      item
        Name = 'EDate'
        Size = -1
        Value = Null
      end>
    Left = 24
    Top = 8
    object adsRptDSDesigner18: TIntegerField
      FieldName = #24207#21495
      ReadOnly = True
    end
    object adsRptDSDesigner: TStringField
      FieldName = #25253#20215#21333#21495
      Size = 10
    end
    object adsRptDSDesigner2: TDateTimeField
      FieldName = #25253#20215#26085#26399
    end
    object adsRptDSDesigner3: TStringField
      FieldName = #25253#20215#26102#25928#21333#21495
      Size = 18
    end
    object adsRptDSDesigner4: TDateTimeField
      FieldName = #25253#20215#26102#25928#26085#26399
    end
    object adsRptDSDesigner5: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 50
    end
    object adsRptDSDesigner6: TStringField
      FieldName = #19994#21153#21592
      Size = 16
    end
    object adsRptDSDesigner16: TStringField
      FieldName = #25253#20215#21592
      Size = 16
    end
    object adsRptDSDesigner7: TStringField
      FieldName = #23458#25143#20195#30721
      ReadOnly = True
      Size = 10
    end
    object adsRptDSDesigner8: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 100
    end
    object adsRptDSDesigner9: TStringField
      FieldName = #23458#25143#31616#31216
      ReadOnly = True
      Size = 10
    end
    object adsRptDSDesigner10: TStringField
      FieldName = #25253#20215#31867#22411#20195#30721
      ReadOnly = True
      Size = 10
    end
    object adsRptDSDesigner11: TStringField
      FieldName = #25253#20215#31867#22411
      ReadOnly = True
      Size = 30
    end
    object adsRptDSDesigner12: TIntegerField
      FieldName = #26631#20934#26102#38388
      ReadOnly = True
    end
    object adsRptDSDesigner13: TDateTimeField
      FieldName = #19979#36733#26102#38388
    end
    object adsRptDSDesigner14: TDateTimeField
      FieldName = #23436#25104#26102#38388
    end
    object adsRptDSDesigner15: TIntegerField
      FieldName = #32791#26102
      ReadOnly = True
    end
    object adsRptDSDesigner17: TStringField
      FieldName = #26102#25928#24615
      ReadOnly = True
      Size = 6
    end
  end
  object dsRpt: TDataSource
    DataSet = adsRpt
    Left = 88
    Top = 8
  end
  object ppDB: TppDBPipeline
    DataSource = dsRpt
    OpenDataSource = False
    UserName = 'DB'
    Left = 160
    Top = 8
    object ppDBppField1: TppField
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBppField2: TppField
      FieldAlias = #25253#20215#21333#21495
      FieldName = #25253#20215#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBppField3: TppField
      FieldAlias = #25253#20215#26085#26399
      FieldName = #25253#20215#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBppField4: TppField
      FieldAlias = #25253#20215#26102#25928#21333#21495
      FieldName = #25253#20215#26102#25928#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBppField5: TppField
      FieldAlias = #25253#20215#26102#25928#26085#26399
      FieldName = #25253#20215#26102#25928#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBppField6: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = #23458#25143#22411#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBppField7: TppField
      FieldAlias = #19994#21153#21592
      FieldName = #19994#21153#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBppField8: TppField
      FieldAlias = #25253#20215#21592
      FieldName = #25253#20215#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBppField9: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = #23458#25143#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBppField10: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = #23458#25143#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBppField11: TppField
      FieldAlias = #23458#25143#31616#31216
      FieldName = #23458#25143#31616#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBppField12: TppField
      FieldAlias = #25253#20215#31867#22411#20195#30721
      FieldName = #25253#20215#31867#22411#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBppField13: TppField
      FieldAlias = #25253#20215#31867#22411
      FieldName = #25253#20215#31867#22411
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDBppField14: TppField
      FieldAlias = #26631#20934#26102#38388
      FieldName = #26631#20934#26102#38388
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDBppField15: TppField
      FieldAlias = #19979#36733#26102#38388
      FieldName = #19979#36733#26102#38388
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDBppField16: TppField
      FieldAlias = #23436#25104#26102#38388
      FieldName = #23436#25104#26102#38388
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDBppField17: TppField
      FieldAlias = #32791#26102
      FieldName = #32791#26102
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDBppField18: TppField
      FieldAlias = #26102#25928#24615
      FieldName = #26102#25928#24615
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB
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
    DataPipelineName = 'ppDB'
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
    Left = 304
    Top = 8
  end
end
