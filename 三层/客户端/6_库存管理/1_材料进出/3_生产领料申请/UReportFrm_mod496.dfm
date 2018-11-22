object frmReport_mod496: TfrmReport_mod496
  Left = 0
  Top = 0
  Caption = #25253#34920
  ClientHeight = 367
  ClientWidth = 775
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object frxdbdtst268: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'rkey=rkey'
      'number=number'
      'dept_ptr=dept_ptr'
      'DATE=DATE'
      'EMPL_PTR=EMPL_PTR'
      'status=status'
      'auth_emplptr=auth_emplptr'
      'auth_date=auth_date'
      'reference=reference'
      'DEPT_CODE=DEPT_CODE'
      'DEPT_NAME=DEPT_NAME'
      'EMPL_CODE=EMPL_CODE'
      'abbr_name=abbr_name'
      'Auditcode=Auditcode'
      'Auditname=Auditname'
      'cut_no=CUT_NO'
      'status_c=status_c'
      'auth_ptr=auth_ptr'
      'rkey94=rkey94'
      'CODE=CODE'
      'PURCHASE_APPROV_DESC=PURCHASE_APPROV_DESC'
      'fac_name=fac_name'
      'warehouse_ptr=warehouse_ptr'
      'Prted=Prted'
      'allow_submit=allow_submit'
      'allow_submit_c=allow_submit_c'
      'allow_submit_person_code=allow_submit_person_code'
      'allow_submit_person_name=allow_submit_person_name'
      'allow_submit_time=allow_submit_time'
      'control_ptr=control_ptr')
    DataSet = cds268
    BCDToCurrency = False
    Left = 299
    Top = 56
  end
  object frxdbdtst468: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'RKEY=RKEY'
      'CUT_NO=CUT_NO'
      'SO_NO=SO_NO'
      'FLOW_NO=FLOW_NO'
      'STEP=STEP'
      'DEPT_PTR=DEPT_PTR'
      'INVENT_PTR=INVENT_PTR'
      'QUAN_BOM=QUAN_BOM'
      'STATUS=STATUS'
      'PRINTIT=PRINTIT'
      'VENDOR=VENDOR'
      'Invent_or=Invent_or'
      'quan_alloc=quan_alloc'
      'overproof=overproof'
      'INV_PART_NUMBER=INV_PART_NUMBER'
      'INV_PART_DESCRIPTION=INV_PART_DESCRIPTION'
      'unit_name=unit_name'
      'PRINTIT_S=PRINTIT_S'
      'control_ptr=control_ptr'
      'control_name=control_name'
      'remark=remark'
      'supplier_ptr=supplier_ptr'
      'ExReason=ExReason'
      'standards=standards'
      'quan_onhand=quan_onhand'
      'QUAN_ISSUED=QUAN_ISSUED')
    DataSet = cds468
    BCDToCurrency = False
    Left = 299
    Top = 120
  end
  object cds268: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT     dbo.DATA0268.rkey, dbo.DATA0268.number, dbo.DATA0268.' +
      'dept_ptr, dbo.DATA0268.DATE, dbo.DATA0268.EMPL_PTR, dbo.DATA0268' +
      '.status, '#13#10'                      dbo.DATA0268.auth_emplptr, dbo.' +
      'DATA0268.auth_date, dbo.DATA0268.reference, dbo.Data0034.DEPT_CO' +
      'DE, dbo.Data0034.DEPT_NAME, '#13#10'                      dbo.Data0005' +
      '.EMPL_CODE, dbo.Data0005.EMPLOYEE_NAME AS abbr_name, Data0005_1.' +
      'EMPL_CODE AS Auditcode, '#13#10'                      Data0005_1.EMPLO' +
      'YEE_NAME AS Auditname, dbo.Data0268.cut_no,'#13#10'                   ' +
      '   CASE WHEN data0268.status = 0 THEN '#39#24453#25552#20132#39' WHEN data0268.status' +
      ' = 1 THEN '#39#24453#23457#26680#39' WHEN data0268.status = 2 THEN '#39#24050#23457#26680#39' WHEN data026' +
      '8.status'#13#10'                       = 3 THEN '#39#34987#36864#22238#39' WHEN data0268.st' +
      'atus = 4 THEN '#39#24050#21457#26009#39' END AS status_c, dbo.DATA0268.auth_ptr, dbo.' +
      'Data0094.RKEY AS rkey94, '#13#10'                      dbo.Data0094.CO' +
      'DE, dbo.Data0094.PURCHASE_APPROV_DESC, dbo.Data0015.ABBR_NAME AS' +
      ' fac_name, dbo.DATA0268.warehouse_ptr, '#13#10'                      d' +
      'bo.DATA0268.Prted, dbo.DATA0268.allow_submit, '#13#10'                ' +
      '      CASE WHEN data0268.allow_submit = 0 THEN '#39#19981#30830#35748#39' WHEN data02' +
      '68.allow_submit = 1 THEN '#39#24453#30830#35748#39' WHEN data0268.allow_submit = 2 TH' +
      'EN '#39#24050#30830#35748#39#13#10'                               WHEN data0268.allow_sub' +
      'mit = 3 THEN '#39#24453#30830#35748#39#13#10'                       END AS allow_submit_c' +
      ', Data0005_2.EMPL_CODE AS allow_submit_person_code, Data0005_2.E' +
      'MPLOYEE_NAME AS allow_submit_person_name, '#13#10'                    ' +
      '  dbo.DATA0268.allow_submit_time, dbo.DATA0268.control_ptr,dbo.D' +
      'ATA0268.IsMsgSended '#13#10'FROM         dbo.DATA0268 INNER JOIN'#13#10'    ' +
      '                  dbo.Data0034 ON dbo.DATA0268.dept_ptr = dbo.Da' +
      'ta0034.RKEY INNER JOIN'#13#10'                      dbo.Data0005 ON db' +
      'o.DATA0268.EMPL_PTR = dbo.Data0005.RKEY LEFT JOIN'#13#10'             ' +
      '         dbo.Data0005 AS Data0005_1 ON dbo.DATA0268.auth_emplptr' +
      ' = Data0005_1.RKEY INNER JOIN'#13#10'                      dbo.Data009' +
      '4 ON dbo.DATA0268.auth_ptr = dbo.Data0094.RKEY INNER JOIN'#13#10'     ' +
      '                 dbo.Data0015 ON dbo.DATA0268.warehouse_ptr = db' +
      'o.Data0015.RKEY LEFT JOIN'#13#10'                      dbo.Data0005 AS' +
      ' Data0005_2 ON dbo.DATA0268.allow_submit_person = Data0005_2.RKE' +
      'Y'#13#10'where 1=1'#13#10
    Params = <>
    Left = 200
    Top = 56
  end
  object cds468: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT      dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.Data0468' +
      '.SO_NO, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, '#13#10'dbo.Data0468.' +
      'DEPT_PTR, dbo.Data0468.INVENT_PTR, dbo.Data0468.QUAN_BOM, '#39#39' as ' +
      'QUAN_ISSUED, '#13#10'dbo.Data0468.STATUS, dbo.Data0468.PRINTIT, dbo.Da' +
      'ta0468.VENDOR, dbo.Data0468.Invent_or,dbo.Data0468.quan_alloc,'#13#10 +
      'dbo.Data0468.overproof, dbo.Data0017.INV_PART_NUMBER, dbo.Data00' +
      '17.INV_PART_DESCRIPTION,data0002.unit_name,'#13#10'case dbo.Data0468.P' +
      'RINTIT when '#39'Y'#39' then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VMI'#24211#23384#39' END AS PRINTIT' +
      '_S, '#13#10'data0468.control_ptr,d136.control_name,dbo.Data0468.remark' +
      ',data0468.supplier_ptr,data0468.ExReason,'#13#10'data0468.standards,da' +
      'ta0017.quan_on_hand-data0017.QUAN_ASSIGN as quan_onhand'#13#10'FROM   ' +
      '      dbo.Data0468 '#13#10'INNER JOIN    dbo.Data0017 ON dbo.Data0468.' +
      'INVENT_PTR = dbo.Data0017.RKEY'#13#10' inner join data0002 on data0017' +
      '.STOCK_UNIT_PTR=data0002.rkey'#13#10' left join data0136 d136 on data0' +
      '468.control_ptr=d136.rkey'#13#10'where  1=1'
    Params = <>
    Left = 200
    Top = 120
  end
  object frxrprt1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42669.611309213000000000
    ReportOptions.LastChange = 42863.595015740700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnAfterPrintReport = frxrprt1AfterPrintReport
    Left = 432
    Top = 80
    Datasets = <
      item
        DataSet = frxdbdtst268
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxdbdtst468
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      LeftMargin = 6.400000000000000000
      RightMargin = 6.400000000000000000
      TopMargin = 6.400000000000000000
      BottomMargin = 6.400000000000000000
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 38.015770000000000000
        Top = 181.417440000000000000
        Width = 745.323316000000000000
        DataSet = frxdbdtst468
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2INVENT_PTR: TfrxMemoView
          Left = 0.338590000000000000
          Width = 83.149660000000000000
          Height = 37.795300000000000000
          DataField = 'INV_PART_NUMBER'
          DataSet = frxdbdtst468
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."INV_PART_NUMBER"]')
          ParentFont = False
        end
        object frxDBDataset2INV_PART_DESCRIPTION: TfrxMemoView
          Left = 82.708720000000000000
          Width = 238.110390000000000000
          Height = 37.795300000000000000
          DataField = 'INV_PART_DESCRIPTION'
          DataSet = frxdbdtst468
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."INV_PART_DESCRIPTION"]')
          ParentFont = False
        end
        object frxDBDataset2QUAN_BOM: TfrxMemoView
          Left = 386.244280000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          DataField = 'QUAN_BOM'
          DataSet = frxdbdtst468
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset2."QUAN_BOM"]')
          ParentFont = False
        end
        object frxDBDataset2unit_name: TfrxMemoView
          Left = 500.323130000000000000
          Width = 52.913420000000000000
          Height = 37.795300000000000000
          DataField = 'unit_name'
          DataSet = frxdbdtst468
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."unit_name"]')
          ParentFont = False
        end
        object frxDBDataset2QUAN_ISSUED: TfrxMemoView
          Left = 442.614410000000000000
          Width = 56.692950000000000000
          Height = 37.795300000000000000
          DataField = 'QUAN_ISSUED'
          DataSet = frxdbdtst468
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset2."QUAN_ISSUED"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 322.039580000000000000
          Top = 0.220470000000006000
          Width = 64.252010000000000000
          Height = 37.795300000000000000
          DataField = 'quan_onhand'
          DataSet = frxdbdtst468
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset2."quan_onhand"]')
          ParentFont = False
        end
        object frxDBDataset2remark: TfrxMemoView
          Left = 644.197280000000000000
          Width = 109.606370000000000000
          Height = 37.795300000000000000
          DataField = 'remark'
          DataSet = frxdbdtst468
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[frxDBDataset2."remark"]')
          ParentFont = False
        end
        object frxDBDataset2VENDOR: TfrxMemoView
          Left = 553.268090000000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
          DataField = 'VENDOR'
          DataSet = frxdbdtst468
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."VENDOR"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 745.323316000000000000
        DataSet = frxdbdtst268
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo1: TfrxMemoView
          Left = 249.448980000000000000
          Top = 3.779530000000001000
          Width = 158.740260000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #29983#20135#39046#26009#30003#35831#21333)
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 10.897650000000000000
          Top = 11.338590000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24037#21378#21517':')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 10.897650000000000000
          Top = 41.574830000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30003#35831#20154':')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 10.897650000000000000
          Top = 71.811070000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25209#20934#20154':')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 241.889920000000000000
          Top = 41.574830000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #37096#38376#21517#31216)
          ParentFont = False
        end
        object frxDBDataset1DEPT_NAME: TfrxMemoView
          Left = 309.921460000000000000
          Top = 41.574830000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'DEPT_NAME'
          DataSet = frxdbdtst268
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."DEPT_NAME"]')
          ParentFont = False
        end
        object frxDBDataset1fac_name: TfrxMemoView
          Left = 68.031540000000000000
          Top = 11.338590000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'fac_name'
          DataSet = frxdbdtst268
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."fac_name"]')
          ParentFont = False
        end
        object frxDBDataset1abbr_name: TfrxMemoView
          Left = 68.031540000000000000
          Top = 41.574830000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'abbr_name'
          DataSet = frxdbdtst268
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."abbr_name"]')
          ParentFont = False
        end
        object frxDBDataset1Auditname: TfrxMemoView
          Left = 64.252010000000000000
          Top = 69.811070000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'Auditname'
          DataSet = frxdbdtst268
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."Auditname"]')
          ParentFont = False
        end
        object frxDBDataset1number1: TfrxMemoView
          Left = 619.842920000000000000
          Top = 26.456710000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          DataField = 'number'
          DataSet = frxdbdtst268
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."number"]')
        end
        object Memo12: TfrxMemoView
          Left = 551.811380000000000000
          Top = 26.456710000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30003#35831#21333#21495':')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 551.811380000000000000
          Top = 56.692949999999990000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30003#35831#26085#26399)
          ParentFont = False
        end
        object frxDBDataset1DATE: TfrxMemoView
          Left = 623.622450000000000000
          Top = 56.692949999999990000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DataField = 'DATE'
          DataSet = frxdbdtst268
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATE"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 132.283550000000000000
        Width = 745.323316000000000000
        object Memo2: TfrxMemoView
          Top = 3.779529999999994000
          Width = 83.149660000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #29289#26009#32534#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 83.149660000000000000
          Top = 3.779529999999994000
          Width = 238.110390000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #21517#31216'/'#35268#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 386.464750000000000000
          Top = 3.559059999999988000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #30003#39046#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 443.275820000000000000
          Top = 3.779529999999994000
          Width = 56.692950000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #23454#21457#25968)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 500.205010000000000000
          Top = 3.779529999999994000
          Width = 52.913420000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #21333#20301)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 321.260050000000000000
          Top = 3.779529999999994000
          Width = 64.252010000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #24211#23384#25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 644.079160000000000000
          Top = 3.779529999999994000
          Width = 109.606370000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #22791#27880)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 553.268090000000000000
          Top = 3.779529999999994000
          Width = 90.708720000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            #20379#24212#21830)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 71.811070000000000000
        Top = 279.685220000000000000
        Width = 745.323316000000000000
        object Memo3: TfrxMemoView
          Left = 18.897650000000000000
          Top = 7.559059999999988000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #21457#26009#20154':')
        end
        object frxDBDataset1reference: TfrxMemoView
          Left = 480.000310000000000000
          Top = 7.559059999999988000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'reference'
          DataSet = frxdbdtst268
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."reference"]')
        end
        object Memo4: TfrxMemoView
          Left = 15.118120000000000000
          Top = 37.795300000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20801#35768#25552#20132#20154#21592':')
        end
        object Memo5: TfrxMemoView
          Left = 203.417440000000000000
          Top = 3.779530000000022000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #39046#26009#31614#25910':')
        end
        object Memo6: TfrxMemoView
          Left = 376.378170000000000000
          Top = 38.015769999999970000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20801#35768#25552#20132#26102#38388':')
        end
        object Line1: TfrxLineView
          Left = 86.929190000000000000
          Top = 26.456709999999990000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 282.787570000000000000
          Top = 26.456709999999990000
          Width = 124.724490000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo7: TfrxMemoView
          Left = 423.307360000000000000
          Top = 7.559059999999988000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #22791#27880':')
        end
        object frxDBDataset1allow_submit_person_name: TfrxMemoView
          Left = 113.385900000000000000
          Top = 36.795300000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          DataField = 'allow_submit_person_name'
          DataSet = frxdbdtst268
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."allow_submit_person_name"]')
        end
        object frxDBDataset1allow_submit_time: TfrxMemoView
          Left = 476.425480000000000000
          Top = 36.015769999999970000
          Width = 143.622140000000000000
          Height = 26.456710000000000000
          DataField = 'allow_submit_time'
          DataSet = frxdbdtst268
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."allow_submit_time"]')
        end
      end
    end
  end
  object qry1: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=62ddf8f60269678;Persist Security In' +
      'fo=True;User ID=WZPCBConnect;Initial Catalog=sj_v20_live;Data So' +
      'urce=172.16.8.112'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT      dbo.Data0468.RKEY, dbo.Data0468.CUT_NO, dbo.Data0468' +
        '.SO_NO, dbo.Data0468.FLOW_NO, dbo.Data0468.STEP, '
      
        'dbo.Data0468.DEPT_PTR, dbo.Data0468.INVENT_PTR, dbo.Data0468.QUA' +
        'N_BOM, '#39#39' as QUAN_ISSUED, '
      
        'dbo.Data0468.STATUS, dbo.Data0468.PRINTIT, dbo.Data0468.VENDOR, ' +
        'dbo.Data0468.Invent_or,dbo.Data0468.quan_alloc,'
      
        'dbo.Data0468.overproof, dbo.Data0017.INV_PART_NUMBER, dbo.Data00' +
        '17.INV_PART_DESCRIPTION,data0002.unit_name,'
      
        'case dbo.Data0468.PRINTIT when '#39'Y'#39' then '#39#26222#36890#24211#23384#39' when '#39'N'#39' then '#39'VM' +
        'I'#24211#23384#39' END AS PRINTIT_S, '
      
        'data0468.control_ptr,d136.control_name,dbo.Data0468.remark,data0' +
        '468.supplier_ptr,data0468.ExReason,'
      
        'data0468.standards,data0017.quan_on_hand-data0017.QUAN_ASSIGN as' +
        ' quan_onhand'
      'FROM         dbo.Data0468 '
      
        'INNER JOIN    dbo.Data0017 ON dbo.Data0468.INVENT_PTR = dbo.Data' +
        '0017.RKEY'
      ' inner join data0002 on data0017.STOCK_UNIT_PTR=data0002.rkey'
      ' left join data0136 d136 on data0468.control_ptr=d136.rkey'
      'where  1=0')
    Left = 152
    Top = 232
    object qry1RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object qry1CUT_NO: TStringField
      FieldName = 'CUT_NO'
      FixedChar = True
      Size = 12
    end
    object qry1SO_NO: TStringField
      FieldName = 'SO_NO'
      FixedChar = True
      Size = 12
    end
    object qry1FLOW_NO: TIntegerField
      FieldName = 'FLOW_NO'
    end
    object qry1STEP: TSmallintField
      FieldName = 'STEP'
    end
    object qry1DEPT_PTR: TIntegerField
      FieldName = 'DEPT_PTR'
    end
    object qry1INVENT_PTR: TIntegerField
      FieldName = 'INVENT_PTR'
    end
    object qry1QUAN_BOM: TFloatField
      FieldName = 'QUAN_BOM'
    end
    object qry1STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object qry1PRINTIT: TStringField
      FieldName = 'PRINTIT'
      FixedChar = True
      Size = 1
    end
    object qry1VENDOR: TStringField
      FieldName = 'VENDOR'
      Size = 30
    end
    object qry1Invent_or: TSmallintField
      FieldName = 'Invent_or'
    end
    object qry1quan_alloc: TBCDField
      FieldName = 'quan_alloc'
      Precision = 9
      Size = 2
    end
    object qry1overproof: TWordField
      FieldName = 'overproof'
    end
    object qry1INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object qry1INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object qry1unit_name: TStringField
      FieldName = 'unit_name'
    end
    object qry1PRINTIT_S: TStringField
      FieldName = 'PRINTIT_S'
      ReadOnly = True
      Size = 8
    end
    object qry1control_ptr: TIntegerField
      FieldName = 'control_ptr'
    end
    object qry1control_name: TStringField
      FieldName = 'control_name'
      Size = 50
    end
    object qry1remark: TStringField
      FieldName = 'remark'
      Size = 500
    end
    object qry1supplier_ptr: TIntegerField
      FieldName = 'supplier_ptr'
    end
    object qry1ExReason: TStringField
      FieldName = 'ExReason'
      Size = 200
    end
    object qry1standards: TStringField
      FieldName = 'standards'
    end
    object qry1quan_onhand: TFloatField
      FieldName = 'quan_onhand'
      ReadOnly = True
    end
    object qry1QUAN_ISSUED: TStringField
      FieldName = 'QUAN_ISSUED'
      ReadOnly = True
      Size = 1
    end
  end
end
