object Form15: TForm15
  Left = 526
  Top = 206
  Width = 306
  Height = 399
  Caption = #33258#23450#20041#26434#39033#37319#36141#25253#34920'('#22269#20869')'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppDB0070: TppDBPipeline
    DataSource = DM.DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB0070'
    Left = 128
    Top = 110
    object ppDB0070ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 0
      Position = 0
    end
    object ppDB0070ppField2: TppField
      FieldAlias = 'po_number'
      FieldName = 'po_number'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppDB0070ppField3: TppField
      FieldAlias = 'PO_REV_NO'
      FieldName = 'PO_REV_NO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object ppDB0070ppField4: TppField
      FieldAlias = 'po_date'
      FieldName = 'po_date'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppDB0070ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'status'
      FieldName = 'status'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDB0070ppField6: TppField
      FieldAlias = 'PO_TYPE'
      FieldName = 'PO_TYPE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object ppDB0070ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PURCHASE_ORDER_TYPE'
      FieldName = 'PURCHASE_ORDER_TYPE'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 6
    end
    object ppDB0070ppField8: TppField
      FieldAlias = 'empl_code'
      FieldName = 'empl_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 7
    end
    object ppDB0070ppField9: TppField
      FieldAlias = 'employee_name'
      FieldName = 'employee_name'
      FieldLength = 16
      DisplayWidth = 16
      Position = 8
    end
    object ppDB0070ppField10: TppField
      FieldAlias = 'code'
      FieldName = 'code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 9
    end
    object ppDB0070ppField11: TppField
      FieldAlias = 'supplier_name'
      FieldName = 'supplier_name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object ppDB0070ppField12: TppField
      FieldAlias = 'v_status'
      FieldName = 'v_status'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object ppDB0070ppField13: TppField
      FieldAlias = 'v_type'
      FieldName = 'v_type'
      FieldLength = 4
      DisplayWidth = 4
      Position = 12
    end
    object ppDB0070ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'shipping_cost'
      FieldName = 'shipping_cost'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDB0070ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'MISC_CHARGE'
      FieldName = 'MISC_CHARGE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDB0070ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUPP_FAC_ADD_PTR'
      FieldName = 'SUPP_FAC_ADD_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
    object ppDB0070ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAYMENT_TERMS'
      FieldName = 'PAYMENT_TERMS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object ppDB0070ppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'sub_total'
      FieldName = 'sub_total'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppDB0070ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'EXCHANGE_RATE'
      FieldName = 'EXCHANGE_RATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppDB0070ppField20: TppField
      FieldAlias = 'fob'
      FieldName = 'fob'
      FieldLength = 15
      DisplayWidth = 15
      Position = 19
    end
    object ppDB0070ppField21: TppField
      FieldAlias = 'phone'
      FieldName = 'phone'
      FieldLength = 10
      DisplayWidth = 10
      Position = 20
    end
    object ppDB0070ppField22: TppField
      FieldAlias = 'fax'
      FieldName = 'fax'
      FieldLength = 10
      DisplayWidth = 10
      Position = 21
    end
  end
  object DataSource2: TDataSource
    DataSet = DM.AQ0493
    Left = 97
    Top = 235
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 128
    Top = 235
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
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
  object ppDB70: TppDBPipeline
    DataSource = DM.DataSource2
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB70'
    Left = 128
    Top = 80
    object ppDB70ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 0
    end
    object ppDB70ppField2: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppDB70ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CSI_USER_POINTER'
      FieldName = 'CSI_USER_POINTER'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDB70ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMPLOYEE_POINTER'
      FieldName = 'EMPLOYEE_POINTER'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDB70ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUPPLIER_POINTER'
      FieldName = 'SUPPLIER_POINTER'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDB70ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUPP_FAC_ADD_PTR'
      FieldName = 'SUPP_FAC_ADD_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDB70ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'WAREHOUSE_POINTER'
      FieldName = 'WAREHOUSE_POINTER'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDB70ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'EDIT_BY_EMPL_PTR'
      FieldName = 'EDIT_BY_EMPL_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDB70ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 8
    end
    object ppDB70ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'EXCHANGE_RATE'
      FieldName = 'EXCHANGE_RATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDB70ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SHIPPING_COST'
      FieldName = 'SHIPPING_COST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDB70ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'FEDERAL_TAX'
      FieldName = 'FEDERAL_TAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppDB70ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'STATE_TAX'
      FieldName = 'STATE_TAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDB70ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUB_TOTAL'
      FieldName = 'SUB_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDB70ppField15: TppField
      FieldAlias = 'CONFIRMATION_NUMBER'
      FieldName = 'CONFIRMATION_NUMBER'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object ppDB70ppField16: TppField
      FieldAlias = #35013#36816#26041#27861
      FieldName = 'SHIPPING_METHOD'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object ppDB70ppField17: TppField
      FieldAlias = 'PO_DATE'
      FieldName = 'PO_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object ppDB70ppField18: TppField
      FieldAlias = 'SUPPIER_CONTACT'
      FieldName = 'SUPPIER_CONTACT'
      FieldLength = 20
      DisplayWidth = 20
      Position = 17
    end
    object ppDB70ppField19: TppField
      FieldAlias = 'CONTACT_PHONE'
      FieldName = 'CONTACT_PHONE'
      FieldLength = 14
      DisplayWidth = 14
      Position = 18
    end
    object ppDB70ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DISCOUNT_AMOUNT'
      FieldName = 'DISCOUNT_AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppDB70ppField21: TppField
      FieldAlias = 'DATE_EDITED'
      FieldName = 'DATE_EDITED'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 20
    end
    object ppDB70ppField22: TppField
      FieldAlias = 'PO_TYPE'
      FieldName = 'PO_TYPE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 21
    end
    object ppDB70ppField23: TppField
      FieldAlias = #35831#36141#21333#21495
      FieldName = 'FOB'
      FieldLength = 15
      DisplayWidth = 15
      Position = 22
    end
    object ppDB70ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'MISC_CHARGE'
      FieldName = 'MISC_CHARGE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppDB70ppField25: TppField
      FieldAlias = 'PRINT_DATE'
      FieldName = 'PRINT_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 24
    end
    object ppDB70ppField26: TppField
      FieldAlias = 'PRINT_TIME'
      FieldName = 'PRINT_TIME'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 25
    end
    object ppDB70ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'MULTIPLE_FACTOR'
      FieldName = 'MULTIPLE_FACTOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppDB70ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'CITY_AMOUNT'
      FieldName = 'CITY_AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppDB70ppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'COUNTY_AMOUNT'
      FieldName = 'COUNTY_AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppDB70ppField30: TppField
      FieldAlias = 'COLLECT_PREPAID'
      FieldName = 'COLLECT_PREPAID'
      FieldLength = 1
      DisplayWidth = 1
      Position = 29
    end
    object ppDB70ppField31: TppField
      FieldAlias = 'STATE_SHIP_TAX_FLAG'
      FieldName = 'STATE_SHIP_TAX_FLAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 30
    end
    object ppDB70ppField32: TppField
      FieldAlias = 'STATE_MISC_TAX_FLAG'
      FieldName = 'STATE_MISC_TAX_FLAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 31
    end
    object ppDB70ppField33: TppField
      FieldAlias = 'STATE_INVT_TAX_FLAG'
      FieldName = 'STATE_INVT_TAX_FLAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 32
    end
    object ppDB70ppField34: TppField
      Alignment = taRightJustify
      FieldAlias = 'CURRENCY_PTR'
      FieldName = 'CURRENCY_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 33
    end
    object ppDB70ppField35: TppField
      Alignment = taRightJustify
      FieldAlias = 'SECOND_WHSE_PTR'
      FieldName = 'SECOND_WHSE_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 34
    end
    object ppDB70ppField36: TppField
      FieldAlias = 'PO_REV_NO'
      FieldName = 'PO_REV_NO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 35
    end
    object ppDB70ppField37: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAYMENT_TERMS'
      FieldName = 'PAYMENT_TERMS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 36
    end
    object ppDB70ppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'CASH_DISCOUNT'
      FieldName = 'CASH_DISCOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 37
    end
    object ppDB70ppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'DISCOUNT_DAYS'
      FieldName = 'DISCOUNT_DAYS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 38
    end
    object ppDB70ppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'CASH_DISCOUNT2'
      FieldName = 'CASH_DISCOUNT2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object ppDB70ppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'DISCOUNT2_DAYS'
      FieldName = 'DISCOUNT2_DAYS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 40
    end
    object ppDB70ppField42: TppField
      Alignment = taRightJustify
      FieldAlias = 'PURCHASE_ORDER_TYPE'
      FieldName = 'PURCHASE_ORDER_TYPE'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 41
    end
    object ppDB70ppField43: TppField
      FieldAlias = 'EXPIRED_DATE'
      FieldName = 'EXPIRED_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 42
    end
    object ppDB70ppField44: TppField
      FieldAlias = 'ANALYSIS_CODE_1'
      FieldName = 'ANALYSIS_CODE_1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 43
    end
    object ppDB70ppField45: TppField
      FieldAlias = 'ANALYSIS_CODE_2'
      FieldName = 'ANALYSIS_CODE_2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 44
    end
    object ppDB70ppField46: TppField
      FieldAlias = 'ANALYSIS_CODE_3'
      FieldName = 'ANALYSIS_CODE_3'
      FieldLength = 20
      DisplayWidth = 20
      Position = 45
    end
    object ppDB70ppField47: TppField
      FieldAlias = 'ANALYSIS_CODE_4'
      FieldName = 'ANALYSIS_CODE_4'
      FieldLength = 20
      DisplayWidth = 20
      Position = 46
    end
    object ppDB70ppField48: TppField
      FieldAlias = #20184#27454#26041#27861
      FieldName = 'ANALYSIS_CODE_5'
      FieldLength = 20
      DisplayWidth = 20
      Position = 47
    end
    object ppDB70ppField53: TppField
      FieldAlias = #36865#36135#22320#22336
      FieldName = 'SHIPTO_ADDRESS'
      FieldLength = 10
      DisplayWidth = 10
      Position = 48
    end
    object ppDB70ppField49: TppField
      FieldAlias = #36135#24065#20195#30721
      FieldName = 'curr_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 49
    end
    object ppDB70ppField50: TppField
      FieldAlias = #36135#24065#21517#31216
      FieldName = 'curr_name'
      FieldLength = 20
      DisplayWidth = 20
      Position = 50
    end
    object ppDB70ppField51: TppField
      FieldAlias = #35013#36816#22320#22336
      FieldName = 'factory_location'
      FieldLength = 20
      DisplayWidth = 20
      Position = 51
    end
    object ppDB70ppField52: TppField
      Alignment = taRightJustify
      FieldAlias = 'shipping_lead_time'
      FieldName = 'shipping_lead_time'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 52
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.ADO107011
    Left = 97
    Top = 171
  end
  object ppDB7011: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB7011'
    Left = 128
    Top = 171
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB72
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #26434#39033#37319#36141#35746#21333
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\misc_purchorder.rtm'
    Units = utMillimeters
    BeforePrint = ppReport1BeforePrint
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
    Left = 165
    Top = 139
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB72'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 50800
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 5292
        mmLeft = 7408
        mmTop = 45508
        mmWidth = 266701
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #29289#21697#21697#31216
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 25400
        mmTop = 46567
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #21040#36135#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 178065
        mmTop = 46567
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #25968#37327
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 214842
        mmTop = 46567
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #21333#20215
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 233892
        mmTop = 46567
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #37329#39069
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 257969
        mmTop = 46567
        mmWidth = 6350
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 59796
        mmTop = 45508
        mmWidth = 265
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 208227
        mmTop = 45508
        mmWidth = 265
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 226219
        mmTop = 45508
        mmWidth = 265
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 246857
        mmTop = 45508
        mmWidth = 265
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 192617
        mmTop = 45508
        mmWidth = 265
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = #21333#20301
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 195792
        mmTop = 46567
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #39033#30446
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 10054
        mmTop = 46567
        mmWidth = 6350
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 20108
        mmTop = 45773
        mmWidth = 265
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 174361
        mmTop = 45773
        mmWidth = 265
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = #29289#21697#35268#26684
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 73290
        mmTop = 46567
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'warehouse_name'
        DataPipeline = ppDB15
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB15'
        mmHeight = 7673
        mmLeft = 35719
        mmTop = 1058
        mmWidth = 42598
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 19050
        mmLeft = 3704
        mmTop = 1588
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #20379#24212#21830#21517#31216':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 6879
        mmTop = 24077
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #32852'    '#31995'   '#20154':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 29104
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #22320'           '#22336':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 33867
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20132#36135#22320#28857':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 33867
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #35013#36816#26041#27861':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 39158
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #30005#35805'  / '#20256#30495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 39158
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #35746#21333#32534#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 24077
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #35746#21333#26085#26399':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 24077
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #36135#24065#31181#31867':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 33867
        mmWidth = 13494
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'supplier_name'
        DataPipeline = ppDB0070
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB0070'
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 24077
        mmWidth = 17463
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'SUPPIER_CONTACT'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 29104
        mmWidth = 27517
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CONTACT_PHONE'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 38894
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'SHIPPING_METHOD'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3704
        mmLeft = 137319
        mmTop = 39158
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Label5'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 33867
        mmWidth = 8202
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'ADDRESS_LINE_3'
        DataPipeline = ppDB15
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB15'
        mmHeight = 3704
        mmLeft = 137319
        mmTop = 33867
        mmWidth = 24871
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 24077
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'PO_DATE'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3704
        mmLeft = 137054
        mmTop = 24077
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'curr_name'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3704
        mmLeft = 186002
        mmTop = 33867
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = 'address_line_2'
        DataPipeline = ppDB15
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB15'
        mmHeight = 4233
        mmLeft = 35983
        mmTop = 8996
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = #22320#22336':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35983
        mmTop = 13758
        mmWidth = 7938
        BandType = 0
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = 'address_line_1'
        DataPipeline = ppDB15
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB15'
        mmHeight = 4233
        mmLeft = 45773
        mmTop = 13758
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = #30005#35805':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35983
        mmTop = 18521
        mmWidth = 7938
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'phone'
        DataPipeline = ppDB15
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB15'
        mmHeight = 4233
        mmLeft = 45773
        mmTop = 18521
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = #20256#30495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 78052
        mmTop = 18785
        mmWidth = 7938
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'fax'
        DataPipeline = ppDB15
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB15'
        mmHeight = 4233
        mmLeft = 88106
        mmTop = 18785
        mmWidth = 4233
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'PURCHASING ORDER'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = []
        Transparent = True
        mmHeight = 6879
        mmLeft = 168805
        mmTop = 1588
        mmWidth = 53181
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = #37319'     '#36141'     '#35746'    '#21333
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 20
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 8467
        mmLeft = 169069
        mmTop = 8731
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = #35746#21333#21046#20316':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 29104
        mmWidth = 13494
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'employee_name'
        DataPipeline = ppDB0070
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB0070'
        mmHeight = 3704
        mmLeft = 137319
        mmTop = 29104
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = #20184#27454#26465#20214':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 39158
        mmWidth = 13494
        BandType = 0
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'ANALYSIS_CODE_5'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3704
        mmLeft = 186002
        mmTop = 39158
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = #39029'        '#30721':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 29104
        mmWidth = 14023
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageNo
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 191294
        mmTop = 29104
        mmWidth = 1588
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageCount
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 203200
        mmTop = 29104
        mmWidth = 1588
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = #31532
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 186267
        mmTop = 29104
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = #39029','#20849
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 194998
        mmTop = 29104
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = #39029
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 207698
        mmTop = 29104
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = #31080#25454#31181#31867':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 220398
        mmTop = 33867
        mmWidth = 13494
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        AutoSize = True
        DataField = 'ANALYSIS_CODE_4'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3704
        mmLeft = 235215
        mmTop = 33867
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #20184#27454#22320#28857':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 220134
        mmTop = 39158
        mmWidth = 13494
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'ANALYSIS_CODE_3'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3704
        mmLeft = 235215
        mmTop = 39158
        mmWidth = 27252
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 7408
        mmTop = 0
        mmWidth = 266436
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'DEL_DATE'
        DataPipeline = ppDB72
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB72'
        mmHeight = 3810
        mmLeft = 175948
        mmTop = 1058
        mmWidth = 15169
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'QUAN_ORD'
        DataPipeline = ppDB72
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB72'
        mmHeight = 3810
        mmLeft = 209021
        mmTop = 1217
        mmWidth = 16157
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'UNIT_PRICE'
        DataPipeline = ppDB72
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB72'
        mmHeight = 3810
        mmLeft = 229394
        mmTop = 1058
        mmWidth = 17004
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'sim_total'
        DataPipeline = ppDB72
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB72'
        mmHeight = 3810
        mmLeft = 259821
        mmTop = 1058
        mmWidth = 11148
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 7408
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 59796
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 208227
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 226219
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 246857
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 273844
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataPipeline = ppDB72
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppDB72'
        mmHeight = 3810
        mmLeft = 9260
        mmTop = 1058
        mmWidth = 10054
        BandType = 4
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 192617
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'unit_name'
        DataPipeline = ppDB72
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB72'
        mmHeight = 3810
        mmLeft = 194205
        mmTop = 1058
        mmWidth = 12629
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 174361
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 20108
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'GUI_GE'
        DataPipeline = ppDB72
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB72'
        mmHeight = 3969
        mmLeft = 62177
        mmTop = 1058
        mmWidth = 108215
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'DESCRIPTION'
        DataPipeline = ppDB72
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB72'
        mmHeight = 3704
        mmLeft = 21431
        mmTop = 1058
        mmWidth = 37042
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          '1'#65294#26412#20844#21496#20005#31105#36159#36162#34892#20026#65292#19968#32463#21457#29616#26412#26412#20844#21496#23558#25298#20184#36135#27454#12290
          '2'#65294#27492#35746#21333#32463#20379#26041#30830#35748#21518#65292#24517#39035#20005#23432#20132#36135#26399#65292#22914#26377#29305#29305#27530#24773#20917#26080#27861#25353#26102#20132#36135#65292#24517#39035#20110#20132#26399#21069#20004#26085#32852#32476#26412#20844#21496#37319#36141#37096#20197#21327#21830#12290
          '3'#65294#35831#30830#20445#20135#21697#21697#36136#65292#33509#21457#29983#21697#36136#19981#33391#29616#35937#65292#24517#39035#20110#19968#20010#24037#20316#26085#20869#26356#25442#19981#33391#21697#65292#21542#21017#19968#20999#21518#26524#30001#20379#26041#25215#25285#12290
          '4'#65294#20110#36865#36135#21333#19978#24517#39035#27880#26126#26412#20844#21496#29289#21697#21517#31216#65292#25968#37327#65292#21333#20215#65292#24635#20215#20197#21450'PO'#21333#21495#12290
          '5'#65294#19968#24352#36865#36135#21333#21482#38480#24320#19968#24352'PO'#20043#29289#26009#12290
          '6'#65294#22914#36865#36135#21333#20013#26377#20551#36135#65292#26412#20844#21496#26377#26435#27809#25910#20551#36135#24182#25298#20184#26412#21333#36135#27454#12290)
        Transparent = True
        mmHeight = 19050
        mmLeft = 69850
        mmTop = 7673
        mmWidth = 153459
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = #27880#24847#20107#39033':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 61093
        mmTop = 4233
        mmWidth = 13547
        BandType = 8
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        AutoSize = False
        Caption = 
          #27880#26126#65306#20026#20102#30830#20445#21508#20379#24212#21830#30340#21033#30410#65292#22914#26377#26412#20844#21496#32844#21592#21521' '#21496#32034#21462#20219#20309#21033#30410#65292#35831#30452#25320#20030#25253#28909#32447#65306' 13602252358'#21608#29983#65292'136003399' +
          '67'#25140#29983#27965#12290'('#25910#21040#27492#21333#21518#65292#35831#20110#19968#20010#24037#20316#26085#20869#21153#24517#31614#22238') '
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 12435
        mmTop = 35190
        mmWidth = 221192
        BandType = 8
      end
      object ppLine29: TppLine
        UserName = 'Line21'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 6615
        mmTop = 39158
        mmWidth = 266171
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Print Date:'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 234421
        mmTop = 35190
        mmWidth = 11571
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPrintDateTime
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 248444
        mmTop = 35190
        mmWidth = 20743
        BandType = 8
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        AutoSize = True
        DataField = 'WAREHOUSE_NAME'
        DataPipeline = ppDB15
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB15'
        mmHeight = 3387
        mmLeft = 7408
        mmTop = 5027
        mmWidth = 25682
        BandType = 8
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #25480#26435#20154#31614#32626' '#21457#20986#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 13758
        mmTop = 28575
        mmWidth = 26106
        BandType = 8
      end
      object ppLine32: TppLine
        UserName = 'Line26'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 6615
        mmTop = 27781
        mmWidth = 47890
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #20379#24212#21830#31614#31456#20316#23454#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3387
        mmLeft = 235744
        mmTop = 26723
        mmWidth = 25400
        BandType = 8
      end
      object ppLine33: TppLine
        UserName = 'Line33'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 226484
        mmTop = 25929
        mmWidth = 44450
        BandType = 8
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          07544269746D617062140000424D621400000000000036040000280000005A00
          00002D00000001000800000000002C1000000000000000000000000100000000
          000000000000F7F7F700A5A5A500666666003A3A3A00DEDEDE00212121008484
          8400C5C5C500101010005252520099999900B5B5B50073737300EFEFEF003333
          3300D6D6D6004A4A4A00FFFFFF0008080800E6E6E60019191900BDBDBD005A5A
          5A008C8C8C00CCCCCC0042424200292929007A7A7A00ADADAD00666666009999
          9900FCB4CF00020A7700800000000012FA000000000001E60000E0001B000012
          F800DF395F009A887700050065000000000000000000396F00007877DF000013
          01001301780000000000000000000000000013064000032F0000F077FA000012
          F800000018009A88000005006500000000000000000001E6000078001B000013
          0100130178000178000078001300001301000000050000000000E6000000001B
          010000000000F95400002400120000000000F829C00000007700480013000013
          0D0000002400683800002C0013000012F90000020000FAE80000A700120077FB
          9D00F82A0800FFFF7700F8FFFF000012FA00FCB1BE000D487700000013000000
          00000000000073A80000000048000000000012F9A000000000003300000077F8
          29001300000035D00000000017000000000012F97C0006880000300013000012
          FA00FB9DA70029507700FF77F800FFFFFF0012FA4000B6DE0000D877FC000013
          07001735D80035EC0000D8001700001735000000010000010000170000000000
          000000002E000000000006020800000000004A004800336800000A00170077F8
          3A00FCF1900039EF7700F877F800001363001363D80035EC0000000017000000
          000000000000FA380000A700120077FB9D00F83AB000FFFF770048FFFF000012
          FA00130000000007000000000000001735001735D80000010000010000000013
          6300FCF01000F9B07700800012000012FA0012FA80009DA700009077FB0077F8
          2600FFFFFF00FA90FF002B00120077E6C5001300000000000000010000000000
          0000DF5D3000000077000100000000000000FDE0000033C07F00000017000000
          00001735D800000000002C0000000000010012FA540000000000B00000000012
          FF00E6615B00C5487700FF77E600FFFFFF00F82690004DDC7700D80043000017
          35001300000000000000200000000000000014DA9000CAB2AD000001C300D09B
          F60000002400830000001FFC630001C2A7000000000003D20000060000000000
          000015B570006D630000386369000013680000012000B9000000200040000007
          030007032000FB340000A700120077FB9D00F8268000FFFF770044FFFF000012
          FB00E665D600000077000800130000140000000118005D3000000077DF000000
          00000000000000000000000000000000000044C0C40068590000F40013000015
          BF0013685D0073CD0000FF004800FFFFFF0013683800C12E0000590044000013
          6800121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121200001212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212120000121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212000012121212121212121212
          1212121212121212120112121212121212010512121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          121212121212121212121212121212120000121212121212121212011C070B0C
          0E1212120C1A18011212121205030603081212121212190307051212190B0B0C
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212121212121200001212121212121212120700000015170E1212
          11000003121212120E110000131710121212140F000312121800001B10121212
          1212121212121212121212121212121212121212121212121212121212121212
          12121212121212120000121212121212121212170015000F0C080E1408110000
          0712121201191A0603041B0305121208091A010E191C00090D05121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121200001212121212121212120B00070D0B05190E121205151B0A070E12
          1212100405140B0F1A0E12011A130D0E12191A00150B1205171C051212121212
          1212121212121212121212141014121212121212121212121212121212121212
          00001212121212121212120E15171212141D0E1212120B15071C07051212120A
          031212140D0D10121800000312120C0F1106160E0F000F071412121212121212
          1212121212120C0F061116121212121212121212121212121212121200001212
          1212121212121212071319121205071012121207000D16171912120B00191212
          120B060B160915150212120C020A1C0E16070A09060A16141212121212121212
          120D131315000916121212121212121212121212121212120000121212121212
          12121212011504011212190A030E1201030910020F1C0E0E0903121212010A00
          03060402180E12121D17051008080D021C0306060D080E121212121407000602
          0502090914121212121212121212121212121212000012121212121212121212
          1207000D1212120B000414120E15060502001B19030914121212051C0000130C
          1212011214040212120C00030E120C0409130F0D0B1D0D06001A161212121600
          17121212121212121212121212121212000012121212121212121212120E0400
          101212121613040E1202131A12190F151A00181212121212071A09060112140C
          12180905121403000B1212011018150000000000170501121212121C000C1212
          121212121212121212121212000012121212121212121212121219091A011212
          12101B04051216000712140D040903121212121212140200031205041C1D1B03
          121212110F12121212120E161807070C14121212121212120A1B011212121212
          12121212121212120000121212120E0A0A0A1107021D1911000A141212121904
          1B020102040C12120110051212011212121212030002120C060D17000C121214
          1601121212121212121212121212121212121212100018121212121212121212
          121212120000121212121000000000001313060900000418020C101D04001A08
          0B1712121212121212121212121212011A09050B000000000610010112121212
          1212121212121212121212121212121212170914121212121212121212121212
          000012121212010315131300000000091513000000000013090000090F091708
          100C100E011014121014120E1800170B1515041B001511171D140E0E12121212
          1212121212121212121212121208000B12121212121212121212121200001212
          1212121210020B070B0B0B0C0C1D0F00110D030D171A0F06130000001300091B
          04151B11060F0D0A0F06000D021C08080B1A0000091A1A04030D181802081010
          14140E01010101010E0E041A1212121212121212121212120000121212121212
          121212011212121212121600170E121212011010081C1500001B150913000000
          0000000000001300111504111A0F00000000000000000000000009091B060F0F
          1A040A1111170F00071608140E12121212121212000012121212121212121212
          121212121212121C06030112121212121212081A1701141016180B1D02021818
          1C18080300000004170A04030A0D03170A111A04171106060609000000000000
          000000000000131B040D07081212121200001212121212121212121212121212
          121212120C000B12121212121212120105121212121212121212121212121212
          1800001612120E0E0E1212121201140512011414141016160C180D11170A1709
          0609130000000009051212120000121212121212121212121212121212121212
          1204150E12121212121212121212121212121212121212121212121212030002
          1212121212121212121212121212121212121212121201010114140D020B020A
          0609001A0E1212120000121212121212121212121212121212121212120C0017
          121212121212121212121212121212121212121212121212120B001C12121212
          12121212121212121212121212121212121212121212120E0112121008070714
          12121212000012121212121212121212121212121212121212121D0918121212
          12120112121212121212121212121212121212121208130A1212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          0000121212121212121212121212121212121212121212170014121212121212
          1212121212121212121212121212121212121C11160E12121212121212121212
          1212121212121212121212121212121212121212121212121212121200001212
          121212121212121212121212121212121212120C000812121212121212121212
          1212121212121212121212121212100311021212121212121212121212121212
          1212121212121212121212121212121212121212121212120000121212121212
          121212121212121212121212121212121D0E1212121212121212121212121212
          12121212121212121212120E0307121212121212121212121212121212121212
          1212121212121212121212121212121212121212000012121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212141412121212121212121212121212121212121212121212
          1212121212121212121212121212121200001212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212120000121212121212121212121212121212121212
          1212121212121201121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212000012121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121200001212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          0000121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121200001212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212120000121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212000012121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121200001212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212120000121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212000012121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121200001212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          0000121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121200001212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212120000121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212000012121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121200001212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212121212121212
          1212121212121212121212120000}
        mmHeight = 11377
        mmLeft = 7938
        mmTop = 14817
        mmWidth = 22754
        BandType = 8
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Picture.Data = {
          07544269746D617062140000424D621400000000000036040000280000005A00
          00002D00000001000800000000002C1000000000000000000000000100000000
          000000000000FFFFFF00B6B6B6007373730042424200E6E6E600292929009999
          990019191900D6D6D6005A5A5A00CCCCCC008484840010101000F7F7F700A5A5
          A5005151510033333300BDBDBD00080808006666660021212100EFEFEF008B8B
          8B00DFDFDF004A4A4A00ADADAD003A3A3A007A7A7A00C5C5C500999999006666
          6600FCB4CF00020A7700800000000012FA000000000001E60000E0001B000012
          F800DF395F009AB07700050065000000000000000000396F00007877DF000013
          01001301780000000000000000000000000013064000032F0000F077FA000012
          F800000018009AB0000005006500000000000000000001E60000C0001B000040
          B800DF3974004A7E7700BE77DF00000903000000050000000000E6000000001B
          010000000000F95400002400120000000000F829C00000007700480013000013
          0D0000002400683800002C0013000012F90000020000FAE80000A700120077FB
          9D00F82A0800FFFF7700F8FFFF000012FA00FCB1BE000D487700000013000000
          00000000000073A80000000048000000000012F9A000000000003300000077F8
          29001300000035380000000017000000000012F97C0006880000300013000012
          FA00FB9DA70029507700FF77F800FFFFFF0012FA4000B6DE0000D877FC000013
          0700173540003554000040001700001735000000010000010000170000000000
          000000002E0000000000060208000000000044004200CE8000000A00150077F8
          3A00FCF1900039EF7700F877F800001363001363D80035540000000017000000
          000000000000FA380000A700120077FB9D00F83AB000FFFF770048FFFF000012
          FA00130000000007000000000000001735001735400000010000010000000013
          6300FCF01000F9B07700800012000012FA0012FA80009DA700009077FB0077F8
          2600FFFFFF00FA90FF002B00120077E6C5001300000000000000010000000000
          0000DF5D3000000077000100000000000000FDE0000033287F00000017000000
          000017354000000000002C0000000000010012FA540000000000B00000000012
          FF00E6615B00C5487700FF77E600FFFFFF00F82690004DDC7700400043000017
          350013000000000000002000000000000000F7D20000CAB2AC000001C300CD05
          960000002400B00000001FFD940001C2A7000000000002D20000060000000000
          000015B530006174000038656C000013680000012000B9190000FE0040000004
          03000403FE00FB340000A700120077FB9D00F8268000FFFF770044FFFF000012
          FB00E665D600000077000800130000140000000118005D3000000077DF000000
          00000000000000000000000000000000000044C0C40068560000B40013000015
          BF0013685A0073CA0000FF004800FFFFFF0013683800C12E0000560044000013
          6800010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010100000101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010000010101010101
          010E050909050E01010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          010101010101010101010101010101010101010100000101010101011A110806
          0611040A140C1216010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101010101010101000001010101010F15060A1A090B1A07
          1C0415110A1A1601010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101010100000101010E070D0612050101010101160B170A
          1B08061914020E01010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010000010101070D0409010101010101010101010E16090710
          1113111A05010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          010101010000010101140D1D01010101010101010101010101010101161A1015
          1111170101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0000010101191B0E01010101010101010101010101010101010101121C041519
          0718010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010100000101
          180814010101010101010101010101010101010101010101011609171B0D1912
          0916010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010000010112130701
          0101010101010101010101010101010101010101010101010E02190000151801
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101010101010101010101010000010109081A0101010101
          01010101010101010101010101010101010101010101010B1100101801010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101010101010101000001010E0607010101010101010101
          010101010101010101010101010101010101010E1904131510170B180E010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010000010101110C01010101010101010101010101
          0101010101010101010101010101011A1509100A14130D0D060C0E0101010E09
          121A12090E010101010101010101010101010101010101010101010101010101
          010101010101010100000101010A040E01010101010101010101010101010101
          0101010101010101010101101501070A010C131100001B0707141B0808151515
          110A170901010101010101010101010101010101010101010101010101010101
          0101010100000101010C001A0101010101010101010101010101010101010101
          01010101010101060A0109110B0C06181B00000000141209051616180719080D
          191A050101010101010101010101010101010101010101010101010101010101
          00000101011A0007010101010101010101010101010101010101010101010101
          010118130C010E14080D060C08100600000A0E010101010101010B17040D1514
          0B01010101010101010101010101010101010101010101010101010100000101
          0105061401010101010101010101010101010101010101010101010101011A00
          0F01011A080000081A0116140000060201010101010101010109030813031601
          0101010101010101010101010101010101010101010101010000010101011715
          16010101010101010101010101010101010101010101010101010C0002010109
          0D0D1705010101010F0800001C0E01010101010101010116070D150201010101
          0101010101010101010101010101010101010101000001010101091307010101
          010101010101010101010101010101010101010101010A130B011206150B0101
          0101010101180A0000170101010101010101010101050A0D0A0B010101010101
          010101010101010101010101010101010000010101010E061101010101010101
          01010101010101010101010101010101010E06060B0A00101601010101010101
          010101091709010101010101010101010101010F06131C050101010101010101
          0101010101010101010101010000010101010107131201010101010101010101
          0101010101010101010101010109001110000C01010101010101010101010101
          01010101010101010101010101010101050C0D15070E01010101010101010101
          010101010101010100000101010101011B0A0101010101010101010101010101
          010101010101010101160400000F010101010101010101010101010101010101
          01010101010101010101010101011814131B020E010101010101010101010101
          0101010100000101010101011215090101010101010101010101010101010101
          01010101010E14001A0101010101010101010101010101010101010101010101
          0101010101010101010101010B190D040F160101010101010101010101010101
          0000010101010101010A03010101010101010101010101010101010101010101
          0E0A000701010101010101010101010101010101010101010101010101010101
          010101010101010101010211001B1A1601010101010101010101010100000101
          010101010109081A010101010101010101010101010101010101011619000701
          0101010101010101010101010101010101010101010101010101010101010101
          010101010101010E1A1B00060705010101010101010116160000010101010101
          01010F0D1D0101010101010101010101010101010101051B0D02010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010E0F040013101A180101180714031800000101010101010101010A
          0805010101010101010101010101010101181B0D120101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010E0B1711000D041C030D001C010000010101010101010101161B040E01
          0101010101010101010101011A08061A0E010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010907141B08061716010000010101010101010101011815030101010101
          0101010101010E1C130A18010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010E0909010101000001010101010101010101011D06030501010101010101
          010B040D0F010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010100000101010101010101010101010F0D150709050505091D1400131D
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          00000101010101010101010101010102040D000D0D000013060A020101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010100000101
          01010101010101010101010101120310190A031A0E0101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010000010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101000001010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010100000101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010000010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101000001010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010100000101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0000010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010100000101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010000010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101000001010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010100000101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010000}
        mmHeight = 11642
        mmLeft = 30163
        mmTop = 14817
        mmWidth = 24871
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = #22823#20889#37329#39069':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 60166
        mmTop = 20638
        mmWidth = 13547
        BandType = 7
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = #23567#35745':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 237279
        mmTop = 794
        mmWidth = 7197
        BandType = 7
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = #26434#39033#36153#29992':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 231193
        mmTop = 6085
        mmWidth = 13547
        BandType = 7
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = #36816#36755#36153#29992':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 231193
        mmTop = 11377
        mmWidth = 13547
        BandType = 7
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = #24635#35745':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 237279
        mmTop = 22754
        mmWidth = 7197
        BandType = 7
      end
      object ppLine17: TppLine
        UserName = 'Line12'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 7408
        mmTop = 4763
        mmWidth = 266701
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 28046
        mmLeft = 7408
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 7408
        mmTop = 27781
        mmWidth = 266701
        BandType = 7
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 28046
        mmLeft = 273844
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLine21: TppLine
        UserName = 'Line18'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 28046
        mmLeft = 246857
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        AutoSize = True
        DataField = 'sim_total'
        DataPipeline = ppDB72
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB72'
        mmHeight = 3810
        mmLeft = 252307
        mmTop = 794
        mmWidth = 18627
        BandType = 7
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'MISC_CHARGE'
        DataPipeline = ppDB70
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3810
        mmLeft = 253736
        mmTop = 6085
        mmWidth = 17198
        BandType = 7
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'SHIPPING_COST'
        DataPipeline = ppDB70
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3810
        mmLeft = 253736
        mmTop = 11377
        mmWidth = 17198
        BandType = 7
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'SUB_TOTAL'
        DataPipeline = ppDB70
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3810
        mmLeft = 253295
        mmTop = 22754
        mmWidth = 17639
        BandType = 7
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 3457
        mmLeft = 85725
        mmTop = 19315
        mmWidth = 10019
        BandType = 7
      end
      object ppLine30: TppLine
        UserName = 'Line30'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 7408
        mmTop = 15610
        mmWidth = 266701
        BandType = 7
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'FOB'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3810
        mmLeft = 25400
        mmTop = 16140
        mmWidth = 5786
        BandType = 7
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = #35831#36141#32534#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 10583
        mmTop = 16140
        mmWidth = 13547
        BandType = 7
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'PO_REV_NO'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3810
        mmLeft = 25400
        mmTop = 24077
        mmWidth = 16933
        BandType = 7
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = #35831#36141#37096#38376':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 10583
        mmTop = 24077
        mmWidth = 13547
        BandType = 7
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'curr_code'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3810
        mmLeft = 73272
        mmTop = 20638
        mmWidth = 11924
        BandType = 7
      end
      object ppLine31: TppLine
        UserName = 'Line31'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 28046
        mmLeft = 226219
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = #22791#27880':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 15081
        mmTop = 6615
        mmWidth = 7197
        BandType = 7
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_1'
        DataPipeline = ppDB7011
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB7011'
        mmHeight = 3810
        mmLeft = 25400
        mmTop = 6615
        mmWidth = 26529
        BandType = 7
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'NOTE_PAD_LINE_2'
        DataPipeline = ppDB7011
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB7011'
        mmHeight = 3810
        mmLeft = 25400
        mmTop = 11113
        mmWidth = 26529
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #29289#26009#31867#22411':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3810
        mmLeft = 10583
        mmTop = 20108
        mmWidth = 13547
        BandType = 7
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'ANALYSIS_CODE_2'
        DataPipeline = ppDB70
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB70'
        mmHeight = 3810
        mmLeft = 25400
        mmTop = 20108
        mmWidth = 27164
        BandType = 7
      end
    end
  end
  object ppDB72: TppDBPipeline
    DataSource = DM.DataSource4
    OpenDataSource = False
    UserName = 'DB72'
    Left = 128
    Top = 140
    object ppDB72ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 0
      Position = 0
    end
    object ppDB72ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'POPTR'
      FieldName = 'POPTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 1
    end
    object ppDB72ppField3: TppField
      FieldAlias = 'DESCRIPTION'
      FieldName = 'DESCRIPTION'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDB72ppField4: TppField
      FieldAlias = 'GUI_GE'
      FieldName = 'GUI_GE'
      FieldLength = 200
      DisplayWidth = 200
      Position = 3
    end
    object ppDB72ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUAN_ORD'
      FieldName = 'QUAN_ORD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppDB72ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUAN_INVD'
      FieldName = 'QUAN_INVD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB72ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNIT_PRICE'
      FieldName = 'UNIT_PRICE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDB72ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'STATE_TAX'
      FieldName = 'STATE_TAX'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDB72ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'GL_PTR'
      FieldName = 'GL_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDB72ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTITY_RECEIVED'
      FieldName = 'QUANTITY_RECEIVED'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppDB72ppField11: TppField
      FieldAlias = 'DESCRIPTION2'
      FieldName = 'DESCRIPTION2'
      FieldLength = 40
      DisplayWidth = 40
      Position = 10
    end
    object ppDB72ppField12: TppField
      FieldAlias = 'DEL_DATE'
      FieldName = 'DEL_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppDB72ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNIT_PTR'
      FieldName = 'UNIT_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 12
    end
    object ppDB72ppField14: TppField
      FieldAlias = 'PRINTED_DATE'
      FieldName = 'PRINTED_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object ppDB72ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'sim_total'
      FieldName = 'sim_total'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppDB72ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'tax_total'
      FieldName = 'tax_total'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppDB72ppField17: TppField
      FieldAlias = 'unit_name'
      FieldName = 'unit_name'
      FieldLength = 20
      DisplayWidth = 20
      Position = 16
    end
  end
  object DataSource3: TDataSource
    DataSet = DM.AQ0015
    Left = 96
    Top = 268
  end
  object ppDB15: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB15'
    Left = 128
    Top = 268
    object ppDB15ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDB15ppField2: TppField
      FieldAlias = 'WAREHOUSE_CODE'
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 1
    end
    object ppDB15ppField3: TppField
      FieldAlias = 'WAREHOUSE_NAME'
      FieldName = 'WAREHOUSE_NAME'
      FieldLength = 70
      DisplayWidth = 70
      Position = 2
    end
    object ppDB15ppField4: TppField
      FieldAlias = 'ENG_NAME'
      FieldName = 'ENG_NAME'
      FieldLength = 70
      DisplayWidth = 70
      Position = 3
    end
    object ppDB15ppField5: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppDB15ppField6: TppField
      FieldAlias = 'ADDRESS_LINE_1'
      FieldName = 'ADDRESS_LINE_1'
      FieldLength = 70
      DisplayWidth = 70
      Position = 5
    end
    object ppDB15ppField7: TppField
      FieldAlias = 'ADDRESS_LINE_2'
      FieldName = 'ADDRESS_LINE_2'
      FieldLength = 70
      DisplayWidth = 70
      Position = 6
    end
    object ppDB15ppField8: TppField
      FieldAlias = 'ADDRESS_LINE_3'
      FieldName = 'ADDRESS_LINE_3'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDB15ppField9: TppField
      FieldAlias = 'STATE'
      FieldName = 'STATE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDB15ppField10: TppField
      FieldAlias = 'ZIP'
      FieldName = 'ZIP'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppDB15ppField11: TppField
      FieldAlias = 'PHONE'
      FieldName = 'PHONE'
      FieldLength = 14
      DisplayWidth = 14
      Position = 10
    end
    object ppDB15ppField12: TppField
      FieldAlias = 'FAX'
      FieldName = 'FAX'
      FieldLength = 14
      DisplayWidth = 14
      Position = 11
    end
    object ppDB15ppField13: TppField
      FieldAlias = 'TELEX'
      FieldName = 'TELEX'
      FieldLength = 30
      DisplayWidth = 30
      Position = 12
    end
    object ppDB15ppField14: TppField
      FieldAlias = 'WEB'
      FieldName = 'WEB'
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object ppDB15ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMPLOYEE_PTR_1'
      FieldName = 'EMPLOYEE_PTR_1'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppDB15ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMPLOYEE_PTR_2'
      FieldName = 'EMPLOYEE_PTR_2'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 15
    end
    object ppDB15ppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'EMPLOYEE_PTR_3'
      FieldName = 'EMPLOYEE_PTR_3'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 16
    end
    object ppDB15ppField19: TppField
      FieldAlias = 'o_warehouse_name'
      FieldName = 'o_warehouse_name'
      FieldLength = 70
      DisplayWidth = 70
      Position = 17
    end
    object ppDB15ppField20: TppField
      FieldAlias = 'o_eng_name'
      FieldName = 'o_eng_name'
      FieldLength = 70
      DisplayWidth = 70
      Position = 18
    end
    object ppDB15ppField21: TppField
      FieldAlias = 'o_address_1'
      FieldName = 'o_address_1'
      FieldLength = 70
      DisplayWidth = 70
      Position = 19
    end
    object ppDB15ppField22: TppField
      FieldAlias = 'o_address_2'
      FieldName = 'o_address_2'
      FieldLength = 80
      DisplayWidth = 80
      Position = 20
    end
    object ppDB15ppField23: TppField
      FieldAlias = 'o_address_3'
      FieldName = 'o_address_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 21
    end
    object ppDB15ppField24: TppField
      FieldAlias = 'o_state'
      FieldName = 'o_state'
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object ppDB15ppField25: TppField
      FieldAlias = 'o_zip'
      FieldName = 'o_zip'
      FieldLength = 10
      DisplayWidth = 10
      Position = 23
    end
    object ppDB15ppField26: TppField
      FieldAlias = 'o_phone'
      FieldName = 'o_phone'
      FieldLength = 14
      DisplayWidth = 14
      Position = 24
    end
    object ppDB15ppField27: TppField
      FieldAlias = 'o_fax'
      FieldName = 'o_fax'
      FieldLength = 14
      DisplayWidth = 14
      Position = 25
    end
    object ppDB15ppField28: TppField
      FieldAlias = 'o_telex'
      FieldName = 'o_telex'
      FieldLength = 30
      DisplayWidth = 30
      Position = 26
    end
    object ppDB15ppField29: TppField
      FieldAlias = 'o_web'
      FieldName = 'o_web'
      FieldLength = 50
      DisplayWidth = 50
      Position = 27
    end
    object ppDB15ppField30: TppField
      FieldAlias = 'purchase_order'
      FieldName = 'purchase_order'
      FieldLength = 15
      DisplayWidth = 15
      Position = 28
    end
    object ppDB15ppField31: TppField
      FieldAlias = 'o_purchase_order'
      FieldName = 'o_purchase_order'
      FieldLength = 15
      DisplayWidth = 15
      Position = 29
    end
    object ppDB15ppField32: TppField
      FieldAlias = 'picture'
      FieldName = 'picture'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDB15ppField33: TppField
      FieldAlias = 'o_picture'
      FieldName = 'o_picture'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 31
      Searchable = False
      Sortable = False
    end
  end
  object DataSource4: TDataSource
    DataSet = DM.ADO7011
    Left = 98
    Top = 203
  end
  object ppDB11: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB11'
    Left = 128
    Top = 203
    object ppDB11ppField1: TppField
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB11ppField2: TppField
      FieldAlias = 'FILE_POINTER'
      FieldName = 'FILE_POINTER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB11ppField3: TppField
      FieldAlias = 'SOURCE_TYPE'
      FieldName = 'SOURCE_TYPE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB11ppField4: TppField
      FieldAlias = 'NOTE_PAD_LINE_1'
      FieldName = 'NOTE_PAD_LINE_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB11ppField5: TppField
      FieldAlias = 'NOTE_PAD_LINE_2'
      FieldName = 'NOTE_PAD_LINE_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB11ppField6: TppField
      FieldAlias = 'NOTE_PAD_LINE_3'
      FieldName = 'NOTE_PAD_LINE_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB11ppField7: TppField
      FieldAlias = 'NOTE_PAD_LINE_4'
      FieldName = 'NOTE_PAD_LINE_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB11ppField8: TppField
      FieldAlias = 'memo_text'
      FieldName = 'memo_text'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
  object DataSource5: TDataSource
    DataSet = DM.ADO0450
    Left = 96
    Top = 311
  end
  object DB207011: TppDBPipeline
    DataSource = DataSource5
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB207011'
    Left = 128
    Top = 311
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'FILE_POINTER'
      FieldName = 'FILE_POINTER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'SOURCE_TYPE'
      FieldName = 'SOURCE_TYPE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'NOTE_PAD_LINE_1'
      FieldName = 'NOTE_PAD_LINE_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'NOTE_PAD_LINE_2'
      FieldName = 'NOTE_PAD_LINE_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'NOTE_PAD_LINE_3'
      FieldName = 'NOTE_PAD_LINE_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'NOTE_PAD_LINE_4'
      FieldName = 'NOTE_PAD_LINE_4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'memo_text'
      FieldName = 'memo_text'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
end
