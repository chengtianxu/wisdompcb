object Form9: TForm9
  Left = 398
  Top = 332
  Width = 360
  Height = 230
  Caption = 'Form9'
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 11
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'deliver_no'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0439.delivery_no, Data0010.CUST_CODE,'
      '      data0439.date_sailing,data0439.cartons_no,data0439.charge,'
      
        '      Data0530.MAWB_NO,Data0060.SALES_ORDER,data0439.fob,Data006' +
        '0.DUE_DATE,'
      '      Data0064.SHIPMENT_NO,Data0025.MANU_PART_NUMBER,'
      
        '      Data0097.PO_NUMBER,Data0097.PO_DATE,data0439.reference_num' +
        'ber,'
      
        '      Data0005.EMPLOYEE_NAME,Data0064.QUAN_SHIPPED,data0439.weig' +
        'ht,'
      
        '      Data0064.part_price,data0439.Remark,data0439.c_n,data0439.' +
        'net_weight,'
      
        '      ROUND(Data0064.part_price * Data0064.QUAN_SHIPPED / Data00' +
        '60.EXCH_RATE,'
      
        '       4) AS amount,Data0112.invoice_number,Data0025.MANU_PART_D' +
        'ESC'
      'FROM data0439 INNER JOIN'
      'Data0010 ON data0439.customer_ptr = Data0010.RKEY INNER JOIN'
      'Data0064 ON data0439.rkey = Data0064.packing_list_ptr INNER JOIN'
      'Data0060 ON Data0064.SO_PTR = Data0060.RKEY INNER JOIN'
      'Data0025 ON Data0060.CUST_PART_PTR = Data0025.RKEY INNER JOIN'
      'Data0005 ON Data0064.ENT_EMPL_PTR = Data0005.RKEY INNER JOIN'
      'Data0097 ON'
      'Data0060.PURCHASE_ORDER_PTR = Data0097.RKEY LEFT OUTER JOIN'
      'Data0112 ON data0439.invoice_ptr = Data0112.RKEY LEFT OUTER JOIN'
      'Data0530 ON data0439.rkey = Data0530.D0439_PTR'
      'WHERE (Data0064.QUAN_SHIPPED > 0)  and'
      '      (data0439.delivery_no like :deliver_no)'
      
        'ORDER BY data0439.delivery_no,Data0060.SALES_ORDER,Data0064.SHIP' +
        'MENT_NO')
    Left = 104
    Top = 96
    object ADOQuery1delivery_no: TStringField
      FieldName = 'delivery_no'
      Size = 10
    end
    object ADOQuery1CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 5
    end
    object ADOQuery1date_sailing: TDateTimeField
      FieldName = 'date_sailing'
    end
    object ADOQuery1cartons_no: TIntegerField
      FieldName = 'cartons_no'
    end
    object ADOQuery1charge: TFloatField
      FieldName = 'charge'
    end
    object ADOQuery1MAWB_NO: TStringField
      FieldName = 'MAWB_NO'
    end
    object ADOQuery1SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1fob: TStringField
      FieldName = 'fob'
    end
    object ADOQuery1DUE_DATE: TDateTimeField
      FieldName = 'DUE_DATE'
    end
    object ADOQuery1SHIPMENT_NO: TSmallintField
      FieldName = 'SHIPMENT_NO'
    end
    object ADOQuery1PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ADOQuery1PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object ADOQuery1reference_number: TStringField
      FieldName = 'reference_number'
    end
    object ADOQuery1EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQuery1QUAN_SHIPPED: TIntegerField
      FieldName = 'QUAN_SHIPPED'
    end
    object ADOQuery1weight: TFloatField
      FieldName = 'weight'
    end
    object ADOQuery1part_price: TFloatField
      FieldName = 'part_price'
    end
    object ADOQuery1Remark: TStringField
      FieldName = 'Remark'
      Size = 50
    end
    object ADOQuery1c_n: TIntegerField
      FieldName = 'c_n'
    end
    object ADOQuery1net_weight: TFloatField
      FieldName = 'net_weight'
    end
    object ADOQuery1amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADOQuery1invoice_number: TStringField
      FieldName = 'invoice_number'
      FixedChar = True
      Size = 10
    end
    object ADOQuery1MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQuery1MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
  object DataSource5: TDataSource
    DataSet = ADOQuery1
    Left = 136
    Top = 96
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB439
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\nierp\report\packlist.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 216
    Top = 96
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB439'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34131
      mmPrintPosition = 0
      object ppDBImage3: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = Form6.ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 5027
        mmTop = 3704
        mmWidth = 16933
        BandType = 0
      end
      object ppVariable3: TppVariable
        UserName = 'Variable1'
        CalcOrder = 1
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 51858
        mmTop = 2910
        mmWidth = 94192
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label1'
        Caption = #35013#31665#21333#28165#21333
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 88106
        mmTop = 12435
        mmWidth = 21167
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 4763
        mmTop = 18256
        mmWidth = 186796
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 174361
        mmTop = 9525
        mmWidth = 17463
        BandType = 0
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 174361
        mmTop = 14023
        mmWidth = 17463
        BandType = 0
      end
      object ppLine14: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 4763
        mmTop = 33866
        mmWidth = 186796
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label2'
        Caption = #35013#31665#21333#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 11642
        mmTop = 24606
        mmWidth = 14393
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label3'
        Caption = #23458#25143#20195#30721
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 30163
        mmTop = 24606
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label4'
        Caption = #21457#31080#21495#30721
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 48419
        mmTop = 24606
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label5'
        Caption = #20986#36135#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 70379
        mmTop = 24606
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label6'
        Caption = #31665#25968
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 90488
        mmTop = 24606
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label7'
        Caption = #25552#21333#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 104511
        mmTop = 24606
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label8'
        Caption = #25351#27966#25209#27425
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4128
        mmLeft = 14552
        mmTop = 29369
        mmWidth = 14393
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label9'
        Caption = #38144#21806#35746#21333
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 31221
        mmTop = 29369
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label10'
        Caption = #23458#25143#37096#20214
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 49477
        mmTop = 29369
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label11'
        Caption = #37319#36141#35746#21333
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 73554
        mmTop = 29369
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label12'
        Caption = #37319#36141#35746#21333#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 96573
        mmTop = 29369
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label13'
        Caption = #35013#36816#25968#37327
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 121179
        mmTop = 29369
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label14'
        Caption = #20215#26684
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 139171
        mmTop = 29369
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label15'
        Caption = #37329#39069
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 153988
        mmTop = 29369
        mmWidth = 7144
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'SHIPMENT_NO'
        DataPipeline = ppDB439
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 3493
        mmLeft = 24342
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'SALES_ORDER'
        DataPipeline = ppDB439
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 3493
        mmLeft = 31221
        mmTop = 0
        mmWidth = 15240
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'CUSTOMER_PART_NUMBER'
        DataPipeline = ppDB439
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 3493
        mmLeft = 50271
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB439
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 3493
        mmLeft = 74877
        mmTop = 0
        mmWidth = 18944
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'QUAN_SHIPPED'
        DataPipeline = ppDB439
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 3493
        mmLeft = 125677
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'PO_DATE'
        DataPipeline = ppDB439
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 3493
        mmLeft = 101600
        mmTop = 0
        mmWidth = 13018
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'part_price'
        DataPipeline = ppDB439
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 3493
        mmLeft = 140494
        mmTop = 0
        mmWidth = 5609
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB439
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB439'
        mmHeight = 3493
        mmLeft = 150548
        mmTop = 0
        mmWidth = 15134
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'delivery_no'
      DataPipeline = ppDB439
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB439'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBText60: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'delivery_no'
          DataPipeline = ppDB439
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB439'
          mmHeight = 3493
          mmLeft = 11377
          mmTop = 529
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppDBText61: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'invoice_number'
          DataPipeline = ppDB439
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB439'
          mmHeight = 3493
          mmLeft = 48154
          mmTop = 529
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText62: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'CUST_CODE'
          DataPipeline = ppDB439
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB439'
          mmHeight = 3493
          mmLeft = 33073
          mmTop = 529
          mmWidth = 6456
          BandType = 3
          GroupNo = 0
        end
        object ppDBText63: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'date_sailing'
          DataPipeline = ppDB439
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB439'
          mmHeight = 3493
          mmLeft = 70379
          mmTop = 529
          mmWidth = 14605
          BandType = 3
          GroupNo = 0
        end
        object ppDBText65: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'cartons_no'
          DataPipeline = ppDB439
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppDB439'
          mmHeight = 3493
          mmLeft = 92075
          mmTop = 529
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
        end
        object ppDBText66: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'MAWB_NO'
          DataPipeline = ppDB439
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppDB439'
          mmHeight = 3493
          mmLeft = 105304
          mmTop = 529
          mmWidth = 15028
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object ppLine15: TppLine
          UserName = 'Line2'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 4763
          mmTop = 265
          mmWidth = 186796
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppDB439: TppDBPipeline
    DataSource = DataSource5
    OpenDataSource = False
    UserName = 'DB439'
    Left = 168
    Top = 96
    object DB439ppField1: TppField
      FieldAlias = 'delivery_no'
      FieldName = 'delivery_no'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DB439ppField2: TppField
      FieldAlias = 'CUST_CODE'
      FieldName = 'CUST_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DB439ppField3: TppField
      FieldAlias = 'date_sailing'
      FieldName = 'date_sailing'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DB439ppField4: TppField
      FieldAlias = 'cartons_no'
      FieldName = 'cartons_no'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DB439ppField5: TppField
      FieldAlias = 'charge'
      FieldName = 'charge'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DB439ppField6: TppField
      FieldAlias = 'MAWB_NO'
      FieldName = 'MAWB_NO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DB439ppField7: TppField
      FieldAlias = 'SALES_ORDER'
      FieldName = 'SALES_ORDER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DB439ppField8: TppField
      FieldAlias = 'fob'
      FieldName = 'fob'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DB439ppField9: TppField
      FieldAlias = 'DUE_DATE'
      FieldName = 'DUE_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DB439ppField10: TppField
      FieldAlias = 'SHIPMENT_NO'
      FieldName = 'SHIPMENT_NO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DB439ppField11: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DB439ppField12: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DB439ppField13: TppField
      FieldAlias = 'PO_DATE'
      FieldName = 'PO_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object DB439ppField14: TppField
      FieldAlias = 'reference_number'
      FieldName = 'reference_number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object DB439ppField15: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object DB439ppField16: TppField
      FieldAlias = 'QUAN_SHIPPED'
      FieldName = 'QUAN_SHIPPED'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object DB439ppField17: TppField
      FieldAlias = 'weight'
      FieldName = 'weight'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object DB439ppField18: TppField
      FieldAlias = 'part_price'
      FieldName = 'part_price'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object DB439ppField19: TppField
      FieldAlias = 'Remark'
      FieldName = 'Remark'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object DB439ppField20: TppField
      FieldAlias = 'c_n'
      FieldName = 'c_n'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object DB439ppField21: TppField
      FieldAlias = 'net_weight'
      FieldName = 'net_weight'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object DB439ppField22: TppField
      FieldAlias = 'amount'
      FieldName = 'amount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object DB439ppField23: TppField
      FieldAlias = 'invoice_number'
      FieldName = 'invoice_number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object DB439ppField24: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object aq0493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 104
    Top = 59
    object aq0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object aq0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object aq0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object aq0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource4: TDataSource
    DataSet = aq0493
    Left = 136
    Top = 59
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DB493'
    Left = 168
    Top = 59
    object ppDBPipeline4ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 0
    end
    object ppDBPipeline4ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline4ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline4ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDBPipeline4ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline4ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
  end
end
