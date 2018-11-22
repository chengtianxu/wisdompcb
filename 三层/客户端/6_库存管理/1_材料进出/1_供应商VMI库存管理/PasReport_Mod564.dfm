object frmReport_Mod564: TfrmReport_Mod564
  Left = 0
  Top = 0
  Caption = 'frmReport_Mod564'
  ClientHeight = 377
  ClientWidth = 565
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
  object cds133: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0133.*,'#13#10'  dbo.Data0023.CODE, dbo.Data0023.SUPPLI' +
      'ER_NAME,'#13#10'  dbo.Data0023.ABBR_NAME, dbo.Data0133.ship_DATE, dbo.' +
      'Data0070.PO_NUMBER,'#13#10'  Data0005.EMPLOYEE_NAME, Data0005.EMPL_COD' +
      'E,'#13#10'  dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_NAME, ' +
      #13#10'  dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME,  dbo.Data003' +
      '4.DEPT_NAME,'#13#10'  case DATA0133.TTYPE when 1 then '#39#32534#30721#20837#20179#39' when 3 th' +
      'en '#39#30452#25509#20837#20179#39' end v_type'#13#10'FROM dbo.Data0133 INNER JOIN'#13#10'  dbo.Data00' +
      '23 ON dbo.Data0133.SUPP_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'  db' +
      'o.Data0005 AS Data0005 ON dbo.Data0133.CREATE_BY = Data0005.RKEY' +
      ' INNER JOIN'#13#10'  dbo.Data0015 ON dbo.Data0133.warehouse_ptr = dbo.' +
      'Data0015.RKEY INNER JOIN'#13#10'  dbo.Data0001 ON dbo.Data0133.currenc' +
      'y_ptr = dbo.Data0001.RKEY LEFT OUTER JOIN'#13#10'  dbo.Data0070 ON dbo' +
      '.Data0133.PO_PTR = dbo.Data0070.RKEY LEFT OUTER JOIN'#13#10'  dbo.Data' +
      '0034 ON dbo.Data0034.DEPT_CODE = dbo.Data0070.PO_REV_NO '
    Params = <>
    Left = 80
    Top = 104
  end
  object cds134: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13#10'  ' +
      '    dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, '#13#10'     ' +
      ' Data0134.QUANTITY,Data0002.UNIT_NAME,data0134.supplier2,'#13#10'     ' +
      ' dbo.Data0134.BARCODE_ID, dbo.Data0134.EXPIRE_DATE, '#13#10'      Data' +
      '0134.tax_PRICE as price,dbo.Data0134.TAX_2,data0134.rohs,'#13#10'     ' +
      ' Data0134.QUANTITY*Data0134.tax_PRICE as amount'#13#10'FROM dbo.Data01' +
      '34 INNER JOIN'#13#10'      dbo.Data0017 ON dbo.Data0134.INVENTORY_PTR ' +
      '= dbo.Data0017.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON '#13#10'      db' +
      'o.Data0134.UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'#13#10'      dbo.Da' +
      'ta0016 ON dbo.Data0134.LOCATION_PTR = dbo.Data0016.RKEY'
    Params = <>
    Left = 80
    Top = 176
  end
  object cds493: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    Left = 80
    Top = 256
  end
  object fdbs133: TfrxDBDataset
    UserName = 'f133'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RKEY=RKEY'
      'GRN_NUMBER=GRN_NUMBER'
      'DELIVER_NUMBER=DELIVER_NUMBER'
      'warehouse_ptr=warehouse_ptr'
      'SUPP_PTR=SUPP_PTR'
      'currency_ptr=currency_ptr'
      'exch_rate=exch_rate'
      'PO_PTR=PO_PTR'
      'TTYPE=TTYPE'
      'CREATE_DATE=CREATE_DATE'
      'CREATE_BY=CREATE_BY'
      'ship_DATE=ship_DATE'
      'ship_BY=ship_BY'
      'REF_NUMBER=REF_NUMBER'
      'PRINTED=PRINTED'
      'TSTATUS=TSTATUS'
      'IDKey=IDKey'
      'CODE=CODE'
      'SUPPLIER_NAME=SUPPLIER_NAME'
      'ABBR_NAME=ABBR_NAME'
      'ship_DATE_1=ship_DATE_1'
      'PO_NUMBER=PO_NUMBER'
      'EMPLOYEE_NAME=EMPLOYEE_NAME'
      'EMPL_CODE=EMPL_CODE'
      'WAREHOUSE_CODE=WAREHOUSE_CODE'
      'WAREHOUSE_NAME=WAREHOUSE_NAME'
      'CURR_CODE=CURR_CODE'
      'CURR_NAME=CURR_NAME'
      'DEPT_NAME=DEPT_NAME'
      'v_type=v_type')
    DataSet = cds133
    BCDToCurrency = False
    Left = 160
    Top = 104
  end
  object fdbs134: TfrxDBDataset
    UserName = 'f134'
    CloseDataSource = False
    FieldAliases.Strings = (
      'INV_PART_NUMBER=INV_PART_NUMBER'
      'INV_NAME=INV_NAME'
      'INV_DESCRIPTION=INV_DESCRIPTION'
      'LOCATION=LOCATION'
      'QUANTITY=QUANTITY'
      'UNIT_NAME=UNIT_NAME'
      'supplier2=supplier2'
      'BARCODE_ID=BARCODE_ID'
      'EXPIRE_DATE=EXPIRE_DATE'
      'price=price'
      'TAX_2=TAX_2'
      'rohs=rohs'
      'amount=amount')
    DataSet = cds134
    BCDToCurrency = False
    Left = 160
    Top = 176
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
    Left = 160
    Top = 256
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42738.476134618100000000
    ReportOptions.LastChange = 42802.699942488430000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnAfterPrint = frxReport1AfterPrint
    Left = 240
    Top = 160
    Datasets = <
      item
        DataSet = fdbs133
        DataSetName = 'f133'
      end
      item
        DataSet = fdbs134
        DataSetName = 'f134'
      end
      item
        DataSet = fdbs493
        DataSetName = 'f493'
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
      PaperHeight = 140.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 173.858380000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object f133WAREHOUSE_NAME: TfrxMemoView
          Left = 257.008040000000000000
          Top = 7.559059999999999000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'WAREHOUSE_NAME'
          DataSet = fdbs133
          DataSetName = 'f133'
          Memo.UTF8W = (
            '[f133."WAREHOUSE_NAME"]')
          WordWrap = False
        end
        object Memo1: TfrxMemoView
          Left = 268.346630000000000000
          Top = 34.015770000000010000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'VMI'#36135#21697#25509#25910#20973#35777)
        end
        object Memo2: TfrxMemoView
          Left = 26.118120000000000000
          Top = 70.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36865#36135#21333#21495':')
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 11.000000000000000000
          Top = 96.385900000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #37319#36141#35746#21333#21495':')
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 37.456710000000000000
          Top = 125.181200000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20379#24212#21830':')
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 246.787570000000000000
          Top = 71.811070000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20837#20179#31867#22411':')
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 300.582870000000000000
          Top = 97.606370000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20837#20179#21333#21495':')
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 301.700990000000000000
          Top = 122.622140000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20837#20179#26085#26399':')
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 414.795610000000000000
          Top = 72.590600000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #25509#25910#24037#21378':')
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 495.590910000000000000
          Top = 99.165430000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #24065#31181':')
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 497.047620000000000000
          Top = 123.401670000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #27719#29575':')
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 7.559060000000000000
          Top = 155.078850000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #26448#26009#32534#30721)
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 143.622140000000000000
          Top = 155.078850000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #26448#26009#21517#31216)
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 287.244280000000000000
          Top = 155.078850000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #26448#26009#35268#26684)
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 442.205010000000000000
          Top = 155.078850000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #25968#37327)
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 487.559370000000000000
          Top = 155.078850000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #21333#20301)
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 540.472790000000000000
          Top = 155.078850000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #21333#20215)
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 600.945270000000000000
          Top = 155.858380000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #31246#29575'%')
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 665.197280000000000000
          Top = 155.078850000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #37329#39069)
          WordWrap = False
        end
        object f133DELIVER_NUMBER: TfrxMemoView
          Left = 92.708720000000000000
          Top = 69.031540000000010000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DELIVER_NUMBER'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."DELIVER_NUMBER"]')
          ParentFont = False
        end
        object f133PO_NUMBER: TfrxMemoView
          Left = 94.488250000000000000
          Top = 95.267780000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PO_NUMBER'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."PO_NUMBER"]')
          ParentFont = False
        end
        object f133EMPL_CODE: TfrxMemoView
          Left = 93.488250000000000000
          Top = 125.283550000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'SUPPLIER_NAME'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."SUPPLIER_NAME"]')
          ParentFont = False
        end
        object f133v_type: TfrxMemoView
          Left = 311.039580000000000000
          Top = 69.811070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'v_type'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."v_type"]')
          ParentFont = False
        end
        object f133GRN_NUMBER: TfrxMemoView
          Left = 365.953000000000000000
          Top = 95.267780000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'GRN_NUMBER'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."GRN_NUMBER"]')
          ParentFont = False
        end
        object f133ship_DATE: TfrxMemoView
          Left = 365.953000000000000000
          Top = 122.504020000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ship_DATE'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."ship_DATE"]')
          ParentFont = False
        end
        object f133WAREHOUSE_CODE: TfrxMemoView
          Left = 479.590910000000000000
          Top = 71.811070000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'WAREHOUSE_CODE'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."WAREHOUSE_CODE"]')
          ParentFont = False
        end
        object f133WAREHOUSE_NAME1: TfrxMemoView
          Left = 532.504330000000000000
          Top = 71.811070000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'WAREHOUSE_NAME'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."WAREHOUSE_NAME"]')
          ParentFont = False
        end
        object f133CURR_CODE: TfrxMemoView
          Left = 538.283860000000000000
          Top = 99.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CURR_CODE'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."CURR_CODE"]')
          ParentFont = False
        end
        object f133exch_rate: TfrxMemoView
          Left = 538.283860000000000000
          Top = 122.504020000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'exch_rate'
          DataSet = fdbs133
          DataSetName = 'f133'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f133."exch_rate"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        DataSet = fdbs134
        DataSetName = 'f134'
        RowCount = 0
        object f134INV_PART_NUMBER: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'INV_PART_NUMBER'
          DataSet = fdbs134
          DataSetName = 'f134'
          Memo.UTF8W = (
            '[f134."INV_PART_NUMBER"]')
        end
        object f134INV_NAME: TfrxMemoView
          Left = 143.622140000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'INV_NAME'
          DataSet = fdbs134
          DataSetName = 'f134'
          Memo.UTF8W = (
            '[f134."INV_NAME"]')
        end
        object f134INV_DESCRIPTION: TfrxMemoView
          Left = 279.685220000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'INV_DESCRIPTION'
          DataSet = fdbs134
          DataSetName = 'f134'
          Memo.UTF8W = (
            '[f134."INV_DESCRIPTION"]')
        end
        object f134QUANTITY: TfrxMemoView
          Left = 445.984540000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'QUANTITY'
          DataSet = fdbs134
          DataSetName = 'f134'
          Memo.UTF8W = (
            '[f134."QUANTITY"]')
        end
        object f134UNIT_NAME: TfrxMemoView
          Left = 492.559370000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'UNIT_NAME'
          DataSet = fdbs134
          DataSetName = 'f134'
          Memo.UTF8W = (
            '[f134."UNIT_NAME"]')
        end
        object f134price: TfrxMemoView
          Left = 540.693260000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'price'
          DataSet = fdbs134
          DataSetName = 'f134'
          Memo.UTF8W = (
            '[f134."price"]')
        end
        object f134TAX_2: TfrxMemoView
          Left = 601.165740000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'TAX_2'
          DataSet = fdbs134
          DataSetName = 'f134'
          Memo.UTF8W = (
            '[f134."TAX_2"]')
        end
        object f134amount: TfrxMemoView
          Left = 664.299630000000000000
          Width = 60.472480000000030000
          Height = 18.897650000000000000
          DataField = 'amount'
          DataSet = fdbs134
          DataSetName = 'f134'
          Memo.UTF8W = (
            '[f134."amount"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 408.189240000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 2.559059999999988000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #22791#27880)
        end
        object f133REF_NUMBER: TfrxMemoView
          Left = 45.354360000000000000
          Top = 2.559059999999988000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = 'REF_NUMBER'
          DataSet = fdbs133
          DataSetName = 'f133'
          Memo.UTF8W = (
            '[f133."REF_NUMBER"]')
        end
        object Memo20: TfrxMemoView
          Left = 487.559370000000000000
          Top = 2.559059999999988000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #25910#36135#20154#31614#21517':')
        end
        object f133EMPLOYEE_NAME: TfrxMemoView
          Left = 566.929499999999900000
          Top = 2.559059999999988000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'EMPLOYEE_NAME'
          DataSet = fdbs133
          DataSetName = 'f133'
          Memo.UTF8W = (
            '[f133."EMPLOYEE_NAME"]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 23.897650000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
        object Memo21: TfrxMemoView
          Left = 506.457020000000000000
          Top = 2.779530000000022000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #37329#39069#21512#35745':')
        end
        object SysMemo1: TfrxSysMemoView
          Left = 589.606680000000000000
          Top = 2.779530000000022000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[SUM(<f134."amount">,DetailData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 3.779530000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        DataSet = fdbs133
        DataSetName = 'f133'
        RowCount = 0
      end
      object Picture1: TfrxPictureView
        Left = 5.338590000000000000
        Top = 11.456710000000000000
        Width = 105.826840000000000000
        Height = 52.913420000000000000
        DataField = 'Company_Icon'
        DataSet = fdbs493
        DataSetName = 'f493'
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
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
    Left = 240
    Top = 232
  end
end
