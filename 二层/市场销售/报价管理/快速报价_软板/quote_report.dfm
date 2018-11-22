object Form_report: TForm_report
  Left = 525
  Top = 198
  Width = 421
  Height = 419
  Caption = 'report'
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
      ', '#13#10'      d05.empl_code as REP_CODE, d05.EMPLOYEE_NAME as SALES_' +
      'REP_NAME, '#13#10'      Data0008.PROD_CODE, Data0008.PRODUCT_NAME, Dat' +
      'a0264.CODE, '#13#10'      dbo.Data0264.QTE_APPROV_DESC, dbo.Data0346.R' +
      'OW_NAME, '#13#10'      Data0085.CUST_ADD1, Data0085.NOTE_INFO, Data008' +
      '5.rej_info, '#13#10'      Data0085.quote_price, Data0085.MATL_COST, Da' +
      'ta0085.base_pcscost, '#13#10'      dbo.Data0085.ovhd_cost, dbo.Data008' +
      '5.total_cost, data0085.rkey,'#13#10'      dbo.Data0085.CRP_EST_QUANTIT' +
      'Y, dbo.Data0085.comm_cost, '#13#10'      dbo.Data0085.SHIPPING_CHARGE,' +
      ' dbo.Data0085.QTE_UNITS,'#13#10'case Data0085.ttype2 when 0 then '#39#26032#21333#39' ' +
      'when 1 then '#39#26356#25913#24037#33402#39' '#13#10'when 2 then '#39#26448#26009#35843#20215#39' when 3 then '#39#20854#23427#39' when 4 ' +
      'then '#39#36820#21333#39' end as '#31867#22411','#13#10'case Data0085.AUDITED_STATUS when 0 then '#39 +
      #26410#25552#20132#39#13#10'when 1 then '#39#24453#23457#25209#39' when 2 then '#39#24050#36807#26399#39' '#13#10'when 3 then '#39#24050#23457#25209#39' wh' +
      'en 4 then '#39#34987#36864#22238#39' end as '#29366#24577','#13#10'case Data0085.qte_unit_ptr when 1 th' +
      'en '#39'PCS'#39#13#10'when 2 then '#39'SET'#39' end as '#25253#20215#21333#20301',data0085.rate_margin as ' +
      #27611#21033#29575','#13#10'case Data0085.quote_type when 0 then '#39#20869#38144#39#13#10'when 1 then '#39#36716#21378 +
      #39' end as '#38144#21806#26041#24335',data0085.APPRV_DATE,'#13#10'data0085.unit_len,data0085.u' +
      'nit_wth,data0085.TUNITS,'#13#10'data0085.USHEET, data0085.QTE_USHEET ,' +
      ' data0085.SALES_ORDERS_ENTERED as '#26368#23569#35746#21333#37327#13#10'FROM dbo.Data0085 INNER' +
      ' JOIN'#13#10'      dbo.Data0005 ON dbo.Data0085.QBY_EMPL_PTR = dbo.Dat' +
      'a0005.RKEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0085.CURR_P' +
      'TR = dbo.Data0001.RKEY INNER JOIN'#13#10'      dbo.Data0005 as d05 ON ' +
      'dbo.Data0085.SREP_PTR = d05.RKEY INNER JOIN'#13#10'      dbo.Data0008 ' +
      'ON '#13#10'      dbo.Data0085.PROD_CODE_PTR = dbo.Data0008.RKEY INNER ' +
      'JOIN'#13#10'      dbo.Data0264 ON '#13#10'      dbo.Data0085.PROD_ROUTE_PTR ' +
      '= dbo.Data0264.RKEY INNER JOIN'#13#10'      dbo.Data0346 ON dbo.Data00' +
      '85.ENGR_ROUTE_PTR = dbo.Data0346.RKEY'#13#10'WHERE data0085.rkey = :rk' +
      'ey'
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
      FieldName = #26368#23569#35746#21333#37327
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
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #20135#21697#25253#20215#26723#26696
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
    Template.FileName = 'D:\SJSYS\NIERP\REPORT\fastquote_report_FPC.rtm'
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
      object ppLabel3: TppLabel
        UserName = 'Label19'
        Caption = #20135#21697#25253#20215#25104#26412#20998#26512#26723#26696#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 69586
        mmTop = 8996
        mmWidth = 55033
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 30163
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'TNUMBER'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 1588
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel4: TppLabel
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
      object ppLabel5: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 61913
        mmTop = 1588
        mmWidth = 16002
        BandType = 0
      end
      object ppLabel6: TppLabel
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
      object ppLabel7: TppLabel
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
      object ppLabel8: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 7408
        mmWidth = 19558
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'CUST_PART_NO'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 61913
        mmTop = 7408
        mmWidth = 21336
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CUST_PART_DESC'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 120650
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
        mmLeft = 60061
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLabel9: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 1323
        mmWidth = 24892
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 7408
        mmWidth = 23114
        BandType = 0
      end
      object ppLabel10: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 120650
        mmTop = 19579
        mmWidth = 7027
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'PRODUCT_NAME'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 120650
        mmTop = 13494
        mmWidth = 21336
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 13494
        mmWidth = 14224
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3969
        mmLeft = 61913
        mmTop = 13494
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'TUNITS'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 19579
        mmWidth = 10668
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
        Caption = #23454#38469#25253#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 161967
        mmTop = 19579
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'QTE_DATE'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 13494
        mmWidth = 14224
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'quote_taxprice'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 19579
        mmWidth = 24892
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
        mmHeight = 18256
        mmLeft = 95779
        mmTop = 6350
        mmWidth = 3175
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 18256
        mmLeft = 118004
        mmTop = 6615
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'Label57'
        Caption = #26368#23567#35746#21333#37329#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 39688
        mmTop = 20108
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText84: TppDBText
        UserName = 'DBText401'
        AutoSize = True
        DataField = 'CURR_CODE'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 61913
        mmTop = 20108
        mmWidth = 16002
        BandType = 0
      end
      object ppDBText85: TppDBText
        UserName = 'DBText85'
        AutoSize = True
        DataField = #26368#23569#35746#21333#37327
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 69586
        mmTop = 20108
        mmWidth = 17568
        BandType = 0
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentWidth = False
        TraverseAllData = False
        DataPipelineName = 'ppDB253'
        mmHeight = 5292
        mmLeft = 0
        mmTop = 24871
        mmWidth = 197380
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDB253
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = #20135#21697#25253#20215#26723#26696
          PrinterSetup.PaperName = 'A4'
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
            mmHeight = 5556
            mmPrintPosition = 0
            object ppLine12: TppLine
              UserName = 'Line40'
              ParentHeight = True
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 1
            end
            object ppLine13: TppLine
              UserName = 'Line41'
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 0
              mmTop = 0
              mmWidth = 197380
              BandType = 1
            end
            object ppLine14: TppLine
              UserName = 'Line12'
              ParentHeight = True
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 5556
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
              mmHeight = 3969
              mmLeft = 14817
              mmTop = 794
              mmWidth = 14023
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
              mmLeft = 82286
              mmTop = 794
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
              mmLeft = 168011
              mmTop = 794
              mmWidth = 10583
              BandType = 1
            end
            object ppLine17: TppLine
              UserName = 'Line17'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 43921
              mmTop = 0
              mmWidth = 2910
              BandType = 1
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 153723
              mmTop = 0
              mmWidth = 2381
              BandType = 1
            end
            object ppLine15: TppLine
              UserName = 'Line29'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 133350
              mmTop = 0
              mmWidth = 1588
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'Label50'
              Caption = #21333#20215
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 139965
              mmTop = 794
              mmWidth = 7144
              BandType = 1
            end
            object ppLine16: TppLine
              UserName = 'Line31'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 165629
              mmTop = 0
              mmWidth = 794
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label502'
              Caption = #23618#21387#27604
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 154517
              mmTop = 794
              mmWidth = 10541
              BandType = 1
            end
            object ppLine19: TppLine
              UserName = 'Line36'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 0
              mmTop = 0
              mmWidth = 1852
              BandType = 1
            end
            object ppLine20: TppLine
              UserName = 'Line57'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 197115
              mmTop = 0
              mmWidth = 2910
              BandType = 1
            end
            object ppLine21: TppLine
              UserName = 'Line59'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 182563
              mmTop = 0
              mmWidth = 529
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label63'
              Caption = #20027'/'#36741#26448
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 183357
              mmTop = 794
              mmWidth = 12319
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppLine22: TppLine
              UserName = 'Line13'
              ParentHeight = True
              ParentWidth = True
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              ShiftWithParent = True
              DataField = 'INV_PART_NUMBER'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDB253'
              mmHeight = 4487
              mmLeft = 1058
              mmTop = 265
              mmWidth = 42069
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'INV_PART_DESCRIPTION'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              WordWrap = True
              DataPipelineName = 'ppDB253'
              mmHeight = 3969
              mmLeft = 44715
              mmTop = 794
              mmWidth = 87577
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
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 3641
              mmLeft = 166465
              mmTop = 794
              mmWidth = 14478
              BandType = 4
            end
            object ppLine80: TppLine
              UserName = 'Line14'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 43921
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppLine81: TppLine
              UserName = 'Line15'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 153723
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppLine82: TppLine
              UserName = 'Line30'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 133350
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText37'
              AutoSize = True
              DataField = 'price'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 3979
              mmLeft = 135478
              mmTop = 794
              mmWidth = 9779
              BandType = 4
            end
            object ppLabel110: TppLabel
              UserName = 'Label501'
              Caption = 'RMB'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 147109
              mmTop = 794
              mmWidth = 5292
              BandType = 4
            end
            object ppLine83: TppLine
              UserName = 'Line32'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 165629
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText38'
              AutoSize = True
              DataField = 'QTY_BOM'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 3979
              mmLeft = 155046
              mmTop = 794
              mmWidth = 8721
              BandType = 4
            end
            object ppLine84: TppLine
              UserName = 'Line37'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppLine85: TppLine
              UserName = 'Line39'
              ParentHeight = True
              Position = lpRight
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 195527
              mmTop = 0
              mmWidth = 1852
              BandType = 4
            end
            object ppLine86: TppLine
              UserName = 'Line60'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 182563
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object ppDBText86: TppDBText
              UserName = 'DBText44'
              DataField = 'METAL'
              DataPipeline = ppDB253
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB253'
              mmHeight = 3969
              mmLeft = 184415
              mmTop = 529
              mmWidth = 11377
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'Line19'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 184680
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText19: TppDBText
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
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 529
        mmWidth = 35454
        BandType = 4
      end
      object ppDBText20: TppDBText
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
        mmHeight = 3969
        mmLeft = 44979
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'AMOUNT'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 3969
        mmLeft = 67998
        mmTop = 529
        mmWidth = 12171
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'cost_m2'
        DataPipeline = ppDB432
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB432'
        mmHeight = 4022
        mmLeft = 91017
        mmTop = 529
        mmWidth = 12446
        BandType = 4
      end
      object ppLine24: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 37571
      mmPrintPosition = 0
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = True
        DataField = 'NOTE_INFO'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 19315
        mmLeft = 14023
        mmTop = 11906
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
        mmTop = 11906
        mmWidth = 8467
        BandType = 8
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 12965
        mmTop = 32015
        mmWidth = 23114
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
        mmTop = 32015
        mmWidth = 8731
        BandType = 8
      end
      object ppLine26: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 12171
        mmTop = 36513
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
        mmTop = 32015
        mmWidth = 15875
        BandType = 8
      end
      object ppLine27: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 46831
        mmTop = 36513
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
        mmTop = 32015
        mmWidth = 8731
        BandType = 8
      end
      object ppLine28: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 95250
        mmTop = 36513
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
        mmTop = 32015
        mmWidth = 15875
        BandType = 8
      end
      object ppLine57: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 134673
        mmTop = 36513
        mmWidth = 19844
        BandType = 8
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'APPRV_DATE'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 46831
        mmTop = 32015
        mmWidth = 17780
        BandType = 8
      end
      object ppLine58: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 171450
        mmTop = 36513
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
        mmTop = 32015
        mmWidth = 15875
        BandType = 8
      end
      object ppLabel36: TppLabel
        UserName = 'Label54'
        Caption = #25240#29575#22914#20302#20110#20844#21496#35268#23450#65292#36229#36234#26435#38480#65292#20973#27492#34920#20132#19978#21496#23457#25209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4445
        mmLeft = 1058
        mmTop = 6350
        mmWidth = 90551
        BandType = 8
      end
      object ppLabel37: TppLabel
        UserName = 'Label56'
        Caption = #27492#25253#20215#21333#20165#20379#20869#37096#20351#29992','#23646#20844#21496#26426#23494','#19981#24471#22806#20256#21542#21017#36861#31350#30456#20851#36131#20219
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4445
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 110279
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 88900
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        mmHeight = 88900
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentWidth = False
        TraverseAllData = True
        DataPipelineName = 'ppDB8501'
        mmHeight = 22490
        mmLeft = 2646
        mmTop = 50006
        mmWidth = 74877
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = ppDB8501
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = #20135#21697#25253#20215#26723#26696
          PrinterSetup.PaperName = 'A4'
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
          DataPipelineName = 'ppDB8501'
          object ppTitleBand6: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand6: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppDBText90: TppDBText
              UserName = 'DBText90'
              DataField = 'Cost_Name'
              DataPipeline = ppDB8501
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDB8501'
              mmHeight = 3979
              mmLeft = 3969
              mmTop = 0
              mmWidth = 16933
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText1'
              DataField = 'Cost'
              DataPipeline = ppDB8501
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB8501'
              mmHeight = 3979
              mmLeft = 27517
              mmTop = 0
              mmWidth = 16669
              BandType = 4
            end
            object ppLabel111: TppLabel
              UserName = 'Label111'
              Caption = #65306
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3598
              mmLeft = 21167
              mmTop = 0
              mmWidth = 3217
              BandType = 4
            end
            object ppDBText61: TppDBText
              UserName = 'DBText61'
              DataField = 'Total_Cost'
              DataPipeline = ppDB8501
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDB8501'
              mmHeight = 4763
              mmLeft = 54240
              mmTop = 0
              mmWidth = 17463
              BandType = 4
            end
          end
          object ppSummaryBand6: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7938
            mmPrintPosition = 0
            object ppVariable1: TppVariable
              UserName = 'Variable1'
              CalcOrder = 0
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 54769
              mmTop = 3969
              mmWidth = 14817
              BandType = 7
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc3'
              DataField = 'Cost'
              DataPipeline = ppDB8501
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              Visible = False
              DataPipelineName = 'ppDB8501'
              mmHeight = 3969
              mmLeft = 3440
              mmTop = 794
              mmWidth = 15346
              BandType = 7
            end
            object ppLabel13: TppLabel
              UserName = 'Label1'
              Caption = #26368#32456#25253#20215#65306
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 28840
              mmTop = 3969
              mmWidth = 20108
              BandType = 7
            end
          end
          object raCodeModule5: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
              5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
              726F63656475726506536F75726365067170726F636564757265205661726961
              626C65314F6E43616C63287661722056616C75653A2056617269616E74293B0D
              0A626567696E0D0A0D0A202056616C7565203A3D20444243616C63332E76616C
              7565202B20444238355B2751554F54455F5441585F4D32275D3B0D0A656E643B
              0D0A0D436F6D706F6E656E744E616D6506095661726961626C6531094576656E
              744E616D6506064F6E43616C63074576656E74494402210000}
          end
        end
      end
      object ppLabel38: TppLabel
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
      object ppDBText26: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'MATL_COST'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 9790
        mmWidth = 16002
        BandType = 7
      end
      object ppLabel39: TppLabel
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
      object ppDBText27: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = 'base_pcscost'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 14552
        mmWidth = 21336
        BandType = 7
      end
      object ppLabel41: TppLabel
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
      object ppDBText29: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = 'ovhd_cost'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 19315
        mmWidth = 16002
        BandType = 7
      end
      object ppLabel42: TppLabel
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
      object ppDBText30: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'total_cost'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 24342
        mmWidth = 17780
        BandType = 7
      end
      object ppLabel43: TppLabel
        UserName = 'Label36'
        Caption = #20215#26684#20998#26512#19981#21547#31246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 3440
        mmWidth = 24892
        BandType = 7
      end
      object ppLine59: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 8202
        mmWidth = 76200
        BandType = 7
      end
      object ppLabel44: TppLabel
        UserName = 'Label38'
        Caption = #25253#24223#25104#26412':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 9832
        mmTop = 29104
        mmWidth = 15833
        BandType = 7
      end
      object ppDBText32: TppDBText
        UserName = 'DBText29'
        AutoSize = True
        DataField = 'CRP_EST_QUANTITY'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 29104
        mmWidth = 28448
        BandType = 7
      end
      object ppLabel45: TppLabel
        UserName = 'Label39'
        Caption = #27611#21033#29575'%:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 11568
        mmTop = 34131
        mmWidth = 14097
        BandType = 7
      end
      object ppDBText33: TppDBText
        UserName = 'DBText30'
        AutoSize = True
        DataField = #27611#21033#29575
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 34131
        mmWidth = 10541
        BandType = 7
      end
      object ppLabel46: TppLabel
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
      object ppLine60: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 43921
        mmWidth = 76200
        BandType = 7
      end
      object ppLabel47: TppLabel
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
      object ppDBText34: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'quote_taxprice'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 45244
        mmWidth = 24892
        BandType = 7
      end
      object ppLabel97: TppLabel
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
        mmTop = 78317
        mmWidth = 15875
        BandType = 7
      end
      object ppDBText35: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'CURR_NAME'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 78317
        mmWidth = 16002
        BandType = 7
      end
      object ppDBText71: TppDBText
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'CURR_RATE'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 83079
        mmWidth = 16002
        BandType = 7
      end
      object ppLabel98: TppLabel
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
        mmLeft = 16669
        mmTop = 83079
        mmWidth = 8731
        BandType = 7
      end
      object ppLabel99: TppLabel
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
        mmLeft = 11377
        mmTop = 73290
        mmWidth = 14023
        BandType = 7
      end
      object ppDBText72: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'vatax'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29898
        mmTop = 73290
        mmWidth = 8890
        BandType = 7
      end
      object ppLabel100: TppLabel
        UserName = 'Label46'
        Caption = #35745#31639#36135#24065':'#20154#27665#24065
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 52388
        mmTop = 83344
        mmWidth = 26458
        BandType = 7
      end
      object ppLabel101: TppLabel
        UserName = 'Label47'
        Caption = #25253#20215#21547#31246#21407#24065':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 2688
        mmTop = 45244
        mmWidth = 22860
        BandType = 7
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'rej_info'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #26032#23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 60325
        mmLeft = 137054
        mmTop = 8467
        mmWidth = 58473
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel102: TppLabel
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
      object ppLabel103: TppLabel
        UserName = 'Label1'
        Caption = #25253#20215'('#26412#20301#24065'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 3027
        mmTop = 39158
        mmWidth = 22902
        BandType = 7
      end
      object ppDBText73: TppDBText
        UserName = 'DBText301'
        AutoSize = True
        DataField = 'QTE_UNITS'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 29633
        mmTop = 39158
        mmWidth = 16002
        BandType = 7
      end
      object ppLine61: TppLine
        UserName = 'Line33'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 64823
        mmLeft = 54240
        mmTop = 8467
        mmWidth = 2381
        BandType = 7
      end
      object ppLine62: TppLine
        UserName = 'Line34'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 65088
        mmLeft = 76729
        mmTop = 8202
        mmWidth = 2646
        BandType = 7
      end
      object ppLine63: TppLine
        UserName = 'Line35'
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 54504
        mmTop = 73290
        mmWidth = 22490
        BandType = 7
      end
      object ppDBText74: TppDBText
        UserName = 'DBText39'
        DataField = 'MATL_M2'
        DataPipeline = ppDB85
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3969
        mmLeft = 57150
        mmTop = 9525
        mmWidth = 16933
        BandType = 7
      end
      object ppDBText75: TppDBText
        UserName = 'DBText40'
        DataField = 'BASE_M2'
        DataPipeline = ppDB85
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3969
        mmLeft = 57150
        mmTop = 14552
        mmWidth = 17198
        BandType = 7
      end
      object ppDBText76: TppDBText
        UserName = 'DBText41'
        DataField = 'OVHD_M2'
        DataPipeline = ppDB85
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3969
        mmLeft = 57150
        mmTop = 19579
        mmWidth = 17198
        BandType = 7
      end
      object ppDBText77: TppDBText
        UserName = 'DBText42'
        DataField = 'TOTAL_M2'
        DataPipeline = ppDB85
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3969
        mmLeft = 57150
        mmTop = 24342
        mmWidth = 17198
        BandType = 7
      end
      object ppDBText78: TppDBText
        UserName = 'DBText43'
        DataField = 'CRP_EST_M2'
        DataPipeline = ppDB85
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 57150
        mmTop = 29104
        mmWidth = 17198
        BandType = 7
      end
      object ppDBText79: TppDBText
        UserName = 'DBText44'
        DataField = 'QTE_M2'
        DataPipeline = ppDB85
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 56621
        mmTop = 38894
        mmWidth = 17198
        BandType = 7
      end
      object ppDBText80: TppDBText
        UserName = 'DBText45'
        DataField = 'QUOTE_TAX_M2'
        DataPipeline = ppDB85
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 56886
        mmTop = 45508
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel104: TppLabel
        UserName = 'Label55'
        Caption = #25490#29256#20215#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 56886
        mmTop = 74083
        mmWidth = 15875
        BandType = 7
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentWidth = False
        TraverseAllData = False
        Visible = False
        DataPipelineName = 'ppDB061'
        mmHeight = 55298
        mmLeft = 84667
        mmTop = 7938
        mmWidth = 48683
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppDB061
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = #20135#21697#25253#20215#26723#26696
          PrinterSetup.PaperName = 'A4'
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
          DataPipelineName = 'ppDB061'
          object ppTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6085
            mmPrintPosition = 0
            object ppShape5: TppShape
              UserName = 'Shape3'
              mmHeight = 5821
              mmLeft = 0
              mmTop = 265
              mmWidth = 46302
              BandType = 1
            end
            object ppLabel105: TppLabel
              UserName = 'Label58'
              Caption = #27169#20855#31867#22411
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 1588
              mmTop = 1058
              mmWidth = 14055
              BandType = 1
            end
            object ppLine64: TppLine
              UserName = 'Line45'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5821
              mmLeft = 16933
              mmTop = 265
              mmWidth = 2646
              BandType = 1
            end
            object ppLabel106: TppLabel
              UserName = 'Label59'
              Caption = #22871#25968
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 18785
              mmTop = 1058
              mmWidth = 7144
              BandType = 1
            end
            object ppLine65: TppLine
              UserName = 'Line47'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5556
              mmLeft = 28310
              mmTop = 529
              mmWidth = 2646
              BandType = 1
            end
            object ppLabel107: TppLabel
              UserName = 'Label60'
              Caption = #36153#29992
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 33338
              mmTop = 1058
              mmWidth = 7027
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppDBText81: TppDBText
              UserName = 'DBText41'
              AutoSize = True
              DataField = 'CATEGORY'
              DataPipeline = ppDB061
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB061'
              mmHeight = 4022
              mmLeft = 1365
              mmTop = 529
              mmWidth = 14224
              BandType = 4
            end
            object ppDBText82: TppDBText
              UserName = 'DBText42'
              AutoSize = True
              BlankWhenZero = True
              DataField = 'AMOUNT'
              DataPipeline = ppDB061
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB061'
              mmHeight = 4022
              mmLeft = 31982
              mmTop = 529
              mmWidth = 10668
              BandType = 4
            end
            object ppLine66: TppLine
              UserName = 'Line46'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4498
              mmLeft = 0
              mmTop = 0
              mmWidth = 2646
              BandType = 4
            end
            object ppLine67: TppLine
              UserName = 'Line48'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 28310
              mmTop = 0
              mmWidth = 529
              BandType = 4
            end
            object ppLine68: TppLine
              UserName = 'Line49'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 16933
              mmTop = 0
              mmWidth = 2646
              BandType = 4
            end
            object ppLine69: TppLine
              UserName = 'Line50'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 4763
              mmLeft = 46038
              mmTop = 0
              mmWidth = 2117
              BandType = 4
            end
            object ppLine70: TppLine
              UserName = 'Line501'
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 1588
              mmLeft = 0
              mmTop = 3175
              mmWidth = 46302
              BandType = 4
            end
            object ppDBText83: TppDBText
              UserName = 'DBText43'
              DataField = 'Mould_set'
              DataPipeline = ppDB061
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB061'
              mmHeight = 3969
              mmLeft = 17727
              mmTop = 529
              mmWidth = 9790
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'AMOUNT'
              DataPipeline = ppDB061
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB061'
              mmHeight = 3969
              mmLeft = 29633
              mmTop = 529
              mmWidth = 15346
              BandType = 7
            end
            object ppLine71: TppLine
              UserName = 'Line52'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 0
              mmTop = 0
              mmWidth = 2646
              BandType = 7
            end
            object ppLine72: TppLine
              UserName = 'Line53'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 28310
              mmTop = 0
              mmWidth = 2646
              BandType = 7
            end
            object ppLine73: TppLine
              UserName = 'Line54'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 16933
              mmTop = 0
              mmWidth = 2646
              BandType = 7
            end
            object ppLine74: TppLine
              UserName = 'Line502'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 5292
              mmLeft = 46038
              mmTop = 0
              mmWidth = 2910
              BandType = 7
            end
            object ppLabel108: TppLabel
              UserName = 'Label61'
              Caption = #21512#35745
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = #23435#20307
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4022
              mmLeft = 4763
              mmTop = 794
              mmWidth = 7027
              BandType = 7
            end
            object ppLine75: TppLine
              UserName = 'Line56'
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 1588
              mmLeft = 0
              mmTop = 3704
              mmWidth = 46302
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'Mould_set'
              DataPipeline = ppDB061
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDB061'
              mmHeight = 3969
              mmLeft = 17992
              mmTop = 794
              mmWidth = 9260
              BandType = 7
            end
          end
          object raCodeModule3: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ppDBText1'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 62971
        mmPrintPosition = 0
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = #27599#24179#31859#25104#26412
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 90752
          mmTop = 58473
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
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
          mmLeft = 67733
          mmTop = 58473
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
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
          mmLeft = 42863
          mmTop = 58473
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
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
          mmLeft = 8731
          mmTop = 58473
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLine76: TppLine
          UserName = 'Line43'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 0
          mmTop = 56092
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLine77: TppLine
          UserName = 'Line38'
          Position = lpRight
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 192882
          mmTop = 57415
          mmWidth = 4498
          BandType = 3
          GroupNo = 0
        end
        object ppLine78: TppLine
          UserName = 'Line201'
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 62706
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine79: TppLine
          UserName = 'Line102'
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 0
          mmTop = 57415
          mmWidth = 4763
          BandType = 3
          GroupNo = 0
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
          mmHeight = 34396
          mmLeft = 794
          mmTop = 6350
          mmWidth = 55827
          BandType = 3
          GroupNo = 0
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
          mmHeight = 34131
          mmLeft = 56886
          mmTop = 6350
          mmWidth = 55827
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label10'
          Caption = #25253#20215#21442#25968
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 1323
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
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
          mmHeight = 3969
          mmLeft = 39423
          mmTop = 1323
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppLine25: TppLine
          UserName = 'Line25'
          Weight = 0.750000000000000000
          mmHeight = 265
          mmLeft = 0
          mmTop = 5556
          mmWidth = 112184
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
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
          mmTop = 1323
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
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
          mmTop = 1323
          mmWidth = 3440
          BandType = 3
          GroupNo = 0
        end
        object ppImage1: TppImage
          UserName = 'Image1'
          MaintainAspectRatio = False
          Stretch = True
          mmHeight = 53446
          mmLeft = 114829
          mmTop = 1588
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule4: TraCodeModule
      ProgramStream = {00}
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
      'IPTION, '#13#10'CASE WHEN dbo.Data0017.GROUP_PTR IN (2,30) then '#39#20027#26448#39'  ' +
      'ELSE '#13#10#39#36741#26448#39' END AS METAL ,'#13#10'      dbo.Data0023.ABBR_NAME, dbo.Da' +
      'ta0002.UNIT_NAME, dbo.Data0253.price, '#13#10'      dbo.Data0253.QTY, ' +
      'ROUND(dbo.Data0253.QTY * dbo.Data0253.price, 6) '#13#10'      AS pcs_c' +
      'ost,data0253.QTY_BOM'#13#10'FROM dbo.Data0253 INNER JOIN'#13#10'      dbo.Da' +
      'ta0017 ON '#13#10'      dbo.Data0253.STD_INVENT_PTR = dbo.Data0017.RKE' +
      'Y INNER JOIN'#13#10'      dbo.Data0028 ON dbo.Data0253.D0028_PTR = dbo' +
      '.Data0028.RKEY INNER JOIN'#13#10'      dbo.Data0023 ON dbo.Data0028.SU' +
      'PPLIER_PTR = dbo.Data0023.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON' +
      ' dbo.Data0028.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY'#13#10'WHERE DATA0' +
      '253.quote_ptr = :rkey'
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
    object ADS253QTY_BOM: TFloatField
      FieldName = 'QTY_BOM'
    end
    object ADS253METAL: TStringField
      FieldName = 'METAL'
      ReadOnly = True
      Size = 4
    end
  end
  object DataSource3: TDataSource
    DataSet = ADS253
    Left = 112
    Top = 84
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
      DisplayWidth = 0
      Position = 0
    end
    object ppDB85ppField2: TppField
      FieldAlias = 'REF_PART_NO'
      FieldName = 'REF_PART_NO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDB85ppField3: TppField
      FieldAlias = 'CUST_PART_NO'
      FieldName = 'CUST_PART_NO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppDB85ppField4: TppField
      FieldAlias = 'CUST_PART_DESC'
      FieldName = 'CUST_PART_DESC'
      FieldLength = 200
      DisplayWidth = 200
      Position = 3
    end
    object ppDB85ppField5: TppField
      FieldAlias = 'CUST_NAME'
      FieldName = 'CUST_NAME'
      FieldLength = 100
      DisplayWidth = 100
      Position = 4
    end
    object ppDB85ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'quote_taxprice'
      FieldName = 'quote_taxprice'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppDB85ppField7: TppField
      FieldAlias = 'CURR_NAME'
      FieldName = 'CURR_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object ppDB85ppField8: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 7
    end
    object ppDB85ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CURR_RATE'
      FieldName = 'CURR_RATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppDB85ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'vatax'
      FieldName = 'vatax'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 6
      Position = 9
    end
    object ppDB85ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'MARKUP'
      FieldName = 'MARKUP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppDB85ppField12: TppField
      FieldAlias = 'QTE_DATE'
      FieldName = 'QTE_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppDB85ppField13: TppField
      FieldAlias = 'EXPIRATION_DATE'
      FieldName = 'EXPIRATION_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppDB85ppField14: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 16
      DisplayWidth = 16
      Position = 13
    end
    object ppDB85ppField15: TppField
      FieldAlias = 'REP_CODE'
      FieldName = 'REP_CODE'
      FieldLength = 5
      DisplayWidth = 5
      Position = 14
    end
    object ppDB85ppField16: TppField
      FieldAlias = 'SALES_REP_NAME'
      FieldName = 'SALES_REP_NAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 15
    end
    object ppDB85ppField17: TppField
      FieldAlias = 'PROD_CODE'
      FieldName = 'PROD_CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppDB85ppField18: TppField
      FieldAlias = 'PRODUCT_NAME'
      FieldName = 'PRODUCT_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 17
    end
    object ppDB85ppField19: TppField
      FieldAlias = 'CODE'
      FieldName = 'CODE'
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
    object ppDB85ppField20: TppField
      FieldAlias = 'QTE_APPROV_DESC'
      FieldName = 'QTE_APPROV_DESC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 19
    end
    object ppDB85ppField21: TppField
      FieldAlias = 'ROW_NAME'
      FieldName = 'ROW_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 20
    end
    object ppDB85ppField22: TppField
      FieldAlias = 'CUST_ADD1'
      FieldName = 'CUST_ADD1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 21
    end
    object ppDB85ppField23: TppField
      FieldAlias = 'NOTE_INFO'
      FieldName = 'NOTE_INFO'
      FieldLength = 400
      DisplayWidth = 400
      Position = 22
    end
    object ppDB85ppField24: TppField
      FieldAlias = 'rej_info'
      FieldName = 'rej_info'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB85ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'quote_price'
      FieldName = 'quote_price'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object ppDB85ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'MATL_COST'
      FieldName = 'MATL_COST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppDB85ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'base_pcscost'
      FieldName = 'base_pcscost'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppDB85ppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'ovhd_cost'
      FieldName = 'ovhd_cost'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppDB85ppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'total_cost'
      FieldName = 'total_cost'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppDB85ppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'CRP_EST_QUANTITY'
      FieldName = 'CRP_EST_QUANTITY'
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 13
      Position = 29
    end
    object ppDB85ppField31: TppField
      Alignment = taRightJustify
      FieldAlias = 'comm_cost'
      FieldName = 'comm_cost'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 30
    end
    object ppDB85ppField32: TppField
      Alignment = taRightJustify
      FieldAlias = 'SHIPPING_CHARGE'
      FieldName = 'SHIPPING_CHARGE'
      FieldLength = 6
      DataType = dtDouble
      DisplayWidth = 13
      Position = 31
    end
    object ppDB85ppField33: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTE_UNITS'
      FieldName = 'QTE_UNITS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 32
    end
    object ppDB85ppField34: TppField
      FieldAlias = #31867#22411
      FieldName = #31867#22411
      FieldLength = 8
      DisplayWidth = 8
      Position = 33
    end
    object ppDB85ppField35: TppField
      FieldAlias = #29366#24577
      FieldName = #29366#24577
      FieldLength = 6
      DisplayWidth = 6
      Position = 34
    end
    object ppDB85ppField36: TppField
      FieldAlias = #25253#20215#21333#20301
      FieldName = #25253#20215#21333#20301
      FieldLength = 3
      DisplayWidth = 3
      Position = 35
    end
    object ppDB85ppField37: TppField
      FieldAlias = #38144#21806#26041#24335
      FieldName = #38144#21806#26041#24335
      FieldLength = 4
      DisplayWidth = 4
      Position = 36
    end
    object ppDB85ppField38: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 37
    end
    object ppDB85ppField39: TppField
      Alignment = taRightJustify
      FieldAlias = 'unit_len'
      FieldName = 'unit_len'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 38
    end
    object ppDB85ppField40: TppField
      Alignment = taRightJustify
      FieldAlias = 'unit_wth'
      FieldName = 'unit_wth'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 39
    end
    object ppDB85ppField41: TppField
      Alignment = taRightJustify
      FieldAlias = 'TUNITS'
      FieldName = 'TUNITS'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 40
    end
    object ppDB85ppField42: TppField
      FieldAlias = 'APPRV_DATE'
      FieldName = 'APPRV_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 41
    end
    object ppDB85ppField43: TppField
      Alignment = taRightJustify
      FieldAlias = 'USHEET'
      FieldName = 'USHEET'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 9
      Position = 42
    end
    object ppDB85ppField44: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTE_USHEET'
      FieldName = 'QTE_USHEET'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 9
      Position = 43
    end
    object ppDB85ppField45: TppField
      FieldAlias = 'MATL_M2'
      FieldName = 'MATL_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 44
    end
    object ppDB85ppField46: TppField
      FieldAlias = 'BASE_M2'
      FieldName = 'BASE_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 45
    end
    object ppDB85ppField47: TppField
      FieldAlias = 'OVHD_M2'
      FieldName = 'OVHD_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 46
    end
    object ppDB85ppField48: TppField
      FieldAlias = 'TOTAL_M2'
      FieldName = 'TOTAL_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 47
    end
    object ppDB85ppField49: TppField
      FieldAlias = 'CRP_EST_M2'
      FieldName = 'CRP_EST_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 48
    end
    object ppDB85ppField50: TppField
      FieldAlias = 'COMM_M2'
      FieldName = 'COMM_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 49
    end
    object ppDB85ppField51: TppField
      FieldAlias = 'SHIPPING_M2'
      FieldName = 'SHIPPING_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 50
    end
    object ppDB85ppField52: TppField
      FieldAlias = 'QTE_M2'
      FieldName = 'QTE_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 51
    end
    object ppDB85ppField53: TppField
      FieldAlias = 'QUOTE_NOTAX_M2'
      FieldName = 'QUOTE_NOTAX_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 52
    end
    object ppDB85ppField54: TppField
      FieldAlias = 'QUOTE_TAX_M2'
      FieldName = 'QUOTE_TAX_M2'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 53
    end
    object ppDB85ppField55: TppField
      Alignment = taRightJustify
      FieldAlias = #27611#21033#29575
      FieldName = #27611#21033#29575
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 7
      Position = 54
    end
    object ppDB85ppField56: TppField
      Alignment = taRightJustify
      FieldAlias = #26368#23569#35746#21333#37327
      FieldName = #26368#23569#35746#21333#37327
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 55
    end
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppDB432
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = #20135#21697#25253#20215#26723#26696
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
    Template.FileName = 'D:\SJSYS\NIERP\REPORT\fastquote_report_FPC.rtm'
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
      object ppSystemVariable2: TppSystemVariable
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
      object ppLabel50: TppLabel
        UserName = 'Label19'
        Caption = #20135#21697#25253#20215#25104#26412#20998#26512#26723#26696#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5556
        mmLeft = 69586
        mmTop = 8996
        mmWidth = 55033
        BandType = 1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 108744
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 108744
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'TNUMBER'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 1588
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel51: TppLabel
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
      object ppLabel52: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 57679
        mmTop = 1588
        mmWidth = 16002
        BandType = 0
      end
      object ppLabel53: TppLabel
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
      object ppLabel54: TppLabel
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
      object ppLabel55: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 7408
        mmWidth = 19558
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'CUST_PART_NO'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 57679
        mmTop = 7408
        mmWidth = 21336
        BandType = 0
      end
      object ppDBText41: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CUST_PART_DESC'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
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
      object ppLabel56: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 1323
        mmWidth = 24892
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 7408
        mmWidth = 23114
        BandType = 0
      end
      object ppLabel57: TppLabel
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
      object ppLabel58: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 118798
        mmTop = 19579
        mmWidth = 7027
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'PRODUCT_NAME'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 118798
        mmTop = 13494
        mmWidth = 21336
        BandType = 0
      end
      object ppLabel59: TppLabel
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
        DataField = #25253#20215#21333#20301
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 57679
        mmTop = 19579
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel60: TppLabel
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
      object ppLabel61: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 13494
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel62: TppLabel
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
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
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 19050
        mmTop = 19579
        mmWidth = 10668
        BandType = 0
      end
      object ppLabel63: TppLabel
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
      object ppLabel64: TppLabel
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
      object ppLabel65: TppLabel
        UserName = 'Label18'
        Caption = #23454#38469#25253#20215':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 161967
        mmTop = 19579
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText50: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'QTE_DATE'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 13494
        mmWidth = 14224
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = 'quote_taxprice'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 178859
        mmTop = 19579
        mmWidth = 24892
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
        mmTop = 43921
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
        mmHeight = 51329
        mmLeft = 794
        mmTop = 48948
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
        mmHeight = 51329
        mmLeft = 56886
        mmTop = 48948
        mmWidth = 55827
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel66: TppLabel
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
        mmTop = 43921
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel67: TppLabel
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
        mmTop = 43921
        mmWidth = 3556
        BandType = 0
      end
      object ppLabel68: TppLabel
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
        mmTop = 103717
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel69: TppLabel
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
        mmTop = 103717
        mmWidth = 14023
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'Line20'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 2910
        mmLeft = 0
        mmTop = 102129
        mmWidth = 197300
        BandType = 0
      end
      object ppLine41: TppLine
        UserName = 'Line25'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 48154
        mmWidth = 112184
        BandType = 0
      end
      object ppLabel70: TppLabel
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
        mmTop = 43921
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel71: TppLabel
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
        mmTop = 43921
        mmWidth = 3440
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine42: TppLine
        UserName = 'Line19'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 184680
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText52: TppDBText
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
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 529
        mmWidth = 35454
        BandType = 4
      end
      object ppDBText53: TppDBText
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
        mmHeight = 3969
        mmLeft = 44979
        mmTop = 529
        mmWidth = 7144
        BandType = 4
      end
      object ppLine43: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 5292
        mmLeft = 0
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 37571
      mmPrintPosition = 0
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = True
        DataField = 'NOTE_INFO'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 19315
        mmLeft = 14023
        mmTop = 11906
        mmWidth = 179123
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel72: TppLabel
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
        mmTop = 11906
        mmWidth = 8467
        BandType = 8
      end
      object ppDBText54: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 12965
        mmTop = 32015
        mmWidth = 23114
        BandType = 8
      end
      object ppLabel73: TppLabel
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
        mmTop = 32015
        mmWidth = 8731
        BandType = 8
      end
      object ppLine44: TppLine
        UserName = 'Line21'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 12171
        mmTop = 36513
        mmWidth = 18256
        BandType = 8
      end
      object ppLabel74: TppLabel
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
        mmTop = 32015
        mmWidth = 15875
        BandType = 8
      end
      object ppLine45: TppLine
        UserName = 'Line22'
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 46831
        mmTop = 36513
        mmWidth = 33338
        BandType = 8
      end
      object ppLabel75: TppLabel
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
        mmTop = 32015
        mmWidth = 8731
        BandType = 8
      end
      object ppLine46: TppLine
        UserName = 'Line23'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 95250
        mmTop = 36513
        mmWidth = 20902
        BandType = 8
      end
      object ppLabel76: TppLabel
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
        mmTop = 32015
        mmWidth = 15875
        BandType = 8
      end
      object ppLine47: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 134673
        mmTop = 36513
        mmWidth = 19844
        BandType = 8
      end
      object ppDBText55: TppDBText
        UserName = 'DBText31'
        AutoSize = True
        DataField = 'APPRV_DATE'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 4022
        mmLeft = 46831
        mmTop = 32015
        mmWidth = 17780
        BandType = 8
      end
      object ppLine48: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 171450
        mmTop = 36513
        mmWidth = 21960
        BandType = 8
      end
      object ppLabel77: TppLabel
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
        mmTop = 32015
        mmWidth = 15875
        BandType = 8
      end
      object ppLabel78: TppLabel
        UserName = 'Label54'
        Caption = #25240#29575#22914#20302#20110#20844#21496#35268#23450#65292#36229#36234#26435#38480#65292#20973#27492#34920#20132#19978#21496#23457#25209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4445
        mmLeft = 1058
        mmTop = 6350
        mmWidth = 90551
        BandType = 8
      end
      object ppLabel79: TppLabel
        UserName = 'Label56'
        Caption = #27492#25253#20215#21333#20165#20379#20869#37096#20351#29992','#23646#20844#21496#26426#23494','#19981#24471#22806#20256#21542#21017#36861#31350#30456#20851#36131#20219
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4445
        mmLeft = 1058
        mmTop = 1058
        mmWidth = 110279
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 96309
      mmPrintPosition = 0
      object ppLabel80: TppLabel
        UserName = 'Label36'
        Caption = #20215#26684#20998#26512#19981#21547#31246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4022
        mmLeft = 2117
        mmTop = 3440
        mmWidth = 24892
        BandType = 7
      end
      object ppLine49: TppLine
        UserName = 'Line24'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 529
        mmTop = 8202
        mmWidth = 76200
        BandType = 7
      end
      object ppLabel81: TppLabel
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
      object ppLine50: TppLine
        UserName = 'Line26'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 16669
        mmWidth = 76200
        BandType = 7
      end
      object ppDBText56: TppDBText
        UserName = 'DBText32'
        AutoSize = True
        DataField = 'quote_taxprice'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3979
        mmLeft = 29369
        mmTop = 17992
        mmWidth = 24892
        BandType = 7
      end
      object ppLabel82: TppLabel
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
        mmLeft = 8996
        mmTop = 28046
        mmWidth = 15875
        BandType = 7
      end
      object ppDBText57: TppDBText
        UserName = 'DBText33'
        AutoSize = True
        DataField = 'CURR_NAME'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3979
        mmLeft = 29369
        mmTop = 28046
        mmWidth = 15875
        BandType = 7
      end
      object ppDBText58: TppDBText
        UserName = 'DBText34'
        AutoSize = True
        DataField = 'CURR_RATE'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3979
        mmLeft = 29369
        mmTop = 32808
        mmWidth = 15875
        BandType = 7
      end
      object ppLabel83: TppLabel
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
        mmLeft = 15875
        mmTop = 32808
        mmWidth = 8731
        BandType = 7
      end
      object ppLabel84: TppLabel
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
        mmLeft = 11113
        mmTop = 23019
        mmWidth = 14023
        BandType = 7
      end
      object ppDBText59: TppDBText
        UserName = 'DBText35'
        AutoSize = True
        DataField = 'vatax'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3979
        mmLeft = 29369
        mmTop = 23019
        mmWidth = 9017
        BandType = 7
      end
      object ppLabel85: TppLabel
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
      object ppLabel86: TppLabel
        UserName = 'Label47'
        Caption = #25253#20215#21547#31246#21407#24065':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 17992
        mmWidth = 22754
        BandType = 7
      end
      object ppDBMemo4: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'rej_info'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #26032#23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 86254
        mmLeft = 80698
        mmTop = 8467
        mmWidth = 114829
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel87: TppLabel
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
      object ppLabel88: TppLabel
        UserName = 'Label1'
        Caption = #25253#20215'('#26412#20301#24065'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 11906
        mmWidth = 23019
        BandType = 7
      end
      object ppDBText60: TppDBText
        UserName = 'DBText301'
        AutoSize = True
        DataField = 'QTE_UNITS'
        DataPipeline = ppDB85
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB85'
        mmHeight = 3979
        mmLeft = 29104
        mmTop = 11906
        mmWidth = 15875
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
  object ppDB253: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    UserName = 'DB253'
    Left = 160
    Top = 88
    MasterDataPipelineName = 'ppDB85'
    object ppDB253ppField1: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField2: TppField
      FieldAlias = 'INV_PART_DESCRIPTION'
      FieldName = 'INV_PART_DESCRIPTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField3: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField4: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField5: TppField
      FieldAlias = 'price'
      FieldName = 'price'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField6: TppField
      FieldAlias = 'QTY'
      FieldName = 'QTY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField7: TppField
      FieldAlias = 'pcs_cost'
      FieldName = 'pcs_cost'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField8: TppField
      FieldAlias = 'QTY_BOM'
      FieldName = 'QTY_BOM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB253ppField9: TppField
      FieldAlias = 'METAL'
      FieldName = 'METAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ADS061: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0061.RKEY, dbo.Data0061.CATEGORY, dbo.Data043' +
      '2.AMOUNT, dbo.Data0432.FREE_AMOUNT, dbo.Data0432.TAX_FLAG,dbo.Da' +
      'ta0432.Mould_set'#13#10'FROM         dbo.Data0432 INNER JOIN'#13#10'        ' +
      '              dbo.Data0061 ON dbo.Data0432.ADDL_CAT_PTR = dbo.Da' +
      'ta0061.RKEY '#13#10'WHERE (dbo.Data0432.QTE_PTR = :rkey) AND ((dbo.Dat' +
      'a0432.Mould_set <> 0 ) AND (dbo.Data0432.Mould_set IS NOT NULL )' +
      ' )'#13#10
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 80
    Top = 268
    object ADS061rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADS061CATEGORY: TStringField
      FieldName = 'CATEGORY'
    end
    object ADS061AMOUNT: TFloatField
      FieldName = 'AMOUNT'
    end
    object ADS061FREE_AMOUNT: TFloatField
      FieldName = 'FREE_AMOUNT'
    end
    object ADS061TAX_FLAG: TStringField
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object ADS061Mould_set: TFloatField
      FieldName = 'Mould_set'
    end
  end
  object DataSource8: TDataSource
    DataSet = ADS061
    Left = 112
    Top = 268
  end
  object ppDB061: TppDBPipeline
    DataSource = DataSource8
    UserName = 'DB061'
    Left = 158
    Top = 268
    object ppDB061ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDB061ppField2: TppField
      FieldAlias = 'CATEGORY'
      FieldName = 'CATEGORY'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppDB061ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'AMOUNT'
      FieldName = 'AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDB061ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'FREE_AMOUNT'
      FieldName = 'FREE_AMOUNT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDB061ppField5: TppField
      FieldAlias = 'TAX_FLAG'
      FieldName = 'TAX_FLAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppDB061ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'Mould_set'
      FieldName = 'Mould_set'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object ADS8501: TADODataSet
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT   D0085_Ptr, Cost_Name, Cost, Total_Cost, Flag_tax'#13#10'FROM ' +
      '        dbo.Data008501'#13#10
    DataSource = DataSource1
    IndexFieldNames = 'D0085_Ptr'
    MasterFields = 'rkey'
    Parameters = <>
    Left = 80
    Top = 312
    object ADS8501D0085_Ptr: TIntegerField
      FieldName = 'D0085_Ptr'
    end
    object ADS8501Cost_Name: TStringField
      FieldName = 'Cost_Name'
      Size = 50
    end
    object ADS8501Cost: TFloatField
      FieldName = 'Cost'
    end
    object ADS8501Total_Cost: TFloatField
      FieldName = 'Total_Cost'
    end
    object ADS8501Flag_tax: TStringField
      FieldName = 'Flag_tax'
      FixedChar = True
      Size = 1
    end
  end
  object DataSource9: TDataSource
    DataSet = ADS8501
    Left = 112
    Top = 312
  end
  object ppDB8501: TppDBPipeline
    DataSource = DataSource9
    UserName = 'DB8501'
    Left = 160
    Top = 312
    MasterDataPipelineName = 'ppDB85'
    object ppDBPipeline1ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'D0085_Ptr'
      FieldName = 'D0085_Ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'Cost_Name'
      FieldName = 'Cost_Name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'Cost'
      FieldName = 'Cost'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'Total_Cost'
      FieldName = 'Total_Cost'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'Flag_tax'
      FieldName = 'Flag_tax'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
  end
end
