inherited frmPrint_Mod623: TfrmPrint_Mod623
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36830#32493#25171#21360
  ClientHeight = 424
  ClientWidth = 720
  ExplicitWidth = 736
  ExplicitHeight = 462
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 41
    Align = alTop
    TabOrder = 0
    object lbl1: TLabel
      Left = 26
      Top = 14
      Width = 60
      Height = 13
      Caption = #36755#20837#26085#26399#20174
    end
    object lbl2: TLabel
      Left = 195
      Top = 15
      Width = 12
      Height = 13
      Caption = #21040
    end
    object lbl3: TLabel
      Left = 330
      Top = 14
      Width = 24
      Height = 13
      Caption = #23458#25143
    end
    object dtpBegin: TDateTimePicker
      Left = 91
      Top = 11
      Width = 97
      Height = 21
      Date = 43090.000000000000000000
      Time = 43090.000000000000000000
      TabOrder = 2
    end
    object dtpEnd: TDateTimePicker
      Left = 214
      Top = 11
      Width = 97
      Height = 21
      Date = 43090.000000000000000000
      Time = 43090.000000000000000000
      TabOrder = 3
    end
    object btnQuery: TBitBtn
      Left = 494
      Top = 8
      Width = 63
      Height = 25
      Caption = #26597#35810
      TabOrder = 1
      OnClick = btnQueryClick
    end
    object btnSearch: TBitBtn
      Left = 444
      Top = 8
      Width = 26
      Height = 25
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
      TabOrder = 0
      OnClick = btnSearchClick
    end
    object edtCustomer: TEdit
      Left = 359
      Top = 11
      Width = 79
      Height = 21
      TabOrder = 4
      OnExit = edtCustomerExit
      OnKeyPress = edtCustomerKeyPress
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 383
    Width = 720
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnPrint: TBitBtn
      Left = 207
      Top = 4
      Width = 72
      Height = 33
      Caption = #25171#21360
      TabOrder = 0
      OnClick = btnPrintClick
    end
    object btnClose: TBitBtn
      Left = 442
      Top = 4
      Width = 72
      Height = 33
      Caption = #20851#38381
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 41
    Width = 720
    Height = 342
    Align = alClient
    TabOrder = 1
    object eh213: TDBGridEh
      Left = 1
      Top = 1
      Width = 718
      Height = 340
      Align = alClient
      DataSource = ds213
      DynProps = <>
      ReadOnly = True
      TabOrder = 0
      OnDblClick = eh213DblClick
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUST_CODE'
          Footers = <>
          Title.Caption = #23458#25143#20195#30721
          Width = 63
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MANU_PART_NUMBER'
          Footers = <>
          Title.Caption = #26412#21378#32534#21495
          Width = 117
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MANU_PART_DESC'
          Footers = <>
          Title.Caption = #23458#25143#22411#21495
          Width = 105
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ANALYSIS_CODE_2'
          Footers = <>
          Title.Caption = #23458#25143#29289#26009#21495
          Width = 108
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PO_NUMBER'
          Footers = <>
          Title.Caption = #23458#25143#35746#21333#21495
          Width = 85
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORIG_SCHED_SHIP_DATE'
          Footers = <>
          Title.Caption = #20132#26399
          Width = 66
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PARTS_ORDERED'
          Footers = <>
          Title.Caption = #25968#37327
          Width = 58
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PART_PRICE'
          Footers = <>
          Title.Caption = #20215#26684
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object cds213: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT  data0213.RKEY,data0213.MANU_PART_NUMBER,data0213. PO_NUM' +
      'BER'#13#10#9',data0213. ANALYSIS_CODE_2,data0213.MANU_PART_DESC'#13#10#9',data' +
      '0213.ORIG_SCHED_SHIP_DATE,data0213. ORIG_REQUEST_DATE '#13#10#9',data02' +
      '13.PARTS_ORDERED, data0213.PART_PRICE,data0213. CURR_CODE'#13#10#9',dat' +
      'a0213.PO_DATE,data0213.status,data0213. user_ptr, data0213.submi' +
      't_date'#13#10#9',data0213.Parts_ordered*data0213.part_price as total_ca' +
      'se'#13#10#9',data0213.audit_ptr,data0213.audit_date,data0213.so_oldnew,' +
      'data0213.is_alter'#13#10#9',data0213.lis_num,data0010.CUST_CODE,data001' +
      '0.CUSTOMER_NAME,data0010.ABBR_NAME'#13#10#9',D05_1.employee_name as sal' +
      'es_rep_name,data0005.employee_name'#13#10#9',case data0213.status when ' +
      '0 then '#39#26410#25552#20132#39' when 1 then '#39#24050#25552#20132#39' when 2 then '#39#24050#19979#21333' '#39' when 3 then '#39#24050 +
      #23457#26680#39'  end as sstatus'#13#10#9',case so_oldnew when '#39#26032#21333#39' then '#39'True'#39' else' +
      ' '#39'False'#39' end as soNew'#13#10#9',case so_oldnew when '#39#26087#21333#39' then '#39'True'#39' el' +
      'se '#39'False'#39' end as soOld'#13#10#9',case  when (so_oldnew = '#39#26087#21333#39') and (is' +
      '_alter = 1) then '#39'False'#39' else '#39'True'#39' end as soisalter'#13#10#9',case  w' +
      'hen (so_oldnew = '#39#26087#21333#39') and (is_alter = 1) then '#39'True'#39' else '#39'Fals' +
      'e'#39' end as soisnotalter'#13#10'FROM      DATA0213 inner join data0010 o' +
      'n data0213.cust_code = data0010.cust_code'#13#10'                left ' +
      'join data0005 D05_1 on data0010.SALES_REP_PTR = D05_1.rkey'#13#10'    ' +
      '            left join data0005 on data0213.audit_ptr = data0005.' +
      'rkey'#13#10'WHERE   Data0213.status=3 '
    Params = <>
    Left = 232
    Top = 184
    object cds213RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object cds213MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object cds213PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 32
    end
    object cds213ANALYSIS_CODE_2: TStringField
      FieldName = 'ANALYSIS_CODE_2'
      Size = 80
    end
    object cds213MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 80
    end
    object cds213ORIG_SCHED_SHIP_DATE: TDateTimeField
      FieldName = 'ORIG_SCHED_SHIP_DATE'
    end
    object cds213ORIG_REQUEST_DATE: TDateTimeField
      FieldName = 'ORIG_REQUEST_DATE'
    end
    object cds213PARTS_ORDERED: TIntegerField
      FieldName = 'PARTS_ORDERED'
    end
    object cds213PART_PRICE: TFloatField
      FieldName = 'PART_PRICE'
    end
    object cds213CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object cds213PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object cds213status: TSmallintField
      FieldName = 'status'
    end
    object cds213user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object cds213submit_date: TDateTimeField
      FieldName = 'submit_date'
    end
    object cds213total_case: TFloatField
      FieldName = 'total_case'
      ReadOnly = True
    end
    object cds213audit_ptr: TIntegerField
      FieldName = 'audit_ptr'
    end
    object cds213audit_date: TDateTimeField
      FieldName = 'audit_date'
    end
    object cds213so_oldnew: TStringField
      FieldName = 'so_oldnew'
      Size = 50
    end
    object cds213is_alter: TSmallintField
      FieldName = 'is_alter'
    end
    object cds213lis_num: TStringField
      FieldName = 'lis_num'
      Size = 50
    end
    object cds213CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object cds213CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object cds213ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object cds213sales_rep_name: TStringField
      FieldName = 'sales_rep_name'
      Size = 16
    end
    object cds213employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object cds213sstatus: TStringField
      FieldName = 'sstatus'
      ReadOnly = True
      Size = 7
    end
    object cds213soNew: TStringField
      FieldName = 'soNew'
      ReadOnly = True
      Size = 5
    end
    object cds213soOld: TStringField
      FieldName = 'soOld'
      ReadOnly = True
      Size = 5
    end
    object cds213soisalter: TStringField
      FieldName = 'soisalter'
      ReadOnly = True
      Size = 5
    end
    object cds213soisnotalter: TStringField
      FieldName = 'soisnotalter'
      ReadOnly = True
      Size = 5
    end
  end
  object ds213: TDataSource
    DataSet = cds213
    Left = 296
    Top = 184
  end
  object rep213: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43090.680390104200000000
    ReportOptions.LastChange = 43091.592273541670000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 656
    Top = 152
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset213'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset493'
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
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 166.299320000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBDataset493Company_Name: TfrxMemoView
          Left = 120.944960000000000000
          Top = 3.220470000000000000
          Width = 400.630180000000000000
          Height = 22.677180000000000000
          DataField = 'Company_Name'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name"]')
          ParentFont = False
        end
        object frxDBDataset493Company_Name2: TfrxMemoView
          Left = 120.944960000000000000
          Top = 26.677180000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Company_Name2'
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset493'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset493."Company_Name2"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 211.653680000000000000
          Top = 68.031540000000000000
          Width = 234.330860000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35746#21333#29983#20135#30003#35831#21333)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 166.299320000000000000
          Top = 102.047310000000000000
          Width = 309.921460000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Order manufacture application form')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 136.063080000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'TO:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Left = 48.354360000000000000
          Top = 154.960730000000000000
          Width = 132.283550000000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object Picture1: TfrxPictureView
        Left = 3.779530000000000000
        Top = 15.118120000000000000
        Width = 105.826840000000000000
        Height = 56.692950000000000000
        DataField = 'Company_Icon'
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset493'
        HightQuality = False
        Transparent = False
        TransparentColor = clWhite
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        object Shape1: TfrxShapeView
          Left = 7.559060000000000000
          Width = 702.992580000000000000
          Height = 26.456710000000000000
        end
        object Line2: TfrxLineView
          Left = 65.929190000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line3: TfrxLineView
          Left = 165.756030000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line4: TfrxLineView
          Left = 283.464750000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line5: TfrxLineView
          Left = 347.512060000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line6: TfrxLineView
          Left = 431.661720000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo4: TfrxMemoView
          Left = 9.338590000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#20195#30721)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 87.590600000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#22411#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 192.756030000000000000
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23458#25143#35746#21333#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 298.582870000000000000
          Top = 3.779530000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25968#37327)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 374.173470000000000000
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20132#26399)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 517.795610000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #36164#26009#29366#20917)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 68.456710000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset213'
        RowCount = 0
        object Shape5: TfrxShapeView
          Left = 514.016080000000000000
          Top = 46.354360000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape4: TfrxShapeView
          Left = 514.016080000000000000
          Top = 21.897650000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Line7: TfrxLineView
          Left = 7.118120000000000000
          Top = 68.133890000000000000
          Width = 702.992580000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line8: TfrxLineView
          Left = 6.897650000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line9: TfrxLineView
          Left = 709.992580000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line10: TfrxLineView
          Left = 66.370130000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line12: TfrxLineView
          Left = 282.803340000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line13: TfrxLineView
          Left = 347.055350000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line14: TfrxLineView
          Left = 431.205010000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Diagonal = True
        end
        object frxDBDataset213CUST_CODE: TfrxMemoView
          Left = 10.677180000000000000
          Top = 23.118120000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'CUST_CODE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset213."CUST_CODE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset213MANU_PART_DESC: TfrxMemoView
          Left = 72.149660000000000000
          Top = 11.779530000000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
          DataField = 'MANU_PART_DESC'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset213."MANU_PART_DESC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset213PO_NUMBER: TfrxMemoView
          Left = 181.756030000000000000
          Top = 11.779530000000000000
          Width = 90.708720000000000000
          Height = 37.795300000000000000
          DataField = 'PO_NUMBER'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset213."PO_NUMBER"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset213PARTS_ORDERED: TfrxMemoView
          Left = 286.582870000000000000
          Top = 23.118120000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'PARTS_ORDERED'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset213."PARTS_ORDERED"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frxDBDataset213ORIG_SCHED_SHIP_DATE: TfrxMemoView
          Left = 351.834880000000000000
          Top = 23.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'ORIG_SCHED_SHIP_DATE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset213."ORIG_SCHED_SHIP_DATE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CheckBox1: TfrxCheckBoxView
          Left = 446.323130000000000000
          Top = 2.000000000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          CheckStyle = csCheck
          DataField = 'soNew'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
        end
        object CheckBox2: TfrxCheckBoxView
          Left = 446.323130000000000000
          Top = 24.456710000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          CheckStyle = csCheck
          DataField = 'soOld'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
        end
        object Memo10: TfrxMemoView
          Left = 472.779840000000000000
          Top = 2.000000000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #26032#21333' '#24517#39035#38468#35748#21487#35777#20070' '#21495#30721':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 472.779840000000000000
          Top = 22.456710000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #26087#21333)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line11: TfrxLineView
          Left = 166.637910000000000000
          Top = 0.425170000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Diagonal = True
        end
        object frxDBDataset213lis_num: TfrxMemoView
          Left = 627.740570000000000000
          Top = 1.763760000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'lis_num'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset213."lis_num"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object CheckBox3: TfrxCheckBoxView
          Left = 514.354670000000000000
          Top = 23.118120000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          CheckStyle = csCheck
          DataField = 'soisalter'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
        end
        object Memo12: TfrxMemoView
          Left = 540.811380000000000000
          Top = 22.118120000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #25353#20197#21069#36164#26009)
          ParentFont = False
          VAlign = vaCenter
        end
        object CheckBox4: TfrxCheckBoxView
          Left = 514.354670000000000000
          Top = 46.354360000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          CheckColor = clBlack
          CheckStyle = csCheck
          DataField = 'soisnotalter'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset213'
        end
        object Memo13: TfrxMemoView
          Left = 540.811380000000000000
          Top = 46.354360000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #26377#23569#37327#26356#25913','#25353#38468#20214#25913#21160#36164#26009)
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape2: TfrxShapeView
          Left = 445.984540000000000000
          Top = 1.692950000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
        object Shape3: TfrxShapeView
          Left = 445.984540000000000000
          Top = 24.677180000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset213."status"'
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 117.165430000000000000
        Top = 408.189240000000000000
        Width = 718.110700000000000000
        object Line15: TfrxLineView
          Left = 7.779530000000000000
          Top = 67.913420000000000000
          Width = 702.992580000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo14: TfrxMemoView
          Left = 15.118120000000000000
          Top = 7.559060000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #22791#27880':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 7.559060000000000000
          Top = 86.929190000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #19994#21153'('#36319#21333')'#21592':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line18: TfrxLineView
          Left = 97.708720000000000000
          Top = 105.826840000000000000
          Width = 132.283550000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo16: TfrxMemoView
          Left = 290.346630000000000000
          Top = 86.929190000000000000
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
          VAlign = vaCenter
        end
        object Line19: TfrxLineView
          Left = 346.937230000000000000
          Top = 105.826840000000000000
          Width = 132.283550000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo17: TfrxMemoView
          Left = 519.913730000000000000
          Top = 86.929190000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26085#26399':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line20: TfrxLineView
          Left = 566.709030000000000000
          Top = 105.826840000000000000
          Width = 132.283550000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line16: TfrxLineView
          Left = 7.559060000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line17: TfrxLineView
          Left = 710.653990000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Diagonal = True
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 234.740260000000000000
        Top = 585.827150000000000000
        Width = 718.110700000000000000
        object Memo18: TfrxMemoView
          Left = 166.299320000000000000
          Top = 21.677180000000000000
          Width = 408.189240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20197#19978#36164#26009#24050#20132#25509#28165#26970#65292#20855#20307#20132#36135#26102#38388'24'#23567#26102#20869#20250#22238#22797#20320','#35874#35874'!')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Left = 11.338590000000000000
          Top = 56.692950000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #36164#26009#25307#25910#20154':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line22: TfrxLineView
          Left = 95.063080000000000000
          Top = 75.590600000000000000
          Width = 132.283550000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo20: TfrxMemoView
          Left = 445.307360000000000000
          Top = 56.692950000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25509#25910#26102#38388':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line23: TfrxLineView
          Left = 515.575140000000000000
          Top = 75.590600000000000000
          Width = 132.283550000000000000
          Color = clBlack
          Diagonal = True
        end
        object Memo21: TfrxMemoView
          Left = 480.000310000000000000
          Top = 181.826840000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21463#25511'No:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 480.000310000000000000
          Top = 204.504020000000000000
          Width = 215.433210000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20445#23384#26399#38480':'#36710#36733#26495'16'#24180','#38750#36733#26495'3'#24180)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 11.338590000000000000
          Top = 94.488250000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20854#20182#35828#26126':')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 540.472790000000000000
          Top = 182.417440000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'ZH-WT-MT-001-01/00')
          ParentFont = False
          VAlign = vaCenter
        end
        object Line21: TfrxLineView
          Left = 7.559060000000000000
          Top = 11.338590000000000000
          Width = 702.992580000000000000
          Color = clBlack
          Diagonal = True
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset213'
    CloseDataSource = False
    DataSet = cds213
    BCDToCurrency = False
    Left = 576
    Top = 152
  end
  object cds493: TClientDataSet
    Aggregates = <>
    CommandText = 'select Company_Icon,Company_Name,Company_Name2 from data0493'
    Params = <>
    Left = 232
    Top = 256
    object cds493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object cds493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object cds493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset493'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Company_Icon=Company_Icon'
      'Company_Name=Company_Name'
      'Company_Name2=Company_Name2')
    DataSet = cds493
    BCDToCurrency = False
    Left = 576
    Top = 216
  end
  object frxDesigner213: TfrxDesigner
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
    Left = 660
    Top = 216
  end
end
