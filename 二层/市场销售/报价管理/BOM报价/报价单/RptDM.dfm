object dmRpt: TdmRpt
  OldCreateOrder = False
  Height = 462
  Width = 475
  object rpt1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42536.615557800900000000
    ReportOptions.LastChange = 43158.614100844900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 344
    Top = 56
    Datasets = <
      item
        DataSet = rptds493
        DataSetName = 'ds493'
      end
      item
        DataSet = rptdsBP06
        DataSetName = 'dsBP06'
      end
      item
        DataSet = rptdsBP07
        DataSetName = 'dsBP07'
      end
      item
        DataSet = rptdsBP08
        DataSetName = 'dsBP08'
      end
      item
        DataSet = rptdsBP10
        DataSetName = 'dsBP10'
      end
      item
        DataSet = rptdsBP11
        DataSetName = 'dsBP11'
      end
      item
        DataSet = rptdsCustomField
        DataSetName = 'dsCustomField'
      end
      item
        DataSet = frxDBBP09
        DataSetName = 'frxDBBP09'
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
        Height = 179.637910000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 714.331170000000000000
          Height = 30.236240000000000000
          DataField = 'Company_Name'
          DataSet = rptds493
          DataSetName = 'ds493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[ds493."Company_Name"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 249.448980000000000000
          Top = 38.574830000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20135#21697#25253#20215#25104#26412#20998#26512#26723#26696#34920)
          ParentFont = False
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 541.897960000000000000
          Top = 43.574830000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25171#21360#26102#38388#65306)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 610.606680000000000000
          Top = 43.574830000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 10.338590000000000000
          Top = 7.779530000000000000
          Width = 113.385900000000000000
          Height = 52.913420000000000000
          DataField = 'Company_Icon'
          DataSet = rptds493
          DataSetName = 'ds493'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Shape5: TfrxShapeView
          Left = 3.779530000000000000
          Top = 71.811070000000000000
          Width = 710.551640000000000000
          Height = 86.929190000000000000
        end
        object Line23: TfrxLineView
          Left = 3.779530000000000000
          Top = 92.047310000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line24: TfrxLineView
          Left = 3.779530000000000000
          Top = 113.063080000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line25: TfrxLineView
          Left = 3.779530000000000000
          Top = 136.063080000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo84: TfrxMemoView
          Left = 7.559060000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25253#20215#21333#21495#65306)
          ParentFont = False
        end
        object Memo85: TfrxMemoView
          Left = 75.590551180000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'BPNO'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."BPNO"]')
          ParentFont = False
        end
        object Line26: TfrxLineView
          Left = 154.417440000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line27: TfrxLineView
          Left = 71.811070000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line28: TfrxLineView
          Left = 228.346630000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 293.968770000000000000
          Top = 112.488250000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line30: TfrxLineView
          Left = 365.677490000000000000
          Top = 113.488250000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          Left = 575.386210000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          Left = 643.638220000000000000
          Top = 71.811070000000000000
          Height = 86.929190000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo86: TfrxMemoView
          Left = 7.559060000000000000
          Top = 98.267780000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #26412#21378#32534#21495#65306)
          ParentFont = False
        end
        object Memo87: TfrxMemoView
          Left = 7.559060000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            'SET   '#38271#65306)
          ParentFont = False
        end
        object Memo88: TfrxMemoView
          Left = 7.559060000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #24065'    '#31181#65306)
          ParentFont = False
        end
        object Memo89: TfrxMemoView
          Left = 75.590551180000000000
          Top = 96.488250000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'MANU_PART_NUMBER'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."MANU_PART_NUMBER"]')
          ParentFont = False
        end
        object Memo90: TfrxMemoView
          Left = 75.590551180000000000
          Top = 115.385900000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'SetW_A'
          DataSet = rptdsBP11
          DataSetName = 'dsBP11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP11."SetW_A"]')
          ParentFont = False
        end
        object Memo91: TfrxMemoView
          Left = 75.590551180000000000
          Top = 137.063080000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'curr_code'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."curr_code"]')
          ParentFont = False
        end
        object Memo92: TfrxMemoView
          Left = 154.960730000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#21517#31216#65306)
          ParentFont = False
        end
        object Memo93: TfrxMemoView
          Left = 154.960730000000000000
          Top = 95.488250000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#22411#21495#65306)
          ParentFont = False
        end
        object Memo94: TfrxMemoView
          Left = 154.960730000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            'SET   '#23485#65306)
          ParentFont = False
        end
        object Memo95: TfrxMemoView
          Left = 154.960730000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #19981#21547#31246#24179#31859#20215)
          ParentFont = False
        end
        object Memo96: TfrxMemoView
          Left = 230.551181100000000000
          Top = 74.811070000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          DataField = 'CUSTOMER_NAME'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."CUSTOMER_NAME"]')
          ParentFont = False
        end
        object Memo97: TfrxMemoView
          Left = 230.551181100000000000
          Top = 95.488250000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'MANU_PART_DESC'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."MANU_PART_DESC"]')
          ParentFont = False
        end
        object Memo98: TfrxMemoView
          Left = 230.551181100000000000
          Top = 115.385900000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'SetH_A'
          DataSet = rptdsBP11
          DataSetName = 'dsBP11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP11."SetH_A"]')
          ParentFont = False
        end
        object Memo99: TfrxMemoView
          Left = 502.677341100000000000
          Top = 116.385900000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataField = 'baojiadanwei'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."baojiadanwei"]')
          ParentFont = False
        end
        object Memo101: TfrxMemoView
          Left = 295.173470000000000000
          Top = 117.165430000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            'PCS'#25968'/SET'#65306)
          ParentFont = False
        end
        object Memo102: TfrxMemoView
          Left = 430.866420000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25253#20215#31867#22411#65306)
          ParentFont = False
        end
        object Memo104: TfrxMemoView
          Left = 368.102660000000000000
          Top = 117.385900000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'bPCSPerSet'
          DataSet = rptdsCustomField
          DataSetName = 'dsCustomField'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsCustomField."bPCSPerSet"]')
          ParentFont = False
        end
        object Memo105: TfrxMemoView
          Left = 502.677490000000000000
          Top = 140.063080000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'bBPType'
          DataSet = rptdsCustomField
          DataSetName = 'dsCustomField'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsCustomField."bBPType"]')
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 578.268090000000000000
          Top = 75.590600000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #19994#21153#20154#21592#65306)
          ParentFont = False
        end
        object Memo107: TfrxMemoView
          Left = 578.268090000000000000
          Top = 94.488250000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25253#20215#20154#21592#65306)
          ParentFont = False
        end
        object Memo108: TfrxMemoView
          Left = 578.268090000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #20135#21697#31867#22411#65306)
          ParentFont = False
        end
        object Memo109: TfrxMemoView
          Left = 578.268090000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #23454#38469#25253#20215#65306)
          ParentFont = False
        end
        object Memo110: TfrxMemoView
          Left = 642.519685040000000000
          Top = 73.811070000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'sale_man'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."sale_man"]')
          ParentFont = False
        end
        object Memo111: TfrxMemoView
          Left = 642.519685040000000000
          Top = 96.488250000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'create_man'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."create_man"]')
          ParentFont = False
        end
        object Memo112: TfrxMemoView
          Left = 642.519685040000000000
          Top = 119.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'BPName'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."BPName"]')
          ParentFont = False
        end
        object Memo113: TfrxMemoView
          Left = 642.519685040000000000
          Top = 141.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'hanshuijiage_Pcs'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."hanshuijiage_Pcs"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 7.559060000000000000
          Top = 162.519790000000000000
          Width = 461.102660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #27492#25253#20215#21333#20165#20869#37096#20351#29992','#23646#20844#21496#26426#23494','#19981#24471#22806#20256#21542#21017#36861#31350#30456#20851#36131#20219)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 427.086890000000000000
          Top = 113.385900000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          Left = 498.897960000000000000
          Top = 113.385900000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo40: TfrxMemoView
          Left = 430.866420000000000000
          Top = 117.165430000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25253#20215#21333#20301#65306)
          ParentFont = False
        end
        object Memo81: TfrxMemoView
          Left = 294.803340000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25240'  '#29575#65306)
          ParentFont = False
        end
        object Memo82: TfrxMemoView
          Left = 366.614410000000000000
          Top = 139.842610000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."jinglilv_add"]')
          ParentFont = False
        end
        object Memo83: TfrxMemoView
          Left = 230.551330000000000000
          Top = 139.842610000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'buhanshuijiage_M'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."buhanshuijiage_M"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 3.779530000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        DataSet = rptdsBP06
        DataSetName = 'dsBP06'
        RowCount = 0
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        Columns = 3
        ColumnWidth = 238.110236220472000000
        DataSet = rptdsBP10
        DataSetName = 'dsBP10'
        RowCount = 0
        object Shape2: TfrxShapeView
          Width = 238.110390000000000000
          Height = 22.677180000000000000
        end
        object Memo35: TfrxMemoView
          Left = 2.559060000000000000
          Top = 4.118120000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'PARAMETER_DESC'
          DataSet = rptdsBP10
          DataSetName = 'dsBP10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[dsBP10."PARAMETER_DESC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          Left = 139.606370000000000000
          Top = 3.118120000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'Param_Value'
          DataSet = rptdsBP10
          DataSetName = 'dsBP10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP10."Param_Value"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo37: TfrxMemoView
          Left = 202.315090000000000000
          Top = 3.000000000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataField = 'UNIT_CODE'
          DataSet = rptdsBP10
          DataSetName = 'dsBP10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsBP10."UNIT_CODE"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          Left = 136.842610000000000000
          Height = 22.677180000000000000
          Visible = False
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          Left = 200.315090000000000000
          Height = 22.677180000000000000
          Visible = False
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 28.456710000000000000
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        object Memo38: TfrxMemoView
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            #20840#23616#21442#25968)
          ParentFont = False
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 39.574830000000000000
        Top = 476.220780000000000000
        Width = 718.110700000000000000
        object Memo41: TfrxMemoView
          Left = 9.559060000000000000
          Top = 22.779530000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29289#26009#21517#31216)
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 93.826840000000000000
          Top = 23.779530000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20379#24212#21830)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 170.567100000000000000
          Top = 23.779530000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29289#26009#35268#26684)
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 341.307360000000000000
          Top = 23.779530000000000000
          Width = 90.708720000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29289#26009#28040#32791#20215#26684)
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 491.590910000000000000
          Top = 23.779530000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29992#37327'Pcs')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 559.181510000000000000
          Top = 23.779530000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #37329#39069'Pcs')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            #20027#35201#29289#26009'(RMB)')
          ParentFont = False
        end
        object Memo103: TfrxMemoView
          Left = 638.961040000000000000
          Top = 23.897650000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #37329#39069'/M')
          ParentFont = False
        end
        object Memo117: TfrxMemoView
          Left = 435.866420000000000000
          Top = 24.677180000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #37319#36141#21333#20301)
          ParentFont = False
        end
      end
      object DetailData2: TfrxDetailData
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 540.472790000000000000
        Width = 718.110700000000000000
        DataSet = rptdsBP08
        DataSetName = 'dsBP08'
        RowCount = 0
        object Shape3: TfrxShapeView
          Left = -0.220470000000000000
          Width = 718.110700000000000000
          Height = 34.015770000000000000
        end
        object Memo43: TfrxMemoView
          Left = 3.779530000000000000
          Top = 4.000000000000000000
          Width = 83.149660000000000000
          Height = 30.236240000000000000
          DataField = 'INV_NAME'
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."INV_NAME"]')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 169.283550000000000000
          Top = 4.000000000000000000
          Width = 188.976500000000000000
          Height = 30.236240000000000000
          DataField = 'INV_PART_DESCRIPTION'
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."INV_PART_DESCRIPTION"]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 360.512060000000000000
          Top = 7.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          DisplayFormat.FormatStr = '%2.5f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."MStdPrice"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo46: TfrxMemoView
          Left = 493.102660000000000000
          Top = 7.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          DisplayFormat.FormatStr = '%2.5f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."MUsePerPcs"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo47: TfrxMemoView
          Left = 90.708720000000000000
          Top = 4.000000000000000000
          Width = 71.811070000000000000
          Height = 30.236240000000000000
          DataField = 'ABBR_NAME'
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."ABBR_NAME"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 563.961040000000000000
          Top = 7.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          DisplayFormat.FormatStr = '%2.5f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."MUsePrice"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo114: TfrxMemoView
          Left = 634.961040000000000000
          Top = 7.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'MUsePrice_M'
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          DisplayFormat.FormatStr = '%2.5f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."MUsePrice_M"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo116: TfrxMemoView
          Left = 438.425480000000000000
          Top = 7.559060000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'Unit_Name'
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."Unit_Name"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 597.165740000000000000
        Width = 718.110700000000000000
        object Memo53: TfrxMemoView
          Left = 511.795610000000000000
          Top = 3.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'SumBp08UsePrice'
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."SumBp08UsePrice"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo54: TfrxMemoView
          Left = 431.645950000000000000
          Top = 2.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #21512#35745'RMB'#65306)
          ParentFont = False
        end
        object Memo115: TfrxMemoView
          Left = 613.063390000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP08
          DataSetName = 'dsBP08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP08."SumBp08UsePrice_M"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Height = 41.196862600000000000
        Top = 638.740570000000000000
        Width = 718.110700000000000000
        object Memo55: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            #24037#24207#25104#26412'(RMB)')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 11.118120000000000000
          Top = 22.299212600000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24037#24207#21517#31216)
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 100.724490000000000000
          Top = 22.299212600000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20027#26009#25104#26412'/P')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 187.771800000000000000
          Top = 22.299212600000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #36741#26009#25104#26412'/P')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 272.819110000000000000
          Top = 22.299212600000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20154#24037'/P')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 353.645950000000000000
          Top = 22.299212600000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #27700#30005'/P')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 429.252320000000000000
          Top = 22.299212600000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #25240#26087'/P')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 526.079160000000000000
          Top = 22.299212600000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24635#35745'/P')
          ParentFont = False
        end
        object Memo100: TfrxMemoView
          Left = 622.268090000000000000
          Top = 20.897650000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24635#35745'/M')
          ParentFont = False
        end
      end
      object DetailData4: TfrxDetailData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 702.992580000000000000
        Width = 718.110700000000000000
        DataSet = rptdsBP07
        DataSetName = 'dsBP07'
        RowCount = 0
        object Shape1: TfrxShapeView
          Left = -0.220470000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
        end
        object Memo63: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.000000000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'DEPT_NAME'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."DEPT_NAME"]')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          Left = 99.944960000000000000
          Top = 3.000000000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'P1'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P1"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo65: TfrxMemoView
          Left = 185.992270000000000000
          Top = 3.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'P2'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P2"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo66: TfrxMemoView
          Left = 271.039580000000000000
          Top = 3.000000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'P3'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P3"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo67: TfrxMemoView
          Left = 350.866420000000000000
          Top = 3.000000000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataField = 'P4'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P4"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo68: TfrxMemoView
          Left = 429.252320000000000000
          Top = 3.000000000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'P5'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."P5"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo69: TfrxMemoView
          Left = 518.520100000000000000
          Top = 3.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'AllP'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."AllP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo118: TfrxMemoView
          Left = 616.063390000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'AllP_M'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."AllP_M"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Height = 109.606370000000000000
        Top = 748.346940000000000000
        Width = 718.110700000000000000
        object Memo70: TfrxMemoView
          Left = 11.338590000000000000
          Top = 3.000000000000000000
          Width = 64.252010000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #21512#35745'RMB'#65306)
          ParentFont = False
        end
        object Memo71: TfrxMemoView
          Left = 100.944960000000000000
          Top = 4.000000000000000000
          Width = 68.031540000000000000
          Height = 15.118120000000000000
          DataField = 'SumP1'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP1"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo72: TfrxMemoView
          Left = 190.992270000000000000
          Top = 4.000000000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          DataField = 'SumP2'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP2"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo73: TfrxMemoView
          Left = 268.260050000000000000
          Top = 4.000000000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'SumP3'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP3"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo74: TfrxMemoView
          Left = 330.968770000000000000
          Top = 4.000000000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          DataField = 'SumP4'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP4"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo75: TfrxMemoView
          Left = 395.236550000000000000
          Top = 4.000000000000000000
          Width = 49.133890000000000000
          Height = 15.118120000000000000
          DataField = 'SumP5'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumP5"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo76: TfrxMemoView
          Left = 514.520100000000000000
          Top = 4.000000000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          DataField = 'SumAllP'
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumAllP"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo119: TfrxMemoView
          Left = 616.063390000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP07
          DataSetName = 'dsBP07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP07."SumAllP_M"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo120: TfrxMemoView
          Left = 3.779530000000000000
          Top = 49.133890000000000000
          Width = 710.551640000000000000
          Height = 52.913420000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object Memo121: TfrxMemoView
          Left = 3.779530000000000000
          Top = 27.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #22791#27880#65306)
          ParentFont = False
        end
      end
      object Footer3: TfrxFooter
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 907.087200000000000000
        Width = 718.110700000000000000
        object Shape4: TfrxShapeView
          Left = 1.779530000000000000
          Top = 36.118120000000000000
          Width = 714.331170000000000000
          Height = 45.354360000000000000
        end
        object Memo7: TfrxMemoView
          Left = 45.456710000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #20027#26009#25104#26412)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 121.047310000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #21046#36896#25104#26412)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 192.858380000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24635#25104#26412)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 253.330860000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #25253#24223#29575)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 310.023810000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Visible = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #38144#21806#25240#25187)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 378.055350000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #25240#29575)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 430.968770000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #22686#20540#31246)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 483.882190000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #24065#31181)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 555.693260000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #21547#31246#20215)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 623.724800000000000000
          Top = 18.897650000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #19981#21547#31246#20215)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            'PCS')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Top = 55.252010000000500000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #24179#31859)
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 45.354360000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'P1P2_Pcs'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."P1P2_Pcs"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 45.354360000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'P1P2_M'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."P1P2_M"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 120.944960000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'P3P4P5_Pcs'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."P3P4P5_Pcs"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 120.944960000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'P3P4P5_M'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."P3P4P5_M"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 192.756030000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[<dsBP06."P1P2P3P4P5_M"> + <dsBP06."baofei_cost_M">]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo25: TfrxMemoView
          Left = 257.008040000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."baofeilv"]%')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 257.008040000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."baofeilv"]%')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 309.921460000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."xiaoshouzhekou"]%')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 309.921460000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."xiaoshouzhekou"]%')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 374.173470000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."jinglilv_add"]%')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 374.173470000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."jinglilv_add"]%')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 439.866420000000000000
          Top = 37.795300000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."zengzhishui_add"]%')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 439.866420000000000000
          Top = 56.692950000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."zengzhishui_add"]%')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 483.779840000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'curr_code'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."curr_code"]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 483.779840000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'curr_code'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."curr_code"]')
          ParentFont = False
        end
        object Memo77: TfrxMemoView
          Left = 555.590910000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'hanshuijiage_Pcs'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."hanshuijiage_Pcs"]')
          ParentFont = False
        end
        object Memo78: TfrxMemoView
          Left = 555.590910000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'hanshuijiage_M'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."hanshuijiage_M"]')
          ParentFont = False
        end
        object Memo79: TfrxMemoView
          Left = 623.622450000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'buhanshuijiage_Pcs'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."buhanshuijiage_Pcs"]')
          ParentFont = False
        end
        object Memo80: TfrxMemoView
          Left = 623.622450000000000000
          Top = 56.692950000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'buhanshuijiage_M'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[dsBP06."buhanshuijiage_M"]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            #26368#32456#25253#20215)
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 192.756030000000000000
          Top = 37.795300000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[<dsBP06."P1P2P3P4P5_pcs"> + <dsBP06."baofei_cost_pcs">]')
          ParentFont = False
        end
      end
      object DetailData5: TfrxDetailData
        FillType = ftBrush
        Height = 3.779530000000000000
        Top = 880.630490000000000000
        Width = 718.110700000000000000
        DataSet = rptdsBP06
        DataSetName = 'dsBP06'
        RowCount = 0
      end
      object DetailData3: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 430.866420000000000000
        Width = 718.110700000000000000
        Columns = 3
        ColumnWidth = 238.110236220472000000
        DataSet = frxDBBP09
        DataSetName = 'frxDBBP09'
        RowCount = 0
        object Memo122: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.897650000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'PARAMETER_DESC'
          DataSet = frxDBBP09
          DataSetName = 'frxDBBP09'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBBP09."PARAMETER_DESC"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo123: TfrxMemoView
          Left = 140.826840000000000000
          Top = 2.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'Param_Value'
          DataSet = frxDBBP09
          DataSetName = 'frxDBBP09'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBBP09."Param_Value"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object Header4: TfrxHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 385.512060000000000000
        Width = 718.110700000000000000
        object Memo124: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8W = (
            #24037#24207#21442#25968)
          ParentFont = False
        end
      end
      object DetailData6: TfrxDetailData
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 1016.693570000000000000
        Width = 718.110700000000000000
        DataSet = rptdsBP06
        DataSetName = 'dsBP06'
        RowCount = 0
        object Picture2: TfrxPictureView
          Left = 11.338590000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          AutoSize = True
          DataField = 'YaHeImg'
          DataSet = rptdsBP06
          DataSetName = 'dsBP06'
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
    end
  end
  object rptds493: TfrxDBDataset
    UserName = 'ds493'
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
    DataSource = ds493
    BCDToCurrency = False
    Left = 149
    Top = 48
  end
  object cds493: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 48
    object strngfldcds493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object strngfldcds493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object strngfldcds493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object strngfldcds493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object blbfldcds493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object strngfldcds493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object strngfldcds493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object strngfldcds493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object strngfldcds493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object ds493: TDataSource
    DataSet = cds493
    Left = 96
    Top = 48
  end
  object cdsBP06: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 112
    object strngfldBP06IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP06BPNO: TStringField
      FieldName = 'BPNO'
      Size = 50
    end
    object dtmfldBP06BPTime: TDateTimeField
      FieldName = 'BPTime'
    end
    object intgrfldBP06EnableDays: TIntegerField
      FieldName = 'EnableDays'
    end
    object intgrfldBP06D10_Ptr: TIntegerField
      FieldName = 'D10_Ptr'
    end
    object intgrfldBP06D25_Ptr: TIntegerField
      FieldName = 'D25_Ptr'
    end
    object intgrfldBP06Layers: TIntegerField
      FieldName = 'Layers'
    end
    object cdsBP06Thickness: TFMTBCDField
      FieldName = 'Thickness'
      Precision = 18
      Size = 5
    end
    object intgrfldBP06D264_ptr: TIntegerField
      FieldName = 'D264_ptr'
    end
    object strngfldBP06BP00_Ptr: TStringField
      FieldName = 'BP00_Ptr'
      FixedChar = True
      Size = 38
    end
    object intgrfldBP06D01_Ptr: TIntegerField
      FieldName = 'D01_Ptr'
    end
    object cdsBP06CurRate: TFMTBCDField
      FieldName = 'CurRate'
      Precision = 18
      Size = 5
    end
    object strngfldBP06ORIG_CUSTOMER: TStringField
      FieldName = 'ORIG_CUSTOMER'
      Size = 50
    end
    object strngfldBP06payment: TStringField
      FieldName = 'payment'
      Size = 50
    end
    object intgrfldBP06SaleMan: TIntegerField
      FieldName = 'SaleMan'
    end
    object intgrfldBP06CreateMan: TIntegerField
      FieldName = 'CreateMan'
    end
    object dtmfldBP06CreateTime: TDateTimeField
      FieldName = 'CreateTime'
    end
    object cdsBP06YaHeTxt: TMemoField
      FieldName = 'YaHeTxt'
      BlobType = ftMemo
    end
    object cdsBP06YaHeImg: TBlobField
      FieldName = 'YaHeImg'
    end
    object intgrfldBP06Seqno: TIntegerField
      FieldName = 'Seqno'
    end
    object cdsBP06P1P2_Pcs: TFMTBCDField
      FieldName = 'P1P2_Pcs'
      Precision = 18
    end
    object cdsBP06P3P4P5_Pcs: TFMTBCDField
      FieldName = 'P3P4P5_Pcs'
      Precision = 18
    end
    object cdsBP06P1P2P3P4P5_Pcs: TFMTBCDField
      FieldName = 'P1P2P3P4P5_Pcs'
      Precision = 18
    end
    object cdsBP06P1P2_M: TFMTBCDField
      FieldName = 'P1P2_M'
      Precision = 18
    end
    object cdsBP06P3P4P5_M: TFMTBCDField
      FieldName = 'P3P4P5_M'
      Precision = 18
    end
    object cdsBP06P1P2P3P4P5_M: TFMTBCDField
      FieldName = 'P1P2P3P4P5_M'
      Precision = 18
    end
    object cdsBP06baofeilv: TFMTBCDField
      FieldName = 'baofeilv'
      Precision = 18
      Size = 5
    end
    object cdsBP06xiaoshouzhekou: TFMTBCDField
      FieldName = 'xiaoshouzhekou'
      Precision = 18
      Size = 5
    end
    object cdsBP06buhanshuijiage_Pcs: TFMTBCDField
      FieldName = 'buhanshuijiage_Pcs'
      Precision = 18
    end
    object cdsBP06hanshuijiage_Pcs: TFMTBCDField
      FieldName = 'hanshuijiage_Pcs'
      Precision = 18
    end
    object cdsBP06buhanshuijiage_M: TFMTBCDField
      FieldName = 'buhanshuijiage_M'
      Precision = 18
    end
    object cdsBP06hanshuijiage_M: TFMTBCDField
      FieldName = 'hanshuijiage_M'
      Precision = 18
    end
    object cdsBP06baofei_cost_pcs: TFMTBCDField
      FieldName = 'baofei_cost_pcs'
      Precision = 18
    end
    object cdsBP06baofei_cost_M: TFMTBCDField
      FieldName = 'baofei_cost_M'
      Precision = 18
    end
    object cdsBP06yunshu_cost_calcret: TFMTBCDField
      FieldName = 'yunshu_cost_calcret'
      Precision = 18
    end
    object cdsBP06yunshu_cost_pcs: TFMTBCDField
      FieldName = 'yunshu_cost_pcs'
      Precision = 18
    end
    object cdsBP06yunshu_cost_M: TFMTBCDField
      FieldName = 'yunshu_cost_M'
      Precision = 18
    end
    object cdsBP06xiaoshou_cost_calcret: TFMTBCDField
      FieldName = 'xiaoshou_cost_calcret'
      Precision = 18
    end
    object cdsBP06xiaoshou_cost_pcs: TFMTBCDField
      FieldName = 'xiaoshou_cost_pcs'
      Precision = 18
    end
    object cdsBP06xiaoshou_cost_M: TFMTBCDField
      FieldName = 'xiaoshou_cost_M'
      Precision = 18
    end
    object cdsBP06caiwu_cost_calcret: TFMTBCDField
      FieldName = 'caiwu_cost_calcret'
      Precision = 18
    end
    object cdsBP06caiwu_cost_pcs: TFMTBCDField
      FieldName = 'caiwu_cost_pcs'
      Precision = 18
    end
    object cdsBP06caiwu_cost_M: TFMTBCDField
      FieldName = 'caiwu_cost_M'
      Precision = 18
    end
    object cdsBP06guanli_cost_calcret: TFMTBCDField
      FieldName = 'guanli_cost_calcret'
      Precision = 18
    end
    object cdsBP06guanli_cost_pcs: TFMTBCDField
      FieldName = 'guanli_cost_pcs'
      Precision = 18
    end
    object cdsBP06guanli_cost_M: TFMTBCDField
      FieldName = 'guanli_cost_M'
      Precision = 18
    end
    object cdsBP06zhekou_cost_pcs: TFMTBCDField
      FieldName = 'zhekou_cost_pcs'
      Precision = 18
    end
    object cdsBP06zhekou_cost_M: TFMTBCDField
      FieldName = 'zhekou_cost_M'
      Precision = 18
    end
    object cdsBP06AllCost_PCS: TFMTBCDField
      FieldName = 'AllCost_PCS'
      Precision = 18
    end
    object cdsBP06AllCost_M: TFMTBCDField
      FieldName = 'AllCost_M'
      Precision = 18
    end
    object cdsBP06maolilv_add: TFMTBCDField
      FieldName = 'maolilv_add'
      Precision = 18
      Size = 5
    end
    object cdsBP06zengzhishui_add: TFMTBCDField
      FieldName = 'zengzhishui_add'
      Precision = 18
      Size = 5
    end
    object cdsBP06chanpinyongtu_add: TFMTBCDField
      FieldName = 'chanpinyongtu_add'
      Precision = 18
      Size = 5
    end
    object cdsBP06xiaoshouquyu_add: TFMTBCDField
      FieldName = 'xiaoshouquyu_add'
      Precision = 18
      Size = 5
    end
    object cdsBP06dingdanshuliang_add: TFMTBCDField
      FieldName = 'dingdanshuliang_add'
      Precision = 18
      Size = 5
    end
    object intgrfldBP06AuthStatus: TIntegerField
      FieldName = 'AuthStatus'
    end
    object cdsBP06jinglilv_add: TFMTBCDField
      FieldName = 'jinglilv_add'
      Precision = 18
      Size = 5
    end
    object strngfldBP06CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 512
    end
    object strngfldBP06sale_man: TStringField
      FieldName = 'sale_man'
      Size = 16
    end
    object strngfldBP06MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object strngfldBP06MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 512
    end
    object strngfldBP06ANALYSIS_CODE_3: TStringField
      FieldName = 'ANALYSIS_CODE_3'
      Size = 50
    end
    object strngfldBP06create_man: TStringField
      FieldName = 'create_man'
      Size = 16
    end
    object cdsBP06set_lngth: TBCDField
      FieldName = 'set_lngth'
      Precision = 7
      Size = 3
    end
    object cdsBP06set_width: TBCDField
      FieldName = 'set_width'
      Precision = 7
      Size = 3
    end
    object cdsBP06BPName: TWideStringField
      FieldName = 'BPName'
      Size = 50
    end
    object strngfldBP06baojiadanwei: TStringField
      FieldName = 'baojiadanwei'
      ReadOnly = True
      Size = 3
    end
    object strngfldBP06CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object strngfldBP06ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 512
    end
    object cdsBP06beizhu: TStringField
      FieldName = 'beizhu'
      Size = 2048
    end
  end
  object dsBP06: TDataSource
    DataSet = cdsBP06
    Left = 96
    Top = 112
  end
  object rptdsBP06: TfrxDBDataset
    UserName = 'dsBP06'
    CloseDataSource = False
    FieldAliases.Strings = (
      'IDKey=IDKey'
      'BPNO=BPNO'
      'BPTime=BPTime'
      'EnableDays=EnableDays'
      'D10_Ptr=D10_Ptr'
      'D25_Ptr=D25_Ptr'
      'Layers=Layers'
      'Thickness=Thickness'
      'D264_ptr=D264_ptr'
      'BP00_Ptr=BP00_Ptr'
      'D01_Ptr=D01_Ptr'
      'CurRate=CurRate'
      'ORIG_CUSTOMER=ORIG_CUSTOMER'
      'payment=payment'
      'SaleMan=SaleMan'
      'CreateMan=CreateMan'
      'CreateTime=CreateTime'
      'YaHeTxt=YaHeTxt'
      'YaHeImg=YaHeImg'
      'Seqno=Seqno'
      'P1P2_Pcs=P1P2_Pcs'
      'P3P4P5_Pcs=P3P4P5_Pcs'
      'P1P2P3P4P5_Pcs=P1P2P3P4P5_Pcs'
      'P1P2_M=P1P2_M'
      'P3P4P5_M=P3P4P5_M'
      'P1P2P3P4P5_M=P1P2P3P4P5_M'
      'baofeilv=baofeilv'
      'xiaoshouzhekou=xiaoshouzhekou'
      'buhanshuijiage_Pcs=buhanshuijiage_Pcs'
      'hanshuijiage_Pcs=hanshuijiage_Pcs'
      'buhanshuijiage_M=buhanshuijiage_M'
      'hanshuijiage_M=hanshuijiage_M'
      'baofei_cost_pcs=baofei_cost_pcs'
      'baofei_cost_M=baofei_cost_M'
      'yunshu_cost_calcret=yunshu_cost_calcret'
      'yunshu_cost_pcs=yunshu_cost_pcs'
      'yunshu_cost_M=yunshu_cost_M'
      'xiaoshou_cost_calcret=xiaoshou_cost_calcret'
      'xiaoshou_cost_pcs=xiaoshou_cost_pcs'
      'xiaoshou_cost_M=xiaoshou_cost_M'
      'caiwu_cost_calcret=caiwu_cost_calcret'
      'caiwu_cost_pcs=caiwu_cost_pcs'
      'caiwu_cost_M=caiwu_cost_M'
      'guanli_cost_calcret=guanli_cost_calcret'
      'guanli_cost_pcs=guanli_cost_pcs'
      'guanli_cost_M=guanli_cost_M'
      'zhekou_cost_pcs=zhekou_cost_pcs'
      'zhekou_cost_M=zhekou_cost_M'
      'AllCost_PCS=AllCost_PCS'
      'AllCost_M=AllCost_M'
      'maolilv_add=maolilv_add'
      'zengzhishui_add=zengzhishui_add'
      'chanpinyongtu_add=chanpinyongtu_add'
      'xiaoshouquyu_add=xiaoshouquyu_add'
      'dingdanshuliang_add=dingdanshuliang_add'
      'AuthStatus=AuthStatus'
      'jinglilv_add=jinglilv_add'
      'CUSTOMER_NAME=CUSTOMER_NAME'
      'sale_man=sale_man'
      'MANU_PART_NUMBER=MANU_PART_NUMBER'
      'MANU_PART_DESC=MANU_PART_DESC'
      'ANALYSIS_CODE_3=ANALYSIS_CODE_3'
      'create_man=create_man'
      'set_lngth=set_lngth'
      'set_width=set_width'
      'BPName=BPName'
      'baojiadanwei=baojiadanwei'
      'CURR_CODE=curr_code'
      'ANALYSIS_CODE_2=ANALYSIS_CODE_2'
      'beizhu=beizhu')
    DataSource = dsBP06
    BCDToCurrency = False
    Left = 149
    Top = 112
  end
  object cdsB10: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 168
    object strngfldB10PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      Size = 0
    end
    object strngfldB10Param_Value: TStringField
      FieldName = 'Param_Value'
    end
    object strngfldB10UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
    end
  end
  object dsBP10: TDataSource
    DataSet = cdsB10
    Left = 96
    Top = 168
  end
  object rptdsBP10: TfrxDBDataset
    UserName = 'dsBP10'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PARAMETER_DESC=PARAMETER_DESC'
      'Param_Value=Param_Value'
      'UNIT_CODE=UNIT_CODE')
    DataSource = dsBP10
    BCDToCurrency = False
    Left = 149
    Top = 168
  end
  object cdsBP08: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 56
    Top = 224
    object strngfldBP08GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object strngfldBP08INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object strngfldBP08INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object fmtbcdfldBP08MStdPrice: TFMTBCDField
      FieldName = 'MStdPrice'
      Precision = 18
      Size = 10
    end
    object fmtbcdfldBP08MUsePerPcs: TFMTBCDField
      FieldName = 'MUsePerPcs'
      Precision = 18
      Size = 10
    end
    object fmtbcdfldBP08MUsePrice: TFMTBCDField
      FieldName = 'MUsePrice'
      Precision = 18
      Size = 10
    end
    object strngfldBP08ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object cdsBP08MUsePrice_M: TFMTBCDField
      FieldName = 'MUsePrice_M'
      Precision = 18
      Size = 10
    end
    object cdsBP08Unit_Name: TStringField
      FieldName = 'Unit_Name'
      Size = 30
    end
    object agrgtfldBP08SumBp08UsePrice: TAggregateField
      FieldName = 'SumBp08UsePrice'
      Active = True
      DisplayName = ''
      Expression = 'sum(museprice)'
    end
    object cdsBP08SumBp08UserPrice_M: TAggregateField
      FieldName = 'SumBp08UsePrice_M'
      Active = True
      DisplayName = ''
      Expression = 'sum(museprice_m)'
    end
  end
  object dsBP08: TDataSource
    DataSet = cdsBP08
    Left = 96
    Top = 224
  end
  object rptdsBP08: TfrxDBDataset
    UserName = 'dsBP08'
    CloseDataSource = False
    FieldAliases.Strings = (
      'GROUP_DESC=GROUP_DESC'
      'INV_NAME=INV_NAME'
      'INV_PART_DESCRIPTION=INV_PART_DESCRIPTION'
      'MStdPrice=MStdPrice'
      'MUsePerPcs=MUsePerPcs'
      'MUsePrice=MUsePrice'
      'ABBR_NAME=ABBR_NAME'
      'MUsePrice_M=MUsePrice_M'
      'Unit_Name=Unit_Name'
      'SumBp08UsePrice=SumBp08UsePrice'
      'SumBp08UsePrice_M=SumBp08UsePrice_M')
    DataSource = dsBP08
    BCDToCurrency = False
    Left = 152
    Top = 224
  end
  object cdsBP11: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 280
    object strngfldBP11IDKey: TStringField
      FieldName = 'IDKey'
      FixedChar = True
      Size = 38
    end
    object strngfldBP11BP06_ptr: TStringField
      FieldName = 'BP06_ptr'
      FixedChar = True
      Size = 38
    end
    object fmtbcdfldBP11SheetW: TFMTBCDField
      FieldName = 'SheetW'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SheetH: TFMTBCDField
      FieldName = 'SheetH'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SetW_A: TFMTBCDField
      FieldName = 'SetW_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SetH_A: TFMTBCDField
      FieldName = 'SetH_A'
      Precision = 18
      Size = 5
    end
    object intgrfldBP11PnlCount_A: TIntegerField
      FieldName = 'PnlCount_A'
    end
    object fmtbcdfldBP11PnlW_A: TFMTBCDField
      FieldName = 'PnlW_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlH_A: TFMTBCDField
      FieldName = 'PnlH_A'
      Precision = 18
      Size = 5
    end
    object intgrfldBP11SetCountPerPnl_A: TIntegerField
      FieldName = 'SetCountPerPnl_A'
    end
    object fmtbcdfldBP11SetHorSapce_A: TFMTBCDField
      FieldName = 'SetHorSapce_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SetVerSapce_A: TFMTBCDField
      FieldName = 'SetVerSapce_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlLeftRightBorderW_A: TFMTBCDField
      FieldName = 'PnlLeftRightBorderW_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlTopBottomBorderW_A: TFMTBCDField
      FieldName = 'PnlTopBottomBorderW_A'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11SheetUseage: TFMTBCDField
      FieldName = 'SheetUseage'
      Precision = 18
      Size = 5
    end
    object intgrfldBP11PnlCount_B: TIntegerField
      FieldName = 'PnlCount_B'
    end
    object fmtbcdfldBP11PnlW_B: TFMTBCDField
      FieldName = 'PnlW_B'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlH_B: TFMTBCDField
      FieldName = 'PnlH_B'
      Precision = 18
      Size = 5
    end
    object intgrfldBP11SetCountPerPnl_B: TIntegerField
      FieldName = 'SetCountPerPnl_B'
    end
    object fmtbcdfldBP11PnlLeftRightBorderW_B: TFMTBCDField
      FieldName = 'PnlLeftRightBorderW_B'
      Precision = 18
      Size = 5
    end
    object fmtbcdfldBP11PnlTopBottomBorderW_B: TFMTBCDField
      FieldName = 'PnlTopBottomBorderW_B'
      Precision = 18
      Size = 5
    end
    object blbfldBP11SheetImg: TBlobField
      FieldName = 'SheetImg'
    end
    object blbfldBP11PnlAImg: TBlobField
      FieldName = 'PnlAImg'
    end
    object blbfldBP11PnlBImg: TBlobField
      FieldName = 'PnlBImg'
    end
  end
  object dsBP11: TDataSource
    DataSet = cdsBP11
    Left = 96
    Top = 280
  end
  object rptdsBP11: TfrxDBDataset
    UserName = 'dsBP11'
    CloseDataSource = False
    FieldAliases.Strings = (
      'IDKey=IDKey'
      'BP06_ptr=BP06_ptr'
      'SheetW=SheetW'
      'SheetH=SheetH'
      'SetW_A=SetW_A'
      'SetH_A=SetH_A'
      'PnlCount_A=PnlCount_A'
      'PnlW_A=PnlW_A'
      'PnlH_A=PnlH_A'
      'SetCountPerPnl_A=SetCountPerPnl_A'
      'SetHorSapce_A=SetHorSapce_A'
      'SetVerSapce_A=SetVerSapce_A'
      'PnlLeftRightBorderW_A=PnlLeftRightBorderW_A'
      'PnlTopBottomBorderW_A=PnlTopBottomBorderW_A'
      'SheetUseage=SheetUseage'
      'PnlCount_B=PnlCount_B'
      'PnlW_B=PnlW_B'
      'PnlH_B=PnlH_B'
      'SetCountPerPnl_B=SetCountPerPnl_B'
      'PnlLeftRightBorderW_B=PnlLeftRightBorderW_B'
      'PnlTopBottomBorderW_B=PnlTopBottomBorderW_B'
      'SheetImg=SheetImg'
      'PnlAImg=PnlAImg'
      'PnlBImg=PnlBImg')
    DataSource = dsBP11
    BCDToCurrency = False
    Left = 152
    Top = 280
  end
  object cdsBP07: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 56
    Top = 336
    object strngfldBP07DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object fmtbcdfldBP07P1: TFMTBCDField
      FieldName = 'P1'
      Precision = 18
    end
    object fmtbcdfldBP07P2: TFMTBCDField
      FieldName = 'P2'
      Precision = 18
    end
    object fmtbcdfldBP07P3: TFMTBCDField
      FieldName = 'P3'
      Precision = 18
    end
    object fmtbcdfldBP07P4: TFMTBCDField
      FieldName = 'P4'
      Precision = 18
    end
    object fmtbcdfldBP07P5: TFMTBCDField
      FieldName = 'P5'
      Precision = 18
    end
    object fmtbcdfldBP07AllP: TFMTBCDField
      FieldName = 'AllP'
      Precision = 18
    end
    object cdsBP07AllP_M: TFMTBCDField
      FieldName = 'AllP_M'
    end
    object agrgtfldBP07SumP1: TAggregateField
      FieldName = 'SumP1'
      Active = True
      DisplayName = ''
      Expression = 'sum(p1)'
    end
    object agrgtfldBP07SumP2: TAggregateField
      FieldName = 'SumP2'
      Active = True
      DisplayName = ''
      Expression = 'sum(p2)'
    end
    object agrgtfldBP07SumP3: TAggregateField
      FieldName = 'SumP3'
      Active = True
      DisplayName = ''
      Expression = 'sum(p3)'
    end
    object agrgtfldBP07SumP4: TAggregateField
      FieldName = 'SumP4'
      Active = True
      DisplayName = ''
      Expression = 'sum(p4)'
    end
    object agrgtfldBP07SumP5: TAggregateField
      FieldName = 'SumP5'
      Active = True
      DisplayName = ''
      Expression = 'sum(p5)'
    end
    object agrgtfldBP07SumAllP: TAggregateField
      FieldName = 'SumAllP'
      Active = True
      DisplayName = ''
      Expression = 'sum(AllP)'
    end
    object cdsBP07SumAllP_M: TAggregateField
      FieldName = 'SumAllP_M'
      Active = True
      DisplayName = ''
      Expression = 'sum(AllP_M)'
    end
  end
  object dsBP07: TDataSource
    DataSet = cdsBP07
    Left = 96
    Top = 336
  end
  object rptdsBP07: TfrxDBDataset
    UserName = 'dsBP07'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DEPT_NAME=DEPT_NAME'
      'P1=P1'
      'P2=P2'
      'P3=P3'
      'P4=P4'
      'P5=P5'
      'AllP=AllP'
      'AllP_M=AllP_M'
      'SumP1=SumP1'
      'SumP2=SumP2'
      'SumP3=SumP3'
      'SumP4=SumP4'
      'SumP5=SumP5'
      'SumAllP=SumAllP'
      'SumAllP_M=SumAllP_M')
    DataSource = dsBP07
    BCDToCurrency = False
    Left = 152
    Top = 336
  end
  object cdsCustomField: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 392
    object strngfldCustomFieldbPCSPerSet: TStringField
      FieldName = 'bPCSPerSet'
    end
    object strngfldCustomFieldbBPType: TStringField
      FieldName = 'bBPType'
      Size = 128
    end
    object cdsCustomFieldbSurface: TStringField
      FieldName = 'bSurface'
    end
  end
  object dsCustomField: TDataSource
    DataSet = cdsCustomField
    Left = 96
    Top = 392
  end
  object rptdsCustomField: TfrxDBDataset
    UserName = 'dsCustomField'
    CloseDataSource = False
    FieldAliases.Strings = (
      'bPCSPerSet=bPCSPerSet'
      'bBPType=bBPType'
      'bSurface=bSurface')
    DataSource = dsCustomField
    BCDToCurrency = False
    Left = 152
    Top = 392
  end
  object cdsBP09: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 232
    object cdsBP09DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 50
    end
    object cdsBP09PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 100
    end
    object cdsBP09PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      Size = 100
    end
    object cdsBP09Param_Value: TStringField
      FieldName = 'Param_Value'
      Size = 100
    end
  end
  object dsBP09: TDataSource
    DataSet = cdsBP09
    Left = 328
    Top = 232
  end
  object frxDBBP09: TfrxDBDataset
    UserName = 'frxDBBP09'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DEPT_NAME=DEPT_NAME'
      'PARAMETER_NAME=PARAMETER_NAME'
      'PARAMETER_DESC=PARAMETER_DESC'
      'Param_Value=Param_Value')
    DataSource = dsBP09
    BCDToCurrency = False
    Left = 392
    Top = 232
  end
end
