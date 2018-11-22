object Form_InReport: TForm_InReport
  Left = 473
  Top = 208
  Width = 318
  Height = 298
  Caption = 'Form_InReport'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Aqwz133: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = Aqwz133CalcFields
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
      
        'SELECT dbo.Data0133.RKEY, dbo.Data0133.GRN_NUMBER, dbo.Data0133.' +
        'DELIVER_NUMBER,'
      '  dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME,'
      '  dbo.Data0023.ABBR_NAME, dbo.Data0133.ship_DATE, '
      
        '  dbo.Data0133.TTYPE, dbo.Data0133.REF_NUMBER, dbo.Data0070.PO_N' +
        'UMBER,'
      '  Data0005.EMPLOYEE_NAME, Data0005.EMPL_CODE,'
      
        '  dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME, dbo.' +
        'Data0133.ship_BY,'
      '  dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME,'
      '  dbo.Data0034.DEPT_NAME, dbo.Data0133.exch_rate'
      'FROM dbo.Data0133 INNER JOIN'
      
        '  dbo.Data0023 ON dbo.Data0133.SUPP_PTR = dbo.Data0023.RKEY INNE' +
        'R JOIN'
      
        '  dbo.Data0005 AS Data0005 ON dbo.Data0133.CREATE_BY = Data0005.' +
        'RKEY INNER JOIN'
      
        '  dbo.Data0015 ON dbo.Data0133.warehouse_ptr = dbo.Data0015.RKEY' +
        ' INNER JOIN'
      
        '  dbo.Data0001 ON dbo.Data0133.currency_ptr = dbo.Data0001.RKEY ' +
        'LEFT OUTER JOIN'
      
        '  dbo.Data0070 ON dbo.Data0133.PO_PTR = dbo.Data0070.RKEY LEFT O' +
        'UTER JOIN'
      
        '  dbo.Data0034 ON dbo.Data0034.DEPT_CODE = dbo.Data0070.PO_REV_N' +
        'O '
      'where'
      '  dbo.Data0133.rkey = :rkey')
    Left = 64
    Top = 71
    object Aqwz133RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aqwz133GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object Aqwz133DELIVER_NUMBER: TStringField
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object Aqwz133CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object Aqwz133SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aqwz133ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object Aqwz133ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object Aqwz133TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object Aqwz133REF_NUMBER: TStringField
      FieldName = 'REF_NUMBER'
      Size = 100
    end
    object Aqwz133PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object Aqwz133EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz133EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object Aqwz133WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Aqwz133WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object Aqwz133ship_BY: TStringField
      FieldName = 'ship_BY'
    end
    object Aqwz133CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqwz133CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqwz133DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz133exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object Aqwz133v_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Calculated = True
    end
  end
  object Aqwz134: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 200
      end>
    SQL.Strings = (
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, '
      '      Data0134.QUANTITY,Data0002.UNIT_NAME,data0134.supplier2,'
      '      dbo.Data0134.BARCODE_ID, dbo.Data0134.EXPIRE_DATE, '
      
        '      Data0134.tax_PRICE as price,dbo.Data0134.TAX_2,data0134.ro' +
        'hs,'
      '      Data0134.QUANTITY*Data0134.tax_PRICE as amount'
      'FROM dbo.Data0134 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0134.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      '      dbo.Data0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0134.LOCATION_PTR = dbo.Data0016.R' +
        'KEY'
      'where Data0134.grn_ptr=:rkey')
    Left = 64
    Top = 103
    object Aqwz134INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object Aqwz134INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object Aqwz134INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object Aqwz134LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object Aqwz134QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object Aqwz134UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object Aqwz134supplier2: TStringField
      FieldName = 'supplier2'
      Size = 30
    end
    object Aqwz134BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object Aqwz134EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object Aqwz134price: TBCDField
      FieldName = 'price'
      Precision = 12
      Size = 3
    end
    object Aqwz134TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object Aqwz134rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object Aqwz134amount: TBCDField
      FieldName = 'amount'
      ReadOnly = True
      Precision = 32
      Size = 7
    end
  end
  object Aq493: TADOQuery
    Connection = dm.ADOConnection1
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
  object DataSource1: TDataSource
    DataSet = Aqwz133
    Left = 96
    Top = 71
  end
  object DataSource2: TDataSource
    DataSet = Aqwz134
    Left = 96
    Top = 103
  end
  object DataSource3: TDataSource
    DataSet = Aq493
    Left = 96
    Top = 136
  end
  object ppDB133: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB133'
    Left = 128
    Top = 72
    object ppDB133ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 0
    end
    object ppDB133ppField2: TppField
      FieldAlias = 'GRN_NUMBER'
      FieldName = 'GRN_NUMBER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 1
    end
    object ppDB133ppField3: TppField
      FieldAlias = 'DELIVER_NUMBER'
      FieldName = 'DELIVER_NUMBER'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object ppDB133ppField4: TppField
      FieldAlias = 'CODE'
      FieldName = 'CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDB133ppField5: TppField
      FieldAlias = 'SUPPLIER_NAME'
      FieldName = 'SUPPLIER_NAME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object ppDB133ppField6: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 16
      DisplayWidth = 16
      Position = 5
    end
    object ppDB133ppField7: TppField
      FieldAlias = 'ship_DATE'
      FieldName = 'ship_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object ppDB133ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TTYPE'
      FieldName = 'TTYPE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDB133ppField9: TppField
      FieldAlias = 'REF_NUMBER'
      FieldName = 'REF_NUMBER'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object ppDB133ppField10: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object ppDB133ppField11: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 16
      DisplayWidth = 16
      Position = 10
    end
    object ppDB133ppField12: TppField
      FieldAlias = 'EMPL_CODE'
      FieldName = 'EMPL_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppDB133ppField13: TppField
      FieldAlias = 'WAREHOUSE_CODE'
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 12
    end
    object ppDB133ppField14: TppField
      FieldAlias = 'WAREHOUSE_NAME'
      FieldName = 'WAREHOUSE_NAME'
      FieldLength = 70
      DisplayWidth = 70
      Position = 13
    end
    object ppDB133ppField15: TppField
      FieldAlias = 'ship_BY'
      FieldName = 'ship_BY'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object ppDB133ppField16: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 15
    end
    object ppDB133ppField17: TppField
      FieldAlias = 'CURR_NAME'
      FieldName = 'CURR_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
    object ppDB133ppField18: TppField
      FieldAlias = 'DEPT_NAME'
      FieldName = 'DEPT_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 17
    end
    object ppDB133ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'exch_rate'
      FieldName = 'exch_rate'
      FieldLength = 8
      DataType = dtDouble
      DisplayWidth = 13
      Position = 18
    end
    object ppDB133ppField20: TppField
      FieldAlias = 'v_type'
      FieldName = 'v_type'
      FieldLength = 20
      DisplayWidth = 20
      Position = 19
    end
  end
  object ppDB134: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB134'
    Left = 128
    Top = 104
    MasterDataPipelineName = 'ppDB133'
    object ppDB134ppField1: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 25
      DisplayWidth = 25
      Position = 0
    end
    object ppDB134ppField2: TppField
      FieldAlias = 'INV_NAME'
      FieldName = 'INV_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppDB134ppField3: TppField
      FieldAlias = 'INV_DESCRIPTION'
      FieldName = 'INV_DESCRIPTION'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppDB134ppField4: TppField
      FieldAlias = 'LOCATION'
      FieldName = 'LOCATION'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppDB134ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 20
      Position = 4
    end
    object ppDB134ppField6: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDB134ppField7: TppField
      FieldAlias = 'supplier2'
      FieldName = 'supplier2'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object ppDB134ppField8: TppField
      FieldAlias = 'BARCODE_ID'
      FieldName = 'BARCODE_ID'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB134ppField9: TppField
      FieldAlias = 'EXPIRE_DATE'
      FieldName = 'EXPIRE_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppDB134ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'price'
      FieldName = 'price'
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 13
      Position = 9
    end
    object ppDB134ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'TAX_2'
      FieldName = 'TAX_2'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 5
      Position = 10
    end
    object ppDB134ppField12: TppField
      FieldAlias = 'rohs'
      FieldName = 'rohs'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppDB134ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'amount'
      FieldName = 'amount'
      FieldLength = 7
      DataType = dtDouble
      DisplayWidth = 33
      Position = 12
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 128
    Top = 136
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB134
    OnPrintingComplete = ppReport1PrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\SJSYS\NIERP\Report\IN_VMI.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 200
    Top = 104
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB134'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 48948
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'WAREHOUSE_NAME'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 7144
        mmLeft = 69586
        mmTop = 1588
        mmWidth = 83079
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'VMI'#36135#21697#25509#25910#20973#35777
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 91546
        mmTop = 9790
        mmWidth = 37571
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 14552
        mmLeft = 11906
        mmTop = 529
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #36865#36135#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 9260
        mmTop = 19315
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #37319#36141#35746#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 26458
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #20379#24212#21830':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 12700
        mmTop = 34131
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #20837#20179#31867#22411':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 70115
        mmTop = 19315
        mmWidth = 15917
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #20837#20179#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 70115
        mmTop = 26458
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #20837#20179#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 70115
        mmTop = 34131
        mmWidth = 15917
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #25509#25910#24037#21378':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 123031
        mmTop = 19315
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #24065#31181':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 26458
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #27719#29575':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 34131
        mmWidth = 8731
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 529
        mmLeft = 794
        mmTop = 48419
        mmWidth = 203200
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #26448#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 10583
        mmTop = 44186
        mmWidth = 14139
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #26448#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 46038
        mmTop = 44186
        mmWidth = 14139
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #26448#26009#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 84931
        mmTop = 44186
        mmWidth = 14139
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 122502
        mmTop = 44186
        mmWidth = 7070
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 136790
        mmTop = 44186
        mmWidth = 7070
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #21333#20215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 150284
        mmTop = 44186
        mmWidth = 7070
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #31246#29575'%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 165894
        mmTop = 44186
        mmWidth = 8848
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #37329#39069
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 183357
        mmTop = 44186
        mmWidth = 7070
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'DELIVER_NUMBER'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 19315
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 26458
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'EMPL_CODE'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 34131
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 39423
        mmWidth = 23019
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'v_type'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 86254
        mmTop = 19315
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'GRN_NUMBER'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 86254
        mmTop = 26458
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'ship_DATE'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 86254
        mmTop = 34131
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'WAREHOUSE_CODE'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 139436
        mmTop = 19315
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'WAREHOUSE_NAME'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 19315
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'CURR_CODE'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 138907
        mmTop = 26458
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'exch_rate'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 3969
        mmLeft = 138907
        mmTop = 34131
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'INV_PART_NUMBER'
        DataPipeline = ppDB134
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB134'
        mmHeight = 3969
        mmLeft = 4498
        mmTop = 2910
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'INV_NAME'
        DataPipeline = ppDB134
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppDB134'
        mmHeight = 9525
        mmLeft = 41540
        mmTop = 529
        mmWidth = 20638
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = True
        DataField = 'INV_DESCRIPTION'
        DataPipeline = ppDB134
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB134'
        mmHeight = 9525
        mmLeft = 67733
        mmTop = 529
        mmWidth = 48948
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'QUANTITY'
        DataPipeline = ppDB134
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB134'
        mmHeight = 3969
        mmLeft = 118004
        mmTop = 2910
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB134
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB134'
        mmHeight = 3969
        mmLeft = 134673
        mmTop = 2910
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'TAX_2'
        DataPipeline = ppDB134
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB134'
        mmHeight = 3969
        mmLeft = 165894
        mmTop = 2910
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB134
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB134'
        mmHeight = 3969
        mmLeft = 183357
        mmTop = 2910
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = 'price'
        DataPipeline = ppDB134
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB134'
        mmHeight = 4022
        mmLeft = 151077
        mmTop = 2910
        mmWidth = 8890
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #22791#27880':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4424
        mmLeft = 9525
        mmTop = 1058
        mmWidth = 9694
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #25910#36135#20154#31614#21517':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 149754
        mmTop = 1058
        mmWidth = 21431
        BandType = 8
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'REF_NUMBER'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 4498
        mmLeft = 19579
        mmTop = 1058
        mmWidth = 19579
        BandType = 8
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB133
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB133'
        mmHeight = 4498
        mmLeft = 172244
        mmTop = 1058
        mmWidth = 25400
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 7144
        mmLeft = 0
        mmTop = 0
        mmWidth = 203300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #37329#39069#21512#35745':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 153988
        mmTop = 1588
        mmWidth = 17463
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB134
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB134'
        mmHeight = 4424
        mmLeft = 172514
        mmTop = 1588
        mmWidth = 21421
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 0
        mmTop = 0
        mmWidth = 203300
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
    Left = 200
    Top = 136
  end
end
