object FrmReport6: TFrmReport6
  Left = 321
  Top = 398
  Width = 351
  Height = 210
  Caption = #20986#20179#21333'-'#21040#37096#38376'/'#24037#24207
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource3: TDataSource
    DataSet = ADO1
    Left = 159
    Top = 43
  end
  object DataSource4: TDataSource
    DataSet = ADOData0493
    Left = 159
    Top = 76
  end
  object ADOData0493: TADODataSet
    Connection = MainForm.ADOConnection1
    CursorType = ctStatic
    CommandText = 'select * from data0493'#13#10
    Parameters = <>
    Left = 121
    Top = 75
  end
  object ADO1: TADOQuery
    Connection = MainForm.ADOConnection1
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
      'SELECT TOP 100 PERCENT dbo.Data0017.INV_PART_NUMBER, '
      
        '      dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_CODE,' +
        ' '
      
        '      dbo.Data0034.DEPT_CODE, dbo.Data0022.BARCODE_ID, dbo.Data0' +
        '207.QUANTITY, '
      
        '      dbo.Data0207.TDATE, dbo.Data0023.CODE, dbo.Data0023.ABBR_N' +
        'AME, '
      '      dbo.Data0023.SUPPLIER_NAME, dbo.Data0023.ANALYSIS_CODE1, '
      '      dbo.Data0023.ANALYSIS_CODE2, dbo.Data0023.ANALYSIS_CODE3, '
      '      dbo.Data0015.WAREHOUSE_CODE'
      'FROM dbo.Data0207 INNER JOIN'
      
        '      dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.Data0017.' +
        'RKEY INNER JOIN'
      '      dbo.Data0002 ON '
      '      dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY INNER JOIN'
      
        '      dbo.Data0034 ON dbo.Data0207.DEPT_PTR = dbo.Data0034.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0022 ON dbo.Data0207.D0022_PTR = dbo.Data0022.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo.Data0456.RKEY I' +
        'NNER JOIN'
      
        '      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = dbo.Data0023.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0015 ON dbo.Data0456.warehouse_ptr = dbo.Data0015.' +
        'RKEY'
      'where data0207.gon_ptr=:vptr'
      'ORDER BY dbo.Data0017.INV_PART_NUMBER'
      ''
      ''
      '')
    Left = 120
    Top = 40
  end
  object Data0493: TppDBPipeline
    DataSource = DataSource4
    OpenDataSource = False
    UserName = 'DBCompany'
    Left = 192
    Top = 72
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
    Template.FileName = 'R:\NIERP\Report\GON2.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OnPreviewFormCreate = ppReport1PreviewFormCreate
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 232
    Top = 80
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
        mmHeight = 12171
        mmLeft = 3440
        mmTop = 2910
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #29289#26009#20986#20179'('#36864#20179')'#20973#35777
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 173567
        mmTop = 8467
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #20986#20179#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 8202
        mmTop = 31222
        mmWidth = 12982
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label12'
        Caption = #29289#21697#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 56356
        mmTop = 31222
        mmWidth = 12982
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label16'
        Caption = #21457#26009#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 132027
        mmTop = 31222
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label17'
        Caption = 'Barcode'#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 31222
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #20986#20179#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 116946
        mmTop = 31222
        mmWidth = 6615
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 794
        mmWidth = 8202
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 794
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'inv_part_number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 54504
        mmTop = 794
        mmWidth = 60854
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
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
          DisplayFormat = '#0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 121973
          mmTop = 529
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = #23567#35745
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
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
        5661726961626C65324F6E43616C630B50726F6772616D54797065070B747450
        726F63656475726506536F75726365066E70726F636564757265205661726961
        626C65324F6E43616C63287661722056616C75653A2056617269616E74293B0D
        0A626567696E0D0A0D0A202056616C7565203A3D207472696D284442436F6D70
        616E795B27436F6D70616E795F4E616D65275D293B0D0A0D0A656E643B0D0A0D
        436F6D706F6E656E744E616D6506095661726961626C6532094576656E744E61
        6D6506064F6E43616C63074576656E74494402210000}
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
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
      FieldAlias = 'tdate'
      FieldName = 'tdate'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'code'
      FieldName = 'code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 8
    end
    object ppDBPipeline1ppField10: TppField
      FieldAlias = 'abbr_name'
      FieldName = 'abbr_name'
      FieldLength = 10
      DisplayWidth = 10
      Position = 9
    end
    object ppDBPipeline1ppField11: TppField
      FieldAlias = 'supplier_name'
      FieldName = 'supplier_name'
      FieldLength = 30
      DisplayWidth = 30
      Position = 10
    end
    object ppDBPipeline1ppField12: TppField
      FieldAlias = 'analysis_code1'
      FieldName = 'analysis_code1'
      FieldLength = 20
      DisplayWidth = 20
      Position = 11
    end
    object ppDBPipeline1ppField13: TppField
      FieldAlias = 'analysis_code2'
      FieldName = 'analysis_code2'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object ppDBPipeline1ppField14: TppField
      FieldAlias = 'analysis_code3'
      FieldName = 'analysis_code3'
      FieldLength = 20
      DisplayWidth = 20
      Position = 13
    end
  end
end
