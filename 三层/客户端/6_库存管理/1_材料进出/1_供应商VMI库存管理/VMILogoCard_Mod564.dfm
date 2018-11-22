object frmVMILogoCard_Mod564: TfrmVMILogoCard_Mod564
  Left = 0
  Top = 0
  Caption = 'VMI'#29289#26009#26631#35782#21345#25253#34920
  ClientHeight = 365
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object con1: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 104
    Top = 8
  end
  object qry1: TADOQuery
    Connection = con1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select data0017.rkey as rkey17,data0023.rkey as rkey23,cast(data' +
        '0017.rkey as varchar)+'#39'#'#39'+cast(data0023.rkey as varchar) as '#26465#24418#30721','
      'data0023.CODE as '#20379#24212#21830#20195#30721',data0023.SUPPLIER_NAME as '#20379#24212#21830#21517#31216','
      'data0023.ABBR_NAME as '#20379#24212#21830',data0017.INV_NAME as '#26448#26009#21517#31216','
      
        'data0017.INV_DESCRIPTION as '#35268#26684#22411#21495',data0017.INV_PART_NUMBER as '#26448#26009#32534 +
        #30721','
      'data0134.quantity as '#25910#20837','
      'CONVERT(varchar(100), data0133.ship_date, 23) as '#26085#26399
      'from data0134'
      'inner join data0133 on data0134.GRN_PTR=data0133.rkey'
      'inner join data0023 on data0133.supp_ptr=data0023.rkey'
      'inner join data0017 on data0134.INVENTORY_PTR=data0017.rkey'
      'where 1=0')
    Left = 168
    Top = 8
    object qry1rkey17: TAutoIncField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object qry1rkey23: TAutoIncField
      FieldName = 'rkey23'
      ReadOnly = True
    end
    object qry1条形码: TStringField
      FieldName = #26465#24418#30721
      ReadOnly = True
      Size = 61
    end
    object qry1供应商代码: TStringField
      FieldName = #20379#24212#21830#20195#30721
      Size = 10
    end
    object qry1供应商名称: TStringField
      FieldName = #20379#24212#21830#21517#31216
      Size = 100
    end
    object qry1供应商: TStringField
      FieldName = #20379#24212#21830
      Size = 16
    end
    object qry1材料名称: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object qry1规格型号: TStringField
      FieldName = #35268#26684#22411#21495
      Size = 70
    end
    object qry1材料编码: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object qry1收入: TBCDField
      FieldName = #25910#20837
      Precision = 19
    end
    object qry1日期: TStringField
      FieldName = #26085#26399
      ReadOnly = True
      Size = 100
    end
  end
  object dtstprvdr1: TDataSetProvider
    DataSet = qry1
    Left = 224
    Top = 8
  end
  object cds134: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0017.rkey as rkey17,data0023.rkey as rkey23,cast(data' +
      '0017.rkey as varchar)+'#39'#'#39'+cast(data0023.rkey as varchar) as '#26465#24418#30721',' +
      #13#10'data0023.CODE as '#20379#24212#21830#20195#30721',data0023.SUPPLIER_NAME as '#20379#24212#21830#21517#31216','#13#10'data0' +
      '023.ABBR_NAME as '#20379#24212#21830',data0017.INV_NAME as '#26448#26009#21517#31216','#13#10'data0017.INV_DE' +
      'SCRIPTION as '#35268#26684#22411#21495',data0017.INV_PART_NUMBER as '#26448#26009#32534#30721','#13#10'data0134.qu' +
      'antity as '#25910#20837','#13#10'CONVERT(varchar(100), data0133.ship_date, 23) as ' +
      #26085#26399#13#10'from data0134'#13#10'inner join data0133 on data0134.GRN_PTR=data0' +
      '133.rkey'#13#10'inner join data0023 on data0133.supp_ptr=data0023.rkey' +
      #13#10'inner join data0017 on data0134.INVENTORY_PTR=data0017.rkey'
    Params = <>
    OnCalcFields = cds134CalcFields
    Left = 104
    Top = 96
    object cds134rkey17: TAutoIncField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object cds134rkey23: TAutoIncField
      FieldName = 'rkey23'
      ReadOnly = True
    end
    object cds134条形码: TStringField
      FieldName = #26465#24418#30721
      ReadOnly = True
      Size = 61
    end
    object cds134供应商代码: TStringField
      FieldName = #20379#24212#21830#20195#30721
      Size = 10
    end
    object cds134供应商名称: TStringField
      FieldName = #20379#24212#21830#21517#31216
      Size = 100
    end
    object cds134供应商: TStringField
      FieldName = #20379#24212#21830
      Size = 16
    end
    object cds134材料名称: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object cds134规格型号: TStringField
      FieldName = #35268#26684#22411#21495
      Size = 70
    end
    object cds134材料编码: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object cds134收入: TBCDField
      FieldName = #25910#20837
      Precision = 19
    end
    object cds134日期: TStringField
      FieldName = #26085#26399
      ReadOnly = True
      Size = 100
    end
    object cds134结存: TFloatField
      FieldKind = fkCalculated
      FieldName = #32467#23384
      Calculated = True
    end
  end
  object cds493s: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    Left = 104
    Top = 186
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
    Left = 184
    Top = 186
  end
  object fdbs134: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'rkey17=rkey17'
      'rkey23=rkey23'
      #26465#24418#30721'='#26465#24418#30721
      #20379#24212#21830#20195#30721'='#20379#24212#21830#20195#30721
      #20379#24212#21830#21517#31216'='#20379#24212#21830#21517#31216
      #20379#24212#21830'='#20379#24212#21830
      #26448#26009#21517#31216'='#26448#26009#21517#31216
      #35268#26684#22411#21495'='#35268#26684#22411#21495
      #26448#26009#32534#30721'='#26448#26009#32534#30721
      #25910#20837'='#25910#20837
      #26085#26399'='#26085#26399
      #32467#23384'='#32467#23384)
    DataSet = cds134
    BCDToCurrency = False
    Left = 192
    Top = 96
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42804.363274375000000000
    ReportOptions.LastChange = 42836.494822766200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 272
    Top = 96
    Datasets = <
      item
        DataSet = fdb493
        DataSetName = 'fdb493'
      end
      item
        DataSet = fdbs134
        DataSetName = 'frxDBDataset1'
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
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 449.764070000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Picture1: TfrxPictureView
          Left = 11.338590000000000000
          Top = 11.338590000000000000
          Width = 86.929190000000000000
          Height = 56.692950000000010000
          DataField = 'Company_Icon'
          DataSet = fdb493
          DataSetName = 'fdb493'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo1: TfrxMemoView
          Left = 211.653680000000000000
          Top = 11.338590000000000000
          Width = 340.157700000000000000
          Height = 22.677180000000000000
          DataField = 'Company_Name'
          DataSet = fdb493
          DataSetName = 'fdb493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdb493."Company_Name"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 245.669450000000000000
          Top = 39.574830000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name3'
          DataSet = fdb493
          DataSetName = 'fdb493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdb493."Company_Name3"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 291.023810000000000000
          Top = 64.031540000000010000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            'VMI '#29289#26009#26631#35782#21345)
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Left = 7.559060000000000000
          Top = 107.488250000000000000
          Width = 438.425480000000000000
          Height = 83.149660000000000000
        end
        object Shape2: TfrxShapeView
          Left = 15.118120000000000000
          Top = 115.047310000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
        end
        object Memo4: TfrxMemoView
          Left = 22.677180000000000000
          Top = 116.047310000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #20379#24212#21830#65306)
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Left = 83.149660000000000000
          Top = 110.047310000000000000
          Width = 359.055350000000000000
          Height = 79.370129999999990000
        end
        object Shape4: TfrxShapeView
          Left = 7.559060000000000000
          Top = 190.637910000000000000
          Width = 438.425480000000000000
          Height = 105.826840000000000000
        end
        object Shape5: TfrxShapeView
          Left = 15.118120000000000000
          Top = 198.196970000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
        end
        object Memo6: TfrxMemoView
          Left = 16.677180000000000000
          Top = 199.196970000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #26448#26009#21517#31216#65306)
          ParentFont = False
        end
        object Shape6: TfrxShapeView
          Left = 83.149660000000000000
          Top = 194.196970000000000000
          Width = 359.055350000000000000
          Height = 98.267780000000010000
        end
        object Memo7: TfrxMemoView
          Left = 77.708720000000000000
          Top = 193.756030000000000000
          Width = 362.834880000000000000
          Height = 98.267780000000000000
          DataField = #26448#26009#21517#31216
          DataSet = fdbs134
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -48
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."'#26448#26009#21517#31216'"]')
          ParentFont = False
        end
        object Shape7: TfrxShapeView
          Left = 7.559060000000000000
          Top = 295.787570000000000000
          Width = 438.425480000000000000
          Height = 154.960730000000000000
        end
        object Shape8: TfrxShapeView
          Left = 15.118120000000000000
          Top = 311.346630000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
        end
        object Memo8: TfrxMemoView
          Left = 16.677180000000000000
          Top = 312.346630000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #35268#26684#22411#21495#65306)
          ParentFont = False
        end
        object Shape9: TfrxShapeView
          Left = 82.370130000000000000
          Top = 299.346630000000000000
          Width = 359.055350000000000000
          Height = 151.181200000000000000
        end
        object Memo9: TfrxMemoView
          Left = 76.708720000000000000
          Top = 298.905690000000000000
          Width = 359.055350000000000000
          Height = 147.401670000000000000
          DataField = #35268#26684#22411#21495
          DataSet = fdbs134
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -37
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."'#35268#26684#22411#21495'"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 9.118119999999999000
          Top = 85.811070000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #26448#26009#32534#30721#65306)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 80.149660000000000000
          Top = 86.370130000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataField = #26448#26009#32534#30721
          DataSet = fdbs134
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."'#26448#26009#32534#30721'"]')
          ParentFont = False
        end
        object Shape13: TfrxShapeView
          Left = 506.457020000000000000
          Top = 58.692950000000000000
          Width = 181.417440000000000000
          Height = 49.133890000000000000
        end
        object BarCode1: TfrxBarCodeView
          Left = 549.590910000000000000
          Top = 60.590600000000000000
          Width = 79.000000000000000000
          Height = 49.133890000000000000
          BarType = bcCode128
          DataField = #26465#24418#30721
          DataSet = fdbs134
          DataSetName = 'frxDBDataset1'
          Rotation = 0
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
        end
        object Shape14: TfrxShapeView
          Left = 445.764070000000000000
          Top = 107.385900000000000000
          Width = 264.567100000000000000
          Height = 343.937230000000000000
        end
        object Line1: TfrxLineView
          Left = 446.205010000000000000
          Top = 132.283550000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 445.984540000000000000
          Top = 177.519790000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 445.984540000000000000
          Top = 221.756030000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line4: TfrxLineView
          Left = 445.984540000000000000
          Top = 244.992270000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 445.984540000000000000
          Top = 268.228510000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line6: TfrxLineView
          Left = 445.984540000000000000
          Top = 291.464750000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line7: TfrxLineView
          Left = 445.984540000000000000
          Top = 338.700990000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line8: TfrxLineView
          Left = 445.984540000000000000
          Top = 361.937230000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line9: TfrxLineView
          Left = 445.984540000000000000
          Top = 407.071120000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line10: TfrxLineView
          Left = 514.457020000000100000
          Top = 108.267780000000000000
          Height = 343.937230000000100000
          Color = clBlack
          Diagonal = True
        end
        object Line11: TfrxLineView
          Left = 563.031849999999900000
          Top = 107.488250000000000000
          Height = 343.937230000000100000
          Color = clBlack
          Diagonal = True
        end
        object Line12: TfrxLineView
          Left = 608.386210000000000000
          Top = 107.488250000000000000
          Height = 343.937230000000100000
          Color = clBlack
          Diagonal = True
        end
        object Line13: TfrxLineView
          Left = 653.417750000000000000
          Top = 107.488250000000000000
          Height = 343.937230000000100000
          Color = clBlack
          Diagonal = True
        end
        object Memo12: TfrxMemoView
          Left = 457.323130000000000000
          Top = 113.826840000000000000
          Width = 34.015770000000010000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #26085#26399)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 521.575140000000100000
          Top = 113.826840000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #25910#20837)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 570.709030000000000000
          Top = 113.826840000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #21457#20986)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 616.063390000000000000
          Top = 113.826840000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #32467#23384)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 661.417750000000000000
          Top = 113.826840000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #32463#25163#20154)
          ParentFont = False
        end
        object Line14: TfrxLineView
          Left = 445.984540000000000000
          Top = 154.960730000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line15: TfrxLineView
          Left = 445.984540000000000000
          Top = 200.315090000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line16: TfrxLineView
          Left = 445.984540000000000000
          Top = 315.260050000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line17: TfrxLineView
          Left = 445.984540000000000000
          Top = 384.071120000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line18: TfrxLineView
          Left = 445.984540000000000000
          Top = 427.086890000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object frxDBDataset1: TfrxMemoView
          Left = 614.063390000000000000
          Top = 136.063080000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = #32467#23384
          DataSet = fdbs134
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."'#32467#23384'"]')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 447.764070000000000000
          Top = 136.063080000000000000
          Width = 64.252010000000040000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[DATE]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 77.929190000000000000
          Top = 107.165430000000000000
          Width = 359.055350000000000000
          Height = 79.370130000000000000
          DataField = #20379#24212#21830
          DataSet = fdbs134
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -37
          Font.Name = #23435#20307
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."'#20379#24212#21830'"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 306.141930000000000000
          Top = 86.929190000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #22791#27880#65306)
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
    Left = 272
    Top = 184
  end
  object cdsQry1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select sum(data0134.quan_on_hand) as qty from data0134'#13#10'inner jo' +
      'in data0133 on data0134.grn_ptr=data0133.rkey'#13#10'inner join data00' +
      '23 on data0133.supp_ptr=data0023.rkey'#13#10'inner join data0017 on da' +
      'ta0134.INVENTORY_PTR=data0017.rkey'#13#10'where data0017.rkey=:rkey17 ' +
      'and data0023.rkey=:rkey23'#13#10'group by data0017.rkey,data0023.rkey'#13 +
      #10
    Params = <
      item
        DataType = ftUnknown
        Name = 'rkey17'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'rkey23'
        ParamType = ptUnknown
      end>
    Left = 352
    Top = 16
  end
end
