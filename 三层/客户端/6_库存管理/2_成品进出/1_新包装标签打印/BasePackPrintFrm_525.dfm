inherited frmBasePackPrint_525: TfrmBasePackPrint_525
  Caption = 'frmBasePackPrint_525'
  ClientHeight = 634
  ClientWidth = 1064
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 1080
  ExplicitHeight = 673
  PixelsPerInch = 96
  TextHeight = 13
  object pnlDisplay: TPanel
    Left = 0
    Top = 0
    Width = 1064
    Height = 634
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 393
      Top = 1
      Width = 670
      Height = 632
      Align = alClient
      TabOrder = 0
      object pnl4: TPanel
        Left = 1
        Top = 1
        Width = 668
        Height = 35
        Align = alTop
        TabOrder = 0
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 392
      Height = 632
      Align = alLeft
      TabOrder = 1
      object vePackInfo: TValueListEditor
        Left = 1
        Top = 96
        Width = 390
        Height = 535
        Align = alClient
        KeyOptions = [keyUnique]
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goEditing, goTabs, goAlwaysShowEditor, goThumbTracking]
        Strings.Strings = (
          '=')
        TabOrder = 0
        TitleCaptions.Strings = (
          #26631#39064
          #20869#23481)
        OnDrawCell = vePackInfoDrawCell
        OnEditButtonClick = vePackInfoEditButtonClick
        ColWidths = (
          108
          276)
      end
      object pnl3: TPanel
        Left = 1
        Top = 55
        Width = 390
        Height = 41
        Align = alTop
        TabOrder = 1
        object lbl1: TLabel
          Left = 148
          Top = 6
          Width = 25
          Height = 24
          Caption = #24352
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 236
          Top = 9
          Width = 39
          Height = 24
          Caption = 'PCS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object btnPrintTag: TButton
          Left = 4
          Top = 3
          Width = 89
          Height = 33
          Caption = #25171#21360
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = btnPrintTagClick
        end
        object edtCreateNum: TRzNumericEdit
          Left = 97
          Top = 4
          Width = 46
          Height = 32
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          ParentFont = False
          TabOrder = 1
          DisplayFormat = ',0;(,0)'
          Value = 1.000000000000000000
        end
        object edtMaxPCSNum: TRzNumericEdit
          Left = 185
          Top = 4
          Width = 46
          Height = 32
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -24
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          ParentFont = False
          TabOrder = 2
          Visible = False
          DisplayFormat = ',0;(,0)'
          Value = 1.000000000000000000
        end
      end
      object pnlScanWO: TPanel
        Left = 1
        Top = 1
        Width = 390
        Height = 27
        Align = alTop
        TabOrder = 2
        object lbl2: TLabel
          Left = 8
          Top = 5
          Width = 80
          Height = 15
          Caption = #25195#25551#24037#21333#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtWOBar: TEdit
          Left = 88
          Top = 2
          Width = 273
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          ParentFont = False
          TabOrder = 0
          OnKeyPress = edtWOBarKeyPress
        end
      end
      object pnlPackIDScan: TPanel
        Left = 1
        Top = 28
        Width = 390
        Height = 27
        Align = alTop
        TabOrder = 3
        Visible = False
        object lbl3: TLabel
          Left = 8
          Top = 5
          Width = 98
          Height = 15
          Caption = #25195#25551#20869#31665'ID'#65306
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtScanPackID: TEdit
          Left = 112
          Top = 2
          Width = 249
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          ImeName = #20013#25991'('#31616#20307') - '#24517#24212' Bing '#36755#20837#27861
          ParentFont = False
          TabOrder = 0
          OnKeyPress = edtScanPackIDKeyPress
        end
      end
    end
  end
  object cdsPackType: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 368
  end
  object cdsPrintDetail: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 280
  end
  object cdsPrintMain: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 336
  end
  object cdsPrinter: TClientDataSet
    Aggregates = <>
    CommandText = 
      ';DECLARE @T TABLE (ParamID int NOT NULL PRIMARY KEY, ParamName v' +
      'archar(100));'#13#10'INSERT INTO @T '#13#10'SELECT ParamID,ParamName from Pa' +
      'ck_PrintTypeDef WHERE PackID = :PPackID;'#13#10'DECLARE @SQL NVARCHAR(' +
      '4000)'#13#10'SET @SQL = N'#39#39';'#13#10#13#10'SET @SQL = STUFF((SELECT N'#39','#39' + '#39'MIN(C' +
      'ASE ParamID WHEN '#39' + CAST(ParamID AS VARCHAR(10)) + '#39' THEN Param' +
      'Value END) AS '#39' + QUOTENAME(ParamName) FROM @T'#13#10' FOR XML PATH('#39#39 +
      ')),1,1,N'#39#39')'#13#10' '#13#10'SET @SQL = '#39'SELECT PM.Rkey AS ['#26631#31614'ID],PM.FLowNo A' +
      'S ['#27969#27700#21495'],MAX(PM.PrintTime) AS ['#25171#21360#26085#26399'], '#39' + @SQL + '#39' FROM Pack_Prin' +
      'tMain PM inner JOIN Pack_PrintDetail PD ON PM.IDKey = PD.MainIDk' +
      'ey WHERE PM.IDKEY IN :PIDkey GROUP BY PM.Rkey,PM.FlowNo '#39#13#10'EXEC ' +
      'SP_EXECUTESQL @SQL'
    Params = <
      item
        DataType = ftUnknown
        Name = 'PPackID'
        ParamType = ptUnknown
      end>
    Left = 688
    Top = 112
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 42748.360784224500000000
    ReportOptions.LastChange = 42754.603114780090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 816
    Top = 112
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 70.000000000000000000
      PaperSize = 256
      LeftMargin = 2.000000000000000000
      RightMargin = 2.000000000000000000
      TopMargin = 2.000000000000000000
      BottomMargin = 2.000000000000000000
      object Memo1: TfrxMemoView
        Left = 7.559060000000000000
        Top = 3.779530000000000000
        Width = 351.496290000000000000
        Height = 26.456710000000000000
        DataField = #23458#25143#21517#31216
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HAlign = haCenter
        Memo.UTF8W = (
          '[frxDBDataset1."'#23458#25143#21517#31216'"]')
        ParentFont = False
      end
      object Memo2: TfrxMemoView
        Left = 7.559060000000000000
        Top = 33.015770000000000000
        Width = 98.267780000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'Customer P/N '#65306)
        ParentFont = False
      end
      object Memo3: TfrxMemoView
        Left = 86.929190000000000000
        Top = 33.015770000000000000
        Width = 120.944960000000000000
        Height = 18.897650000000000000
        DataField = #23458#25143#29289#26009#21495
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."'#23458#25143#29289#26009#21495'"]')
        ParentFont = False
      end
      object BarCode1: TfrxBarCodeView
        Left = 7.559060000000000000
        Top = 48.692950000000000000
        Width = 79.000000000000000000
        Height = 18.897650000000000000
        BarType = bcCode128
        DataField = #23458#25143#29289#26009#21495
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 1.600000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo4: TfrxMemoView
        Left = 7.559060000000000000
        Top = 108.504020000000000000
        Width = 41.574830000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'MPN'#65306)
        ParentFont = False
      end
      object Memo5: TfrxMemoView
        Left = 52.913420000000000000
        Top = 108.504020000000000000
        Width = 154.960730000000000000
        Height = 18.897650000000000000
        DataField = #23458#25143#22411#21495
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."'#23458#25143#22411#21495'"]')
        ParentFont = False
      end
      object BarCode2: TfrxBarCodeView
        Left = 7.559060000000000000
        Top = 128.181200000000000000
        Width = 79.000000000000000000
        Height = 15.118120000000000000
        BarType = bcCode128
        DataField = #23458#25143#22411#21495
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo6: TfrxMemoView
        Left = 7.559060000000000000
        Top = 73.047310000000000000
        Width = 83.149660000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'WuZhu P/N '#65306)
        ParentFont = False
      end
      object Memo7: TfrxMemoView
        Left = 75.708720000000000000
        Top = 73.031540000000000000
        Width = 128.504020000000000000
        Height = 15.118120000000000000
        DataField = #26412#21378#32534#21495
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."'#26412#21378#32534#21495'"]')
        ParentFont = False
      end
      object BarCode3: TfrxBarCodeView
        Left = 7.559060000000000000
        Top = 88.283550000000000000
        Width = 79.000000000000000000
        Height = 15.118120000000000000
        BarType = bcCode128
        DataField = #26412#21378#32534#21495
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo8: TfrxMemoView
        Left = 213.653680000000000000
        Top = 30.913420000000000000
        Width = 56.692950000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'Total Qty'#65306)
        ParentFont = False
      end
      object Memo9: TfrxMemoView
        Left = 266.567100000000000000
        Top = 30.913420000000000000
        Width = 71.811070000000000000
        Height = 18.897650000000000000
        DataField = 'PCS'#25968#37327
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."PCS'#25968#37327'"]')
        ParentFont = False
      end
      object BarCode4: TfrxBarCodeView
        Left = 213.653680000000000000
        Top = 48.811070000000000000
        Width = 79.000000000000000000
        Height = 18.897650000000000000
        BarType = bcCode128
        DataField = 'PCS'#25968#37327
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo10: TfrxMemoView
        Left = 210.433210000000000000
        Top = 104.944960000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'Date Code'#65306)
        ParentFont = False
      end
      object Memo11: TfrxMemoView
        Left = 274.685220000000000000
        Top = 103.944960000000000000
        Width = 83.149660000000000000
        Height = 18.897650000000000000
        DataField = #21608#26399#24180#26376
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."'#21608#26399#24180#26376'"]')
        ParentFont = False
      end
      object BarCode5: TfrxBarCodeView
        Left = 216.315090000000000000
        Top = 122.842610000000000000
        Width = 79.000000000000000000
        Height = 15.118120000000000000
        BarType = bcCode128
        DataField = #21608#26399#24180#26376
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo12: TfrxMemoView
        Left = 7.559060000000000000
        Top = 200.212740000000000000
        Width = 83.149660000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'MFG Name'#65306)
        ParentFont = False
      end
      object Memo13: TfrxMemoView
        Left = 94.488250000000000000
        Top = 200.212740000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        DataField = #29983#20135#24037#21378
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."'#29983#20135#24037#21378'"]')
        ParentFont = False
      end
      object BarCode6: TfrxBarCodeView
        Left = 7.559060000000000000
        Top = 219.889920000000000000
        Width = 79.000000000000000000
        Height = 15.118120000000000000
        BarType = bcCode128
        DataField = #29983#20135#24037#21378
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo14: TfrxMemoView
        Left = 215.433210000000000000
        Top = 170.637910000000000000
        Width = 49.133890000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          #26631#31614'ID'#65306)
        ParentFont = False
      end
      object BarCode7: TfrxBarCodeView
        Left = 215.433210000000000000
        Top = 187.535560000000000000
        Width = 79.000000000000000000
        Height = 11.338590000000000000
        BarType = bcCode128
        DataField = #26631#31614'ID'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo15: TfrxMemoView
        Left = 260.346630000000000000
        Top = 169.858380000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        DataField = #26631#31614'ID'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."'#26631#31614'ID"]')
        ParentFont = False
      end
      object Memo16: TfrxMemoView
        Left = 212.874150000000000000
        Top = 68.472480000000000000
        Width = 49.133890000000000000
        Height = 15.118120000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'PO NO'#65306)
        ParentFont = False
      end
      object Memo17: TfrxMemoView
        Left = 266.567100000000000000
        Top = 68.472480000000000000
        Width = 94.488250000000000000
        Height = 15.118120000000000000
        DataField = #23458#25143#35746#21333#21495
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."'#23458#25143#35746#21333#21495'"]')
        ParentFont = False
      end
      object BarCode8: TfrxBarCodeView
        Left = 211.653680000000000000
        Top = 87.370130000000000000
        Width = 79.000000000000000000
        Height = 15.118120000000000000
        BarType = bcCode128
        DataField = #23458#25143#35746#21333#21495
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo18: TfrxMemoView
        Left = 7.559060000000000000
        Top = 153.401670000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'Net Weight'#65306)
        ParentFont = False
      end
      object Memo19: TfrxMemoView
        Left = 7.559060000000000000
        Top = 176.078850000000000000
        Width = 94.488250000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'Cross Weight'#65306)
        ParentFont = False
      end
      object Memo20: TfrxMemoView
        Left = 83.149660000000000000
        Top = 153.401670000000000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        DataField = #20928#37325
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."'#20928#37325'"]')
        ParentFont = False
      end
      object Memo21: TfrxMemoView
        Left = 83.929190000000000000
        Top = 176.078850000000000000
        Width = 86.929190000000000000
        Height = 18.897650000000000000
        DataField = #27611#37325
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."'#27611#37325'"]')
        ParentFont = False
      end
      object Memo22: TfrxMemoView
        Left = 213.653680000000000000
        Top = 139.842610000000000000
        Width = 60.472480000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'Lot No'#65306)
        ParentFont = False
      end
      object Memo23: TfrxMemoView
        Left = 258.685220000000000000
        Top = 140.063080000000000000
        Width = 98.267780000000000000
        Height = 18.897650000000000000
        DataField = 'LotNo'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          '[frxDBDataset1."LotNo"]')
        ParentFont = False
      end
      object BarCode9: TfrxBarCodeView
        Left = 216.433210000000000000
        Top = 156.740260000000000000
        Width = 79.000000000000000000
        Height = 11.338590000000000000
        BarType = bcCode128
        DataField = 'LotNo'
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Rotation = 0
        ShowText = False
        Text = '12345678'
        WideBarRatio = 2.000000000000000000
        Zoom = 1.000000000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
      object Memo24: TfrxMemoView
        Left = 211.653680000000000000
        Top = 218.992270000000000000
        Width = 177.637910000000000000
        Height = 18.897650000000000000
        AutoWidth = True
        DataField = #20135#22320
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Memo.UTF8W = (
          '[frxDBDataset1."'#20135#22320'"]')
        ParentFont = False
      end
      object Memo25: TfrxMemoView
        Left = 215.433210000000000000
        Top = 202.315090000000000000
        Width = 143.622140000000000000
        Height = 18.897650000000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Memo.UTF8W = (
          'Carton No.:        of')
        ParentFont = False
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = cdsPrinter
    BCDToCurrency = False
    Left = 752
    Top = 112
  end
  object UpdateSQL1: TUpdateSQL
    InsertSQL.Strings = (
      
        'SELECT PD.ParamID,PD.ParamValue,PType.ParamName FROM Pack_PrintD' +
        'etail PD'
      'inner JOIN Pack_PrintTypeDef PType ON PD.ParamID = PackID'
      'INNER JOIN Pack_PrintMain PM ON PM.IDKey = PD.MainIDkey'
      'WHERE PM.rkey = :p1'
      'ORDER BY SeqNO asc')
    DeleteSQL.Strings = (
      'SELECT d25.MANU_PART_NUMBER as '#26412#21378#32534#21495', '
      #9#9'd25.MANU_PART_DESC as '#23458#25143#22411#21495','
      #9#9'd25.ANALYSIS_CODE_2 as '#23458#25143#29289#26009#21495','
      #9#9'd10.CUSTOMER_NAME as '#23458#25143#21517#31216','
      #9#9'd10.ABBR_NAME as '#23458#25143#31616#31216','
      #9#9'd15.ABBR_NAME as '#29983#20135#24037#21378','
      #9#9'd60.SALES_ORDER as '#38144#21806#35746#21333#21495','
      #9#9'd97.PO_NUMBER as '#23458#25143#35746#21333#21495','
      
        #9#9'(select RIGHT(datepart(year,getdate()),2) + right('#39'00'#39'+cast(da' +
        'tepart(week,getdate()) AS VARCHAR(2)),2)) as '#21608#26399#24180#26376','
      #9#9'0 as PCS'#25968#37327','
      #9#9'd06.WORK_ORDER_NUMBER as '#20316#19994#21333#21495','
      #9#9'd492.CUT_NO as '#37197#26009#21333#21495','
      #9#9'd06.RKEY as rkey06,'
      #9#9'd10.CUST_CODE as '#23458#25143#20195#30721
      'FROM Data0006 d06'
      'INNER JOIN data0492 d492 ON d06.CUT_NO = d492.CUT_NO'
      'INNER JOIN Data0060 d60 ON d60.SALES_ORDER = d492.SO_NO'
      'INNER JOIN Data0025 d25 ON d25.RKEY = d06.BOM_PTR'
      'INNER JOIN Data0010 d10 ON d10.RKEY = d60.CUSTOMER_PTR'
      'INNER JOIN Data0015 d15 ON d06.WHOUSE_PTR = d15.RKEY'
      
        'INNER JOIN data0097 d97 ON d60.PURCHASE_ORDER_PTR = d97.RKEY whe' +
        're d06.WORK_ORDER_NUMBER =:p1')
    Left = 312
    Top = 8
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
    Left = 624
    Top = 112
  end
end
