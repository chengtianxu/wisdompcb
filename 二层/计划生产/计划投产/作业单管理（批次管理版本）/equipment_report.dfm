object Form_equipmentreport: TForm_equipmentreport
  Left = 365
  Top = 209
  Width = 572
  Height = 410
  Caption = #24037#24207#35774#22791#21517#31216
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
  object ads493: TADODataSet
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 192
    Top = 192
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
  object DataSource3: TDataSource
    DataSet = ads493
    Left = 224
    Top = 192
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 256
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ADS25
    Left = 224
    Top = 120
  end
  object ADS25: TADODataSet
    Connection = Dmcon.ADOConnection1
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
      '.Data0025.OPT_LOT_SIZE as '#27969#36716#25209#37327', '#13#10'case Data0025.ONHOLD_SALES_FLA' +
      'G when 0 then '#39#26377#25928#39' when 1 then '#39#36807#26399#39' end as '#38144#21806#29366#24577', '#13#10#13#10'case Data00' +
      '25.TSTATUS'#13#10'   when 0 then '#39#24453#21046#20316#39' when 1 then '#39#24050#23457#26680#39' when 2 then '#39 +
      #23457#36864#22238#39' when 3 then '#39#24453#26816#26597#39#13#10'   when 4 then '#39#24453#23457#26680#39' when 5 then '#39#26816#36864#22238#39' w' +
      'hen 6 then '#39#26410#25552#20132#39' end as '#23457#25209#29366#24577','#13#10#13#10'case   Data0025.ttype  when 0 t' +
      'hen '#39#37327#20135#39' when 1 then '#39#26679#26495#39'  end as '#37327#20135#26679#26495','#13#10'case Data0025.green_fla' +
      'g when '#39'Y'#39' then '#39'RoHS'#39'  else '#39#38750'RoHS'#39' end as '#29615#20445#26631#35782','#13#10'case when dat' +
      'a0025.PARENT_PTR is null then '#39#22806#23618#39' ELSE '#39#20869#23618#39' end as  '#20135#21697#24615#36136#13#10'FROM ' +
      'dbo.Data0008 INNER JOIN'#13#10'      dbo.Data0025 ON '#13#10'      dbo.Data0' +
      '008.RKEY = dbo.Data0025.PROD_CODE_PTR INNER JOIN'#13#10'      dbo.Data' +
      '0010 ON '#13#10'      dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY LE' +
      'FT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_3 ON '#13#10'      dbo.Data' +
      '0025.CHECK_BY_PTR = Data0005_3.RKEY LEFT OUTER JOIN'#13#10'      dbo.D' +
      'ata0005 Data0005_2 ON '#13#10'      dbo.Data0025.LAST_MODIFIED_BY_PTR ' +
      '= Data0005_2.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0005 Data0005_1' +
      ' ON dbo.Data0025.AUDITED_BY_PTR = Data0005_1.RKEY'#13#10'where data002' +
      '5.rkey=:BOM_PTR'
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
    Left = 193
    Top = 120
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
  end
  object ads38: TADODataSet
    Connection = Dmcon.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0034.DEPT_CODE as '#24037#24207#20195#30721', Data0034.DEPT_NAME as '#24037#24207#21517#31216', D' +
      'ata0034.Work_Para as '#21697#36136#25171#21360#21442#25968','#13#10'      Data0038.STEP_NUMBER as '#27493#39588', ' +
      'Data0038.tooling_rev as '#24037#20855#29256#26412', '#13#10'      Data0034.BARCODE_ENTRY_FLA' +
      'G as '#36807#25968', Data0038.OUTP_SPFC as '#20135#20986', '#13#10'      Data0038.DEF_ROUT_INS' +
      'T as '#22791#27880', data0034.CYCLE_TIME as '#35774#22791#21517#31216#13#10'FROM Data0038 INNER JOIN'#13#10 +
      '      Data0034 ON dbo.Data0038.DEPT_PTR = Data0034.RKEY'#13#10'WHERE  ' +
      '(Data0038.SOURCE_PTR = :rkey) '#13#10'order by Data0038.STEP_NUMBER'
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
    Left = 192
    Top = 152
    object ads38DSDesigner: TStringField
      FieldName = #24037#24207#20195#30721
      Size = 10
    end
    object ads38DSDesigner2: TStringField
      FieldName = #24037#24207#21517#31216
      Size = 30
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
      Size = 200
    end
    object ads38DSDesigner7: TSmallintField
      FieldName = #27493#39588
    end
    object ads38DSDesigner8: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 200
    end
    object ads38DSDesigner9: TStringField
      FieldName = #21697#36136#25171#21360#21442#25968
      Size = 500
    end
  end
  object DataSource2: TDataSource
    DataSet = ads38
    Left = 224
    Top = 149
  end
  object ppDB38: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB38'
    Left = 256
    Top = 151
    MasterDataPipelineName = 'ppDB25'
  end
  object ppDB25: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB25'
    Left = 256
    Top = 120
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB38
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
    Template.FileName = 'D:\SJSYS\NIERP\REPORT\qa_track_report.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 304
    Top = 152
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB38'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #26412#21378#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 20902
        mmTop = 11113
        mmWidth = 15875
        BandType = 1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
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
        mmHeight = 3969
        mmLeft = 39688
        mmTop = 11113
        mmWidth = 17198
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 5630
        mmLeft = 64236
        mmTop = 2117
        mmWidth = 64939
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #26679#21697#21697#36136#36319#36394#34920
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4022
        mmLeft = 84138
        mmTop = 8731
        mmWidth = 24596
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
        mmLeft = 1852
        mmTop = 529
        mmWidth = 13229
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 8996
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #27493#39588
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 2381
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #24037#24207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 2381
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'AQ'#30830#35748#31614#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 43127
        mmTop = 529
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #25253#24223#25968#37327#21450#21407#22240
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 69056
        mmTop = 529
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        ShiftWithParent = True
        Caption = #24037#24207#39046#29677#31614#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 95250
        mmTop = 529
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #27969#36716#25968#37327'SET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 120650
        mmTop = 529
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #25910#26495#39046#29677#31614#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 143669
        mmTop = 265
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #24037#33402#38590#28857
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 168805
        mmTop = 2381
        mmWidth = 14023
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 14288
        mmTop = 0
        mmWidth = 3704
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 37042
        mmTop = 0
        mmWidth = 3704
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 64294
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 90223
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 114300
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 137584
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8996
        mmLeft = 160602
        mmTop = 0
        mmWidth = 3175
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #27493#39588
        DataPipeline = ppDB38
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 3979
        mmLeft = 2117
        mmTop = 1852
        mmWidth = 7154
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
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB38'
        mmHeight = 3979
        mmLeft = 15346
        mmTop = 1852
        mmWidth = 14012
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 0
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 14288
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 37306
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 64558
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 90223
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 114300
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 137584
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 160602
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentHeight = True
        Position = lpRight
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 193675
        mmTop = 0
        mmWidth = 3704
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
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
    Report = ppReport1
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 304
    Top = 192
  end
end
