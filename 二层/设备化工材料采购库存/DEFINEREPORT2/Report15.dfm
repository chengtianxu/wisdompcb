object FrmReport15: TFrmReport15
  Left = 316
  Top = 298
  Width = 351
  Height = 210
  Caption = #20986#20179#21333'-'#21040#37197#26009#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource4: TDataSource
    DataSet = ADOData0493
    Left = 159
    Top = 76
  end
  object ADOData0493: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 121
    Top = 76
  end
  object ppReport1: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 139700
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 256
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\GON.rtm'
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 232
    Top = 43
    Version = '7.01'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38365
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = Data0493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'Data0493'
        mmHeight = 8731
        mmLeft = 6879
        mmTop = 2910
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #29289#26009#20986#20179'('#36864#20179')'#20973#35777
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4868
        mmLeft = 83785
        mmTop = 9260
        mmWidth = 36689
        BandType = 0
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 173567
        mmTop = 3969
        mmWidth = 16369
        BandType = 0
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 173832
        mmTop = 8996
        mmWidth = 15946
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #20986#20179#26085#26399':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 11377
        mmTop = 18256
        mmWidth = 13899
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #21378#25151':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 17727
        mmTop = 23813
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #39046#26009#37096#38376':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 67469
        mmTop = 18256
        mmWidth = 13899
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #32463#25163#20154':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 70644
        mmTop = 23813
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20986#20179#21333#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 126471
        mmTop = 18256
        mmWidth = 13899
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #21442#32771#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 23813
        mmWidth = 10583
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'warehouse_code'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 26988
        mmTop = 23813
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'dept_code'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 83344
        mmTop = 18256
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #20986#20179#26085#26399':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 27252
        mmTop = 18256
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #32463#25163#20154
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 83608
        mmTop = 23813
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        Caption = #21442#32771#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 143140
        mmTop = 23813
        mmWidth = 9737
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 264
        mmLeft = 3970
        mmTop = 29369
        mmWidth = 191560
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 264
        mmLeft = 3970
        mmTop = 37306
        mmWidth = 191560
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label11'
        Caption = #29289#21697#20195#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 8202
        mmTop = 31221
        mmWidth = 12982
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label12'
        Caption = #21333#20301
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 56356
        mmTop = 31221
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label13'
        Caption = #29983#20135#20135#21697
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 65088
        mmTop = 31221
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label14'
        Caption = #37197#26009#21333#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 88371
        mmTop = 31221
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label15'
        Caption = #24635#37197#39069
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 116152
        mmTop = 31221
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label16'
        Caption = #21457#26009#25968#37327
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 132027
        mmTop = 31221
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label17'
        Caption = 'Barcode'#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 31221
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label18'
        Caption = #22791#27880'('#21097#20313#37197#39069')'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 166159
        mmTop = 31221
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #20986#20179#21333#21495
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 143140
        mmTop = 18256
        mmWidth = 12982
        BandType = 0
      end
      object ppVariable2: TppVariable
        UserName = 'Variable2'
        AutoSize = False
        CalcOrder = 0
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 37835
        mmTop = 3969
        mmWidth = 127794
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'inv_part_number'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 795
        mmWidth = 47361
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'unit_code'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 54504
        mmTop = 795
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'manu_part_number'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 63500
        mmTop = 795
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'cut_no'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 88371
        mmTop = 795
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'quan_bom'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 106098
        mmTop = 795
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'quantity'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 126471
        mmTop = 795
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'barcode_id'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 794
        mmWidth = 20108
        BandType = 4
      end
      object ppVariable1: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 794
        mmWidth = 13494
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label19'
        Caption = #39046#26009#20154':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 101336
        mmTop = 4498
        mmWidth = 10583
        BandType = 8
      end
      object ppLabel22: TppLabel
        UserName = 'Label21'
        Caption = #39046#26009#20154#31614#25910#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 135996
        mmTop = 4498
        mmWidth = 19473
        BandType = 8
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #39046#26009#20154
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 112977
        mmTop = 4498
        mmWidth = 15875
        BandType = 8
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 265
        mmLeft = 156369
        mmTop = 9260
        mmWidth = 35454
        BandType = 8
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 264
        mmLeft = 3970
        mmTop = 0
        mmWidth = 191560
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'inv_part_number'
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'quantity'
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          Transparent = True
          mmHeight = 3704
          mmLeft = 125677
          mmTop = 529
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = #23567#35745
          Font.Charset = GB2312_CHARSET
          Font.Color = clBlack
          Font.Name = #23435#20307
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3598
          mmLeft = 113242
          mmTop = 529
          mmWidth = 6491
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F
        5661726961626C65314F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F7572636514D400000070726F636564757265205661
        726961626C65314F6E43616C63287661722056616C75653A2056617269616E74
        293B0D0A626567696E0D0A09696620444244657461696C5B2764303436385F61
        6C745F72617465275D3E30207468656E0D0A09202056616C7565203A3D2027E6
        9BBFE69699270D0A09656C73652076616C75653A3D27E589A9E4BD99E680BBE9
        858DE9A29D272B666C6F6174746F73747228444244657461696C5B277175616E
        5F626F6D275D2D444244657461696C5B277175616E5F697373756564275D293B
        0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506095661726961626C65
        31094576656E744E616D6506064F6E43616C63074576656E7449440221000106
        0F5472614576656E7448616E646C65720B50726F6772616D4E616D65060F5661
        726961626C65324F6E43616C630B50726F6772616D54797065070B747450726F
        63656475726506536F75726365066E70726F636564757265205661726961626C
        65324F6E43616C63287661722056616C75653A2056617269616E74293B0D0A62
        6567696E0D0A0D0A202056616C7565203A3D207472696D284442436F6D70616E
        795B27436F6D70616E795F4E616D65275D293B0D0A0D0A656E643B0D0A0D436F
        6D706F6E656E744E616D6506095661726961626C6532094576656E744E616D65
        06064F6E43616C63074576656E74494402210000}
    end
  end
  object Data0493: TppDBPipeline
    DataSource = DataSource4
    UserName = 'DBCompany'
    Left = 192
    Top = 76
    object Data0493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object Data0493ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object Data0493ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object Data0493ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object Data0493ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object Data0493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object Data0493ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
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
    Left = 232
    Top = 76
  end
  object DataSource3: TDataSource
    DataSet = ADO1
    Left = 159
    Top = 43
  end
  object ADO1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'vptr'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 63
      end>
    SQL.Strings = (
      
        'select data0017.inv_part_number,data0017.inv_part_description,da' +
        'ta0002.unit_code,data0034.dept_code,'
      
        'data0022.barcode_id,data0015.warehouse_code,data0207.quantity,da' +
        'ta0207.d0468_alt_rate,data0207.tdate,'
      
        'data0468.cut_no,data0468.so_no,data0468.quan_bom,data0468.quan_i' +
        'ssued,data0025.manu_part_number,'
      
        'data0023.code,data0023.abbr_name,data0023.supplier_name,data0023' +
        '.analysis_code1,data0023.analysis_code2,data0023.analysis_code3'
      
        'from data0207,data0017,data0002,data0034,data0022,data0015,data0' +
        '468,data0492,data0025,data0023'
      'where data0207.d0468_ptr=data0468.rkey'
      'and data0207.inventory_ptr=data0017.rkey'
      'and data0017.stock_unit_ptr=data0002.rkey'
      'and data0207.dept_ptr=data0034.rkey'
      'and data0207.d0022_ptr=data0022.rkey'
      'and data0022.whouse_ptr=data0015.rkey'
      'and data0468.cut_no=data0492.cut_no'
      'and data0492.bom_ptr=data0025.rkey'
      'and data0022.supplier_ptr=data0023.rkey'
      'and data0207.gon_ptr=:vptr'
      'order by data0017.inv_part_number'
      ''
      '')
    Left = 120
    Top = 40
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DBDetail'
    Left = 192
    Top = 40
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'inv_part_number'
      FieldName = 'inv_part_number'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'inv_part_description'
      FieldName = 'inv_part_description'
      FieldLength = 40
      DisplayWidth = 40
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'unit_code'
      FieldName = 'unit_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'dept_code'
      FieldName = 'dept_code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'barcode_id'
      FieldName = 'barcode_id'
      FieldLength = 12
      DisplayWidth = 12
      Position = 4
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'warehouse_code'
      FieldName = 'warehouse_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'quantity'
      FieldName = 'quantity'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'd0468_alt_rate'
      FieldName = 'd0468_alt_rate'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'tdate'
      FieldName = 'tdate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'cut_no'
      FieldName = 'cut_no'
      FieldLength = 12
      DisplayWidth = 12
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'so_no'
      FieldName = 'so_no'
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'quan_bom'
      FieldName = 'quan_bom'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'quan_issued'
      FieldName = 'quan_issued'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'manu_part_number'
      FieldName = 'manu_part_number'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
    object ppDBPipeline1ppField15: TppField
      FieldAlias = 'code'
      FieldName = 'code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 14
    end
    object ppDBPipeline1ppField16: TppField
      FieldAlias = 'abbr_name'
      FieldName = 'abbr_name'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppDBPipeline1ppField17: TppField
      FieldAlias = 'supplier_name'
      FieldName = 'supplier_name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 16
    end
    object ppDBPipeline1ppField18: TppField
      FieldAlias = 'analysis_code1'
      FieldName = 'analysis_code1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 17
    end
    object ppDBPipeline1ppField19: TppField
      FieldAlias = 'analysis_code2'
      FieldName = 'analysis_code2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 18
    end
    object ppDBPipeline1ppField20: TppField
      FieldAlias = 'analysis_code3'
      FieldName = 'analysis_code3'
      FieldLength = 20
      DisplayWidth = 20
      Position = 19
    end
  end
end
