object frmshuReport_Mod564: TfrmshuReport_Mod564
  Left = 0
  Top = 0
  Caption = 'frmshuReport_Mod564'
  ClientHeight = 364
  ClientWidth = 664
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
    Left = 168
    Top = 8
  end
  object dtstprvdr1: TDataSetProvider
    DataSet = qry1
    Left = 224
    Top = 8
  end
  object cds493: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    Left = 120
    Top = 152
  end
  object fdbs493: TfrxDBDataset
    UserName = 'f493'
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
    Left = 200
    Top = 152
  end
  object cds149: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0149.* ,data0023.supplier_name,data0023.BILLING_ADDRE' +
      'SS_1,data0023.phone,data0023.CONTACT_NAME_1,'#13#10'data0070.po_number' +
      ',data0133.grn_number,data0070.PO_DATE,data0071.quan_ord,data0002' +
      '.unit_name,'#13#10'data0017.inv_part_number,data0017.inv_part_descript' +
      'ion,data0134.quantity,data0134.tax_price,'#13#10'data0133.create_date,' +
      'data0149.rtn_quantity*data0149.tax_price as '#36864#36135#37329#39069#13#10'from data0149'#13 +
      #10'inner join data0017 on data0149.inventory_ptr=data0017.rkey'#13#10'in' +
      'ner join data0724 on data0149.gon_ptr=data0724.rkey '#13#10'inner join' +
      ' data0023 on data0724.supplier_ptr=data0023.rkey'#13#10'inner join dat' +
      'a0134 on data0149.d0134_ptr=data0134.rkey  '#13#10'inner join data0133' +
      ' on data0134.grn_ptr=data0133.rkey'#13#10'inner join data0002 on data0' +
      '134.unit_ptr=data0002.rkey'#13#10'left outer join data0070 on data0133' +
      '.po_ptr=data0070.rkey'#13#10'left outer join data0071 on data0134.sour' +
      'ce_ptr=data0071.rkey'#13#10'where data0724.ttype=0 '
    Params = <>
    Left = 120
    Top = 104
  end
  object fdbs149: TfrxDBDataset
    UserName = 'fdbs149'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RKEY=RKEY'
      'GON_PTR=GON_PTR'
      'D0134_PTR=D0134_PTR'
      'INVENTORY_PTR=INVENTORY_PTR'
      'QUANTITY=QUANTITY'
      'RTN_QUANTITY=RTN_QUANTITY'
      'tax_price=tax_price'
      'TAX_2=TAX_2'
      'D724_IDKey=D724_IDKey'
      'supplier_name=supplier_name'
      'BILLING_ADDRESS_1=BILLING_ADDRESS_1'
      'phone=phone'
      'CONTACT_NAME_1=CONTACT_NAME_1'
      'po_number=po_number'
      'grn_number=grn_number'
      'PO_DATE=PO_DATE'
      'quan_ord=quan_ord'
      'unit_name=unit_name'
      'inv_part_number=inv_part_number'
      'inv_part_description=inv_part_description'
      'quantity_1=quantity_1'
      'tax_price_1=tax_price_1'
      'create_date=create_date'
      #36864#36135#37329#39069'='#36864#36135#37329#39069)
    DataSet = cds149
    BCDToCurrency = False
    Left = 200
    Top = 104
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42739.441933773100000000
    ReportOptions.LastChange = 42801.623672951390000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 272
    Top = 120
    Datasets = <
      item
        DataSet = fdbs493
        DataSetName = 'f493'
      end
      item
        DataSet = fdbs149
        DataSetName = 'fdbs149'
      end
      item
        DataSet = fdbs724
        DataSetName = 'fdbs724'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 134.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 328.819109999999900000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo24: TfrxMemoView
          Left = 275.126160000000000000
          Top = 3.779530000000001000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name'
          DataSet = fdbs493
          DataSetName = 'f493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f493."Company_Name"]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 297.803340000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #20379#24212#21830'VMI'#36864#36135#21333)
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 92.724490000000000000
          Top = 52.370130000000000000
          Width = 56.692950000000000000
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
        object Memo27: TfrxMemoView
          Left = 92.724490000000000000
          Top = 74.385900000000010000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #32852#31995#20154#65306)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 105.504020000000000000
          Top = 96.622140000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30005#35805#65306)
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 105.504020000000000000
          Top = 118.637910000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #22320#22336#65306)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 65.590600000000000000
          Top = 146.874150000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #37319#36141#35746#21333#21495#65306)
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 54.590600000000000000
          Top = 172.330860000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #37319#36141#35746#21333#26085#26399#65306)
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Left = 411.189240000000000000
          Top = 50.370130000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25171#21360#26085#26399#65306)
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 411.189240000000000000
          Top = 73.826840000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20986#20179#21333#21495#65306)
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = -0.440940000000000000
          Top = 141.756030000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo34: TfrxMemoView
          Left = 81.590600000000000000
          Top = 196.787570000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333#25968#37327#65306)
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 81.590600000000000000
          Top = 221.244280000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26448#26009#20195#30721#65306)
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          Left = 54.590600000000000000
          Top = 243.700990000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26448#26009#21517#31216#35268#26684#65306)
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          Left = 81.590600000000000000
          Top = 266.157700000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25509#25910#25968#37327#65306)
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          Left = 81.590600000000000000
          Top = 288.614410000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25910#36135#26085#26399#65306)
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          Left = 81.590600000000000000
          Top = 311.071120000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #36864#36135#25968#37327#65306)
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 385.953000000000000000
          Top = 146.315090000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25910#36135#21333#21495#65306)
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 385.953000000000000000
          Top = 171.771800000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#36141#21333#20301#65306)
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 400.953000000000000000
          Top = 196.228510000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #31246#29575'%'#65306)
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 385.953000000000000000
          Top = 220.685220000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25509#25910#21333#20215#65306)
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          Left = 389.732530000000000000
          Top = 310.512060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #36864#36135#37329#39069#65306)
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          Left = 150.401670000000000000
          Top = 53.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'supplier_name'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."supplier_name"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 150.401670000000000000
          Top = 74.826840000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CONTACT_NAME_1'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."CONTACT_NAME_1"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 150.401670000000000000
          Top = 97.283549999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'phone'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."phone"]')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          Left = 150.401670000000000000
          Top = 118.740260000000000000
          Width = 340.157700000000000000
          Height = 18.897650000000000000
          DataField = 'BILLING_ADDRESS_1'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."BILLING_ADDRESS_1"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 485.000310000000000000
          Top = 73.826840000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'gon_number'
          DataSet = fdbs724
          DataSetName = 'fdbs724'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs724."gon_number"]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 483.000310000000000000
          Top = 50.590599999999990000
          Width = 94.488250000000000000
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
        object Memo50: TfrxMemoView
          Left = 156.401670000000000000
          Top = 147.315090000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'po_number'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."po_number"]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          Left = 156.401670000000000000
          Top = 172.771800000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'PO_DATE'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."PO_DATE"]')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          Left = 156.401670000000000000
          Top = 197.228510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'quan_ord'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."quan_ord"]')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          Left = 156.401670000000000000
          Top = 221.685220000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'inv_part_number'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."inv_part_number"]')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          Left = 156.401670000000000000
          Top = 244.141930000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'inv_part_description'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."inv_part_description"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 156.401670000000000000
          Top = 266.598640000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'quantity_1'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."quantity_1"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 156.401670000000000000
          Top = 289.055350000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'create_date'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."create_date"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 156.401670000000000000
          Top = 311.512060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'RTN_QUANTITY'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."RTN_QUANTITY"]')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          Left = 461.543600000000000000
          Top = 146.315090000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'grn_number'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."grn_number"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 457.764070000000000000
          Top = 171.771800000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'unit_name'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."unit_name"]')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          Left = 457.764070000000000000
          Top = 196.228510000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TAX_2'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."TAX_2"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 457.764070000000000000
          Top = 220.685220000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'tax_price'
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."tax_price"]')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          Left = 461.543600000000000000
          Top = 310.512060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #36864#36135#37329#39069
          DataSet = fdbs149
          DataSetName = 'fdbs149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs149."'#36864#36135#37329#39069'"]')
          ParentFont = False
        end
      end
      object Picture1: TfrxPictureView
        Left = 6.118119999999999000
        Top = 15.338590000000000000
        Width = 86.929190000000000000
        Height = 60.472480000000000000
        DataField = 'Company_Icon'
        DataSet = fdbs493
        DataSetName = 'f493'
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 408.189240000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Left = 105.826840000000000000
          Top = 0.440940000000011900
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #22791#27880#65306)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 402.748300000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #21046#20316#20154#65306)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 151.181200000000000000
          Top = 0.440940000000011900
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'ref_number'
          DataSet = fdbs724
          DataSetName = 'fdbs724'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs724."ref_number"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 461.102660000000000000
          Top = 0.440940000000011900
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'employee_name'
          DataSet = fdbs724
          DataSetName = 'fdbs724'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdbs724."employee_name"]')
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
  object cds724: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0724.rkey,data0724.gon_number,data0724.ttype,data0724' +
      '.status,'#13#10'case data0724.ttype'#13#10'when 0 then '#39#36864#36135#20986#20179#39#13#10'when 1 then '#39 +
      #39046#26009#20986#20179#39' end as stype,'#13#10'case data0724.status'#13#10'when 0 then '#39#26410#20986#24211#39#13#10'wh' +
      'en 1 then '#39#24050#20986#24211#39' end as sstatus,'#13#10'data0724.create_date,data0724.r' +
      'ef_number,'#13#10'data0015.warehouse_code,data0015.warehouse_name,'#13#10'da' +
      'ta0005.employee_name ,data0005_1.employee_name employee_name_1,'#13 +
      #10'data0023.code,data0023.supplier_name'#13#10'from data0724 inner join'#13 +
      #10'data0015 on data0724.warehouse_ptr=data0015.rkey inner join'#13#10'da' +
      'ta0023 on data0724.supplier_ptr=data0023.rkey inner join'#13#10'data00' +
      '05 on data0724.create_by=data0005.rkey inner join'#13#10'data0005 as d' +
      'ata0005_1 on data0724.recd_by=data0005_1.rkey'#13#10'where data0724.tt' +
      'ype=0'
    Params = <>
    Left = 120
    Top = 216
  end
  object fdbs724: TfrxDBDataset
    UserName = 'fdbs724'
    CloseDataSource = False
    FieldAliases.Strings = (
      'rkey=rkey'
      'gon_number=gon_number'
      'ttype=ttype'
      'status=status'
      'stype=stype'
      'sstatus=sstatus'
      'create_date=create_date'
      'ref_number=ref_number'
      'warehouse_code=warehouse_code'
      'warehouse_name=warehouse_name'
      'employee_name=employee_name'
      'employee_name_1=employee_name_1'
      'code=code'
      'supplier_name=supplier_name')
    DataSet = cds724
    BCDToCurrency = False
    Left = 200
    Top = 216
  end
end
