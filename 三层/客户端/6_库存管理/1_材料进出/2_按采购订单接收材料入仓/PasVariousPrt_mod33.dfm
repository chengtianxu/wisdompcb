object frmVariousPrt_mod33: TfrmVariousPrt_mod33
  Left = 0
  Top = 0
  Caption = #20837#24211#21333#25253#34920'('#26434#39033')'
  ClientHeight = 374
  ClientWidth = 551
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
      'urce=172.16.8.112'
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
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintMode = pmJoin
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42739.593284861090000000
    ReportOptions.LastChange = 42801.624646446760000000
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
        DataSet = f235
        DataSetName = 'f235'
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
        Height = 143.622140000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 279.685220000000000000
          Top = 30.236239999999990000
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
        object Memo2: TfrxMemoView
          Left = 356.937230000000000000
          Top = 85.708720000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36865#36135#21333#21495':')
          WordWrap = False
        end
        object Memo3: TfrxMemoView
          Left = 3.440940000000000000
          Top = 89.047310000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36141#35746#21333#21495':')
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 14.779530000000000000
          Top = 56.811070000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20379#24212#21830':')
          WordWrap = False
        end
        object Memo6: TfrxMemoView
          Left = 545.149970000000100000
          Top = 56.472479999999990000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20837#20179#21333#21495':')
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 546.268090000000000000
          Top = 84.267780000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20837#20179#26085#26399':')
          WordWrap = False
        end
        object Memo9: TfrxMemoView
          Left = 383.984540000000000000
          Top = 58.031540000000010000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #24065#31181':')
          WordWrap = False
        end
        object Memo12: TfrxMemoView
          Left = 15.118120000000000000
          Top = 124.606370000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #26448#26009#21517#31216)
          WordWrap = False
        end
        object Memo13: TfrxMemoView
          Left = 188.976500000000000000
          Top = 124.385900000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #26448#26009#35268#26684)
          WordWrap = False
        end
        object Memo14: TfrxMemoView
          Left = 514.016080000000000000
          Top = 126.385900000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #25968#37327)
          WordWrap = False
        end
        object Memo15: TfrxMemoView
          Left = 437.645950000000000000
          Top = 124.606370000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #21333#20301)
          WordWrap = False
        end
        object Memo16: TfrxMemoView
          Left = 593.386210000000000000
          Top = 126.385900000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #21333#20215)
          WordWrap = False
        end
        object Memo18: TfrxMemoView
          Left = 657.638220000000000000
          Top = 126.385900000000000000
          Width = 34.015770000000010000
          Height = 18.897650000000000000
          AutoWidth = True
          Memo.UTF8W = (
            #37329#39069)
          WordWrap = False
        end
        object f456SUPPLIER_NAME: TfrxMemoView
          Left = 71.811070000000000000
          Top = 56.692949999999990000
          Width = 260.787570000000000000
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
        object f456PO_NUMBER: TfrxMemoView
          Left = 71.811070000000000000
          Top = 88.708720000000000000
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
          Left = 421.527830000000000000
          Top = 85.708720000000000000
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
          Left = 612.283860000000000000
          Top = 56.692949999999990000
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
          Left = 612.283860000000000000
          Top = 82.929190000000000000
          Width = 102.047310000000000000
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
        object f456CURR_CODE: TfrxMemoView
          Left = 423.307360000000000000
          Top = 58.472479999999990000
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
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 64.252010000000000000
        Top = 332.598640000000000000
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
        object Memo24: TfrxMemoView
          Left = 510.236550000000000000
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
          Left = 184.874150000000000000
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
          Left = 322.055350000000000000
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
          Left = 4.677180000000000000
          Top = 41.574830000000020000
          Width = 71.811070000000030000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20837#24211#21592#24037#65306)
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          Left = 551.811380000000000000
          Top = 41.574830000000020000
          Width = 162.519790000000000000
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
          Left = 241.567100000000000000
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
          Left = 392.748300000000000000
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
          Left = 77.708720000000000000
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
        object SysMemo1: TfrxSysMemoView
          Left = 585.827150000000000000
          Top = 3.779530000000022000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[SUM(<f235."amount">,DetailData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = f456
        DataSetName = 'f456'
        RowCount = 0
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        DataSet = f235
        DataSetName = 'f235'
        RowCount = 0
        object f235DESCRIPTION: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779529999999994000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRIPTION'
          DataSet = f235
          DataSetName = 'f235'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f235."DESCRIPTION"]')
          ParentFont = False
        end
        object f235GUI_GE: TfrxMemoView
          Left = 185.196970000000000000
          Top = 3.779529999999994000
          Width = 245.669450000000000000
          Height = 18.897650000000000000
          DataField = 'GUI_GE'
          DataSet = f235
          DataSetName = 'f235'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f235."GUI_GE"]')
          ParentFont = False
        end
        object f235UNIT_NAME: TfrxMemoView
          Left = 438.425480000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'UNIT_NAME'
          DataSet = f235
          DataSetName = 'f235'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f235."UNIT_NAME"]')
          ParentFont = False
        end
        object f235QUAN_RECD: TfrxMemoView
          Left = 514.016080000000000000
          Top = 3.779529999999994000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'QUAN_RECD'
          DataSet = f235
          DataSetName = 'f235'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f235."QUAN_RECD"]')
          ParentFont = False
        end
        object f235tax_price: TfrxMemoView
          Left = 589.606680000000000000
          Top = 3.779529999999994000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'tax_price'
          DataSet = f235
          DataSetName = 'f235'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f235."tax_price"]')
          ParentFont = False
        end
        object f235amount: TfrxMemoView
          Left = 664.197280000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000030000
          Height = 18.897650000000000000
          DataField = 'amount'
          DataSet = f235
          DataSetName = 'f235'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[f235."amount"]')
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
  object cds235: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT dbo.Data0235.goods_name as DESCRIPTION, dbo.Data0235.good' +
      's_guige as GUI_GE, '#13#10'      dbo.Data0235.goods_type as DESCRIPTIO' +
      'N2, dbo.Data0002.UNIT_NAME, '#13#10'      dbo.Data0235.QUAN_RECD, dbo.' +
      'Data0016.LOCATION, '#13#10'      dbo.Data0235.REF_NUMBER,Data0235.unit' +
      '_price as tax_price, Data0235.state_tax as STATE_TAX,'#13#10'data0235.' +
      'rohs,data0235.quan_recd*Data0235.unit_price as amount'#13#10'FROM dbo.' +
      'Data0235 LEFT JOIN'#13#10'      dbo.Data0072 ON dbo.Data0235.D0072_PTR' +
      ' = dbo.Data0072.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0' +
      '235.unit_ptr = dbo.Data0002.RKEY INNER JOIN'#13#10'      dbo.Data0016 ' +
      'ON dbo.Data0235.location_ptr = dbo.Data0016.RKEY'
    Params = <>
    Left = 96
    Top = 184
  end
  object f235: TfrxDBDataset
    UserName = 'f235'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DESCRIPTION=DESCRIPTION'
      'GUI_GE=GUI_GE'
      'DESCRIPTION2=DESCRIPTION2'
      'UNIT_NAME=UNIT_NAME'
      'QUAN_RECD=QUAN_RECD'
      'LOCATION=LOCATION'
      'REF_NUMBER=REF_NUMBER'
      'tax_price=tax_price'
      'STATE_TAX=STATE_TAX'
      'rohs=rohs'
      'amount=amount')
    DataSet = cds235
    BCDToCurrency = False
    Left = 168
    Top = 184
  end
end
