object Form_report: TForm_report
  Left = 306
  Top = 199
  Width = 419
  Height = 350
  Caption = #25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ADS85: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADS85CalcFields
    CommandText = 
      'SELECT dbo.Data0085.TNUMBER, dbo.Data0085.REF_PART_NO, '#13#10'      d' +
      'bo.Data0085.CUST_PART_NO, dbo.Data0085.CUST_PART_DESC, '#13#10'      d' +
      'bo.Data0085.CUST_NAME, dbo.Data0085.quote_taxprice, '#13#10'      Data' +
      '0001.CURR_NAME, Data0001.CURR_CODE, Data0085.CURR_RATE, '#13#10'      ' +
      'dbo.Data0085.vatax, dbo.Data0085.MARKUP, dbo.Data0085.QTE_DATE, ' +
      #13#10'      dbo.Data0085.EXPIRATION_DATE, dbo.Data0005.EMPLOYEE_NAME' +
      ', '#13#10'      d05.EMPL_CODE as REP_CODE, d05.EMPLOYEE_NAME as SALES_' +
      'REP_NAME, '#13#10'      Data0008.PROD_CODE, Data0008.PRODUCT_NAME, Dat' +
      'a0264.CODE, '#13#10'      dbo.Data0264.QTE_APPROV_DESC, dbo.Data0346.R' +
      'OW_NAME, '#13#10'      Data0085.CUST_ADD1, Data0085.NOTE_INFO, Data008' +
      '5.rej_info, '#13#10'      Data0085.quote_price, Data0085.MATL_COST, Da' +
      'ta0085.base_pcscost, '#13#10'      dbo.Data0085.ovhd_cost, dbo.Data008' +
      '5.total_cost, data0085.rkey,'#13#10'      dbo.Data0085.CRP_EST_QUANTIT' +
      'Y, dbo.Data0085.comm_cost, '#13#10'      dbo.Data0085.SHIPPING_CHARGE,' +
      ' dbo.Data0085.QTE_UNITS,'#13#10#9'  data0085.SALES_ORDERS_ENTERED as '#19979#21333 +
      #25968#37327','#13#10#9#9'case when TUNITS >0 then'#13#10#9#9'data0085.SALES_ORDERS_ENTERED' +
      '*data0085.UNIT_LEN*data0085.UNIT_WTH*0.000001/TUNITS '#13#10#9#9'else 0 ' +
      'end as '#19979#21333#38754#31215','#13#10'case Data0085.ttype2 when 0 then '#39#26032#21333#39' when 1 then ' +
      #39#37327#20135#19979#21333#39' '#13#10'when 2 then '#39#35843#20215#39' when 3 then '#39#20854#23427#39' when 4 then '#39#29305#25209#39033#30446#39' wh' +
      'en 5 then '#39#23395#24230#35843#20215#39' end as '#31867#22411','#13#10'case Data0085.AUDITED_STATUS when 0' +
      ' then '#39#26410#25552#20132#39#13#10'when 1 then '#39#24453#23457#25209#39' when 2 then '#39#24050#36807#26399#39' '#13#10'when 3 then '#39 +
      #24050#23457#25209#39' when 4 then '#39#34987#36864#22238#39' end as '#29366#24577','#13#10'case Data0085.qte_unit_ptr wh' +
      'en 1 then '#39'PCS'#39#13#10'when 2 then '#39'SET'#39' end as '#25253#20215#21333#20301',data0085.rate_mar' +
      'gin as '#27611#21033#29575','#13#10'case Data0085.quote_type when 0 then '#39#20869#38144#39#13#10'when 1 t' +
      'hen '#39#36716#21378#39' end as '#38144#21806#26041#24335',data0085.APPRV_DATE,'#13#10'data0085.unit_len,dat' +
      'a0085.unit_wth,data0085.TUNITS,'#13#10'data0085.USHEET, data0085.QTE_U' +
      'SHEET, data0085.SpecialCrafts'#13#10'FROM dbo.Data0085 INNER JOIN'#13#10'   ' +
      '   dbo.Data0005 ON dbo.Data0085.QBY_EMPL_PTR = dbo.Data0005.RKEY' +
      ' INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0085.CURR_PTR = dbo.D' +
      'ata0001.RKEY INNER JOIN'#13#10'      dbo.Data0005 as d05 ON dbo.Data00' +
      '85.SREP_PTR = d05.RKEY INNER JOIN'#13#10'      dbo.Data0008 ON '#13#10'     ' +
      ' dbo.Data0085.PROD_CODE_PTR = dbo.Data0008.RKEY INNER JOIN'#13#10'    ' +
      '  dbo.Data0264 ON '#13#10'      dbo.Data0085.PROD_ROUTE_PTR = dbo.Data' +
      '0264.RKEY INNER JOIN'#13#10'      dbo.Data0346 ON dbo.Data0085.ENGR_RO' +
      'UTE_PTR = dbo.Data0346.RKEY'#13#10'WHERE data0085.rkey = :rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 6732
      end>
    Left = 80
    Top = 16
    object ADS85TNUMBER: TStringField
      FieldName = 'TNUMBER'
      Size = 10
    end
    object ADS85REF_PART_NO: TStringField
      FieldName = 'REF_PART_NO'
    end
    object ADS85CUST_PART_NO: TStringField
      FieldName = 'CUST_PART_NO'
      Size = 40
    end
    object ADS85CUST_PART_DESC: TStringField
      FieldName = 'CUST_PART_DESC'
      Size = 200
    end
    object ADS85CUST_NAME: TStringField
      FieldName = 'CUST_NAME'
      Size = 100
    end
    object ADS85quote_taxprice: TFloatField
      FieldName = 'quote_taxprice'
    end
    object ADS85CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object ADS85CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ADS85CURR_RATE: TFloatField
      FieldName = 'CURR_RATE'
    end
    object ADS85vatax: TBCDField
      FieldName = 'vatax'
      Precision = 5
      Size = 2
    end
    object ADS85MARKUP: TFloatField
      FieldName = 'MARKUP'
    end
    object ADS85QTE_DATE: TDateTimeField
      FieldName = 'QTE_DATE'
    end
    object ADS85EXPIRATION_DATE: TDateTimeField
      FieldName = 'EXPIRATION_DATE'
    end
    object ADS85EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ADS85REP_CODE: TStringField
      FieldName = 'REP_CODE'
      Size = 5
    end
    object ADS85SALES_REP_NAME: TStringField
      FieldName = 'SALES_REP_NAME'
    end
    object ADS85PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ADS85PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ADS85CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ADS85QTE_APPROV_DESC: TStringField
      FieldName = 'QTE_APPROV_DESC'
      Size = 40
    end
    object ADS85ROW_NAME: TStringField
      FieldName = 'ROW_NAME'
      Size = 30
    end
    object ADS85CUST_ADD1: TStringField
      FieldName = 'CUST_ADD1'
      Size = 100
    end
    object ADS85NOTE_INFO: TStringField
      FieldName = 'NOTE_INFO'
      Size = 400
    end
    object ADS85rej_info: TMemoField
      FieldName = 'rej_info'
      BlobType = ftMemo
    end
    object ADS85quote_price: TFloatField
      FieldName = 'quote_price'
    end
    object ADS85MATL_COST: TFloatField
      FieldName = 'MATL_COST'
    end
    object ADS85base_pcscost: TFloatField
      FieldName = 'base_pcscost'
    end
    object ADS85ovhd_cost: TFloatField
      FieldName = 'ovhd_cost'
    end
    object ADS85total_cost: TFloatField
      FieldName = 'total_cost'
    end
    object ADS85CRP_EST_QUANTITY: TBCDField
      FieldName = 'CRP_EST_QUANTITY'
      Precision = 12
      Size = 6
    end
    object ADS85comm_cost: TFloatField
      FieldName = 'comm_cost'
    end
    object ADS85SHIPPING_CHARGE: TBCDField
      FieldName = 'SHIPPING_CHARGE'
      Precision = 12
      Size = 6
    end
    object ADS85QTE_UNITS: TFloatField
      FieldName = 'QTE_UNITS'
    end
    object ADS85DSDesigner: TStringField
      FieldName = #31867#22411
      ReadOnly = True
      Size = 8
    end
    object ADS85DSDesigner2: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS85DSDesigner3: TStringField
      FieldName = #25253#20215#21333#20301
      ReadOnly = True
      Size = 3
    end
    object ADS85DSDesigner4: TStringField
      FieldName = #38144#21806#26041#24335
      ReadOnly = True
      Size = 4
    end
    object ADS85rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS85unit_len: TFloatField
      FieldName = 'unit_len'
    end
    object ADS85unit_wth: TFloatField
      FieldName = 'unit_wth'
    end
    object ADS85TUNITS: TIntegerField
      FieldName = 'TUNITS'
    end
    object ADS85APPRV_DATE: TDateTimeField
      FieldName = 'APPRV_DATE'
    end
    object ADS85USHEET: TBCDField
      FieldName = 'USHEET'
      Precision = 8
      Size = 2
    end
    object ADS85QTE_USHEET: TBCDField
      FieldName = 'QTE_USHEET'
      Precision = 8
      Size = 2
    end
    object ADS85MATL_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'MATL_M2'
      Calculated = True
    end
    object ADS85BASE_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'BASE_M2'
      Calculated = True
    end
    object ADS85OVHD_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'OVHD_M2'
      Calculated = True
    end
    object ADS85TOTAL_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TOTAL_M2'
      Calculated = True
    end
    object ADS85CRP_EST_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'CRP_EST_M2'
      Calculated = True
    end
    object ADS85COMM_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'COMM_M2'
      Calculated = True
    end
    object ADS85SHIPPING_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'SHIPPING_M2'
      Calculated = True
    end
    object ADS85QTE_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'QTE_M2'
      Calculated = True
    end
    object ADS85QUOTE_NOTAX_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'QUOTE_NOTAX_M2'
      Calculated = True
    end
    object ADS85QUOTE_TAX_M2: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'QUOTE_TAX_M2'
      Calculated = True
    end
    object ADS85DSDesigner5: TBCDField
      FieldName = #27611#21033#29575
      Precision = 6
      Size = 2
    end
    object ADS85DSDesigner6: TIntegerField
      FieldName = #19979#21333#25968#37327
    end
    object ADS85DSDesigner7: TFloatField
      FieldName = #19979#21333#38754#31215
      ReadOnly = True
    end
    object ADS85SpecialCrafts: TStringField
      FieldName = 'SpecialCrafts'
      Size = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS85
    Left = 112
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = ADS511
    Left = 112
    Top = 48
  end
  object ADS511: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT sheet_BMP, pnl_bmp, pnl2_bmp'#13#10'FROM dbo.Data0511'#13#10'where da' +
      'ta0511.source_ptr = :rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 6732
      end>
    Left = 81
    Top = 49
    object ADS511sheet_BMP: TBlobField
      FieldName = 'sheet_BMP'
    end
    object ADS511pnl_bmp: TBlobField
      FieldName = 'pnl_bmp'
    end
    object ADS511pnl2_bmp: TBlobField
      FieldName = 'pnl2_bmp'
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB432
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #20135#21697#25253#20215#26723#26696
    PrinterSetup.PaperName = 'A4 210x297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    SavePrinterSetup = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 198
    Top = 154
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB432'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 7239
        mmLeft = 57689
        mmTop = 794
        mmWidth = 76708
        BandType = 1
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 4498
        mmTop = 1058
        mmWidth = 24871
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 160338
        mmTop = 10848
        mmWidth = 32004
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #25171#21360#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 142769
        mmTop = 10795
        mmWidth = 15833
        BandType = 1
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDocumentName
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 79375
        mmTop = 8467
        mmWidth = 29898
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 115359
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 115359
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'TNUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 1588
        mmWidth = 17780
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #25253#20215#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 15875
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 0
        mmTop = 6350
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #23458#25143#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 40217
        mmTop = 1588
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CUST_NAME'
        DataPipeline = ppDB511
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB511'
        mmHeight = 4022
        mmLeft = 57679
        mmTop = 1588
        mmWidth = 45720
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #26412#21378#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 7408
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #23458#25143#22411#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 40217
        mmTop = 7408
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #23458#25143#29289#26009#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 96838
        mmTop = 7408
        mmWidth = 19315
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'REF_PART_NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 7408
        mmWidth = 16002
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'CUST_PART_NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 57679
        mmTop = 7408
        mmWidth = 17780
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CUST_PART_DESC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 118798
        mmTop = 7408
        mmWidth = 24892
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 17992
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 39158
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 56886
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #19994#21153#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 1323
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'SALES_REP_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 1323
        mmWidth = 7027
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 160602
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 178065
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 0
        mmTop = 12171
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 7408
        mmWidth = 10541
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25253#20215#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 7408
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #25253#20215#21407#22240':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #31867#22411
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 118798
        mmTop = 19315
        mmWidth = 7027
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'PRODUCT_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 118798
        mmTop = 13494
        mmWidth = 17568
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #20135#21697#31867#22411':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 13494
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #25253#20215#24418#24335
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 57679
        mmTop = 19579
        mmWidth = 5334
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #25253#20215#21333#20301':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 40217
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #21333#20803#38271':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 4763
        mmTop = 13494
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'unit_len'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 13494
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #21333#20803#23485':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 43656
        mmTop = 13494
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'unit_wth'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 57679
        mmTop = 13494
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'TUNITS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 19579
        mmWidth = 1778
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #21333#20214#25968#37327':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 18521
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #25253#20215#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 13494
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #26377#25928#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 19579
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'QTE_DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 13494
        mmWidth = 16002
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'EXPIRATION_DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 19579
        mmWidth = 14224
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197300
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 95779
        mmTop = 6615
        mmWidth = 4498
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 117211
        mmTop = 6615
        mmWidth = 1852
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 57415
        mmLeft = 113506
        mmTop = 50536
        mmWidth = 82550
        BandType = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 40746
        mmLeft = 794
        mmTop = 55563
        mmWidth = 55827
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        Caption = 'Memo2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 40746
        mmLeft = 56886
        mmTop = 55563
        mmWidth = 55827
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #25253#20215#21442#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 1058
        mmTop = 50536
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 39423
        mmTop = 50536
        mmWidth = 3556
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #29305#21035#24037#33402
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 9260
        mmTop = 110331
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #35745#31639#27169#24335
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 110331
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'PCS'#25104#26412
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68263
        mmTop = 110331
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #27599#24179#31859#25104#26412
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 91281
        mmTop = 110278
        mmWidth = 17568
        BandType = 0
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDB253'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDB253
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = #20135#21697#25253#20215#26723#26696
          PrinterSetup.PaperName = 'A4 210x297 '#27627#31859
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.01'
          mmColumnWidth = 0
          DataPipelineName = 'ppDB253'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppLine12: TppLine
              UserName = 'Line12'
              ParentHeight = True
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              Caption = #29289#26009#32534#30721
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 13494
              mmTop = 1588
              mmWidth = 14055
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = #29289#26009#35268#26684
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 61119
              mmTop = 1588
              mmWidth = 14023
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = #20379#24212#21830
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 148167
              mmTop = 1588
              mmWidth = 10583
              BandType = 1
            end
            object ppLine17: TppLine
              UserName = 'Line17'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 44450
              mmTop = 0
              mmWidth = 2910
              BandType = 1
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 139171
              mmTop = 0
              mmWidth = 2910
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 7144
            mmPrintPosition = 0
            object ppLine13: TppLine
              UserName = 'Line13'
              ParentHeight = True
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 7144
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              AutoSize = True
              DataField = 'INV_PART_NUMBER'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 4022
              mmLeft = 4763
              mmTop = 1323
              mmWidth = 35560
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              AutoSize = True
              DataField = 'INV_PART_DESCRIPTION'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 4022
              mmLeft = 46038
              mmTop = 1323
              mmWidth = 84794
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              AutoSize = True
              DataField = 'ABBR_NAME'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 4022
              mmLeft = 150019
              mmTop = 1588
              mmWidth = 7027
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 7144
              mmLeft = 44450
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 7144
              mmLeft = 139171
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 0
        mmTop = 108744
        mmWidth = 197300
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 54769
        mmWidth = 112184
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label101'
        Caption = #25253#20215#21442#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 57944
        mmTop = 50536
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label201'
        Caption = #20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 96309
        mmTop = 50536
        mmWidth = 3440
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentHeight = True
        ParentWidth = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'ADDER_NAME'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 4022
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 35475
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'cac_meoth'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 4022
        mmLeft = 44979
        mmTop = 1323
        mmWidth = 7027
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'AMOUNT'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 4022
        mmLeft = 72496
        mmTop = 1323
        mmWidth = 1778
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'cost_m2'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 4022
        mmLeft = 98954
        mmTop = 1323
        mmWidth = 1778
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = True
        DataField = 'NOTE_INFO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 25135
        mmLeft = 14023
        mmTop = 2381
        mmWidth = 179123
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = #22791#27880':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 2381
        mmWidth = 8467
        BandType = 8
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 12965
        mmTop = 30956
        mmWidth = 10583
        BandType = 8
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = #21046#21333':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 30956
        mmWidth = 8731
        BandType = 8
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 12171
        mmTop = 35983
        mmWidth = 18256
        BandType = 8
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = #21046#21333#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 30956
        mmWidth = 15875
        BandType = 8
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 46831
        mmTop = 35983
        mmWidth = 33338
        BandType = 8
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = #23457#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 86784
        mmTop = 30956
        mmWidth = 8731
        BandType = 8
      end
      object ppLine23: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 95250
        mmTop = 35983
        mmWidth = 20902
        BandType = 8
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = #26368#21518#23457#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 30956
        mmWidth = 15875
        BandType = 8
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 134673
        mmTop = 35983
        mmWidth = 19844
        BandType = 8
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'APPRV_DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 30956
        mmWidth = 32015
        BandType = 8
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 171450
        mmTop = 35983
        mmWidth = 21960
        BandType = 8
      end
      object ppLabel48: TppLabel
        UserName = 'Label401'
        Caption = #23457#26680#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 30956
        mmWidth = 15875
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 74348
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 74348
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = #26448#26009#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 9790
        mmWidth = 12435
        BandType = 7
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'MATL_COST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 9790
        mmWidth = 14224
        BandType = 7
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = #22522#26412#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 14552
        mmWidth = 12435
        BandType = 7
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'base_pcscost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 14552
        mmWidth = 12435
        BandType = 7
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = #24037#33402#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 19315
        mmWidth = 12435
        BandType = 7
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'ovhd_cost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 19315
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = #24635#25104#26412':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 24342
        mmWidth = 12435
        BandType = 7
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'total_cost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 24342
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = #20215#26684#20998#26512
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4022
        mmLeft = 11906
        mmTop = 3440
        mmWidth = 14224
        BandType = 7
      end
      object ppLine24: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 8202
        mmWidth = 80698
        BandType = 7
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = #39069#22806#21152#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 9790
        mmTop = 29104
        mmWidth = 15875
        BandType = 7
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'CRP_EST_QUANTITY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 29104
        mmWidth = 1852
        BandType = 7
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = #25240#35753#29575'%:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 11642
        mmTop = 34131
        mmWidth = 14023
        BandType = 7
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = 'MARKUP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 34131
        mmWidth = 8996
        BandType = 7
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = #37329#39069'/'#25253#20215#21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 29633
        mmTop = 3704
        mmWidth = 22860
        BandType = 7
      end
      object ppLine26: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 39423
        mmWidth = 80698
        BandType = 7
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = #37329#39069'/'#27599#24179#31859
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 54769
        mmTop = 3704
        mmWidth = 19346
        BandType = 7
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'quote_price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 40746
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = #25253#20215#36135#24065':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 9525
        mmTop = 50800
        mmWidth = 15875
        BandType = 7
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'CURR_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 50800
        mmWidth = 10583
        BandType = 7
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'CURR_RATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 55563
        mmWidth = 1852
        BandType = 7
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = #27719#29575':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 16404
        mmTop = 55563
        mmWidth = 8731
        BandType = 7
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = #22686#20540#31246'%:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 11642
        mmTop = 45773
        mmWidth = 14023
        BandType = 7
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'vatax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 45773
        mmWidth = 3440
        BandType = 7
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = #35745#31639#36135#24065': '#20154#27665#24065
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 81227
        mmTop = 3704
        mmWidth = 28152
        BandType = 7
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = #25253#20215'('#19981#21547#31246'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 2646
        mmTop = 40746
        mmWidth = 22902
        BandType = 7
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'rej_info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 64823
        mmLeft = 79640
        mmTop = 8467
        mmWidth = 116152
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = #23618#21387#22270
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 3175
        mmWidth = 10583
        BandType = 7
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        DataType = dtDouble
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 55827
        mmTop = 9790
        mmWidth = 16002
        BandType = 7
      end
    end
  end
  object ppDB511: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB511'
    Left = 158
    Top = 50
    MasterDataPipelineName = 'ppDB85'
    object ppDB511ppField1: TppField
      FieldAlias = #22823#26009#25340#29256#22270
      FieldName = 'sheet_BMP'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB511ppField2: TppField
      FieldAlias = 'A'#26495#25340#29256#22270
      FieldName = 'pnl_bmp'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB511ppField3: TppField
      FieldAlias = 'B'#26495#25340#29256#22270
      FieldName = 'pnl2_bmp'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object ADS253: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCR' +
      'IPTION, '#13#10'      dbo.Data0023.ABBR_NAME, dbo.Data0002.UNIT_NAME, ' +
      'dbo.Data0253.price, '#13#10'      dbo.Data0253.QTY, ROUND(dbo.Data0253' +
      '.QTY * dbo.Data0253.price, 6) '#13#10'      AS pcs_cost,data0253.QTY_B' +
      'OM'#13#10'FROM dbo.Data0253 INNER JOIN'#13#10'      dbo.Data0017 ON '#13#10'      ' +
      'dbo.Data0253.STD_INVENT_PTR = dbo.Data0017.RKEY INNER JOIN'#13#10'    ' +
      '  dbo.Data0028 ON dbo.Data0253.D0028_PTR = dbo.Data0028.RKEY INN' +
      'ER JOIN'#13#10'      dbo.Data0023 ON dbo.Data0028.SUPPLIER_PTR = dbo.D' +
      'ata0023.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0028.PURC' +
      'HASE_UNIT_PTR = dbo.Data0002.RKEY'#13#10'WHERE DATA0253.quote_ptr = :r' +
      'key'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 6732
      end>
    Left = 80
    Top = 84
    object ADS253INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ADS253INV_PART_DESCRIPTION: TStringField
      FieldName = 'INV_PART_DESCRIPTION'
      ReadOnly = True
      Size = 100
    end
    object ADS253ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ADS253UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADS253price: TFloatField
      FieldName = 'price'
    end
    object ADS253QTY: TFloatField
      FieldName = 'QTY'
    end
    object ADS253pcs_cost: TFloatField
      FieldName = 'pcs_cost'
      ReadOnly = True
    end
    object ADS253QTY_BOM: TWordField
      FieldName = 'QTY_BOM'
    end
  end
  object DataSource3: TDataSource
    DataSet = ADS253
    Left = 112
    Top = 84
  end
  object ppDB253: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    UserName = 'DB253'
    Left = 158
    Top = 84
    MasterDataPipelineName = 'ppDB85'
    object ppDB253ppField1: TppField
      FieldAlias = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField2: TppField
      FieldAlias = #26448#26009#35268#26684
      FieldName = 'INV_PART_DESCRIPTION'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField3: TppField
      FieldAlias = #20379#24212#21830
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField4: TppField
      FieldAlias = #21333#20301
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField5: TppField
      FieldAlias = #21333#20215
      FieldName = 'price'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField6: TppField
      FieldAlias = #25968#37327
      FieldName = 'QTY'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField7: TppField
      FieldAlias = #25104#26412
      FieldName = 'pcs_cost'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField8: TppField
      FieldAlias = #23618#21387#27604#20363
      FieldName = 'QTY_BOM'
      FieldLength = 10
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
  end
  object DataSource4: TDataSource
    DataSet = ADS431
    Left = 112
    Top = 120
  end
  object ADS431: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0278.PARAMETER_NAME, dbo.Data0278.PARAMETER_DESC,' +
      ' '#13#10'      dbo.Data0002.UNIT_NAME, dbo.Data0431.UNIT_VALUE'#13#10'FROM d' +
      'bo.Data0431 INNER JOIN'#13#10'      dbo.Data0278 ON dbo.Data0431.UNIT_' +
      'PTR = dbo.Data0278.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Da' +
      'ta0278.UNIT_PTR = dbo.Data0002.RKEY'#13#10'where data0431.qte_ptr = :r' +
      'key'#13#10'order by data0431.rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 6732
      end>
    Left = 80
    Top = 120
    object ADS431PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      FixedChar = True
      Size = 10
    end
    object ADS431PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
      FixedChar = True
    end
    object ADS431UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ADS431UNIT_VALUE: TStringField
      FieldName = 'UNIT_VALUE'
      Size = 200
    end
  end
  object ppDB431: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    UserName = 'DB431'
    Left = 158
    Top = 120
    MasterDataPipelineName = 'ppDB85'
    object ppDB431ppField1: TppField
      FieldAlias = #21442#25968#20195#30721
      FieldName = 'PARAMETER_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB431ppField2: TppField
      FieldAlias = #21442#25968#21517#31216
      FieldName = 'PARAMETER_DESC'
      FieldLength = 0
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB431ppField3: TppField
      FieldAlias = #21333#20301
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB431ppField4: TppField
      FieldAlias = #20540
      FieldName = 'UNIT_VALUE'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object ADS432: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0348.ADDER_NAME,Data0432.AMOUNT, '#13#10'      data0085.ush' +
      'eet*data0432.AMOUNT as cost_m2,'#13#10'round(data0432.amount*data0085.' +
      'TUNITS/(data0085.UNIT_LEN*data0085.UNIT_WTH*0.000001),6) as cost' +
      '_total_m2,'#13#10'      case Data0348.PCENTS when 0 then '#39#37329#39069#39' else '#39#22522#20215 +
      #30334#20221#27604#39#13#10'       end as cac_meoth'#13#10'       FROM dbo.Data0432 INNER JO' +
      'IN'#13#10'      dbo.Data0348 ON dbo.Data0432.SOURCE_PTR = dbo.Data0348' +
      '.RKEY'#13#10'      inner join data0085 on data0432.qte_ptr=data0085.rk' +
      'ey'#13#10'    where data0432.qte_ptr = :rkey'#13#10'      order by data0432.' +
      'rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 6732
      end>
    Left = 80
    Top = 155
    object ADS432ADDER_NAME: TStringField
      DisplayWidth = 20
      FieldName = 'ADDER_NAME'
    end
    object ADS432AMOUNT: TFloatField
      DisplayWidth = 10
      FieldName = 'AMOUNT'
    end
    object ADS432cost_m2: TFloatField
      DisplayWidth = 11
      FieldName = 'cost_m2'
      ReadOnly = True
    end
    object ADS432cac_meoth: TStringField
      DisplayWidth = 10
      FieldName = 'cac_meoth'
      ReadOnly = True
      Size = 10
    end
    object ADS432cost_total_m2: TFloatField
      FieldName = 'cost_total_m2'
      ReadOnly = True
    end
  end
  object DataSource5: TDataSource
    DataSet = ADS432
    Left = 113
    Top = 155
  end
  object ppDB432: TppDBPipeline
    DataSource = DataSource5
    OpenDataSource = False
    UserName = 'DB432'
    Left = 159
    Top = 155
    MasterDataPipelineName = 'ppDB85'
    object ppDB432ppField1: TppField
      FieldAlias = #24037#33402#21517#31216
      FieldName = 'ADDER_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB432ppField2: TppField
      FieldAlias = #37329#39069
      FieldName = 'AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB432ppField3: TppField
      FieldAlias = #27599#24179#31859#37329#39069
      FieldName = 'cost_m2'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB432ppField4: TppField
      FieldAlias = #35745#31639#26041#24335
      FieldName = 'cac_meoth'
      FieldLength = 0
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB432ppField5: TppField
      FieldAlias = #27599#24179#31859#37329#39069'2'
      FieldName = 'cost_total_m2'
      FieldLength = 10
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object ADS432T: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0061.CATEGORY, dbo.Data0432.AMOUNT, dbo.Data0432.' +
      'FREE_AMOUNT, '#13#10'      dbo.Data0432.TAX_FLAG'#13#10'FROM dbo.Data0432 IN' +
      'NER JOIN'#13#10'      dbo.Data0061 ON dbo.Data0432.ADDL_CAT_PTR = dbo.' +
      'Data0061.RKEY'#13#10'WHERE (dbo.Data0432.QTE_PTR = :rkey)'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 6732
      end>
    Left = 80
    Top = 192
    object ADS432TCATEGORY: TStringField
      FieldName = 'CATEGORY'
    end
    object ADS432TAMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object ADS432TFREE_AMOUNT: TFloatField
      FieldName = 'FREE_AMOUNT'
    end
    object ADS432TTAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource6: TDataSource
    DataSet = ADS432T
    Left = 112
    Top = 192
  end
  object ppDB432t: TppDBPipeline
    DataSource = DataSource6
    OpenDataSource = False
    UserName = 'DB432t'
    Left = 159
    Top = 192
    MasterDataPipelineName = 'ppDB85'
    object ppDB432tppField1: TppField
      FieldAlias = #36153#29992#31867#21035
      FieldName = 'CATEGORY'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB432tppField2: TppField
      FieldAlias = #37329#39069
      FieldName = 'AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB432tppField3: TppField
      FieldAlias = #20813#25910#37329#39069
      FieldName = 'FREE_AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB432tppField4: TppField
      FieldAlias = #26159#21542#21547#31246
      FieldName = 'TAX_FLAG'
      FieldLength = 0
      DataType = dtChar
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource7
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 158
    Top = 228
  end
  object ADS493: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'SELECT * FROM DATA0493'
    Parameters = <>
    Left = 80
    Top = 228
    object ADS493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ADS493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ADS493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ADS493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ADS493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ADS493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ADS493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ADS493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ADS493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource7: TDataSource
    DataSet = ADS493
    Left = 112
    Top = 228
  end
  object ppDesigner1: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 200
    Top = 192
  end
  object ppDB85: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB85'
    Left = 160
    Top = 16
    object ppDB85ppField1: TppField
      FieldAlias = 'TNUMBER'
      FieldName = 'TNUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField2: TppField
      FieldAlias = 'REF_PART_NO'
      FieldName = 'REF_PART_NO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField3: TppField
      FieldAlias = 'CUST_PART_NO'
      FieldName = 'CUST_PART_NO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField4: TppField
      FieldAlias = 'CUST_PART_DESC'
      FieldName = 'CUST_PART_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField5: TppField
      FieldAlias = 'CUST_NAME'
      FieldName = 'CUST_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField6: TppField
      FieldAlias = 'quote_taxprice'
      FieldName = 'quote_taxprice'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField7: TppField
      FieldAlias = 'CURR_NAME'
      FieldName = 'CURR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField8: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField9: TppField
      FieldAlias = 'CURR_RATE'
      FieldName = 'CURR_RATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField10: TppField
      FieldAlias = 'vatax'
      FieldName = 'vatax'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField11: TppField
      FieldAlias = 'MARKUP'
      FieldName = 'MARKUP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField12: TppField
      FieldAlias = 'QTE_DATE'
      FieldName = 'QTE_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField13: TppField
      FieldAlias = 'EXPIRATION_DATE'
      FieldName = 'EXPIRATION_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField14: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField15: TppField
      FieldAlias = 'REP_CODE'
      FieldName = 'REP_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField16: TppField
      FieldAlias = 'SALES_REP_NAME'
      FieldName = 'SALES_REP_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField17: TppField
      FieldAlias = 'PROD_CODE'
      FieldName = 'PROD_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField18: TppField
      FieldAlias = 'PRODUCT_NAME'
      FieldName = 'PRODUCT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField19: TppField
      FieldAlias = 'CODE'
      FieldName = 'CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField20: TppField
      FieldAlias = 'QTE_APPROV_DESC'
      FieldName = 'QTE_APPROV_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField21: TppField
      FieldAlias = 'ROW_NAME'
      FieldName = 'ROW_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField22: TppField
      FieldAlias = 'CUST_ADD1'
      FieldName = 'CUST_ADD1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField23: TppField
      FieldAlias = 'NOTE_INFO'
      FieldName = 'NOTE_INFO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField24: TppField
      FieldAlias = 'rej_info'
      FieldName = 'rej_info'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField25: TppField
      FieldAlias = 'quote_price'
      FieldName = 'quote_price'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField26: TppField
      FieldAlias = 'MATL_COST'
      FieldName = 'MATL_COST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField27: TppField
      FieldAlias = 'base_pcscost'
      FieldName = 'base_pcscost'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField28: TppField
      FieldAlias = 'ovhd_cost'
      FieldName = 'ovhd_cost'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField29: TppField
      FieldAlias = 'total_cost'
      FieldName = 'total_cost'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField30: TppField
      FieldAlias = 'CRP_EST_QUANTITY'
      FieldName = 'CRP_EST_QUANTITY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField31: TppField
      FieldAlias = 'comm_cost'
      FieldName = 'comm_cost'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField32: TppField
      FieldAlias = 'SHIPPING_CHARGE'
      FieldName = 'SHIPPING_CHARGE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField33: TppField
      FieldAlias = 'QTE_UNITS'
      FieldName = 'QTE_UNITS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField34: TppField
      FieldAlias = #31867#22411
      FieldName = #31867#22411
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField35: TppField
      FieldAlias = #29366#24577
      FieldName = #29366#24577
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField36: TppField
      FieldAlias = #25253#20215#21333#20301
      FieldName = #25253#20215#21333#20301
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField37: TppField
      FieldAlias = #38144#21806#26041#24335
      FieldName = #38144#21806#26041#24335
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField38: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField39: TppField
      FieldAlias = 'unit_len'
      FieldName = 'unit_len'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField40: TppField
      FieldAlias = 'unit_wth'
      FieldName = 'unit_wth'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField41: TppField
      FieldAlias = 'TUNITS'
      FieldName = 'TUNITS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField42: TppField
      FieldAlias = 'APPRV_DATE'
      FieldName = 'APPRV_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField43: TppField
      FieldAlias = 'USHEET'
      FieldName = 'USHEET'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField44: TppField
      FieldAlias = 'QTE_USHEET'
      FieldName = 'QTE_USHEET'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField45: TppField
      FieldAlias = 'MATL_M2'
      FieldName = 'MATL_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField46: TppField
      FieldAlias = 'BASE_M2'
      FieldName = 'BASE_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField47: TppField
      FieldAlias = 'OVHD_M2'
      FieldName = 'OVHD_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField48: TppField
      FieldAlias = 'TOTAL_M2'
      FieldName = 'TOTAL_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField49: TppField
      FieldAlias = 'CRP_EST_M2'
      FieldName = 'CRP_EST_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField50: TppField
      FieldAlias = 'COMM_M2'
      FieldName = 'COMM_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField51: TppField
      FieldAlias = 'SHIPPING_M2'
      FieldName = 'SHIPPING_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField52: TppField
      FieldAlias = 'QTE_M2'
      FieldName = 'QTE_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField53: TppField
      FieldAlias = 'QUOTE_NOTAX_M2'
      FieldName = 'QUOTE_NOTAX_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField54: TppField
      FieldAlias = 'QUOTE_TAX_M2'
      FieldName = 'QUOTE_TAX_M2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField55: TppField
      FieldAlias = #27611#21033#29575
      FieldName = #27611#21033#29575
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField56: TppField
      FieldAlias = #19979#21333#25968#37327
      FieldName = #19979#21333#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField57: TppField
      FieldAlias = #19979#21333#38754#31215
      FieldName = #19979#21333#38754#31215
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField58: TppField
      FieldAlias = 'SpecialCrafts'
      FieldName = 'SpecialCrafts'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDB432
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #20135#21697#25253#20215#26723#26696
    PrinterSetup.PaperName = 'A4 210x297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    SavePrinterSetup = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 254
    Top = 154
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB432'
    object ppTitleBand3: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppDBText36: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 7239
        mmLeft = 57689
        mmTop = 794
        mmWidth = 76708
        BandType = 1
      end
      object ppDBImage2: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 13229
        mmLeft = 4498
        mmTop = 1058
        mmWidth = 24871
        BandType = 1
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 160338
        mmTop = 10848
        mmWidth = 32004
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = #25171#21360#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 142769
        mmTop = 10795
        mmWidth = 15833
        BandType = 1
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDocumentName
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 79375
        mmTop = 8467
        mmWidth = 29898
        BandType = 1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 115359
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 115359
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'TNUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 1588
        mmWidth = 17780
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label3'
        Caption = #25253#20215#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 15875
        BandType = 0
      end
      object ppLine29: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 0
        mmTop = 6350
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label4'
        Caption = #23458#25143#21517#31216':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 40217
        mmTop = 1588
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText38: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CUST_NAME'
        DataPipeline = ppDB511
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB511'
        mmHeight = 4022
        mmLeft = 57679
        mmTop = 1588
        mmWidth = 45720
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label5'
        Caption = #26412#21378#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 7408
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'Label6'
        Caption = #23458#25143#22411#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 40217
        mmTop = 7408
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'Label7'
        Caption = #23458#25143#29289#26009#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 96838
        mmTop = 7408
        mmWidth = 19315
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'REF_PART_NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 7408
        mmWidth = 16002
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'CUST_PART_NO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 57679
        mmTop = 7408
        mmWidth = 17780
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CUST_PART_DESC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 118798
        mmTop = 7408
        mmWidth = 24892
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 17992
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine31: TppLine
        UserName = 'Line3'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 39158
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine32: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 56886
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label8'
        Caption = #19994#21153#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 1323
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'SALES_REP_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 1323
        mmWidth = 7027
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 160602
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine34: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 24871
        mmLeft = 178065
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line7'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 0
        mmTop = 12171
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 7408
        mmWidth = 10541
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label9'
        Caption = #25253#20215#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 7408
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label11'
        Caption = #25253#20215#21407#22240':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText44: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #31867#22411
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 118798
        mmTop = 19315
        mmWidth = 7027
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'PRODUCT_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 118798
        mmTop = 13494
        mmWidth = 17568
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label12'
        Caption = #20135#21697#31867#22411':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 100277
        mmTop = 13494
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText46: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #25253#20215#24418#24335
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 57679
        mmTop = 19579
        mmWidth = 5334
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label13'
        Caption = #25253#20215#21333#20301':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 40217
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label14'
        Caption = #21333#20803#38271':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 4763
        mmTop = 13494
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText47: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'unit_len'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 13494
        mmWidth = 8890
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label15'
        Caption = #21333#20803#23485':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 43656
        mmTop = 13494
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText14'
        DataField = 'unit_wth'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 57679
        mmTop = 13494
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'TUNITS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 19579
        mmWidth = 1778
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label16'
        Caption = #21333#20214#25968#37327':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppLine36: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 18521
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label17'
        Caption = #25253#20215#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 13494
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label18'
        Caption = #26377#25928#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 19579
        mmWidth = 12435
        BandType = 0
      end
      object ppDBText50: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'QTE_DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 13494
        mmWidth = 16002
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'EXPIRATION_DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 19579
        mmWidth = 14224
        BandType = 0
      end
      object ppLine37: TppLine
        UserName = 'Line9'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197300
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 95779
        mmTop = 6615
        mmWidth = 4498
        BandType = 0
      end
      object ppLine39: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 17992
        mmLeft = 117211
        mmTop = 6615
        mmWidth = 1852
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 57415
        mmLeft = 113506
        mmTop = 50536
        mmWidth = 82550
        BandType = 0
      end
      object ppMemo3: TppMemo
        UserName = 'Memo1'
        Caption = 'Memo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 40746
        mmLeft = 794
        mmTop = 55563
        mmWidth = 55827
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppMemo4: TppMemo
        UserName = 'Memo2'
        Caption = 'Memo2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 40746
        mmLeft = 56886
        mmTop = 55563
        mmWidth = 55827
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label10'
        Caption = #25253#20215#21442#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 1058
        mmTop = 50536
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label20'
        Caption = #20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 39423
        mmTop = 50536
        mmWidth = 3556
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label21'
        Caption = #29305#21035#24037#33402
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 9260
        mmTop = 110331
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label22'
        Caption = #35745#31639#27169#24335
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 110331
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label23'
        Caption = 'PCS'#25104#26412
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 68263
        mmTop = 110331
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label24'
        Caption = #27599#24179#31859#25104#26412
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 91281
        mmTop = 110278
        mmWidth = 17568
        BandType = 0
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppDB253'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppDB253
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = #20135#21697#25253#20215#26723#26696
          PrinterSetup.PaperName = 'A4 210x297 '#27627#31859
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.01'
          mmColumnWidth = 0
          DataPipelineName = 'ppDB253'
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppLine40: TppLine
              UserName = 'Line12'
              ParentHeight = True
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 1
            end
            object ppLabel71: TppLabel
              UserName = 'Label25'
              Caption = #29289#26009#32534#30721
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 13494
              mmTop = 1588
              mmWidth = 14055
              BandType = 1
            end
            object ppLabel72: TppLabel
              UserName = 'Label26'
              Caption = #29289#26009#35268#26684
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 61119
              mmTop = 1588
              mmWidth = 14023
              BandType = 1
            end
            object ppLabel73: TppLabel
              UserName = 'Label27'
              Caption = #20379#24212#21830
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 148167
              mmTop = 1588
              mmWidth = 10583
              BandType = 1
            end
            object ppLine41: TppLine
              UserName = 'Line17'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 44450
              mmTop = 0
              mmWidth = 2910
              BandType = 1
            end
            object ppLine42: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 6879
              mmLeft = 139171
              mmTop = 0
              mmWidth = 2910
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 7144
            mmPrintPosition = 0
            object ppLine43: TppLine
              UserName = 'Line13'
              ParentHeight = True
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 7144
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText52: TppDBText
              UserName = 'DBText21'
              AutoSize = True
              DataField = 'INV_PART_NUMBER'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 4022
              mmLeft = 4763
              mmTop = 1323
              mmWidth = 35560
              BandType = 4
            end
            object ppDBText53: TppDBText
              UserName = 'DBText22'
              AutoSize = True
              DataField = 'INV_PART_DESCRIPTION'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 4022
              mmLeft = 46038
              mmTop = 1323
              mmWidth = 84794
              BandType = 4
            end
            object ppDBText54: TppDBText
              UserName = 'DBText23'
              AutoSize = True
              DataField = 'ABBR_NAME'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 4022
              mmLeft = 150019
              mmTop = 1588
              mmWidth = 7027
              BandType = 4
            end
            object ppLine44: TppLine
              UserName = 'Line14'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 7144
              mmLeft = 44450
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppLine45: TppLine
              UserName = 'Line15'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 7144
              mmLeft = 139171
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppLine46: TppLine
        UserName = 'Line20'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 0
        mmTop = 108744
        mmWidth = 197300
        BandType = 0
      end
      object ppLine47: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 54769
        mmWidth = 112184
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'Label101'
        Caption = #25253#20215#21442#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 57944
        mmTop = 50536
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label201'
        Caption = #20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 96309
        mmTop = 50536
        mmWidth = 3440
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine48: TppLine
        UserName = 'Line19'
        ParentHeight = True
        ParentWidth = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText55: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'ADDER_NAME'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 4022
        mmLeft = 2910
        mmTop = 1323
        mmWidth = 35475
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'cac_meoth'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 4022
        mmLeft = 44979
        mmTop = 1323
        mmWidth = 7027
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'AMOUNT'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 4022
        mmLeft = 72496
        mmTop = 1323
        mmWidth = 1778
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'cost_m2'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 4022
        mmLeft = 98954
        mmTop = 1323
        mmWidth = 1778
        BandType = 4
      end
      object ppLine49: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = True
        DataField = 'NOTE_INFO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 25135
        mmLeft = 14023
        mmTop = 2381
        mmWidth = 179123
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel76: TppLabel
        UserName = 'Label32'
        Caption = #22791#27880':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 2381
        mmWidth = 8467
        BandType = 8
      end
      object ppDBText59: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 12965
        mmTop = 30956
        mmWidth = 10583
        BandType = 8
      end
      object ppLabel77: TppLabel
        UserName = 'Label33'
        Caption = #21046#21333':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 30956
        mmWidth = 8731
        BandType = 8
      end
      object ppLine50: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 12171
        mmTop = 35983
        mmWidth = 18256
        BandType = 8
      end
      object ppLabel78: TppLabel
        UserName = 'Label34'
        Caption = #21046#21333#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 29898
        mmTop = 30956
        mmWidth = 15875
        BandType = 8
      end
      object ppLine51: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 46831
        mmTop = 35983
        mmWidth = 33338
        BandType = 8
      end
      object ppLabel79: TppLabel
        UserName = 'Label35'
        Caption = #23457#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 86784
        mmTop = 30956
        mmWidth = 8731
        BandType = 8
      end
      object ppLine52: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 95250
        mmTop = 35983
        mmWidth = 20902
        BandType = 8
      end
      object ppLabel80: TppLabel
        UserName = 'Label40'
        Caption = #26368#21518#23457#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 120121
        mmTop = 30956
        mmWidth = 15875
        BandType = 8
      end
      object ppLine53: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 134673
        mmTop = 35983
        mmWidth = 19844
        BandType = 8
      end
      object ppDBText60: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'APPRV_DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 30956
        mmWidth = 32015
        BandType = 8
      end
      object ppLine54: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 171450
        mmTop = 35983
        mmWidth = 21960
        BandType = 8
      end
      object ppLabel81: TppLabel
        UserName = 'Label401'
        Caption = #23457#26680#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 30956
        mmWidth = 15875
        BandType = 8
      end
    end
    object ppSummaryBand4: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 74348
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape2'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 74348
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel82: TppLabel
        UserName = 'Label28'
        Caption = #26448#26009#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 9790
        mmWidth = 12435
        BandType = 7
      end
      object ppDBText61: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'MATL_COST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 9790
        mmWidth = 14224
        BandType = 7
      end
      object ppLabel83: TppLabel
        UserName = 'Label29'
        Caption = #22522#26412#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 14552
        mmWidth = 12435
        BandType = 7
      end
      object ppDBText62: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'base_pcscost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 14552
        mmWidth = 12435
        BandType = 7
      end
      object ppLabel84: TppLabel
        UserName = 'Label30'
        Caption = #24037#33402#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 19315
        mmWidth = 12435
        BandType = 7
      end
      object ppDBText63: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'ovhd_cost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 19315
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel85: TppLabel
        UserName = 'Label31'
        Caption = #24635#25104#26412':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13229
        mmTop = 24342
        mmWidth = 12435
        BandType = 7
      end
      object ppDBText64: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'total_cost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 24342
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel86: TppLabel
        UserName = 'Label36'
        Caption = #20215#26684#20998#26512
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4022
        mmLeft = 11906
        mmTop = 3440
        mmWidth = 14224
        BandType = 7
      end
      object ppLine55: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 8202
        mmWidth = 80698
        BandType = 7
      end
      object ppLabel87: TppLabel
        UserName = 'Label38'
        Caption = #39069#22806#21152#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 9790
        mmTop = 29104
        mmWidth = 15875
        BandType = 7
      end
      object ppDBText65: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'CRP_EST_QUANTITY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 29104
        mmWidth = 1852
        BandType = 7
      end
      object ppLabel88: TppLabel
        UserName = 'Label39'
        Caption = #25240#35753#29575'%:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 11642
        mmTop = 34131
        mmWidth = 14023
        BandType = 7
      end
      object ppDBText66: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = 'MARKUP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 34131
        mmWidth = 8996
        BandType = 7
      end
      object ppLabel89: TppLabel
        UserName = 'Label41'
        Caption = #37329#39069'/'#25253#20215#21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 29633
        mmTop = 3704
        mmWidth = 22860
        BandType = 7
      end
      object ppLine56: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 39423
        mmWidth = 80698
        BandType = 7
      end
      object ppLabel90: TppLabel
        UserName = 'Label42'
        Caption = #37329#39069'/'#27599#24179#31859
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 54769
        mmTop = 3704
        mmWidth = 19346
        BandType = 7
      end
      object ppDBText67: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'quote_price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 40746
        mmWidth = 14288
        BandType = 7
      end
      object ppLabel91: TppLabel
        UserName = 'Label43'
        Caption = #25253#20215#36135#24065':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 9525
        mmTop = 50800
        mmWidth = 15875
        BandType = 7
      end
      object ppDBText68: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'CURR_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 50800
        mmWidth = 10583
        BandType = 7
      end
      object ppDBText69: TppDBText
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'CURR_RATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 55563
        mmWidth = 1852
        BandType = 7
      end
      object ppLabel92: TppLabel
        UserName = 'Label44'
        Caption = #27719#29575':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 16404
        mmTop = 55563
        mmWidth = 8731
        BandType = 7
      end
      object ppLabel93: TppLabel
        UserName = 'Label45'
        Caption = #22686#20540#31246'%:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 11642
        mmTop = 45773
        mmWidth = 14023
        BandType = 7
      end
      object ppDBText70: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'vatax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 29898
        mmTop = 45773
        mmWidth = 3440
        BandType = 7
      end
      object ppLabel94: TppLabel
        UserName = 'Label46'
        Caption = #35745#31639#36135#24065': '#20154#27665#24065
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 81227
        mmTop = 3704
        mmWidth = 28152
        BandType = 7
      end
      object ppLabel95: TppLabel
        UserName = 'Label47'
        Caption = #25253#20215'('#19981#21547#31246'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 2646
        mmTop = 40746
        mmWidth = 22902
        BandType = 7
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'rej_info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        mmHeight = 64823
        mmLeft = 79640
        mmTop = 8467
        mmWidth = 116152
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label37'
        Caption = #23618#21387#22270
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 161925
        mmTop = 3175
        mmWidth = 10583
        BandType = 7
      end
      object ppVariable2: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        DataType = dtDouble
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 55827
        mmTop = 9790
        mmWidth = 16002
        BandType = 7
      end
    end
  end
  object ppDesigner2: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReport2
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 256
    Top = 192
  end
end
