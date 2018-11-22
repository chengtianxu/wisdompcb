object Form_report: TForm_report
  Left = 326
  Top = 192
  BorderStyle = bsSingle
  Caption = #20837#24211#21333#25253#34920
  ClientHeight = 223
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = Aqwz456
    Left = 96
    Top = 71
  end
  object DataSource2: TDataSource
    DataSet = Aqwz22
    Left = 96
    Top = 103
  end
  object Aqwz456: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = Aqwz456CalcFields
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
      'SELECT dbo.Data0456.RKEY, dbo.Data0456.GRN_NUMBER, '
      '      dbo.Data0456.DELIVER_NUMBER,'
      '      Data0023.CODE,Data0023.SUPPLIER_NAME, Data0023.ABBR_NAME,'
      
        '      dbo.Data0456.ship_DATE, dbo.Data0456.STATUS, dbo.Data0456.' +
        'TTYPE,'
      '      dbo.Data0456.REF_NUMBER, dbo.Data0070.PO_NUMBER,'
      '      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0005.EMPL_CODE,'
      '      dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME, '
      
        '      dbo.Data0456.ship_BY, dbo.Data0001.CURR_CODE, dbo.Data0001' +
        '.CURR_NAME, '
      '      dbo.Data0070.EXCHANGE_RATE,'
      '      dbo.Data0034.DEPT_NAME,Data0456.PRINTED'
      'FROM dbo.Data0001 INNER JOIN'
      '      dbo.Data0070 ON '
      
        '      dbo.Data0001.RKEY = dbo.Data0070.CURRENCY_PTR RIGHT OUTER ' +
        'JOIN'
      '      dbo.Data0456 INNER JOIN'
      '      Data0023 ON Data0456.SUPP_PTR = Data0023.RKEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.Data0456.CREATE_BY = dbo.Data0005.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY ON '
      '      dbo.Data0070.RKEY = dbo.Data0456.PO_PTR LEFT OUTER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0070.PO_REV_NO = dbo.Data0034.DEPT' +
        '_CODE'
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
    object Aqwz456EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object Aqwz456DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz456PRINTED: TStringField
      FieldName = 'PRINTED'
      FixedChar = True
      Size = 1
    end
  end
  object Aqwz22: TADOQuery
    Connection = dm.ADOConnection1
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
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '
      '      dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, '
      '      Data0022.QUANTITY,Data0002.UNIT_NAME,'
      '      dbo.Data0022.BARCODE_ID, dbo.Data0022.EXPIRE_DATE, '
      '      Data0022.PRICE, dbo.Data0022.TAX_2,Data0022.EXCHANGE_RATE,'
      '      Data0001.CURR_CODE, Data0001.CURR_NAME,'
      '      Data0022.QUANTITY*Data0022.PRICE as amount'
      'FROM dbo.Data0022 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0001 ON dbo.Data0022.CURRENCY_PTR = dbo.Data0001.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0016.R' +
        'KEY'
      'where Data0022.grn_ptr=:rkey')
    Left = 64
    Top = 103
    object Aqwz22INV_PART_NUMBER: TStringField
      DisplayLabel = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object Aqwz22INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object Aqwz22INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object Aqwz22LOCATION: TStringField
      DisplayLabel = #23384#20179#20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object Aqwz22QUANTITY: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUANTITY'
      Precision = 9
      Size = 3
    end
    object Aqwz22UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object Aqwz22BARCODE_ID: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object Aqwz22EXPIRE_DATE: TDateTimeField
      DisplayLabel = #26377#25928#26399
      FieldName = 'EXPIRE_DATE'
    end
    object Aqwz22PRICE: TBCDField
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object Aqwz22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object Aqwz22EXCHANGE_RATE: TBCDField
      FieldName = 'EXCHANGE_RATE'
      Precision = 12
      Size = 8
    end
    object Aqwz22CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqwz22CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqwz22amount: TBCDField
      FieldName = 'amount'
      ReadOnly = True
      Precision = 19
      Size = 6
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
  end
  object ppDB22: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB22'
    Left = 128
    Top = 104
    object ppDB22ppField1: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField2: TppField
      FieldAlias = 'INV_NAME'
      FieldName = 'INV_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField3: TppField
      FieldAlias = 'INV_DESCRIPTION'
      FieldName = 'INV_DESCRIPTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField4: TppField
      FieldAlias = 'LOCATION'
      FieldName = 'LOCATION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField5: TppField
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField6: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField7: TppField
      FieldAlias = 'BARCODE_ID'
      FieldName = 'BARCODE_ID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField8: TppField
      FieldAlias = 'EXPIRE_DATE'
      FieldName = 'EXPIRE_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField11: TppField
      FieldAlias = 'PRICE'
      FieldName = 'PRICE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField12: TppField
      FieldAlias = 'TAX_2'
      FieldName = 'TAX_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField13: TppField
      FieldAlias = 'EXCHANGE_RATE'
      FieldName = 'EXCHANGE_RATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField14: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField15: TppField
      FieldAlias = 'CURR_NAME'
      FieldName = 'CURR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB22ppField9: TppField
      FieldAlias = 'amount'
      FieldName = 'amount'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB22
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
    Template.FileName = 'R:\NIERP\Report\invt_entrance.rtm'
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
    Left = 168
    Top = 104
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB22'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 9260
        mmLeft = 4763
        mmTop = 30163
        mmWidth = 186267
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'WAREHOUSE_NAME'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3979
        mmLeft = 83084
        mmTop = 2381
        mmWidth = 17187
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #20837#20179#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 85990
        mmTop = 9525
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 14552
        mmTop = 16669
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CODE'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3979
        mmLeft = 26723
        mmTop = 16669
        mmWidth = 17187
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'SUPPLIER_NAME'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3979
        mmLeft = 44979
        mmTop = 16669
        mmWidth = 17187
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'GRN_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3979
        mmLeft = 128588
        mmTop = 16140
        mmWidth = 17187
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #20837#20179#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 112184
        mmTop = 16140
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #36865#36135#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68792
        mmTop = 22754
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DELIVER_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3969
        mmLeft = 85461
        mmTop = 22754
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #37319#36141#35746#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 7144
        mmTop = 22225
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3979
        mmLeft = 26988
        mmTop = 22490
        mmWidth = 17187
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #26448#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 32808
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #26448#26009#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 59531
        mmTop = 32808
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20837#20179#20301#32622
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 94986
        mmTop = 33073
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116681
        mmTop = 32808
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 131498
        mmTop = 32808
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #20215#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146315
        mmTop = 32808
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #36135#24065
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 160867
        mmTop = 32808
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #36865#36135#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 111919
        mmTop = 23019
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'ship_DATE'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3979
        mmLeft = 128588
        mmTop = 23283
        mmWidth = 17187
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #37329#39069
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 176213
        mmTop = 33073
        mmWidth = 7112
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 43127
        mmTop = 30163
        mmWidth = 265
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 91017
        mmTop = 30163
        mmWidth = 265
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 111654
        mmTop = 30163
        mmWidth = 265
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 128588
        mmTop = 30163
        mmWidth = 265
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 142346
        mmTop = 30163
        mmWidth = 265
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 158221
        mmTop = 30163
        mmWidth = 265
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9260
        mmLeft = 173302
        mmTop = 30163
        mmWidth = 265
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 4498
        mmTop = 0
        mmWidth = 186532
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'INV_NAME'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3969
        mmLeft = 10054
        mmTop = 2910
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'LOCATION'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3969
        mmLeft = 94721
        mmTop = 2646
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'PRICE'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3969
        mmLeft = 145786
        mmTop = 2646
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'QUANTITY'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3969
        mmLeft = 113771
        mmTop = 2910
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3969
        mmLeft = 127000
        mmTop = 2910
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CURR_NAME'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3969
        mmLeft = 157427
        mmTop = 2646
        mmWidth = 17198
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 4498
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 43127
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 91017
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 111654
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 128588
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 142346
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 158486
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 173302
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 9790
        mmLeft = 190765
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'amount'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 3969
        mmLeft = 171980
        mmTop = 2646
        mmWidth = 17198
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'INV_DESCRIPTION'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4498
        mmLeft = 43921
        mmTop = 2381
        mmWidth = 46038
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #25910#36135#20154#21592
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 7144
        mmTop = 12171
        mmWidth = 14288
        BandType = 8
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3979
        mmLeft = 23283
        mmTop = 11906
        mmWidth = 17187
        BandType = 8
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'REF_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3979
        mmLeft = 60325
        mmTop = 12435
        mmWidth = 17187
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 51065
        mmTop = 12435
        mmWidth = 7144
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB22'
        mmHeight = 4064
        mmLeft = 167746
        mmTop = 2117
        mmWidth = 21590
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #37329#39069#21512#35745
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4064
        mmLeft = 150877
        mmTop = 2117
        mmWidth = 14224
        BandType = 7
      end
    end
  end
end
