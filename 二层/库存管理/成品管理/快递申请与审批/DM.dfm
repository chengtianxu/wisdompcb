object dm1: Tdm1
  OldCreateOrder = False
  Left = 1166
  Top = 333
  Height = 375
  Width = 381
  object con1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 48
    Top = 48
  end
  object qrytmp: TADOQuery
    Connection = con1
    Parameters = <>
    Left = 152
    Top = 40
  end
  object cmd1: TADOCommand
    Connection = con1
    Parameters = <>
    Left = 152
    Top = 96
  end
  object prprt1: TppReport
    AutoStop = False
    DataPipeline = ppDBPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 1000
    PrinterSetup.mmMarginLeft = 1000
    PrinterSetup.mmMarginRight = 1000
    PrinterSetup.mmMarginTop = 1000
    PrinterSetup.mmPaperHeight = 125000
    PrinterSetup.mmPaperWidth = 230000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\sjsys\NIERP\Report\KYRpt.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 224
    Top = 232
    Version = '7.01'
    mmColumnWidth = 217300
    DataPipelineName = 'ppDBPipeline1'
    object phdrbnd1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object pdtlbnd1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 122502
      mmPrintPosition = 0
      object pdbtxt1: TppDBText
        UserName = 'pdbtxt1'
        DataField = #21457#20214#20154
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 10848
        mmTop = 6879
        mmWidth = 17198
        BandType = 4
      end
      object pdbtxt2: TppDBText
        UserName = 'pdbtxt2'
        DataField = #21457#20214#20154#30005#35805
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 11377
        mmTop = 15081
        mmWidth = 17198
        BandType = 4
      end
      object pdbtxt3: TppDBText
        UserName = 'pdbtxt3'
        DataField = #20851#32852#36134#21495
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 22754
        mmWidth = 17198
        BandType = 4
      end
      object pdbtxt4: TppDBText
        UserName = 'pdbtxt4'
        DataField = #20869#32622#29289#21697
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 3969
        mmLeft = 11642
        mmTop = 30427
        mmWidth = 17198
        BandType = 4
      end
      object pdbtxt5: TppDBText
        UserName = 'pdbtxt5'
        DataField = #25910#36135#20154
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 78581
        mmTop = 9790
        mmWidth = 17198
        BandType = 4
      end
      object pdbtxt6: TppDBText
        UserName = 'pdbtxt6'
        DataField = #25910#36135#30005#35805
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 80169
        mmTop = 18785
        mmWidth = 17198
        BandType = 4
      end
      object pdbtxt7: TppDBText
        UserName = 'pdbtxt7'
        DataField = #25910#36135#22320#22336
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 80698
        mmTop = 29633
        mmWidth = 17198
        BandType = 4
      end
      object pdbtxt8: TppDBText
        UserName = 'pdbtxt8'
        DataField = #36816#36153#26041#24335
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 78581
        mmTop = 42069
        mmWidth = 17198
        BandType = 4
      end
      object pdbtxt9: TppDBText
        UserName = 'pdbtxt9'
        DataField = #24555#36882#20844#21496
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 78317
        mmTop = 60854
        mmWidth = 17198
        BandType = 4
      end
      object pdbtxt10: TppDBText
        UserName = 'pdbtxt10'
        DataField = #21019#24314#26102#38388
        DataPipeline = ppDBPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipeline1'
        mmHeight = 4064
        mmLeft = 35983
        mmTop = 65088
        mmWidth = 17198
        BandType = 4
      end
    end
    object pftrbnd1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
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
    Report = prprt1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 272
    Top = 232
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = dsrpt
    UserName = 'DBPipeline1'
    Left = 183
    Top = 228
  end
  object adsRpt: TADODataSet
    Connection = con1
    CursorType = ctStatic
    OnCalcFields = adsRptCalcFields
    CommandText = 
      'SELECT d05.EMPLOYEE_NAME as '#21457#20214#20154','#13#10'd05.PHONE as '#21457#20214#20154#30005#35805','#13#10'd817.Bill' +
      'NO as '#24555#36882#21333#21495','#13#10'd817.CTime as '#21019#24314#26102#38388','#13#10'd817.CustName as '#23458#25143#21517#31216','#13#10'd817.T' +
      'oUser as '#25910#36135#20154','#13#10'd817.ToAddress as '#25910#36135#22320#22336','#13#10'd817.ToPhone as '#25910#36135#30005#35805','#13#10'd' +
      '818.RegCode as '#20851#32852#36134#21495','#13#10'd818.TranEasyName as '#24555#36882#20844#21496','#13#10'd817.Items as ' +
      #20869#32622#29289#21697','#13#10'case d817.PayType when 0 THEN '#39#23492#20184#39' WHEN 1 THEN '#39#21040#20184#39' END a' +
      's '#36816#36153#26041#24335#13#10'FROM Data0005 d05'#13#10'inner JOIN data0817 d817 ON d817.CUse' +
      'r = d05.RKEY'#13#10'INNER JOIN data0818 d818 ON d818.TranCode = d817.T' +
      'ranCode'#13#10'where d817.BillNO = :p1'
    Parameters = <
      item
        Name = 'p1'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    Left = 96
    Top = 227
    object adsRptDSDesigner: TStringField
      FieldName = #21457#20214#20154
      Size = 16
    end
    object adsRptDSDesigner2: TStringField
      FieldName = #21457#20214#20154#30005#35805
      Size = 14
    end
    object adsRptDSDesigner3: TStringField
      FieldName = #24555#36882#21333#21495
      Size = 50
    end
    object adsRptDSDesigner4: TDateTimeField
      FieldName = #21019#24314#26102#38388
    end
    object adsRptDSDesigner5: TStringField
      FieldName = #25910#36135#20154
      Size = 50
    end
    object adsRptDSDesigner6: TStringField
      FieldName = #25910#36135#22320#22336
      Size = 1000
    end
    object adsRptDSDesigner7: TStringField
      FieldName = #25910#36135#30005#35805
      Size = 100
    end
    object adsRptDSDesigner8: TStringField
      FieldName = #20851#32852#36134#21495
      Size = 150
    end
    object adsRptDSDesigner9: TStringField
      FieldName = #24555#36882#20844#21496
      Size = 250
    end
    object adsRptDSDesigner10: TStringField
      FieldName = #20869#32622#29289#21697
      Size = 255
    end
    object adsRptDSDesigner11: TStringField
      FieldName = #36816#36153#26041#24335
      ReadOnly = True
      Size = 4
    end
    object adsRptDSDesigner12: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 250
    end
    object adsRptField: TStringField
      FieldKind = fkCalculated
      FieldName = #24037#21378
      Calculated = True
    end
    object adsRptField2: TStringField
      FieldKind = fkCalculated
      FieldName = #24037#21378#22320#22336
      Calculated = True
    end
  end
  object dsrpt: TDataSource
    DataSet = adsRpt
    Left = 136
    Top = 232
  end
end
