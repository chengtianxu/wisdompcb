object Form_report: TForm_report
  Left = 373
  Top = 215
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#34920#25968#25454#23450#20041
  ClientHeight = 234
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = ADS25
    Left = 128
    Top = 48
  end
  object ADS25: TADODataSet
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0025.RKEY, Data0025.MANU_PART_NUMBER as '#26412#21378#32534#21495', '#13#10'     ' +
      ' Data0025.MANU_PART_DESC as '#23458#25143#22411#21495',Data0010.CUST_CODE AS '#23458#25143#20195#30721', '#13#10' ' +
      '     Data0010.CUSTOMER_NAME AS '#23458#25143#21517#31216', Data0010.ABBR_NAME AS '#23458#25143#31616#31216',' +
      ' '#13#10'      Data0008.PROD_CODE AS '#31867#22411#20195#30721', Data0008.PRODUCT_NAME AS '#31867#22411 +
      #21517#31216', '#13#10'      Data0005_3.EMPLOYEE_NAME AS '#26816#26597#20154#21592', Data0025.CHECK_DAT' +
      'E AS '#26816#26597#26085#26399', '#13#10'      Data0005_1.EMPLOYEE_NAME AS '#23457#26680#20154#21592',Data0025.AUD' +
      'ITED_DATE AS '#23457#26680#26085#26399', '#13#10'      Data0005_2.EMPLOYEE_NAME AS '#20462#35746#20154#21592',Data' +
      '0025.LAST_MODIFIED_DATE AS '#20462#35746#26085#26399','#13#10'     Data0025.SAMPLE_NR AS '#26679#26495#32534 +
      #21495',Data0025.ANALYSIS_CODE_2 AS '#23458#25143#29289#26009#21495', '#13#10'Data0025.LAYERS AS '#23618#25968',Dat' +
      'a0025.ANALYSIS_CODE_1 AS '#20132#36135#23610#23544'SET, '#13#10'Data0025.ANALYSIS_CODE_5 AS ' +
      #21333#21482#23610#23544'PCS, Data0025.ANALYSIS_CODE_4 AS '#25340#29256#23610#23544'SPEL, '#13#10'Data0025.pcs_sq' +
      ' AS '#21333#21482#38754#31215'PCS, Data0025.unit_sq AS '#21333#21482#38754#31215'SET, '#13#10'     Data0025.spell_' +
      'sq AS '#21333#21482#38754#31215'SPEL, Data0025.layers_info AS '#23618#21387#32467#26500','#13#10'Data0025.REMARK a' +
      's '#21152#24037#25351#31034',Data0025.ENG_NOTE as '#24037#31243#22791#27880', '#13#10'Data0025.EST_SCRAP as '#25253#24223#29575' , ' +
      'Data0025.SHELF_LIFE as '#29983#20135#21608#26399', '#13#10'      Data0025.REVIEW_DAYS as '#26377#25928#26399 +
      #22825#25968', Data0025.MFG_LEAD_TIME as '#21046#36896#25552#21069#26399', '#13#10'      Data0025.ANALYSIS_C' +
      'ODE_3 as '#22823#26009#35268#26684', Data0025.REPORT_UNIT_VALUE1 AS '#21333#21482#37325#37327'g, '#13#10'      dbo' +
      '.Data0025.OPT_LOT_SIZE as '#27969#36716#25209#37327', data0025.BARCODE_FLAG,'#13#10'case Dat' +
      'a0025.ONHOLD_SALES_FLAG when 0 then '#39#26377#25928#39' when 1 then '#39#36807#26399#39' end as' +
      ' '#38144#21806#29366#24577', '#13#10'case Data0025.TSTATUS'#13#10'   when 0 then '#39#24453#21046#20316#39' when 1 then' +
      ' '#39#24050#23457#26680#39' when 2 then '#39#23457#36864#22238#39' when 3 then '#39#24453#26816#26597#39#13#10'   when 4 then '#39#24453#23457#26680#39 +
      ' when 5 then '#39#26816#36864#22238#39' when 6 then '#39#26410#25552#20132#39' end as '#23457#25209#29366#24577','#13#10'case   Data00' +
      '25.ttype  when 0 then '#39#37327#20135#39' when 1 then '#39#26679#26495#39'  end as '#37327#20135#26679#26495','#13#10'case ' +
      'Data0025.green_flag when '#39'Y'#39' then '#39'RoHS'#39'  else '#39#38750'RoHS'#39' end as '#29615#20445 +
      #26631#35782','#13#10'case when data0025.PARENT_PTR is null then '#39#22806#23618#39' ELSE '#39#20869#23618#39' e' +
      'nd as  '#20135#21697#24615#36136','#13#10'case when ltrim(data0025.CURRENT_REV)='#39'Y'#39' then '#39#26080#21348 +
      #32032#39' else '#39#21348#32032#39' end as '#21348#32032#35201#27714','#13#10'cast(data0025.qty_bom as varchar) +'#39':' +
      #39'+cast(qty_parentbom as varchar) as '#25237#20135#27604#20363','#13#10'data0025.qty_bom as '#25237 +
      #20135#27604#20363#20998#23376',data0025.qty_parentbom as '#25237#20135#27604#20363#20998#27597#13#10'FROM dbo.Data0008 INNER ' +
      'JOIN'#13#10'      dbo.Data0025 ON '#13#10'      dbo.Data0008.RKEY = dbo.Data' +
      '0025.PROD_CODE_PTR INNER JOIN'#13#10'      dbo.Data0010 ON '#13#10'      dbo' +
      '.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN'#13#10'    ' +
      '  dbo.Data0005 Data0005_3 ON '#13#10'      dbo.Data0025.CHECK_BY_PTR =' +
      ' Data0005_3.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_2 ' +
      'ON '#13#10'      dbo.Data0025.LAST_MODIFIED_BY_PTR = Data0005_2.RKEY L' +
      'EFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON dbo.Data0025.AU' +
      'DITED_BY_PTR = Data0005_1.RKEY'#13#10'where data0025.rkey=:BOM_PTR'
    DataSource = DataSource3
    MasterFields = 'bom_ptr'
    Parameters = <
      item
        Name = 'bom_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 97
    Top = 48
    object ADS25RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADS25DSDesigner: TStringField
      FieldName = #26412#21378#32534#21495
    end
    object ADS25DSDesigner2: TStringField
      FieldName = #23458#25143#22411#21495
      Size = 40
    end
    object ADS25DSDesigner3: TStringField
      FieldName = #23458#25143#20195#30721
      Size = 10
    end
    object ADS25DSDesigner4: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 100
    end
    object ADS25DSDesigner5: TStringField
      FieldName = #23458#25143#31616#31216
      Size = 10
    end
    object ADS25DSDesigner6: TStringField
      FieldName = #31867#22411#20195#30721
      Size = 10
    end
    object ADS25DSDesigner7: TStringField
      FieldName = #31867#22411#21517#31216
      Size = 30
    end
    object ADS25DSDesigner8: TStringField
      FieldName = #26816#26597#20154#21592
      Size = 16
    end
    object ADS25DSDesigner9: TDateTimeField
      FieldName = #26816#26597#26085#26399
    end
    object ADS25DSDesigner10: TStringField
      FieldName = #23457#26680#20154#21592
      Size = 16
    end
    object ADS25DSDesigner11: TDateTimeField
      FieldName = #23457#26680#26085#26399
    end
    object ADS25DSDesigner12: TStringField
      FieldName = #20462#35746#20154#21592
      Size = 16
    end
    object ADS25DSDesigner13: TDateTimeField
      FieldName = #20462#35746#26085#26399
    end
    object ADS25DSDesigner14: TStringField
      FieldName = #26679#26495#32534#21495
      Size = 15
    end
    object ADS25DSDesigner15: TStringField
      FieldName = #23458#25143#29289#26009#21495
      Size = 50
    end
    object ADS25DSDesigner16: TWordField
      FieldName = #23618#25968
    end
    object ADS25SET: TStringField
      FieldName = #20132#36135#23610#23544'SET'
      Size = 30
    end
    object ADS25PCS: TStringField
      FieldName = #21333#21482#23610#23544'PCS'
      Size = 30
    end
    object ADS25SPEL: TStringField
      FieldName = #25340#29256#23610#23544'SPEL'
      Size = 30
    end
    object ADS25PCS2: TFloatField
      FieldName = #21333#21482#38754#31215'PCS'
    end
    object ADS25SET2: TFloatField
      FieldName = #21333#21482#38754#31215'SET'
    end
    object ADS25SPEL2: TFloatField
      FieldName = #21333#21482#38754#31215'SPEL'
    end
    object ADS25DSDesigner17: TMemoField
      FieldName = #23618#21387#32467#26500
      BlobType = ftMemo
    end
    object ADS25DSDesigner18: TMemoField
      FieldName = #21152#24037#25351#31034
      BlobType = ftMemo
    end
    object ADS25DSDesigner19: TStringField
      FieldName = #24037#31243#22791#27880
      Size = 200
    end
    object ADS25DSDesigner20: TFloatField
      FieldName = #25253#24223#29575
    end
    object ADS25DSDesigner21: TIntegerField
      FieldName = #29983#20135#21608#26399
    end
    object ADS25DSDesigner22: TSmallintField
      FieldName = #26377#25928#26399#22825#25968
    end
    object ADS25DSDesigner23: TSmallintField
      FieldName = #21046#36896#25552#21069#26399
    end
    object ADS25DSDesigner24: TStringField
      FieldName = #22823#26009#35268#26684
      Size = 50
    end
    object ADS25g: TBCDField
      FieldName = #21333#21482#37325#37327'g'
      Precision = 9
    end
    object ADS25DSDesigner25: TIntegerField
      FieldName = #27969#36716#25209#37327
    end
    object ADS25DSDesigner26: TStringField
      FieldName = #38144#21806#29366#24577
      ReadOnly = True
      Size = 4
    end
    object ADS25DSDesigner27: TStringField
      FieldName = #23457#25209#29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADS25DSDesigner28: TStringField
      FieldName = #37327#20135#26679#26495
      ReadOnly = True
      Size = 4
    end
    object ADS25DSDesigner29: TStringField
      FieldName = #29615#20445#26631#35782
      ReadOnly = True
      Size = 6
    end
    object ADS25DSDesigner30: TStringField
      FieldName = #20135#21697#24615#36136
      ReadOnly = True
      Size = 4
    end
    object ADS25Field1: TWideStringField
      FieldKind = fkCalculated
      FieldName = #20840#23616#21442#25968'1'
      Size = 2000
      Calculated = True
    end
    object ADS25Field2: TWideStringField
      FieldKind = fkCalculated
      FieldName = #20840#23616#21442#25968'2'
      Size = 2000
      Calculated = True
    end
    object ADS25DSDesigner31: TStringField
      FieldName = #21348#32032#35201#27714
      ReadOnly = True
      Size = 6
    end
    object ADS25BARCODE_FLAG: TWordField
      FieldName = 'BARCODE_FLAG'
    end
    object ADS25DSDesigner32: TStringField
      FieldName = #25237#20135#27604#20363
      ReadOnly = True
      Size = 61
    end
    object ADS25DSDesigner33: TWordField
      FieldName = #25237#20135#27604#20363#20998#23376
    end
    object ADS25DSDesigner34: TWordField
      FieldName = #25237#20135#27604#20363#20998#27597
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB06
    OnPrintingComplete = ppReport1PrintingComplete
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 2000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'R:\NIERP\Report\Manu_instruction.rtm'
    Units = utMillimeters
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 31
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB06'
    object ppTitleBand1: TppTitleBand
      Visible = False
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 39952
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 8996
        mmLeft = 147902
        mmTop = 529
        mmWidth = 46831
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #26412#21378#32534#21495
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 22754
        mmTop = 19579
        mmWidth = 14055
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #23458#25143#22411#21495
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 75406
        mmTop = 19315
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #26412#21378#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 19579
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #23458#25143#22411#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 19315
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #23458#25143#20195#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 15346
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #23458#25143#20195#30721
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 22754
        mmTop = 15346
        mmWidth = 14055
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = #20316#19994#21333#21495
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 75406
        mmTop = 15346
        mmWidth = 14055
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = #31867#22411#21517#31216
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 6435
        mmLeft = 160793
        mmTop = 1588
        mmWidth = 22691
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #20316#19994#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 15346
        mmWidth = 15875
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 28046
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #21333#21482#23610#23544':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 23813
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = #21333#21482#23610#23544'PCS'
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 22490
        mmTop = 23813
        mmWidth = 19389
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #20132#36135#23610#23544':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 23813
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #24403#21069#24037#24207':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 113242
        mmTop = 19050
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = #20132#36135#23610#23544'SET'
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 75406
        mmTop = 23813
        mmWidth = 19389
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = 'Dept_code'
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 3969
        mmLeft = 129646
        mmTop = 19050
        mmWidth = 12171
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = #29615#20445#26631#35782
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4826
        mmLeft = 129741
        mmTop = 529
        mmWidth = 17103
        BandType = 0
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
        mmHeight = 14552
        mmLeft = 794
        mmTop = 0
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 6435
        mmLeft = 62669
        mmTop = 1323
        mmWidth = 68072
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Lot Travelling Sheet'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 73934
        mmTop = 8731
        mmWidth = 43180
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #38144#21806#35746#21333':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 28575
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = #38144#21806#35746#21333
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 22754
        mmTop = 28575
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #35745#21010#23436#24037':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 5292
        mmTop = 32808
        mmWidth = 15875
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 0
        mmTop = 37042
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = #35745#21010#23436#24037#26085#26399
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 22754
        mmTop = 32808
        mmWidth = 21082
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        AutoSize = True
        DataField = #20316#19994#21333#25968#37327
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 144992
        mmTop = 32808
        mmWidth = 17568
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #20316#19994#21333#25968#37327':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 103452
        mmTop = 32808
        mmWidth = 19315
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        AutoSize = True
        DataField = 'PAN'#25968#37327
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 117475
        mmTop = 32808
        mmWidth = 12361
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        AutoSize = True
        DataField = #27599'PANPCS'#25968
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 133879
        mmTop = 32808
        mmWidth = 17695
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 130969
        mmTop = 32808
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = '='
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 142082
        mmTop = 32808
        mmWidth = 1852
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = #35746#21333#26032#26087':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 28575
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        AutoSize = True
        DataField = #35746#21333#26032#26087
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 75406
        mmTop = 28575
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = #25237#20135#25968#37327':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 106892
        mmTop = 28575
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = #25237#20135#25968#37327
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 125413
        mmTop = 28575
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = #25237#20135#31867#22411':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 32808
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = #25237#20135#31867#22411
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 75406
        mmTop = 32808
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #35746#21333#25968#37327':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 151119
        mmTop = 28575
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #35746#21333#25968#37327
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 169334
        mmTop = 28575
        mmWidth = 14055
        BandType = 0
      end
      object ppDBBarCode1: TppDBBarCode
        UserName = 'DBBarCode1'
        AutoEncode = True
        BarCodeType = bcCode128
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = #20316#19994#21333#21495
        DataPipeline = ppDB06
        PrintHumanReadable = False
        Alignment = taCenter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        DataPipelineName = 'ppDB06'
        mmHeight = 6615
        mmLeft = 123561
        mmTop = 11113
        mmWidth = 25929
        BandType = 0
        mmBarWidth = 203
        mmWideBarRatio = 25400
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #24037#21378#20195#30721
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4826
        mmLeft = 178160
        mmTop = 19050
        mmWidth = 17103
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #24037#21378#31616#31216
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4826
        mmLeft = 178160
        mmTop = 23813
        mmWidth = 17103
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Visible = False
        Picture.Data = {
          07544269746D61701A110000424D1A1100000000000036040000280000003A00
          0000370000000100080000000000E40C0000C30E0000C30E0000000100000000
          0000000000000000FF0000FF0000FF00000000FFFF00FFFF0000FF00FF00FFFF
          FF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B004131410039393900C5CDC5009C949C006A62
          6A0052525200313131008B948B009C9C9C00CDC5CD00837383004A524A00737B
          7300CDCDCD0094949400CDD5CD00BDB4BD00948B94005A525A00949C94008B8B
          8B00C5C5C50010081000ACACAC00DEE6DE00E6DEE60073737300BDC5BD00D5D5
          D500B4ACB4008B838B004A4A4A00FFF6FF00C5BDC500EEE6EE00393139008383
          8300ACA4AC0062626200EEEEEE00E6E6E6007B737B00ACB4AC00524A5200DED5
          DE00000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000007
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070707070707000000000707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707070700000000070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070000000007070707070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707000000000707070707070707070707070707FA0707
          070707FA0707FA070707070707FA0707070707FA0707FA07070707FA0707FA07
          070707FA07070700000000070707FA0707FA0707070707FA07070707FA070707
          07070707070707FA07070707FA07070707070707070707070707070707FA0707
          0707070000000007070707070707070707FA0707070707070707070707070707
          FA070707070707070707070707070707FA070707070707070707070707070700
          00000007070707EBEFEFEFEFEFEBEFEFFFEFEFEFEFEFEFEFEFEFEFEFEBEFEFEF
          EFEFEFEFEFEFEFEFEFEFEFEFEBEFEFEFEFEFEFEFEFEB07070707070000000007
          0707E10000E90000E9000000E9000000E90000E90000E900000000E900E900E9
          00E900E90000E9000000E90000E90000E900EA0707070700000000070707EDE9
          000000E90000E90000E900E90000E90000E90000E900E9000000000000000000
          E90000E9000000E90000E9000000080707070700000000070707EE00E9D3F0FD
          F0F0F0F0FDF0F0FDF0F0FDF0F0FDF0F0FDF0FDF0F0F0F0E3F0F0E3F0FDF0F0FD
          F0F0FDF0F0FDF0D300E9E0070707070000000007070707F90000FB0707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707D500000807070707070000000007070707FB00E9F2070707070707070707
          070707070707070707070707070707070707070707070707070707070707F2E9
          00F50707070707000000000707070707E10000EE070707070707070707070707
          0707070707DFD4080707070707070707070707070707070707EA0000DB070707
          070707000000000707070707FAD4E9D4FA070707070707070707070707070707
          ED000000F7070707070707070707070707070707FBD400D4F307070707070700
          000000070707070707EA00E9D6070707070707070707070707070707D400E900
          D407070707FA07070707070707070707E1E900E30707070707FA070000000007
          070707070707F20000FB070707070707070707FA07070707EA0000E9EA070707
          0707070707FA0707070707EF0000D80707070707070707000000000707070707
          0707E8E900FC070707FA0707FA0707070707070707F4DBE80707070707070707
          0707070707FA0708E900FF070707070707070700000000070707FA07070707ED
          0000D507070707070707070707FA0707070707070707FA070707070707070707
          0707E8000008070707070707070707000000000707070707070707F500E9D807
          0707070707070707070707070707070707070707070707070707070707FAD400
          E9F5070707FA070707070700000000070707070707070707E10000EA07070707
          070707070707070707EFEDD50707070707070707FA07070707FDE900DB070707
          070707FA0707070000000007070707FA0707070707D400D4FB070707FA070707
          0707070707FD00F0070707070707FA0707070707FB0000D40707070707070707
          0707070000000007070707070707070707EA00E9E107070707070707FA070707
          07F000FD070707070707070707070707E7E900E3070707070707070707070700
          0000000707070707070707070707D80000EF070707070707070707FA07F000F0
          07070707FA070707070707EF0000D80707070707FA0707070707070000000007
          0707FA07070707070707EFE900DF07070707FA070707070707F000FD0707FA07
          07070707070707F90000EF0707070707070707FA070707000000000707070707
          FA07FA07070707ED00E9E807070707070707070707E100D60707070707070707
          0707EE00E9E70707070707070707070707070700000000070707070707070707
          070707FA0000D4FA0707070707070707070800DF0707070707070707FA07D400
          00FA070707070707070707070707070000000007070707070707070707070707
          F800E9FD0707FA070707070707ED00D7070707070707FA0707DB0000F0070707
          0707FA070707070707070700000000070707FA07070707FA07070707FAD4E900
          FB07070707FA070707F9E9000707070707070707FB0000D40707070707070707
          070707FA070707000000000707070707070707070707070707E300E9E7070707
          0707070707000000070707FA0707070708E900F40707070707070707FA070707
          0707070000000007070707070707FA07070707070707F9E900EF070707070707
          0700000007070707070707EF0000D7070707070707FA07070707070707070700
          00000007070707FA0707070707FA07070707EF0000D8070707070707EF00E900
          FF070707070707D800E9FF070707070707070707070707070707070000000007
          070707070707070707070707070707E7E900E307FA070707EFE90000EF070707
          0707FDE900E70707070707FA0707070707070707070707000000000707070707
          0707070707070707070707FB0000D40707070707EF0000E9D507070707FAD400
          D4FA070707070707070707FA070707FA07070700000000070707FA070707FA07
          FA07070707070707EAE900F807070707EF00E900E207FA0707F8E900F0070707
          0707070707070707070707070707070000000007070707070707070707070707
          0707070707F20000FB07070707D800D407070707EB0000E5070707070707FA07
          0707070707070707070707000000000707070707070707070707FA0707070707
          07D50000DF07070707FBEAE007070707DF0000D5070707070707070707070707
          07FA070707070700000000070707FA070707FA070707070707070707070708E9
          00E0070707070707070707D5E900080707070707070707070707070707070707
          0707070000000007070707070707070707070707070707070707EF0000D80707
          07070707070707D800E9EF07070707070707FA070707FA070707070707070700
          0000000707070707FA07070707FA070707070707070707E100E9FD0707070707
          0707EA00E9E10707070707070707070707070707070707FA0707070000000007
          07070707070707070707070707FA0707070707F3D400D4FA0707070707F3D400
          D4FA0707070707FA07070707070707070707070707070700000000070707FA07
          07070707070707070707070707070707EA0000D60707070707DA00E9F0070707
          07070707070707FA0707070707FA07070707070000000007070707070707FA07
          07FA0707070707FA0707070707E50000E0070707EB00E9D80707070707070707
          0707070707070707070707070707070000000007070707070707070707070707
          070707070707070707E000E908070707ED0000E2070707070707FA0707070707
          070707FA0707070707070700000000070707FA0707070707070707FA07070707
          070707070707EDE900E807D50000FC0707070707070707070707FA0707070707
          0707070707070700000000070707070707FA0707070707070707070707070707
          0707FB0000E5FAFEE900FB070707070707070707070707070707070707070707
          FA070700000000070707070707070707FA0707070707FA0707070707070707F8
          00E9F2E900D60707070707070707070707070707FA0707070707070707070700
          00000007070707FA0707070707070707070707070707FA0707070707D4000000
          D3070707070707FA070707070707070707070707FA0707070707070000000007
          070707070707070707070707FA0707070707070707070707E300E900F0070707
          07070707070707FA070707070707070707070707070707000000000707070707
          0707FA070707070707070707FA0707070707070707D800D80707070707FA0707
          0707070707070707070707070707070707070700000000070707FA0707070707
          0707FA070707070707070707FA0707070707F007070707070707070707FA0707
          0707FA070707070707070707070707000000000707070707FA070707FA070707
          0707FA0707070707070707070707070707070707070707070707070707070707
          0707FA0707070707070707000000000707070707070707070707070707070707
          07070707070707FA07070707070707070707FA07070707070707070707070707
          0707FA0707070700000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000}
        mmHeight = 13229
        mmLeft = 18256
        mmTop = 1058
        mmWidth = 13229
        BandType = 0
      end
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        CalcOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 57944
        mmTop = 10054
        mmWidth = 12965
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Visible = False
        Picture.Data = {
          07544269746D61702A100000424D2A1000000000000036040000280000003900
          0000330000000100080000000000F40B0000C30E0000C30E0000000100000000
          0000000000000000FF0000FF0000FF00000000FFFF00FFFF0000FF00FF00FFFF
          FF007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B7B007B7B
          7B007B7B7B00E6DEE600DEE6DE008373830039313900C5BDC5009CA49C00524A
          5200FFF6FF00ACA4AC00737B7300CDD5CD00F6F6F600DED5DE005A4A5A00838B
          8300D5D5D50039393900625A6200C5C5C5009C949C002020200052525200BDBD
          BD00736A7300CDC5CD00100810009494940041414100BDC5BD00A4A4A4005A52
          5A00292929006A6A6A001010100020182000BDB4BD00D5CDD500626A6200EEEE
          EE00B4BDB4004A524A00948B9400ACB4AC00F6EEF600D5DED50031313100DEDE
          DE000707DC07DC07DC070707070707DC07070707DC07DC070707070707DC0707
          0707070707070707DC0707070707DC070707070707DC07DC0707070000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000007000000000707070707
          0707070707070707070707070707070707070707070707070707070707070707
          0707070707070707070707070707070707000700000000070707070707070707
          0707070707070707070707070707070707070707070707070707070707070707
          070707070707070707070707070007000000000707DCE0FFE0FFE0FFE0FFE0FF
          E0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FFE0FF
          E0FFE0FFDC0707DC0700070000000007D1E10000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          E6F707070700070000000007FF0000EA00EA00EA00EA00EA00EA00EA00EA00EA
          00EA00EA00EA00EA00EA00EA00EA00EA00EA00EA00EA00EA00EA000000D10707
          070007000000000707F9EA00DFD9F8D9F8D9F8D9F8D9F8D9F8D9F8D9F8D9F8D9
          F8D9F8D9FBD9F8D9F8D9FBD9F8D9F8D9FBD9F8D9FBDFEA00F107070707000700
          0000000707E90000080707070707070707070707070707070707070707070707
          0707070707070707070707070707070707E60000FF0707DC0700070000000007
          0707DAEA00E70707070707DC07070707070707DC070707FCFBED070707070707
          070707070707070707070707E700EADF0707070707000700000000070707D100
          00EF07070707070707DC07070707070707DCDCF10000D9070707070707070707
          0707DC07070707DCE100D4FC070707070700070000000007070707EBEA00F8DC
          07DC070707070707070707070707FFEA00EA0007070707DC07070707DC070707
          DC0707E4EA00F80707DC070707000700000000070707DCDCFE00E1FC07DC07DC
          07070707DC0707070707FF000000F107DC070707070707DC070707070707FF00
          00EFDC0707070707070007000000000707070707D50000EB07070707DC07DC07
          07070707DC0707E9D4F1D1070707DC0707DC0707070707DC07070800EAE30707
          0707070707000700000000070707DC0707E60000FF0707DC070707DC07DC07DC
          0707070707070707DC070707DC0707070707070707F50000080707070707DC07
          07000700000000070707070707E0EA00F10707070707070707070707070707F5
          E1F1070707070707070707070707070707F9EA00FD07DC07DC07070707000700
          0000000707DC07DC0707DA0000E90707DC0707070707DC07070707D500EC0707
          0707DC0707DC07070707DC07FB0000E407070707070707070700070000000007
          070707070707FCEA00FEDC0707070707DC070707DC0707E700F9070707070707
          0707DC07DC0707F7E100E10707070707DC07DC0707000700000000070707DC07
          0707DCEE00EAF807DC070707070707DC070707E700F0070707DC0707DC070707
          070707EBEA00F40707DC070707070707070007000000000707070707070707DC
          E10000D2070707DC0707070707070707EA00F1070707070707070707DC07FFEA
          00F907070707070707DC0707070007000000000707DC07DC07070707F8EA00FA
          070707070707DC070707DC07E20000E6D10707070707DC070707DA00EAF507DC
          0707DC07070707070700070000000007070707070707070707E2EA00FF0707DC
          07070707DC070707DCF000EAF2F8DC070707070707E70000DA07070707070707
          07DC070707000700000000070707DC07DC07DC0707FF0000F10707070707DC07
          070707DC07F7EC000000EE0707DC070707E1EA00FC07070707DC070707070707
          070007000000000707070707070707070707DFEA00F807DC070707D1F8DC0707
          070707F9EA00F2FF07070707D90000EE0707DC0707070707DC07070707000700
          0000000707DC07DC070707DC0707F70000ECDC070707D1E500E5FC0707DC07DC
          E500EADA070707F700EAE1DC07070707DC0707070707DC070700070000000007
          0707070707070707070707D9EA00D9070707E2000000F8DC07070707FA0000F3
          070707DF0000D5070707070707DC0707DC07070707000700000000070707DC07
          DC07DC0707070707FE0000DC0707FE00EAE5070707070707F800EA000707E000
          EAF1070707DC070707070707070707DC070007000000000707070707070707DC
          07DC0707E90000DA0707F900F3FC070707070707D90000E10707F10000DD0707
          07070707DC0707DC07070707070007000000000707DC07DC0707070707070707
          07F1EA00DD07E3EAF2070707DC070707E100EADF07F400EADF070707070707DC
          070707070707DC0707000700000000070707070707070707DC07DC0707E000EA
          E60707DF00F1DC07070707E3EA00F007DCE10000FC07DC0707DC070707070707
          DC07070707000700000000070707DC0707DC0707070707070707EB0000D507DC
          F100E1D9FFFFEE0000EAD107D600EAD9070707070707070707DC070707070707
          070007000000000707070707070707DC070707070707DCFE00E1DC07DCEB00EA
          0000EA00E1DD07F700EAE1DC0707070707DC0707070707DC0707070707000700
          0000000707DC07DC07070707DC07DC07DC0707F80000E4070707FFEBF1E1DAD5
          DC0707080000E30707DC0707070707DC07070707DC0707070700070000000007
          070707070707070707070707070707DCEF0000D10707DC07070707070707F500
          0008070707070707DC0707070707DC070707070707000700000000070707DC07
          DC07DC0707070707DC070707E3EA000807070707070707DC0707E600EAD10707
          DC07070707DC07DC070707070707DC0707000700000000070707070707070707
          DC07DC070707070707DA0000E0070707DC07070707FBEA00EBDC0707070707DC
          070707070707DC0707070707070007000000000707DC07DC0707070707070707
          0707DC0707D100EAE60707DC07070707DCE100E1FC0707DC0707DC0707070707
          DC07070707DC070707000700000000070707070707070707DC0707DC07070707
          0707E40000FB070707070707EB00EAD907070707070707070707070707070707
          0707070707000700000000070707DC07DC07DC070707DC07070707070707DCEC
          EAE1DC07070707FF00EAE60707070707DC07070707DC07070707DC0707070707
          070007000000000707070707070707DC0707070707070707070707D90000E407
          DC0707080000F5070707DC07070707DC07070707070707070707070707000700
          0000000707DC07DC0707070707DC0707DC07070707070707E60000D10707E300
          EA080707DC07070707070707070707DC07070707DC0707070700070000000007
          07070707070707DC070707070707DC07DC070707F500EA0807DCEF0000D10707
          07070707DC07070707070707070707070707070707000700000000070707DC07
          07DC0707070707DC0707070707DC070707080000E3D900EAD607DC0707070707
          07070707DC07070707DC0707070707070700070000000007070707070707DC07
          07DC0707070707DC0707070707D100EAEFE100E107070707070707070707DC07
          070707DC070707070707DC07070007000000000707DC07DC07070707DC070707
          07070707070707070707E40000EA00D5070707DC070707070707070707070707
          070707DC070707070700070000000007070707070707070707070707DC070707
          0707DC070707DCE1EA00E60707070707070707DC0707070707DC070707070707
          0707070707000700000000070707DC0707DC070707DC070707070707DC070707
          070707E70000D10707DC070707DC0707070707DC07070707DC0707070707DC07
          070007000000000707070707070707DC070707070707DC0707070707DC070707
          E0E0DC07070707070707070707DC07070707070707070707DC07070707000700
          0000000707DC07DC07070707DC07DC07DC0707070707070707070707DC070707
          0707DC0707070707070707070707DC070707DC07070707070700070000000007
          07070707070707070707070707070707070707070707DC0707070707DC070707
          DC0707DC07070707DC0707070707070707070707070007000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000EA07000000}
        mmHeight = 13229
        mmLeft = 32808
        mmTop = 1058
        mmWidth = 13229
        BandType = 0
      end
      object ppVariable3: TppVariable
        UserName = 'Variable3'
        CalcOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 47890
        mmTop = 794
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #21348#32032#35201#27714
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4826
        mmLeft = 129646
        mmTop = 5556
        mmWidth = 17103
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'dept_name'
        DataPipeline = ppDB06
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 3969
        mmLeft = 142875
        mmTop = 19050
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #25171#21360#26102#38388':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 113506
        mmTop = 23813
        mmWidth = 15875
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 129646
        mmTop = 23813
        mmWidth = 45244
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'SOURCE_PTR'
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65334F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C0A01000070726F636564757265205661
        726961626C65334F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A0D0A2020696620444230365B275050435F464C4147
        275D3D31207468656E0D0A202020696D616765322E76697369626C653A3D7472
        75650D0A2020656C73650D0A202020696D616765322E76697369626C653A3D66
        616C73653B0D0A20202020200D0A20202020200D0A696620444232355B274241
        52434F44455F464C4147275D203D31207468656E0D0A0D0A202020696D616765
        312E76697369626C653A3D747275650D0A2020656C73650D0A202020696D6167
        65312E76697369626C653A3D66616C73653B20200D0A0D0A656E643B0D0A0D43
        6F6D706F6E656E744E616D6506095661726961626C6533094576656E744E616D
        6506064F6E43616C63074576656E74494402210000}
    end
  end
  object ppDB25: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB25'
    Left = 160
    Top = 48
    MasterDataPipelineName = 'ppDB06'
  end
  object ads493: TADODataSet
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 96
    Top = 80
    object ads493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object ads493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object ads493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object ads493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object ads493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object ads493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object ads493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource5: TDataSource
    DataSet = ads493
    Left = 128
    Top = 80
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource5
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 80
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
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
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 232
    Top = 80
  end
  object ads06: TADODataSet
    Active = True
    Connection = frmMain.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0006.WORK_ORDER_NUMBER AS '#20316#19994#21333#21495', '#13#10'      dbo.D' +
      'ata0006.CUT_NO AS '#25237#20135#21333#21495', dbo.Data0060.SALES_ORDER AS '#38144#21806#35746#21333', '#13#10'    ' +
      '  dbo.Data0060.REFERENCE_NUMBER AS '#35746#21333#21442#32771', dbo.Data0006.BOM_PTR,'#13#10 +
      '      dbo.Data0060.SCH_DATE AS '#22238#22797#20132#26399', '#13#10'      dbo.data0492.SCH_CO' +
      'MPL_DATE AS '#35745#21010#23436#24037#26085#26399','#13#10'      dbo.Data0060.PARTS_ORDERED AS '#35746#21333#25968#37327', d' +
      'bo.data0492.PLANNED_QTY AS '#35745#21010#25968#37327', '#13#10'      dbo.data0492.ISSUED_QTY' +
      ' AS '#25237#20135#25968#37327', dbo.data0492.ISSUE_DATE AS '#25237#20135#26085#26399', '#13#10'      dbo.Data0005.' +
      'EMPLOYEE_NAME AS '#25237#20135#20154#21592', data0492.UPANEL1 as A'#26495'PCS'#25968','#13#10'      dbo.Da' +
      'ta0006.PANELS AS PAN'#25968#37327', dbo.Data0006.PARTS_PER_PANEL AS '#27599'PANPCS'#25968 +
      ', '#13#10'      dbo.Data0006.QUAN_SCH AS '#20316#19994#21333#25968#37327', data0492.UPANEL2 as B'#26495 +
      'PCS'#25968','#13#10'       CASE data0492.TTYPE WHEN 0 THEN '#39#27491#24120#25237#20135#39' WHEN 1 THEN' +
      ' '#39#34917#26009#25237#20135#39' '#13#10'       WHEN 2 THEN '#39#25353'MRB'#37325#25237#39' WHEN 3 THEN '#39#25353'MRB'#36820#20462#39' WHEN ' +
      '4 THEN '#39#25353#26495#21495#25237#20135#39#13#10'        END AS '#25237#20135#31867#22411', dbo.Data0006.PRIORITY_CODE ' +
      'AS '#20248#20808#32423#21035', '#13#10'       dbo.Data0060.so_oldnew AS '#35746#21333#26032#26087', dbo.Data0060.F' +
      'OB AS '#21512#21516#21495', '#13#10'       Data0097.PO_NUMBER AS '#23458#25143#35746#21333#21495', data0492.PANEL_' +
      '1_QTY AS PnlA'#25237#20135#25968#37327', '#13#10'       data0492.PANEL_2_QTY AS PnlB'#25237#20135#25968#37327', PP' +
      'C_FLAG,'#13#10'       Data0015.WAREHOUSE_CODE AS '#24037#21378#20195#30721', Data0015.ABBR_N' +
      'AME AS '#24037#21378#31616#31216','#13#10'       data0492.remark as '#25237#20135#22791#27880',data0492.analysis_c' +
      'ode_3 as '#25237#20135#22823#26009#35268#26684','#13#10'     data0034.dept_code,data0034.dept_name, da' +
      'ta0006.LOT_NUMBER as '#25237#20135#25209#21495#13#10'FROM         dbo.Data0015 INNER JOIN'#13 +
      #10'       dbo.Data0006 INNER JOIN'#13#10'       dbo.data0492 ON dbo.Data' +
      '0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN'#13#10'       dbo.Data000' +
      '5 ON dbo.data0492.CREATED_BY_PTR = dbo.Data0005.RKEY ON '#13#10'      ' +
      ' dbo.Data0015.RKEY = dbo.data0492.WHOUSE_PTR LEFT OUTER JOIN'#13#10'  ' +
      '     dbo.Data0097 RIGHT OUTER JOIN'#13#10'       dbo.Data0060 ON dbo.D' +
      'ata0097.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR '#13#10'       ON dbo.d' +
      'ata0492.SO_NO = dbo.Data0060.SALES_ORDER '#13#10'       inner join dat' +
      'a0056 on data0006.rkey=data0056.wo_ptr inner join data0034 on da' +
      'ta0056.dept_ptr=data0034.rkey'#13#10'WHERE Data0006.rkey  =:rkey06'
    Parameters = <
      item
        Name = 'rkey06'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    Left = 96
    Top = 16
    object ads06DSDesigner: TStringField
      FieldName = #20316#19994#21333#21495
      Size = 22
    end
    object ads06DSDesigner2: TStringField
      FieldName = #25237#20135#21333#21495
      FixedChar = True
      Size = 12
    end
    object ads06DSDesigner3: TStringField
      FieldName = #38144#21806#35746#21333
      FixedChar = True
      Size = 12
    end
    object ads06DSDesigner4: TStringField
      FieldName = #35746#21333#21442#32771
      Size = 30
    end
    object ads06DSDesigner5: TDateTimeField
      FieldName = #22238#22797#20132#26399
    end
    object ads06DSDesigner6: TDateTimeField
      FieldName = #35745#21010#23436#24037#26085#26399
    end
    object ads06DSDesigner7: TFloatField
      FieldName = #35746#21333#25968#37327
    end
    object ads06DSDesigner8: TIntegerField
      FieldName = #35745#21010#25968#37327
    end
    object ads06DSDesigner9: TIntegerField
      FieldName = #25237#20135#25968#37327
    end
    object ads06DSDesigner10: TDateTimeField
      FieldName = #25237#20135#26085#26399
    end
    object ads06DSDesigner11: TStringField
      FieldName = #25237#20135#20154#21592
      Size = 16
    end
    object ads06PAN: TIntegerField
      FieldName = 'PAN'#25968#37327
    end
    object ads06PANPCS: TFloatField
      FieldName = #27599'PANPCS'#25968
    end
    object ads06DSDesigner12: TFloatField
      FieldName = #20316#19994#21333#25968#37327
    end
    object ads06DSDesigner13: TStringField
      FieldName = #25237#20135#31867#22411
      ReadOnly = True
      Size = 10
    end
    object ads06DSDesigner14: TWordField
      FieldName = #20248#20808#32423#21035
    end
    object ads06DSDesigner15: TStringField
      FieldName = #35746#21333#26032#26087
      FixedChar = True
      Size = 4
    end
    object ads06DSDesigner16: TStringField
      FieldName = #21512#21516#21495
      Size = 50
    end
    object ads06DSDesigner17: TStringField
      FieldName = #23458#25143#35746#21333#21495
      Size = 25
    end
    object ads06PnlA: TIntegerField
      FieldName = 'PnlA'#25237#20135#25968#37327
    end
    object ads06PnlB: TIntegerField
      FieldName = 'PnlB'#25237#20135#25968#37327
    end
    object ads06DSDesigner18: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object ads06DSDesigner19: TStringField
      FieldName = #24037#21378#31616#31216
      Size = 10
    end
    object ads06BOM_PTR: TIntegerField
      FieldName = 'BOM_PTR'
    end
    object ads06PPC_FLAG: TSmallintField
      FieldName = 'PPC_FLAG'
    end
    object ads06APCS: TIntegerField
      FieldName = 'A'#26495'PCS'#25968
    end
    object ads06BPCS: TIntegerField
      FieldName = 'B'#26495'PCS'#25968
    end
    object ads06DSDesigner20: TStringField
      FieldName = #25237#20135#22791#27880
      Size = 100
    end
    object ads06DSDesigner21: TStringField
      FieldName = #25237#20135#22823#26009#35268#26684
      Size = 50
    end
    object ads06dept_code: TStringField
      FieldName = 'dept_code'
      Size = 10
    end
    object ads06dept_name: TStringField
      FieldName = 'dept_name'
      Size = 30
    end
    object ads06DSDesigner22: TStringField
      FieldName = #25237#20135#25209#21495
      Size = 4
    end
  end
  object DataSource3: TDataSource
    DataSet = ads06
    Left = 128
    Top = 17
  end
  object ppDB06: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB06'
    Left = 160
    Top = 16
    object ppDB06ppField1: TppField
      FieldAlias = #20316#19994#21333#21495
      FieldName = #20316#19994#21333#21495
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB06ppField2: TppField
      FieldAlias = #25237#20135#21333#21495
      FieldName = #25237#20135#21333#21495
      FieldLength = 12
      DisplayWidth = 12
      Position = 1
    end
    object ppDB06ppField3: TppField
      FieldAlias = #38144#21806#35746#21333
      FieldName = #38144#21806#35746#21333
      FieldLength = 12
      DisplayWidth = 12
      Position = 2
    end
    object ppDB06ppField4: TppField
      FieldAlias = #35746#21333#21442#32771
      FieldName = #35746#21333#21442#32771
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object ppDB06ppField5: TppField
      FieldAlias = #22238#22797#20132#26399
      FieldName = #22238#22797#20132#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppDB06ppField6: TppField
      FieldAlias = #35745#21010#23436#24037#26085#26399
      FieldName = #35745#21010#23436#24037#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppDB06ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = #35746#21333#25968#37327
      FieldName = #35746#21333#25968#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDB06ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = #35745#21010#25968#37327
      FieldName = #35745#21010#25968#37327
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDB06ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = #25237#20135#25968#37327
      FieldName = #25237#20135#25968#37327
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDB06ppField10: TppField
      FieldAlias = #25237#20135#26085#26399
      FieldName = #25237#20135#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object ppDB06ppField11: TppField
      FieldAlias = #25237#20135#20154#21592
      FieldName = #25237#20135#20154#21592
      FieldLength = 16
      DisplayWidth = 16
      Position = 10
    end
    object ppDB06ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAN'#25968#37327
      FieldName = 'PAN'#25968#37327
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 11
    end
    object ppDB06ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = #27599'PANPCS'#25968
      FieldName = #27599'PANPCS'#25968
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDB06ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = #20316#19994#21333#25968#37327
      FieldName = #20316#19994#21333#25968#37327
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppDB06ppField15: TppField
      FieldAlias = #25237#20135#31867#22411
      FieldName = #25237#20135#31867#22411
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
    end
    object ppDB06ppField16: TppField
      Alignment = taRightJustify
      FieldAlias = #20248#20808#32423#21035
      FieldName = #20248#20808#32423#21035
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 15
    end
    object ppDB06ppField17: TppField
      FieldAlias = #35746#21333#26032#26087
      FieldName = #35746#21333#26032#26087
      FieldLength = 4
      DisplayWidth = 4
      Position = 16
    end
    object ppDB06ppField18: TppField
      FieldAlias = #21512#21516#21495
      FieldName = #21512#21516#21495
      FieldLength = 50
      DisplayWidth = 50
      Position = 17
    end
    object ppDB06ppField19: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = #23458#25143#35746#21333#21495
      FieldLength = 25
      DisplayWidth = 25
      Position = 18
    end
    object ppDB06ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'PnlA'#25237#20135#25968#37327
      FieldName = 'PnlA'#25237#20135#25968#37327
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 19
    end
    object ppDB06ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PnlB'#25237#20135#25968#37327
      FieldName = 'PnlB'#25237#20135#25968#37327
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 20
    end
    object ppDB06ppField22: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = #24037#21378#20195#30721
      FieldLength = 5
      DisplayWidth = 5
      Position = 21
    end
    object ppDB06ppField23: TppField
      FieldAlias = #24037#21378#31616#31216
      FieldName = #24037#21378#31616#31216
      FieldLength = 10
      DisplayWidth = 10
      Position = 22
    end
    object ppDB06ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'BOM_PTR'
      FieldName = 'BOM_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 23
    end
    object ppDB06ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'PPC_FLAG'
      FieldName = 'PPC_FLAG'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object ppDB06ppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'A'#26495'PCS'#25968
      FieldName = 'A'#26495'PCS'#25968
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 25
    end
    object ppDB06ppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'B'#26495'PCS'#25968
      FieldName = 'B'#26495'PCS'#25968
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 26
    end
    object ppDB06ppField28: TppField
      FieldAlias = #25237#20135#22791#27880
      FieldName = #25237#20135#22791#27880
      FieldLength = 100
      DisplayWidth = 100
      Position = 27
    end
    object ppDB06ppField29: TppField
      FieldAlias = #25237#20135#22823#26009#35268#26684
      FieldName = #25237#20135#22823#26009#35268#26684
      FieldLength = 50
      DisplayWidth = 50
      Position = 28
    end
    object ppDB06ppField30: TppField
      FieldAlias = 'dept_code'
      FieldName = 'dept_code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object ppDB06ppField31: TppField
      FieldAlias = 'dept_name'
      FieldName = 'dept_name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 30
    end
    object ppDB06ppField32: TppField
      FieldAlias = #25237#20135#25209#21495
      FieldName = #25237#20135#25209#21495
      FieldLength = 4
      DisplayWidth = 4
      Position = 31
    end
  end
end
