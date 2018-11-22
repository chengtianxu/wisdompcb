object Form_report: TForm_report
  Left = 512
  Top = 271
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#34920#25968#25454#23450#20041
  ClientHeight = 445
  ClientWidth = 472
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
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = ADS25CalcFields
    CommandText = 
      #13#10'SELECT Data0025.RKEY,data0025.grade_code as '#31561#32423#25351#31034', Data0025.MAN' +
      'U_PART_NUMBER as '#26412#21378#32534#21495', '#13#10'      Data0025.MANU_PART_DESC as '#23458#25143#22411#21495',D' +
      'ata0010.CUST_CODE AS '#23458#25143#20195#30721', '#13#10'      Data0010.CUSTOMER_NAME AS '#23458#25143#21517 +
      #31216', Data0010.ABBR_NAME AS '#23458#25143#31616#31216', '#13#10'      Data0008.PROD_CODE AS '#31867#22411#20195 +
      #30721', Data0008.PRODUCT_NAME AS '#31867#22411#21517#31216', '#13#10'      Data0005_3.EMPLOYEE_NA' +
      'ME AS '#26816#26597#20154#21592', Data0025.CHECK_DATE AS '#26816#26597#26085#26399', '#13#10'      Data0005_1.EMPL' +
      'OYEE_NAME AS '#23457#26680#20154#21592',Data0025.AUDITED_DATE AS '#23457#26680#26085#26399', '#13#10'      Data000' +
      '5_2.EMPLOYEE_NAME AS '#20462#35746#20154#21592',Data0025.LAST_MODIFIED_DATE AS '#20462#35746#26085#26399','#13#10 +
      '     Data0025.SAMPLE_NR AS '#26679#26495#32534#21495',Data0025.ANALYSIS_CODE_2 AS '#23458#25143#29289#26009 +
      #21495', '#13#10'Data0025.LAYERS AS '#23618#25968',Data0025.ANALYSIS_CODE_1 AS '#20132#36135#23610#23544'SET, ' +
      #13#10'Data0025.ANALYSIS_CODE_5 AS '#21333#21482#23610#23544'PCS, Data0025.ANALYSIS_CODE_4 ' +
      'AS '#25340#29256#23610#23544'SPEL, '#13#10'Data0025.pcs_sq AS '#21333#21482#38754#31215'PCS, Data0025.unit_sq AS '#21333 +
      #21482#38754#31215'SET, '#13#10'Data0025.spell_sq AS '#21333#21482#38754#31215'SPEL, Data0025.layers_info AS' +
      ' '#23618#21387#32467#26500', data0025.layers_image as '#21387#21512#22270#29255','#13#10'Data0025.REMARK as '#21152#24037#25351#31034',D' +
      'ata0025.ENG_NOTE as '#24037#31243#22791#27880', data0025.barcode_flag,'#13#10'Data0025.EST_S' +
      'CRAP as '#25253#24223#29575' , Data0025.SHELF_LIFE as '#29983#20135#21608#26399', data0025.NOPB_flag,'#13#10 +
      '      Data0025.REVIEW_DAYS as '#26377#25928#26399#22825#25968', Data0025.MFG_LEAD_TIME as '#21046 +
      #36896#25552#21069#26399', '#13#10'      Data0025.ANALYSIS_CODE_3 as '#22823#26009#35268#26684', Data0025.REPORT_' +
      'UNIT_VALUE1 AS '#21333#21482#37325#37327'g, '#13#10'      dbo.Data0025.OPT_LOT_SIZE as '#27969#36716#25209#37327',' +
      'data0025.QTY_BOM as '#21387#21512#27604#20363','#13#10'case Data0025.ONHOLD_SALES_FLAG when ' +
      '0 then '#39#26377#25928#39' when 1 then '#39#36807#26399#39' end as '#38144#21806#29366#24577', '#13#10'case Data0025.TSTATU' +
      'S'#13#10'   when 0 then '#39#24453#21046#20316#39' when 1 then '#39#24050#23457#26680#39' when 2 then '#39#23457#36864#22238#39' when' +
      ' 3 then '#39#24453#26816#26597#39#13#10'   when 4 then '#39#24453#23457#26680#39' when 5 then '#39#26816#36864#22238#39' when 6 the' +
      'n '#39#26410#25552#20132#39' end as '#23457#25209#29366#24577','#13#10'case   Data0025.ttype  when 0 then '#39#37327#20135#39' wh' +
      'en 1 then '#39#26679#26495#39'  end as '#37327#20135#26679#26495','#13#10'case Data0025.green_flag when '#39'Y'#39' ' +
      'then '#39'4G'#26631#35782#39'  else '#39' '#39' end as '#26631#35782'4G,'#13#10'case when data0025.PARENT_PT' +
      'R is null then '#39#22806#23618#39' ELSE '#39#20869#23618#39' end as  '#20135#21697#24615#36136','#13#10'case when ltrim(dat' +
      'a0025.CURRENT_REV)='#39'Y'#39' then '#39#26080#21348#32032#39' else '#39#39' end as '#21348#32032#35201#27714','#13#10'case whe' +
      'n ltrim(data0025.amp_mb)='#39'Y'#39' then '#39#21151#25918#26495#39' else '#39#39' end as '#21151#25918#26495','#13#10'cas' +
      'e when data0025.REACH=1 then '#39'REACH'#35201#27714#39' else '#39#39' end as REACH,'#13#10'da' +
      'ta0025.flod_number as '#38075#23380#21472#26495#25968',data0025.ZDR_TYPE as '#38075#23380#21442#25968','#13#10'data0025' +
      '.ORIG_CUSTOMER as '#20851#32852#21407#23458#25143',data0025.DiffMark as '#21046#36896#38590#24230',data0025.ProdG' +
      'rade as '#20135#21697#31561#32423','#13#10'data0025.RoHS,Data0025.Compress as '#21387#21512#31243#24335',Data0025.' +
      'DrillRemark as '#38075#23380#22791#27880',Data0025.MinRing as '#26368#23567'Ring'#29615#13#10'FROM dbo.Data00' +
      '08 INNER JOIN'#13#10'      dbo.Data0025 ON '#13#10'      dbo.Data0008.RKEY =' +
      ' dbo.Data0025.PROD_CODE_PTR INNER JOIN'#13#10'      dbo.Data0010 ON '#13#10 +
      '      dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER J' +
      'OIN'#13#10'      dbo.Data0005 Data0005_3 ON '#13#10'      dbo.Data0025.CHECK' +
      '_BY_PTR = Data0005_3.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Da' +
      'ta0005_2 ON '#13#10'      dbo.Data0025.LAST_MODIFIED_BY_PTR = Data0005' +
      '_2.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON dbo.Da' +
      'ta0025.AUDITED_BY_PTR = Data0005_1.RKEY'#13#10'where data0025.rkey=:rk' +
      'ey'#13#10
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
      DisplayWidth = 30
      FieldName = #26412#21378#32534#21495
      Size = 30
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
    object ADS25barcode_flag: TWordField
      FieldName = 'barcode_flag'
    end
    object ADS25NOPB_flag: TWordField
      FieldName = 'NOPB_flag'
    end
    object ADS25DSDesigner33: TIntegerField
      FieldName = #38075#23380#21472#26495#25968
    end
    object ADS25DSDesigner34: TWideStringField
      FieldName = #38075#23380#21442#25968
      Size = 50
    end
    object ADS25DSDesigner35: TBlobField
      FieldName = #21387#21512#22270#29255
    end
    object ADS25grade_code: TStringField
      FieldName = #31561#32423#25351#31034
      Size = 10
    end
    object strngfldADS25DSDesigner36: TStringField
      FieldName = #20851#32852#21407#23458#25143
      Size = 30
    end
    object ADS25DSDesigner4G: TStringField
      FieldName = #26631#35782'4G'
      ReadOnly = True
      Size = 6
    end
    object ADS25DSDesigner29: TWideStringField
      FieldName = #21046#36896#38590#24230
    end
    object ADS25DSDesigner36: TWideStringField
      FieldName = #20135#21697#31561#32423
      Size = 8
    end
    object ADS25RoHS: TBooleanField
      FieldName = 'RoHS'
    end
    object ADS25DSDesigner37: TStringField
      FieldName = #21387#21512#31243#24335
    end
    object strngfldADS25DSDesigner38: TStringField
      FieldName = #21151#25918#26495
      ReadOnly = True
      Size = 6
    end
    object ADS25REACH: TStringField
      FieldName = 'REACH'
      ReadOnly = True
      Size = 10
    end
    object ADS25DSDesigner38: TStringField
      FieldName = #38075#23380#22791#27880
      Size = 100
    end
    object ADS25Ring: TBCDField
      FieldName = #26368#23567'Ring'#29615
      Precision = 10
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
      'SELECT data0038.grade_note,Data0034.DEPT_CODE as '#24037#24207#20195#30721', Data0034.' +
      'DEPT_NAME as '#24037#24207#21517#31216', '#13#10'      Data0038.STEP_NUMBER, Data0038.toolin' +
      'g_rev as '#24037#20855#29256#26412', '#13#10'      Data0034.BARCODE_ENTRY_FLAG as '#36807#25968', Data00' +
      '38.OUTP_SPFC as '#20135#20986', '#13#10'      Data0038.DEF_ROUT_INST as '#22791#27880', data00' +
      '38.SOURCE_PTR'#13#10'FROM Data0038 INNER JOIN'#13#10'      Data0034 ON dbo.D' +
      'ata0038.DEPT_PTR = Data0034.RKEY'#13#10'WHERE  (Data0038.SOURCE_PTR = ' +
      ':rkey) and'#13#10'                (data0034.visible_in_mi <> :visible)' +
      #13#10'order by Data0038.STEP_NUMBER'
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
    object ads38grade_note: TWideStringField
      FieldName = 'grade_note'
      Size = 2048
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
      'SELECT dbo.Data0278.PARAMETER_NAME'#13#10#9' , dbo.Data0278.PARAMETER_D' +
      'ESC'#13#10#9' , dbo.Data0494.PARAMETER_VALUE'#13#10#9' , dbo.Data0002.UNIT_COD' +
      'E'#13#10#9' , data0494.step_number'#13#10#9' , data0494.TaskTopLimt'#13#10#9' , data0' +
      '494.TaskLowLimt'#13#10#9' , data0494.InnerTopLimt'#13#10#9' , data0494.InnerLo' +
      'wLimt'#13#10#9' , data0494.SpecialNote'#9' '#13#10'FROM'#13#10#9'dbo.Data0494'#13#10#9'INNER J' +
      'OIN dbo.Data0278'#13#10#9#9'ON dbo.Data0494.PARAMETER_PTR = dbo.Data0278' +
      '.RKEY'#13#10#9'INNER JOIN dbo.Data0002'#13#10#9#9'ON dbo.Data0278.UNIT_PTR = db' +
      'o.Data0002.RKEY'#13#10'WHERE'#13#10#9'data0494.custpart_ptr = :source_ptr'#13#10#9'A' +
      'ND Data0494.PARAMETER_VALUE <> :value'#13#10#9'AND data0494.doc_flag = ' +
      #39'Y'#39#13#10'ORDER BY'#13#10#9'data0494.step_number'#13#10'  , data0494.seq_no'
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
    object fltfldads494TaskTopLimt: TFloatField
      FieldName = 'TaskTopLimt'
    end
    object fltfldads494TaskLowLimt: TFloatField
      FieldName = 'TaskLowLimt'
    end
    object fltfldads494InnerTopLimt: TFloatField
      FieldName = 'InnerTopLimt'
    end
    object fltfldads494InnerLowLimt: TFloatField
      FieldName = 'InnerLowLimt'
    end
    object ads494SpecialNote: TStringField
      FieldName = 'SpecialNote'
      Size = 200
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
    Template.FileName = 'D:\SJSYS\NIERP\Report\MANU_INSTRUCTION.RTM'
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
        mmLeft = 58208
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
        mmHeight = 3969
        mmLeft = 80433
        mmTop = 27781
        mmWidth = 17727
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
        mmLeft = 129382
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
        mmLeft = 129382
        mmTop = 22754
        mmWidth = 19473
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
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 5630
        mmLeft = 149522
        mmTop = 10054
        mmWidth = 19812
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
        mmHeight = 6435
        mmLeft = 59833
        mmTop = 1323
        mmWidth = 73745
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
      object ppDBText33: TppDBText
        UserName = 'DBText33'
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
        mmLeft = 175070
        mmTop = 15875
        mmWidth = 17018
        BandType = 0
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4763
        mmLeft = 92604
        mmTop = 15610
        mmWidth = 19315
        BandType = 0
      end
      object ppImage5: TppImage
        UserName = 'Image5'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D6167651E280000FFD8FFE000104A46494600010100000100
          010000FFDB004300010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101FFDB00430101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101010101FFC00011080088008303012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00FEFE
          28A28A0028A29AEE91AB3BB2A222B3BBBB05544504B3331202AA804B31200009
          271400EA09001248000C9278000EA49EC057E2BFED55FF000598F879F0FBE236
          A3FB347EC61F0AFC61FB77FED6704CDA7DEFC3CF83882FFC0DF0F6F183C6D79F
          13FE21C025D1346834B94C13EABA55B5D3EA8B6521915A160057845B7EC09FF0
          54AFDB9BECFE21FDBFBF6CFBCFD99FE1F6A5E4DF8FD97FF62AB97F0F4FA5324A
          49D2FC4BF186E44DAD6B96D7768DE4DEC36D238525D1240496A076D2EDA5F9BF
          96FF007D93EE7EC17C65FDB53F648FD9EB4DBDD57E357ED1DF077E1CDA69C8F2
          DF2F88BC77A0C37D6B1A0CB34DA55BDE5C6A8831D3367F31042E4A903E0FBEFF
          0082F97FC12B23923FEC0FDA6EC3C75692072355F01F82BC77E26D240560AA7F
          B42CFC3A207597930BC4D2472AAB32390327ABF82BFF000443FF0082687C13BC
          BED72CBF66AF0C7C48F17EB325BDC6BDE33F8D577AAFC5BF10EB5796F10892EA
          F25F1BDE6AF651B1518315AD9C10B7574762CC7F41FC31F00BE05782B4F8B48F
          077C17F851E14D2A18E3861D37C39F0EFC23A2D8C5142A5628E3B4D3B48B6811
          2352422AA0540485033407BBE6FEE5FE67E610FF0082FAFF00C131F237FC68F1
          344991BE597E14FC4548A25CFCD24AE7C3F848E319791CF0A80B1E95EDBF09BF
          E0B11FF04C8F8DBADCDE19F87BFB66FC17BFF135B083ED7E1ED6B5E9FC25AB5A
          1BA245B8B8B6F1559E8C10CA41DA448CA307711835F793FC30F869223C727C3C
          F03491C88D1C91BF84B4074747055D1D5B4F2AC8CA4AB2B0218120820D7CD3F1
          4BFE09D3FB09FC67B7BC83E23FEC95F00F5F96FD254BBD493E19785749D6E612
          C62272FADE8DA6E9FAAB3040046CD764C5D63DADCD1AF5FCADFAB0D3B3FBD3FC
          2CBF33EB3F0FF89FC37E2CD3E3D5BC2BE21D0FC4DA54C018B53F0FEAD61ACE9F
          2861B94C77BA75C5CDB382BC8DB29C8E4715B95F81FE24FF008212F82BE14DEC
          3E2EFF008277FED45FB427EC3DE30D217529F48F0B786FC6FACF8F7E0A6A37B7
          FB1847E22F875E31BCD4EDE6B1B7955A5816CE78E480BBA4636B2ECE13FE1E13
          FF000516FF0082724B1E8FFF00053CFD9D1BE3C7C02B2956DD3F6DFF00D92F46
          BCD6A0D174E82D91A6D5FE2FFC22891F54D05AE2ECBC168FA2A43118D1A7951D
          4503B5F677F2D9EF6B2E8DF9277F23FA2BA2BC63E02FED0FF057F69EF873A37C
          58F80BF11BC31F137C05AEC4AF67AEF8675282FA2867D8AD369FA8C08DF68D37
          53B466315DD85EC50DCC12AB2BC7C64FB3D04851451400514514005145140195
          AEEBBA2F85F45D5BC49E23D574FD0BC3FA169D79AB6B5AD6AD77058699A5697A
          7C0F737B7F7F7B72F1DBDADA5ADBC724D3CF33A471C68CCCC00AFE6DBC65F1AF
          F6A3FF0082DCF8CFC53F06FF00640F1878AFF665FF0082727853C4373E17F8B7
          FB5869D6B3E99F11BF68F82D2468357F0A7C0996758A4D3BC237BE55D69BA8F8
          93E43736933CACC9E6D9257C91FF00054FFF00828AFC2DFDAF7F6C2F017FC13F
          7C43F13FC63F07FF00E09EBE19F89D61E0BFDB0BF693F0C58EAF0F833C71F12B
          CB927D07E01DC7C40D36DE5D2B47F0EDEEA8B6DA77892EE5BC487ED534571334
          96968D19FEB5FE16F817E1F7C33F875E0CF027C29D1742F0F7C39F0CF87749D2
          FC1DA5786A2B48F448340B7B28534D7D3DAC47D9AE21B8B611DC0BC8DA4FB619
          0DD34B234A5D82BE1B3B6AD5D765E7E6FF002D3E5E2BFB257EC59FB377EC43F0
          D2CFE167ECE3F0D745F02E851ECB8D67548A2179E2AF176ABE5A473EBBE2FF00
          12DC87D57C41AC5D045F3AEEFAE1F01552348D1428FAA28A282428A28A0028A2
          8A002AB5ED959EA3697361A85A5B5FD8DE4125B5E595E4115D5A5D5BCC8526B7
          B9B79D5E19E19518A4914A8C8EA4AB29048AB345007F3E9FB477FC12E3E2DFEC
          AFF10FC49FB677FC120759B1F857F166EA64D73E2D7EC91AADECD6FF00B3EFED
          156560AD25DD859E85BBFB3FC0FE33BDB7F322B1D534D8EDEDA4BA93CF212E96
          20FF007C7FC13B7FE0A37F0AFF00E0A05F0EF5CBFD1748D5BE17FC71F861AA49
          E11F8F7FB3EF8D42D8F8FF00E14F8DAC1BECDA958EA1A74A52E2EF439EED1DF4
          8D6628CDBDD5AC96E5D9649503FE89D7E117FC14CBF610F88DE15F88BA6FFC14
          FBFE09FB6B0F857F6D1F83763F6BF897E09D3D2483C31FB577C24D322797C43E
          01F1AE8B69E5C1AAF8BA0D2D6E1BC2BAE48AFA824EAB6E3CF9FC8560ABDF47BF
          46FF0027E5D9F4F43F7768AF92BF621FDB13E177EDD5FB39F817F685F8557A0E
          9DE23B6974EF14F86EE1D46B3E03F1DE8E56D3C59E07F10DB67CDB3D5FC3FAA2
          CB6D3433AA4AD09826748DA468D3EB5A090A28A2800AFC93FF0082C27ED77E3C
          FD9C7F678D03E15FC008A3D53F6B1FDAEFC6761FB3E7ECEFA2ADCB5ADC5AF88B
          C5ABF64D77C66F711C73B595AF833449E7D5BEDB2C26DE2BA5B7DCC08AFD6CAF
          E793F67A917F6F2FF82D87ED23FB415E5C59EBBF04FF00E09B9E12B5FD993E0F
          4513CCD027C7AF18DB2EA9F16F56BFB39C3595CDDE8F6AF2D8E91A9DAA8B8B55
          6850CC0AED20D6F77AA5ADBBF97DFBF91F73FECE7FF04B9FD9BFE14FEC0BA6FE
          C25F113C11A1FC51F04F89B40BBBAF8D577E21B5FB5DDFC46F895E271F6FF187
          8F2FEF66692EA2D76E75A9659F4ED42096396C6282DE3804710789BF2F3E1D7C
          49FDA27FE084DF1174AF81BFB45DFF008D3E3DFF00C12DBC6FE2BB7D0FE05FED
          2978FA8F897C6FFB2AB6A8667B1F871F191E3B7B8BAB9F055A3FEE742F134D27
          93169D6D3106036535BCBFD3BD7F9CDFFC1D1DFB427C7EF0D7FC1463C45F06BC
          39F1BFE2BE81F07B5BFD9DBE145D6B3F0A747F1CEBD61F0F356BAD46EBC51FDA
          173A8784ADEF1347BAB8BEFB3DBFDAE696D9A49FC88BCC66D8B80A82E7972DF7
          D75D7E7EBE67FA23785FC51E1CF1B787745F1778435CD2FC4BE17F11E9B6BAC6
          83AFE897B06A3A4EAFA65EC4B35A5F585EDB3C905C5BCF13064923723AA9C306
          037ABFC85BC13AAFFC15CBE17FECD7A27C5DF86DE20FDBCBE1FF00EC81A36872
          EA7E1BF885E0BF127C47D0FE06E97E1B5D4AE6CA7BED1F50D2B514D22D7484D5
          E3BCB6964B785614BC8EE15B0558D7B8781ACBFE0E01F89FE13D13C79F0D2FFF
          00E0A87F103C0FE25B38F51F0F78BBC21E2CF8A9AE787B5AB194662BBD3B52B3
          D69E19E19072AC0838209033417EC7FBF13FD5E68AFF002C5D27C6FF00F07157
          ECCF7371F157548BFE0A43E1CB1D234EBE8EF755F8ABA778FBC5BE10B4B19216
          3797377A3F89AE750D2CCB042AD24776F6C66B6C192260C2BF48FF00E09D9FF0
          7517ED15E00F1BF86FE1EFEDF965A47C5BF85DA96A5FD97AA7C5CF0FE8369E18
          F88FE0B375771DBC379ABE87A6436BA4EB7A3E8B1EE6D4035AFF006F5CAAC8ED
          379A73409D292D5352B6F67AFDC7FA0BD15CCF833C63E18F885E13F0E78E7C17
          AD58F88BC27E2DD1AC35FF000EEB9A64E97361AA693A9DBA5D595E5B4D192AF1
          CB0C8A48CEE46DC8E15D5947F0F5FF000757FED39FB4B7C0DFDA5BF67AD1BE08
          FED0BF1A7E0F68FAB7C25D5EFF0055D27E19FC45F12F8334ED4EFA3D66FE38EF
          6FED344BEB486EAE923458D27995A4545550400282231E676BD8FEEAE8AFCB9F
          F822CF8DBC69F11BFE0987FB2478D7E21F8BFC4BE3CF196BDF0FEFAEF5DF16F8
          BF58BDD7FC47AD5D278AFC4102DCEA9AC6A32CD7B7D3AC11450ACB3CAEE228A3
          4076A281FA8D412F46D760A28A2803F9B7F13E9D17FC1223FE0A91A178EF455B
          4F0CFEC21FF0533F1341E18F1F697142F6BE1BF841FB5BC6927F61789D3CB64D
          3342D27E268B93677290D9ACB7FAC4933CD33185597FA48AFCFF00FF0082A07E
          C9569FB69FEC49F1BBE0AC127F67F8D8F875BC71F09BC4905AC375AA7853E2AF
          80DBFE125F056B9A30995921D4BFB46C7FB3229C83E5C5A8CCC06E0A4647FC12
          93F6A7D4BF6BEFD85BE087C53F15A3DAFC4DD2F439BE1BFC5ED2AE2749F50D2F
          E277C38BA97C27E298B5228495BDBEBAD357559C3053BEFCE140C5037AA4FE4F
          F4F3DB4F96E7E8BD1451408F1FFDA0BE28E93F04BE067C5DF8BBAE5CC767A57C
          37F875E2FF0018DE5CCAC12289342D12F2F91A472405433431AB313C039AFCC2
          FF00820AFC2CD67C0FFF0004EDF875F11FC657306ADF11BF69AF13F8DFF690F1
          D78863D3E2D3E7D6AFFE28F88AFB5BD29E78E32C5D2D34492C6DAD9DDD898402
          A76B015D77FC174FC5A3C2BFF04B2FDAC2DCF998F1BF82ACBE1BBF948CCC61F1
          D6B9A6E83708CCAC8638E6B6BA9A096507E48E4635F7A7ECAFF0F34BF84BFB34
          7C01F863A2D9C3A7E93E03F83DF0EFC2DA758DB9261B5B4D1BC2BA5D94304659
          9D8AC6B105059D89C64B127340FECFABFC97FF006C7BDD7F99EFFC1D51FF0029
          61BFFF00B36FF839FF00A55E2EAFF4C2AFF33DFF0083AA3FE52C37FF00F66DFF
          00073FF4ABC5D41A51F8D7A33FB18FF820CF87340F18FF00C113BF626F0AF8AF
          46D33C47E1AF10FC19F1468FAE683AD5941A8E95AB6957DF117C796D79A7EA16
          37492DBDD5A5C40ED14B0CB1B2321C63A57C71F11BE10FC7CFF82177C43D63E3
          E7ECAFA3F8B3E377FC133BC75E2CFED6F8E9FB2B69E97FAEF8ABF6655D4360D4
          3E20FC1588BDC5C4DE12B66DD35F786D145BD9D9411DA4BE5C36F673BFDC3FF0
          6FAFFCA1B7F60EFF00B257AEFF00EACCF1CD7EC4DD5ADADF5B5C595EDB417967
          7904B6B7769750C7716D756D3C6D14F6F7104CAF14F04D13B472C52A347246CC
          8EACA48210DD9BEAAEEEBBEAFF001F3FF3678CFC00FDA07E0CFED61F07BC23F1
          B7E0778CB45F88DF0B7C7DA625F68DADE9CC9342EACA05DE97AB58CA3CFD3757
          D3A626D754D22FE28AEECAE51A29E21F296FE097FE0E99FF008279FC34FD9ABE
          37FC33FDAA7E0D787344F05F85BF68AB8D6F44F893E16D22236560FF001474C8
          D7514F11E93A5411A58D8C7AF691F699B5CF2B61B8D4E38A548951881FBE1F1F
          BF64BF8FDFF048EF8BBE2DFDB7BFE09C3E1AD53E217ECB3E2FBEBEF14FED7DFB
          07D9DF5D1B1819D9EE352F8BBF012C161BA4D1F5BD3E069EE75BF0D58C1B6F23
          592EA286EC99215FC2CFF8395BFE0A51FB3A7EDBBF0ABF62CF0C7C00F118F14C
          5326BDF183C528F13DAEADE02BEB8B08BC3D1F81BC5DA7CC166D33C4F0C97773
          2DCD932B044B4760FCE005D3BA9AE5774F7F4DDA7F77CF747EDC7FC1AA5FB45F
          89BE2FFF00C13CB59F855E2BD525D5EEFF00675F897A97833C3B3CECCD2D8781
          35D8A4D57C31A212CCE5E3D28DB6A4B14ACDBE44B8DA55446057E2BFFC1E03FF
          002751FB35FF00D91BD6BFF4F9A8D7EB0FFC1A41F08B5CF077EC33F177E2AEAD
          677D6365F187E345CFF60ADE40D0457BA5F816C6E34B5D56C378569ECAF26D55
          D62B95CC33181BCB66D8D8FCA0FF0083BF94BFED55FB3420EAFF000775851F56
          D775003F9D052B7B576DAFFAA3FAAAFF00821490BFF049CFD8CD988555F86FA8
          966240000F1878909249E0003924F0057DCBA9FED7DFB2768BE283E08D63F69C
          FD9F74AF19ADE41A7B784B51F8C7F0F2CBC482FEE702DAC8E8773E228F521777
          048F26DCDB79B2E46C46CD7F9B368FFB7EFEDE3FB677ECD3FB2FFF00C12B7F61
          CF08FC45D3B49F01F826F341F1FD87C34BD9EC3C55F142EAEBC417BAB4B7BE21
          F13433D8AF853C15A3457A8E54EA5A77DA2482777BB9CECB75F70D57FE0D51FF
          0082A69D2DFC7B75AA7ECF5ADF8A12D62D58E987E24F89AF3E203DDC71892381
          759BFF000C0B67D5A0FB91C9FDBFFBB906C8AE011409D3577CF3516EED2DDAEC
          DFAF6FF836FF004A9B3BDB3D46D60BED3EEEDAFACAE6312DB5E59CF15CDADC44
          DF76482E20778A58DBB3C6ECA7B1AB35FE567FB20FFC1497FE0A1DFF00046AFD
          A36E3E1B7C52FF00859DFF0008BF87B5C4B3F8B7FB367C5CD4354D4EDAE74F96
          E76DDEB1E18BCD52E6F65B2D505B079748D5748D46E34A9908411BAB9AFF004D
          AFD9ABF685F86FFB567C0BF869FB41FC24D5D35AF007C51F0C58789B42BA0713
          C29749B6EB4FBD88E1E0BED3AED27B3BA86454759212DB423A921138385B54D3
          D9ADBFAFCFA753DCABF9F6FF00825A5849FB37FF00C145FF00E0AADFB16DB680
          FE1FF02DCFC49F08FED69F0C59E5436FABD9FC67D2D13C65369D06F2D0456DE2
          3B268A78D5110CC923AAE304FF004135F819F12ED355F875FF0007117ECEBE25
          B7BE5B5F0BFC7DFD84FE25F82F5AB168DD05EF8A3E1D78A9B5AD1AE5670CB1CA
          EB61782D85B957917994328C0212BED2EEBF269FE499FBE745145023F9EBFF00
          839CEEEEED3FE09777E2D2EEEAD05E7ED41FB2AD85DFD9AE25B7FB558DDFC5ED
          123BAB2B8F29D0CD697319F2EE2DE4DD14C9F2C88C38AFE80745821B6D1B49B6
          B78D61B7B7D32C2082241848A18AD628E28D47654455551D8015F8B5FF00070C
          F802D3C7DFF04B9F8C8F7766F78BE02F187C26F89F014BA96D7EC975E06F881A
          2EAD05FB1888F3D2D58191AD64CC571F7240578AFD7EF85FE208BC59F0D7E1FF
          008A219C5CC5E21F05F863594B8000130D4B45B2BB32E17E51BCCA5B0BF28CE0
          718A07F657ACBF289DD57F99EFFC1D51FF002961BFFF00B36FF839FF00A55E2E
          AFF4C2AFF33DFF0083AA3FE52C37FF00F66DFF00073FF4ABC5D41A51F8D7A338
          4FD8FBFE0E55FDB23F620FD9ABE12FECA7F0D3E157ECCDE20F02FC17F0FDD786
          BC39ACF8E62F1EB78B2FECEF35BD57C4124BAD9D23C5DA6E9A6E96EF58B88D0D
          AD8DBA1B78E12C864DEEDF4A7FC4601FF0501FFA223FB1D7FDF8F89FFF00CDE5
          7F451FF0438FD83BF628F8B5FF0004A0FD8B3E237C50FD93FF0067BF883E3EF1
          57C35D66FBC4BE33F18FC25F04F88BC4DAFDEC3F107C65631DE6AFAD6ABA35D6
          A1A85CA5A5ADB5B2CB733C8EB0C1144A5638D157F577FE1D93FF0004EBFF00A3
          1DFD957FF0C5FC39FF00E67E81B9D3BBFDDF57D7CFB5FCBFABB3F836F891FF00
          07557FC14EBE2E787753F0C7817C3BF037E18EA177A74D6CFAFF00C26F07789F
          C53E24D305C128352820F12EA5E2AB68268F26385E6B3FB317C7CAD2E0D7E6C7
          C0EFF82617FC1443F6D1D37E20FED01E10FD9BBE2378B7C296B26A3E3DF1AF89
          AFB4FB7F01DFF8FA63722F7C43A67C3EB4D52CA08F53F17DE44D34B69A6C5A6D
          BDAA3B875057E46FF52FF879FB0F7EC6DF09353BDD6BE187ECB1FB3FF80357D4
          AD23B0D4352F097C26F046857B7B650CC2E62B5B9B8D3F458259A08E7026489D
          8AAC837819E6BEA28E38E2458E2448A34015238D5511140C05555015401C0000
          0074A03DAA8FC1051F37AB6BB77FC5FDE7E617FC122FE3F7EC8FF197F62EF853
          E19FD914CFE1CF09FC1CF0ED87C36F12FC28F11C634DF88BF0BFC59E1F885B78
          83C3DE3BD0E72B7F6BAC2EAE2F2596F668560D419CCD6E4211147FC93FFC1DFA
          EB1FED57FB3448E7091FC1DD61DCFA2A6BBA8331FC0026BFA36FDB97FE09BFF1
          53E1D7C62BEFF828D7FC131AE747F873FB59E8761797BF16BE0D3C46C3E187ED
          69A0428B3DEE8BE2AD32CFCBB6B5F1D4B042E34ED7638567D4AE56013BB6A115
          ABC9FC697FC1C11FB75F82FF006F3F1A7C00F1DE91E15F14FC32F8A3F0FBE15F
          887C05F1E3E0DF8DB4ABAD27C4DF0BBE27D85D5CDCEAFA0C8976AADA9E90C6EA
          39B47D660060BDB690293E7C532A82A6AF24D5DF7EAD3BADFCBCFF0053FACAFF
          008366BF611F0D7ECCFF00B097877E3F6BBA1469F1ABF6A112F8CBC41AB5EC50
          4BA8E8DE07B6BDB8B1F08F85B4FB958D6487499ADED1BC4724392F2DCEAA0CAE
          EB0C4A9FD22D7C53FF0004DF82CADBF606FD8F61D3C462D47ECF1F0B1D7CA6DE
          9E6CBE13D365B8C37AFDA5E5DC3F85B72F18C57DAD419B6E4DB7BB7FD7DC7F25
          DFF0760FEC69E0CF1F7EC91E1BFDB2F4BD2ACB4FF895F01BC53A0F873C45AE5B
          59FF00A7F88FE1DF8D3514D121D17509A2DBE647A5F88EF74DBEB4BAB912BC11
          B4B6B1B2452803CCBFE0D09FDA435CF14FC0CFDA4BF662D7EF26B9B0F84FE37D
          13C75E0313DC4B3BC1A478EAD6E4F89ACD04D23F916B6BAB5B69BF63B7842431
          ACB31080B1CFED1FFC178ACB4DBFFF008252FED730EA90DBCF6C9E08D3AE634B
          9DBE5ADE5AF88F489ECA45DDC79B15D4713C247CC24552B83835FCB47FC19EFF
          006F3FB527ED4054DD1D38FC0ED13ED3B4BFD8CDF1F15E82603363E4FB4F93E7
          7945BE7F2FCCDBC668354EF4649FD9926BCAED7F9BFBCFF412AFC2EFDB464369
          FF000598FF0082575C42925F4B79E08FDA3F4F9ACEDD732D85B368FA4B9D5AE0
          9F97EC8AC3CA7DBF38603B1AFDD1AFC1BFDA535AB2F167FC17AFFE09F5F0E2DA
          E215D57C07FB2E7ED0DF157508E32CF72BA4DFDDD9F87ED7ED09CA456D3DEDA3
          C514A70CD36507045064B7F94BF267EF251451408F8CBFE0A25F066EBF685FD8
          5FF6AEF83160ED16A5F103E0778FB45D2A78C0335B6AA344B9BDD32E6DF39C5C
          DBDF5A4135B91F309910AE4E05787FFC119FE365A7C7BFF8266FEC8FE34875B7
          F10EA3A47C2BD1BE1DF893569A75B8B9BAF147C370DE0CD75AEE553F35D9BCD1
          D9AE4B00C65666206457E9C4F0C5730CD6F3C6B2C13C5243344E3292452A1492
          360782AE8C55877048AFE7F7FE091D7975FB2FFED73FF0511FF826BF88A4B1B1
          B2F00FC579BF6A0F801A5D969E74CB35F825F1C2E06A93D8D902DF67BC9B47F1
          25CBC7702C963581666F3615219A82BECB5D9DD7E4D7E5F71FD03D7F99EFFC1D
          51FF002961BFFF00B36FF839FF00A55E2EAFF4C2AFF331FF0083ABF51D3ED7FE
          0AC97F15CDF59DBCBFF0CDDF06DBCB9EEA08A4DA6EBC5F86D923AB60E0E0E307
          07141747E35E8CFECFBFE0DF5FF9436FEC1DFF0064AF5DFF00D599E39AFD90AF
          C6CFF837C658E6FF0082357EC19245224B1B7C2BD7B6C91BABA363E26F8E94ED
          65254E1815383C1041E41AFD93A0CE5BBF57F98514514082BFCECBFE0EE1F86D
          E07F0E7ED9FF00067C59E1EF0D695A1F88FE227C1D9FFE135D574CB58AD27F11
          DCE99ABEA76B63A86A821445BAD421B575B6379266696186159198A6E3FE89B5
          FE7B5FF0784EA963A6FED51FB354B75776B0345F0675A9C473DCC30348B1EB9A
          8BE0091D4E0EDC6E008141A52F8D7F5D51FD08FF00C1BC5FF0519F845FB567EC
          57F0B3E034DE21D2B44FDA1BF67EF0A47E09F187C3EBABBB7B6D4757F0FE873C
          D1E87E2FF0BDACB22DC6ADA349A349636FA9C90C6D2E9FA8C171F6844B796091
          BFA14AFF00238F895FB347ED8BFF0004BAD5BF657FDB33E1DEBBE21D27C39F14
          3C0BE1DF8B3F07FE3F7832CAE87876C6F6FF004FB6BFD67C07E3196DCDCD9D9C
          D66B7021D434BD71D74CD6F4D9609A17926730C1FBDBA47FC1E1BF162DBE13E8
          FA15FF00EC7DE1CD63E2F5AF87EC6CB55F88EBF1252DFC13AB6BD04291DE6BD0
          F8220D0C6A367697AEAD38D357C46EB03BB2A4BE58545072A4DEB4FDE8BECF6D
          76D5FE3F7F77FA9FFF0007567ED63E16F853FB065A7ECD16FAA86F88FF00B4A7
          8BF40B6B5D2AC2FA18F52D33C13E0CD521F12EB1AFEA169BC5CFF62DE6A3A659
          683E72232C97776213F28723E48FF833F3F67FD7745F85FF00B547ED29AC5935
          BE89E3BF17786BE1C7816E8C722FDBADFC25697371E307DCEAA8CB6BAAB6950C
          4626756591CB10C00AFE6F7E1A7C28FF0082837FC17F3F6CEB9F14EA577ABF8C
          B57F106A4B178CFE2B5E6993DB7C22F811F0F62BE5F3346D15D14584363A446C
          6DB48F0CD85C5D6ADA9EA4625D4260EE6E93FD3C7F643FD97BE1CFEC67FB3A7C
          2DFD9BFE16598B6F09FC34F0D5968C978F1471DEEBBAA88D64D63C43A9B46ABE
          76A1AC6A066BB9E490C922AB470B4B208831072F721C974DB7795BA6DA7E5F77
          99F49D7E01FECC7776DFB42FFC176FF6E9F8B89A2DC8D1FF0064BF80BF0A7F66
          8F0F789DBCB934ED4FC41E2C9AEBC6DE2EB2D3A742E0B69BE7C56F7F1168D96E
          429D8CAD9AFDA1F8F5F187C2DFB3EFC15F8A7F1BBC6B7D67A7785FE16F817C47
          E35D5EE6FEE63B3B530E85A65C5E4368F732B247149A85DC70585B9661BAE2E6
          241F33015F94DFF041CF845E2CF0DFEC79AF7ED27F12ADF58B4F8A1FB737C5EF
          1DFED4BE27D3B5F649353D0345F1B6A92C1E06F0E09163422C2C3C2B63617761
          19DDFB8D4449BD84802864B697A25F3BA7F9267EDA514514082BF9EDFF0082C9
          F83FC69FB2EFC66FD963FE0AEBF08B4AD4752BDFD9875BFF008565FB4FF87F44
          B6BBBBBBF15FECBDF10F508ECFC4B7EDA569ED10D5750F07DD5D36A305EEA3F6
          88F49B2DD71188D6DC91FD09572DE39F04F85BE24F837C53F0FBC6FA359788BC
          1FE35D0355F0C789F42D46259EC756D0F5AB29B4FD4AC2E62604345716B3C919
          3C32921D486504034ECFCBAAEEBAA23F00F8E7C2DF137C13E13F889E09D5ECF5
          FF000878DBC3FA5789FC37ACE9F3C77167A8E8FACD9C57D63730CD1332307826
          5DE031292078D8075603CEBE207ECC3FB35FC58F109F177C52FD9EFE08FC49F1
          5B58DB698DE26F1F7C29F02F8C3C40DA6D9190D9E9E759F10685A86A26CAD0CD
          29B6B5373E4406590C51A976CFE177EC11F12FC4DFF04B5FDAB753FF00824FFE
          D0FABEA137C02F883A86B3E37FF8277FC6BD7E690E99A8787751BB6BCD57F67B
          D7B54B93E5D9F88BC272CC53C3F1BCAB67340D15859967B88F1FD21D00F47A3F
          46BB3FEACFB3BA39AF07782FC1DF0EFC33A4782FC01E14F0DF81FC1DA05BBDA6
          85E14F08687A6786BC37A2DAC93CD7525B693A1E8D6B65A669D6EF73713DC3C3
          676B0C6D3CD2CACA6491D8F4B45140828A28A002BC73E24FECEDFB3FFC65BFB2
          D57E2F7C0DF83FF15353D36D5EC74ED47E237C35F06F8DEFAC2CA466792CECEE
          FC4BA2EA7716B6AEEECEF0412244CCCCC50924D7B1D1401E6DE20F837F093C55
          F0F3FE1527893E19780B5CF85A2C20D2D3E1D6A5E12D0AEFC130E9D6ABB6D2CA
          DBC332D8B68F6B6F683FE3D22B7B3896D700C023201AFC36FDACFF00E0DB5FF8
          274FC70F05F8F6F7E0AFC2AD2BF679F8F3AE4C9AE7843E27787350F12EA1A168
          9E23B397ED56D6BA9780AFF58BBF0C4FE17D42555B5D5F4DB0D2AD27FB231365
          2C522ED93FA12A281A6D6CDAF467F3EDFF0004B8FDB2B4EF81FE2F1FF04C6FDA
          F7E0E7C38FD937F6AFF05CB71078064F02F8674DF067C22FDAB3C33A75B2C70F
          C46F87F7D656D69A7EA1E2FBFB4812E3C41A6CF2BEA17B3B35CDAA907CA3FD04
          D7C1BFB7DFFC13DBE08FFC140FE16DBF833E24C3A8F85BE20783EEDBC49F067E
          35F83E76D2BE237C21F1DDAC6D268FE26F0CEB36CD15C98AD2F960B8BDD22794
          D8EA31C46299016DE3F17345FF0082BE7ED07FF04CCF0AF8DBF650FF00829C78
          175AF1FF00ED1FE09F0A187F650F8C3E03D2353D4FC2FF00B6ACB3DCAE89E0BD
          2D9AD6279745F1D4DA8DCE976DE2AB76224889BA7655BE92DE39C1D93B5B7EAB
          F55E5F8AF43E82FF0082BAF8D6FBF6C7F8E7FB3EFF00C11E3E166A0F7577F1A3
          5BD1BE2FFED877DA618AEC7817F663F046A96FA94DA4EBD03A3C68BF10B5A82C
          F4D86DDDE2B868D209A30524CD7EFB785FC35A27833C35E1EF07F86AC20D2BC3
          9E14D0F49F0DE81A5DB2EDB7D3745D0EC2DF4CD2EC205FE186D2C6D60B78C764
          8C57E48FFC1247F628F893F04BC23F113F6B0FDAC678BC41FB707ED8BAD47F11
          FE31EA12C4857E1CF876E9167F077C1AD03EF35A697E0DD3248ADAFC234725D5
          FA81771ACF6A457EC5D0276D12D97E2DEFFE5F2BF50A28A281051451401F187E
          DDBFB0F7C25FDBE3E04EB5F063E278BFD135049E1D7FE1DFC48F0E38B3F1AFC3
          0F1DE987CFD07C5DE16D523F2EE6DAE2CAF1226BDB38E7861D4ECC49693B2EE4
          962FCC1FD8A3FE0A0BF177F658F89BA37FC13B3FE0AA97F6FE14F8C36772FA0F
          ECEBFB546A4E961F0B7F6A1F0959916FA235C7886E4C565A2FC4416CB1437D61
          A9496D25EDD2C892A41388DAEBFA0DAF997F6B1FD8FF00F67CFDB6BE11EB7F05
          BF68BF87DA578EBC1FAB46D2594D3C62DBC43E16D5D36BD8F88FC23AFC2A351F
          0FEBDA65D456F79677D652A0FB45B41F688AE224F28834FA3DBCB75E6BFCBAF9
          6EBE99565755746574650CACA432B2B0CAB2B0C82A4104104820E4714B5FCD9E
          9565FF000543FF0082414EBA4DA58F8BBFE0A6BFB04E99712BD83432C7FF000D
          65F02BC27044EC2CA4594983E24787F42B581AE1A7CCBAA5C195A18D6DF6A28F
          D35FD92FFE0AB5FB0DFED98834DF851F1A347D1FE20DB5B25C6B9F07FE26C6DF
          0EBE2B786DD9D6236FAC7843C48D697493F9A4A2A59CB765F6330F941200E576
          BAD57757B2F5EDDB5DFA5CFD17A29AACAEAAE8CAE8EA191D486565600AB2B024
          32B0208209041041C53A81051451400515E61F153E35FC22F81DE19D47C65F18
          7E25782BE1AF8634AB596F6FB59F19788B4CD0AD21B6854BCB227DBAE2296E0A
          202C63B68E694AAB30421491F867F103FE0B33F14BF6A9F13EABF047FE08F3FB
          3B6BFF00B4CF8AC349A7EA9FB53FC43D3F52F047ECA9F0FC5C40B25978821F10
          DFDBC37BE3FB3903EDB71A424110BB5114D0CC8C370349BF4EEF45F79FA7FF00
          B72FEDFF00FB3C7EC01F0BA5F889F1B7C452CDAD6A64587C3DF857E178D759F8
          9DF143C473BFD9EC3C3FE0AF0ADBB36A3A95C5DDDB25BBDD88459DB3362494CC
          D1C327E677EC43FB147ED03FB5A7ED17A5FF00C1503FE0A65A15BE93E3FD2ADA
          E93F63AFD92E730EA1E1AFD987C0DAAFEF2DB5EF1044EAF0EA3F1535AB4FB3DD
          EA97530792C2ED918886E2D230DEE7FB17FF00C124F48F85FF0014A6FDAFBF6D
          4F893A87ED8DFB6E6B50C4C9F117C6D6CAFE03F8476E5370F0EFC18F044E1F4C
          F0CDA5AB36C7D5843F6DBA9A28EF225B59D5641FB3540EE95D27BAB37B69D52F
          2BEEF76B4B257B94514504851451400514514005145140057E797ED63FF04ADF
          D85BF6CF99758F8D7F027C352F8E20BEB5D56CBE27782BCFF00FC4AB4D52C1DA
          4B2BEFF84CBC2AFA66AF7925BCAC5C26A33DDC52602CA8CA14028A0136B54ECF
          BA3E04FF0087437EDA3F01ADF597FD88BFE0AB9FB40782A3BA99EE742F067ED1
          9A4E91F1DFC11E1FDA736BA5DA0D6623AB1D1A25FDD9B73279A579323B7CD5D3
          5B785BFE0E16F8776696D17C4BFD82FE3F4F651C486FF57F0A78CFE1E4DACBCA
          02CB2C90D8DC5BC362D6C7320540AB37DD1C514505733EB67EA95FA75DDEC393
          5CFF008388757922D3A6F04FFC13DBC250DC3912F8861D6BC7DAD49A7AA2970C
          34C7D41C5CF9ACA212154B2093CCE36D6349FB1AFF00C170BE30EB6CDF18FF00
          E0A63F09FE0E7802FEC05B5EF843F672F81B6B1789ADE56691A5B8B6F19F8AA3
          96E52528E91284768D442B226D76624A2815FC97DC9F6EF7EDF8B3B4F84DFF00
          0410FD91B44D6F4CF1B7ED3DE35F8DDFB76FC45D2752BAD56CBC4DFB507C41D6
          3C59A3DBDC5E3EF9A283C0B6D756FE15FB22F11416F75657690DBA88416519AF
          D9EF06F827C1DF0EBC37A5F837C01E15F0EF82BC25A1DB259E8DE19F0A68DA7E
          81A16976B1A854B7B0D2B4BB7B5B2B5895540090C28300514500DB7BBB9D3D14
          5140828A28A0028A28A00FFFD9}
        mmHeight = 10583
        mmLeft = 179917
        mmTop = 21960
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label59'
        Caption = #39640#38590#24230
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5556
        mmLeft = 25929
        mmTop = 3175
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = #26631#35782'4G'
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
        mmHeight = 5292
        mmLeft = 151607
        mmTop = 15875
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 'RoHS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 166688
        mmTop = 25665
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label58'
        Caption = #25340#29256#23610#23544':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 112226
        mmTop = 28046
        mmWidth = 15833
        BandType = 0
      end
      object ppDBText48: TppDBText
        UserName = 'DBText48'
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
        mmHeight = 3969
        mmLeft = 129382
        mmTop = 28046
        mmWidth = 23019
        BandType = 0
      end
      object ppDBText49: TppDBText
        UserName = 'DBText49'
        DataField = #21046#36896#38590#24230
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 5556
        mmLeft = 25665
        mmTop = 9525
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        Caption = 'Label61'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4763
        mmLeft = 139700
        mmTop = 1852
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'REACH'
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 3969
        mmLeft = 151607
        mmTop = 22754
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'REACH'
        DataPipeline = ppDB25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB25'
        mmHeight = 4826
        mmLeft = 125942
        mmTop = 8467
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentHeight = True
        ParentWidth = True
        Position = lpRight
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 6879
        mmTop = 0
        mmWidth = 190500
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
        mmHeight = 3979
        mmLeft = 15081
        mmTop = 529
        mmWidth = 7662
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
        mmLeft = 44450
        mmTop = 529
        mmWidth = 140759
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
        mmLeft = 7938
        mmTop = 529
        mmWidth = 3969
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 6879
        mmTop = 0
        mmWidth = 529
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 13758
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 25665
        mmTop = 0
        mmWidth = 1323
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 4763
        mmLeft = 43921
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
        mmHeight = 4763
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
      object ppDBMemo7: TppDBMemo
        UserName = 'DBMemo7'
        CharWrap = False
        DataField = #24037#24207#21517#31216
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
        mmLeft = 27517
        mmTop = 265
        mmWidth = 15346
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.750000000000000000
        mmHeight = 15875
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
        object ppLine44: TppLine
          UserName = 'Line7'
          ParentHeight = True
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 6879
          mmTop = 0
          mmWidth = 190236
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = #20195#30721
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 14552
          mmTop = 794
          mmWidth = 9790
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
          WordWrap = True
          mmHeight = 4022
          mmLeft = 27252
          mmTop = 529
          mmWidth = 14224
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
          mmLeft = 13758
          mmTop = 0
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine32: TppLine
          UserName = 'Line32'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 25665
          mmTop = 0
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'Line33'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 43921
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
        object ppLine45: TppLine
          UserName = 'Line45'
          ParentHeight = True
          Position = lpLeft
          Weight = 0.750000000000000000
          mmHeight = 5556
          mmLeft = 6879
          mmTop = 0
          mmWidth = 794
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
        object ppSubReport4: TppSubReport
          UserName = 'SubReport4'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppDB30'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = ppDB30
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
            DataPipelineName = 'ppDB30'
            object ppHeaderBand5: TppHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppDetailBand5: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5821
              mmPrintPosition = 0
              object ppLine78: TppLine
                UserName = 'Line78'
                ParentHeight = True
                ParentWidth = True
                Position = lpBottom
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 4
              end
              object ppLine63: TppLine
                UserName = 'Line63'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 0
                mmTop = 0
                mmWidth = 794
                BandType = 4
              end
              object ppLine64: TppLine
                UserName = 'Line64'
                ParentHeight = True
                ParentWidth = True
                Position = lpRight
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 4
              end
              object ppLine65: TppLine
                UserName = 'Line65'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 7938
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppDBText32: TppDBText
                UserName = 'DBText32'
                AutoSize = True
                DataField = #24207#21495
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 4022
                mmLeft = 529
                mmTop = 1058
                mmWidth = 7027
                BandType = 4
              end
              object ppLine66: TppLine
                UserName = 'Line66'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 17727
                mmTop = 0
                mmWidth = 2117
                BandType = 4
              end
              object ppDBText34: TppDBText
                UserName = 'DBText34'
                AutoSize = True
                DataField = #31867#22411
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3641
                mmLeft = 8996
                mmTop = 1058
                mmWidth = 6350
                BandType = 4
              end
              object ppLine67: TppLine
                UserName = 'Line67'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 40481
                mmTop = 0
                mmWidth = 3440
                BandType = 4
              end
              object ppDBText35: TppDBText
                UserName = 'DBText301'
                AutoSize = True
                DataField = #23618#27425
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 4022
                mmLeft = 32279
                mmTop = 1058
                mmWidth = 7027
                BandType = 4
              end
              object ppLine68: TppLine
                UserName = 'Line402'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 52652
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppDBText36: TppDBText
                UserName = 'DBText36'
                AutoSize = True
                DataField = #21442#32771#23618
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 4022
                mmLeft = 41275
                mmTop = 794
                mmWidth = 10541
                BandType = 4
              end
              object ppLine69: TppLine
                UserName = 'Line41'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 70115
                mmTop = 0
                mmWidth = 1323
                BandType = 4
              end
              object ppLine70: TppLine
                UserName = 'Line70'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 86784
                mmTop = 0
                mmWidth = 529
                BandType = 4
              end
              object ppLine71: TppLine
                UserName = 'Line71'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 98954
                mmTop = 0
                mmWidth = 1058
                BandType = 4
              end
              object ppLine72: TppLine
                UserName = 'Line44'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 110596
                mmTop = 0
                mmWidth = 2910
                BandType = 4
              end
              object ppLine73: TppLine
                UserName = 'Line73'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 123561
                mmTop = 0
                mmWidth = 2910
                BandType = 4
              end
              object ppLine74: TppLine
                UserName = 'Line74'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 138907
                mmTop = 0
                mmWidth = 4763
                BandType = 4
              end
              object ppLine75: TppLine
                UserName = 'Line75'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 156634
                mmTop = 0
                mmWidth = 12965
                BandType = 4
              end
              object ppLine76: TppLine
                UserName = 'Line76'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 175419
                mmTop = 0
                mmWidth = 3704
                BandType = 4
              end
              object ppDBText37: TppDBText
                UserName = 'DBText37'
                AutoSize = True
                DataField = #23458#25143#32447#23485
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3979
                mmLeft = 53711
                mmTop = 794
                mmWidth = 14012
                BandType = 4
              end
              object ppDBText38: TppDBText
                UserName = 'DBText38'
                AutoSize = True
                DataField = #23458#25143#32447#36317
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 4022
                mmLeft = 71438
                mmTop = 794
                mmWidth = 14055
                BandType = 4
              end
              object ppDBText39: TppDBText
                UserName = 'DBText39'
                AutoSize = True
                DataField = #25104#21697#38459#25239
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3979
                mmLeft = 88636
                mmTop = 529
                mmWidth = 8721
                BandType = 4
              end
              object ppDBText40: TppDBText
                UserName = 'DBText35'
                AutoSize = True
                DataField = #35843#25972#32447#23485
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3979
                mmLeft = 101600
                mmTop = 529
                mmWidth = 6096
                BandType = 4
              end
              object ppDBText41: TppDBText
                UserName = 'DBText41'
                AutoSize = True
                DataField = #35843#25972#32447#36317
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3979
                mmLeft = 113506
                mmTop = 1058
                mmWidth = 8213
                BandType = 4
              end
              object ppDBText42: TppDBText
                UserName = 'DBText42'
                AutoSize = True
                DataField = #32511#27833#21069#38459#25239
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3979
                mmLeft = 126995
                mmTop = 1058
                mmWidth = 10329
                BandType = 4
              end
              object ppDBText43: TppDBText
                UserName = 'DBText43'
                AutoSize = True
                DataField = #38459#25239#25511#21046#33539#22260
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3979
                mmLeft = 140484
                mmTop = 1058
                mmWidth = 12192
                BandType = 4
              end
              object ppDBText44: TppDBText
                UserName = 'DBText44'
                AutoSize = True
                DataField = #21407#22987#21040#38108#30382#36317#31163
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 4022
                mmLeft = 153988
                mmTop = 1058
                mmWidth = 24596
                BandType = 4
              end
              object ppDBText45: TppDBText
                UserName = 'DBText40'
                AutoSize = True
                DataField = #35843#25972#21518#21040#38108#36317#31163
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 4022
                mmLeft = 173038
                mmTop = 1058
                mmWidth = 24596
                BandType = 4
              end
              object ppLine19: TppLine
                UserName = 'Line19'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 5821
                mmLeft = 30427
                mmTop = 0
                mmWidth = 2117
                BandType = 4
              end
              object ppDBText47: TppDBText
                UserName = 'DBText47'
                AutoSize = True
                DataField = 'coupon'
                DataPipeline = ppDB30
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #23435#20307
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB30'
                mmHeight = 3683
                mmLeft = 19579
                mmTop = 1323
                mmWidth = 6350
                BandType = 4
              end
            end
            object ppFooterBand2: TppFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppGroup8: TppGroup
              BreakName = 'source_ptr'
              DataPipeline = ppDB30
              OutlineSettings.CreateNode = True
              NewPage = True
              UserName = 'Group8'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppDB30'
              object ppGroupHeaderBand8: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 20902
                mmPrintPosition = 0
                object ppLine77: TppLine
                  UserName = 'Line77'
                  ParentHeight = True
                  ParentWidth = True
                  Weight = 0.750000000000000000
                  mmHeight = 20902
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 197300
                  BandType = 3
                  GroupNo = 0
                end
                object ppShape3: TppShape
                  UserName = 'Shape3'
                  ParentWidth = True
                  mmHeight = 10848
                  mmLeft = 0
                  mmTop = 10054
                  mmWidth = 197300
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel42: TppLabel
                  UserName = 'Label42'
                  Caption = #38459#25239#34920
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 14
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 5630
                  mmLeft = 89959
                  mmTop = 2646
                  mmWidth = 14859
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine51: TppLine
                  UserName = 'Line51'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10583
                  mmLeft = 7938
                  mmTop = 10319
                  mmWidth = 4233
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine52: TppLine
                  UserName = 'Line52'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10583
                  mmLeft = 17727
                  mmTop = 10319
                  mmWidth = 4498
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine53: TppLine
                  UserName = 'Line53'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10319
                  mmLeft = 40481
                  mmTop = 10583
                  mmWidth = 2117
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine54: TppLine
                  UserName = 'Line54'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10319
                  mmLeft = 52652
                  mmTop = 10583
                  mmWidth = 5292
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine55: TppLine
                  UserName = 'Line55'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10319
                  mmLeft = 70115
                  mmTop = 10583
                  mmWidth = 2646
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine56: TppLine
                  UserName = 'Line56'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10848
                  mmLeft = 86784
                  mmTop = 10319
                  mmWidth = 4498
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine57: TppLine
                  UserName = 'Line57'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10583
                  mmLeft = 98954
                  mmTop = 10319
                  mmWidth = 3440
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine58: TppLine
                  UserName = 'Line58'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10319
                  mmLeft = 110596
                  mmTop = 10583
                  mmWidth = 5556
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel43: TppLabel
                  UserName = 'Label43'
                  Caption = #24207#21495
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 4022
                  mmLeft = 529
                  mmTop = 13758
                  mmWidth = 7027
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel44: TppLabel
                  UserName = 'Label44'
                  Caption = #31867#22411
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 4022
                  mmLeft = 9525
                  mmTop = 13758
                  mmWidth = 7027
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel45: TppLabel
                  UserName = 'Label45'
                  Caption = #23618#27425
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 4022
                  mmLeft = 32544
                  mmTop = 13758
                  mmWidth = 7027
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel46: TppLabel
                  UserName = 'Label402'
                  Caption = #21442#32771#23618
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 41275
                  mmTop = 13758
                  mmWidth = 10583
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel47: TppLabel
                  UserName = 'Label41'
                  Caption = #23458#25143#32447#23485
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 53975
                  mmTop = 13758
                  mmWidth = 14023
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel48: TppLabel
                  UserName = 'Label48'
                  Caption = #23458#25143#32447#36317
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 70908
                  mmTop = 14023
                  mmWidth = 14023
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel49: TppLabel
                  UserName = 'Label49'
                  Caption = #25104#21697#38459#25239
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  WordWrap = True
                  mmHeight = 7938
                  mmLeft = 88636
                  mmTop = 12171
                  mmWidth = 8467
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel50: TppLabel
                  UserName = 'Label50'
                  Caption = #35843#25972#32447#23485
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  WordWrap = True
                  mmHeight = 7408
                  mmLeft = 100806
                  mmTop = 12171
                  mmWidth = 8467
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel51: TppLabel
                  UserName = 'Label51'
                  Caption = #35843#25972#32447#36317
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  WordWrap = True
                  mmHeight = 8043
                  mmLeft = 114036
                  mmTop = 11906
                  mmWidth = 7027
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel52: TppLabel
                  UserName = 'Label52'
                  Caption = #21407#22987#21040#38108#30382#36317#31163
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  WordWrap = True
                  mmHeight = 8043
                  mmLeft = 158486
                  mmTop = 11377
                  mmWidth = 14055
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel53: TppLabel
                  UserName = 'Label53'
                  Caption = #35843#25972#21518#21040#38108#36317#31163
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  WordWrap = True
                  mmHeight = 8467
                  mmLeft = 179652
                  mmTop = 11377
                  mmWidth = 14288
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine59: TppLine
                  UserName = 'Line59'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10583
                  mmLeft = 123561
                  mmTop = 10319
                  mmWidth = 3969
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine60: TppLine
                  UserName = 'Line60'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10848
                  mmLeft = 138907
                  mmTop = 10054
                  mmWidth = 4763
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel54: TppLabel
                  UserName = 'Label46'
                  Caption = #32511#27833#21069#38459#25239
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  WordWrap = True
                  mmHeight = 8467
                  mmLeft = 126207
                  mmTop = 11377
                  mmWidth = 11377
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine61: TppLine
                  UserName = 'Line302'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10848
                  mmLeft = 156634
                  mmTop = 10054
                  mmWidth = 8731
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel55: TppLabel
                  UserName = 'Label47'
                  Caption = #38459#25239#25511#21046#33539#22260
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  WordWrap = True
                  mmHeight = 8043
                  mmLeft = 141288
                  mmTop = 11377
                  mmWidth = 10541
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine62: TppLine
                  UserName = 'Line62'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10848
                  mmLeft = 175419
                  mmTop = 10054
                  mmWidth = 2646
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine79: TppLine
                  UserName = 'Line79'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 10583
                  mmLeft = 30427
                  mmTop = 10319
                  mmWidth = 4498
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel57: TppLabel
                  UserName = 'Label57'
                  Caption = 'coupon'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3704
                  mmLeft = 18785
                  mmTop = 14023
                  mmWidth = 10848
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand8: TppGroupFooterBand
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'SOURCE_PTR'
      DataPipeline = ppDB38
      OutlineSettings.CreateNode = True
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
        object ppSubReport3: TppSubReport
          UserName = 'SubReport3'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppDB29'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
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
              mmHeight = 6879
              mmPrintPosition = 0
              object ppLine20: TppLine
                UserName = 'Line20'
                ParentHeight = True
                ParentWidth = True
                Position = lpBottom
                Weight = 0.750000000000000000
                mmHeight = 6879
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
                mmHeight = 6879
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
                mmHeight = 4064
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
                mmHeight = 4064
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
                mmHeight = 4064
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
                mmHeight = 4064
                mmLeft = 40593
                mmTop = 1588
                mmWidth = 10626
                BandType = 4
              end
              object ppDBText26: TppDBText
                UserName = 'DBText26'
                AutoSize = True
                DataField = #23383#31526#30952#27425
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 3969
                mmLeft = 54504
                mmTop = 2117
                mmWidth = 14288
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
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4064
                mmLeft = 78052
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
                mmHeight = 4064
                mmLeft = 90752
                mmTop = 1588
                mmWidth = 14372
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
                mmHeight = 4064
                mmLeft = 120915
                mmTop = 1588
                mmWidth = 13018
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
                mmHeight = 4064
                mmLeft = 136790
                mmTop = 1588
                mmWidth = 13018
                BandType = 4
              end
              object ppLine21: TppLine
                UserName = 'Line21'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
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
                mmHeight = 6879
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
                mmHeight = 6879
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
                mmHeight = 6879
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
                mmHeight = 6879
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
                mmHeight = 6879
                mmLeft = 73290
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine27: TppLine
                UserName = 'Line27'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 89959
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine28: TppLine
                UserName = 'Line28'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 105834
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine29: TppLine
                UserName = 'Line29'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 134938
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine30: TppLine
                UserName = 'Line30'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 151342
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppLine49: TppLine
                UserName = 'Line49'
                ParentHeight = True
                Position = lpLeft
                Weight = 0.750000000000000000
                mmHeight = 6879
                mmLeft = 120121
                mmTop = 0
                mmWidth = 2381
                BandType = 4
              end
              object ppDBText18: TppDBText
                UserName = 'DBText18'
                AutoSize = True
                DataField = 'SE'#23380#25968
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 4064
                mmLeft = 106363
                mmTop = 1323
                mmWidth = 11811
                BandType = 4
              end
              object ppDBMemo8: TppDBMemo
                UserName = 'DBMemo8'
                CharWrap = False
                DataField = #22791#27880
                DataPipeline = ppDB29
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = #40657#20307
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppDB29'
                mmHeight = 6879
                mmLeft = 152136
                mmTop = 0
                mmWidth = 43392
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 30692
              mmPrintPosition = 0
              object ppDBText50: TppDBText
                UserName = 'DBText50'
                DataField = #38075#23380#22791#27880
                DataPipeline = ppDB25
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppDB25'
                mmHeight = 4022
                mmLeft = 30956
                mmTop = 8467
                mmWidth = 17198
                BandType = 7
              end
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
                  mmLeft = 76465
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
                  mmLeft = 91017
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
                  mmLeft = 120915
                  mmTop = 11377
                  mmWidth = 13494
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
                  mmLeft = 136261
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
                  mmLeft = 35719
                  mmTop = 3175
                  mmWidth = 15081
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
                  mmLeft = 73290
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
                  mmLeft = 89959
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
                  mmLeft = 105834
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
                  mmLeft = 134938
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
                  mmLeft = 151342
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLine48: TppLine
                  UserName = 'Line48'
                  Position = lpLeft
                  Weight = 0.750000000000000000
                  mmHeight = 6085
                  mmLeft = 120121
                  mmTop = 10319
                  mmWidth = 2910
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel17: TppLabel
                  UserName = 'Label17'
                  Caption = 'SET'#23380#25968
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 106363
                  mmTop = 11642
                  mmWidth = 13758
                  BandType = 3
                  GroupNo = 0
                end
                object ppDBText46: TppDBText
                  UserName = 'DBText46'
                  AutoSize = True
                  DataField = #38075#23380#21472#26495#25968
                  DataPipeline = ppDB25
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  DataPipelineName = 'ppDB25'
                  mmHeight = 4763
                  mmLeft = 107421
                  mmTop = 3969
                  mmWidth = 17463
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel23: TppLabel
                  UserName = 'Label23'
                  Caption = #38075#23380#21472#26495#25968#65306
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = #23435#20307
                  Font.Size = 10
                  Font.Style = [fsBold]
                  TextAlignment = taCentered
                  Transparent = True
                  mmHeight = 4022
                  mmLeft = 83920
                  mmTop = 4233
                  mmWidth = 21336
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel60: TppLabel
                  UserName = 'Label60'
                  Caption = #26368#23567'Ring'#29615
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 4233
                  mmLeft = 144992
                  mmTop = 3969
                  mmWidth = 18521
                  BandType = 3
                  GroupNo = 0
                end
                object ppDBText31: TppDBText
                  UserName = 'DBText31'
                  DataField = #26368#23567'Ring'#29615
                  DataPipeline = ppDB25
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = []
                  ParentDataPipeline = False
                  Transparent = True
                  DataPipelineName = 'ppDB25'
                  mmHeight = 4022
                  mmLeft = 166952
                  mmTop = 3969
                  mmWidth = 17198
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
    object ppGroup3: TppGroup
      BreakName = 'SOURCE_PTR'
      DataPipeline = ppDB38
      OutlineSettings.CreateNode = True
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
          GroupNo = 2
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
              mmHeight = 24871
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
                mmHeight = 6350
                mmLeft = 10054
                mmTop = 1058
                mmWidth = 181240
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
                PrintHeight = phDynamic
                mmBottomOffset = 0
                mmHeight = 30956
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
                  Visible = False
                  Weight = 0.750000000000000000
                  mmHeight = 2117
                  mmLeft = 0
                  mmTop = 0
                  mmWidth = 197300
                  BandType = 3
                  GroupNo = 0
                end
                object ppImage4: TppImage
                  UserName = 'Image4'
                  AutoSize = True
                  Center = False
                  MaintainAspectRatio = False
                  Stretch = True
                  mmHeight = 21696
                  mmLeft = 8996
                  mmTop = 7938
                  mmWidth = 41540
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
    object ppGroup7: TppGroup
      BreakName = 'SOURCE_PTR'
      DataPipeline = ppDB38
      OutlineSettings.CreateNode = True
      ResetPageNo = True
      ReprintOnSubsequentPage = False
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDB38'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppLine47: TppLine
          UserName = 'Line47'
          ParentHeight = True
          Weight = 0.750000000000000000
          mmHeight = 10848
          mmLeft = 5821
          mmTop = 0
          mmWidth = 190500
          BandType = 5
          GroupNo = 3
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
          mmTop = 5821
          mmWidth = 197300
          BandType = 5
          GroupNo = 3
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
              mmHeight = 180182
              mmPrintPosition = 0
              object ppImage1: TppImage
                UserName = 'Image1'
                MaintainAspectRatio = False
                Stretch = True
                mmHeight = 82815
                mmLeft = 1058
                mmTop = 4763
                mmWidth = 104775
                BandType = 4
              end
              object ppImage2: TppImage
                UserName = 'Image2'
                MaintainAspectRatio = False
                Stretch = True
                mmHeight = 76994
                mmLeft = 5821
                mmTop = 103452
                mmWidth = 102659
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
                Visible = False
                mmHeight = 3969
                mmLeft = 3440
                mmTop = 99219
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
                mmLeft = 103452
                mmTop = 265
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
                mmLeft = 7938
                mmTop = 94192
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
                mmLeft = 25135
                mmTop = 93927
                mmWidth = 166159
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
                mmHeight = 63500
                mmLeft = 106363
                mmTop = 5821
                mmWidth = 89694
                BandType = 4
              end
              object ppLine50: TppLine
                UserName = 'Line50'
                Weight = 0.750000000000000000
                mmHeight = 3969
                mmLeft = 5556
                mmTop = 92869
                mmWidth = 185209
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
          mmTop = 1058
          mmWidth = 15875
          BandType = 5
          GroupNo = 3
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
          mmTop = 1058
          mmWidth = 159809
          BandType = 5
          GroupNo = 3
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object raCodeModule4: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F757263650C5601000070726F636564757265205661
        726961626C65314F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A20696620444232355B27424152434F44455F464C41
        47275D203D31207468656E0D0A20626567696E090D0A2020206C6162656C3539
        2E76697369626C653A3D547275653B0D0A20202044425465787434392E766973
        69626C653A3D547275653B0D0A20656E640D0A20656C73650D0A20626567696E
        0D0A2020206C6162656C35392E76697369626C653A3D66616C73653B0D0A2020
        2044425465787434392E76697369626C653A3D46616C73653B0D0A20656E643B
        200D0A2020200D0A696620444232355B275245414348275D3D20275927207468
        656E0D0A2020204C6162656C36312E76697369626C65203A3D20747275650D0A
        20656C73650D0A20204C6162656C36312E76697369626C65203A3D2066616C73
        653B0D0A656E643B0D0A0D436F6D706F6E656E744E616D650609566172696162
        6C6531094576656E744E616D6506064F6E43616C63074576656E744944022100
        00}
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
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB25'
    Left = 160
    Top = 48
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
      FieldAlias = #20135#21697#24615#36136
      FieldName = #20135#21697#24615#36136
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField38: TppField
      FieldAlias = #20840#23616#21442#25968'1'
      FieldName = #20840#23616#21442#25968'1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField39: TppField
      FieldAlias = #20840#23616#21442#25968'2'
      FieldName = #20840#23616#21442#25968'2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField40: TppField
      FieldAlias = #21387#21512#27604#20363
      FieldName = #21387#21512#27604#20363
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
      FieldAlias = 'barcode_flag'
      FieldName = 'barcode_flag'
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
      FieldAlias = #38075#23380#21472#26495#25968
      FieldName = #38075#23380#21472#26495#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField45: TppField
      FieldAlias = #38075#23380#21442#25968
      FieldName = #38075#23380#21442#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField46: TppField
      FieldAlias = #21387#21512#22270#29255
      FieldName = #21387#21512#22270#29255
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField47: TppField
      FieldAlias = #31561#32423#25351#31034
      FieldName = #31561#32423#25351#31034
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField48: TppField
      FieldAlias = #20851#32852#21407#23458#25143
      FieldName = #20851#32852#21407#23458#25143
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField49: TppField
      FieldAlias = #26631#35782'4G'
      FieldName = #26631#35782'4G'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField50: TppField
      FieldAlias = #21046#36896#38590#24230
      FieldName = #21046#36896#38590#24230
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField51: TppField
      FieldAlias = #20135#21697#31561#32423
      FieldName = #20135#21697#31561#32423
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField52: TppField
      FieldAlias = 'RoHS'
      FieldName = 'RoHS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField53: TppField
      FieldAlias = #21387#21512#31243#24335
      FieldName = #21387#21512#31243#24335
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField54: TppField
      FieldAlias = #21151#25918#26495
      FieldName = #21151#25918#26495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField55: TppField
      FieldAlias = 'REACH'
      FieldName = 'REACH'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField56: TppField
      FieldAlias = #38075#23380#22791#27880
      FieldName = #38075#23380#22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppDB25ppField57: TppField
      FieldAlias = #26368#23567'Ring'#29615
      FieldName = #26368#23567'Ring'#29615
      FieldLength = 10
      DisplayWidth = 10
      Position = 56
    end
  end
  object ppDB502: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
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
      'BER as SE'#23380#25968','#13#10'mo_number as '#30952#27425',drill_number as '#25968#37327','#13#10'case when (mo' +
      '_number is null) or (mo_number = 0) then '#39'/'#39' else cast(mo_number' +
      ' as varchar(10) ) end as '#23383#31526#30952#27425#13#10'FROM dbo.Data0029'#13#10'where source_p' +
      'tr=:rkey'#13#10
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
    Left = 97
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
      DisplayWidth = 5
      FieldName = 'PTH'#23380
      Size = 5
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
      DisplayWidth = 100
      FieldName = #22791#27880
      Size = 100
    end
    object ads29SE: TStringField
      FieldName = 'SE'#23380#25968
      Size = 6
    end
    object ads29DSDesigner8: TIntegerField
      FieldName = #30952#27425
    end
    object ads29DSDesigner9: TIntegerField
      FieldName = #25968#37327
    end
    object ads29DSDesigner10: TStringField
      FieldName = #23383#31526#30952#27425
      ReadOnly = True
      Size = 10
    end
  end
  object DataSource4: TDataSource
    DataSet = ads29
    Left = 128
    Top = 144
  end
  object ppDB29: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    UserName = 'DB29'
    Left = 156
    Top = 143
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
    object ppDB29ppField13: TppField
      FieldAlias = #30952#27425
      FieldName = #30952#27425
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField14: TppField
      FieldAlias = #25968#37327
      FieldName = #25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB29ppField15: TppField
      FieldAlias = #23383#31526#30952#27425
      FieldName = #23383#31526#30952#27425
      FieldLength = 10
      DisplayWidth = 10
      Position = 14
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
    OpenDataSource = False
    UserName = 'DB38'
    Left = 160
    Top = 80
    object ppDB38ppField1: TppField
      FieldAlias = #24037#24207#20195#30721
      FieldName = #24037#24207#20195#30721
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB38ppField2: TppField
      FieldAlias = #24037#24207#21517#31216
      FieldName = #24037#24207#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB38ppField3: TppField
      FieldAlias = 'STEP_NUMBER'
      FieldName = 'STEP_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB38ppField4: TppField
      FieldAlias = #24037#20855#29256#26412
      FieldName = #24037#20855#29256#26412
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB38ppField5: TppField
      FieldAlias = #36807#25968
      FieldName = #36807#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB38ppField6: TppField
      FieldAlias = #20135#20986
      FieldName = #20135#20986
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB38ppField7: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB38ppField8: TppField
      FieldAlias = 'SOURCE_PTR'
      FieldName = 'SOURCE_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB38ppField9: TppField
      FieldAlias = #24037#33402#21442#25968
      FieldName = #24037#33402#21442#25968
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ADS30: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'select SEQ_NO as '#39#24207#21495#39', type as '#39#31867#22411#39', layer as '#39#23618#27425#39', refe_layer a' +
      's '#39#21442#32771#23618#39', line_width as '#39#23458#25143#32447#23485#39', line_ofsight as '#39#23458#25143#32447#36317#39','#13#10'adjust_l' +
      'inewidth as '#39#35843#25972#32447#23485#39', adjust_lineofsight as '#39#35843#25972#32447#36317#39', adjust_impedan' +
      'ce as '#39#32511#27833#21069#38459#25239#39', product_impedance as '#39#25104#21697#38459#25239#39', '#13#10'impedance_scope as' +
      ' '#39#38459#25239#25511#21046#33539#22260#39', orig_juli as '#39#21407#22987#21040#38108#30382#36317#31163#39', adjust_jiuli as '#39#35843#25972#21518#21040#38108#36317#31163#39' , s' +
      'ource_ptr,coupon,'#13#10'impedance_first as '#39#25104#21697#38459#25239#39318#20214#25511#21046#39',product_control' +
      ' as '#39#25104#21697#38459#25239#25511#21046#39',adjust_first as '#39#32511#27833#21069#39318#20214#25511#21046#39',adjust_control as '#39#32511#27833#21069#38459#25239#25511 +
      #21046#39'  '#13#10' from DATA0030'#13#10'where  source_ptr=:rkey'#13#10'order by SEQ_NO'
    DataSource = DataSource1
    IndexFieldNames = 'source_ptr'
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
    Left = 259
    Top = 174
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
    object ADS30DSDesigner7: TBCDField
      FieldName = #35843#25972#32447#23485
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
    object ADS30DSDesigner13: TBCDField
      FieldName = #35843#25972#21518#21040#38108#36317#31163
      Precision = 8
      Size = 3
    end
    object ADS30source_ptr: TIntegerField
      FieldName = 'source_ptr'
    end
    object ADS30DSDesigner6: TStringField
      FieldName = #23458#25143#32447#36317
      Size = 50
    end
    object ADS30DSDesigner8: TBCDField
      FieldName = #35843#25972#32447#36317
      Precision = 5
      Size = 2
    end
    object ADS30DSDesigner12: TStringField
      FieldName = #21407#22987#21040#38108#30382#36317#31163
      Size = 50
    end
    object ADS30coupon: TIntegerField
      FieldName = 'coupon'
    end
    object ADS30DSDesigner14: TStringField
      FieldName = #25104#21697#38459#25239#39318#20214#25511#21046
    end
    object ADS30DSDesigner15: TStringField
      FieldName = #25104#21697#38459#25239#25511#21046
    end
    object ADS30DSDesigner16: TStringField
      FieldName = #32511#27833#21069#39318#20214#25511#21046
    end
    object ADS30DSDesigner17: TStringField
      FieldName = #32511#27833#21069#38459#25239#25511#21046
    end
  end
  object DataSource6: TDataSource
    DataSet = ADS30
    Left = 291
    Top = 174
  end
  object ppDB30: TppDBPipeline
    DataSource = DataSource6
    OpenDataSource = False
    UserName = 'DB30'
    Left = 323
    Top = 174
    MasterDataPipelineName = 'ppDB25'
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
      FieldAlias = #35843#25972#32447#23485
      FieldName = #35843#25972#32447#23485
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 6
      Position = 5
    end
    object ppDB30ppField7: TppField
      FieldAlias = #32511#27833#21069#38459#25239
      FieldName = #32511#27833#21069#38459#25239
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppDB30ppField8: TppField
      FieldAlias = #25104#21697#38459#25239
      FieldName = #25104#21697#38459#25239
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppDB30ppField9: TppField
      FieldAlias = #38459#25239#25511#21046#33539#22260
      FieldName = #38459#25239#25511#21046#33539#22260
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
    object ppDB30ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = #35843#25972#21518#21040#38108#36317#31163
      FieldName = #35843#25972#21518#21040#38108#36317#31163
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 9
      Position = 9
    end
    object ppDB30ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'source_ptr'
      FieldName = 'source_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppDB30ppField12: TppField
      FieldAlias = #23458#25143#32447#36317
      FieldName = #23458#25143#32447#36317
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppDB30ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = #35843#25972#32447#36317
      FieldName = #35843#25972#32447#36317
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 6
      Position = 12
    end
    object ppDB30ppField14: TppField
      FieldAlias = #21407#22987#21040#38108#30382#36317#31163
      FieldName = #21407#22987#21040#38108#30382#36317#31163
      FieldLength = 50
      DisplayWidth = 50
      Position = 13
    end
    object ppDB30ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'coupon'
      FieldName = 'coupon'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 14
    end
    object ppDB30ppField16: TppField
      FieldAlias = #25104#21697#38459#25239#39318#20214#25511#21046
      FieldName = #25104#21697#38459#25239#39318#20214#25511#21046
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppDB30ppField17: TppField
      FieldAlias = #25104#21697#38459#25239#25511#21046
      FieldName = #25104#21697#38459#25239#25511#21046
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object ppDB30ppField18: TppField
      FieldAlias = #32511#27833#21069#39318#20214#25511#21046
      FieldName = #32511#27833#21069#39318#20214#25511#21046
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppDB30ppField19: TppField
      FieldAlias = #32511#27833#21069#38459#25239#25511#21046
      FieldName = #32511#27833#21069#38459#25239#25511#21046
      FieldLength = 10
      DisplayWidth = 10
      Position = 18
    end
  end
end
