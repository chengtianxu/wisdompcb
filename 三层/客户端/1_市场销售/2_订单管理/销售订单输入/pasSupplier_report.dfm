inherited frmSupplier_report: TfrmSupplier_report
  Caption = #22806#21457#37319#36141#35746#21333#22810#35760#24405#25171#21360
  ClientHeight = 478
  ClientWidth = 858
  OnShow = FormShow
  ExplicitWidth = 866
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 437
    Width = 858
    Height = 41
    Align = alBottom
    TabOrder = 0
    object Button1: TButton
      Left = 409
      Top = 6
      Width = 69
      Height = 27
      Caption = #20851' '#38381
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button4: TButton
      Left = 332
      Top = 5
      Width = 71
      Height = 27
      Caption = #23548#20986'EXCEL'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 858
    Height = 95
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 222
      Top = 15
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#35746#21333#32534#21495
    end
    object Label2: TLabel
      Left = 222
      Top = 43
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #32467#26463#35746#21333#32534#21495
    end
    object Label4: TLabel
      Left = 25
      Top = 16
      Width = 64
      Height = 13
      Caption = #36755#20837#26085#26399#20174':'
    end
    object Label3: TLabel
      Left = 73
      Top = 41
      Width = 16
      Height = 13
      Caption = #21040':'
    end
    object lblttype: TLabel
      Left = 455
      Top = 41
      Width = 52
      Height = 13
      Caption = #20135#21697#23646#24615':'
    end
    object Label5: TLabel
      Left = 25
      Top = 68
      Width = 64
      Height = 13
      Caption = #22806#21457#20379#24212#21830':'
    end
    object Label85: TLabel
      Left = 682
      Top = 38
      Width = 3
      Height = 13
    end
    object Label6: TLabel
      Left = 452
      Top = 15
      Width = 64
      Height = 13
      Caption = #23458#25143#35746#21333#21495':'
    end
    object Label7: TLabel
      Left = 195
      Top = 69
      Width = 36
      Height = 13
      Caption = '            '
    end
    object rdgttype: TRadioGroup
      Left = 509
      Top = 30
      Width = 142
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
      Left = 296
      Top = 11
      Width = 118
      Height = 21
      MaxLength = 12
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 296
      Top = 39
      Width = 118
      Height = 21
      MaxLength = 12
      TabOrder = 2
    end
    object Button3: TButton
      Left = 673
      Top = 35
      Width = 71
      Height = 27
      Caption = #26597' '#35810
      TabOrder = 3
      OnClick = Button3Click
    end
    object dtpk1: TDateTimePicker
      Left = 92
      Top = 11
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 4
    end
    object dtpk2: TDateTimePicker
      Left = 92
      Top = 39
      Width = 96
      Height = 21
      Date = 38847.000000000000000000
      Time = 38847.000000000000000000
      TabOrder = 5
    end
    object Edit11: TEdit
      Left = 91
      Top = 65
      Width = 72
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 6
    end
    object BitBtn10: TBitBtn
      Left = 163
      Top = 63
      Width = 25
      Height = 25
      Hint = #26356#25913#36135#24065
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BitBtn10Click
    end
    object Edit3: TEdit
      Left = 519
      Top = 9
      Width = 130
      Height = 21
      MaxLength = 12
      TabOrder = 8
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 95
    Width = 858
    Height = 342
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 856
      Height = 340
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
          Visible = False
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
          Visible = False
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
          Visible = False
        end
        item
          Expanded = False
          FieldName = #35745#21010#20132#26399
          Visible = False
        end
        item
          Expanded = False
          FieldName = #22238#22797#20132#26399
          Visible = False
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
          Visible = False
        end
        item
          Expanded = False
          FieldName = #21333#20215
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
          Visible = False
        end
        item
          Expanded = False
          FieldName = #36135#24065#21517#31216
          Visible = False
        end
        item
          Expanded = False
          FieldName = #27719#29575
          Visible = False
        end
        item
          Expanded = False
          FieldName = #22806#21457#20379#24212#21830#20195#30721
          Visible = False
        end
        item
          Expanded = False
          FieldName = #22806#21457#20379#24212#21830
          Visible = True
        end>
    end
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
  object ds60: TDataSource
    DataSet = cds60
    Left = 352
    Top = 192
  end
  object cds60: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     TOP (100) PERCENT rank() over(order by dbo.Data0060.S' +
      'ALES_ORDER) as '#24207#21495',dbo.Data0005.EMPLOYEE_NAME as '#19994#21153#21592#22995#21517','#13#10' dbo.Dat' +
      'a0010.CUST_CODE as '#23458#25143#20195#30721', dbo.Data0060.SALES_ORDER as '#38144#21806#35746#21333','#13#10' dbo' +
      '.Data0060.ORIG_SCHED_SHIP_DATE as '#35745#21010#20132#26399', '#13#10' dbo.Data0060.PARTS_OR' +
      'DERED as '#35746#21333#25968#37327', dbo.Data0060.REFERENCE_NUMBER as '#35746#21333#21442#32771', '#13#10'ROUND(db' +
      'o.Data0060.PARTS_ALLOC*(SELECT 0.01*isnull(FEDTAXRATE,0) FROM Da' +
      'ta0192),6) AS '#21333#20215','#13#10' dbo.Data0060.PARTS_ORDERED*ROUND(dbo.Data006' +
      '0.PARTS_ALLOC*(SELECT 0.01*isnull(FEDTAXRATE,0) FROM Data0192),6' +
      ') AS '#39#37329#39069#39','#13#10'dbo.Data0060.PART_PRICE as '#35746#21333#20215#26684', dbo.Data0060.TOTAL_' +
      'ADD_L_PRICE as '#24037#20855#36153#29992', '#13#10'                      dbo.Data0060.EXCH_R' +
      'ATE as '#27719#29575', dbo.Data0001.CURR_NAME as '#36135#24065#21517#31216',dbo.Data0001.CURR_CODE' +
      ' as '#36135#24065#20195#30721','#13#10' dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq AS' +
      ' '#35746#21333#38754#31215', dbo.Data0008.PRODUCT_NAME as '#20135#21697#31867#22411', '#13#10'          case    db' +
      'o.Data0060.QUOTE_PRICE when 0 then '#39#26410#35780#23457#39' when 1 then '#39#24050#35780#23457#39#13#10'    ' +
      '       when 2 then '#39#34987#36864#22238#39' when 3 then '#39#19981#35780#23457#39' end as  '#35780#23457#26631#35760','#13#10'dbo.Da' +
      'ta0060.FOB as '#21512#21516#21495', dbo.Data0097.PO_NUMBER as '#23458#25143#35746#21333#21495', '#13#10'dbo.Data00' +
      '60.SCH_DATE as '#22238#22797#20132#26399', dbo.Data0060.so_oldnew as '#35746#21333#26032#26087', '#13#10'         ' +
      '             dbo.Data0025.MANU_PART_NUMBER as '#26412#21378#32534#21495','#13#10' dbo.Data00' +
      '25.MANU_PART_DESC as '#23458#25143#22411#21495', '#13#10'dbo.Data0025.ANALYSIS_CODE_2 as '#23458#25143#29289 +
      #26009#21495', dbo.Data0025.ANALYSIS_CODE_3 as '#22823#26009#35268#26684',  '#13#10'                   ' +
      '   dbo.Data0025.ANALYSIS_CODE_1 as '#20132#36135#23610#23544','#13#10' dbo.Data0025.unit_sq ' +
      'as '#21333#21482#38754#31215', CASE data0025.green_flag WHEN '#39'Y'#39' THEN '#39'ROHS'#39' WHEN '#39'N'#39' ' +
      'THEN '#39#38750'ROHS'#39' END AS rohs, '#13#10'                      dbo.Data0060.E' +
      'NT_DATE as '#19979#21333#26085#26399', dbo.Data0025.SAMPLE_NR as '#25104#22411#22791#27880', dbo.Data0025.se' +
      't_qty as '#20132#36135#21333#20803#25968','#13#10'dbo.Data0023.code as '#22806#21457#20379#24212#21830#20195#30721',dbo.Data0023.ABBR_' +
      'NAME AS '#22806#21457#20379#24212#21830',dbo.Data0023.SUPPLIER_NAME AS '#22806#21457#20379#24212#21830#20840#31216','#13#10'dbo.Data00' +
      '23.billing_address_1 as '#35814#32454#22320#22336',dbo.Data0023.phone as '#30005#35805',dbo.Data00' +
      '23.Fax as '#20256#30495',dbo.Data0023.contact_name_1 as '#32852#31995#20154','#13#10'dbo.Data0023.t' +
      'ax_id_number as '#20184#27454#26041#24335',dbo.Data0023.analysis_code2 as '#20184#27454#22320#28857',dbo.Dat' +
      'a0023.analysis_code1 as '#31080#25454#31181#31867','#13#10'case dbo.Data0060.so_style when 0' +
      ' then '#39#27491#24335#39' when 1 then '#39#22791#21697#39' else '#39#39' end as '#35746#21333#31867#22411#13#10'FROM         db' +
      'o.Data0097 INNER JOIN'#13#10'                      dbo.Data0005 INNER ' +
      'JOIN'#13#10'                      dbo.Data0010 ON dbo.Data0005.RKEY = ' +
      'dbo.Data0010.SALES_REP_PTR INNER JOIN'#13#10'                      dbo' +
      '.Data0060 ON dbo.Data0010.RKEY = dbo.Data0060.CUSTOMER_PTR INNER' +
      ' JOIN'#13#10'                      dbo.Data0001 ON dbo.Data0060.CURREN' +
      'CY_PTR = dbo.Data0001.RKEY ON '#13#10'                      dbo.Data00' +
      '97.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR INNER JOIN'#13#10'          ' +
      '            dbo.Data0025 INNER JOIN'#13#10'                      dbo.D' +
      'ata0008 ON dbo.Data0025.PROD_CODE_PTR = dbo.Data0008.RKEY ON dbo' +
      '.Data0060.CUST_PART_PTR = dbo.Data0025.RKEY LEFT JOIN'#13#10'         ' +
      '             dbo.Data0023 ON dbo.Data0060.supplier_ptr= dbo.Data' +
      '0023.RKEY'#13#10'WHERE  dbo.Data0060.so_tp=1'
    Params = <>
    Left = 392
    Top = 192
  end
  object fdb60: TfrxDBDataset
    UserName = 'fdb60'
    CloseDataSource = False
    FieldAliases.Strings = (
      #24207#21495'='#24207#21495
      #19994#21153#21592#22995#21517'='#19994#21153#21592#22995#21517
      #23458#25143#20195#30721'='#23458#25143#20195#30721
      #38144#21806#35746#21333'='#38144#21806#35746#21333
      #35745#21010#20132#26399'='#35745#21010#20132#26399
      #35746#21333#25968#37327'='#35746#21333#25968#37327
      #35746#21333#21442#32771'='#35746#21333#21442#32771
      #21333#20215'='#21333#20215
      #37329#39069'='#37329#39069
      #35746#21333#20215#26684'='#35746#21333#20215#26684
      #24037#20855#36153#29992'='#24037#20855#36153#29992
      #27719#29575'='#27719#29575
      #36135#24065#21517#31216'='#36135#24065#21517#31216
      #36135#24065#20195#30721'='#36135#24065#20195#30721
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
      #22806#21457#20379#24212#21830#20195#30721'='#22806#21457#20379#24212#21830#20195#30721
      #22806#21457#20379#24212#21830'='#22806#21457#20379#24212#21830
      #22806#21457#20379#24212#21830#20840#31216'='#22806#21457#20379#24212#21830#20840#31216
      #35814#32454#22320#22336'='#35814#32454#22320#22336
      #30005#35805'='#30005#35805
      #20256#30495'='#20256#30495
      #32852#31995#20154'='#32852#31995#20154
      #20184#27454#26041#24335'='#20184#27454#26041#24335
      #20184#27454#22320#28857'='#20184#27454#22320#28857
      #31080#25454#31181#31867'='#31080#25454#31181#31867
      #35746#21333#31867#22411'='#35746#21333#31867#22411)
    DataSet = cds60
    BCDToCurrency = False
    Left = 440
    Top = 192
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43120.787378645840000000
    ReportOptions.LastChange = 43120.787378645840000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 520
    Top = 192
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
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
    Left = 584
    Top = 192
  end
end
