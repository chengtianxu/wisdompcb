object FrmReport_Mod353: TFrmReport_Mod353
  Left = 0
  Top = 0
  Caption = 'FrmReport_Mod353'
  ClientHeight = 206
  ClientWidth = 533
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cds209: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT        Data0235.goods_name '#29289#21697#21517#31216', Data0235.goods_guige as ' +
      #29289#21697#35268#26684', Data0235.goods_type as '#29289#21697#31867#21035','#13#10'              Data0023.SUPPL' +
      'IER_NAME as '#20379#24212#21830',Data0070.SUPPIER_CONTACT as '#32852#31995#20154',data0070.CONTACT' +
      '_PHONE as '#32852#31995#30005#35805','#13#10'              Data0023.BILLING_ADDRESS_1 as '#22320#22336',' +
      'Data0209.tran_date as '#35013#36816#26085#26399', Data0070.PO_NUMBER as '#37319#36141#35746#21333#21495','#13#10'      ' +
      '        Data0456.GRN_NUMBER as '#20837#24211#21333#21495',Data0072.DEL_DATE as '#35201#27714#26085#26399',Da' +
      'ta0456.DELIVER_NUMBER as '#36865#36135#21333#21495','#13#10'              Data0072.QUAN_ORD ' +
      'as '#35746#36141#25968#37327',Data0002.UNIT_NAME as '#35746#36141#21333#20301',Data0235.QUAN_RECD as '#24050#25509#25910#25968#37327','#13 +
      #10'              Data0235.unit_price as '#25509#25910#21333#20215', Data0209.QUANTITY as' +
      ' '#36864#36135#25968#37327',Data0005.EMPLOYEE_NAME AS '#36864#36135#20154#21592','#13#10'              Data0209.QU' +
      'ANTITY*Data0235.unit_price as '#36864#36135#37329#39069',Data0015.WAREHOUSE_NAME as '#24037#21378 +
      #21517#31216', '#13#10'              Data0209.shipping_method as '#35013#36816#26041#27861',Data0209.re' +
      'mark as '#36864#36135#22791#27880',data0235.state_tax as '#31246#29575','#13#10'              Data0209.R' +
      'key, Data0456.CREATE_DATE as '#25509#25910#26085#26399',tran_by.EMPLOYEE_NAME as '#35013#36816#20154#21592#13 +
      #10'FROM    Data0209 INNER JOIN'#13#10'              Data0235 ON Data0209' +
      '.SRCE_PTR = Data0235.RKEY INNER JOIN'#13#10'              Data0002 ON ' +
      'Data0235.unit_ptr = Data0002.RKEY INNER JOIN'#13#10'              Data' +
      '0456 ON Data0235.GRN_PTR = Data0456.RKEY INNER JOIN'#13#10'           ' +
      '   Data0023 ON Data0456.SUPP_PTR = Data0023.RKEY  INNER JOIN'#13#10'  ' +
      '            Data0072 ON Data0072.RKEY = Data0235.D0072_PTR INNER' +
      ' JOIN'#13#10'              Data0015 ON Data0456.warehouse_ptr = Data00' +
      '15.RKEY  INNER JOIN'#13#10'              Data0005 ON Data0209.EMPL_PTR' +
      ' = Data0005.RKEY left JOIN'#13#10'              Data0070 ON Data0456.P' +
      'O_PTR = Data0070.RKEY left JOIN'#13#10'              Data0005 AS tran_' +
      'by ON Data0209.tran_by_userptr = tran_by.RKEY '#13#10'where   1=1'#13#10
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 200
    Top = 72
    object cds209物品名称: TStringField
      FieldName = #29289#21697#21517#31216
      Size = 60
    end
    object cds209物品规格: TStringField
      FieldName = #29289#21697#35268#26684
      Size = 200
    end
    object cds209物品类别: TStringField
      FieldName = #29289#21697#31867#21035
    end
    object cds209供应商: TStringField
      FieldName = #20379#24212#21830
      Size = 100
    end
    object cds209联系人: TStringField
      FieldName = #32852#31995#20154
      FixedChar = True
    end
    object cds209联系电话: TStringField
      FieldName = #32852#31995#30005#35805
      Size = 40
    end
    object cds209地址: TStringField
      FieldName = #22320#22336
      Size = 100
    end
    object cds209装运日期: TDateTimeField
      FieldName = #35013#36816#26085#26399
    end
    object cds209采购订单号: TStringField
      FieldName = #37319#36141#35746#21333#21495
      Size = 15
    end
    object cds209入库单号: TStringField
      FieldName = #20837#24211#21333#21495
      Size = 10
    end
    object cds209要求日期: TDateTimeField
      FieldName = #35201#27714#26085#26399
    end
    object cds209送货单号: TStringField
      FieldName = #36865#36135#21333#21495
      Size = 15
    end
    object cds209订购数量: TFloatField
      FieldName = #35746#36141#25968#37327
    end
    object cds209订购单位: TStringField
      FieldName = #35746#36141#21333#20301
    end
    object cds209已接收数量: TBCDField
      FieldName = #24050#25509#25910#25968#37327
      Precision = 10
      Size = 3
    end
    object cds209接收单价: TBCDField
      FieldName = #25509#25910#21333#20215
      Precision = 10
      Size = 3
    end
    object cds209退货数量: TFloatField
      FieldName = #36864#36135#25968#37327
    end
    object cds209退货人员: TStringField
      FieldName = #36864#36135#20154#21592
      Size = 16
    end
    object cds209退货金额: TFloatField
      FieldName = #36864#36135#37329#39069
      ReadOnly = True
    end
    object cds209工厂名称: TStringField
      FieldName = #24037#21378#21517#31216
      Size = 70
    end
    object cds209装运方法: TWideStringField
      FieldName = #35013#36816#26041#27861
    end
    object cds209退货备注: TWideStringField
      FieldName = #36864#36135#22791#27880
      Size = 50
    end
    object cds209税率: TBCDField
      FieldName = #31246#29575
      Precision = 4
      Size = 2
    end
    object cds209Rkey: TAutoIncField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object cds209接收日期: TDateTimeField
      FieldName = #25509#25910#26085#26399
    end
    object cds209装运人员: TStringField
      FieldName = #35013#36816#20154#21592
      Size = 16
    end
  end
  object cds493: TClientDataSet
    Aggregates = <>
    CommandText = 'select * from data0493'
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 200
    Top = 120
    object cds493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object cds493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object cds493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object cds493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object cds493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object cds493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object cds493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object cds493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object cds493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object frxdbdtst493: TfrxDBDataset
    UserName = 'frxDBDataset2'
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
    Left = 299
    Top = 112
  end
  object frxdbdtst209: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      #29289#21697#21517#31216'='#29289#21697#21517#31216
      #29289#21697#35268#26684'='#29289#21697#35268#26684
      #29289#21697#31867#21035'='#29289#21697#31867#21035
      #20379#24212#21830'='#20379#24212#21830
      #32852#31995#20154'='#32852#31995#20154
      #32852#31995#30005#35805'='#32852#31995#30005#35805
      #22320#22336'='#22320#22336
      #35013#36816#26085#26399'='#35013#36816#26085#26399
      #37319#36141#35746#21333#21495'='#37319#36141#35746#21333#21495
      #20837#24211#21333#21495'='#20837#24211#21333#21495
      #35201#27714#26085#26399'='#35201#27714#26085#26399
      #36865#36135#21333#21495'='#36865#36135#21333#21495
      #35746#36141#25968#37327'='#35746#36141#25968#37327
      #35746#36141#21333#20301'='#35746#36141#21333#20301
      #24050#25509#25910#25968#37327'='#24050#25509#25910#25968#37327
      #25509#25910#21333#20215'='#25509#25910#21333#20215
      #36864#36135#25968#37327'='#36864#36135#25968#37327
      #36864#36135#20154#21592'='#36864#36135#20154#21592
      #36864#36135#37329#39069'='#36864#36135#37329#39069
      #24037#21378#21517#31216'='#24037#21378#21517#31216
      #35013#36816#26041#27861'='#35013#36816#26041#27861
      #36864#36135#22791#27880'='#36864#36135#22791#27880
      #31246#29575'='#31246#29575
      'Rkey=Rkey'
      #25509#25910#26085#26399'='#25509#25910#26085#26399
      #35013#36816#20154#21592'='#35013#36816#20154#21592)
    DataSet = cds209
    BCDToCurrency = False
    Left = 299
    Top = 56
  end
  object frxReport1: TfrxReport
    Version = '5.4.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42675.441563946800000000
    ReportOptions.LastChange = 42678.726155590300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 368
    Top = 96
    Datasets = <
      item
        DataSet = frxdbdtst209
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxdbdtst493
        DataSetName = 'frxDBDataset2'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Height = 710.551640000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frxDBDataset2Company_Name: TfrxMemoView
          Left = 188.976500000000000000
          Top = 3.779530000000001000
          Width = 381.732530000000000000
          Height = 30.236240000000000000
          DataField = 'Company_Name'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset2."Company_Name"]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 321.260050000000000000
          Top = 45.354360000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          Memo.UTF8W = (
            #36864#36135#35013#36816#21333)
          ParentFont = False
        end
        object Picture1: TfrxPictureView
          Left = 35.354360000000000000
          Top = 7.559059999999999000
          Width = 105.826840000000000000
          Height = 56.692950000000000000
          DataField = 'Company_Icon'
          DataSet = frxdbdtst493
          DataSetName = 'frxDBDataset2'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object Memo3: TfrxMemoView
          Left = 39.133890000000000000
          Top = 103.708720000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20379#24212#21830':')
        end
        object Memo4: TfrxMemoView
          Left = 39.133890000000000000
          Top = 140.724490000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #32852#31995#20154':')
        end
        object Memo5: TfrxMemoView
          Left = 53.472480000000000000
          Top = 177.740260000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #22320#22336':')
        end
        object Memo6: TfrxMemoView
          Left = 100.385900000000000000
          Top = 103.708720000000000000
          Width = 279.685220000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #20379#24212#21830
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#20379#24212#21830'"]')
        end
        object Memo7: TfrxMemoView
          Left = 100.385900000000000000
          Top = 140.724490000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = #32852#31995#20154
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#32852#31995#20154'"]')
        end
        object frxDBDataset1: TfrxMemoView
          Left = 102.385900000000000000
          Top = 177.740260000000000000
          Width = 275.905690000000000000
          Height = 30.236240000000000000
          DataField = #22320#22336
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#22320#22336'"]')
        end
        object Memo8: TfrxMemoView
          Left = 449.527830000000000000
          Top = 140.724490000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #30005#35805':')
        end
        object Memo9: TfrxMemoView
          Left = 427.071120000000000000
          Top = 177.740260000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #35013#36816#26085#26399':')
        end
        object Memo10: TfrxMemoView
          Left = 494.000310000000000000
          Top = 140.724490000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #32852#31995#30005#35805
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#32852#31995#30005#35805'"]')
        end
        object Memo11: TfrxMemoView
          Left = 494.000310000000000000
          Top = 177.740260000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = #35013#36816#26085#26399
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#35013#36816#26085#26399'"]')
        end
        object Memo12: TfrxMemoView
          Left = 47.118120000000000000
          Top = 247.653680000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #37319#36141#35746#21333#21495':')
        end
        object Memo13: TfrxMemoView
          Left = 136.488250000000000000
          Top = 247.653680000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = #37319#36141#35746#21333#21495
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#37319#36141#35746#21333#21495'"]')
        end
        object Memo14: TfrxMemoView
          Left = 61.456710000000000000
          Top = 286.771800000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #35201#27714#26085#26399':')
        end
        object Memo15: TfrxMemoView
          Left = 60.118120000000000000
          Top = 328.008040000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #35746#36141#25968#37327':')
        end
        object Memo16: TfrxMemoView
          Left = 60.118120000000000000
          Top = 370.244280000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #29289#21697#21517#31216':')
        end
        object Memo17: TfrxMemoView
          Left = 60.118120000000000000
          Top = 414.480520000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #29289#21697#35268#26684':')
        end
        object Memo18: TfrxMemoView
          Left = 44.118120000000000000
          Top = 456.716760000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #24050#25509#25910#25968#37327':')
        end
        object Memo19: TfrxMemoView
          Left = 61.456710000000000000
          Top = 497.953000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #25509#25910#26085#26399':')
        end
        object Memo20: TfrxMemoView
          Left = 61.456710000000000000
          Top = 541.189240000000100000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36864#36135#25968#37327':')
        end
        object Memo21: TfrxMemoView
          Left = 61.456710000000000000
          Top = 583.425480000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36864#36135#22791#27880':')
        end
        object Memo22: TfrxMemoView
          Left = 426.850650000000000000
          Top = 246.535560000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #20837#24211#21333#21495':')
        end
        object Memo23: TfrxMemoView
          Left = 426.071120000000000000
          Top = 286.771800000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36865#36135#21333#21495':')
        end
        object Memo24: TfrxMemoView
          Left = 426.071120000000000000
          Top = 328.008040000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #29289#21697#31867#21035':')
        end
        object Memo25: TfrxMemoView
          Left = 426.071120000000000000
          Top = 370.244280000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #35746#36141#21333#20301':')
        end
        object Memo26: TfrxMemoView
          Left = 386.393940000000000000
          Top = 414.480520000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #25509#25910#21333#20215'('#21547#31246'):')
        end
        object Memo27: TfrxMemoView
          Left = 386.393940000000000000
          Top = 456.716760000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36864#36135#37329#39069'('#21547#31246'):')
        end
        object Memo28: TfrxMemoView
          Left = 426.630180000000000000
          Top = 497.953000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #35013#36816#26041#27861':')
        end
        object Memo29: TfrxMemoView
          Left = 427.071120000000000000
          Top = 541.189240000000100000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #35013#36816#20154#21592':')
        end
        object Memo30: TfrxMemoView
          Left = 135.519790000000000000
          Top = 286.771800000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = #35201#27714#26085#26399
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#35201#27714#26085#26399'"]')
        end
        object Memo31: TfrxMemoView
          Left = 135.519790000000000000
          Top = 328.008040000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = #35746#36141#25968#37327
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#35746#36141#25968#37327'"]')
        end
        object Memo32: TfrxMemoView
          Left = 135.519790000000000000
          Top = 370.244280000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = #29289#21697#21517#31216
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#29289#21697#21517#31216'"]')
        end
        object Memo33: TfrxMemoView
          Left = 135.519790000000000000
          Top = 414.480520000000000000
          Width = 204.094620000000000000
          Height = 34.015770000000000000
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            
              '[frxDBDataset1."'#29289#21697#35268#26684'"]                                          ' +
              ' ')
        end
        object Memo34: TfrxMemoView
          Left = 135.519790000000000000
          Top = 456.716760000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#24050#25509#25910#25968#37327'"]')
        end
        object Memo35: TfrxMemoView
          Left = 135.519790000000000000
          Top = 497.953000000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = #25509#25910#26085#26399
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#25509#25910#26085#26399'"]')
        end
        object Memo36: TfrxMemoView
          Left = 135.519790000000000000
          Top = 541.189240000000100000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = #36864#36135#25968#37327
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#36864#36135#25968#37327'"]')
        end
        object Memo37: TfrxMemoView
          Left = 137.519790000000000000
          Top = 583.425480000000000000
          Width = 566.929500000000000000
          Height = 30.236240000000000000
          AutoWidth = True
          DataField = #36864#36135#22791#27880
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#36864#36135#22791#27880'"]')
        end
        object Memo38: TfrxMemoView
          Left = 497.000310000000000000
          Top = 246.535560000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = #20837#24211#21333#21495
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#20837#24211#21333#21495'"]')
        end
        object Memo39: TfrxMemoView
          Left = 497.000310000000000000
          Top = 286.771800000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = #36865#36135#21333#21495
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#36865#36135#21333#21495'"]')
        end
        object Memo40: TfrxMemoView
          Left = 497.000310000000000000
          Top = 328.008040000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          AutoWidth = True
          DataField = #29289#21697#31867#21035
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#29289#21697#31867#21035'"]')
        end
        object Memo41: TfrxMemoView
          Left = 497.000310000000000000
          Top = 370.244280000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = #35746#36141#21333#20301
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#35746#36141#21333#20301'"]')
        end
        object Memo42: TfrxMemoView
          Left = 497.000310000000000000
          Top = 414.480520000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = #25509#25910#21333#20215
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#25509#25910#21333#20215'"]')
        end
        object Memo43: TfrxMemoView
          Left = 497.000310000000000000
          Top = 455.716760000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = #36864#36135#37329#39069
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#36864#36135#37329#39069'"]')
        end
        object Memo44: TfrxMemoView
          Left = 497.000310000000000000
          Top = 497.953000000000000000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = #35013#36816#26041#27861
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#35013#36816#26041#27861'"]')
        end
        object Memo45: TfrxMemoView
          Left = 497.000310000000000000
          Top = 541.189240000000100000
          Width = 207.874150000000000000
          Height = 18.897650000000000000
          DataField = #35013#36816#20154#21592
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#35013#36816#20154#21592'"]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 11.338590000000000000
        Top = 789.921770000000000000
        Width = 718.110700000000000000
        DataSet = frxdbdtst209
        DataSetName = 'frxDBDataset1'
        RowCount = 0
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        Height = 41.574830000000000000
        ParentFont = False
        Top = 861.732840000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
        object Memo46: TfrxMemoView
          Left = 105.826840000000000000
          Top = 11.338589999999950000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #21046#21333#20154':')
        end
        object Memo47: TfrxMemoView
          Left = 165.078850000000000000
          Top = 11.338589999999950000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = #36864#36135#20154#21592
          DataSet = frxdbdtst209
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."'#36864#36135#20154#21592'"]')
        end
        object Memo48: TfrxMemoView
          Left = 300.362400000000000000
          Top = 11.338589999999950000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #36864#36135#20154':')
        end
        object Memo49: TfrxMemoView
          Left = 494.575140000000000000
          Top = 11.338589999999950000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #31614#25910#20154':')
        end
        object Line1: TfrxLineView
          Left = 357.393940000000000000
          Top = 29.456710000000040000
          Width = 83.149660000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          Left = 551.827150000000000000
          Top = 29.456710000000040000
          Width = 83.149660000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
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
    Left = 368
    Top = 152
  end
end
