object Form_report: TForm_report
  Left = 409
  Top = 222
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#34920#25968#25454#23450#20041
  ClientHeight = 421
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 15
    Top = 213
    Width = 425
    Height = 94
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 16
    Top = 320
    Width = 425
    Height = 97
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = ADS25
    Left = 128
    Top = 48
  end
  object ADS25: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADS25CalcFields
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
      '.Data0025.OPT_LOT_SIZE as '#27969#36716#25209#37327',data0025.QTY_BOM as '#21387#21512#27604#20363','#13#10'case D' +
      'ata0025.ONHOLD_SALES_FLAG when 0 then '#39#26377#25928#39' when 1 then '#39#36807#26399#39' end ' +
      'as '#38144#21806#29366#24577', '#13#10'case Data0025.TSTATUS'#13#10'   when 0 then '#39#24453#21046#20316#39' when 1 th' +
      'en '#39#24050#23457#26680#39' when 2 then '#39#23457#36864#22238#39' when 3 then '#39#24453#26816#26597#39#13#10'   when 4 then '#39#24453#23457 +
      #26680#39' when 5 then '#39#26816#36864#22238#39' when 6 then '#39#26410#25552#20132#39' end as '#23457#25209#29366#24577','#13#10'case   Data' +
      '0025.ttype  when 0 then '#39#37327#20135#39' when 1 then '#39#26679#26495#39'  end as '#37327#20135#26679#26495','#13#10'cas' +
      'e Data0025.green_flag when '#39'Y'#39' then '#39'RoHS'#39'  else '#39#38750'RoHS'#39' end as ' +
      #29615#20445#26631#35782','#13#10'case when data0025.PARENT_PTR is null then '#39#22806#23618#39' ELSE '#39#20869#23618#39 +
      ' end as  '#20135#21697#24615#36136','#13#10'case when ltrim(data0025.CURRENT_REV)='#39'Y'#39' then '#39 +
      #26080#21348#32032#39' else '#39#39' end as '#21348#32032#35201#27714#13#10'FROM dbo.Data0008 INNER JOIN'#13#10'      db' +
      'o.Data0025 ON '#13#10'      dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE' +
      '_PTR INNER JOIN'#13#10'      dbo.Data0010 ON '#13#10'      dbo.Data0025.CUST' +
      'OMER_PTR = dbo.Data0010.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005' +
      ' Data0005_3 ON '#13#10'      dbo.Data0025.CHECK_BY_PTR = Data0005_3.RK' +
      'EY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_2 ON '#13#10'      dbo' +
      '.Data0025.LAST_MODIFIED_BY_PTR = Data0005_2.RKEY LEFT OUTER JOIN' +
      #13#10'      dbo.Data0005 Data0005_1 ON dbo.Data0025.AUDITED_BY_PTR =' +
      ' Data0005_1.RKEY'#13#10'where data0025.rkey=:rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
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
      DisplayWidth = 40
      FieldName = #23458#25143#22411#21495
      Size = 80
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
    object ADS25DSDesigner31: TWordField
      FieldName = #21387#21512#27604#20363
    end
    object ADS25DSDesigner32: TStringField
      FieldName = #21348#32032#35201#27714
      ReadOnly = True
      Size = 6
    end
  end
  object ads279: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT Data0278.PARAMETER_NAME , '#13#10'      Data027' +
      '8.PARAMETER_DESC,'#13#10'    Data0279.PARAMETER_VALUE ,Data0002.UNIT_C' +
      'ODE'#13#10'FROM dbo.Data0279 INNER JOIN'#13#10'      dbo.Data0278 ON '#13#10'     ' +
      ' dbo.Data0279.PARAMETER_PTR = dbo.Data0278.RKEY INNER JOIN'#13#10'    ' +
      '  dbo.Data0002 ON dbo.Data0278.UNIT_PTR = dbo.Data0002.RKEY'#13#10'WHE' +
      'RE (Data0279.IES_PROD = 1) AND '#13#10'               (data0278.status' +
      '=0) and'#13#10'               (Data0279.SOURCE_PTR = :rkey) and'#13#10'     ' +
      '          (Data0279.PARAMETER_VALUE <> :value)'#13#10'ORDER BY dbo.Dat' +
      'a0279.IES_CRP'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'value'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = #39#39
      end>
    Left = 65
    Top = 48
    object ads279PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object ads279PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
    object ads279PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads279UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
  end
  object ads38: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ads38CalcFields
    CommandText = 
      'SELECT Data0034.DEPT_CODE as '#24037#24207#20195#30721', Data0034.DEPT_NAME as '#24037#24207#21517#31216', '#13 +
      #10'      Data0038.STEP_NUMBER, Data0038.tooling_rev as '#24037#20855#29256#26412', '#13#10'   ' +
      '   Data0034.BARCODE_ENTRY_FLAG as '#36807#25968', Data0038.OUTP_SPFC as '#20135#20986', ' +
      #13#10'      Data0038.DEF_ROUT_INST as '#22791#27880', data0038.SOURCE_PTR'#13#10'FROM ' +
      'Data0038 INNER JOIN'#13#10'      Data0034 ON dbo.Data0038.DEPT_PTR = D' +
      'ata0034.RKEY'#13#10'WHERE  (Data0038.SOURCE_PTR = :rkey) and'#13#10'        ' +
      '        (data0034.visible_in_mi <> :visible)'#13#10'order by Data0038.' +
      'STEP_NUMBER'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end
      item
        Name = 'visible'
        Attributes = [paNullable]
        DataType = ftWord
        Precision = 3
        Size = 1
        Value = 2
      end>
    Left = 96
    Top = 77
    object ads38DSDesigner: TStringField
      FieldName = #24037#24207#20195#30721
      Size = 10
    end
    object ads38DSDesigner2: TStringField
      FieldName = #24037#24207#21517#31216
      Size = 30
    end
    object ads38STEP_NUMBER: TSmallintField
      DisplayLabel = #27493#39588
      FieldName = 'STEP_NUMBER'
    end
    object ads38DSDesigner3: TStringField
      FieldName = #24037#20855#29256#26412
      Size = 10
    end
    object ads38DSDesigner4: TStringField
      FieldName = #36807#25968
      Size = 1
    end
    object ads38DSDesigner5: TBCDField
      FieldName = #20135#20986
      Precision = 19
    end
    object ads38DSDesigner6: TStringField
      FieldName = #22791#27880
      Size = 400
    end
    object ads38SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ads38WideStringField: TWideStringField
      FieldKind = fkCalculated
      FieldName = #24037#33402#21442#25968
      Size = 2000
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ads38
    Left = 128
    Top = 77
  end
  object ads494: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0278.PARAMETER_NAME, dbo.Data0278.PARAMETER_DESC,' +
      ' '#13#10'      dbo.Data0494.PARAMETER_VALUE, dbo.Data0002.UNIT_CODE,'#13#10 +
      '      data0494.step_number'#13#10'FROM dbo.Data0494 INNER JOIN'#13#10'      ' +
      'dbo.Data0278 ON '#13#10'      dbo.Data0494.PARAMETER_PTR = dbo.Data027' +
      '8.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0278.UNIT_PTR =' +
      ' dbo.Data0002.RKEY'#13#10'where data0494.custpart_ptr = :source_ptr an' +
      'd'#13#10'           Data0494.PARAMETER_VALUE <> :value and'#13#10'          ' +
      ' data0494.doc_flag='#39'Y'#39#13#10'order by data0494.step_number, data0494.' +
      'seq_no'
    Parameters = <
      item
        Name = 'source_ptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'value'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end>
    Left = 64
    Top = 77
    object ads494PARAMETER_NAME: TStringField
      FieldName = 'PARAMETER_NAME'
      Size = 10
    end
    object ads494PARAMETER_DESC: TStringField
      FieldName = 'PARAMETER_DESC'
    end
    object ads494PARAMETER_VALUE: TStringField
      FieldName = 'PARAMETER_VALUE'
      Size = 30
    end
    object ads494UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object ads494step_number: TSmallintField
      FieldName = 'step_number'
    end
  end
  object ads192: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'SELECT ENG_CONTROL2, ENG_CONTROL16'#13#10'FROM dbo.Data0192'
    Parameters = <>
    Left = 97
    Top = 15
    object ads192ENG_CONTROL2: TWordField
      DisplayLabel = #19981#26174#31034#20026#31354#30340#21046#31243#21442#25968
      FieldName = 'ENG_CONTROL2'
    end
    object ads192ENG_CONTROL16: TWordField
      DisplayLabel = #19981#26174#31034#20026#31354#30340#20840#23616#21442#25968
      FieldName = 'ENG_CONTROL16'
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB38
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 5350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\Manu_instruction.rtm'
    Units = utMillimeters
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    PreviewFormSettings.ZoomPercentage = 140
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 200
    Top = 80
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB38'
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
      mmHeight = 47625
      mmPrintPosition = 0
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #20840#23616#21442#25968'1'
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 42069
        mmWidth = 91281
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = #20840#23616#21442#25968'2'
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4233
        mmLeft = 100277
        mmTop = 42069
        mmWidth = 91281
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
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
        mmTop = 22754
        mmWidth = 14139
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
        mmLeft = 22754
        mmTop = 27781
        mmWidth = 14139
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
        mmTop = 22754
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
        mmLeft = 5292
        mmTop = 27781
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
        mmTop = 17198
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
        mmTop = 17198
        mmWidth = 14139
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = #20135#21697#24615#36136
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
        mmTop = 17198
        mmWidth = 14139
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
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4022
        mmLeft = 75406
        mmTop = 22754
        mmWidth = 14139
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #20135#21697#31867#22411':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 22754
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #20135#21697#24615#36136':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 58473
        mmTop = 17198
        mmWidth = 15875
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 33602
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #23458#25143#29289#26009#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 55033
        mmTop = 27781
        mmWidth = 19315
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = #23458#25143#29289#26009#21495
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
        mmTop = 27781
        mmWidth = 17674
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #21333#21482#23610#23544':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 112448
        mmTop = 17198
        mmWidth = 15875
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
        mmLeft = 112448
        mmTop = 22754
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #25340#29256#23610#23544':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 112448
        mmTop = 27781
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
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
        mmLeft = 130704
        mmTop = 17198
        mmWidth = 19473
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
        mmLeft = 130704
        mmTop = 22754
        mmWidth = 19473
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = #25340#29256#23610#23544'SPEL'
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
        mmLeft = 130704
        mmTop = 27781
        mmWidth = 21251
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
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 6456
        mmLeft = 169661
        mmTop = 14817
        mmWidth = 22691
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #21442#25968#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 5556
        mmTop = 35719
        mmWidth = 14055
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #21442#25968#20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 44503
        mmTop = 35719
        mmWidth = 10541
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 2381
        mmTop = 40481
        mmWidth = 93663
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #21442#25968#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 101600
        mmTop = 35719
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #21442#25968#20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 140494
        mmTop = 35719
        mmWidth = 10583
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 98425
        mmTop = 40481
        mmWidth = 94456
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
        mmHeight = 14817
        mmLeft = 794
        mmTop = 0
        mmWidth = 23548
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
        mmHeight = 6456
        mmLeft = 62669
        mmTop = 1323
        mmWidth = 68072
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Manufacturing Instructions'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 67469
        mmTop = 8731
        mmWidth = 56092
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 162454
        mmTop = 4233
        mmWidth = 30163
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 172509
        mmTop = 9260
        mmWidth = 19579
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentHeight = True
        ParentWidth = True
        Position = lpRight
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #24037#24207#20195#30721
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 3969
        mmLeft = 10848
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = #24037#24207#21517#31216
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 3969
        mmLeft = 28575
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = #24037#33402#21442#25968
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 4233
        mmLeft = 51594
        mmTop = 529
        mmWidth = 132557
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'STEP_NUMBER'
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 3969
        mmLeft = 529
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 9790
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 27517
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 50536
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5027
        mmLeft = 185209
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = #24037#20855#29256#26412
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 3969
        mmLeft = 186002
        mmTop = 529
        mmWidth = 9525
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 12171
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #21046#20316':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 3175
        mmTop = 1588
        mmWidth = 8805
        BandType = 8
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #20462#35746#20154#21592
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
        mmLeft = 14817
        mmTop = 1588
        mmWidth = 14139
        BandType = 8
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #20462#35746#26085#26399
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
        mmLeft = 14817
        mmTop = 6615
        mmWidth = 14139
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 12435
        mmTop = 6085
        mmWidth = 26723
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #22797#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 58738
        mmTop = 1588
        mmWidth = 8731
        BandType = 8
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #26816#26597#20154#21592
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
        mmLeft = 70379
        mmTop = 1588
        mmWidth = 14139
        BandType = 8
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #26816#26597#26085#26399
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
        mmLeft = 70379
        mmTop = 6615
        mmWidth = 14139
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 67998
        mmTop = 6085
        mmWidth = 26723
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #23457#26680':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 109538
        mmTop = 1588
        mmWidth = 8731
        BandType = 8
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #23457#26680#20154#21592
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
        mmLeft = 121179
        mmTop = 1588
        mmWidth = 14139
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 118798
        mmTop = 6085
        mmWidth = 26723
        BandType = 8
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #23457#26680#26085#26399
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
        mmLeft = 121179
        mmTop = 6615
        mmWidth = 14139
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #26680#20934':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 152665
        mmTop = 1588
        mmWidth = 8805
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 161925
        mmTop = 6879
        mmWidth = 26723
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
      DataPipeline = ppDB38
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB38'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = #24037#24207#20195#30721
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 10848
          mmTop = 1058
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = #24037#24207#21517#31216
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 30692
          mmTop = 794
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = #21046#31243#21442#25968
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4022
          mmLeft = 57415
          mmTop = 794
          mmWidth = 14224
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = #27493#39588
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4022
          mmLeft = 1323
          mmTop = 794
          mmWidth = 7112
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = #24037#20855
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4022
          mmLeft = 187590
          mmTop = 1058
          mmWidth = 7112
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'Line31'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 9790
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine32: TppLine
          UserName = 'Line32'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 27517
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'Line33'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 50536
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine34: TppLine
          UserName = 'Line34'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 185209
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'Line7'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine45: TppLine
          UserName = 'Line45'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine46: TppLine
          UserName = 'Line46'
          ParentHeight = True
          Position = lpRight
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 184150
          mmTop = 0
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppSubReport3: TppSubReport
          UserName = 'SubReport3'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppDB29'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = ppDB29
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 5350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.01'
            mmColumnWidth = 0
            DataPipelineName = 'ppDB29'
            object ppTitleBand4: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppHeaderBand4: TppHeaderBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
              object ppLine20: TppLine
                UserName = 'Line20'
                ParentHeight = True
                ParentWidth = True
                Position = lpBottom
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 4
              end
              object ppLine7: TppLine
                UserName = 'Line301'
                ParentHeight = True
                ParentWidth = True
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 4
              end
              object ppDBText22: TppDBText
                UserName = 'DBText22'
                AutoSize = True
                DataField = #20992#20855
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 3985
                mmTop = 1588
                mmWidth = 7112
                BandType = 4
              end
              object ppDBText23: TppDBText
                UserName = 'DBText23'
                AutoSize = True
                DataField = #31526#21495
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 16156
                mmTop = 1588
                mmWidth = 7112
                BandType = 4
              end
              object ppDBText24: TppDBText
                UserName = 'DBText24'
                AutoSize = True
                DataField = #25104#21697#23380#24452
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 25432
                mmTop = 1588
                mmWidth = 14224
                BandType = 4
              end
              object ppDBText25: TppDBText
                UserName = 'DBText25'
                AutoSize = True
                DataField = 'PTH'#23380
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 40593
                mmTop = 1588
                mmWidth = 10626
                BandType = 4
              end
              object ppDBText26: TppDBText
                UserName = 'DBText26'
                AutoSize = True
                DataField = #20844#24046
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 58224
                mmTop = 1588
                mmWidth = 7112
                BandType = 4
              end
              object ppDBText27: TppDBText
                UserName = 'DBText27'
                AutoSize = True
                DataField = #38075#21632
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 78862
                mmTop = 1588
                mmWidth = 7112
                BandType = 4
              end
              object ppDBText28: TppDBText
                UserName = 'DBText28'
                AutoSize = True
                DataField = 'PCS'#23380#25968
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 91811
                mmTop = 1588
                mmWidth = 14309
                BandType = 4
              end
              object ppDBText29: TppDBText
                UserName = 'DBText29'
                AutoSize = True
                DataField = 'A'#26495#23380#25968
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 111390
                mmTop = 1588
                mmWidth = 12996
                BandType = 4
              end
              object ppDBText30: TppDBText
                UserName = 'DBText30'
                AutoSize = True
                DataField = 'B'#26495#23380#25968
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 129646
                mmTop = 1588
                mmWidth = 12996
                BandType = 4
              end
              object ppDBText31: TppDBText
                UserName = 'DBText31'
                AutoSize = True
                DataField = #22791#27880
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4022
                mmLeft = 148696
                mmTop = 1588
                mmWidth = 7112
                BandType = 4
              end
              object ppLine21: TppLine
                UserName = 'Line21'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 0
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine22: TppLine
                UserName = 'Line22'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 14552
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine23: TppLine
                UserName = 'Line23'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 24606
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine24: TppLine
                UserName = 'Line24'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 40481
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine25: TppLine
                UserName = 'Line25'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 51858
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine26: TppLine
                UserName = 'Line26'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 74083
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine27: TppLine
                UserName = 'Line27'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 90752
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine28: TppLine
                UserName = 'Line28'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 110861
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine29: TppLine
                UserName = 'Line29'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 128852
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine30: TppLine
                UserName = 'Line30'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6615
                mmLeft = 147902
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup4: TppGroup
              BreakName = 'ppLabel28'
              BreakType = btCustomField
              KeepTogether = True
              OutlineSettings.CreateNode = True
              UserName = 'Group4'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = ''
              object ppGroupHeaderBand4: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 16404
                mmPrintPosition = 0
                object ppShape2: TppShape
                  UserName = 'Shape2'
                  ParentWidth = True
                  mmHeight = 6085
                  mmLeft = 0
                  mmTop = 10319
                  mmWidth = 197300
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel28: TppLabel
                  UserName = 'Label28'
                  Caption = #20992#20855
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 4498
                  mmTop = 11377
                  mmWidth = 7144
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel29: TppLabel
                  UserName = 'Label29'
                  Caption = #31526#21495
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 15875
                  mmTop = 11377
                  mmWidth = 7144
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel30: TppLabel
                  UserName = 'Label30'
                  Caption = #25104#21697#23380#24452
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 25665
                  mmTop = 11377
                  mmWidth = 14288
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel31: TppLabel
                  UserName = 'Label31'
                  Caption = 'PTH'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 42333
                  mmTop = 11377
                  mmWidth = 7144
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel32: TppLabel
                  UserName = 'Label32'
                  Caption = #20844#24046
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 57679
                  mmTop = 11377
                  mmWidth = 7144
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel33: TppLabel
                  UserName = 'Label33'
                  Caption = #38075#21632
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 77258
                  mmTop = 11377
                  mmWidth = 7144
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel34: TppLabel
                  UserName = 'Label34'
                  Caption = #21333#20803#23380#25968
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 93398
                  mmTop = 11377
                  mmWidth = 14288
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel35: TppLabel
                  UserName = 'Label35'
                  Caption = 'A'#26495#23380#25968
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 113506
                  mmTop = 11377
                  mmWidth = 12965
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel36: TppLabel
                  UserName = 'Label36'
                  Caption = 'B'#26495#23380#25968
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 130440
                  mmTop = 11377
                  mmWidth = 12965
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel37: TppLabel
                  UserName = 'Label37'
                  Caption = #22791#27880
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 164571
                  mmTop = 11377
                  mmWidth = 7144
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel38: TppLabel
                  UserName = 'Label38'
                  Caption = #38075#21632#34920
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 14
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 5556
                  mmLeft = 87577
                  mmTop = 3969
                  mmWidth = 15081
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine19: TppLine
                  UserName = 'Line19'
                  ParentWidth = True
                  Weight = 0.750000000000000000
                  mmHeight = 3175
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 197300
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine35: TppLine
                  UserName = 'Line35'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 14552
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine36: TppLine
                  UserName = 'Line36'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 24606
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine37: TppLine
                  UserName = 'Line37'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 40481
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine38: TppLine
                  UserName = 'Line38'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 51858
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine39: TppLine
                  UserName = 'Line39'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 74083
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine40: TppLine
                  UserName = 'Line40'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 90752
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine41: TppLine
                  UserName = 'Line401'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 110861
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine42: TppLine
                  UserName = 'Line42'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 128852
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine43: TppLine
                  UserName = 'Line43'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 147902
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand4: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
            object raCodeModule2: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'SOURCE_PTR'
      DataPipeline = ppDB38
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      ReprintOnSubsequentPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB38'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppSubReport2: TppSubReport
          UserName = 'SubReport2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppDB25'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppDB25
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 5350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.01'
            mmColumnWidth = 0
            DataPipelineName = 'ppDB25'
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppHeaderBand3: TppHeaderBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand3: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 8202
              mmPrintPosition = 0
              object ppDBMemo6: TppDBMemo
                UserName = 'DBMemo6'
                CharWrap = False
                DataField = #23618#21387#32467#26500
                DataPipeline = ppDB25
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #26032#23435#20307
                Font.Size = 10
                Font.Style = []
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppDB25'
                mmHeight = 4498
                mmLeft = 2646
                mmTop = 1323
                mmWidth = 179123
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup5: TppGroup
              BreakName = 'ppLabel27'
              BreakType = btCustomField
              OutlineSettings.CreateNode = True
              NewPage = True
              UserName = 'Group5'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = ''
              object ppGroupHeaderBand5: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 7938
                mmPrintPosition = 0
                object ppLabel27: TppLabel
                  UserName = 'Label27'
                  Caption = #23618#21387#22270':'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 14
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 5556
                  mmLeft = 78846
                  mmTop = 1058
                  mmWidth = 17463
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine18: TppLine
                  UserName = 'Line18'
                  ParentWidth = True
                  Weight = 0.750000000000000000
                  mmHeight = 2117
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 197300
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand5: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
            object raCodeModule3: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'SOURCE_PTR'
      DataPipeline = ppDB38
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      ReprintOnSubsequentPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB38'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLine47: TppLine
          UserName = 'Line47'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.750000000000000000
          mmHeight = 10583
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppDB502'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppDB502
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Report'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 5350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.01'
            mmColumnWidth = 0
            DataPipelineName = 'ppDB502'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppHeaderBand2: TppHeaderBand
              Visible = False
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand2: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 157163
              mmPrintPosition = 0
              object ppImage1: TppImage
                UserName = 'Image1'
                MaintainAspectRatio = False
                Stretch = True
                mmHeight = 71702
                mmLeft = 1323
                mmTop = 5556
                mmWidth = 95250
                BandType = 4
              end
              object ppImage2: TppImage
                UserName = 'Image2'
                MaintainAspectRatio = False
                Stretch = True
                mmHeight = 71702
                mmLeft = 99219
                mmTop = 5556
                mmWidth = 95250
                BandType = 4
              end
              object ppLabel40: TppLabel
                UserName = 'Label40'
                Caption = 'A'#26495#25340#29256#22270':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 1852
                mmTop = 265
                mmWidth = 17727
                BandType = 4
              end
              object ppLabel41: TppLabel
                UserName = 'Label401'
                Caption = 'B'#26495#25340#29256#22270':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 102129
                mmTop = 265
                mmWidth = 17727
                BandType = 4
              end
              object ppLabel39: TppLabel
                UserName = 'Label39'
                Caption = #22823#26009#25340#29256#22270':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 1852
                mmTop = 79375
                mmWidth = 19315
                BandType = 4
              end
              object ppLabel26: TppLabel
                UserName = 'Label26'
                Caption = #24037#31243#22791#27880':'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 100542
                mmTop = 79111
                mmWidth = 15875
                BandType = 4
              end
              object ppDBMemo5: TppDBMemo
                UserName = 'DBMemo5'
                CharWrap = False
                DataField = #24037#31243#22791#27880
                DataPipeline = ppDB25
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                ParentDataPipeline = False
                Stretch = True
                Transparent = True
                DataPipelineName = 'ppDB25'
                mmHeight = 5027
                mmLeft = 100013
                mmTop = 85725
                mmWidth = 95779
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
              object ppImage3: TppImage
                UserName = 'Image3'
                MaintainAspectRatio = False
                Stretch = True
                mmHeight = 71702
                mmLeft = 1588
                mmTop = 83873
                mmWidth = 95250
                BandType = 4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup6: TppGroup
              BreakName = 'ppLabel25'
              BreakType = btCustomField
              OutlineSettings.CreateNode = True
              NewPage = True
              UserName = 'Group6'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = ''
              object ppGroupHeaderBand6: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 7673
                mmPrintPosition = 0
                object ppLine17: TppLine
                  UserName = 'Line17'
                  ParentWidth = True
                  Weight = 0.750000000000000000
                  mmHeight = 2646
                  mmLeft = 0
                  mmTop = 1323
                  mmWidth = 197300
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel25: TppLabel
                  UserName = 'Label25'
                  Caption = #24320#26009#22270
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 14
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 5556
                  mmLeft = 80433
                  mmTop = 2117
                  mmWidth = 15081
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand6: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
            object raCodeModule1: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = #21152#24037#25351#31034':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 794
          mmWidth = 15875
          BandType = 5
          GroupNo = 2
        end
        object ppDBMemo4: TppDBMemo
          UserName = 'DBMemo4'
          CharWrap = False
          DataField = #21152#24037#25351#31034
          DataPipeline = ppDB25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppDB25'
          mmHeight = 3440
          mmLeft = 18256
          mmTop = 794
          mmWidth = 159809
          BandType = 5
          GroupNo = 2
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
  end
  object ads502: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT sheet_BMP as '#24320#26009#22270', pnl_bmp as A'#25340#29256#22270', '#13#10'pnl2_bmp as B'#25340#29256#22270', TO' +
      'TAL_PNLS_2 as A'#25340#29256#25968', '#13#10'TOTAL_PNLS_1 as B'#25340#29256#25968','#13#10' UNIT_LEN as '#21333#20803#38271', U' +
      'NIT_WTH as '#21333#20803#23485', '#13#10'UNIT_NUM as '#21333#20803#25968', SHT_LEN as '#22823#26009#38271','#13#10' SHT_WTH as ' +
      #22823#26009#23485', TUSAGE as '#22823#26009#21033#29992#29575', '#13#10'PNL_LEN as A'#26495#38271', PNL_WTH as A'#26495#23485','#13#10' UPANEL' +
      ' as A'#26495'PCS'#25968','#13#10' PNL_LEN_2 as B'#26495#38271',PNL_WTH_2 as B'#26495#23485','#13#10' UPANEL_2 as B' +
      #26495'PCS'#25968#13#10'FROM dbo.Data0502'#13#10'where source_ptr=:rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 96
    Top = 110
    object ads502DSDesigner: TBlobField
      FieldName = #24320#26009#22270
    end
    object ads502A: TBlobField
      FieldName = 'A'#25340#29256#22270
    end
    object ads502B: TBlobField
      FieldName = 'B'#25340#29256#22270
    end
    object ads502A2: TSmallintField
      FieldName = 'A'#25340#29256#25968
    end
    object ads502B2: TSmallintField
      FieldName = 'B'#25340#29256#25968
    end
    object ads502DSDesigner2: TFloatField
      FieldName = #21333#20803#38271
    end
    object ads502DSDesigner3: TFloatField
      FieldName = #21333#20803#23485
    end
    object ads502DSDesigner4: TIntegerField
      FieldName = #21333#20803#25968
    end
    object ads502DSDesigner5: TFloatField
      FieldName = #22823#26009#38271
    end
    object ads502DSDesigner6: TFloatField
      FieldName = #22823#26009#23485
    end
    object ads502DSDesigner7: TBCDField
      FieldName = #22823#26009#21033#29992#29575
      Precision = 19
    end
    object ads502A3: TFloatField
      FieldName = 'A'#26495#38271
    end
    object ads502A4: TFloatField
      FieldName = 'A'#26495#23485
    end
    object ads502APCS: TSmallintField
      FieldName = 'A'#26495'PCS'#25968
    end
    object ads502B3: TFloatField
      FieldName = 'B'#26495#38271
    end
    object ads502B4: TFloatField
      FieldName = 'B'#26495#23485
    end
    object ads502BPCS: TSmallintField
      FieldName = 'B'#26495'PCS'#25968
    end
  end
  object DataSource3: TDataSource
    DataSet = ads502
    Left = 128
    Top = 110
  end
  object ppDB25: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB25'
    Left = 160
    Top = 48
  end
  object ppDB502: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB502'
    Left = 160
    Top = 110
  end
  object ads29: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT SEQ_NO as '#24207#21495',SEQ_NR AS '#20992#20855','#13#10' MARK as '#31526#21495', HOLES_DIA as '#25104#21697#23380 +
      #24452','#13#10' PTH as PTH'#23380', TOLERANCE as '#20844#24046', '#13#10' DRILL_DIA as '#38075#21632', UNIT as P' +
      'CS'#23380#25968','#13#10' PANEL_A as A'#26495#23380#25968', PANEL_B AS B'#26495#23380#25968', '#13#10'REMARK as '#22791#27880',SET_UNM' +
      'BER as SE'#23380#25968#13#10'FROM dbo.Data0029'#13#10'where source_ptr=:rkey'#13#10'ORDER BY' +
      ' SEQ_NO'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 96
    Top = 143
    object ads29DSDesigner7: TSmallintField
      FieldName = #24207#21495
    end
    object ads29DSDesigner: TStringField
      FieldName = #20992#20855
      Size = 5
    end
    object ads29DSDesigner2: TStringField
      FieldName = #31526#21495
      Size = 6
    end
    object ads29DSDesigner3: TStringField
      FieldName = #25104#21697#23380#24452
      Size = 10
    end
    object ads29PTH: TStringField
      FieldName = 'PTH'#23380
      Size = 1
    end
    object ads29DSDesigner4: TStringField
      FieldName = #20844#24046
      Size = 15
    end
    object ads29DSDesigner5: TStringField
      FieldName = #38075#21632
      Size = 11
    end
    object ads29PCS: TStringField
      FieldName = 'PCS'#23380#25968
      Size = 10
    end
    object ads29A: TStringField
      FieldName = 'A'#26495#23380#25968
      Size = 6
    end
    object ads29B: TStringField
      FieldName = 'B'#26495#23380#25968
      Size = 6
    end
    object ads29DSDesigner6: TStringField
      FieldName = #22791#27880
      Size = 30
    end
    object ads29SE: TStringField
      FieldName = 'SE'#23380#25968
      Size = 6
    end
  end
  object DataSource4: TDataSource
    DataSet = ads29
    Left = 128
    Top = 144
  end
  object ppDB29: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DB29'
    Left = 160
    Top = 144
    object ppDB29ppField1: TppField
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField2: TppField
      FieldAlias = #20992#20855
      FieldName = #20992#20855
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField3: TppField
      FieldAlias = #31526#21495
      FieldName = #31526#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField4: TppField
      FieldAlias = #25104#21697#23380#24452
      FieldName = #25104#21697#23380#24452
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField5: TppField
      FieldAlias = 'PTH'#23380
      FieldName = 'PTH'#23380
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField6: TppField
      FieldAlias = #20844#24046
      FieldName = #20844#24046
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField7: TppField
      FieldAlias = #38075#21632
      FieldName = #38075#21632
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField8: TppField
      FieldAlias = 'PCS'#23380#25968
      FieldName = 'PCS'#23380#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField9: TppField
      FieldAlias = 'A'#26495#23380#25968
      FieldName = 'A'#26495#23380#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField10: TppField
      FieldAlias = 'B'#26495#23380#25968
      FieldName = 'B'#26495#23380#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField11: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField12: TppField
      FieldAlias = 'SE'#23380#25968
      FieldName = 'SE'#23380#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
  end
  object ads493: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 96
    Top = 176
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
    Top = 176
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource5
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 176
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
    Top = 112
  end
  object ppDB38: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB38'
    Left = 160
    Top = 80
  end
end
