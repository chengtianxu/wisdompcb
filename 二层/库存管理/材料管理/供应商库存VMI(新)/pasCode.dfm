object frmCode: TfrmCode
  Left = 647
  Top = 411
  Width = 261
  Height = 153
  Caption = 'frmCode'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppReportCode: TppReport
    AutoStop = False
    DataPipeline = ppDBPipelineCode
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 30000
    PrinterSetup.mmPaperWidth = 70000
    PrinterSetup.PaperSize = 119
    SaveAsTemplate = True
    Template.FileName = '..\NIERP\Report\IQCCode.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 152
    Top = 48
    Version = '7.01'
    mmColumnWidth = 57300
    DataPipelineName = 'ppDBPipelineCode'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel237: TppLabel
        UserName = 'Label237'
        Caption = #26448#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 7938
        mmTop = 1058
        mmWidth = 9991
        BandType = 4
      end
      object ppLabel241: TppLabel
        UserName = 'Label241'
        Caption = #21046#36896#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 7938
        mmTop = 15610
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText67'
        DataField = #21046#36896#26085#26399
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 15610
        mmWidth = 12435
        BandType = 4
      end
      object ppLabel242: TppLabel
        UserName = 'Label242'
        Caption = #26448#26009#25551#36848
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2963
        mmLeft = 7938
        mmTop = 4498
        mmWidth = 10499
        BandType = 4
      end
      object ppLabel239: TppLabel
        UserName = 'Label239'
        Caption = #25209#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 12965
        mmTop = 11906
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'DBText65'
        DataField = #25209#21495
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 11906
        mmWidth = 45773
        BandType = 4
      end
      object ppLabel238: TppLabel
        UserName = 'Label238'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 33602
        mmTop = 19315
        mmWidth = 5027
        BandType = 4
      end
      object ppLabel240: TppLabel
        UserName = 'Label240'
        Caption = #26377#25928#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 10583
        mmTop = 19315
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = #26469#26009#25968#37327
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 40217
        mmTop = 19315
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText66: TppDBText
        UserName = 'DBText66'
        DataField = #26377#25928#26399
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 19579
        mmTop = 19315
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'DBText63'
        DataField = #26448#26009#32534#30721
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2879
        mmLeft = 19579
        mmTop = 1058
        mmWidth = 46038
        BandType = 4
      end
      object ppLabel244: TppLabel
        UserName = 'Label244'
        Caption = #26465#30721#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 7673
        mmTop = 23019
        mmWidth = 10583
        BandType = 4
      end
      object ppDBText71: TppDBText
        UserName = 'DBText71'
        DataField = #26465#30721#32534#21495
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 19315
        mmTop = 23019
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel245: TppLabel
        UserName = 'Label245'
        Caption = #20379#24212#21830
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 33602
        mmTop = 15610
        mmWidth = 7493
        BandType = 4
      end
      object ppDBText72: TppDBText
        UserName = 'DBText72'
        DataField = #20379#24212#21830#31616#31216
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 42333
        mmTop = 15610
        mmWidth = 8467
        BandType = 4
      end
      object ppLabel246: TppLabel
        UserName = 'Label246'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 33602
        mmTop = 23019
        mmWidth = 4995
        BandType = 4
      end
      object ppDBText70: TppDBText
        UserName = 'DBText70'
        DataField = #21333#20301
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 2910
        mmLeft = 40746
        mmTop = 23019
        mmWidth = 10054
        BandType = 4
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        mmHeight = 11377
        mmLeft = 52123
        mmTop = 15346
        mmWidth = 12965
        BandType = 4
      end
      object ppDBMemo16: TppDBMemo
        UserName = 'DBMemo16'
        CharWrap = False
        DataField = #26448#26009#25551#36848
        DataPipeline = ppDBPipelineCode
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPipelineCode'
        mmHeight = 6879
        mmLeft = 19579
        mmTop = 4498
        mmWidth = 45773
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppDBPipelineCode: TppDBPipeline
    DataSource = dsCode
    UserName = 'DBPipelineCode'
    Left = 104
    Top = 48
    object ppDBPipelineCodeppField2: TppField
      FieldAlias = #26448#26009#32534#30721
      FieldName = #26448#26009#32534#30721
      FieldLength = 25
      DisplayWidth = 25
      Position = 0
    end
    object ppDBPipelineCodeppField3: TppField
      FieldAlias = #26448#26009#35268#26684
      FieldName = #26448#26009#35268#26684
      FieldLength = 70
      DisplayWidth = 70
      Position = 1
    end
    object ppDBPipelineCodeppField4: TppField
      FieldAlias = #26377#25928#26399
      FieldName = #26377#25928#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppDBPipelineCodeppField5: TppField
      FieldAlias = 'IQC'#32534#21495
      FieldName = 'IQC'#32534#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipelineCodeppField6: TppField
      FieldAlias = #37319#36141#21333#21495
      FieldName = #37319#36141#21333#21495
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppDBPipelineCodeppField7: TppField
      FieldAlias = #21333#20301
      FieldName = #21333#20301
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppDBPipelineCodeppField8: TppField
      FieldAlias = #35831#36141#21407#22240
      FieldName = #35831#36141#21407#22240
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object ppDBPipelineCodeppField9: TppField
      FieldAlias = #26448#26009#21517#31216
      FieldName = #26448#26009#21517#31216
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object ppDBPipelineCodeppField10: TppField
      FieldAlias = #20379#24212#21830#20195#30721
      FieldName = #20379#24212#21830#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDBPipelineCodeppField11: TppField
      FieldAlias = #20379#24212#21830#31616#31216
      FieldName = #20379#24212#21830#31616#31216
      FieldLength = 16
      DisplayWidth = 16
      Position = 9
    end
    object ppDBPipelineCodeppField12: TppField
      FieldAlias = #20379#24212#21830#22411#21495
      FieldName = #20379#24212#21830#22411#21495
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object ppDBPipelineCodeppField13: TppField
      FieldAlias = 'SGS'#32534#21495
      FieldName = 'SGS'#32534#21495
      FieldLength = 25
      DisplayWidth = 25
      Position = 11
    end
    object ppDBPipelineCodeppField14: TppField
      FieldAlias = 'SGS'#26085#26399
      FieldName = 'SGS'#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppDBPipelineCodeppField15: TppField
      Alignment = taRightJustify
      FieldAlias = #26469#26009#25968#37327
      FieldName = #26469#26009#25968#37327
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 14
      Position = 13
    end
    object ppDBPipelineCodeppField16: TppField
      Alignment = taRightJustify
      FieldAlias = #26816#26597#25968#37327
      FieldName = #26816#26597#25968#37327
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 14
      Position = 14
    end
    object ppDBPipelineCodeppField17: TppField
      FieldAlias = #25209#21495
      FieldName = #25209#21495
      FieldLength = 100
      DisplayWidth = 100
      Position = 15
    end
    object ppDBPipelineCodeppField18: TppField
      FieldAlias = #21046#36896#26085#26399
      FieldName = #21046#36896#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object ppDBPipelineCodeppField19: TppField
      FieldAlias = 'IQC'#26816#26597#26085#26399
      FieldName = 'IQC'#26816#26597#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 17
    end
    object ppDBPipelineCodeppField20: TppField
      FieldAlias = 'IQC'#23457#26680#26085#26399
      FieldName = 'IQC'#23457#26680#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 18
    end
    object ppDBPipelineCodeppField21: TppField
      FieldAlias = #26159#21542#26080#21348#32032
      FieldName = #26159#21542#26080#21348#32032
      FieldLength = 2
      DisplayWidth = 2
      Position = 19
    end
    object ppDBPipelineCodeppField22: TppField
      FieldAlias = #22806#35266
      FieldName = #22806#35266
      FieldLength = 100
      DisplayWidth = 100
      Position = 20
    end
    object ppDBPipelineCodeppField23: TppField
      FieldAlias = #20135#21697#23610#23544
      FieldName = #20135#21697#23610#23544
      FieldLength = 16
      DisplayWidth = 16
      Position = 21
    end
    object ppDBPipelineCodeppField24: TppField
      FieldAlias = #26495#26009#21402#24230
      FieldName = #26495#26009#21402#24230
      FieldLength = 50
      DisplayWidth = 50
      Position = 22
    end
    object ppDBPipelineCodeppField25: TppField
      Alignment = taRightJustify
      FieldAlias = #38108#31636#21402#24230
      FieldName = #38108#31636#21402#24230
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 6
      Position = 23
    end
    object ppDBPipelineCodeppField26: TppField
      FieldAlias = #26159#21542#21547#38108
      FieldName = #26159#21542#21547#38108
      FieldLength = 20
      DisplayWidth = 20
      Position = 24
    end
    object ppDBPipelineCodeppField27: TppField
      FieldAlias = #26159#21542#31526#21512#26631#20934
      FieldName = #26159#21542#31526#21512#26631#20934
      FieldLength = 4
      DisplayWidth = 4
      Position = 25
    end
    object ppDBPipelineCodeppField28: TppField
      FieldAlias = #21028#23450#32467#26524
      FieldName = #21028#23450#32467#26524
      FieldLength = 8
      DisplayWidth = 8
      Position = 26
    end
    object ppDBPipelineCodeppField29: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 100
      DisplayWidth = 100
      Position = 27
    end
    object ppDBPipelineCodeppField30: TppField
      FieldAlias = #26159#21542'CAF'
      FieldName = #26159#21542'CAF'
      FieldLength = 2
      DisplayWidth = 2
      Position = 28
    end
    object ppDBPipelineCodeppField32: TppField
      FieldAlias = #21402#24230#20844#24046
      FieldName = #21402#24230#20844#24046
      FieldLength = 15
      DisplayWidth = 15
      Position = 29
    end
    object ppDBPipelineCodeppField1: TppField
      FieldAlias = #26465#30721#32534#21495
      FieldName = #26465#30721#32534#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
    end
    object ppDBPipelineCodeppField31: TppField
      FieldAlias = #26448#26009#25551#36848
      FieldName = #26448#26009#25551#36848
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object ppDBPipelineCodeppField33: TppField
      FieldAlias = #21517#31216#22411#21495
      FieldName = #21517#31216#22411#21495
      FieldLength = 10
      DisplayWidth = 10
      Position = 32
    end
  end
  object dsCode: TDataSource
    DataSet = qryCode
    Left = 56
    Top = 48
  end
  object qryCode: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey391'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 53094
      end>
    SQL.Strings = (
      
        'SELECT dbo.data0391.rkey as '#26465#30721#32534#21495',dbo.Data0017.INV_PART_NUMBER as' +
        ' '#26448#26009#32534#30721
      ',dbo.data0391.iqc_number AS IQC'#32534#21495
      
        ',dbo.Data0070.PO_NUMBER AS '#37319#36141#21333#21495',dbo.data0002.unit_name AS '#21333#20301',dbo' +
        '.data0071.reason AS '#35831#36141#21407#22240',dbo.Data0017.INV_NAME AS '#26448#26009#21517#31216
      ',dbo.Data0017.INV_PART_DESCRIPTION AS '#26448#26009#25551#36848
      
        ',dbo.Data0017.INV_DESCRIPTION AS '#26448#26009#35268#26684', dbo.Data0023.CODE AS '#20379#24212#21830#20195 +
        #30721', dbo.Data0023.ABBR_NAME AS '#20379#24212#21830#31616#31216
      
        ',dbo.data0391.supplier_model AS '#20379#24212#21830#22411#21495', dbo.Data0017.INV_NAME + '#39 +
        ' '#39' + dbo.data0391.supplier_model AS '#21517#31216#22411#21495
      
        ',dbo.data0391.sgs_no AS SGS'#32534#21495',dbo.data0391.sgs_date AS SGS'#26085#26399', db' +
        'o.data0391.rece_qty AS '#26469#26009#25968#37327
      ',dbo.data0391.iqc_qty AS '#26816#26597#25968#37327', dbo.data0391.barch_no AS '#25209#21495
      ',dbo.data0391.manufacture_TDATE AS '#21046#36896#26085#26399
      
        ',dbo.data0391.appr_date AS IQC'#26816#26597#26085#26399',dbo.data0391.auth_date AS IQC' +
        #23457#26680#26085#26399
      
        ',case data0391.if_halogen when 1 then '#39#26159#39' else '#39#21542#39' end as '#26159#21542#26080#21348#32032',' +
        'dbo.data0391.appearance AS '#22806#35266
      
        ',dbo.data0391.part_size AS '#20135#21697#23610#23544', dbo.data0391.part_thickness AS ' +
        #26495#26009#21402#24230', dbo.data0391.tong_thickness '#38108#31636#21402#24230
      
        ',dbo.data0391.thick_tolerance AS '#21402#24230#20844#24046', dbo.data0391.ht_remark '#26159#21542 +
        #21547#38108
      
        ',dbo.data0391.if_standard AS '#26159#21542#31526#21512#26631#20934', dbo.data0391.extrl_date AS ' +
        #26377#25928#26399', dbo.data0391.judge_result AS '#21028#23450#32467#26524
      ', dbo.data0391.remark AS '#22791#27880
      ',dbo.Data0071.IF_CAF AS '#26159#21542'CAF'#9
      'FROM  dbo.DATA0391 '
      
        #9'INNER JOIN dbo.Data0071 on dbo.DATA0391.rkey71 = dbo.Data0071.R' +
        'KEY'
      
        #9'INNER join dbo.Data0017 on dbo.DATA0391.rkey17 =  dbo.Data0017.' +
        'RKEY '
      
        #9'INNER JOIN dbo.Data0070 ON dbo.Data0071.PO_PTR = dbo.Data0070.R' +
        'KEY'
      
        '                INNER JOIN dbo.Data0002 ON dbo.data0071.purchase' +
        '_unit_ptr = dbo.Data0002.RKEY'
      
        '               INNER JOIN dbo.Data0023 ON dbo.Data0070.SUPPLIER_' +
        'POINTER = dbo.Data0023.RKEY'
      'WHERE data0391.rkey =  :rkey391'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 16
    Top = 48
    object qryCodeDSDesigner2: TStringField
      FieldName = #26448#26009#32534#30721
      Size = 25
    end
    object qryCodeDSDesigner3: TStringField
      FieldName = #26448#26009#35268#26684
      Size = 70
    end
    object qryCodeDSDesigner4: TDateTimeField
      FieldName = #26377#25928#26399
    end
    object qryCodeIQC: TStringField
      FieldName = 'IQC'#32534#21495
      Size = 10
    end
    object qryCodeDSDesigner5: TStringField
      FieldName = #37319#36141#21333#21495
      Size = 15
    end
    object qryCodeDSDesigner6: TStringField
      FieldName = #21333#20301
    end
    object qryCodeDSDesigner7: TStringField
      FieldName = #35831#36141#21407#22240
      Size = 60
    end
    object qryCodeDSDesigner8: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 30
    end
    object qryCodeDSDesigner9: TStringField
      FieldName = #20379#24212#21830#20195#30721
      Size = 10
    end
    object qryCodeDSDesigner10: TStringField
      FieldName = #20379#24212#21830#31616#31216
      Size = 16
    end
    object qryCodeDSDesigner11: TStringField
      FieldName = #20379#24212#21830#22411#21495
    end
    object qryCodeSGS: TStringField
      FieldName = 'SGS'#32534#21495
      Size = 25
    end
    object qryCodeSGS2: TDateTimeField
      FieldName = 'SGS'#26085#26399
    end
    object qryCodeDSDesigner12: TBCDField
      FieldName = #26469#26009#25968#37327
      Precision = 13
    end
    object qryCodeDSDesigner13: TBCDField
      FieldName = #26816#26597#25968#37327
      Precision = 13
    end
    object qryCodeDSDesigner14: TStringField
      FieldName = #25209#21495
      Size = 100
    end
    object qryCodeDSDesigner15: TDateTimeField
      FieldName = #21046#36896#26085#26399
    end
    object qryCodeIQC2: TDateTimeField
      FieldName = 'IQC'#26816#26597#26085#26399
    end
    object qryCodeIQC3: TDateTimeField
      FieldName = 'IQC'#23457#26680#26085#26399
    end
    object qryCodeDSDesigner16: TStringField
      FieldName = #26159#21542#26080#21348#32032
      ReadOnly = True
      Size = 2
    end
    object qryCodeDSDesigner17: TWideStringField
      FieldName = #22806#35266
      Size = 100
    end
    object qryCodeDSDesigner18: TStringField
      FieldName = #20135#21697#23610#23544
      Size = 16
    end
    object qryCodeDSDesigner19: TStringField
      FieldName = #26495#26009#21402#24230
      Size = 50
    end
    object qryCodeDSDesigner20: TBCDField
      FieldName = #38108#31636#21402#24230
      Precision = 5
      Size = 2
    end
    object qryCodeDSDesigner22: TWideStringField
      FieldName = #26159#21542#21547#38108
    end
    object qryCodeDSDesigner23: TWideStringField
      FieldName = #26159#21542#31526#21512#26631#20934
      Size = 4
    end
    object qryCodeDSDesigner24: TWideStringField
      FieldName = #21028#23450#32467#26524
      Size = 8
    end
    object qryCodeDSDesigner25: TStringField
      FieldName = #22791#27880
      Size = 100
    end
    object qryCodeCAF: TWideStringField
      FieldName = #26159#21542'CAF'
      FixedChar = True
      Size = 2
    end
    object qryCodeDSDesigner21: TStringField
      FieldName = #21402#24230#20844#24046
      Size = 15
    end
    object qryCodeDSDesigner: TAutoIncField
      FieldName = #26465#30721#32534#21495
      ReadOnly = True
    end
    object qryCodeDSDesigner26: TStringField
      FieldName = #26448#26009#25551#36848
      ReadOnly = True
      Size = 100
    end
    object qryCodeDSDesigner27: TStringField
      FieldName = #21517#31216#22411#21495
      ReadOnly = True
      Size = 51
    end
  end
  object ppDesignerCode: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.CollationType = ctASCII
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = ppReportCode
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    Left = 192
    Top = 48
  end
end
