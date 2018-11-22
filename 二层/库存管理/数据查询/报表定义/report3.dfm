object Frmreport3: TFrmreport3
  Left = 426
  Top = 207
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = #35013#31665#21333
  ClientHeight = 306
  ClientWidth = 235
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
    DataSet = aq0439
    Left = 64
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = aq64
    Left = 64
    Top = 61
  end
  object aq0439: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 21
      end>
    SQL.Strings = (
      'SELECT data0439.delivery_no, Data0010.CUST_CODE,'
      '      Data0010.CUSTOMER_NAME, Data0010.BILLING_ADDRESS_1,'
      '      data0010.PHONE,data0010.FAX, data0010.FED_TAX_ID_NO,'
      '      Data0005.EMPLOYEE_NAME, Data0012.LOCATION,'
      '      Data0012.SHIP_TO_ADDRESS_1, Data0002.UNIT_CODE,'
      
        '      Data0002.UNIT_NAME, Data0009.SALES_REP_NAME,data0439.remar' +
        'k_bak,'
      
        '      Data0112.invoice_number, data0439.shipping_method, data043' +
        '9.fob,'
      
        '      data0439.cartons_no, dbo.data0439.weight, data0439.net_wei' +
        'ght,'
      
        '      data0439.date_sailing, data0439.date_ent, data0439.referen' +
        'ce_number,'
      '      data0439.charge, data0439.remark, data0439.print_date,'
      
        '      data0439.fh_location, Data0012.STATE, Data0250.COUNTRY_COD' +
        'E,'
      '      Data0250.COUNTRY_NAME'
      'FROM dbo.data0439 INNER JOIN'
      
        '      dbo.Data0010 ON dbo.data0439.customer_ptr = dbo.Data0010.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0012 ON dbo.data0439.ship_addr_ptr = dbo.Data0012.' +
        'RKEY INNER JOIN'
      
        '      dbo.Data0002 ON dbo.data0439.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0005 ON dbo.data0439.employee_ptr = dbo.Data0005.R' +
        'KEY INNER JOIN'
      '      dbo.Data0009 ON '
      
        '      dbo.Data0010.SALES_REP_PTR = dbo.Data0009.RKEY LEFT OUTER ' +
        'JOIN'
      '      dbo.Data0250 ON '
      
        '      dbo.Data0012.COUNTRY_PTR = dbo.Data0250.COUNTRY_RKEY LEFT ' +
        'OUTER JOIN'
      
        '      dbo.Data0112 ON dbo.data0439.invoice_ptr = dbo.Data0112.RK' +
        'EY'
      'where data0439.rkey=:rkey'
      '')
    Left = 32
    Top = 24
    object aq0439delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object aq0439shipping_method: TStringField
      FieldName = 'shipping_method'
    end
    object aq0439fob: TStringField
      DisplayLabel = #20132#36135#31665#23610#23544
      FieldName = 'fob'
      Size = 50
    end
    object aq0439cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object aq0439weight: TFloatField
      FieldName = 'weight'
    end
    object aq0439net_weight: TFloatField
      FieldName = 'net_weight'
    end
    object aq0439date_sailing: TDateTimeField
      FieldName = 'date_sailing'
    end
    object aq0439date_ent: TDateTimeField
      FieldName = 'date_ent'
    end
    object aq0439reference_number: TStringField
      DisplayLabel = #21253#35013#31665#23610#23544
      FieldName = 'reference_number'
      Size = 50
    end
    object aq0439charge: TFloatField
      FieldName = 'charge'
    end
    object aq0439cust_code: TStringField
      FieldName = 'cust_code'
      Size = 5
    end
    object aq0439customer_name: TStringField
      FieldName = 'customer_name'
      Size = 30
    end
    object aq0439BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 70
    end
    object aq0439LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 80
    end
    object aq0439SHIP_TO_ADDRESS_1: TStringField
      FieldName = 'SHIP_TO_ADDRESS_1'
      Size = 100
    end
    object aq0439unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object aq0439unit_name: TStringField
      FieldName = 'unit_name'
    end
    object aq0439Remark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Remark'
      Size = 50
    end
    object aq0439remark_bak: TStringField
      DisplayLabel = #39069#22806#22791#27880
      FieldName = 'remark_bak'
      Size = 50
    end
    object aq0439employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object aq0439SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
    object aq0439print_date: TDateTimeField
      FieldName = 'print_date'
    end
    object aq0439invoice_number: TStringField
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 10
    end
    object aq0439fh_location: TStringField
      FieldName = 'fh_location'
      Size = 50
    end
    object aq0439STATE: TStringField
      FieldName = 'STATE'
      Size = 10
    end
    object aq0439COUNTRY_CODE: TStringField
      FieldName = 'COUNTRY_CODE'
      Size = 5
    end
    object aq0439COUNTRY_NAME: TStringField
      FieldName = 'COUNTRY_NAME'
      Size = 30
    end
    object aq0439PHONE: TStringField
      FieldName = 'PHONE'
    end
    object aq0439FAX: TStringField
      FieldName = 'FAX'
    end
    object aq0439FED_TAX_ID_NO: TStringField
      DisplayLabel = #20184#27454#26041#27861
      FieldName = 'FED_TAX_ID_NO'
    end
  end
  object aq64: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = aq64CalcFields
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 21
      end>
    SQL.Strings = (
      
        'SELECT TOP 100 PERCENT dbo.Data0064.RKEY, dbo.Data0064.SHIPMENT_' +
        'NO,'
      '      dbo.Data0064.QUAN_SHIPPED, dbo.Data0064.REMARK,'
      
        '      dbo.Data0064.QUAN_SHIPPED*dbo.Data0025.REPORT_UNIT_VALUE1 ' +
        '/ 1000 AS weight,'
      '      dbo.Data0060.SALES_ORDER, dbo.Data0060.FOB,'
      
        '      dbo.Data0060.REFERENCE_NUMBER, dbo.Data0060.TOTAL_ADD_L_PR' +
        'ICE,'
      '      Data0025.MANU_PART_DESC,'
      '      Data0025.MANU_PART_NUMBER, Data0025.ANALYSIS_CODE_1,'
      '      dbo.Data0025.ANALYSIS_CODE_2, dbo.Data0064.part_price,'
      '      dbo.Data0025.set_qty,'
      '      dbo.Data0097.PO_NUMBER,'
      '      dbo.Data0097.PO_DATE, dbo.Data0025.REPORT_UNIT_VALUE1, '
      
        '      dbo.Data0011.NOTE_PAD_LINE_1, dbo.Data0011.NOTE_PAD_LINE_2' +
        ', '
      
        '      dbo.Data0011.NOTE_PAD_LINE_3, dbo.Data0011.NOTE_PAD_LINE_4' +
        ', '
      '      dbo.Data0060.COMMISION_ON_TOOLING, dbo.Data0064.TAX_2, '
      '      dbo.Data0060.tax_in_price'
      'FROM dbo.Data0064 INNER JOIN'
      
        '      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY IN' +
        'NER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY INNER JOIN'
      '      dbo.Data0097 ON'
      
        '      dbo.Data0060.PURCHASE_ORDER_PTR = dbo.Data0097.RKEY LEFT O' +
        'UTER JOIN'
      
        '      dbo.Data0011 ON dbo.Data0064.RKEY = dbo.Data0011.FILE_POIN' +
        'TER AND'
      '      dbo.Data0011.SOURCE_TYPE = 64'
      'WHERE (dbo.Data0064.packing_list_ptr = :rkey)'
      'ORDER BY dbo.Data0025.MANU_PART_DESC, dbo.Data0097.PO_NUMBER')
    Left = 32
    Top = 61
    object aq64shipment_no: TSmallintField
      FieldName = 'shipment_no'
    end
    object aq64sales_order: TStringField
      FieldName = 'sales_order'
      FixedChar = True
      Size = 10
    end
    object aq64po_number: TStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'po_number'
      Size = 25
    end
    object aq64po_date: TDateTimeField
      DisplayLabel = #21512#21516#26085#26399
      FieldName = 'po_date'
    end
    object aq64QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object aq64NOTE_PAD_LINE_1: TStringField
      FieldName = 'NOTE_PAD_LINE_1'
      Size = 70
    end
    object aq64NOTE_PAD_LINE_2: TStringField
      FieldName = 'NOTE_PAD_LINE_2'
      Size = 70
    end
    object aq64NOTE_PAD_LINE_3: TStringField
      FieldName = 'NOTE_PAD_LINE_3'
      Size = 70
    end
    object aq64NOTE_PAD_LINE_4: TStringField
      FieldName = 'NOTE_PAD_LINE_4'
      Size = 70
    end
    object aq64fob: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'fob'
      Size = 50
    end
    object aq64analysis_code_1: TStringField
      DisplayLabel = #20132#36135#26495#23610#23544
      FieldName = 'analysis_code_1'
    end
    object aq64reference_number: TStringField
      FieldName = 'reference_number'
      FixedChar = True
      Size = 30
    end
    object aq64analysis_code_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#20195#30721
      FieldName = 'analysis_code_2'
      Size = 50
    end
    object aq64REPORT_UNIT_VALUE1: TFloatField
      FieldName = 'REPORT_UNIT_VALUE1'
    end
    object aq64weight: TFloatField
      FieldName = 'weight'
      ReadOnly = True
    end
    object aq64remark: TStringField
      FieldName = 'remark'
      Size = 50
    end
    object aq64part_price: TFloatField
      FieldName = 'part_price'
    end
    object aq64TOTAL_ADD_L_PRICE: TFloatField
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object aq64tools_taxprice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'tools_taxprice'
      Calculated = True
    end
    object aq64COMMISION_ON_TOOLING: TStringField
      FieldName = 'COMMISION_ON_TOOLING'
      FixedChar = True
      Size = 1
    end
    object aq64TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object aq64tax_in_price: TStringField
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object aq64taxprice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'taxprice'
      Calculated = True
    end
    object aq64taxamount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'taxamount'
      Calculated = True
    end
    object aq64notaxprice: TFloatField
      FieldKind = fkCalculated
      FieldName = 'notaxprice'
      Calculated = True
    end
    object aq64notaxamount: TFloatField
      FieldKind = fkCalculated
      FieldName = 'notaxamount'
      Calculated = True
    end
    object aq64MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object aq64MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object aq64set_qty: TIntegerField
      FieldName = 'set_qty'
    end
  end
  object Aq11: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 21
      end>
    SQL.Strings = (
      'select memo_text from data0011'
      'where source_type=439 and '
      '           file_pointer=:rkey')
    Left = 32
    Top = 101
    object Aq11memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
  end
  object DataSource3: TDataSource
    DataSet = Aq11
    Left = 64
    Top = 101
  end
  object ppDB64: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'DB64'
    Left = 96
    Top = 64
    MasterDataPipelineName = 'ppDB439'
    object ppDB64ppField1: TppField
      FieldAlias = #25351#27966#25209#27425
      FieldName = 'shipment_no'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField2: TppField
      FieldAlias = #38144#21806#35746#21333
      FieldName = 'sales_order'
      FieldLength = 0
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField6: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = 'po_number'
      FieldLength = 0
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField7: TppField
      FieldAlias = #21512#21516#26085#26399
      FieldName = 'po_date'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField8: TppField
      FieldAlias = #25968#37327
      FieldName = 'QUAN_SHIPPED'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField11: TppField
      FieldAlias = 'LOT#'
      FieldName = 'NOTE_PAD_LINE_1'
      FieldLength = 0
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField12: TppField
      FieldAlias = #31665#21495'C/N#'
      FieldName = 'NOTE_PAD_LINE_2'
      FieldLength = 0
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField13: TppField
      FieldAlias = #20998#26512#20195#30721'3'
      FieldName = 'NOTE_PAD_LINE_3'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField14: TppField
      FieldAlias = #20998#26512#20195#30721'4'
      FieldName = 'NOTE_PAD_LINE_4'
      FieldLength = 0
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField15: TppField
      FieldAlias = #21512#21516#21495
      FieldName = 'fob'
      FieldLength = 0
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField16: TppField
      FieldAlias = #35746#21333#21442#32771
      FieldName = 'reference_number'
      FieldLength = 0
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField17: TppField
      FieldAlias = #20132#36135#26495#23610#23544
      FieldName = 'analysis_code_1'
      FieldLength = 0
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField18: TppField
      FieldAlias = #23458#25143#29289#26009#20195#30721
      FieldName = 'analysis_code_2'
      FieldLength = 0
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB64ppField22: TppField
      FieldAlias = #21333#20301#37325#37327'g'
      FieldName = 'REPORT_UNIT_VALUE1'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDB64ppField23: TppField
      FieldAlias = #35013#36816#24635#37325'kg'
      FieldName = 'weight'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDB64ppField24: TppField
      FieldAlias = #24120#29992#22791#27880
      FieldName = 'remark'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppDB64ppField26: TppField
      FieldAlias = #24037#20855#36153#29992'('#19981#21547#31246')'
      FieldName = 'TOTAL_ADD_L_PRICE'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppDB64ppField10: TppField
      FieldAlias = #24037#20855#36153#29992'('#21547#31246')'
      FieldName = 'tools_taxprice'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppDB64ppField27: TppField
      FieldAlias = #35746#21333#36716#21378
      FieldName = 'COMMISION_ON_TOOLING'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppDB64ppField25: TppField
      FieldAlias = #31246#29575'%'
      FieldName = 'tax_2'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppDB64ppField9: TppField
      FieldAlias = #21547#31246#20215
      FieldName = 'taxprice'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppDB64ppField28: TppField
      FieldAlias = #21547#31246#37329#39069
      FieldName = 'taxamount'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppDB64ppField29: TppField
      FieldAlias = #19981#21547#31246#20215
      FieldName = 'notaxprice'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppDB64ppField30: TppField
      FieldAlias = #19981#21547#31246#37329#39069
      FieldName = 'notaxamount'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppDB64ppField3: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 10
      DisplayWidth = 10
      Position = 24
    end
    object ppDB64ppField4: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      FieldLength = 10
      DisplayWidth = 10
      Position = 25
    end
    object ppDB64ppField5: TppField
      FieldAlias = #20132#36135#21333#20803#25968
      FieldName = 'set_qty'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
  end
  object ppDB11: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB11'
    Left = 96
    Top = 101
    MasterDataPipelineName = 'ppDB439'
    object ppDB11ppField1: TppField
      FieldAlias = #35013#31665#21333#22810#39033#22791#27880
      FieldName = 'memo_text'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB64
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #36865#36135#21333
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 256
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\packlist_list_Areport.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 142
    Top = 24
    Version = '7.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB64'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object ppDBText20: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'customer_name'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 19050
        mmTop = 20638
        mmWidth = 27252
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText4'
        DataField = 'delivery_no'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 160602
        mmTop = 0
        mmWidth = 20108
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 172244
        mmTop = 15081
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label7'
        Caption = #22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 65617
        mmTop = 16140
        mmWidth = 8202
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'SHIP_TO_ADDRESS_1'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 75936
        mmTop = 16140
        mmWidth = 50006
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'PHONE'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 112977
        mmTop = 20638
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #39029#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 150548
        mmTop = 8467
        mmWidth = 7938
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 160867
        mmTop = 8202
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10319
      mmPrintPosition = 0
      object ppDBText57: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'QUAN_SHIPPED'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4163
        mmLeft = 84931
        mmTop = 3175
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'MANU_PART_DESC'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4022
        mmLeft = 63500
        mmTop = 1588
        mmWidth = 33359
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'po_number'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4304
        mmLeft = 4763
        mmTop = 2910
        mmWidth = 19191
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'weight'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4163
        mmLeft = 172067
        mmTop = 5292
        mmWidth = 10231
        BandType = 4
      end
      object ppLabel80: TppLabel
        UserName = 'Label28'
        Caption = 'Kg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 182034
        mmTop = 5556
        mmWidth = 4318
        BandType = 4
      end
      object ppDBText92: TppDBText
        UserName = 'DBText38'
        AutoSize = True
        DataField = 'remark'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4163
        mmLeft = 165100
        mmTop = 794
        mmWidth = 10936
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'DBText40'
        AutoSize = True
        DataField = 'analysis_code_2'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4304
        mmLeft = 33073
        mmTop = 5556
        mmWidth = 28152
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object ppDBText95: TppDBText
        UserName = 'DBText67'
        DataField = 'employee_name'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 17727
        mmTop = 2646
        mmWidth = 17198
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object DataSource4: TDataSource
    DataSet = DM.ADOdata0493
    Left = 64
    Top = 141
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 96
    Top = 141
    object ppDBPipeline4ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 0
    end
    object ppDBPipeline4ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline4ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline4ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDBPipeline4ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline4ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
  end
  object ppDB439: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB439'
    Left = 97
    Top = 24
    object ppDB439ppField1: TppField
      FieldAlias = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppDB439ppField2: TppField
      FieldAlias = #35013#36816#26041#27861
      FieldName = 'shipping_method'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDB439ppField3: TppField
      FieldAlias = #20132#36135#31665#23610#23544
      FieldName = 'fob'
      FieldLength = 50
      DisplayWidth = 20
      Position = 2
    end
    object ppDB439ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = #31665#25968
      FieldName = 'cartons_no'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDB439ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = #27611#37325
      FieldName = 'weight'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDB439ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #20928#37325
      FieldName = 'net_weight'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB439ppField7: TppField
      FieldAlias = #20986#36135#26085#26399
      FieldName = 'date_sailing'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object ppDB439ppField8: TppField
      FieldAlias = #24314#31435#26085#26399
      FieldName = 'date_ent'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppDB439ppField9: TppField
      FieldAlias = #21253#35013#31665#23610#23544
      FieldName = 'reference_number'
      FieldLength = 50
      DisplayWidth = 20
      Position = 8
    end
    object ppDB439ppField11: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = 'cust_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 9
    end
    object ppDB439ppField12: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = 'customer_name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object ppDB439ppField28: TppField
      FieldAlias = #23458#25143#30005#35805
      FieldName = 'PHONE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppDB439ppField29: TppField
      FieldAlias = #23458#25143#20256#30495
      FieldName = 'FAX'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object ppDB439ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = #36153#29992
      FieldName = 'charge'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDB439ppField13: TppField
      FieldAlias = #23458#25143#22320#22336
      FieldName = 'BILLING_ADDRESS_1'
      FieldLength = 70
      DisplayWidth = 70
      Position = 14
    end
    object ppDB439ppField14: TppField
      FieldAlias = #36865#36135#22320#28857
      FieldName = 'LOCATION'
      FieldLength = 80
      DisplayWidth = 20
      Position = 15
    end
    object ppDB439ppField15: TppField
      FieldAlias = #36865#36135#22320#22336
      FieldName = 'SHIP_TO_ADDRESS_1'
      FieldLength = 100
      DisplayWidth = 70
      Position = 16
    end
    object ppDB439ppField16: TppField
      FieldAlias = #21333#20301#20195#30721
      FieldName = 'unit_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 17
    end
    object ppDB439ppField17: TppField
      FieldAlias = #21333#20301#21517#31216
      FieldName = 'unit_name'
      FieldLength = 20
      DisplayWidth = 20
      Position = 18
    end
    object ppDB439ppField18: TppField
      FieldAlias = #22791#27880
      FieldName = 'Remark'
      FieldLength = 50
      DisplayWidth = 50
      Position = 19
    end
    object ppDB439ppField30: TppField
      FieldAlias = #39069#22806#22791#27880
      FieldName = 'Remark_bak'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppDB439ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'C_N'
      FieldName = 'C_N'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
    object ppDB439ppField20: TppField
      FieldAlias = #35013#36816#21592#24037
      FieldName = 'employee_name'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object ppDB439ppField21: TppField
      FieldAlias = #36865#36135#20154#21592
      FieldName = 'SALES_REP_NAME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
    object ppDB439ppField22: TppField
      FieldAlias = #21457#31080#32534#21495
      FieldName = 'invoice_number'
      FieldLength = 10
      DisplayWidth = 10
      Position = 24
    end
    object ppDB439ppField23: TppField
      FieldAlias = #35013#31665#21333#25171#21360#26085#26399
      FieldName = 'print_date'
      FieldLength = 10
      DataType = dtDate
      DisplayWidth = 10
      Position = 25
    end
    object ppDB439ppField24: TppField
      FieldAlias = #21457#36135#22320#28857
      FieldName = 'fh_location'
      FieldLength = 10
      DisplayWidth = 10
      Position = 26
    end
    object ppDB439ppField25: TppField
      FieldAlias = #30465#20221
      FieldName = 'STATE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 27
    end
    object ppDB439ppField26: TppField
      FieldAlias = #22269#23478#25110#22320#21306#20195#30721
      FieldName = 'COUNTRY_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 28
    end
    object ppDB439ppField27: TppField
      FieldAlias = #22269#23478#25110#22320#21306#21517#31216
      FieldName = 'COUNTRY_NAME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object ppDB439ppField31: TppField
      FieldAlias = #20184#27454#26041#27861
      FieldName = 'FED_TAX_ID_NO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
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
    Left = 183
    Top = 22
  end
  object ppReport3: TppReport
    AutoStop = False
    DataPipeline = ppDB64
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #36865#36135#21333
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\packlist_list_Areport2.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport3PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 142
    Top = 64
    Version = '7.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB64'
    object ppTitleBand3: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 71438
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 3175
        mmTop = 22490
        mmWidth = 189971
        BandType = 1
      end
      object ppDBImage3: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 4498
        mmTop = 7673
        mmWidth = 19000
        BandType = 1
      end
      object ppLabel50: TppLabel
        UserName = 'Label2'
        Caption = #23458#25143':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 30956
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText24: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'customer_name'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 43921
        mmTop = 30956
        mmWidth = 6138
        BandType = 1
      end
      object ppDBText25: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'cust_code'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 31750
        mmTop = 30956
        mmWidth = 5398
        BandType = 1
      end
      object ppLabel56: TppLabel
        UserName = 'Label3'
        Caption = #22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 36248
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText34: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'BILLING_ADDRESS_1'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 31485
        mmTop = 36248
        mmWidth = 7197
        BandType = 1
      end
      object ppDBText35: TppDBText
        UserName = 'DBText4'
        DataField = 'delivery_no'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 17463
        mmWidth = 20108
        BandType = 1
      end
      object ppLabel57: TppLabel
        UserName = 'Label4'
        Caption = #35013#31665#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 150019
        mmTop = 17463
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel58: TppLabel
        UserName = 'Label5'
        Caption = #25171#21360#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 150284
        mmTop = 23548
        mmWidth = 15346
        BandType = 1
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 23548
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel59: TppLabel
        UserName = 'Label6'
        Caption = #36865#36135#22320#28857':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13494
        mmTop = 55033
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText50: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'LOCATION'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 30956
        mmTop = 55033
        mmWidth = 14393
        BandType = 1
      end
      object ppLabel60: TppLabel
        UserName = 'Label7'
        Caption = #22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 20638
        mmTop = 60590
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText51: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'SHIP_TO_ADDRESS_1'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 30956
        mmTop = 60590
        mmWidth = 14393
        BandType = 1
      end
      object ppDBText52: TppDBText
        UserName = 'DBText14'
        DataField = 'date_sailing'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 143404
        mmTop = 30956
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel61: TppLabel
        UserName = 'Label1'
        Caption = #20986#36135#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 122767
        mmTop = 30956
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText53: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'unit_code'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 143669
        mmTop = 36777
        mmWidth = 5080
        BandType = 1
      end
      object ppLabel62: TppLabel
        UserName = 'Label8'
        Caption = #37325#37327#21333#20301':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 122767
        mmTop = 36777
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText77: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'unit_name'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 151871
        mmTop = 36777
        mmWidth = 7197
        BandType = 1
      end
      object ppLabel63: TppLabel
        UserName = 'Label9'
        Caption = #21512#35745#31665#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123031
        mmTop = 42598
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText78: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'cartons_no'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 143404
        mmTop = 42598
        mmWidth = 5715
        BandType = 1
      end
      object ppLabel64: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = #27611#37325':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 130969
        mmTop = 48419
        mmWidth = 7408
        BandType = 1
      end
      object ppDBText79: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'weight'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 143404
        mmTop = 48419
        mmWidth = 1905
        BandType = 1
      end
      object ppLabel65: TppLabel
        UserName = 'Label11'
        Caption = #20928#37325':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 154782
        mmTop = 48419
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText60: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'net_weight'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 166688
        mmTop = 48419
        mmWidth = 1905
        BandType = 1
      end
      object ppLabel66: TppLabel
        UserName = 'Label12'
        Caption = #35013#36816#26041#27861':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123296
        mmTop = 54769
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel67: TppLabel
        UserName = 'Label13'
        Caption = #38468#21152#21442#32771':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123296
        mmTop = 60854
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText61: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'shipping_method'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 143140
        mmTop = 54769
        mmWidth = 7197
        BandType = 1
      end
      object ppDBText62: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'reference_number'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 142875
        mmTop = 60854
        mmWidth = 27728
        BandType = 1
      end
      object ppLabel68: TppLabel
        UserName = 'Label15'
        Caption = #35013#36816#36153#29992':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123296
        mmTop = 67204
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText63: TppDBText
        UserName = 'DBText23'
        AutoSize = True
        DataField = 'charge'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 142875
        mmTop = 67204
        mmWidth = 7620
        BandType = 1
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 174361
        mmTop = 0
        mmWidth = 17463
        BandType = 1
      end
      object ppVariable3: TppVariable
        UserName = 'Variable2'
        CalcOrder = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 47890
        mmTop = 4763
        mmWidth = 91281
        BandType = 1
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDocumentName
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 87842
        mmTop = 12965
        mmWidth = 10795
        BandType = 1
      end
    end
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 7938
        mmLeft = 7144
        mmTop = 0
        mmWidth = 180711
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label16'
        Caption = #38144#21806#23450#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 10848
        mmTop = 1588
        mmWidth = 14393
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label17'
        Caption = #20135#21697#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 35983
        mmTop = 1588
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label18'
        Caption = #20135#21697#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 60590
        mmTop = 1588
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label19'
        Caption = #37319#36141#23450#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 114565
        mmTop = 1588
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label20'
        Caption = #25351#27966#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 169863
        mmTop = 1588
        mmWidth = 14393
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label21'
        Caption = #35013#36816#25209#27425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 145257
        mmTop = 1588
        mmWidth = 14393
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 32808
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 58473
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 111654
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 143669
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 164307
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppDBText65: TppDBText
        UserName = 'DBText2'
        DataField = 'sales_order'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4233
        mmLeft = 10319
        mmTop = 1000
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText3'
        DataField = 'CUSTOMER_PART_NUMBER'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4233
        mmLeft = 36513
        mmTop = 1000
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText24'
        DataField = 'po_number'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4233
        mmLeft = 114829
        mmTop = 1000
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText68: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'quantity'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4191
        mmLeft = 176637
        mmTop = 1058
        mmWidth = 7620
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'CUSTOMER_PART_DESC'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4191
        mmLeft = 60325
        mmTop = 1000
        mmWidth = 19431
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'shipment_no'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4191
        mmLeft = 149225
        mmTop = 1000
        mmWidth = 1905
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 7408
        mmTop = 6614
        mmWidth = 180446
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 7144
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine22: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 164307
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 143669
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 111654
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine25: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 58473
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine26: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 32808
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 99748
      mmPrintPosition = 0
      object ppLabel75: TppLabel
        UserName = 'Label23'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4128
        mmLeft = 9525
        mmTop = 43392
        mmWidth = 7197
        BandType = 8
      end
      object ppDBText71: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_1'
        DataPipeline = ppDB11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB11'
        mmHeight = 4128
        mmLeft = 15610
        mmTop = 48683
        mmWidth = 32385
        BandType = 8
      end
      object ppDBText72: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_2'
        DataPipeline = ppDB11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB11'
        mmHeight = 4128
        mmLeft = 15610
        mmTop = 53446
        mmWidth = 32385
        BandType = 8
      end
      object ppDBText73: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_3'
        DataPipeline = ppDB11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB11'
        mmHeight = 4128
        mmLeft = 15610
        mmTop = 58208
        mmWidth = 32385
        BandType = 8
      end
      object ppDBText74: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_4'
        DataPipeline = ppDB11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB11'
        mmHeight = 4128
        mmLeft = 15610
        mmTop = 62971
        mmWidth = 32385
        BandType = 8
      end
      object ppLabel76: TppLabel
        UserName = 'Label24'
        Caption = #23458#25143#25509#25910
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 27252
        mmTop = 6615
        mmWidth = 14288
        BandType = 8
      end
      object ppLine41: TppLine
        UserName = 'Line16'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1000
        mmLeft = 8731
        mmTop = 21696
        mmWidth = 59267
        BandType = 8
      end
      object ppLabel77: TppLabel
        UserName = 'Label25'
        Caption = #35831#31614#32626#20197#20316#20026#30830#35748#25991#20214
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 19579
        mmTop = 24606
        mmWidth = 35983
        BandType = 8
      end
      object ppLine42: TppLine
        UserName = 'Line20'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 126736
        mmTop = 21696
        mmWidth = 59267
        BandType = 8
      end
      object ppDBText94: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4128
        mmLeft = 128614
        mmTop = 7938
        mmWidth = 46778
        BandType = 8
      end
      object ppLabel78: TppLabel
        UserName = 'Label26'
        Caption = #31614#32626
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 154517
        mmTop = 24606
        mmWidth = 7197
        BandType = 8
      end
      object ppLabel79: TppLabel
        UserName = 'Label27'
        Caption = #35828#26126
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 10054
        mmTop = 73819
        mmWidth = 7197
        BandType = 8
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 
          #22914#21457#29616#36135#21697#26377#20219#20309#21697#36136#32570#38519#65292#35831#22312#33258#21457#31080#26085#26399#36215'21'#22825#20869#36890#30693#25105#20844#21496#24066#22330#37096#38376#65292#24182#25351#26126#36135#21697#32570#38519#65292#13#10#36149#20844#21496#35746#21333#21495#65292#37096#20214#21495#21644#25105#20844#21496#21457#31080#21495#65292'2' +
          '1'#22825#20043#21518#25237#35785#23558#19981#20250#34987#25509#25910#65292#22810#35874#21512#20316#13#10#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #22914#21457#29616#36135#21697#26377#20219#20309#21697#36136#32570#38519#65292#35831#22312#33258#21457#31080#26085#26399#36215'21'#22825#20869#36890#30693#25105#20844#21496#24066#22330#37096#38376#65292#24182#25351#26126#36135#21697#32570#38519#65292
          #36149#20844#21496#35746#21333#21495#65292#37096#20214#21495#21644#25105#20844#21496#21457#31080#21495#65292'21'#22825#20043#21518#25237#35785#23558#19981#20250#34987#25509#25910#65292#22810#35874#21512#20316
          '')
        Transparent = True
        mmHeight = 13758
        mmLeft = 14817
        mmTop = 80169
        mmWidth = 158221
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'quantity'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4128
        mmLeft = 168805
        mmTop = 1058
        mmWidth = 17198
        BandType = 7
      end
      object ppLine43: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 7144
        mmTop = 6820
        mmWidth = 180711
        BandType = 7
      end
      object ppLine44: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 7144
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine46: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 164307
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLabel51: TppLabel
        UserName = 'Label22'
        Caption = #21512#35745':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 153988
        mmTop = 1058
        mmWidth = 8149
        BandType = 7
      end
    end
    object raCodeModule3: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65324F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066970726F636564757265205661726961
        626C65324F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D7472696D2844423439335B27
        436F6D70616E795F4E616D65275D293B0D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D6506095661726961626C6532094576656E744E616D6506064F
        6E43616C63074576656E74494402210000}
    end
  end
  object ppReport4: TppReport
    AutoStop = False
    DataPipeline = ppDB64
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #35013#31665#21333
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 165000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 256
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\packlist_list_Areport3.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport4PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 142
    Top = 104
    Version = '7.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB64'
    object ppTitleBand4: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppDBText75: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'customer_name'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4657
        mmLeft = 23813
        mmTop = 6085
        mmWidth = 28363
        BandType = 1
      end
      object ppDBText76: TppDBText
        UserName = 'DBText5'
        DataField = 'date_sailing'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4763
        mmLeft = 155840
        mmTop = 14817
        mmWidth = 31221
        BandType = 1
      end
      object ppDBText80: TppDBText
        UserName = 'DBText7'
        DataField = 'po_number'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4657
        mmLeft = 155840
        mmTop = 6350
        mmWidth = 26988
        BandType = 1
      end
      object ppDBText81: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_1'
        DataPipeline = ppDB11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB11'
        mmHeight = 4498
        mmLeft = 31221
        mmTop = 14817
        mmWidth = 36248
        BandType = 1
      end
    end
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9525
      mmPrintPosition = 0
      object ppDBText82: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CUSTOMER_PART_DESC'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 2117
        mmWidth = 51329
        BandType = 4
      end
      object ppDBText83: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'quantity'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4763
        mmLeft = 104775
        mmTop = 2117
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel55: TppLabel
        UserName = 'Label1'
        Caption = 'PCS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 115623
        mmTop = 2117
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_1'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4586
        mmLeft = 57415
        mmTop = 2117
        mmWidth = 36266
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_2'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4586
        mmLeft = 135996
        mmTop = 2117
        mmWidth = 36266
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
  object ppReport5: TppReport
    AutoStop = False
    DataPipeline = ppDB64
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #36865#36135#21333
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 10000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\packlist_list_Areport4.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport5PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 142
    Top = 144
    Version = '7.01'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDB64'
    object ppTitleBand5: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 72496
      mmPrintPosition = 0
      object ppLine67: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 3175
        mmTop = 22490
        mmWidth = 189971
        BandType = 1
      end
      object ppDBImage5: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 4498
        mmTop = 7673
        mmWidth = 19000
        BandType = 1
      end
      object ppLabel107: TppLabel
        UserName = 'Label2'
        Caption = #23458#25143':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 30956
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText107: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'customer_name'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 43921
        mmTop = 30956
        mmWidth = 6138
        BandType = 1
      end
      object ppDBText108: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'cust_code'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 31750
        mmTop = 30956
        mmWidth = 5398
        BandType = 1
      end
      object ppLabel108: TppLabel
        UserName = 'Label3'
        Caption = #22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 21167
        mmTop = 36248
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText109: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'BILLING_ADDRESS_1'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 31485
        mmTop = 36248
        mmWidth = 7197
        BandType = 1
      end
      object ppDBText110: TppDBText
        UserName = 'DBText4'
        DataField = 'delivery_no'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 17463
        mmWidth = 20108
        BandType = 1
      end
      object ppLabel109: TppLabel
        UserName = 'Label4'
        Caption = #35013#31665#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 150019
        mmTop = 17463
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel110: TppLabel
        UserName = 'Label5'
        Caption = #25171#21360#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 150284
        mmTop = 23548
        mmWidth = 15346
        BandType = 1
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 23548
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel111: TppLabel
        UserName = 'Label6'
        Caption = #36865#36135#22320#28857':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13494
        mmTop = 55033
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText111: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'LOCATION'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 30956
        mmTop = 55033
        mmWidth = 14393
        BandType = 1
      end
      object ppLabel112: TppLabel
        UserName = 'Label7'
        Caption = #22320#22336':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 20638
        mmTop = 60590
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText112: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'SHIP_TO_ADDRESS_1'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 30956
        mmTop = 60590
        mmWidth = 14393
        BandType = 1
      end
      object ppDBText113: TppDBText
        UserName = 'DBText14'
        DataField = 'date_sailing'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4233
        mmLeft = 143404
        mmTop = 30956
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel113: TppLabel
        UserName = 'Label1'
        Caption = #20986#36135#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 122767
        mmTop = 30956
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText114: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'unit_code'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 143669
        mmTop = 36777
        mmWidth = 5080
        BandType = 1
      end
      object ppLabel114: TppLabel
        UserName = 'Label8'
        Caption = #37325#37327#21333#20301':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 122767
        mmTop = 36777
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText115: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'unit_name'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 151871
        mmTop = 36777
        mmWidth = 7197
        BandType = 1
      end
      object ppLabel115: TppLabel
        UserName = 'Label9'
        Caption = #21512#35745#31665#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123031
        mmTop = 42598
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText116: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'cartons_no'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 143404
        mmTop = 42598
        mmWidth = 5715
        BandType = 1
      end
      object ppLabel116: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = #27611#37325':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 130969
        mmTop = 48419
        mmWidth = 7408
        BandType = 1
      end
      object ppDBText117: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'weight'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 143404
        mmTop = 48419
        mmWidth = 1905
        BandType = 1
      end
      object ppLabel117: TppLabel
        UserName = 'Label11'
        Caption = #20928#37325':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 154782
        mmTop = 48419
        mmWidth = 8202
        BandType = 1
      end
      object ppDBText118: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'net_weight'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 166688
        mmTop = 48419
        mmWidth = 1905
        BandType = 1
      end
      object ppLabel118: TppLabel
        UserName = 'Label12'
        Caption = #35013#36816#26041#27861':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123296
        mmTop = 54769
        mmWidth = 15346
        BandType = 1
      end
      object ppLabel119: TppLabel
        UserName = 'Label13'
        Caption = #38468#21152#21442#32771':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123296
        mmTop = 60854
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText119: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'shipping_method'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 143140
        mmTop = 54769
        mmWidth = 7197
        BandType = 1
      end
      object ppDBText120: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'reference_number'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 142875
        mmTop = 60854
        mmWidth = 27728
        BandType = 1
      end
      object ppLabel121: TppLabel
        UserName = 'Label15'
        Caption = #35013#36816#36153#29992':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 123296
        mmTop = 66411
        mmWidth = 15346
        BandType = 1
      end
      object ppDBText122: TppDBText
        UserName = 'DBText23'
        AutoSize = True
        DataField = 'charge'
        DataPipeline = ppDB439
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 4128
        mmLeft = 142875
        mmTop = 66411
        mmWidth = 7620
        BandType = 1
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 174361
        mmTop = 0
        mmWidth = 17463
        BandType = 1
      end
      object ppVariable5: TppVariable
        UserName = 'Variable2'
        CalcOrder = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 47890
        mmTop = 4763
        mmWidth = 91281
        BandType = 1
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDocumentName
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 87842
        mmTop = 12965
        mmWidth = 10795
        BandType = 1
      end
    end
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape1'
        mmHeight = 7938
        mmLeft = 7144
        mmTop = 0
        mmWidth = 180711
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'Label16'
        Caption = #38144#21806#23450#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 10848
        mmTop = 1588
        mmWidth = 14393
        BandType = 0
      end
      object ppLabel123: TppLabel
        UserName = 'Label17'
        Caption = #23458#25143#37096#20214
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 35983
        mmTop = 1588
        mmWidth = 14393
        BandType = 0
      end
      object ppLabel124: TppLabel
        UserName = 'Label18'
        Caption = #20135#21697#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 60590
        mmTop = 1588
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel125: TppLabel
        UserName = 'Label19'
        Caption = #37319#36141#23450#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 114565
        mmTop = 1588
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel126: TppLabel
        UserName = 'Label20'
        Caption = #25351#27966#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 169863
        mmTop = 1588
        mmWidth = 14393
        BandType = 0
      end
      object ppLabel127: TppLabel
        UserName = 'Label21'
        Caption = #35013#36816#25209#27425
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 145257
        mmTop = 1588
        mmWidth = 14393
        BandType = 0
      end
      object ppLine68: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 32808
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine69: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 58473
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine70: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 111654
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine71: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 143669
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine72: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7615
        mmLeft = 164307
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppDBText123: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'sales_order'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4191
        mmLeft = 9525
        mmTop = 1000
        mmWidth = 18288
        BandType = 4
      end
      object ppDBText124: TppDBText
        UserName = 'DBText3'
        DataField = 'CUSTOMER_PART_NUMBER'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4233
        mmLeft = 36513
        mmTop = 1000
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText125: TppDBText
        UserName = 'DBText24'
        DataField = 'fob'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4233
        mmLeft = 114829
        mmTop = 1000
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText126: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'quantity'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4191
        mmLeft = 176637
        mmTop = 1058
        mmWidth = 7620
        BandType = 4
      end
      object ppDBText127: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'CUSTOMER_PART_DESC'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4191
        mmLeft = 60325
        mmTop = 1000
        mmWidth = 19431
        BandType = 4
      end
      object ppDBText128: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'shipment_no'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4233
        mmLeft = 149225
        mmTop = 1058
        mmWidth = 11377
        BandType = 4
      end
      object ppLine73: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 7408
        mmTop = 6614
        mmWidth = 180446
        BandType = 4
      end
      object ppLine74: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 7144
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine75: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 187590
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine76: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 164307
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine77: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 143669
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine78: TppLine
        UserName = 'Line7'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 111654
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine79: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 58473
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine80: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 32808
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 99748
      mmPrintPosition = 0
      object ppLabel128: TppLabel
        UserName = 'Label23'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4128
        mmLeft = 9525
        mmTop = 43392
        mmWidth = 7197
        BandType = 8
      end
      object ppDBText129: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_1'
        DataPipeline = ppDB11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB11'
        mmHeight = 4128
        mmLeft = 15610
        mmTop = 48683
        mmWidth = 32385
        BandType = 8
      end
      object ppDBText130: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_2'
        DataPipeline = ppDB11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB11'
        mmHeight = 4128
        mmLeft = 15610
        mmTop = 53446
        mmWidth = 32385
        BandType = 8
      end
      object ppDBText131: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_3'
        DataPipeline = ppDB11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB11'
        mmHeight = 4128
        mmLeft = 15610
        mmTop = 58208
        mmWidth = 32385
        BandType = 8
      end
      object ppDBText132: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_4'
        DataPipeline = ppDB11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB11'
        mmHeight = 4128
        mmLeft = 15610
        mmTop = 62971
        mmWidth = 32385
        BandType = 8
      end
      object ppLabel129: TppLabel
        UserName = 'Label24'
        Caption = #23458#25143#25509#25910
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 27252
        mmTop = 6615
        mmWidth = 14288
        BandType = 8
      end
      object ppLine81: TppLine
        UserName = 'Line16'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1000
        mmLeft = 8731
        mmTop = 21696
        mmWidth = 59267
        BandType = 8
      end
      object ppLabel130: TppLabel
        UserName = 'Label25'
        Caption = #35831#31614#32626#20197#20316#20026#30830#35748#25991#20214
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 19579
        mmTop = 24606
        mmWidth = 35983
        BandType = 8
      end
      object ppLine82: TppLine
        UserName = 'Line20'
        Pen.Style = psDot
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 126736
        mmTop = 21696
        mmWidth = 59267
        BandType = 8
      end
      object ppDBText133: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4128
        mmLeft = 128614
        mmTop = 7938
        mmWidth = 46778
        BandType = 8
      end
      object ppLabel131: TppLabel
        UserName = 'Label26'
        Caption = #31614#32626
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 154517
        mmTop = 24606
        mmWidth = 7197
        BandType = 8
      end
      object ppLabel132: TppLabel
        UserName = 'Label27'
        Caption = #35828#26126
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 10054
        mmTop = 73819
        mmWidth = 7197
        BandType = 8
      end
      object ppMemo4: TppMemo
        UserName = 'Memo1'
        Caption = 
          #22914#21457#29616#36135#21697#26377#20219#20309#21697#36136#32570#38519#65292#35831#22312#33258#21457#31080#26085#26399#36215'21'#22825#20869#36890#30693#25105#20844#21496#24066#22330#37096#38376#65292#24182#25351#26126#36135#21697#32570#38519#65292#13#10#36149#20844#21496#35746#21333#21495#65292#37096#20214#21495#21644#25105#20844#21496#21457#31080#21495#65292'2' +
          '1'#22825#20043#21518#25237#35785#23558#19981#20250#34987#25509#25910#65292#22810#35874#21512#20316#13#10#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          #22914#21457#29616#36135#21697#26377#20219#20309#21697#36136#32570#38519#65292#35831#22312#33258#21457#31080#26085#26399#36215'21'#22825#20869#36890#30693#25105#20844#21496#24066#22330#37096#38376#65292#24182#25351#26126#36135#21697#32570#38519#65292
          #36149#20844#21496#35746#21333#21495#65292#37096#20214#21495#21644#25105#20844#21496#21457#31080#21495#65292'21'#22825#20043#21518#25237#35785#23558#19981#20250#34987#25509#25910#65292#22810#35874#21512#20316
          '')
        Transparent = True
        mmHeight = 13758
        mmLeft = 14817
        mmTop = 80169
        mmWidth = 158221
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'quantity'
        DataPipeline = ppDB64
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB64'
        mmHeight = 4128
        mmLeft = 168805
        mmTop = 1058
        mmWidth = 17198
        BandType = 7
      end
      object ppLine83: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 7144
        mmTop = 6820
        mmWidth = 180711
        BandType = 7
      end
      object ppLine84: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 7144
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine85: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 187590
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine86: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6820
        mmLeft = 164307
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLabel133: TppLabel
        UserName = 'Label22'
        Caption = #21512#35745':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 153988
        mmTop = 1058
        mmWidth = 8149
        BandType = 7
      end
    end
    object raCodeModule5: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65324F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066970726F636564757265205661726961
        626C65324F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D7472696D2844423439335B27
        436F6D70616E795F4E616D65275D293B0D0A0D0A656E643B0D0A0D436F6D706F
        6E656E744E616D6506095661726961626C6532094576656E744E616D6506064F
        6E43616C63074576656E74494402210000}
    end
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
    Left = 184
    Top = 64
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
    Left = 184
    Top = 104
  end
  object ppDesigner5: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport5
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 184
    Top = 144
  end
  object ADO1011: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'customer_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select memo_text from data0011'
      'where source_type=2010 and '
      '           file_pointer=:customer_ptr'
      '')
    Left = 32
    Top = 176
    object ADO1011memo_text: TMemoField
      FieldName = 'memo_text'
      BlobType = ftMemo
    end
  end
  object DataSource7: TDataSource
    DataSet = ADO1011
    Left = 64
    Top = 176
  end
  object ppDB1011: TppDBPipeline
    DataSource = DataSource7
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB1011'
    Left = 96
    Top = 176
    object ppDB1011ppField1: TppField
      FieldAlias = #23458#25143#21457#31080#35760#20107#26412
      FieldName = 'memo_text'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
end
