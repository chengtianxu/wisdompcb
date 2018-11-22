object Form_report: TForm_report
  Left = 373
  Top = 215
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 15
    Top = 213
    Width = 425
    Height = 94
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 16
    Top = 320
    Width = 425
    Height = 97
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = ADS25
    Left = 128
    Top = 48
  end
  object ADS25: TADODataSet
    Connection = Dmcon.ADOConnection1
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
      'Data0025.SHELF_LIFE as '#29983#20135#21608#26399', data0025.reach,'#13#10'      Data0025.REV' +
      'IEW_DAYS as '#26377#25928#26399#22825#25968', Data0025.MFG_LEAD_TIME as '#21046#36896#25552#21069#26399', '#13#10'      Data' +
      '0025.ANALYSIS_CODE_3 as '#22823#26009#35268#26684', Data0025.REPORT_UNIT_VALUE1 AS '#21333#21482#37325 +
      #37327'g, '#13#10'      dbo.Data0025.OPT_LOT_SIZE as '#27969#36716#25209#37327', data0025.BARCODE_' +
      'FLAG, data0025.NOPB_flag,'#13#10'case Data0025.ONHOLD_SALES_FLAG when ' +
      '0 then '#39#26377#25928#39' when 1 then '#39#36807#26399#39' end as '#38144#21806#29366#24577', '#13#10'case Data0025.TSTATU' +
      'S'#13#10'   when 0 then '#39#24453#21046#20316#39' when 1 then '#39#24050#23457#26680#39' when 2 then '#39#23457#36864#22238#39' when' +
      ' 3 then '#39#24453#26816#26597#39#13#10'   when 4 then '#39#24453#23457#26680#39' when 5 then '#39#26816#36864#22238#39' when 6 the' +
      'n '#39#26410#25552#20132#39' end as '#23457#25209#29366#24577','#13#10'case   Data0025.ttype  when 0 then '#39#37327#20135#39' wh' +
      'en 1 then '#39#26679#26495#39'  end as '#37327#20135#26679#26495','#13#10'case Data0025.green_flag when '#39'Y'#39' ' +
      'then '#39'RoHS'#39'  else '#39#38750'RoHS'#39' end as '#29615#20445#26631#35782','#13#10'case when data0025.PAREN' +
      'T_PTR is null then '#39#22806#23618#39' ELSE '#39#20869#23618#39' end as  '#20135#21697#24615#36136','#13#10'case when ltrim' +
      '(data0025.CURRENT_REV)='#39'Y'#39' then '#39#26080#21348#32032#39' else '#39#39' end as '#21348#32032#35201#27714','#13#10'cast' +
      '(data0025.qty_bom as varchar) +'#39':'#39'+cast(qty_parentbom as varchar' +
      ') as '#25237#20135#27604#20363','#13#10'data0025.qty_bom as '#25237#20135#27604#20363#20998#23376',data0025.qty_parentbom as' +
      ' '#25237#20135#27604#20363#20998#27597#13#10'FROM dbo.Data0008 INNER JOIN'#13#10'      dbo.Data0025 ON '#13#10' ' +
      '     dbo.Data0008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN'#13#10 +
      '      dbo.Data0010 ON '#13#10'      dbo.Data0025.CUSTOMER_PTR = dbo.Da' +
      'ta0010.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_3 ON '#13#10 +
      '      dbo.Data0025.CHECK_BY_PTR = Data0005_3.RKEY LEFT OUTER JOI' +
      'N'#13#10'      dbo.Data0005 Data0005_2 ON '#13#10'      dbo.Data0025.LAST_MO' +
      'DIFIED_BY_PTR = Data0005_2.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0' +
      '005 Data0005_1 ON dbo.Data0025.AUDITED_BY_PTR = Data0005_1.RKEY'#13 +
      #10'where data0025.rkey=:BOM_PTR'
    DataSource = DataSource3
    MasterFields = 'bom_ptr'
    Parameters = <
      item
        Name = 'bom_ptr'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
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
      DisplayLabel = #26159#21542#39640#38590#24230
      FieldName = 'BARCODE_FLAG'
    end
    object ADS25NOPB_flag: TWordField
      FieldName = 'NOPB_flag'
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
    object ADS25reach: TBooleanField
      FieldName = 'reach'
    end
  end
  object ads279: TADODataSet
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT TOP 100 PERCENT '#13#10'      Data0278.PARAMETER_NAME , '#13#10'     ' +
      ' Data0278.PARAMETER_DESC,'#13#10'      Data0279.PARAMETER_VALUE ,'#13#10'   ' +
      '   Data0002.UNIT_CODE'#13#10'FROM dbo.Data0279 INNER JOIN'#13#10'      dbo.D' +
      'ata0278 ON '#13#10'      dbo.Data0279.PARAMETER_PTR = dbo.Data0278.RKE' +
      'Y INNER JOIN'#13#10'      dbo.Data0002 ON dbo.Data0278.UNIT_PTR = dbo.' +
      'Data0002.RKEY'#13#10'WHERE (Data0279.IES_PROD = 1) AND '#13#10'             ' +
      '  (data0278.status1=0) and'#13#10'               (Data0279.SOURCE_PTR ' +
      '= :rkey) and'#13#10'               (Data0279.PARAMETER_VALUE <> :value' +
      ')'#13#10'ORDER BY dbo.Data0279.IES_CRP'
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
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ads38CalcFields
    CommandText = 
      'SELECT Data0034.DEPT_CODE as '#24037#24207#20195#30721', Data0034.DEPT_NAME as '#24037#24207#21517#31216', '#13 +
      #10'      Data0038.STEP_NUMBER, Data0038.tooling_rev as '#24037#20855#29256#26412', '#13#10'   ' +
      '   Data0034.BARCODE_ENTRY_FLAG as '#36807#25968', Data0038.OUTP_SPFC as '#20135#20986', ' +
      #13#10'      Data0038.DEF_ROUT_INST as '#22791#27880', data0038.SOURCE_PTR'#13#10'FROM ' +
      'Data0038 INNER JOIN'#13#10'      Data0034 ON dbo.Data0038.DEPT_PTR = D' +
      'ata0034.RKEY'#13#10'WHERE  (Data0038.SOURCE_PTR = :BOM_PTR) '#13#10'order by' +
      ' Data0038.STEP_NUMBER'
    DataSource = DataSource3
    MasterFields = 'BOM_PTR'
    Parameters = <
      item
        Name = 'BOM_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 96
    Top = 79
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
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0278.PARAMETER_NAME, Data0278.PARAMETER_DESC, '#13#10'     ' +
      ' Data0494.PARAMETER_VALUE, Data0002.UNIT_CODE,'#13#10'      data0494.s' +
      'eq_no,data0494.step_number'#13#10'FROM dbo.Data0494 INNER JOIN'#13#10'      ' +
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
    object ads494seq_no: TSmallintField
      FieldName = 'seq_no'
    end
    object ads494step_number: TSmallintField
      FieldName = 'step_number'
    end
  end
  object ads192: TADODataSet
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'SELECT PPC_CONTROL9, ENG_CONTROL16'#13#10'FROM dbo.Data0192'
    Parameters = <>
    Left = 17
    Top = 7
    object ads192ENG_CONTROL16: TWordField
      DisplayLabel = #19981#26174#31034#20026#31354#30340#20840#23616#21442#25968
      FieldName = 'ENG_CONTROL16'
    end
    object ads192PPC_CONTROL9: TWordField
      DisplayLabel = #19981#26174#19981#20026#31354#30340#21046#31243#21442#25968#22312#20316#19994#21333#19978
      FieldName = 'PPC_CONTROL9'
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB38
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
    Template.FileName = 'D:\SJSYS\NIERP\Report\MANU_WORKORDER.RTM'
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
    Left = 200
    Top = 80
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB38'
    object ppTitleBand1: TppTitleBand
      Visible = False
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 46038
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 8996
        mmLeft = 147902
        mmTop = 529
        mmWidth = 46831
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #20840#23616#21442#25968'1'
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 41804
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
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4233
        mmLeft = 100277
        mmTop = 41804
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
        mmTop = 19579
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
        mmLeft = 75406
        mmTop = 19315
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
        mmWidth = 14139
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
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 6456
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
        mmWidth = 19473
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
        mmTop = 23813
        mmWidth = 15875
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
        mmLeft = 130969
        mmTop = 23813
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
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4826
        mmLeft = 129826
        mmTop = 529
        mmWidth = 17018
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #21442#25968#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3217
        mmLeft = 8266
        mmTop = 37571
        mmWidth = 11345
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #21442#25968#20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3217
        mmLeft = 46535
        mmTop = 37571
        mmWidth = 8509
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Weight = 0.750000000000000000
        mmHeight = 794
        mmLeft = 0
        mmTop = 41275
        mmWidth = 96044
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #21442#25968#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3217
        mmLeft = 104278
        mmTop = 37571
        mmWidth = 11345
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #21442#25968#20540
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3217
        mmLeft = 142568
        mmTop = 37571
        mmWidth = 8509
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 98425
        mmTop = 41010
        mmWidth = 98690
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
        mmHeight = 6456
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
        mmWidth = 14139
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
        mmWidth = 21209
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
        mmWidth = 17674
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
        mmLeft = 117432
        mmTop = 32808
        mmWidth = 12404
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
        mmWidth = 17738
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
        mmWidth = 14139
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
        mmWidth = 14139
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
        mmWidth = 14139
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
        mmWidth = 14139
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
        mmHeight = 6519
        mmLeft = 129117
        mmTop = 11113
        mmWidth = 26035
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
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 169334
        mmTop = 19050
        mmWidth = 14139
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
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB06'
        mmHeight = 4022
        mmLeft = 169334
        mmTop = 23813
        mmWidth = 14139
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
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
        mmTop = 794
        mmWidth = 13229
        BandType = 0
      end
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        CalcOrder = 0
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
        mmTop = 265
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
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentHeight = True
        ParentWidth = True
        Position = lpRight
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
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
        mmHeight = 3620
        mmLeft = 11642
        mmTop = 529
        mmWidth = 12700
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
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 3175
        mmLeft = 32544
        mmTop = 529
        mmWidth = 116152
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
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 529
        mmWidth = 4763
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 0
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 7408
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
        mmHeight = 5821
        mmLeft = 29633
        mmTop = 0
        mmWidth = 2381
        BandType = 4
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 8467
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 150019
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 162190
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 174625
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line201'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 5821
        mmLeft = 183886
        mmTop = 0
        mmWidth = 1588
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
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
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #25237#20135#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 74348
        mmTop = 529
        mmWidth = 15875
        BandType = 8
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #25237#20135#20154#21592
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
        mmLeft = 91017
        mmTop = 476
        mmWidth = 14139
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #25171#21360#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 143140
        mmTop = 529
        mmWidth = 15875
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 116681
        mmTop = 529
        mmWidth = 19579
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #39029#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 106098
        mmTop = 529
        mmWidth = 8731
        BandType = 8
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
        mmLeft = 159279
        mmTop = 529
        mmWidth = 32015
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #20316#19994#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 529
        mmWidth = 15875
        BandType = 8
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
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
        mmLeft = 23019
        mmTop = 476
        mmWidth = 14139
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8467
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
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          ParentHeight = True
          ParentWidth = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = #24037#24207#21517#31216
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 9525
          mmTop = 529
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = #21046#31243#21442#25968
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 57415
          mmTop = 529
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = #27493#39588
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 529
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'Line31'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5292
          mmLeft = 7408
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
          mmHeight = 5292
          mmLeft = 29633
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5292
          mmLeft = 150019
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5292
          mmLeft = 162190
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5292
          mmLeft = 174625
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5292
          mmLeft = 183886
          mmTop = 0
          mmWidth = 2381
          BandType = 3
          GroupNo = 0
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = #25805#20316#20154
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 150813
          mmTop = 529
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = #25253#24223
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 163248
          mmTop = 529
          mmWidth = 5556
          BandType = 3
          GroupNo = 0
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          Caption = 'QC/QA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 175684
          mmTop = 529
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppLabel34: TppLabel
          UserName = 'Label34'
          Caption = #23436#25104#26102#38388
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 184944
          mmTop = 529
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
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
          GroupNo = 0
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
            PrinterSetup.mmMarginTop = 2000
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
                Font.Name = #23435#20307
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
        mmHeight = 9525
        mmPrintPosition = 0
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ParentPrinterSetup = False
          TraverseAllData = False
          DataPipelineName = 'ppDB30'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppDB30
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
            Units = utMillimeters
            Version = '7.01'
            mmColumnWidth = 0
            DataPipelineName = 'ppDB30'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppHeaderBand2: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand2: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5027
              mmPrintPosition = 0
              object ppLine13: TppLine
                UserName = 'Line13'
                ParentHeight = True
                ParentWidth = True
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 4
              end
              object ppLine35: TppLine
                UserName = 'Line35'
                ParentWidth = True
                Position = lpBottom
                Weight = 0.750000000000000000
                mmHeight = 1323
                mmLeft = 0
                mmTop = 3704
                mmWidth = 197300
                BandType = 4
              end
              object ppLine36: TppLine
                UserName = 'Line36'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 0
                mmTop = 0
                mmWidth = 265
                BandType = 4
              end
              object ppLine37: TppLine
                UserName = 'Line37'
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 197115
                mmTop = 0
                mmWidth = 19844
                BandType = 4
              end
              object ppLine38: TppLine
                UserName = 'Line38'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 6615
                mmTop = 0
                mmWidth = 14288
                BandType = 4
              end
              object ppLine39: TppLine
                UserName = 'Line39'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 15346
                mmTop = 0
                mmWidth = 14817
                BandType = 4
              end
              object ppLine40: TppLine
                UserName = 'Line40'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 22754
                mmTop = 0
                mmWidth = 16933
                BandType = 4
              end
              object ppLine41: TppLine
                UserName = 'Line41'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 34131
                mmTop = 0
                mmWidth = 15081
                BandType = 4
              end
              object ppLine42: TppLine
                UserName = 'Line42'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 48419
                mmTop = 0
                mmWidth = 19050
                BandType = 4
              end
              object ppLine43: TppLine
                UserName = 'Line43'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 61913
                mmTop = 0
                mmWidth = 15610
                BandType = 4
              end
              object ppLine44: TppLine
                UserName = 'Line44'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 76465
                mmTop = 0
                mmWidth = 28310
                BandType = 4
              end
              object ppLine45: TppLine
                UserName = 'Line45'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 91281
                mmTop = 0
                mmWidth = 23548
                BandType = 4
              end
              object ppLine46: TppLine
                UserName = 'Line46'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 109009
                mmTop = 0
                mmWidth = 17992
                BandType = 4
              end
              object ppLine47: TppLine
                UserName = 'Line47'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 122502
                mmTop = 0
                mmWidth = 24871
                BandType = 4
              end
              object ppLine48: TppLine
                UserName = 'Line48'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 143404
                mmTop = 0
                mmWidth = 23283
                BandType = 4
              end
              object ppLine49: TppLine
                UserName = 'Line49'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5027
                mmLeft = 166688
                mmTop = 0
                mmWidth = 17727
                BandType = 4
              end
              object ppDBText10: TppDBText
                UserName = 'DBText10'
                DataField = #24207#21495
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 794
                mmTop = 794
                mmWidth = 4763
                BandType = 4
              end
              object ppDBText21: TppDBText
                UserName = 'DBText21'
                DataField = #31867#22411
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 7408
                mmTop = 794
                mmWidth = 6879
                BandType = 4
              end
              object ppDBText29: TppDBText
                UserName = 'DBText29'
                DataField = #23618#27425
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 15875
                mmTop = 794
                mmWidth = 6350
                BandType = 4
              end
              object ppDBText30: TppDBText
                UserName = 'DBText30'
                DataField = #21442#32771#23618
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 23548
                mmTop = 529
                mmWidth = 10319
                BandType = 4
              end
              object ppDBText31: TppDBText
                UserName = 'DBText31'
                DataField = #23458#25143#32447#23485
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 34660
                mmTop = 794
                mmWidth = 13494
                BandType = 4
              end
              object ppDBText32: TppDBText
                UserName = 'DBText32'
                DataField = #23458#25143#32447#36317
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 48683
                mmTop = 794
                mmWidth = 12171
                BandType = 4
              end
              object ppDBText33: TppDBText
                UserName = 'DBText33'
                DataField = #35843#25972#32447#23485
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 62177
                mmTop = 794
                mmWidth = 12965
                BandType = 4
              end
              object ppDBText34: TppDBText
                UserName = 'DBText34'
                DataField = #35843#25972#32447#36317
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 77258
                mmTop = 794
                mmWidth = 13758
                BandType = 4
              end
              object ppDBText35: TppDBText
                UserName = 'DBText35'
                DataField = #32511#27833#21069#38459#25239
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 91811
                mmTop = 794
                mmWidth = 16669
                BandType = 4
              end
              object ppDBText36: TppDBText
                UserName = 'DBText36'
                DataField = #25104#21697#38459#25239
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 109538
                mmTop = 529
                mmWidth = 12700
                BandType = 4
              end
              object ppDBText37: TppDBText
                UserName = 'DBText37'
                DataField = #38459#25239#25511#21046#33539#22260
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 124619
                mmTop = 529
                mmWidth = 17198
                BandType = 4
              end
              object ppDBText38: TppDBText
                UserName = 'DBText38'
                DataField = #21407#22987#21040#38108#30382#36317#31163
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 143934
                mmTop = 529
                mmWidth = 21696
                BandType = 4
              end
              object ppDBText39: TppDBText
                UserName = 'DBText39'
                DataField = #35843#25972#21518#21040#38108#36317#31163
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3704
                mmLeft = 169863
                mmTop = 794
                mmWidth = 17198
                BandType = 4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup1: TppGroup
              BreakName = 'ppLabel24'
              BreakType = btCustomField
              OutlineSettings.CreateNode = True
              NewPage = True
              UserName = 'Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = ''
              object ppGroupHeaderBand1: TppGroupHeaderBand
                PrintHeight = phDynamic
                mmBottomOffset = 0
                mmHeight = 11906
                mmPrintPosition = 0
                object ppLabel24: TppLabel
                  UserName = 'Label24'
                  Caption = #38459#25239#34920
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 14
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 5556
                  mmLeft = 95250
                  mmTop = 794
                  mmWidth = 14817
                  BandType = 3
                  GroupNo = 0
                end
                object ppShape4: TppShape
                  UserName = 'Shape4'
                  ParentWidth = True
                  mmHeight = 5292
                  mmLeft = 0
                  mmTop = 6614
                  mmWidth = 197300
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine15: TppLine
                  UserName = 'Line15'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5292
                  mmLeft = 6879
                  mmTop = 6614
                  mmWidth = 6350
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine22: TppLine
                  UserName = 'Line22'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5027
                  mmLeft = 15346
                  mmTop = 6879
                  mmWidth = 16404
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine23: TppLine
                  UserName = 'Line23'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5027
                  mmLeft = 22754
                  mmTop = 6879
                  mmWidth = 17463
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine24: TppLine
                  UserName = 'Line24'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5292
                  mmLeft = 33602
                  mmTop = 6614
                  mmWidth = 19844
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine25: TppLine
                  UserName = 'Line25'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5292
                  mmLeft = 48154
                  mmTop = 6614
                  mmWidth = 20902
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine26: TppLine
                  UserName = 'Line26'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5027
                  mmLeft = 62177
                  mmTop = 6879
                  mmWidth = 28840
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine27: TppLine
                  UserName = 'Line27'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5027
                  mmLeft = 76200
                  mmTop = 6879
                  mmWidth = 38100
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine28: TppLine
                  UserName = 'Line28'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5292
                  mmLeft = 91017
                  mmTop = 6614
                  mmWidth = 42333
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine29: TppLine
                  UserName = 'Line29'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5292
                  mmLeft = 108479
                  mmTop = 6614
                  mmWidth = 14288
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine30: TppLine
                  UserName = 'Line30'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5292
                  mmLeft = 122502
                  mmTop = 6614
                  mmWidth = 33602
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine32: TppLine
                  UserName = 'Line32'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 4763
                  mmLeft = 142875
                  mmTop = 6615
                  mmWidth = 29104
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine34: TppLine
                  UserName = 'Line34'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 5292
                  mmLeft = 166688
                  mmTop = 6614
                  mmWidth = 27252
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel37: TppLabel
                  UserName = 'Label37'
                  Caption = #24207#21495
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 265
                  mmTop = 7673
                  mmWidth = 6350
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel38: TppLabel
                  UserName = 'Label38'
                  Caption = #31867#22411
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 8202
                  mmTop = 7408
                  mmWidth = 6350
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel39: TppLabel
                  UserName = 'Label39'
                  Caption = #23618#27425
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 15875
                  mmTop = 7938
                  mmWidth = 6350
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel40: TppLabel
                  UserName = 'Label40'
                  Caption = #21442#32771#23618
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 23813
                  mmTop = 7673
                  mmWidth = 9525
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel41: TppLabel
                  UserName = 'Label41'
                  Caption = #23458#25143#32447#23485
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3620
                  mmLeft = 34660
                  mmTop = 7938
                  mmWidth = 12700
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel42: TppLabel
                  UserName = 'Label42'
                  Caption = #23458#25143#32447#36317
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 48948
                  mmTop = 7408
                  mmWidth = 12700
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel43: TppLabel
                  UserName = 'Label43'
                  Caption = #35843#25972#32447#23485
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3620
                  mmLeft = 63236
                  mmTop = 7144
                  mmWidth = 12700
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel44: TppLabel
                  UserName = 'Label44'
                  Caption = #35843#25972#32447#36317
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3440
                  mmLeft = 77523
                  mmTop = 7408
                  mmWidth = 12700
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel45: TppLabel
                  UserName = 'Label45'
                  Caption = #32511#27833#21069#38459#25239
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3620
                  mmLeft = 91811
                  mmTop = 7408
                  mmWidth = 15875
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel46: TppLabel
                  UserName = 'Label46'
                  Caption = #25104#21697#38459#25239
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3620
                  mmLeft = 109009
                  mmTop = 7408
                  mmWidth = 12700
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel47: TppLabel
                  UserName = 'Label47'
                  Caption = #38459#25239#25511#21046#33539#22260
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 123296
                  mmTop = 7408
                  mmWidth = 19050
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel48: TppLabel
                  UserName = 'Label48'
                  Caption = #21407#22987#21040#38108#30382#36317#31163
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 143669
                  mmTop = 7673
                  mmWidth = 22225
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel49: TppLabel
                  UserName = 'Label49'
                  Caption = #35843#25972#21518#21040#38108#36317#31163
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 9
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3620
                  mmLeft = 167482
                  mmTop = 7673
                  mmWidth = 22225
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
            object raCodeModule2: TraCodeModule
              ProgramStream = {00}
            end
          end
        end
        object ppLabel35: TppLabel
          UserName = 'Label35'
          Caption = #35746#21333#21442#32771':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 1323
          mmWidth = 12700
          BandType = 5
          GroupNo = 1
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = #38468#21152#21442#32771
          DataPipeline = ppDB06
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppDB06'
          mmHeight = 3175
          mmLeft = 18521
          mmTop = 1323
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
        end
        object ppDBMemo4: TppDBMemo
          UserName = 'DBMemo4'
          CharWrap = False
          DataField = #21152#24037#25351#31034
          DataPipeline = ppDB25
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Stretch = True
          Transparent = True
          DataPipelineName = 'ppDB25'
          mmHeight = 3440
          mmLeft = 18521
          mmTop = 5292
          mmWidth = 162984
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object ppLabel36: TppLabel
          UserName = 'Label36'
          Caption = #21152#24037#25351#31034':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 3440
          mmTop = 5027
          mmWidth = 14288
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365148400000070726F636564757265205661
        726961626C65314F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A0D0A2020696620444233385B27E8BF87E695B0275D
        3D20275927207468656E0D0A202076616C75653A3D272A270D0A2020656C7365
        0D0A202076616C75653A3D27273B0D0A0D0A656E643B0D0A0D436F6D706F6E65
        6E744E616D6506095661726961626C6531094576656E744E616D6506064F6E43
        616C63074576656E74494402210001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D65060F5661726961626C65334F6E43616C630B5072
        6F6772616D54797065070B747450726F63656475726506536F757263650C0A01
        000070726F636564757265205661726961626C65334F6E43616C632876617220
        56616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A2020696620
        444230365B275050435F464C4147275D3D31207468656E0D0A202020696D6167
        65322E76697369626C653A3D747275650D0A2020656C73650D0A202020696D61
        6765322E76697369626C653A3D66616C73653B0D0A20202020200D0A20202020
        200D0A696620444232355B27424152434F44455F464C4147275D203D31207468
        656E0D0A0D0A202020696D616765312E76697369626C653A3D747275650D0A20
        20656C73650D0A202020696D616765312E76697369626C653A3D66616C73653B
        20200D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65060956617269
        61626C6533094576656E744E616D6506064F6E43616C63074576656E74494402
        210000}
    end
  end
  object ppDB38: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB38'
    Left = 160
    Top = 79
    MasterDataPipelineName = 'ppDB06'
    object ppDB38ppField1: TppField
      FieldAlias = #24037#24207#20195#30721
      FieldName = #24037#24207#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object ppDB38ppField2: TppField
      FieldAlias = #24037#24207#21517#31216
      FieldName = #24037#24207#21517#31216
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object ppDB38ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'STEP_NUMBER'
      FieldName = 'STEP_NUMBER'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDB38ppField4: TppField
      FieldAlias = #24037#20855#29256#26412
      FieldName = #24037#20855#29256#26412
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDB38ppField5: TppField
      FieldAlias = #36807#25968
      FieldName = #36807#25968
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppDB38ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #20135#20986
      FieldName = #20135#20986
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 20
      Position = 5
    end
    object ppDB38ppField7: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 400
      DisplayWidth = 400
      Position = 6
    end
    object ppDB38ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SOURCE_PTR'
      FieldName = 'SOURCE_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDB38ppField9: TppField
      FieldAlias = #24037#33402#21442#25968
      FieldName = #24037#33402#21442#25968
      FieldLength = 2000
      DisplayWidth = 2000
      Position = 8
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
    object ppDB25ppField1: TppField
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField2: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = #26412#21378#32534#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField3: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = #23458#25143#22411#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField4: TppField
      FieldAlias = #23458#25143#20195#30721
      FieldName = #23458#25143#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField5: TppField
      FieldAlias = #23458#25143#21517#31216
      FieldName = #23458#25143#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField6: TppField
      FieldAlias = #23458#25143#31616#31216
      FieldName = #23458#25143#31616#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField7: TppField
      FieldAlias = #31867#22411#20195#30721
      FieldName = #31867#22411#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField8: TppField
      FieldAlias = #31867#22411#21517#31216
      FieldName = #31867#22411#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField9: TppField
      FieldAlias = #26816#26597#20154#21592
      FieldName = #26816#26597#20154#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField10: TppField
      FieldAlias = #26816#26597#26085#26399
      FieldName = #26816#26597#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField11: TppField
      FieldAlias = #23457#26680#20154#21592
      FieldName = #23457#26680#20154#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField12: TppField
      FieldAlias = #23457#26680#26085#26399
      FieldName = #23457#26680#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField13: TppField
      FieldAlias = #20462#35746#20154#21592
      FieldName = #20462#35746#20154#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField14: TppField
      FieldAlias = #20462#35746#26085#26399
      FieldName = #20462#35746#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField15: TppField
      FieldAlias = #26679#26495#32534#21495
      FieldName = #26679#26495#32534#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField16: TppField
      FieldAlias = #23458#25143#29289#26009#21495
      FieldName = #23458#25143#29289#26009#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField17: TppField
      FieldAlias = #23618#25968
      FieldName = #23618#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField18: TppField
      FieldAlias = #20132#36135#23610#23544'SET'
      FieldName = #20132#36135#23610#23544'SET'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField19: TppField
      FieldAlias = #21333#21482#23610#23544'PCS'
      FieldName = #21333#21482#23610#23544'PCS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField20: TppField
      FieldAlias = #25340#29256#23610#23544'SPEL'
      FieldName = #25340#29256#23610#23544'SPEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField21: TppField
      FieldAlias = #21333#21482#38754#31215'PCS'
      FieldName = #21333#21482#38754#31215'PCS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField22: TppField
      FieldAlias = #21333#21482#38754#31215'SET'
      FieldName = #21333#21482#38754#31215'SET'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField23: TppField
      FieldAlias = #21333#21482#38754#31215'SPEL'
      FieldName = #21333#21482#38754#31215'SPEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField24: TppField
      FieldAlias = #23618#21387#32467#26500
      FieldName = #23618#21387#32467#26500
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField25: TppField
      FieldAlias = #21152#24037#25351#31034
      FieldName = #21152#24037#25351#31034
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField26: TppField
      FieldAlias = #24037#31243#22791#27880
      FieldName = #24037#31243#22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField27: TppField
      FieldAlias = #25253#24223#29575
      FieldName = #25253#24223#29575
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField28: TppField
      FieldAlias = #29983#20135#21608#26399
      FieldName = #29983#20135#21608#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField29: TppField
      FieldAlias = #26377#25928#26399#22825#25968
      FieldName = #26377#25928#26399#22825#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField30: TppField
      FieldAlias = #21046#36896#25552#21069#26399
      FieldName = #21046#36896#25552#21069#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField31: TppField
      FieldAlias = #22823#26009#35268#26684
      FieldName = #22823#26009#35268#26684
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField32: TppField
      FieldAlias = #21333#21482#37325#37327'g'
      FieldName = #21333#21482#37325#37327'g'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField33: TppField
      FieldAlias = #27969#36716#25209#37327
      FieldName = #27969#36716#25209#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField34: TppField
      FieldAlias = #38144#21806#29366#24577
      FieldName = #38144#21806#29366#24577
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField35: TppField
      FieldAlias = #23457#25209#29366#24577
      FieldName = #23457#25209#29366#24577
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField36: TppField
      FieldAlias = #37327#20135#26679#26495
      FieldName = #37327#20135#26679#26495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField37: TppField
      FieldAlias = #29615#20445#26631#35782
      FieldName = #29615#20445#26631#35782
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField38: TppField
      FieldAlias = #20135#21697#24615#36136
      FieldName = #20135#21697#24615#36136
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField39: TppField
      FieldAlias = #20840#23616#21442#25968'1'
      FieldName = #20840#23616#21442#25968'1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField40: TppField
      FieldAlias = #20840#23616#21442#25968'2'
      FieldName = #20840#23616#21442#25968'2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField41: TppField
      FieldAlias = #21348#32032#35201#27714
      FieldName = #21348#32032#35201#27714
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField42: TppField
      FieldAlias = 'BARCODE_FLAG'
      FieldName = 'BARCODE_FLAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField43: TppField
      FieldAlias = 'NOPB_flag'
      FieldName = 'NOPB_flag'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField44: TppField
      FieldAlias = #25237#20135#27604#20363
      FieldName = #25237#20135#27604#20363
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField45: TppField
      FieldAlias = #25237#20135#27604#20363#20998#23376
      FieldName = #25237#20135#27604#20363#20998#23376
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField46: TppField
      FieldAlias = #25237#20135#27604#20363#20998#27597
      FieldName = #25237#20135#27604#20363#20998#27597
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField47: TppField
      FieldAlias = 'reach'
      FieldName = 'reach'
      FieldLength = 10
      DisplayWidth = 10
      Position = 46
    end
  end
  object ads493: TADODataSet
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 96
    Top = 112
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
    Top = 112
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource5
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 112
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 50
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
    Left = 200
    Top = 112
  end
  object ads06: TADODataSet
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT     dbo.Data0006.WORK_ORDER_NUMBER AS '#20316#19994#21333#21495', '#13#10'      dbo.D' +
      'ata0006.CUT_NO AS '#25237#20135#21333#21495', dbo.Data0060.SALES_ORDER AS '#38144#21806#35746#21333', '#13#10'    ' +
      '  dbo.Data0060.REFERENCE_NUMBER AS '#35746#21333#21442#32771', dbo.Data0006.BOM_PTR,'#13#10 +
      '      dbo.Data0060.SCH_DATE AS '#22238#22797#20132#26399', data0006.LOT_NUMBER as '#25237#20135#25209#21495 +
      ','#13#10'      dbo.data0492.SCH_COMPL_DATE AS '#35745#21010#23436#24037#26085#26399','#13#10'      dbo.Data0' +
      '060.PARTS_ORDERED AS '#35746#21333#25968#37327', dbo.data0492.PLANNED_QTY AS '#35745#21010#25968#37327', '#13#10' ' +
      '     dbo.data0492.ISSUED_QTY AS '#25237#20135#25968#37327', dbo.data0492.ISSUE_DATE AS' +
      ' '#25237#20135#26085#26399', '#13#10'      dbo.Data0005.EMPLOYEE_NAME AS '#25237#20135#20154#21592', data0492.UPAN' +
      'EL1 as A'#26495'PCS'#25968','#13#10'      dbo.Data0006.PANELS AS PAN'#25968#37327', dbo.Data0006' +
      '.PARTS_PER_PANEL AS '#27599'PANPCS'#25968', '#13#10'      dbo.Data0006.QUAN_SCH AS '#20316 +
      #19994#21333#25968#37327', data0492.UPANEL2 as B'#26495'PCS'#25968','#13#10'       CASE data0492.TTYPE WH' +
      'EN 0 THEN '#39#27491#24120#25237#20135#39' WHEN 1 THEN '#39#34917#26009#25237#20135#39' '#13#10'       WHEN 2 THEN '#39#25353'MRB'#37325#25237 +
      #39' WHEN 3 THEN '#39#25353'MRB'#36820#20462#39' WHEN 4 THEN '#39#25353#26495#21495#25237#20135#39#13#10'        END AS '#25237#20135#31867#22411',' +
      ' dbo.Data0006.PRIORITY_CODE AS '#20248#20808#32423#21035', '#13#10'       dbo.Data0060.so_ol' +
      'dnew AS '#35746#21333#26032#26087', dbo.Data0060.FOB AS '#21512#21516#21495', '#13#10'       Data0097.PO_NUMB' +
      'ER AS '#23458#25143#35746#21333#21495', data0492.PANEL_1_QTY AS PnlA'#25237#20135#25968#37327', '#13#10'       data0492' +
      '.PANEL_2_QTY AS PnlB'#25237#20135#25968#37327', PPC_FLAG,'#13#10'       Data0015.WAREHOUSE_C' +
      'ODE AS '#24037#21378#20195#30721', Data0015.ABBR_NAME AS '#24037#21378#31616#31216','#13#10'       data0492.remark' +
      ' as '#25237#20135#22791#27880',data0492.analysis_code_3 as '#25237#20135#22823#26009#35268#26684#13#10'FROM         dbo.Da' +
      'ta0015 INNER JOIN'#13#10'       dbo.Data0006 INNER JOIN'#13#10'       dbo.da' +
      'ta0492 ON dbo.Data0006.CUT_NO = dbo.data0492.CUT_NO INNER JOIN'#13#10 +
      '       dbo.Data0005 ON dbo.data0492.CREATED_BY_PTR = dbo.Data000' +
      '5.RKEY ON '#13#10'       dbo.Data0015.RKEY = dbo.data0492.WHOUSE_PTR L' +
      'EFT OUTER JOIN'#13#10'       dbo.Data0097 RIGHT OUTER JOIN'#13#10'       dbo' +
      '.Data0060 ON dbo.Data0097.RKEY = dbo.Data0060.PURCHASE_ORDER_PTR' +
      ' '#13#10'       ON dbo.data0492.SO_NO = dbo.Data0060.SALES_ORDER'#13#10'WHER' +
      'E Data0006.rkey  =:rkey06'
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
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB06'
    Left = 160
    Top = 16
    object ppDB06ppField1: TppField
      FieldAlias = #20316#19994#21333#21495
      FieldName = #20316#19994#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField2: TppField
      FieldAlias = #25237#20135#21333#21495
      FieldName = #25237#20135#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField3: TppField
      FieldAlias = #38144#21806#35746#21333
      FieldName = #38144#21806#35746#21333
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField4: TppField
      FieldAlias = #35746#21333#21442#32771
      FieldName = #35746#21333#21442#32771
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField5: TppField
      FieldAlias = #22238#22797#20132#26399
      FieldName = #22238#22797#20132#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField6: TppField
      FieldAlias = #35745#21010#23436#24037#26085#26399
      FieldName = #35745#21010#23436#24037#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField7: TppField
      FieldAlias = #35746#21333#25968#37327
      FieldName = #35746#21333#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField8: TppField
      FieldAlias = #35745#21010#25968#37327
      FieldName = #35745#21010#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField9: TppField
      FieldAlias = #25237#20135#25968#37327
      FieldName = #25237#20135#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField10: TppField
      FieldAlias = #25237#20135#26085#26399
      FieldName = #25237#20135#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField11: TppField
      FieldAlias = #25237#20135#20154#21592
      FieldName = #25237#20135#20154#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField12: TppField
      FieldAlias = 'PAN'#25968#37327
      FieldName = 'PAN'#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField13: TppField
      FieldAlias = #27599'PANPCS'#25968
      FieldName = #27599'PANPCS'#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField14: TppField
      FieldAlias = #20316#19994#21333#25968#37327
      FieldName = #20316#19994#21333#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField15: TppField
      FieldAlias = #25237#20135#31867#22411
      FieldName = #25237#20135#31867#22411
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField16: TppField
      FieldAlias = #20248#20808#32423#21035
      FieldName = #20248#20808#32423#21035
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField17: TppField
      FieldAlias = #35746#21333#26032#26087
      FieldName = #35746#21333#26032#26087
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField18: TppField
      FieldAlias = #21512#21516#21495
      FieldName = #21512#21516#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField19: TppField
      FieldAlias = #23458#25143#35746#21333#21495
      FieldName = #23458#25143#35746#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField20: TppField
      FieldAlias = 'PnlA'#25237#20135#25968#37327
      FieldName = 'PnlA'#25237#20135#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField21: TppField
      FieldAlias = 'PnlB'#25237#20135#25968#37327
      FieldName = 'PnlB'#25237#20135#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField22: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = #24037#21378#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField23: TppField
      FieldAlias = #24037#21378#31616#31216
      FieldName = #24037#21378#31616#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField24: TppField
      FieldAlias = 'BOM_PTR'
      FieldName = 'BOM_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField25: TppField
      FieldAlias = 'PPC_FLAG'
      FieldName = 'PPC_FLAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField26: TppField
      FieldAlias = 'A'#26495'PCS'#25968
      FieldName = 'A'#26495'PCS'#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField27: TppField
      FieldAlias = 'B'#26495'PCS'#25968
      FieldName = 'B'#26495'PCS'#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField28: TppField
      FieldAlias = #25237#20135#22791#27880
      FieldName = #25237#20135#22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField29: TppField
      FieldAlias = #25237#20135#22823#26009#35268#26684
      FieldName = #25237#20135#22823#26009#35268#26684
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB06ppField30: TppField
      FieldAlias = #25237#20135#25209#21495
      FieldName = #25237#20135#25209#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
  end
  object ADS30: TADODataSet
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select SEQ_NO as '#39#24207#21495#39', type as '#39#31867#22411#39', layer as '#39#23618#27425#39', refe_layer a' +
      's '#39#21442#32771#23618#39', line_width as '#39#23458#25143#32447#23485#39', line_ofsight as '#39#23458#25143#32447#36317#39','#13#10'adjust_l' +
      'inewidth as '#39#35843#25972#32447#23485#39', adjust_lineofsight as '#39#35843#25972#32447#36317#39', adjust_impedan' +
      'ce as '#39#32511#27833#21069#38459#25239#39', product_impedance as '#39#25104#21697#38459#25239#39', '#13#10'impedance_scope as' +
      ' '#39#38459#25239#25511#21046#33539#22260#39', orig_juli as '#39#21407#22987#21040#38108#30382#36317#31163#39', adjust_jiuli as '#39#35843#25972#21518#21040#38108#36317#31163#39' , s' +
      'ource_ptr from DATA0030'#13#10'where  source_ptr=:BOM_PTR'#13#10'order by SE' +
      'Q_NO'
    DataSource = DataSource3
    IndexFieldNames = 'source_ptr'
    MasterFields = 'BOM_PTR'
    Parameters = <
      item
        Name = 'BOM_PTR'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    Left = 96
    Top = 144
    object ADS30DSDesigner: TSmallintField
      FieldName = #24207#21495
    end
    object ADS30DSDesigner2: TStringField
      FieldName = #31867#22411
      Size = 8
    end
    object ADS30DSDesigner3: TStringField
      FieldName = #23618#27425
      Size = 5
    end
    object ADS30DSDesigner4: TStringField
      FieldName = #21442#32771#23618
      Size = 10
    end
    object ADS30DSDesigner5: TStringField
      FieldName = #23458#25143#32447#23485
      Size = 10
    end
    object ADS30DSDesigner6: TBCDField
      FieldName = #23458#25143#32447#36317
      Precision = 5
      Size = 2
    end
    object ADS30DSDesigner7: TBCDField
      FieldName = #35843#25972#32447#23485
      Precision = 5
      Size = 2
    end
    object ADS30DSDesigner8: TBCDField
      FieldName = #35843#25972#32447#36317
      Precision = 5
      Size = 2
    end
    object ADS30DSDesigner9: TStringField
      FieldName = #32511#27833#21069#38459#25239
      Size = 10
    end
    object ADS30DSDesigner10: TStringField
      FieldName = #25104#21697#38459#25239
      Size = 10
    end
    object ADS30DSDesigner11: TStringField
      FieldName = #38459#25239#25511#21046#33539#22260
    end
    object ADS30DSDesigner12: TBCDField
      FieldName = #21407#22987#21040#38108#30382#36317#31163
      Precision = 8
      Size = 3
    end
    object ADS30DSDesigner13: TBCDField
      FieldName = #35843#25972#21518#21040#38108#36317#31163
      Precision = 8
      Size = 3
    end
    object ADS30source_ptr: TIntegerField
      FieldName = 'source_ptr'
    end
  end
  object DataSource4: TDataSource
    DataSet = ADS30
    Left = 128
    Top = 144
  end
  object ppDB30: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DB30'
    Left = 160
    Top = 144
    object ppDB30ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = #24207#21495
      FieldName = #24207#21495
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDB30ppField2: TppField
      FieldAlias = #31867#22411
      FieldName = #31867#22411
      FieldLength = 8
      DisplayWidth = 8
      Position = 1
    end
    object ppDB30ppField3: TppField
      FieldAlias = #23618#27425
      FieldName = #23618#27425
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object ppDB30ppField4: TppField
      FieldAlias = #21442#32771#23618
      FieldName = #21442#32771#23618
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDB30ppField5: TppField
      FieldAlias = #23458#25143#32447#23485
      FieldName = #23458#25143#32447#23485
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object ppDB30ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #23458#25143#32447#36317
      FieldName = #23458#25143#32447#36317
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 6
      Position = 5
    end
    object ppDB30ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = #35843#25972#32447#23485
      FieldName = #35843#25972#32447#23485
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 6
      Position = 6
    end
    object ppDB30ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = #35843#25972#32447#36317
      FieldName = #35843#25972#32447#36317
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 6
      Position = 7
    end
    object ppDB30ppField9: TppField
      FieldAlias = #32511#27833#21069#38459#25239
      FieldName = #32511#27833#21069#38459#25239
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object ppDB30ppField10: TppField
      FieldAlias = #25104#21697#38459#25239
      FieldName = #25104#21697#38459#25239
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppDB30ppField11: TppField
      FieldAlias = #38459#25239#25511#21046#33539#22260
      FieldName = #38459#25239#25511#21046#33539#22260
      FieldLength = 20
      DisplayWidth = 20
      Position = 10
    end
    object ppDB30ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = #21407#22987#21040#38108#30382#36317#31163
      FieldName = #21407#22987#21040#38108#30382#36317#31163
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 9
      Position = 11
    end
    object ppDB30ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = #35843#25972#21518#21040#38108#36317#31163
      FieldName = #35843#25972#21518#21040#38108#36317#31163
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 9
      Position = 12
    end
    object ppDB30ppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'source_ptr'
      FieldName = 'source_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 13
    end
  end
end
