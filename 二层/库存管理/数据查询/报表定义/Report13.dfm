object FrmReport13: TFrmReport13
  Left = 408
  Top = 285
  Width = 351
  Height = 239
  Caption = #26631#20934#37319#36141#26434#39033#26448#26009#25910#36135#21333
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
    DataSet = Aqwz456
    Left = 96
    Top = 71
  end
  object Aqwz456: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 200
      end>
    SQL.Strings = (
      'SELECT Data0456.RKEY,Data0456.GRN_NUMBER,'
      '      Data0456.DELIVER_NUMBER, Data0023.CODE,'
      '      Data0023.SUPPLIER_NAME, Data0023.ABBR_NAME,'
      '      Data0456.ship_DATE, Data0456.STATUS, Data0456.TTYPE,'
      '      Data0456.REF_NUMBER, Data0070.PO_NUMBER,'
      '      Data0005.EMPLOYEE_NAME, Data0005.EMPL_CODE,'
      '      Data0015.WAREHOUSE_CODE, Data0015.WAREHOUSE_NAME,'
      '      Data0456.ship_BY, Data0001.CURR_CODE,Data0001.CURR_NAME,'
      '      Data0034.DEPT_NAME, Data0456.exch_rate'
      'FROM Data0456 INNER JOIN'
      '      Data0023 ON Data0456.SUPP_PTR = Data0023.RKEY INNER JOIN'
      '      Data0005 ON Data0456.CREATE_BY = Data0005.RKEY INNER JOIN'
      
        '      Data0015 ON Data0456.warehouse_ptr = Data0015.RKEY INNER J' +
        'OIN'
      '      Data0001 ON'
      '      Data0456.currency_ptr = Data0001.RKEY LEFT OUTER JOIN'
      
        '      Data0070 ON Data0456.PO_PTR = Data0070.RKEY LEFT OUTER JOI' +
        'N'
      '      Data0034 ON Data0070.PO_REV_NO = Data0034.DEPT_CODE'
      'where'
      '      Data0456.rkey = :rkey')
    Left = 64
    Top = 71
    object Aqwz456rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object Aqwz456DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      DisplayWidth = 10
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object Aqwz456CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object Aqwz456SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aqwz456ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aqwz456ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object Aqwz456STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object Aqwz456TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object Aqwz456REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 20
      FieldName = 'REF_NUMBER'
      Size = 50
    end
    object Aqwz456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object Aqwz456EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz456EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object Aqwz456v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object Aqwz456v_type: TStringField
      DisplayLabel = #20837#20179#31867#22411
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 10
      Calculated = True
    end
    object Aqwz456WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Aqwz456WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object Aqwz456ship_BY: TStringField
      FieldName = 'ship_BY'
    end
    object Aqwz456CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqwz456CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqwz456DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz456exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
  end
  object ppDB456: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB456'
    Left = 128
    Top = 72
    object ppDB456ppField2: TppField
      FieldAlias = #20837#24211#21333#21495
      FieldName = 'GRN_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField3: TppField
      FieldAlias = #36865#36135#21333#21495
      FieldName = 'DELIVER_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField4: TppField
      FieldAlias = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField5: TppField
      FieldAlias = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField6: TppField
      FieldAlias = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField7: TppField
      FieldAlias = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField10: TppField
      FieldAlias = #22791#27880
      FieldName = 'REF_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField11: TppField
      FieldAlias = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField12: TppField
      FieldAlias = #20837#20179#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField13: TppField
      FieldAlias = #20837#20179#20154#21592#20195#30721
      FieldName = 'EMPL_CODE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField14: TppField
      FieldAlias = #29366#24577
      FieldName = 'v_status'
      FieldLength = 0
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField15: TppField
      FieldAlias = #20837#20179#31867#22411
      FieldName = 'v_type'
      FieldLength = 0
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField16: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField17: TppField
      FieldAlias = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField18: TppField
      FieldAlias = #36865#36135#20154#21592
      FieldName = 'ship_BY'
      FieldLength = 0
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField19: TppField
      FieldAlias = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField20: TppField
      FieldAlias = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField21: TppField
      FieldAlias = #35831#36141#37096#38376
      FieldName = 'DEPT_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB456ppField23: TppField
      FieldAlias = #26377#25928#26399
      FieldName = 'exch_rate'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
  end
  object Aq493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 64
    Top = 136
    object Aq493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object Aq493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object Aq493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object Aq493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object Aq493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object Aq493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource3: TDataSource
    DataSet = Aq493
    Left = 96
    Top = 136
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 128
    Top = 136
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
  object DataSource2: TDataSource
    DataSet = Aqwz235
    Left = 96
    Top = 103
  end
  object Aqwz235: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0072.DESCRIPTION, dbo.Data0072.GUI_GE, '
      '      dbo.Data0072.DESCRIPTION2, dbo.Data0002.UNIT_NAME, '
      '      dbo.Data0235.QUAN_RECD, dbo.Data0016.LOCATION, '
      
        '      dbo.Data0235.REF_NUMBER,Data0072.tax_price, dbo.Data0072.S' +
        'TATE_TAX,'
      'data0235.rohs,data0235.quan_recd*data0072.tax_price as amount'
      'FROM dbo.Data0235 INNER JOIN'
      
        '      dbo.Data0072 ON dbo.Data0235.D0072_PTR = dbo.Data0072.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.R' +
        'KEY'
      'where data0235.grn_ptr=:rkey')
    Left = 63
    Top = 103
    object Aqwz235DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object Aqwz235GUI_GE: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object Aqwz235DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object Aqwz235UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object Aqwz235QUAN_RECD: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object Aqwz235LOCATION: TStringField
      DisplayLabel = #23384#36135#20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object Aqwz235REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object Aqwz235tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object Aqwz235STATE_TAX: TBCDField
      FieldName = 'STATE_TAX'
      Precision = 4
      Size = 2
    end
    object Aqwz235rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object Aqwz235amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
  end
  object ppDB235: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'DB235'
    Left = 128
    Top = 104
    object ppDB235ppField1: TppField
      FieldAlias = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField2: TppField
      FieldAlias = #29289#21697#35268#26684
      FieldName = 'GUI_GE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField3: TppField
      FieldAlias = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FieldLength = 0
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField4: TppField
      FieldAlias = #21333#20301
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField5: TppField
      FieldAlias = #25968#37327
      FieldName = 'QUAN_RECD'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField6: TppField
      FieldAlias = #20179#24211#20301#32622
      FieldName = 'LOCATION'
      FieldLength = 0
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField7: TppField
      FieldAlias = #22791#27880
      FieldName = 'REF_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField8: TppField
      FieldAlias = #21547#31246#20215
      FieldName = 'tax_price'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField9: TppField
      FieldAlias = #31246#29575'%'
      FieldName = 'STATE_TAX'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField10: TppField
      FieldAlias = #29615#20445#26631#35782
      FieldName = 'rohs'
      FieldLength = 0
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField11: TppField
      FieldAlias = #37329#39069
      FieldName = 'amount'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB235
    OnPrintingComplete = ppReport1PrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 150
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\misc_entrance.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 165
    Top = 106
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB235'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 7673
        mmLeft = 4498
        mmTop = 31750
        mmWidth = 194998
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'WAREHOUSE_NAME'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 7620
        mmLeft = 69067
        mmTop = 1323
        mmWidth = 64008
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #26434#39033#20837#24211#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4953
        mmLeft = 90699
        mmTop = 11113
        mmWidth = 21590
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20379#24212#21830':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4191
        mmLeft = 14065
        mmTop = 17727
        mmWidth = 11684
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'SUPPLIER_NAME'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 5027
        mmLeft = 27781
        mmTop = 17727
        mmWidth = 34925
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #26448#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4953
        mmLeft = 13494
        mmTop = 33073
        mmWidth = 17272
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 60325
        mmTop = 33073
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 123825
        mmTop = 32808
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 143669
        mmTop = 33073
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #21333#20215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 161925
        mmTop = 33073
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #37329#39069
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 184680
        mmTop = 33073
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #20837#24211#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 146844
        mmTop = 17727
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'GRN_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 5027
        mmLeft = 166952
        mmTop = 17727
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #36865#36135#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 146844
        mmTop = 23283
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'ship_DATE'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 5027
        mmLeft = 166688
        mmTop = 23283
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #36865#36135#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 68792
        mmTop = 23283
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'DELIVER_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 5027
        mmLeft = 88371
        mmTop = 23283
        mmWidth = 38365
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 5027
        mmLeft = 27781
        mmTop = 23283
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #37319#36141#35746#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 3175
        mmTop = 23283
        mmWidth = 22754
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 51065
        mmTop = 31750
        mmWidth = 5556
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 120915
        mmTop = 31750
        mmWidth = 5556
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 138642
        mmTop = 31750
        mmWidth = 5556
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 157692
        mmTop = 31750
        mmWidth = 5556
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 177536
        mmTop = 31750
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #36135#24065#20195#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4798
        mmLeft = 68792
        mmTop = 17463
        mmWidth = 19050
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'CURR_CODE'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 4763
        mmLeft = 88371
        mmTop = 17463
        mmWidth = 38365
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Label17lllllll'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 17727
        mmTop = 7408
        mmWidth = 18076
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 4498
        mmTop = 0
        mmWidth = 194998
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DESCRIPTION'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 5027
        mmLeft = 13494
        mmTop = 1852
        mmWidth = 28840
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'GUI_GE'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 5027
        mmLeft = 57679
        mmTop = 1852
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 5027
        mmLeft = 122238
        mmTop = 1852
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'QUAN_RECD'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 5027
        mmLeft = 142346
        mmTop = 1852
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'tax_price'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 5027
        mmLeft = 158221
        mmTop = 1852
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 5027
        mmLeft = 182827
        mmTop = 1852
        mmWidth = 13494
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 4498
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 51065
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 120650
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 138377
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 157692
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 177536
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpRight
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 193411
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #20837#24211#21592#24037':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 11906
        mmTop = 6879
        mmWidth = 18521
        BandType = 8
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 5027
        mmLeft = 32808
        mmTop = 6879
        mmWidth = 37306
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #22791#27880':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 73819
        mmTop = 7144
        mmWidth = 9790
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'REF_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 4953
        mmLeft = 84667
        mmTop = 7144
        mmWidth = 28829
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 4868
        mmLeft = 171461
        mmTop = 1588
        mmWidth = 25654
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #21512#35745#37329#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4953
        mmLeft = 152136
        mmTop = 1588
        mmWidth = 18415
        BandType = 7
      end
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
    Left = 168
    Top = 138
  end
end
