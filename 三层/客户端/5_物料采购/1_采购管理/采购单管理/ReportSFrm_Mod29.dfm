inherited frmReportS_Mod29: TfrmReportS_Mod29
  Left = 600
  Top = 273
  Caption = 'frmReportS_Mod29'
  ClientHeight = 441
  ClientWidth = 341
  ExplicitWidth = 357
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 13
  object repS: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 42683.491448287000000000
    ReportOptions.LastChange = 42684.400555659730000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 248
    Top = 264
    Datasets = <
      item
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset493'
      end
      item
        DataSet = frxdbdtst70
        DataSetName = 'frxDBDataset70'
      end
      item
        DataSet = frxdbdtst71
        DataSetName = 'frxDBDataset71'
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
        Height = 347.716760000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBDataset70WAREHOUSE_NAME: TfrxMemoView
          Left = 128.622140000000000000
          Width = 370.393940000000000000
          Height = 30.236240000000000000
          DataField = 'WAREHOUSE_NAME'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset70."WAREHOUSE_NAME"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70ENG_NAME: TfrxMemoView
          Left = 128.622140000000000000
          Top = 31.574830000000000000
          Width = 325.039580000000000000
          Height = 22.677180000000000000
          DataField = 'ENG_NAME'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset70."ENG_NAME"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70ADDRESS_LINE_1: TfrxMemoView
          Left = 175.756030000000000000
          Top = 58.590600000000000000
          Width = 291.023810000000000000
          Height = 18.897650000000000000
          DataField = 'ADDRESS_LINE_1'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Memo.UTF8W = (
            '[frxDBDataset70."ADDRESS_LINE_1"]')
        end
        object frxDBDataset70FAX: TfrxMemoView
          Left = 175.756030000000000000
          Top = 81.267780000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          DataField = 'FAX'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Memo.UTF8W = (
            '[frxDBDataset70."FAX"]')
        end
        object Memo2: TfrxMemoView
          Left = 472.559370000000000000
          Top = 34.574830000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20116#37329#32452#65306)
        end
        object Memo3: TfrxMemoView
          Left = 472.559370000000000000
          Top = 57.252010000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36741#26009' / '#21270#37329#32452#65306'0769 - 81321261')
        end
        object Memo4: TfrxMemoView
          Left = 472.559370000000000000
          Top = 79.929190000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20027#26009#32452#65306'0769-81321392  /  81321321')
        end
        object frxDBDataset70PHONE: TfrxMemoView
          Left = 537.370440000000000000
          Top = 34.574830000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'PHONE'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Memo.UTF8W = (
            '[frxDBDataset70."PHONE"]')
        end
        object Memo5: TfrxMemoView
          Left = 128.622140000000000000
          Top = 58.590600000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #22320#22336#65306)
        end
        object Memo6: TfrxMemoView
          Left = 128.622140000000000000
          Top = 81.267780000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20256#30495#65306)
        end
        object Line1: TfrxLineView
          Top = 105.047310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Top = 109.165430000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo7: TfrxMemoView
          Left = 231.543445000000000000
          Top = 128.504020000000000000
          Width = 253.228510000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #37319'           '#36141'           '#21333)
          ParentFont = False
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 254.220625000000000000
          Top = 164.078850000000000000
          Width = 207.874150000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'PURCHASE ORDER')
          ParentFont = False
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 513.118430000000000000
          Top = 162.519790000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'VMI'#23492#21806#65306)
          ParentFont = False
        end
        object frxDBDataset70STATE_INVT_TAX_FLAG: TfrxMemoView
          Left = 588.709030000000000000
          Top = 162.519790000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'STATE_INVT_TAX_FLAG'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."STATE_INVT_TAX_FLAG"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 30.236240000000000000
          Top = 208.756030000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #33268#65306)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 30.236240000000000000
          Top = 231.433210000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'To'#65306)
          ParentFont = False
        end
        object frxDBDataset70SUPPLIER_NAME: TfrxMemoView
          Left = 66.031540000000000000
          Top = 208.756030000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'SUPPLIER_NAME'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."SUPPLIER_NAME"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70SUPPLIER_NAME1: TfrxMemoView
          Left = 66.031540000000000000
          Top = 231.433210000000000000
          Width = 241.889920000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'SUPPLIER_NAME'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."SUPPLIER_NAME"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 30.236240000000000000
          Top = 253.228510000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30005#35805'(Phone)'#65306)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 30.236240000000000000
          Top = 275.905690000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20256#30495'(Tax)'#65306)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 30.236240000000000000
          Top = 298.582870000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #32852#32476#20154'(ATTN)'#65306)
          ParentFont = False
        end
        object frxDBDataset70FAX1: TfrxMemoView
          Left = 106.826840000000000000
          Top = 275.905690000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'FAX'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."FAX"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70PHONE1: TfrxMemoView
          Left = 119.944960000000000000
          Top = 253.228510000000000000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'PHONE'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."PHONE"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70SUPPIER_CONTACT: TfrxMemoView
          Left = 136.063080000000000000
          Top = 298.582870000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'SUPPIER_CONTACT'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."SUPPIER_CONTACT"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 30.236240000000000000
          Top = 325.039580000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'REF#PUR'#65306)
          ParentFont = False
        end
        object frxDBDataset70FOB: TfrxMemoView
          Left = 113.385900000000000000
          Top = 325.039580000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'FOB'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."FOB"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 382.409710000000000000
          Top = 207.874150000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333#21495'(P.O.NO)'#65306)
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70PO_NUMBER: TfrxMemoView
          Left = 503.354670000000000000
          Top = 207.874150000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'PO_NUMBER'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."PO_NUMBER"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 382.409710000000000000
          Top = 234.330860000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26085#26399'(DATE)'#65306)
          ParentFont = False
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 382.409710000000000000
          Top = 257.008040000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #36135#24065'(CURRENCY)'#65306)
          ParentFont = False
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 382.409710000000000000
          Top = 302.362400000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20184#27454#26041#24335'(PAYMENT)'#65306)
          ParentFont = False
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 382.409710000000000000
          Top = 325.039580000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24320#31080#26041#24335#65306)
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70PO_DATE: TfrxMemoView
          Left = 469.338900000000000000
          Top = 234.330860000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'PO_DATE'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."PO_DATE"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70CURR_NAME: TfrxMemoView
          Left = 510.913730000000000000
          Top = 257.008040000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          DataField = 'CURR_NAME'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."CURR_NAME"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70SHIPTO_ADDRESS: TfrxMemoView
          Left = 544.929500000000000000
          Top = 279.685220000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'SHIPTO_ADDRESS'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."SHIPTO_ADDRESS"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo21: TfrxMemoView
          Left = 382.409710000000000000
          Top = 279.685220000000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20132#36135#22320#28857'(DELIVERY TO)'#65306)
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70ANALYSIS_CODE_5: TfrxMemoView
          Left = 526.031850000000000000
          Top = 302.362400000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'ANALYSIS_CODE_5'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."ANALYSIS_CODE_5"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset70ANALYSIS_CODE_4: TfrxMemoView
          Left = 458.000310000000000000
          Top = 325.039580000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'ANALYSIS_CODE_4'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."ANALYSIS_CODE_4"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 50.692950000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Left = 30.236240000000000000
          Top = 0.220469999999988000
          Width = 661.417750000000000000
          Height = 49.133890000000000000
        end
        object Memo22: TfrxMemoView
          Left = 38.015770000000000000
          Top = 8.559059999999990000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #39033#30446)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 37.236240000000000000
          Top = 26.677180000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'ITEM')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 120.944960000000000000
          Top = 7.779529999999990000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #22411#21495'/'#35268#26684)
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 120.944960000000000000
          Top = 26.677180000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DESCRIPTION')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 617.063390000000000000
          Top = 3.559059999999990000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #37329#39069)
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 611.504330000000000000
          Top = 20.456710000000000000
          Width = 79.370130000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL AMOUNT')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 536.354670000000000000
          Top = 3.779529999999990000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21333#20215)
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 534.354670000000000000
          Top = 25.677180000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'UNIT PRICE')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 468.645950000000000000
          Top = 5.779529999999990000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20132#36135#26085#26399)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 470.645950000000000000
          Top = 26.677180000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'DEL.DATE')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 394.953000000000000000
          Top = 5.779529999999990000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 388.071120000000000000
          Top = 27.456710000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'QUANTITY')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 291.464750000000000000
          Top = 7.779529999999990000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #35201#27714)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 290.464750000000000000
          Top = 26.677180000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'REQ.')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 75.590600000000000000
          Top = 0.220469999999988000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo36: TfrxMemoView
          Left = 344.819110000000000000
          Top = 5.779529999999990000
          Width = 30.236240000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #32784'  CAF')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Left = 608.504330000000000000
          Top = 0.220469999999988000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 532.575140000000000000
          Top = 0.220469999999988000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          Left = 464.102660000000000000
          Top = 0.220469999999988000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 377.953000000000000000
          Top = 0.220469999999988000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 340.157700000000000000
          Top = 0.999999999999988000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          Left = 282.464750000000000000
          Top = 0.220469999999988000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 49.913420000000000000
        Top = 498.897960000000000000
        Width = 718.110700000000000000
        DataSet = frxdbdtst71
        DataSetName = 'frxDBDataset71'
        RowCount = 0
        object Line: TfrxMemoView
          Left = 45.015770000000000000
          Top = 13.559060000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          Left = 30.236240000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 691.653990000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Left = 30.236240000000000000
          Top = 49.574830000000000000
          Width = 661.417750000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 75.590600000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          Left = 282.362400000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset7172INV_PART_NUMBER: TfrxMemoView
          Left = 83.149660000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'INV_PART_NUMBER'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset71."INV_PART_NUMBER"]')
          ParentFont = False
        end
        object frxDBDataset7172INV_PART_DESCRIPTION: TfrxMemoView
          Left = 79.370130000000000000
          Top = 18.897650000000000000
          Width = 200.315090000000000000
          Height = 26.456710000000000000
          DataField = 'INV_PART_DESCRIPTION'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset71."INV_PART_DESCRIPTION"]')
          ParentFont = False
        end
        object frxDBDataset7172rohs: TfrxMemoView
          Left = 283.244280000000000000
          Top = 1.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'rohs'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset71."rohs"]')
          ParentFont = False
        end
        object frxDBDataset7172extra_req: TfrxMemoView
          Left = 283.464750000000000000
          Top = 19.677180000000000000
          Width = 56.692950000000000000
          Height = 30.236240000000000000
          DataField = 'extra_req'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset71."extra_req"]')
          ParentFont = False
        end
        object frxDBDataset7172IF_CAF: TfrxMemoView
          Left = 343.937230000000000000
          Top = 15.118120000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          DataField = 'IF_CAF'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset71."IF_CAF"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset7172QUAN_ORD: TfrxMemoView
          Left = 379.953000000000000000
          Top = 15.118120000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'QUAN_ORD'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset71."QUAN_ORD"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset7172REQ_DATE: TfrxMemoView
          Left = 466.661720000000000000
          Top = 14.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'REQ_DATE'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          DisplayFormat.FormatStr = 'yyyy-dd-mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset71."REQ_DATE"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset7172tax_price: TfrxMemoView
          Left = 544.031850000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'tax_price'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          DisplayFormat.FormatStr = '#,0.000'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset71."tax_price"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset7172TotalPrice: TfrxMemoView
          Left = 616.063390000000000000
          Top = 3.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'TotalPrice'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          DisplayFormat.FormatStr = '#,0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset71."TotalPrice"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset70CURR_CODE: TfrxMemoView
          Left = 629.961040000000000000
          Top = 27.236240000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'CURR_CODE'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset70."CURR_CODE"]')
          ParentFont = False
        end
        object frxDBDataset70CURR_CODE1: TfrxMemoView
          Left = 550.590910000000000000
          Top = 28.236240000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'CURR_CODE'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset70."CURR_CODE"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 340.157700000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset71UNIT_NAME: TfrxMemoView
          Left = 422.527830000000000000
          Top = 15.118120000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'UNIT_NAME'
          DataSet = frxdbdtst71
          DataSetName = 'frxDBDataset71'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset71."UNIT_NAME"]')
          ParentFont = False
          WordWrap = False
        end
        object Line7: TfrxLineView
          Left = 608.504330000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          Left = 531.913730000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          Left = 464.323130000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 377.953000000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Picture1: TfrxPictureView
        Left = 3.779530000000000000
        Top = 15.677180000000000000
        Width = 120.944960000000000000
        Height = 75.590600000000000000
        DataField = 'Company_Icon'
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset493'
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 283.464750000000000000
        Top = 608.504330000000000000
        Width = 718.110700000000000000
        object Line20: TfrxLineView
          Left = 531.913730000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line21: TfrxLineView
          Left = 608.504330000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 691.653990000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 532.913730000000000000
          Top = 49.133890000000000000
          Width = 158.740260000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo37: TfrxMemoView
          Left = 535.693260000000000000
          Top = 15.118120000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24635#37329#39069#65306)
          ParentFont = False
        end
        object frxDBDataset70SUB_TOTAL: TfrxMemoView
          Left = 614.283860000000000000
          Top = 4.338590000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'SUB_TOTAL'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          DisplayFormat.FormatStr = '#,0.00'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset70."SUB_TOTAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 627.401980000000000000
          Top = 26.456710000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'CURR_CODE'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset70."CURR_CODE"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 38.574830000000000000
          Top = 46.031540000000000000
          Width = 264.567100000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '*'#35831#22312#21457#31080#21450#36865#36135#21333#19978#27880#26126#25949#21496'P/O NO.*')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 38.795300000000000000
          Top = 75.488250000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '*Please remark our P/O NO. on invoice and D/N.*')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 37.795300000000000000
          Top = 97.944960000000000000
          Width = 661.417750000000000000
          Height = 132.283550000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #22791#27880#65306
            '1'#12289#36865#36135#26102#24517#39035#38468#24102#25152#36865#29289#26009#20986#36135#26816#39564#25253#21578#65307
            '2'#12289#29289#26009#21253#35013#26631#31614#35201#27714#26631#26126#29289#26009#21517#31216#35268#26684#12289#21697#29260#12289#29983#20135#26085#26399#12289#26377#25928#26399#12289#29983#20135#25209#21495#21450#29983#20135#21378#23478#65292#22914#25105#21496#23545#29289#26009#26377'RoHS'#35201#27714#65292#21017#24517#39035#22312#29289#26009
            '   '#21253#35013#34920#38754#36148#19978'RoHS'#26631#31614','#38500#29305#27530#25351#23450#22806#65292#25152#36865#29289#26009#21516#26102#39035#31526#21512#25105#21496#26377#23475#29289#36136#31649#29702#26631#20934#30340#35201#27714#65307
            '3'#12289#36865#36135#21333#19978#35201#27714#27880#26126#25105#21496#29289#26009#21517#31216#12289#35746#36141#25968#37327#12289#21333#20215#21450#25105#21496'PO'#21495#65307
            '4'#12289#25152#36865#29289#26009#24517#39035#25353#25105#21496#35201#27714#36865#36135#65292#24182#20445#35777#26159#21407#21378#27491#21697#65292#22914#21457#29616#25152#36865#29289#26009#20013#25530#26377#20551#36135#27425#36135#65292#25105#21496#23558#26377#26435#25298#20184#36135#27454#24182#20570#30456#24212#22788#32602#65307
            '5'#12289#25910#21040#35746#21333#21518#35831#20110#19968#20010#24037#20316#26085#20869#22238#31614#32473#25105#21496#65292#21542#21017#25105#21496#23558#35270#20026#40664#35748#12290)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 37.795300000000000000
          Top = 237.228510000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29305#21035#35201#27714#65306)
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset70Remark70: TfrxMemoView
          Left = 37.795300000000000000
          Top = 259.905690000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          DataField = 'Remark70'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset70."Remark70"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 143.622140000000000000
        Top = 914.646260000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 457.323130000000000000
          Top = 20.456710000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #21457#21333'ISSUED BY'#65306)
        end
        object Memo39: TfrxMemoView
          Left = 457.323130000000000000
          Top = 62.031540000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #23457#26680'CHECKED BY'#65306)
        end
        object Memo44: TfrxMemoView
          Left = 37.795300000000000000
          Top = 20.456710000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #30830#35748'CONFIRMED BY'#65306)
        end
        object Memo45: TfrxMemoView
          Left = 37.795300000000000000
          Top = 59.472480000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20844#21496#30422#31456'/'#31614#32626#65306)
        end
        object Memo46: TfrxMemoView
          Left = 37.795300000000000000
          Top = 78.370130000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'SELLER CO.CHOP&AUTHORIZED')
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 37.795300000000000000
          Top = 97.267780000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'SIGNATURE')
        end
        object Line24: TfrxLineView
          Left = 187.756030000000000000
          Top = 39.354360000000000000
          Width = 109.606370000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line25: TfrxLineView
          Left = 589.606680000000000000
          Top = 39.354360000000000000
          Width = 109.606370000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line26: TfrxLineView
          Left = 589.606680000000000000
          Top = 80.929190000000000000
          Width = 109.606370000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line27: TfrxLineView
          Left = 147.401670000000000000
          Top = 77.149660000000000000
          Width = 109.606370000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDBDataset70EMPLOYEE_NAME: TfrxMemoView
          Left = 589.606680000000000000
          Top = 18.897650000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'EMPLOYEE_NAME'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset70."EMPLOYEE_NAME"]')
          ParentFont = False
        end
        object frxDBDataset70CONFIRMATION_NUMBER: TfrxMemoView
          Left = 589.606680000000000000
          Top = 60.472480000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'CONFIRMATION_NUMBER'
          DataSet = frxdbdtst70
          DataSetName = 'frxDBDataset70'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset70."CONFIRMATION_NUMBER"]')
          ParentFont = False
        end
      end
    end
  end
  object cds70: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0015.WAREHOUSE_NAME, dbo.Data0015.ENG_NAME, d' +
      'bo.Data0015.FAX, dbo.Data0015.PHONE, dbo.Data0015.ADDRESS_LINE_1' +
      ', '#13#10'                      dbo.Data0005.EMPLOYEE_NAME, dbo.Data00' +
      '01.CURR_CODE, dbo.Data0001.CURR_NAME, dbo.Data0023.SUPPLIER_NAME' +
      ', dbo.Data0023.PHONE AS SuppPhone, dbo.Data0023.FAX AS SuppFax,'#13 +
      #10'                       dbo.Data0070.*'#13#10'FROM         dbo.Data007' +
      '0 INNER JOIN'#13#10'                      dbo.Data0015 ON dbo.Data0070' +
      '.WAREHOUSE_POINTER = dbo.Data0015.RKEY INNER JOIN'#13#10'             ' +
      '         dbo.Data0023 ON dbo.Data0070.SUPPLIER_POINTER = dbo.Dat' +
      'a0023.RKEY INNER JOIN'#13#10'                      dbo.Data0001 ON dbo' +
      '.Data0070.CURRENCY_PTR = dbo.Data0001.RKEY INNER JOIN'#13#10'         ' +
      '             dbo.Data0005 ON dbo.Data0070.EMPLOYEE_POINTER = dbo' +
      '.Data0005.RKEY '
    Params = <>
    Left = 80
    Top = 256
    Data = {
      DD0A00009619E0BD01000000180000004100010000000300000087080E574152
      45484F5553455F4E414D45010049000000010005574944544802000200460008
      454E475F4E414D45010049000000010005574944544802000200460003464158
      01004900000001000557494454480200020032000550484F4E45010049000000
      01000557494454480200020032000E414444524553535F4C494E455F31010049
      00000001000557494454480200020046000D454D504C4F5945455F4E414D4501
      0049000000010005574944544802000200100009435552525F434F4445010049
      000000010005574944544802000200050009435552525F4E414D450100490000
      0001000557494454480200020014000D535550504C4945525F4E414D45010049
      0000000100055749445448020002006400095375707050686F6E650100490000
      0001000557494454480200020014000753757070466178010049000000010005
      574944544802000200140004524B455904000100020001000753554254595045
      0200490008004175746F696E630009504F5F4E554D4245520100490000000100
      055749445448020002000F00104353495F555345525F504F494E544552040001
      000000000010454D504C4F5945455F504F494E54455204000100000000001053
      5550504C4945525F504F494E544552040001000000000010535550505F464143
      5F4144445F50545204000100000000001157415245484F5553455F504F494E54
      4552040001000000000010454449545F42595F454D504C5F5054520400010000
      0000000653544154555302000100000000000D45584348414E47455F52415445
      08000400000000000D5348495050494E475F434F535408000400000000000B46
      45444552414C5F544158040005000000020008444543494D414C530200020002
      000557494454480200020004000953544154455F544158040001000000000009
      5355425F544F54414C080004000000000013434F4E4649524D4154494F4E5F4E
      554D42455201004900000001000557494454480200020014000F534849505049
      4E475F4D4554484F44010049000000010005574944544802000200140007504F
      5F4441544508000800000000000F535550504945525F434F4E54414354010049
      00000002000753554254595045020049000A0046697865644368617200055749
      4454480200020014000D434F4E544143545F50484F4E45010049000000010005
      57494454480200020028000F444953434F554E545F414D4F554E540800040000
      0000000B444154455F454449544544080008000000000007504F5F5459504501
      004900000002000753554254595045020049000A004669786564436861720005
      574944544802000200010003464F420100490000000100055749445448020002
      000F000B4D4953435F43484152474508000400000000000A5052494E545F4441
      544508000800000000000A5052494E545F54494D4508000800000000000F4D55
      4C5449504C455F464143544F52040005000000020008444543494D414C530200
      020002000557494454480200020004000B434954595F414D4F554E5404000500
      0000020008444543494D414C530200020002000557494454480200020004000D
      434F554E54595F414D4F554E54040005000000020008444543494D414C530200
      020002000557494454480200020004000F434F4C4C4543545F50524550414944
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001001353544154455F534849505F5441585F464C4147
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001001353544154455F4D4953435F5441585F464C4147
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001001353544154455F494E56545F5441585F464C4147
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001000C43555252454E43595F50545204000100000000
      000F5345434F4E445F574853455F505452040001000000000009504F5F524556
      5F4E4F0100490000000100055749445448020002000A000D5041594D454E545F
      5445524D5302000100000000000D434153485F444953434F554E540400050000
      00020008444543494D414C530200020002000557494454480200020004000D44
      4953434F554E545F4441595302000100000000000E434153485F444953434F55
      4E5432040005000000020008444543494D414C53020002000200055749445448
      0200020004000E444953434F554E54325F444159530200010000000000135055
      5243484153455F4F524445525F5459504502000100000000000C455850495245
      445F4441544508000800000000000F414E414C595349535F434F44455F310100
      4900000001000557494454480200020014000F414E414C595349535F434F4445
      5F3201004900000001000557494454480200020014000F414E414C595349535F
      434F44455F3301004900000001000557494454480200020014000F414E414C59
      5349535F434F44455F3401004900000001000557494454480200020014000F41
      4E414C595349535F434F44455F35010049000000010005574944544802000200
      14000E53484950544F5F41444452455353010049000000010005574944544802
      00020032000D50555243484153455F5459504501004A00000001000557494454
      480200020064000852656D61726B373004004B00000001000753554254595045
      02004900050054657874000A52656D61726B3130373004004B00000001000753
      55425459504502004900050054657874000A52656D61726B3230373004004B00
      00000100075355425459504502004900050054657874000549444B6579010049
      00000002000753554254595045020049000A0046697865644368617200055749
      44544802000200260000000000000000000000004401001000104054001AC9EE
      DBDACAD0CEE5D6EABFC6BCBCB9C9B7DDD3D0CFDEB9ABCBBE1C5348454E5A4845
      4E2057555A485520544543482E434F2E2C4C54442E0E303735352D3237353138
      383132200E303735352D3237353038373232201EC9EEDBDACAD0B1A6B0B2C7F8
      CEF7CFE7BBC6CCEFD6D3CEDDB9A4D2B5C7F806D7DECBBCC5F403524D4206C8CB
      C3F1B1D21CB4B4D0C2CEA2D7EABFC6BCBCA3A8C3B7D6DDA3A9D3D0CFDEB9ABCB
      BE0D303735352D32373233393134390D303735352D3237323339313531CF2102
      000A44504F44303336383939DF0D00005B100000B10400003404000001000000
      5B1000000500000000000000F03F000000000000000004021700000000000000
      000000000000000000000000333333333333594006D7DECBBCC5F404C6FBD4CB
      00006AB4A9EDCC4214C0EEC9FA202020202020202020202020202020201B3037
      35352D32373233393134392F303735352D323732333931353100000000000000
      000048D58BB0EDCC420153000000000000000004020000000000000000000000
      0000000000040200000000000000000000000000000000040200000000000000
      0000000000000000000143014E014E0159010000000000000078000402000000
      0000000000000000000000000000000402000000000000000000000000000000
      00010001000060D18BB0EDCC4208D7EABFD7CEEFC1CF010011D7A8D3C3D4F6D6
      B5CBB0B7A2C6B131372508D4C2BDE13930CCEC066C5171517B7C267B36424441
      303834382D363946432D344545362D424643382D324144423130433330433332
      7D}
    object cds70WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object cds70ENG_NAME: TStringField
      FieldName = 'ENG_NAME'
      Size = 70
    end
    object cds70FAX: TStringField
      FieldName = 'FAX'
      Size = 50
    end
    object cds70PHONE: TStringField
      FieldName = 'PHONE'
      Size = 50
    end
    object cds70ADDRESS_LINE_1: TStringField
      FieldName = 'ADDRESS_LINE_1'
      Size = 70
    end
    object cds70EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object cds70CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object cds70CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object cds70SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object cds70SuppPhone: TStringField
      FieldName = 'SuppPhone'
    end
    object cds70SuppFax: TStringField
      FieldName = 'SuppFax'
    end
    object cds70RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cds70PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object cds70CSI_USER_POINTER: TIntegerField
      FieldName = 'CSI_USER_POINTER'
    end
    object cds70EMPLOYEE_POINTER: TIntegerField
      FieldName = 'EMPLOYEE_POINTER'
    end
    object cds70SUPPLIER_POINTER: TIntegerField
      FieldName = 'SUPPLIER_POINTER'
    end
    object cds70SUPP_FAC_ADD_PTR: TIntegerField
      FieldName = 'SUPP_FAC_ADD_PTR'
    end
    object cds70WAREHOUSE_POINTER: TIntegerField
      FieldName = 'WAREHOUSE_POINTER'
    end
    object cds70EDIT_BY_EMPL_PTR: TIntegerField
      FieldName = 'EDIT_BY_EMPL_PTR'
    end
    object cds70STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object cds70EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object cds70SHIPPING_COST: TFloatField
      FieldName = 'SHIPPING_COST'
    end
    object cds70FEDERAL_TAX: TBCDField
      FieldName = 'FEDERAL_TAX'
      Precision = 4
      Size = 2
    end
    object cds70STATE_TAX: TIntegerField
      FieldName = 'STATE_TAX'
    end
    object cds70SUB_TOTAL: TFloatField
      FieldName = 'SUB_TOTAL'
    end
    object cds70CONFIRMATION_NUMBER: TStringField
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object cds70SHIPPING_METHOD: TStringField
      FieldName = 'SHIPPING_METHOD'
    end
    object cds70PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object cds70SUPPIER_CONTACT: TStringField
      FieldName = 'SUPPIER_CONTACT'
      FixedChar = True
    end
    object cds70CONTACT_PHONE: TStringField
      FieldName = 'CONTACT_PHONE'
      Size = 40
    end
    object cds70DISCOUNT_AMOUNT: TFloatField
      FieldName = 'DISCOUNT_AMOUNT'
    end
    object cds70DATE_EDITED: TDateTimeField
      FieldName = 'DATE_EDITED'
    end
    object cds70PO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      FixedChar = True
      Size = 1
    end
    object cds70FOB: TStringField
      FieldName = 'FOB'
      Size = 15
    end
    object cds70MISC_CHARGE: TFloatField
      FieldName = 'MISC_CHARGE'
    end
    object cds70PRINT_DATE: TDateTimeField
      FieldName = 'PRINT_DATE'
    end
    object cds70PRINT_TIME: TDateTimeField
      FieldName = 'PRINT_TIME'
    end
    object cds70MULTIPLE_FACTOR: TBCDField
      FieldName = 'MULTIPLE_FACTOR'
      Precision = 4
      Size = 2
    end
    object cds70CITY_AMOUNT: TBCDField
      FieldName = 'CITY_AMOUNT'
      Precision = 4
      Size = 2
    end
    object cds70COUNTY_AMOUNT: TBCDField
      FieldName = 'COUNTY_AMOUNT'
      Precision = 4
      Size = 2
    end
    object cds70COLLECT_PREPAID: TStringField
      FieldName = 'COLLECT_PREPAID'
      FixedChar = True
      Size = 1
    end
    object cds70STATE_SHIP_TAX_FLAG: TStringField
      FieldName = 'STATE_SHIP_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object cds70STATE_MISC_TAX_FLAG: TStringField
      FieldName = 'STATE_MISC_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object cds70STATE_INVT_TAX_FLAG: TStringField
      FieldName = 'STATE_INVT_TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object cds70CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object cds70SECOND_WHSE_PTR: TIntegerField
      FieldName = 'SECOND_WHSE_PTR'
    end
    object cds70PO_REV_NO: TStringField
      FieldName = 'PO_REV_NO'
      Size = 10
    end
    object cds70PAYMENT_TERMS: TSmallintField
      FieldName = 'PAYMENT_TERMS'
    end
    object cds70CASH_DISCOUNT: TBCDField
      FieldName = 'CASH_DISCOUNT'
      Precision = 4
      Size = 2
    end
    object cds70DISCOUNT_DAYS: TSmallintField
      FieldName = 'DISCOUNT_DAYS'
    end
    object cds70CASH_DISCOUNT2: TBCDField
      FieldName = 'CASH_DISCOUNT2'
      Precision = 4
      Size = 2
    end
    object cds70DISCOUNT2_DAYS: TSmallintField
      FieldName = 'DISCOUNT2_DAYS'
    end
    object cds70PURCHASE_ORDER_TYPE: TSmallintField
      FieldName = 'PURCHASE_ORDER_TYPE'
    end
    object cds70EXPIRED_DATE: TDateTimeField
      FieldName = 'EXPIRED_DATE'
    end
    object cds70ANALYSIS_CODE_1: TStringField
      FieldName = 'ANALYSIS_CODE_1'
    end
    object cds70ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
    end
    object cds70ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
    end
    object cds70ANALYSIS_CODE_4: TStringField
      FieldName = 'ANALYSIS_CODE_4'
    end
    object cds70ANALYSIS_CODE_5: TStringField
      FieldName = 'ANALYSIS_CODE_5'
    end
    object cds70SHIPTO_ADDRESS: TStringField
      FieldName = 'SHIPTO_ADDRESS'
      Size = 50
    end
    object cds70PURCHASE_TYPE: TWideStringField
      FieldName = 'PURCHASE_TYPE'
      Size = 50
    end
    object cds70Remark70: TMemoField
      FieldName = 'Remark70'
      BlobType = ftMemo
    end
    object cds70Remark1070: TMemoField
      FieldName = 'Remark1070'
      BlobType = ftMemo
    end
    object cds70Remark2070: TMemoField
      FieldName = 'Remark2070'
      BlobType = ftMemo
    end
    object cds70IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
  end
  object cds71: TClientDataSet
    Active = True
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0071.*, dbo.Data0017.INV_PART_NUMBER, dbo.Dat' +
      'a0017.INV_PART_DESCRIPTION'#13#10'                       , dbo.Data000' +
      '2.UNIT_NAME,dbo.Data0071.QUAN_ORD * tax_price AS TotalPrice'#13#10'FRO' +
      'M         dbo.Data0071 INNER JOIN'#13#10'                      dbo.Dat' +
      'a0017 ON dbo.Data0071.INVT_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10' ' +
      '                     dbo.Data0002 ON dbo.Data0071.PURCHASE_UNIT_' +
      'PTR = dbo.Data0002.RKEY'
    Params = <>
    Left = 80
    Top = 320
    Data = {
      CB0600009619E0BD020000001800000021000200000003000000330404524B45
      59040001000200010007535542545950450200490008004175746F696E630006
      504F5F505452040001000000000008494E56545F505452040001000000000008
      5155414E5F4F5244090005000000020008444543494D414C5302000200040005
      5749445448020002000D00095155414E5F524543440900050000000200084445
      43494D414C53020002000400055749445448020002000D000C5155414E5F494E
      5F494E5350090005000000020008444543494D414C5302000200040005574944
      5448020002000D00095155414E5F5245544E0800040000000000095155414E5F
      494E564408000400000000000550524943450A0012000000020008444543494D
      414C53020002000600055749445448020002000F00055441585F320400050000
      00020008444543494D414C530200020002000557494454480200020004000844
      4953434F554E54040005000000020008444543494D414C530200020002000557
      4944544802000200040009726563645F44415445080008000000000008524551
      5F444154450800080000000000095155414E5F52454A44080004000000000006
      574F5F50545204000100000000001150555243484153455F554E49545F505452
      040001000000000011434F4E56455253494F4E5F464143544F52080004000000
      00000C5052494E5445445F44415445080008000000000006726561736F6E0100
      490000000100055749445448020002003C000965787472615F72657101004900
      000001000557494454480200020032000861766C5F666C616701004900000002
      000753554254595045020049000A004669786564436861720005574944544802
      0002000100097461785F7072696365090005000000020008444543494D414C53
      020002000400055749445448020002000D0004726F6873010049000000010005
      5749445448020002000A000B495143454D504C5F505452040001000000000006
      49465F43414601004A00000002000753554254595045020049000A0046697865
      64436861720005574944544802000200040006726B6579363904000100000000
      000A49465F757267656E63790200030000000000094437305F49444B65790100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020026000549444B657901004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020026000A546F74
      616C5072696365100012000200020008444543494D414C530200020008000557
      49445448020002001B000F494E565F504152545F4E554D424552010049000000
      010005574944544802000200190014494E565F504152545F4445534352495054
      494F4E010049000200010005574944544802000200640009554E49545F4E414D
      4501004900000001000557494454480200020014000000000000400054400500
      0052D90300CF210200040000000D04000000007000000D04000000008000000D
      04000000000000000D04000000000000000D04000000000000000D0400000000
      000000000000000000000000000000000000000F0600000001025641000F0600
      0000001794040217000402170000000000000000000000040200000402000000
      00000000000000000000E0A6EDADEDCC4200000000000000000A0000000A0000
      00000000000000F03F01590D04000000012000000D040000000021000004524F
      48530000267B36424441303834382D363946432D344545362D424643382D3241
      444231304333304333327D267B46303241343134382D334145392D344230352D
      423932462D3638323732333641444138327D1B08000000000000000008400000
      00001B08075A444C2D3031350FB5E7C4D4D7EABED7554320302E313502D6A700
      00004000144005000051D90300CF2102000D0000000D04000000008000000000
      000000000000000D04000000000000000000000000000000000D040000000000
      0000000000000000000000000000000000000000000000000000000F06000000
      0017948720000000000000000004021700000000000000000000000000000004
      02000000000000000000000000000000000020D2EBADEDCC4200000000000000
      000A0000000A000000000000000000F03F0AC8D0B3A4A3BA332E353001590D04
      0000000021000000000000000000000004524F48530000267B36424441303834
      382D363946432D344545362D424643382D3241444231304333304333327D267B
      42453237373537302D423241452D344446372D423230442D3431423346394439
      394132387D1B0800000000000000000168000000000000075A444C2D3032300C
      B5E7C4D4D7EABED7302E323002D6A7}
    object cds71RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cds71PO_PTR: TIntegerField
      FieldName = 'PO_PTR'
    end
    object cds71INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object cds71QUAN_ORD: TBCDField
      FieldName = 'QUAN_ORD'
      Precision = 13
    end
    object cds71QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 13
    end
    object cds71QUAN_IN_INSP: TBCDField
      FieldName = 'QUAN_IN_INSP'
      Precision = 13
    end
    object cds71QUAN_RETN: TFloatField
      FieldName = 'QUAN_RETN'
    end
    object cds71QUAN_INVD: TFloatField
      FieldName = 'QUAN_INVD'
    end
    object cds71PRICE: TFMTBCDField
      FieldName = 'PRICE'
      Precision = 15
      Size = 6
    end
    object cds71TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object cds71DISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Precision = 4
      Size = 2
    end
    object cds71recd_DATE: TDateTimeField
      FieldName = 'recd_DATE'
    end
    object cds71REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object cds71QUAN_REJD: TFloatField
      FieldName = 'QUAN_REJD'
    end
    object cds71WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object cds71PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object cds71CONVERSION_FACTOR: TFloatField
      FieldName = 'CONVERSION_FACTOR'
    end
    object cds71PRINTED_DATE: TDateTimeField
      FieldName = 'PRINTED_DATE'
    end
    object cds71reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object cds71extra_req: TStringField
      FieldName = 'extra_req'
      Size = 50
    end
    object cds71avl_flag: TStringField
      FieldName = 'avl_flag'
      FixedChar = True
      Size = 1
    end
    object cds71tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 13
    end
    object cds71rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object cds71IQCEMPL_PTR: TIntegerField
      FieldName = 'IQCEMPL_PTR'
    end
    object cds71IF_CAF: TWideStringField
      FieldName = 'IF_CAF'
      FixedChar = True
      Size = 2
    end
    object cds71rkey69: TIntegerField
      FieldName = 'rkey69'
    end
    object cds71IF_urgency: TBooleanField
      FieldName = 'IF_urgency'
    end
    object cds71D70_IDKey: TStringField
      FieldName = 'D70_IDKey'
      FixedChar = True
      Size = 38
    end
    object cds71IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object cds71TotalPrice: TFMTBCDField
      FieldName = 'TotalPrice'
      ReadOnly = True
      Precision = 27
    end
    object cds71INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object cds71INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object cds71UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
  end
  object frxdbdtst493: TfrxDBDataset
    UserName = 'frxDBDataset493'
    CloseDataSource = False
    FieldAliases.Strings = (
      '-Company_Name=Company_Name'
      '-Company_Name2=Company_Name2'
      '-Company_Name3=Company_Name3'
      '-ship_address=ship_address'
      'Company_Icon=Company_Icon'
      '-SITE_INFO_ADD_1=SITE_INFO_ADD_1'
      '-SITE_INFO_ADD_2=SITE_INFO_ADD_2'
      '-SITE_INFO_ADD_3=SITE_INFO_ADD_3'
      '-SITE_INFO_PHONE=SITE_INFO_PHONE')
    DataSet = cds493
    BCDToCurrency = False
    Left = 152
    Top = 200
  end
  object frxdbdtst70: TfrxDBDataset
    UserName = 'frxDBDataset70'
    CloseDataSource = False
    FieldAliases.Strings = (
      'WAREHOUSE_NAME=WAREHOUSE_NAME'
      'ENG_NAME=ENG_NAME'
      'FAX=FAX'
      'PHONE=PHONE'
      'ADDRESS_LINE_1=ADDRESS_LINE_1'
      'EMPLOYEE_NAME=EMPLOYEE_NAME'
      'CURR_CODE=CURR_CODE'
      'CURR_NAME=CURR_NAME'
      'SUPPLIER_NAME=SUPPLIER_NAME'
      'SuppPhone=SuppPhone'
      'SuppFax=SuppFax'
      '-RKEY=RKEY'
      'PO_NUMBER=PO_NUMBER'
      '-CSI_USER_POINTER=CSI_USER_POINTER'
      '-EMPLOYEE_POINTER=EMPLOYEE_POINTER'
      '-SUPPLIER_POINTER=SUPPLIER_POINTER'
      '-SUPP_FAC_ADD_PTR=SUPP_FAC_ADD_PTR'
      '-WAREHOUSE_POINTER=WAREHOUSE_POINTER'
      '-EDIT_BY_EMPL_PTR=EDIT_BY_EMPL_PTR'
      'STATUS=STATUS'
      'EXCHANGE_RATE=EXCHANGE_RATE'
      'SHIPPING_COST=SHIPPING_COST'
      'FEDERAL_TAX=FEDERAL_TAX'
      'STATE_TAX=STATE_TAX'
      'SUB_TOTAL=SUB_TOTAL'
      'CONFIRMATION_NUMBER=CONFIRMATION_NUMBER'
      'SHIPPING_METHOD=SHIPPING_METHOD'
      'PO_DATE=PO_DATE'
      'SUPPIER_CONTACT=SUPPIER_CONTACT'
      'CONTACT_PHONE=CONTACT_PHONE'
      'DISCOUNT_AMOUNT=DISCOUNT_AMOUNT'
      'DATE_EDITED=DATE_EDITED'
      'PO_TYPE=PO_TYPE'
      'FOB=FOB'
      'MISC_CHARGE=MISC_CHARGE'
      'PRINT_DATE=PRINT_DATE'
      'PRINT_TIME=PRINT_TIME'
      'MULTIPLE_FACTOR=MULTIPLE_FACTOR'
      'CITY_AMOUNT=CITY_AMOUNT'
      'COUNTY_AMOUNT=COUNTY_AMOUNT'
      'COLLECT_PREPAID=COLLECT_PREPAID'
      'STATE_SHIP_TAX_FLAG=STATE_SHIP_TAX_FLAG'
      'STATE_MISC_TAX_FLAG=STATE_MISC_TAX_FLAG'
      'STATE_INVT_TAX_FLAG=STATE_INVT_TAX_FLAG'
      'CURRENCY_PTR=CURRENCY_PTR'
      'SECOND_WHSE_PTR=SECOND_WHSE_PTR'
      'PO_REV_NO=PO_REV_NO'
      'PAYMENT_TERMS=PAYMENT_TERMS'
      'CASH_DISCOUNT=CASH_DISCOUNT'
      'DISCOUNT_DAYS=DISCOUNT_DAYS'
      'CASH_DISCOUNT2=CASH_DISCOUNT2'
      'DISCOUNT2_DAYS=DISCOUNT2_DAYS'
      '-PURCHASE_ORDER_TYPE=PURCHASE_ORDER_TYPE'
      'EXPIRED_DATE=EXPIRED_DATE'
      'ANALYSIS_CODE_1=ANALYSIS_CODE_1'
      'ANALYSIS_CODE_2=ANALYSIS_CODE_2'
      'ANALYSIS_CODE_3=ANALYSIS_CODE_3'
      'ANALYSIS_CODE_4=ANALYSIS_CODE_4'
      'ANALYSIS_CODE_5=ANALYSIS_CODE_5'
      'SHIPTO_ADDRESS=SHIPTO_ADDRESS'
      '-PURCHASE_TYPE=PURCHASE_TYPE'
      'Remark70=Remark70'
      'Remark1070=Remark1070'
      'Remark2070=Remark2070'
      '-IDKey=IDKey')
    DataSet = cds70
    BCDToCurrency = False
    Left = 152
    Top = 264
  end
  object frxdbdtst71: TfrxDBDataset
    UserName = 'frxDBDataset71'
    CloseDataSource = False
    FieldAliases.Strings = (
      '-RKEY=RKEY'
      '-PO_PTR=PO_PTR'
      '-INVT_PTR=INVT_PTR'
      'QUAN_ORD=QUAN_ORD'
      '-QUAN_RECD=QUAN_RECD'
      '-QUAN_IN_INSP=QUAN_IN_INSP'
      '-QUAN_RETN=QUAN_RETN'
      '-QUAN_INVD=QUAN_INVD'
      'PRICE=PRICE'
      'TAX_2=TAX_2'
      '-DISCOUNT=DISCOUNT'
      'recd_DATE=recd_DATE'
      'REQ_DATE=REQ_DATE'
      '-QUAN_REJD=QUAN_REJD'
      '-WO_PTR=WO_PTR'
      '-PURCHASE_UNIT_PTR=PURCHASE_UNIT_PTR'
      '-CONVERSION_FACTOR=CONVERSION_FACTOR'
      '-PRINTED_DATE=PRINTED_DATE'
      'reason=reason'
      'extra_req=extra_req'
      '-avl_flag=avl_flag'
      'tax_price=tax_price'
      'rohs=rohs'
      '-IQCEMPL_PTR=IQCEMPL_PTR'
      'IF_CAF=IF_CAF'
      '-rkey69=rkey69'
      'IF_urgency=IF_urgency'
      '-D70_IDKey=D70_IDKey'
      '-IDKey=IDKey'
      'TotalPrice=TotalPrice'
      'INV_PART_NUMBER=INV_PART_NUMBER'
      'INV_PART_DESCRIPTION=INV_PART_DESCRIPTION'
      'UNIT_NAME=UNIT_NAME')
    DataSet = cds71
    BCDToCurrency = False
    Left = 152
    Top = 320
  end
  object cds493: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    Left = 80
    Top = 200
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
  object frxDesignerS: TfrxDesigner
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
    Left = 248
    Top = 328
  end
end
