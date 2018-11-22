object frmSo_report: TfrmSo_report
  Left = 0
  Top = 0
  Width = 459
  Height = 400
  AutoScroll = True
  Caption = #25171#21360#38144#21806#35746#21333
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
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=192.168.8.37'
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
      'select dbo.Data0060.SALES_ORDER,'
      
        '      Data0060.PARTS_ORDERED, Data0060.PART_PRICE, data0060.fob,' +
        'Data0060.RemarkSO,'
      
        '      dbo.Data0060.TOTAL_ADD_L_PRICE, dbo.Data0060.ORIG_SCHED_SH' +
        'IP_DATE, '
      
        '      dbo.Data0060.EXCH_RATE, dbo.Data0001.CURR_NAME, dbo.Data00' +
        '01.CURR_CODE, '
      
        '      dbo.Data0060.ENT_DATE, dbo.Data0060.SHIPPING_METHOD, dbo.D' +
        'ata0025.unit_sq, '
      
        '      data0060.SCH_DATE,Data0025.manu_PART_NUMBER, Data0025.manu' +
        '_PART_DESC, '
      
        '      dbo.Data0060.PARTS_ORDERED * dbo.Data0025.unit_sq AS mianj' +
        'i,'
      
        '      Data0097.PO_NUMBER,Data0097.PO_DATE,Data0010.CUST_CODE,Dat' +
        'a0010.CUSTOMER_NAME'
      'from data0060 inner join'
      'data0097 on data0060.PURCHASE_ORDER_PTR=data0097.rkey inner join'
      'data0025 on data0060.CUST_PART_PTR=data0025.rkey inner join'
      'data0010 on data0060.CUSTOMER_PTR=data0010.rkey inner join'
      'Data0001 on Data0060.CURRENCY_PTR=Data0001.RKEY')
    Left = 168
    Top = 8
  end
  object dtstprvdr1: TDataSetProvider
    DataSet = qry1
    Left = 224
    Top = 8
  end
  object cds493s: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    Left = 120
    Top = 200
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
    Left = 176
    Top = 200
  end
  object cds60: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select dbo.Data0060.SALES_ORDER,'#13#10'      Data0060.PARTS_ORDERED, ' +
      'Data0060.PART_PRICE, data0060.fob,Data0060.RemarkSO,'#13#10'      dbo.' +
      'Data0060.TOTAL_ADD_L_PRICE, dbo.Data0060.ORIG_SCHED_SHIP_DATE, '#13 +
      #10'      dbo.Data0060.EXCH_RATE, dbo.Data0001.CURR_NAME, dbo.Data0' +
      '001.CURR_CODE, '#13#10'      dbo.Data0060.ENT_DATE, dbo.Data0060.SHIPP' +
      'ING_METHOD, dbo.Data0025.unit_sq, '#13#10'      data0060.SCH_DATE,Data' +
      '0025.manu_PART_NUMBER, Data0025.manu_PART_DESC, '#13#10'      dbo.Data' +
      '0060.PARTS_ORDERED * dbo.Data0025.unit_sq AS mianji,'#13#10'      Data' +
      '0097.PO_NUMBER,Data0097.PO_DATE,Data0010.CUST_CODE,Data0010.CUST' +
      'OMER_NAME'#13#10'from data0060 inner join'#13#10'data0097 on data0060.PURCHA' +
      'SE_ORDER_PTR=data0097.rkey inner join'#13#10'data0025 on data0060.CUST' +
      '_PART_PTR=data0025.rkey inner join'#13#10'data0010 on data0060.CUSTOME' +
      'R_PTR=data0010.rkey inner join'#13#10'Data0001 on Data0060.CURRENCY_PT' +
      'R=Data0001.RKEY'
    Params = <>
    Left = 120
    Top = 120
  end
  object fdb60: TfrxDBDataset
    UserName = 'fdb60'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SALES_ORDER=SALES_ORDER'
      'PARTS_ORDERED=PARTS_ORDERED'
      'PART_PRICE=PART_PRICE'
      'fob=fob'
      'RemarkSO=RemarkSO'
      'TOTAL_ADD_L_PRICE=TOTAL_ADD_L_PRICE'
      'ORIG_SCHED_SHIP_DATE=ORIG_SCHED_SHIP_DATE'
      'EXCH_RATE=EXCH_RATE'
      'CURR_NAME=CURR_NAME'
      'CURR_CODE=CURR_CODE'
      'ENT_DATE=ENT_DATE'
      'SHIPPING_METHOD=SHIPPING_METHOD'
      'unit_sq=unit_sq'
      'SCH_DATE=SCH_DATE'
      'manu_PART_NUMBER=manu_PART_NUMBER'
      'manu_PART_DESC=manu_PART_DESC'
      'mianji=mianji'
      'PO_NUMBER=PO_NUMBER'
      'PO_DATE=PO_DATE'
      'CUST_CODE=CUST_CODE'
      'CUSTOMER_NAME=CUSTOMER_NAME')
    DataSet = cds60
    BCDToCurrency = False
    Left = 184
    Top = 120
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43118.612303414390000000
    ReportOptions.LastChange = 43131.632355856490000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnBeforePrint = frxReport1BeforePrint
    Left = 264
    Top = 128
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
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 83.149660000000000000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Top = 7.559059999999988000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #22791#27880#20449#24687)
          ParentFont = False
        end
        object fdb60RemarkSO: TfrxMemoView
          Left = 75.590600000000000000
          Top = 7.559059999999988000
          Width = 616.063390000000000000
          Height = 71.811070000000000000
          DataField = 'RemarkSO'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."RemarkSO"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 26.456710000000000000
        ParentFont = False
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        DataSet = fdb60
        DataSetName = 'fdb60'
        RowCount = 0
        object fdb60SALES_ORDER: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'SALES_ORDER'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."SALES_ORDER"]')
          ParentFont = False
        end
        object fdb60PARTS_ORDERED: TfrxMemoView
          Left = 529.134200000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PARTS_ORDERED'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."PARTS_ORDERED"]')
          ParentFont = False
        end
        object fdb60PART_PRICE: TfrxMemoView
          Left = 593.386210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PART_PRICE'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."PART_PRICE"]')
          ParentFont = False
        end
        object fdb60TOTAL_ADD_L_PRICE: TfrxMemoView
          Left = 650.079160000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_ADD_L_PRICE'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."TOTAL_ADD_L_PRICE"]')
          ParentFont = False
        end
        object fdb60manu_PART_NUMBER: TfrxMemoView
          Left = 105.826840000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'manu_PART_NUMBER'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."manu_PART_NUMBER"]')
          ParentFont = False
        end
        object fdb60manu_PART_DESC: TfrxMemoView
          Left = 222.992270000000000000
          Top = 3.779529999999908000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'manu_PART_DESC'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."manu_PART_DESC"]')
          ParentFont = False
        end
      end
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 136.063080000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Left = 218.212740000000000000
          Top = 2.000000000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name'
          DataSet = fdb493
          DataSetName = 'fdb493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb493."Company_Name"]')
          ParentFont = False
        end
        object Picture2: TfrxPictureView
          Left = 5.559059999999999000
          Width = 90.708720000000000000
          Height = 49.133890000000000000
          DataField = 'Company_Icon'
          DataSet = fdb493
          DataSetName = 'fdb493'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo3: TfrxMemoView
          Left = 267.346630000000000000
          Top = 26.456710000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333#20449#24687)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 3.779530000000000000
          Top = 54.031540000000010000
          Width = 706.772110000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          Left = 29.236240000000000000
          Top = 62.031540000000010000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#35746#21333#21495':')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 42.354360000000000000
          Top = 87.267780000000000000
          Width = 64.252010000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#20195#30721':')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 250.393940000000000000
          Top = 61.252010000000000000
          Width = 68.031540000000040000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333#26085#26399':')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 250.393940000000000000
          Top = 88.047310000000000000
          Width = 68.031540000000040000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#21517#31216':')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 10.338590000000000000
          Top = 111.944960000000000000
          Width = 249.448980000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #29305#21035#35201#27714#39033#30446'        '#20869#23481'                ('#21333#20301')')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 385.307360000000000000
          Top = 108.165430000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #29305#21035#35201#27714#39033#30446'        '#20869#23481'                 ('#21333#20301')')
          ParentFont = False
        end
        object fdb60PO_NUMBER: TfrxMemoView
          Left = 109.606370000000000000
          Top = 62.252010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PO_NUMBER'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."PO_NUMBER"]')
          ParentFont = False
        end
        object fdb60CUST_CODE: TfrxMemoView
          Left = 113.385900000000000000
          Top = 86.929190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CUST_CODE'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."CUST_CODE"]')
          ParentFont = False
        end
        object fdb60CUSTOMER_NAME: TfrxMemoView
          Left = 317.480520000000000000
          Top = 86.929190000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CUSTOMER_NAME'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."CUSTOMER_NAME"]')
          ParentFont = False
        end
        object fdb60ENT_DATE: TfrxMemoView
          Left = 317.480520000000000000
          Top = 60.472480000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ENT_DATE'
          DataSet = fdb60
          DataSetName = 'fdb60'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[fdb60."ENT_DATE"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 83.149660000000010000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = fdb60
        DataSetName = 'fdb60'
        RowCount = 0
        Stretched = True
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 4.338590000000011000
          Width = 313.700990000000000000
          Height = 49.133890000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 373.968770000000000000
          Top = 1.779529999999994000
          Width = 321.260050000000000000
          Height = 49.133890000000000000
          StretchMode = smActualHeight
          AutoWidth = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000010000
          Width = 79.370130000000000000
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
        object Memo12: TfrxMemoView
          Left = 112.944960000000000000
          Top = 64.252010000000010000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20135#21697#26495#21495)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 221.110390000000000000
          Top = 64.252010000000010000
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
        object Memo14: TfrxMemoView
          Left = 449.307360000000000000
          Top = 64.252010000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #22238#22797#20132#26399)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 524.016080000000000000
          Top = 64.252010000000010000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333#25968#37327)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 587.268090000000000000
          Top = 64.252010000000010000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333#20215#26684)
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 650.520100000000000000
          Top = 64.252010000000010000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24037#20855#36153#29992)
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
    Left = 264
    Top = 200
  end
  object cds89: TClientDataSet
    Aggregates = <>
    CommandText = 
      'select data0089.*,Data0278.RKEY,Data0278.PARAMETER_NAME,'#13#10'Data02' +
      '78.PARAMETER_DESC,Data0002.UNIT_NAME,Data0278.SPEC_RKEY'#13#10'from da' +
      'ta0089 inner join Data0278 on data0089.parameter_ptr=Data0278.rk' +
      'ey'#13#10'INNER JOIN Data0002 ON Data0278.UNIT_PTR = Data0002.RKEY'
    Params = <>
    Left = 120
    Top = 72
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 192
    Top = 72
  end
end
