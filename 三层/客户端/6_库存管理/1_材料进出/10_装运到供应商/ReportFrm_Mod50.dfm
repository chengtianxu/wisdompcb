object FrmReport_Mod50: TFrmReport_Mod50
  Left = 0
  Top = 0
  Caption = 'FrmReport_Mod50'
  ClientHeight = 225
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cds22: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAME, '#13#10'      db' +
      'o.Data0023.CONTACT_NAME_1, dbo.Data0023.BILLING_ADDRESS_1, '#13#10'   ' +
      '   dbo.Data0456.ship_DATE, Data0022.tax_PRICE as price, Data0015' +
      '.WAREHOUSE_CODE, '#13#10'      dbo.Data0015.WAREHOUSE_NAME, Data0022.Q' +
      'UAN_TO_BE_SHIPPED, '#13#10'      dbo.Data0022.QUAN_RETURNED, dbo.Data0' +
      '022.BARCODE_ID, '#13#10'      dbo.Data0001.CURR_NAME, dbo.Data0022.QUA' +
      'NTITY, dbo.Data0023.PHONE, '#13#10'      dbo.Data0023.FAX, dbo.Data001' +
      '6.CODE AS loca_code, dbo.Data0016.LOCATION, '#13#10'      dbo.Data0456' +
      '.GRN_NUMBER, dbo.Data0022.RKEY, dbo.Data0022.TAX_2, '#13#10'      ROUN' +
      'D(dbo.Data0022.PRICE, 2) AS tax_price, '#13#10'      dbo.Data0456.TTYP' +
      'E,dbo.Data0096.SHIPPING_METHOD,dbo.Data0096.reference_number as ' +
      #22791#27880#20449#24687'  '#13#10'FROM dbo.Data0022 INNER JOIN'#13#10'      dbo.Data0096 ON dbo.' +
      'Data0022.rkey=dbo.Data0096.inv_tran_ptr INNER JOIN'#13#10'      dbo.Da' +
      'ta0017 ON dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER J' +
      'OIN'#13#10'      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR = dbo.Data0' +
      '016.RKEY INNER JOIN'#13#10'      dbo.Data0456 ON dbo.Data0022.GRN_PTR ' +
      '= dbo.Data0456.RKEY INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Data04' +
      '56.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data0015 O' +
      'N dbo.Data0456.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'   ' +
      '   dbo.Data0001 ON dbo.Data0456.currency_ptr = dbo.Data0001.RKEY' +
      #13#10'where   1=1'#13#10
    Params = <>
    Left = 200
    Top = 48
    object cds22CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object cds22SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object cds22CONTACT_NAME_1: TStringField
      FieldName = 'CONTACT_NAME_1'
    end
    object cds22BILLING_ADDRESS_1: TStringField
      FieldName = 'BILLING_ADDRESS_1'
      Size = 100
    end
    object cds22ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object cds22price: TBCDField
      FieldName = 'price'
      Precision = 13
    end
    object cds22WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object cds22WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object cds22QUAN_TO_BE_SHIPPED: TFMTBCDField
      FieldName = 'QUAN_TO_BE_SHIPPED'
      Precision = 18
      Size = 6
    end
    object cds22QUAN_RETURNED: TFMTBCDField
      FieldName = 'QUAN_RETURNED'
      Precision = 18
      Size = 6
    end
    object cds22BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object cds22CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object cds22QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object cds22PHONE: TStringField
      FieldName = 'PHONE'
    end
    object cds22FAX: TStringField
      FieldName = 'FAX'
    end
    object cds22loca_code: TStringField
      FieldName = 'loca_code'
      Size = 10
    end
    object cds22LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object cds22GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object cds22RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cds22TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object cds22tax_price: TFMTBCDField
      FieldName = 'tax_price'
      ReadOnly = True
      Precision = 15
      Size = 6
    end
    object cds22TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object cds22SHIPPING_METHOD: TWideStringField
      FieldName = 'SHIPPING_METHOD'
    end
    object cds22备注信息: TStringField
      FieldName = #22791#27880#20449#24687
      FixedChar = True
    end
  end
  object cds493: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'#13#10
    Params = <>
    Left = 208
    Top = 152
    object cds493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object cds493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object cds493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object cds493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object cds493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object cds493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object cds493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object cds493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object cds493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object frxdbdtst22: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODE=CODE'
      'SUPPLIER_NAME=SUPPLIER_NAME'
      'CONTACT_NAME_1=CONTACT_NAME_1'
      'BILLING_ADDRESS_1=BILLING_ADDRESS_1'
      'ship_DATE=ship_DATE'
      'price=price'
      'WAREHOUSE_CODE=WAREHOUSE_CODE'
      'WAREHOUSE_NAME=WAREHOUSE_NAME'
      'QUAN_TO_BE_SHIPPED=QUAN_TO_BE_SHIPPED'
      'QUAN_RETURNED=QUAN_RETURNED'
      'BARCODE_ID=BARCODE_ID'
      'CURR_NAME=CURR_NAME'
      'QUANTITY=QUANTITY'
      'PHONE=PHONE'
      'FAX=FAX'
      'loca_code=loca_code'
      'LOCATION=LOCATION'
      'GRN_NUMBER=GRN_NUMBER'
      'RKEY=RKEY'
      'TAX_2=TAX_2'
      'tax_price=tax_price'
      'TTYPE=TTYPE'
      'SHIPPING_METHOD=SHIPPING_METHOD'
      #22791#27880#20449#24687'='#22791#27880#20449#24687)
    DataSet = cds22
    BCDToCurrency = False
    Left = 299
    Top = 40
  end
  object frxdbdtst493: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Company_Name=Company_Name'
      'Company_Name2=Company_Name2'
      'Company_Name3=Company_Name3'
      'ship_address=ship_address'
      'Company_Icon=Company_Icon'
      'SITE_INFO_ADD_1=SITE_INFO_ADD_1'
      'SITE_INFO_ADD_2=SITE_INFO_ADD_2'
      'SITE_INFO_ADD_3=SITE_INFO_ADD_3'
      'SITE_INFO_PHONE=SITE_INFO_PHONE')
    DataSet = cds493
    BCDToCurrency = False
    Left = 291
    Top = 152
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42675.441563946760000000
    ReportOptions.LastChange = 42681.475376689800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 368
    Top = 96
    Datasets = <
      item
        DataSet = frxdbdt96
        DataSetName = 'frxDBDataset2'
      end
      item
        DataSet = frxdbdtst22
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        Height = 774.803649999999900000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Picture1: TfrxPictureView
          Left = 15.118120000000000000
          Top = 11.338590000000000000
          Width = 117.165430000000000000
          Height = 56.692950000000010000
          DataField = 'Company_Icon'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset3'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frxDBDataset2Company_Name: TfrxMemoView
          Left = 226.771800000000000000
          Top = 7.559059999999999000
          Width = 302.362400000000000000
          Height = 26.456710000000000000
          DataField = 'Company_Name'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset3."Company_Name"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 302.362400000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #36864#36135#35013#36816#21333)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 60.472480000000000000
          Top = 90.708720000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #20379#24212#21830':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 60.472480000000000000
          Top = 128.504020000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #32852#31995#20154':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 76.370130000000000000
          Top = 162.519790000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #30005#35805';')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 75.590600000000000000
          Top = 200.315090000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #22320#22336':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 34.015770000000010000
          Top = 291.023810000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #37319#36141#35746#21333#21495':')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 22.677180000000000000
          Top = 331.378170000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #37319#36141#35746#21333#26085#26399':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 49.133890000000000000
          Top = 370.393940000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333#25968#37327':')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 49.133890000000000000
          Top = 408.189240000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #26448#26009#20195#30721':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 22.677180000000000000
          Top = 445.984540000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #26448#26009#21517#31216#35268#26684':')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 49.133890000000000000
          Top = 483.779840000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25509#25910#25968#37327':')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 49.133890000000000000
          Top = 521.575140000000100000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25910#36135#26085#26399':')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 49.133890000000000000
          Top = 559.370440000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #36864#36135#25968#37327':')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 49.133890000000000000
          Top = 597.165740000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #35013#36816#26041#27861':')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 49.133890000000000000
          Top = 631.181510000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #21442#32771#38468#27880':')
          ParentFont = False
        end
        object frxDBDataset1QUAN_ORD: TfrxMemoView
          Left = 110.165430000000000000
          Top = 370.393940000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = 'QUAN_ORD'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."QUAN_ORD"]')
          ParentFont = False
        end
        object frxDBDataset1PO_NUMBER: TfrxMemoView
          Left = 110.165430000000000000
          Top = 291.023810000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DataField = 'PO_NUMBER'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."PO_NUMBER"]')
          ParentFont = False
        end
        object frxDBDataset1PO_DATE: TfrxMemoView
          Left = 110.165430000000000000
          Top = 332.598640000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DataField = 'PO_DATE'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."PO_DATE"]')
          ParentFont = False
        end
        object frxDBDataset1INV_PART_NUMBER: TfrxMemoView
          Left = 110.165430000000000000
          Top = 408.189240000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          DataField = 'INV_PART_NUMBER'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."INV_PART_NUMBER"]')
          ParentFont = False
        end
        object frxDBDataset1INV_PART_DESCRIPTION: TfrxMemoView
          Left = 110.165430000000000000
          Top = 445.984540000000000000
          Width = 563.149970000000100000
          Height = 22.677180000000000000
          DataField = 'INV_PART_DESCRIPTION'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."INV_PART_DESCRIPTION"]')
          ParentFont = False
        end
        object frxDBDataset1QUANTITY: TfrxMemoView
          Left = 110.165430000000000000
          Top = 483.779840000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DataField = 'QUANTITY'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."QUANTITY"]')
          ParentFont = False
        end
        object frxDBDataset1REFERENCE_NUMBER: TfrxMemoView
          Left = 110.165430000000000000
          Top = 631.181510000000000000
          Width = 566.929499999999900000
          Height = 18.897650000000000000
          DataField = 'REFERENCE_NUMBER'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."REFERENCE_NUMBER"]')
          ParentFont = False
        end
        object frxDBDataset1SHIPPING_METHOD: TfrxMemoView
          Left = 110.165430000000000000
          Top = 597.165740000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          DataField = 'SHIPPING_METHOD'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."SHIPPING_METHOD"]')
          ParentFont = False
        end
        object frxDBDataset1QUAN_REJD: TfrxMemoView
          Left = 110.165430000000000000
          Top = 559.370440000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'QUAN_REJD'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."QUAN_REJD"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 476.220780000000000000
          Top = 124.724490000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #35013#36816#26085#26399':')
          ParentFont = False
        end
        object frxDBDataset1TRAN_DATE: TfrxMemoView
          Left = 538.472790000000000000
          Top = 124.724490000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'TRAN_DATE'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."TRAN_DATE"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 498.897960000000000000
          Top = 291.023810000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25910#36135#21333#21495':')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 498.897960000000000000
          Top = 370.393940000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #35746#36141#21333#20301':')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 521.575140000000100000
          Top = 404.409710000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #31246#29575':')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 498.897960000000000000
          Top = 483.779840000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25509#25910#21333#20215':')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 498.897960000000000000
          Top = 559.370440000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #36864#36135#37329#39069':')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 521.575140000000100000
          Top = 597.165740000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #31246#37329':')
          ParentFont = False
        end
        object frxDBDataset1TAX_2: TfrxMemoView
          Left = 559.149970000000100000
          Top = 404.409710000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TAX_2'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."TAX_2"]')
          ParentFont = False
        end
        object frxDBDataset1SUPPLIER_NAME: TfrxMemoView
          Left = 115.165430000000000000
          Top = 90.708720000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'SUPPLIER_NAME'
          DataSet = frxdbdtst22
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."SUPPLIER_NAME"]')
          ParentFont = False
        end
        object frxDBDataset1PHONE: TfrxMemoView
          Left = 115.165430000000000000
          Top = 162.519790000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'PHONE'
          DataSet = frxdbdtst22
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."PHONE"]')
          ParentFont = False
        end
        object frxDBDataset1BILLING_ADDRESS_1: TfrxMemoView
          Left = 115.165430000000000000
          Top = 200.315090000000000000
          Width = 506.457020000000000000
          Height = 30.236240000000000000
          DataField = 'BILLING_ADDRESS_1'
          DataSet = frxdbdtst22
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."BILLING_ADDRESS_1"]')
          ParentFont = False
        end
        object frxDBDataset1CONTACT_NAME_1: TfrxMemoView
          Left = 115.165430000000000000
          Top = 128.504020000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'CONTACT_NAME_1'
          DataSet = frxdbdtst22
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."CONTACT_NAME_1"]')
          ParentFont = False
        end
        object frxDBDataset1ship_DATE: TfrxMemoView
          Left = 110.165430000000000000
          Top = 521.575140000000100000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          DataField = 'ship_DATE'
          DataSet = frxdbdtst22
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."ship_DATE"]')
          ParentFont = False
        end
        object frxDBDataset1GRN_NUMBER: TfrxMemoView
          Left = 559.149970000000100000
          Top = 291.023810000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'GRN_NUMBER'
          DataSet = frxdbdtst22
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."GRN_NUMBER"]')
          ParentFont = False
        end
        object frxDBDataset2UNIT_NAME: TfrxMemoView
          Left = 559.149970000000100000
          Top = 370.393940000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'UNIT_NAME'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."UNIT_NAME"]')
          ParentFont = False
        end
        object frxDBDataset2price: TfrxMemoView
          Left = 559.149970000000100000
          Top = 483.779840000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'price'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."price"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 559.149970000000100000
          Top = 559.370440000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #36864#36135#37329#39069
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."'#36864#36135#37329#39069'"]')
          ParentFont = False
        end
        object frxDBDataset2: TfrxMemoView
          Left = 559.149970000000100000
          Top = 597.165740000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = #31246#37329
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."'#31246#37329'"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 854.173780000000000000
        Width = 718.110700000000000000
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 102.047310000000000000
        Top = 937.323440000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
        object Memo24: TfrxMemoView
          Left = 37.795300000000000000
          Top = 18.897650000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #21046#21333#20154':')
          ParentFont = False
        end
        object frxDBDataset1EMPLOYEE_NAME: TfrxMemoView
          Left = 94.488250000000000000
          Top = 18.897650000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          DataField = 'EMPLOYEE_NAME'
          DataSet = frxdbdt96
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."EMPLOYEE_NAME"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 285.346630000000000000
          Top = 18.897650000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #36864#36135#20154':')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 495.118430000000000000
          Top = 18.897650000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #31614#25910#20154':')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 338.039580000000000000
          Top = 37.795300000000000000
          Width = 90.708720000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 548.031849999999900000
          Top = 37.795300000000000000
          Width = 90.708720000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo27: TfrxMemoView
          Left = 26.456710000000000000
          Top = 56.692949999999990000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #36864#36135#22791#27880':')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 94.488250000000000000
          Top = 56.692949999999990000
          Width = 574.488560000000000000
          Height = 37.795300000000000000
          DataField = #22791#27880#20449#24687
          DataSet = frxdbdtst22
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."'#22791#27880#20449#24687'"]')
          ParentFont = False
        end
      end
    end
  end
  object cds96: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0096.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.' +
      'Data0017.INV_PART_DESCRIPTION,'#13#10'           dbo.Data0071.QUAN_ORD' +
      ', dbo.Data0002.UNIT_NAME, '#13#10'           dbo.Data0071.tax_price AS' +
      ' po_price, dbo.Data0071.CONVERSION_FACTOR, '#13#10'           dbo.Data' +
      '0070.PO_NUMBER, dbo.Data0070.PO_DATE, dbo.Data0022.tax_price AS ' +
      'price, '#13#10'           dbo.Data0022.TAX_2, dbo.Data0456.TTYPE,dbo.D' +
      'ata0005.EMPLOYEE_NAME,'#13#10'           dbo.Data0210.QUANTITY,dbo.Dat' +
      'a0096.SHIPPING_METHOD,dbo.Data0096.TRAN_DATE,'#13#10'           dbo.Da' +
      'ta0096.REFERENCE_NUMBER, data0096.QUAN_REJD , data0096.QUAN_REJD' +
      ' * Data0022.tax_price as '#39#36864#36135#37329#39069#39','#13#10'           data0096.QUAN_REJD ' +
      '* Data0022.tax_price * Data0022.TAX_2 * 0.01 / (1 + Data0022.TAX' +
      '_2 * 0.01) '#39#31246#37329#39#13#10'FROM         dbo.Data0017 INNER JOIN'#13#10'         ' +
      '             dbo.Data0096 ON dbo.Data0017.RKEY = dbo.Data0096.IN' +
      'VT_PTR INNER JOIN'#13#10'                      dbo.Data0456 INNER JOIN' +
      #13#10'                      dbo.Data0022 ON dbo.Data0456.RKEY = dbo.' +
      'Data0022.GRN_PTR INNER JOIN'#13#10'                      dbo.Data0002 ' +
      'ON dbo.Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY ON dbo.Dat' +
      'a0096.INV_TRAN_PTR = dbo.Data0022.RKEY INNER JOIN'#13#10'             ' +
      '         dbo.Data0005 ON dbo.Data0096.EMPL_PTR = dbo.Data0005.RK' +
      'EY INNER JOIN'#13#10'                      dbo.Data0210 ON dbo.Data002' +
      '2.RKEY = dbo.Data0210.D0022_PTR LEFT OUTER JOIN'#13#10'               ' +
      '       dbo.Data0071 INNER JOIN'#13#10'                      dbo.Data00' +
      '70 ON dbo.Data0071.PO_PTR = dbo.Data0070.RKEY ON dbo.Data0022.SO' +
      'URCE_PTR = dbo.Data0071.RKEY'#13#10'where 1=1'#13#10
    Params = <>
    Left = 208
    Top = 96
    object cds96RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cds96INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object cds96INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object cds96QUAN_ORD: TBCDField
      FieldName = 'QUAN_ORD'
      Precision = 13
    end
    object cds96UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object cds96po_price: TBCDField
      FieldName = 'po_price'
      Precision = 13
    end
    object cds96CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object cds96PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object cds96PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object cds96price: TBCDField
      FieldName = 'price'
      Precision = 13
    end
    object cds96TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object cds96TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object cds96EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object cds96QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object cds96SHIPPING_METHOD: TWideStringField
      FieldName = 'SHIPPING_METHOD'
    end
    object cds96TRAN_DATE: TDateTimeField
      FieldName = 'TRAN_DATE'
    end
    object cds96REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object cds96QUAN_REJD: TFloatField
      FieldName = 'QUAN_REJD'
    end
    object cds96退货金额: TFloatField
      FieldName = #36864#36135#37329#39069
      ReadOnly = True
    end
    object cds96税金: TFloatField
      FieldName = #31246#37329
      ReadOnly = True
    end
  end
  object frxdbdt96: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RKEY=RKEY'
      'INV_PART_NUMBER=INV_PART_NUMBER'
      'INV_PART_DESCRIPTION=INV_PART_DESCRIPTION'
      'QUAN_ORD=QUAN_ORD'
      'UNIT_NAME=UNIT_NAME'
      'po_price=po_price'
      'CONVERSION_FACTOR=CONVERSION_FACTOR'
      'PO_NUMBER=PO_NUMBER'
      'PO_DATE=PO_DATE'
      'price=price'
      'TAX_2=TAX_2'
      'TTYPE=TTYPE'
      'EMPLOYEE_NAME=EMPLOYEE_NAME'
      'QUANTITY=QUANTITY'
      'SHIPPING_METHOD=SHIPPING_METHOD'
      'TRAN_DATE=TRAN_DATE'
      'REFERENCE_NUMBER=REFERENCE_NUMBER'
      'QUAN_REJD=QUAN_REJD'
      #36864#36135#37329#39069'='#36864#36135#37329#39069
      #31246#37329'='#31246#37329)
    DataSet = cds96
    BCDToCurrency = False
    Left = 299
    Top = 96
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 368
    Top = 152
  end
end
