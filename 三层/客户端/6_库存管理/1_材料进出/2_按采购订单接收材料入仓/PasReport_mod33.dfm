object frmReport_mod33: TfrmReport_mod33
  Left = 0
  Top = 0
  Caption = #20837#24211#21333#25253#34920'('#32534#30721')'
  ClientHeight = 409
  ClientWidth = 689
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
  object f456: TfrxDBDataset
    UserName = 'f456'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RKEY=RKEY'
      'GRN_NUMBER=GRN_NUMBER'
      'DELIVER_NUMBER=DELIVER_NUMBER'
      'CODE=CODE'
      'SUPPLIER_NAME=SUPPLIER_NAME'
      'ABBR_NAME=ABBR_NAME'
      'ship_DATE=ship_DATE'
      'STATUS=STATUS'
      'TTYPE=TTYPE'
      'REF_NUMBER=REF_NUMBER'
      'PO_NUMBER=PO_NUMBER'
      'EMPLOYEE_NAME=EMPLOYEE_NAME'
      'EMPL_CODE=EMPL_CODE'
      'WAREHOUSE_CODE=WAREHOUSE_CODE'
      'WAREHOUSE_NAME=WAREHOUSE_NAME'
      'ship_BY=ship_BY'
      'CURR_CODE=CURR_CODE'
      'CURR_NAME=CURR_NAME'
      'DEPT_NAME=DEPT_NAME'
      'exch_rate=exch_rate'
      'audited_emplname=audited_emplname'
      'AUDITED_DATE=AUDITED_DATE'
      'v_type=v_type')
    DataSet = cds456
    BCDToCurrency = False
    Left = 168
    Top = 120
  end
  object f22: TfrxDBDataset
    UserName = 'f22'
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
      'amount=amount'
      #35814#32454#20301#32622'='#35814#32454#20301#32622)
    DataSet = cds22
    BCDToCurrency = False
    Left = 168
    Top = 184
  end
  object cds456: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.Data0456.RKEY, dbo.Data0456.GRN_NUMBER, dbo.Data0' +
      '456.DELIVER_NUMBER,'#13#10' dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_N' +
      'AME,'#13#10'  dbo.Data0023.ABBR_NAME, dbo.Data0456.ship_DATE, dbo.Data' +
      '0456.STATUS,'#13#10'  dbo.Data0456.TTYPE, dbo.Data0456.REF_NUMBER, dbo' +
      '.Data0070.PO_NUMBER,'#13#10'  Data0005_1.EMPLOYEE_NAME, Data0005_1.EMP' +
      'L_CODE,'#13#10'  dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.WAREHOUSE_N' +
      'AME, dbo.Data0456.ship_BY,'#13#10'  dbo.Data0001.CURR_CODE, dbo.Data00' +
      '01.CURR_NAME,'#13#10'   dbo.Data0034.DEPT_NAME, dbo.Data0456.exch_rate' +
      ', dbo.Data0005.EMPLOYEE_NAME AS audited_emplname,'#13#10'  dbo.Data045' +
      '6.AUDITED_DATE,'#13#10'  case DATA0456.TTYPE when 1 then '#39#32534#30721#20837#24211#39' when 2' +
      ' then '#39#26434#39033#20837#24211#39' when 3 then '#39#30452#25509#20837#24211#39' when 5 then '#39'VMI'#20837#24211#39' end v_type'#13#10 +
      'FROM         dbo.Data0005 RIGHT OUTER JOIN'#13#10'  dbo.Data0456 INNER' +
      ' JOIN'#13#10'  dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RK' +
      'EY INNER JOIN'#13#10'  dbo.Data0005 AS Data0005_1 ON dbo.Data0456.CREA' +
      'TE_BY = Data0005_1.RKEY INNER JOIN'#13#10'  dbo.Data0015 ON dbo.Data04' +
      '56.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'  dbo.Data0001 ' +
      'ON dbo.Data0456.currency_ptr = dbo.Data0001.RKEY ON dbo.Data0005' +
      '.RKEY = dbo.Data0456.AUDITED_BY LEFT OUTER JOIN'#13#10'  dbo.Data0034 ' +
      'RIGHT OUTER JOIN'#13#10'  dbo.Data0070 ON dbo.Data0034.DEPT_CODE = dbo' +
      '.Data0070.PO_REV_NO ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY'
    Params = <>
    Left = 96
    Top = 120
  end
  object cds22: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13#10'  ' +
      '    dbo.Data0017.INV_DESCRIPTION, dbo.Data0016.LOCATION, '#13#10'     ' +
      ' Data0022.QUANTITY,Data0002.UNIT_NAME,data0022.supplier2,'#13#10'     ' +
      ' dbo.Data0022.BARCODE_ID, dbo.Data0022.EXPIRE_DATE, '#13#10'      Data' +
      '0022.tax_PRICE as price,dbo.Data0022.TAX_2,data0022.rohs,'#13#10'     ' +
      ' Data0022.QUANTITY*Data0022.tax_PRICE as amount,data0022.spec_pl' +
      'ace as '#35814#32454#20301#32622#13#10'FROM dbo.Data0022 INNER JOIN'#13#10'      dbo.Data0017 ON' +
      ' dbo.Data0022.INVENTORY_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'    ' +
      '  dbo.Data0002 ON '#13#10'      dbo.Data0022.LOCATION_PTR_FROM = dbo.D' +
      'ata0002.RKEY INNER JOIN'#13#10'      dbo.Data0016 ON dbo.Data0022.LOCA' +
      'TION_PTR = dbo.Data0016.RKEY'
    Params = <>
    Left = 96
    Top = 184
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42739.593284861090000000
    ReportOptions.LastChange = 42801.624506828700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnAfterPrint = frxReport1AfterPrint
    Left = 248
    Top = 144
    Datasets = <
      item
        DataSet = f22
        DataSetName = 'f22'
      end
      item
        DataSet = f456
        DataSetName = 'f456'
      end
      item
        DataSet = fdb493
        DataSetName = 'fdb493'
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
        Height = 192.756030000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 279.685220000000000000
          Top = 30.236240000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #36135#21697#25509#25910#20973#35777)
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 597.165740000000000000
          Top = 3.779530000000001000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[PAGE#] of [TOTALPAGES#]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 600.945270000000000000
          Top = 30.236240000000000000
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
        object Memo2: TfrxMemoView
          Left = 29.897650000000000000
          Top = 64.252010000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36865#36135#21333#21495':')
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 14.779530000000000000
          Top = 93.047310000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #37319#36141#35746#21333#21495':')
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 41.236240000000000000
          Top = 124.842610000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20379#24212#21830':')
          WordWrap = False
        end
        object Memo5: TfrxMemoView
          Left = 232.567100000000000000
          Top = 65.472480000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20837#20179#31867#22411':')
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 231.448980000000000000
          Top = 94.267780000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20837#20179#21333#21495':')
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 232.567100000000000000
          Top = 126.063080000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20837#20179#26085#26399':')
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 418.575140000000000000
          Top = 66.252010000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #25509#25910#24037#21378':')
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 444.457020000000000000
          Top = 95.826840000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #24065#31181':')
          WordWrap = False
        end
        object Memo10: TfrxMemoView
          Left = 445.913730000000000000
          Top = 126.842610000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #27719#29575':')
          WordWrap = False
        end
        object Memo11: TfrxMemoView
          Left = 11.338590000000000000
          Top = 171.740260000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #26448#26009#32534#30721)
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 147.401670000000000000
          Top = 171.740260000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #26448#26009#21517#31216)
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 291.023810000000000000
          Top = 171.740260000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #26448#26009#35268#26684)
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 445.984540000000000000
          Top = 171.740260000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #25968#37327)
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 494.338900000000000000
          Top = 171.740260000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #21333#20301)
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 544.252320000000000000
          Top = 171.740260000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #21333#20215)
          WordWrap = False
        end
        object Memo17: TfrxMemoView
          Left = 604.724800000000000000
          Top = 172.519790000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #31246#29575'%')
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 668.976810000000000000
          Top = 171.740260000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #37329#39069)
          WordWrap = False
        end
        object f456SUPPLIER_NAME: TfrxMemoView
          Left = 94.488250000000000000
          Top = 147.401670000000000000
          Width = 200.315090000000000000
          Height = 18.897650000000000000
          DataField = 'SUPPLIER_NAME'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."SUPPLIER_NAME"]')
          ParentFont = False
        end
        object f456CODE: TfrxMemoView
          Left = 94.488250000000000000
          Top = 124.724490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CODE'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."CODE"]')
          ParentFont = False
        end
        object f456PO_NUMBER: TfrxMemoView
          Left = 94.488250000000000000
          Top = 92.708720000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'PO_NUMBER'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."PO_NUMBER"]')
          ParentFont = False
        end
        object f456DELIVER_NUMBER: TfrxMemoView
          Left = 94.488250000000000000
          Top = 64.252010000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'DELIVER_NUMBER'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."DELIVER_NUMBER"]')
          ParentFont = False
        end
        object f456GRN_NUMBER: TfrxMemoView
          Left = 298.582870000000000000
          Top = 94.488250000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'GRN_NUMBER'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."GRN_NUMBER"]')
          ParentFont = False
        end
        object f456ship_DATE: TfrxMemoView
          Left = 298.582870000000000000
          Top = 124.724490000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ship_DATE'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."ship_DATE"]')
          ParentFont = False
        end
        object f456WAREHOUSE_CODE: TfrxMemoView
          Left = 483.779840000000000000
          Top = 66.252010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'WAREHOUSE_CODE'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."WAREHOUSE_CODE"]')
          ParentFont = False
        end
        object f456WAREHOUSE_NAME: TfrxMemoView
          Left = 544.252320000000000000
          Top = 67.252010000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DataField = 'WAREHOUSE_NAME'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."WAREHOUSE_NAME"]')
          ParentFont = False
        end
        object f456CURR_CODE: TfrxMemoView
          Left = 483.779840000000000000
          Top = 96.267780000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CURR_CODE'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."CURR_CODE"]')
          ParentFont = False
        end
        object f456exch_rate: TfrxMemoView
          Left = 483.779840000000000000
          Top = 128.504020000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'exch_rate'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."exch_rate"]')
          ParentFont = False
        end
        object f456v_type: TfrxMemoView
          Left = 298.582870000000000000
          Top = 64.252010000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'v_type'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."v_type"]')
          ParentFont = False
        end
        object fdb493Company_Name: TfrxMemoView
          Left = 257.008040000000000000
          Top = 3.779530000000001000
          Width = 177.637910000000000000
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
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Top = 3.779530000000001000
          Width = 139.842610000000000000
          Height = 45.354360000000000000
          DataField = 'Company_Icon'
          DataSet = fdb493
          DataSetName = 'fdb493'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        DataSet = f22
        DataSetName = 'f22'
        RowCount = 0
        object f22INV_PART_NUMBER: TfrxMemoView
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataField = 'INV_PART_NUMBER'
          DataSet = f22
          DataSetName = 'f22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f22."INV_PART_NUMBER"]')
          ParentFont = False
        end
        object f22INV_NAME: TfrxMemoView
          Left = 113.385900000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'INV_NAME'
          DataSet = f22
          DataSetName = 'f22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f22."INV_NAME"]')
          ParentFont = False
        end
        object f22INV_DESCRIPTION: TfrxMemoView
          Left = 260.787570000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          DataField = 'INV_DESCRIPTION'
          DataSet = f22
          DataSetName = 'f22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f22."INV_DESCRIPTION"]')
          ParentFont = False
        end
        object f22QUANTITY: TfrxMemoView
          Left = 444.984540000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'QUANTITY'
          DataSet = f22
          DataSetName = 'f22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f22."QUANTITY"]')
          ParentFont = False
        end
        object f22UNIT_NAME: TfrxMemoView
          Left = 498.118430000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'UNIT_NAME'
          DataSet = f22
          DataSetName = 'f22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f22."UNIT_NAME"]')
          ParentFont = False
        end
        object f22price: TfrxMemoView
          Left = 544.252320000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'price'
          DataSet = f22
          DataSetName = 'f22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f22."price"]')
          ParentFont = False
        end
        object f22TAX_2: TfrxMemoView
          Left = 604.724800000000000000
          Top = 0.779530000000022500
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'TAX_2'
          DataSet = f22
          DataSetName = 'f22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f22."TAX_2"]')
          ParentFont = False
        end
        object f22amount: TfrxMemoView
          Left = 669.756340000000000000
          Top = 0.779530000000022500
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'amount'
          DataSet = f22
          DataSetName = 'f22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f22."amount"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 272.126160000000000000
        Width = 718.110700000000000000
        DataSet = f456
        DataSetName = 'f456'
        RowCount = 0
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 64.252010000000010000
        Top = 377.953000000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          Left = 514.016080000000000000
          Top = 2.779530000000022000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #21512#35745#37329#39069#65306)
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 585.827150000000000000
          Top = 3.779530000000022000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[SUM(<f22."amount">,DetailData1)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Top = 41.574830000000020000
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
        object Memo25: TfrxMemoView
          Left = 207.874150000000000000
          Top = 41.574830000000020000
          Width = 56.692950000000010000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23457#26680#20154#65306)
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 345.055350000000000000
          Top = 41.574830000000020000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23457#26680#26102#38388#65306)
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 552.709030000000000000
          Top = 41.574830000000020000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25910#36135#20154#31614#32626#65306)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 45.354360000000000000
          Top = 41.574830000000020000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataField = 'REF_NUMBER'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."REF_NUMBER"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 264.567100000000000000
          Top = 41.574830000000020000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'audited_emplname'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."audited_emplname"]')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 415.748300000000000000
          Top = 41.574830000000020000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'AUDITED_DATE'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."AUDITED_DATE"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 633.740570000000000000
          Top = 41.574830000000020000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'EMPLOYEE_NAME'
          DataSet = f456
          DataSetName = 'f456'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f456."EMPLOYEE_NAME"]')
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
    Left = 248
    Top = 208
  end
  object cds493s: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    Left = 104
    Top = 256
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
    Left = 168
    Top = 256
  end
end
