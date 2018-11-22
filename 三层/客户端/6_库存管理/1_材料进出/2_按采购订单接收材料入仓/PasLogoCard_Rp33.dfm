object frmLogoCard_Rp33: TfrmLogoCard_Rp33
  Left = 0
  Top = 0
  Caption = #29289#26009#26631#35782#21345#25253#34920
  ClientHeight = 254
  ClientWidth = 480
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
      
        'data0023.ABBR_NAME as '#20379#24212#21830',data0017.INV_NAME as '#26448#26009#21517#31216',Data0022.BAR' +
        'CODE_ID as '#22791#27880','
      
        'data0017.INV_DESCRIPTION as '#35268#26684#22411#21495',data0017.INV_PART_NUMBER as '#26448#26009#32534 +
        #30721','
      'data0022.quantity as '#25910#20837',data0022.SUPPLIER2 as  '#29983#20135#25209#21495','
      'CONVERT(varchar(100), data0456.ship_date, 23) as '#26085#26399
      'from data0022'
      'inner join data0456 on data0022.GRN_PTR=data0456.rkey'
      'inner join data0023 on data0456.supp_ptr=data0023.rkey'
      'inner join data0017 on data0022.INVENTORY_PTR=data0017.rkey'
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
    object qry1备注: TStringField
      FieldName = #22791#27880
      Size = 50
    end
    object qry1规格型号: TStringField
      FieldName = #35268#26684#22411#21495
      Size = 70
    end
    object qry1材料编码: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object qry1收入: TFloatField
      FieldName = #25910#20837
    end
    object qry1日期: TStringField
      FieldName = #26085#26399
      ReadOnly = True
      Size = 100
    end
    object qry1生产批号: TStringField
      FieldName = #29983#20135#25209#21495
      Size = 30
    end
  end
  object dtstprvdr1: TDataSetProvider
    DataSet = qry1
    Left = 224
    Top = 8
  end
  object cds22: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0017.rkey as rkey17,data0023.rkey as rkey23,cast(data' +
      '0017.rkey as varchar)+'#39'#'#39'+cast(data0023.rkey as varchar) as '#26465#24418#30721',' +
      #13#10'data0023.CODE as '#20379#24212#21830#20195#30721',data0023.SUPPLIER_NAME as '#20379#24212#21830#21517#31216','#13#10'data0' +
      '023.ABBR_NAME as '#20379#24212#21830',data0017.INV_NAME as '#26448#26009#21517#31216',Data0022.BARCODE_' +
      'ID as '#22791#27880','#13#10'data0017.INV_DESCRIPTION as '#35268#26684#22411#21495',data0017.INV_PART_NU' +
      'MBER as '#26448#26009#32534#30721','#13#10'data0022.quantity as '#25910#20837',data0022.SUPPLIER2 as  '#29983#20135 +
      #25209#21495','#13#10'CONVERT(varchar(100), data0456.ship_date, 23) as '#26085#26399#13#10'from d' +
      'ata0022'#13#10'inner join data0456 on data0022.GRN_PTR=data0456.rkey'#13#10 +
      'inner join data0023 on data0456.supp_ptr=data0023.rkey'#13#10'inner jo' +
      'in data0017 on data0022.INVENTORY_PTR=data0017.rkey'
    Params = <>
    OnCalcFields = cds22CalcFields
    Left = 112
    Top = 80
    object cds22rkey17: TAutoIncField
      FieldName = 'rkey17'
      ReadOnly = True
    end
    object cds22rkey23: TAutoIncField
      FieldName = 'rkey23'
      ReadOnly = True
    end
    object cds22条形码: TStringField
      FieldName = #26465#24418#30721
      ReadOnly = True
      Size = 61
    end
    object cds22供应商代码: TStringField
      FieldName = #20379#24212#21830#20195#30721
      Size = 10
    end
    object cds22供应商名称: TStringField
      FieldName = #20379#24212#21830#21517#31216
      Size = 100
    end
    object cds22供应商: TStringField
      FieldName = #20379#24212#21830
      Size = 16
    end
    object cds22材料名称: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object cds22备注: TStringField
      FieldName = #22791#27880
      Size = 50
    end
    object cds22规格型号: TStringField
      FieldName = #35268#26684#22411#21495
      Size = 70
    end
    object cds22材料编码: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object cds22收入: TFloatField
      FieldName = #25910#20837
    end
    object cds22日期: TStringField
      FieldName = #26085#26399
      ReadOnly = True
      Size = 100
    end
    object cds22结存: TFloatField
      FieldKind = fkCalculated
      FieldName = #32467#23384
      Calculated = True
    end
    object cds22生产批号: TStringField
      FieldName = #29983#20135#25209#21495
      Size = 30
    end
  end
  object fdbs22: TfrxDBDataset
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
      #22791#27880'='#22791#27880
      #35268#26684#22411#21495'='#35268#26684#22411#21495
      #26448#26009#32534#30721'='#26448#26009#32534#30721
      #25910#20837'='#25910#20837
      #26085#26399'='#26085#26399
      #32467#23384'='#32467#23384
      #29983#20135#25209#21495'='#29983#20135#25209#21495)
    DataSet = cds22
    BCDToCurrency = False
    Left = 184
    Top = 80
  end
  object cds493s: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    Left = 120
    Top = 146
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
    Top = 146
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42801.661260127300000000
    ReportOptions.LastChange = 42836.494461805560000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 256
    Top = 80
    Datasets = <
      item
        DataSet = fdb493
        DataSetName = 'fdb493'
      end
      item
        DataSet = fdbs22
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Style1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end>
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
        Height = 468.661720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Picture1: TfrxPictureView
          Left = 7.559060000000000000
          Top = 7.559059999999999000
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
          Left = 207.874150000000000000
          Top = 7.559059999999999000
          Width = 321.260050000000000000
          Height = 22.677180000000000000
          DataField = 'Company_Name'
          DataSet = fdb493
          DataSetName = 'fdb493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdb493."Company_Name"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 241.889920000000000000
          Top = 35.795300000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name3'
          DataSet = fdb493
          DataSetName = 'fdb493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[fdb493."Company_Name3"]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 287.244280000000000000
          Top = 60.252010000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29289#26009#26631#35782#21345)
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          Left = 3.779530000000000000
          Top = 104.708720000000000000
          Width = 438.425480000000000000
          Height = 83.149660000000000000
        end
        object Shape2: TfrxShapeView
          Left = 11.338590000000000000
          Top = 112.267780000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
        end
        object Memo4: TfrxMemoView
          Left = 18.897650000000000000
          Top = 113.267780000000000000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20379#24212#21830#65306)
          ParentFont = False
        end
        object Shape3: TfrxShapeView
          Left = 79.370130000000000000
          Top = 108.267780000000000000
          Width = 359.055350000000000000
          Height = 75.590600000000000000
        end
        object Memo5: TfrxMemoView
          Left = 78.929190000000000000
          Top = 106.826840000000000000
          Width = 347.716760000000000000
          Height = 75.590600000000000000
          DataField = #20379#24212#21830
          DataSet = fdbs22
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
        object Shape4: TfrxShapeView
          Left = 3.779530000000000000
          Top = 187.858380000000000000
          Width = 438.425480000000000000
          Height = 105.826840000000000000
        end
        object Shape5: TfrxShapeView
          Left = 11.338590000000000000
          Top = 195.417440000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
        end
        object Memo6: TfrxMemoView
          Left = 12.897650000000000000
          Top = 196.417440000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26448#26009#21517#31216#65306)
          ParentFont = False
        end
        object Shape6: TfrxShapeView
          Left = 79.370130000000000000
          Top = 190.417440000000000000
          Width = 359.055350000000000000
          Height = 102.047310000000000000
        end
        object Memo7: TfrxMemoView
          Left = 82.929190000000000000
          Top = 190.976500000000000000
          Width = 351.496290000000000000
          Height = 98.267780000000000000
          DataField = #26448#26009#21517#31216
          DataSet = fdbs22
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
          Left = 3.779530000000000000
          Top = 294.008040000000000000
          Width = 438.425480000000000000
          Height = 173.858380000000000000
        end
        object Shape8: TfrxShapeView
          Left = 11.338590000000000000
          Top = 299.567100000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
        end
        object Memo8: TfrxMemoView
          Left = 12.897650000000000000
          Top = 301.567100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35268#26684#22411#21495#65306)
          ParentFont = False
        end
        object Shape9: TfrxShapeView
          Left = 79.370130000000000000
          Top = 298.567100000000000000
          Width = 359.055350000000000000
          Height = 170.078850000000000000
        end
        object Memo9: TfrxMemoView
          Left = 82.929190000000000000
          Top = 300.126160000000000000
          Width = 351.496290000000000000
          Height = 166.299320000000000000
          DataField = #35268#26684#22411#21495
          DataSet = fdbs22
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
          Left = 5.338590000000000000
          Top = 86.811070000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26448#26009#32534#30721#65306)
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 79.149660000000000000
          Top = 87.590600000000000000
          Width = 343.937230000000000000
          Height = 18.897650000000000000
          DataField = #26448#26009#32534#30721
          DataSet = fdbs22
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."'#26448#26009#32534#30721'"]')
          ParentFont = False
        end
        object Shape13: TfrxShapeView
          Left = 502.677490000000000000
          Top = 55.913420000000000000
          Width = 181.417440000000000000
          Height = 49.133890000000000000
        end
        object BarCode1: TfrxBarCodeView
          Left = 545.811380000000000000
          Top = 57.811070000000000000
          Width = 79.000000000000000000
          Height = 49.133890000000000000
          BarType = bcCode128
          DataField = #26465#24418#30721
          DataSet = fdbs22
          DataSetName = 'frxDBDataset1'
          Rotation = 0
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
        end
        object Shape14: TfrxShapeView
          Left = 441.984540000000000000
          Top = 104.606370000000000000
          Width = 264.567100000000000000
          Height = 362.834880000000000000
          GroupIndex = 1
        end
        object Line1: TfrxLineView
          Left = 442.425480000000000000
          Top = 132.504020000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 442.205010000000000000
          Top = 178.740260000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 442.205010000000000000
          Top = 202.976500000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line4: TfrxLineView
          Left = 442.205010000000000000
          Top = 253.212740000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 442.205010000000000000
          Top = 278.448980000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line6: TfrxLineView
          Left = 442.205010000000000000
          Top = 301.685220000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line7: TfrxLineView
          Left = 442.205010000000000000
          Top = 348.921460000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line8: TfrxLineView
          Left = 442.205010000000000000
          Top = 374.157700000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line9: TfrxLineView
          Left = 442.205010000000000000
          Top = 398.291590000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line10: TfrxLineView
          Left = 510.677490000000000000
          Top = 105.488250000000000000
          Height = 362.834880000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line11: TfrxLineView
          Left = 559.252320000000100000
          Top = 104.708720000000000000
          Height = 362.834880000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line12: TfrxLineView
          Left = 604.606680000000000000
          Top = 104.708720000000000000
          Height = 362.834880000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line13: TfrxLineView
          Left = 649.638220000000000000
          Top = 104.708720000000000000
          Height = 362.834880000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo12: TfrxMemoView
          Left = 453.543600000000000000
          Top = 112.047310000000000000
          Width = 34.015770000000010000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26085#26399)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 517.795610000000000000
          Top = 112.047310000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25910#20837)
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 566.929499999999900000
          Top = 112.047310000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #21457#20986)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 612.283860000000000000
          Top = 112.047310000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #32467#23384)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 657.638220000000000000
          Top = 112.047310000000000000
          Width = 45.354360000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #32463#25163#20154)
          ParentFont = False
        end
        object Line14: TfrxLineView
          Left = 442.205010000000000000
          Top = 154.960730000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line15: TfrxLineView
          Left = 442.205010000000000000
          Top = 226.771800000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line16: TfrxLineView
          Left = 442.205010000000000000
          Top = 325.039580000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line17: TfrxLineView
          Left = 442.205010000000000000
          Top = 423.307360000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line18: TfrxLineView
          Left = 442.205010000000000000
          Top = 445.984540000000000000
          Width = 264.567100000000000000
          Color = clBlack
          Diagonal = True
        end
        object frxDBDataset1: TfrxMemoView
          Left = 609.063390000000000000
          Top = 134.283550000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = #32467#23384
          DataSet = fdbs22
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
          Left = 441.764070000000000000
          Top = 136.063080000000000000
          Width = 68.031539999999990000
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
    Left = 256
    Top = 144
  end
  object cdsQry1: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select sum(data0022.quan_on_hand) as qty from data0022'#13#10'inner jo' +
      'in data0456 on data0022.grn_ptr=data0456.rkey'#13#10'inner join data00' +
      '23 on data0456.supp_ptr=data0023.rkey'#13#10'inner join data0017 on da' +
      'ta0022.INVENTORY_PTR=data0017.rkey'#13#10'where data0017.rkey=:rkey17 ' +
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
    Left = 344
    Top = 24
  end
end
