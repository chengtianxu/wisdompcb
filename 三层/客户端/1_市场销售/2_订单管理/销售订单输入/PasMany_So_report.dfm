inherited frmMany_So_report: TfrmMany_So_report
  Caption = #38144#21806#35746#21333#22810#35760#24405#25171#21360
  ClientHeight = 482
  ClientWidth = 830
  OnShow = FormShow
  ExplicitWidth = 838
  ExplicitHeight = 509
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 441
    Width = 830
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 363
    ExplicitWidth = 756
    object Button1: TButton
      Left = 408
      Top = 6
      Width = 69
      Height = 27
      Caption = #20851' '#38381
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 327
      Top = 6
      Width = 75
      Height = 27
      Caption = #25171' '#21360
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 830
    Height = 57
    Align = alTop
    TabOrder = 1
    object lblso_tp: TLabel
      Left = 484
      Top = 6
      Width = 52
      Height = 13
      Caption = #21152#24037#24418#24335':'
    end
    object Label1: TLabel
      Left = 279
      Top = 6
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#35746#21333#32534#21495
    end
    object Label2: TLabel
      Left = 279
      Top = 32
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #32467#26463#35746#21333#32534#21495
    end
    object Label4: TLabel
      Left = 96
      Top = 6
      Width = 64
      Height = 13
      Caption = #36755#20837#26085#26399#20174':'
    end
    object Label3: TLabel
      Left = 144
      Top = 28
      Width = 16
      Height = 13
      Caption = #21040':'
    end
    object lblttype: TLabel
      Left = 484
      Top = 32
      Width = 52
      Height = 13
      Caption = #20135#21697#23646#24615':'
    end
    object Label5: TLabel
      Left = 11
      Top = 8
      Width = 24
      Height = 13
      Caption = #24037#21378
    end
    object rdgttype: TRadioGroup
      Left = 544
      Top = 22
      Width = 187
      Height = 32
      Columns = 3
      ItemIndex = 2
      Items.Strings = (
        #37327#20135
        #26679#26495
        #20840#37096)
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 353
      Top = 2
      Width = 121
      Height = 21
      MaxLength = 12
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 353
      Top = 28
      Width = 121
      Height = 21
      MaxLength = 12
      TabOrder = 2
    end
    object Button3: TButton
      Left = 730
      Top = 28
      Width = 60
      Height = 25
      Caption = #26597' '#35810
      TabOrder = 3
      OnClick = Button3Click
    end
    object dtpk1: TDateTimePicker
      Left = 165
      Top = 2
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 4
    end
    object dtpk2: TDateTimePicker
      Left = 165
      Top = 28
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 5
    end
    object rdgso_tp: TRadioGroup
      Left = 542
      Top = -10
      Width = 246
      Height = 32
      Columns = 4
      ItemIndex = 3
      Items.Strings = (
        #33258#21046
        #22806#21457
        #21322#21046#31243
        #20840#37096)
      TabOrder = 6
    end
    object ComboBox1: TComboBox
      Left = 6
      Top = 24
      Width = 107
      Height = 21
      Style = csDropDownList
      TabOrder = 7
      OnChange = ComboBox1Change
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 830
    Height = 384
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 280
    ExplicitTop = 168
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 828
      Height = 382
      Hint = #21452#20987#21024#38500#19968#26465#35760#24405
      Align = alClient
      DataSource = ds60
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = #19994#21153#21592#22995#21517
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#20195#30721
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38144#21806#35746#21333
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26412#21378#32534#21495
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#22411#21495
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#29289#26009#21495
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rohs'
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#35746#21333#21495
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35780#23457#26631#35760
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#21010#20132#26399
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22238#22797#20132#26399
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20135#21697#31867#22411
          Width = 104
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35746#21333#25968#37327
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35746#21333#20215#26684
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#21482#38754#31215
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35746#21333#38754#31215
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24037#20855#36153#29992
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35746#21333#21442#32771
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36135#24065#21517#31216
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27719#29575
          Width = 36
          Visible = True
        end>
    end
  end
  object ds60: TDataSource
    DataSet = cds60
    Left = 360
    Top = 160
  end
  object cds60: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     TOP (100) PERCENT dbo.Data0005.EMPLOYEE_NAME as '#19994#21153#21592#22995#21517 +
      ','#13#10' dbo.Data0010.CUST_CODE as '#23458#25143#20195#30721', dbo.Data0060.SALES_ORDER as ' +
      #38144#21806#35746#21333','#13#10' dbo.Data0060.ORIG_SCHED_SHIP_DATE as '#35745#21010#20132#26399', '#13#10' dbo.Data00' +
      '60.PARTS_ORDERED as '#35746#21333#25968#37327', dbo.Data0060.REFERENCE_NUMBER as '#35746#21333#21442#32771',' +
      ' '#13#10'dbo.Data0060.PART_PRICE as '#35746#21333#20215#26684', dbo.Data0060.TOTAL_ADD_L_PRI' +
      'CE as '#24037#20855#36153#29992', '#13#10'                      dbo.Data0060.EXCH_RATE as '#27719#29575 +
      ', dbo.Data0001.CURR_NAME as '#36135#24065#21517#31216','#13#10' dbo.Data0060.PARTS_ORDERED *' +
      ' dbo.Data0025.unit_sq AS '#35746#21333#38754#31215', dbo.Data0008.PRODUCT_NAME as '#20135#21697#31867#22411 +
      ', '#13#10'          case    dbo.Data0060.QUOTE_PRICE when 0 then '#39#26410#35780#23457#39 +
      ' when 1 then '#39#24050#35780#23457#39#13#10'           when 2 then '#39#34987#36864#22238#39' when 3 then '#39#19981#35780 +
      #23457#39' end as  '#35780#23457#26631#35760','#13#10'dbo.Data0060.FOB as '#21512#21516#21495', dbo.Data0097.PO_NUMBE' +
      'R as '#23458#25143#35746#21333#21495', '#13#10'dbo.Data0060.SCH_DATE as '#22238#22797#20132#26399', dbo.Data0060.so_old' +
      'new as '#35746#21333#26032#26087', '#13#10'                      dbo.Data0025.MANU_PART_NUMB' +
      'ER as '#26412#21378#32534#21495','#13#10' dbo.Data0025.MANU_PART_DESC as '#23458#25143#22411#21495', '#13#10'dbo.Data002' +
      '5.ANALYSIS_CODE_2 as '#23458#25143#29289#26009#21495', dbo.Data0025.ANALYSIS_CODE_3 as '#22823#26009#35268#26684 +
      ',  '#13#10'                      dbo.Data0025.ANALYSIS_CODE_1 as '#20132#36135#23610#23544',' +
      #13#10' dbo.Data0025.unit_sq as '#21333#21482#38754#31215', CASE data0025.green_flag WHEN '#39 +
      'Y'#39' THEN '#39'ROHS'#39' WHEN '#39'N'#39' THEN '#39#38750'ROHS'#39' END AS rohs, '#13#10'            ' +
      '          dbo.Data0060.ENT_DATE as '#19979#21333#26085#26399', dbo.Data0025.SAMPLE_NR ' +
      'as '#25104#22411#22791#27880', dbo.Data0025.set_qty as '#20132#36135#21333#20803#25968','#13#10'case dbo.Data0060.so_st' +
      'yle when 0 then '#39#27491#24335#39' when 1 then '#39#22791#21697#39' else '#39#39' end as '#35746#21333#31867#22411',data00' +
      '15.ABBR_NAME'#13#10'FROM         dbo.Data0097 INNER JOIN'#13#10'            ' +
      '          dbo.Data0005 INNER JOIN'#13#10'                      dbo.Dat' +
      'a0010 ON dbo.Data0005.RKEY = dbo.Data0010.SALES_REP_PTR INNER JO' +
      'IN'#13#10'                      dbo.Data0060 ON dbo.Data0010.RKEY = db' +
      'o.Data0060.CUSTOMER_PTR INNER JOIN'#13#10'                      dbo.Da' +
      'ta0001 ON dbo.Data0060.CURRENCY_PTR = dbo.Data0001.RKEY ON '#13#10'   ' +
      '                   dbo.Data0097.RKEY = dbo.Data0060.PURCHASE_ORD' +
      'ER_PTR INNER JOIN'#13#10'                      dbo.Data0025 INNER JOIN' +
      #13#10'                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_P' +
      'TR = dbo.Data0008.RKEY ON dbo.Data0060.CUST_PART_PTR = dbo.Data0' +
      '025.RKEY LEFT OUTER JOIN'#13#10'                      dbo.Data0015 ON ' +
      'dbo.Data0060.SHIP_REG_TAX_ID = dbo.Data0015.RKEY'#13#10'where 1=1'
    Filtered = True
    Params = <>
    Left = 408
    Top = 160
  end
  object cds15: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0015'
    Params = <>
    Left = 464
    Top = 160
  end
  object cds493s: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    Left = 400
    Top = 248
  end
  object fdb493: TfrxDBDataset
    UserName = 'fdb493'
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
    DataSet = cds493s
    BCDToCurrency = False
    Left = 456
    Top = 248
  end
  object fdb60: TfrxDBDataset
    UserName = 'fdb60'
    CloseDataSource = False
    FieldAliases.Strings = (
      #19994#21153#21592#22995#21517'='#19994#21153#21592#22995#21517
      #23458#25143#20195#30721'='#23458#25143#20195#30721
      #38144#21806#35746#21333'='#38144#21806#35746#21333
      #35745#21010#20132#26399'='#35745#21010#20132#26399
      #35746#21333#25968#37327'='#35746#21333#25968#37327
      #35746#21333#21442#32771'='#35746#21333#21442#32771
      #35746#21333#20215#26684'='#35746#21333#20215#26684
      #24037#20855#36153#29992'='#24037#20855#36153#29992
      #27719#29575'='#27719#29575
      #36135#24065#21517#31216'='#36135#24065#21517#31216
      #35746#21333#38754#31215'='#35746#21333#38754#31215
      #20135#21697#31867#22411'='#20135#21697#31867#22411
      #35780#23457#26631#35760'='#35780#23457#26631#35760
      #21512#21516#21495'='#21512#21516#21495
      #23458#25143#35746#21333#21495'='#23458#25143#35746#21333#21495
      #22238#22797#20132#26399'='#22238#22797#20132#26399
      #35746#21333#26032#26087'='#35746#21333#26032#26087
      #26412#21378#32534#21495'='#26412#21378#32534#21495
      #23458#25143#22411#21495'='#23458#25143#22411#21495
      #23458#25143#29289#26009#21495'='#23458#25143#29289#26009#21495
      #22823#26009#35268#26684'='#22823#26009#35268#26684
      #20132#36135#23610#23544'='#20132#36135#23610#23544
      #21333#21482#38754#31215'='#21333#21482#38754#31215
      'rohs=rohs'
      #19979#21333#26085#26399'='#19979#21333#26085#26399
      #25104#22411#22791#27880'='#25104#22411#22791#27880
      #20132#36135#21333#20803#25968'='#20132#36135#21333#20803#25968
      #35746#21333#31867#22411'='#35746#21333#31867#22411
      'ABBR_NAME=ABBR_NAME')
    DataSet = cds60
    BCDToCurrency = False
    Left = 536
    Top = 160
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43120.637585532400000000
    ReportOptions.LastChange = 43120.677697291660000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 600
    Top = 160
    Datasets = <
      item
        DataSet = fdb493
        DataSetName = 'fdb493'
      end
      item
        DataSet = fdb60
        DataSetName = 'fdb60'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Picture1: TfrxPictureView
          Left = 170.078850000000000000
          Top = 3.779530000000001000
          Width = 94.488250000000000000
          Height = 56.692950000000000000
          DataField = 'Company_Icon'
          DataSet = fdb493
          DataSetName = 'fdb493'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object fdb493Company_Name: TfrxMemoView
          Left = 359.055350000000000000
          Top = 7.559059999999999000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name'
          DataSet = fdb493
          DataSetName = 'fdb493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdb493."Company_Name"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 411.968770000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #29983#20135#36890#30693#21333)
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 143.622140000000000000
        Width = 1046.929810000000000000
        DataSet = fdb60
        DataSetName = 'fdb60'
        RowCount = 0
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779529999999994000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #19994#21153#21592)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 62.811070000000000000
          Top = 2.779529999999994000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#20195#30721)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 131.181200000000000000
          Top = 2.779529999999994000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333#32534#21495)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 131.181200000000000000
          Top = 22.677179999999990000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26495#26009)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 275.244280000000000000
          Top = 1.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26412#21378#32534#21495)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 385.393940000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#22411#21495)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 384.393940000000000000
          Top = 22.677179999999990000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#29289#26009#21495)
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 563.677490000000000000
          Top = 3.779529999999994000
          Width = 30.236240000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333
            #26032#26087)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 604.031850000000000000
          Top = 3.779529999999994000
          Width = 34.015770000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #29615#20445#26631#35782)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 652.504330000000000000
          Top = 15.118120000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20132#26399)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 762.110700000000000000
          Top = 15.118120000000010000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25968#37327)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 809.024120000000000000
          Top = 15.118120000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #38754#31215)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 893.937540000000000000
          Top = 15.118120000000010000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35780#23457#32467#26524)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 955.866730000000000000
          Top = 15.118120000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #22791#27880)
          ParentFont = False
        end
        object Shape2: TfrxShapeView
          Left = 1.000000000000000000
          Top = 1.000000000000000000
          Width = 1043.150280000000000000
          Height = 41.574830000000000000
        end
        object Line17: TfrxLineView
          Left = 56.692950000000010000
          Top = 1.779529999999994000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 128.504020000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          Left = 264.567100000000000000
          Top = 1.779529999999994000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line20: TfrxLineView
          Left = 377.953000000000000000
          Top = 1.779529999999994000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line21: TfrxLineView
          Left = 555.590910000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 600.945270000000000000
          Top = 1.779529999999994000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 646.299630000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line24: TfrxLineView
          Left = 744.567410000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line25: TfrxLineView
          Left = 805.039890000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 891.969080000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line27: TfrxLineView
          Left = 956.221090000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 52.913420000000000000
        Top = 207.874150000000000000
        Width = 1046.929810000000000000
        DataSet = fdb60
        DataSetName = 'fdb60'
        RowCount = 0
        object Memo16: TfrxMemoView
          Left = 2.000000000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #19994#21153#21592#22995#21517
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#19994#21153#21592#22995#21517'"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #23458#25143#20195#30721
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#23458#25143#20195#30721'"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 128.504020000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #38144#21806#35746#21333
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#38144#21806#35746#21333'"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 128.504020000000000000
          Top = 26.456709999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #23458#25143#22411#21495
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#23458#25143#22411#21495'"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 272.126160000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #26412#21378#32534#21495
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#26412#21378#32534#21495'"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 385.512060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #23458#25143#22411#21495
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#23458#25143#22411#21495'"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 385.512060000000000000
          Top = 26.456709999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #23458#25143#29289#26009#21495
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#23458#25143#29289#26009#21495'"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 561.929499999999900000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #35746#21333#26032#26087
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#35746#21333#26032#26087'"]')
          ParentFont = False
        end
        object fdb60rohs: TfrxMemoView
          Left = 601.724800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'rohs'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."rohs"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 750.685530000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #35746#21333#25968#37327
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#35746#21333#25968#37327'"]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 808.819420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #35746#21333#38754#31215
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#35746#21333#38754#31215'"]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 650.079160000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #22238#22797#20132#26399
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#22238#22797#20132#26399'"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 895.748610000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #35780#23457#26631#35760
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#35780#23457#26631#35760'"]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 956.221090000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #35746#21333#21442#32771
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."'#35746#21333#21442#32771'"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 128.504020000000000000
        Top = 283.464750000000000000
        Width = 1046.929810000000000000
        object Line1: TfrxLineView
          Left = 2.000000000000000000
          Top = 28.677180000000020000
          Width = 1039.370750000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 264.567100000000000000
          Height = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          Left = 566.929500000000000000
          Height = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo29: TfrxMemoView
          Left = 7.559060000000000000
          Top = 7.559059999999988000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24066#22330#37096#31614#21517)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 272.126160000000000000
          Top = 7.559060000000045000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35780#23457#37096#38376#20250#31614)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 570.709030000000000000
          Top = 3.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24076#26395#35843#25972#20869#23481)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 11.338590000000000000
          Top = 38.015769999999970000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #21046#21333':')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 11.338590000000000000
          Top = 66.252009999999990000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #22797#26680':')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          Left = 11.338590000000000000
          Top = 95.488250000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23457#25209':')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 136.063080000000000000
          Top = 37.795300000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26085#26399':')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 136.063080000000000000
          Top = 68.031540000000010000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26085#26399':')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 136.063080000000000000
          Top = 94.488250000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26085#26399':')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Left = 45.354360000000000000
          Top = 53.913419999999970000
          Width = 79.370130000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 173.858380000000000000
          Top = 54.913419999999970000
          Width = 79.370130000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          Left = 45.354360000000000000
          Top = 86.929190000000000000
          Width = 79.370130000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 46.133890000000000000
          Top = 113.385900000000000000
          Width = 79.370130000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          Left = 173.858380000000000000
          Top = 86.929190000000000000
          Width = 79.370130000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          Left = 173.858380000000000000
          Top = 113.385900000000000000
          Width = 79.370130000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo38: TfrxMemoView
          Left = 275.905690000000000000
          Top = 34.015769999999970000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24037#31243':')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 275.905690000000000000
          Top = 63.031540000000010000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #21697#36136':')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 408.189240000000000000
          Top = 34.015769999999970000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35745#21010':')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 408.189240000000000000
          Top = 64.252009999999990000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #29983#20135':')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 408.189240000000000000
          Top = 99.047309999999990000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26680#20934':')
          ParentFont = False
        end
        object Line10: TfrxLineView
          Left = 317.480520000000000000
          Top = 52.913419999999970000
          Width = 75.590600000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          Left = 313.700990000000000000
          Top = 83.149659999999990000
          Width = 79.370130000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 449.764070000000000000
          Top = 52.913419999999970000
          Width = 102.047310000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line13: TfrxLineView
          Left = 449.764070000000000000
          Top = 83.149659999999990000
          Width = 102.047310000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          Left = 449.764070000000000000
          Top = 117.165430000000000000
          Width = 102.047310000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo43: TfrxMemoView
          Left = 582.047620000000000000
          Top = 77.370130000000010000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#24847#35265':')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 582.047620000000000000
          Top = 102.826840000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #31614#21517'/'#26085#26399':')
          ParentFont = False
        end
        object Line15: TfrxLineView
          Left = 646.299630000000000000
          Top = 94.488250000000000000
          Width = 343.937230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          Left = 646.299630000000000000
          Top = 117.165430000000000000
          Width = 196.535560000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line28: TfrxLineView
          Left = 2.779530000000000000
          Top = 0.779530000000022500
          Height = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line29: TfrxLineView
          Left = 3.779530000000000000
          Top = 0.779530000000022500
          Width = 1039.370750000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line30: TfrxLineView
          Left = 1043.150280000000000000
          Top = 0.779530000000022500
          Height = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          Left = 3.779530000000000000
          Top = 124.944960000000000000
          Width = 1039.370750000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 472.441250000000000000
        Width = 1046.929810000000000000
        object Memo45: TfrxMemoView
          Left = 699.213050000000000000
          Top = 3.779530000000022000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #38754#31215#21512#35745':')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 771.024120000000000000
          Top = 3.779530000000022000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[SUM(<fdb60."'#35746#21333#38754#31215'">)]')
          ParentFont = False
        end
      end
    end
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
    Left = 600
    Top = 232
  end
end
