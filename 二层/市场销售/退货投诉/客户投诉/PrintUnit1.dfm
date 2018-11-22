object PrintForm1: TPrintForm1
  Left = 192
  Top = 119
  Width = 505
  Height = 434
  Caption = 'PrintForm1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource3: TDataSource
    DataSet = ADOQALL2
    Left = 159
    Top = 51
  end
  object DataSource4: TDataSource
    DataSet = ADOQ0118
    Left = 159
    Top = 108
  end
  object ppReport1: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '6350'
      '105039')
    DataPipeline = Defects
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 320
    Top = 24
    Version = '7.01'
    mmColumnWidth = 98689
    DataPipelineName = 'Defects'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 56092
      mmPrintPosition = 0
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
        Caption = #23458#25143#20195#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 8202
        mmTop = 31221
        mmWidth = 12982
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Company_Name'
        DataPipeline = CompanyInfo
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'CompanyInfo'
        mmHeight = 6615
        mmLeft = 49477
        mmTop = 3175
        mmWidth = 91281
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'Company_Icon'
        DataPipeline = CompanyInfo
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'CompanyInfo'
        mmHeight = 13229
        mmLeft = 4233
        mmTop = 3175
        mmWidth = 20638
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #23458#25143#25237#35785#20449#24687#25253#21578
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6421
        mmLeft = 71967
        mmTop = 12171
        mmWidth = 45720
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CUST_CODE'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 31485
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20135#21697#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 39688
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MANU_PART_NUMBER'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 39952
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #20135#21697#25551#36848
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 7673
        mmTop = 50006
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'MANU_PART_DESC'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 24077
        mmTop = 50271
        mmWidth = 48419
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #24314#26723#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 123825
        mmTop = 21696
        mmWidth = 12982
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'Ent_EMPLOYEE_NAME'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 137848
        mmTop = 21696
        mmWidth = 23548
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'LOG_DATE'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 162719
        mmTop = 21696
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #21463#29702#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 124090
        mmTop = 26723
        mmWidth = 12982
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'Dealt_EMPLOYEE_NAME'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 26723
        mmWidth = 23548
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'DEALT_DATE'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 26723
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #32467#26696#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 124090
        mmTop = 31750
        mmWidth = 12982
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'Close_EMPLOYEE_NAME'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 138113
        mmTop = 31750
        mmWidth = 23548
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'CLOSED_DATE'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 162984
        mmTop = 31750
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #25237#35785#25209#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 88636
        mmTop = 39952
        mmWidth = 12982
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'QTY'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 40217
        mmWidth = 23548
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25237#35785#32423#21035
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 88636
        mmTop = 44979
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'EFFECT_TP'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 105304
        mmTop = 45508
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #20986#36135#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 88900
        mmTop = 50271
        mmWidth = 12982
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'SHIP_DATE'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 105304
        mmTop = 50536
        mmWidth = 48419
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        Caption = #25237#35785#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 8202
        mmTop = 26194
        mmWidth = 12982
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'LOG_NUMBER'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 26458
        mmWidth = 23548
        BandType = 0
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #25237#35785#38382#39064'/'#32570#38519
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6879
        mmTop = 529
        mmWidth = 24077
        BandType = 2
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #26159#21542#20027#35201
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 61119
        mmTop = 794
        mmWidth = 12965
        BandType = 2
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 265
        mmLeft = 6879
        mmTop = 5027
        mmWidth = 83873
        BandType = 2
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MyREJECT_DESCRIPTION'
        DataPipeline = Defects
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Defects'
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 795
        mmWidth = 47361
        BandType = 4
      end
      object myDBCheckBox1: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        BooleanFalse = 'False'
        BooleanTrue = 'True'
        DataPipeline = Defects
        DataField = 'FLAG'
        Transparent = True
        DataPipelineName = 'Defects'
        mmHeight = 6350
        mmLeft = 66940
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 87842
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 264
        mmLeft = 3970
        mmTop = 0
        mmWidth = 191560
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #25237#35785#21463#29702#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 6085
        mmTop = 3440
        mmWidth = 19473
        BandType = 8
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'loss_amt'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 3704
        mmLeft = 27252
        mmTop = 10848
        mmWidth = 48419
        BandType = 8
      end
      object ppLabel16: TppLabel
        UserName = 'Label101'
        Caption = #32463#27982#25439#22833#35780#20272
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 5821
        mmTop = 10848
        mmWidth = 19473
        BandType = 8
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #25237#35785#21407#22240#20998#26512
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 6350
        mmTop = 17992
        mmWidth = 19473
        BandType = 8
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'ANALYSIS'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 54503
        mmLeft = 6614
        mmTop = 24077
        mmWidth = 59944
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #25913#21892#34892#21160
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 69850
        mmTop = 18521
        mmWidth = 12982
        BandType = 8
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'AFTER_ACTION'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 54503
        mmLeft = 70114
        mmTop = 24605
        mmWidth = 59944
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #25237#35785#32467#26696#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 135202
        mmTop = 3969
        mmWidth = 19473
        BandType = 8
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #25237#35785#32467#26696#20449#24687
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 135467
        mmTop = 18521
        mmWidth = 19473
        BandType = 8
      end
      object ppDBMemo3: TppDBMemo
        UserName = 'DBMemo3'
        CharWrap = False
        DataField = 'RESULT'
        DataPipeline = BaseInfo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'BaseInfo'
        mmHeight = 54503
        mmLeft = 135733
        mmTop = 24605
        mmWidth = 59944
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
  end
  object BaseInfo: TppDBPipeline
    DataSource = DataSource3
    UserName = 'BaseInfo'
    Left = 208
    Top = 48
    object BaseInfoppField1: TppField
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField2: TppField
      FieldAlias = 'LOG_NUMBER'
      FieldName = 'LOG_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField3: TppField
      FieldAlias = 'CUSTOMER_PART_PTR'
      FieldName = 'CUSTOMER_PART_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField4: TppField
      FieldAlias = 'CSI_USER_PTR'
      FieldName = 'CSI_USER_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField5: TppField
      FieldAlias = 'CUSTOMER_PTR'
      FieldName = 'CUSTOMER_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField6: TppField
      FieldAlias = 'LOG_DATE'
      FieldName = 'LOG_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField7: TppField
      FieldAlias = 'SHIP_DATE'
      FieldName = 'SHIP_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField8: TppField
      FieldAlias = 'QTY'
      FieldName = 'QTY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField9: TppField
      FieldAlias = 'EFFECT_TP'
      FieldName = 'EFFECT_TP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField10: TppField
      FieldAlias = 'ANALYSIS'
      FieldName = 'ANALYSIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField11: TppField
      FieldAlias = 'AFTER_ACTION'
      FieldName = 'AFTER_ACTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField12: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField13: TppField
      FieldAlias = 'CLOSED_BY_PTR'
      FieldName = 'CLOSED_BY_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField14: TppField
      FieldAlias = 'CLOSED_DATE'
      FieldName = 'CLOSED_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField15: TppField
      FieldAlias = 'DEALT_BY_PTR'
      FieldName = 'DEALT_BY_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField16: TppField
      FieldAlias = 'DEALT_DATE'
      FieldName = 'DEALT_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField17: TppField
      FieldAlias = 'LOSS_AMT'
      FieldName = 'LOSS_AMT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField18: TppField
      FieldAlias = 'RESULT'
      FieldName = 'RESULT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField19: TppField
      FieldAlias = 'CONTENT'
      FieldName = 'CONTENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField20: TppField
      FieldAlias = 'CUST_CODE'
      FieldName = 'CUST_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField21: TppField
      FieldAlias = 'CUSTOMER_NAME'
      FieldName = 'CUSTOMER_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField22: TppField
      FieldAlias = 'MANU_PART_NUMBER'
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField23: TppField
      FieldAlias = 'MANU_PART_DESC'
      FieldName = 'MANU_PART_DESC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField24: TppField
      FieldAlias = 'Mystatus'
      FieldName = 'Mystatus'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField25: TppField
      FieldAlias = 'Close_EMPLOYEE_NAME'
      FieldName = 'Close_EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField26: TppField
      FieldAlias = 'Dealt_EMPLOYEE_NAME'
      FieldName = 'Dealt_EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object BaseInfoppField27: TppField
      FieldAlias = 'Ent_EMPLOYEE_NAME'
      FieldName = 'Ent_EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
  end
  object CompanyInfo: TppDBPipeline
    DataSource = DataSource1
    UserName = 'CompanyInfo'
    Left = 208
    Top = 200
    object CompanyInfoppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object CompanyInfoppField2: TppField
      FieldAlias = 'Company_name2'
      FieldName = 'Company_name2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object CompanyInfoppField3: TppField
      FieldAlias = 'Company_name3'
      FieldName = 'Company_name3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object CompanyInfoppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object CompanyInfoppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object CompanyInfoppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object CompanyInfoppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object CompanyInfoppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object CompanyInfoppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
    object CompanyInfoppField10: TppField
      FieldAlias = 'GenParam1'
      FieldName = 'GenParam1'
      FieldLength = 1500
      DisplayWidth = 1500
      Position = 9
    end
    object CompanyInfoppField11: TppField
      FieldAlias = 'GenParam2'
      FieldName = 'GenParam2'
      FieldLength = 1500
      DisplayWidth = 1500
      Position = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = TCompanyInfo
    Left = 168
    Top = 200
  end
  object TCompanyInfo: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 122
    Top = 196
    object TCompanyInfoCompany_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object TCompanyInfoCompany_name2: TStringField
      FieldName = 'Company_name2'
      Size = 50
    end
    object TCompanyInfoCompany_name3: TStringField
      FieldName = 'Company_name3'
      Size = 50
    end
    object TCompanyInfoship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object TCompanyInfoCompany_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object TCompanyInfoSITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object TCompanyInfoSITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object TCompanyInfoSITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object TCompanyInfoSITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
    object TCompanyInfoGenParam1: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'GenParam1'
      Size = 1500
      Calculated = True
    end
    object TCompanyInfoGenParam2: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'GenParam2'
      Size = 1500
      Calculated = True
    end
  end
  object Defects: TppDBPipeline
    DataSource = DataSource4
    UserName = 'Defects'
    Left = 208
    Top = 112
    object DefectsppField1: TppField
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DefectsppField2: TppField
      FieldAlias = 'SOURCE_PTR'
      FieldName = 'SOURCE_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DefectsppField3: TppField
      FieldAlias = 'defect_ptr'
      FieldName = 'defect_ptr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DefectsppField4: TppField
      FieldAlias = 'RESP_DEPT_PTR'
      FieldName = 'RESP_DEPT_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DefectsppField5: TppField
      FieldAlias = 'MyREJ_CODE'
      FieldName = 'MyREJ_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DefectsppField6: TppField
      FieldAlias = 'MyREJECT_DESCRIPTION'
      FieldName = 'MyREJECT_DESCRIPTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DefectsppField7: TppField
      FieldAlias = 'MyDEPT_CODE'
      FieldName = 'MyDEPT_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DefectsppField8: TppField
      FieldAlias = 'MyDEPT_NAME'
      FieldName = 'MyDEPT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DefectsppField9: TppField
      FieldAlias = 'FLAG'
      FieldName = 'FLAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ADOQALL2: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey0101'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT Data0101.*, Data0010.CUST_CODE, Data0010.CUSTOMER_NAME, '
      
        '      Data0005.EMPLOYEE_NAME AS Close_EMPLOYEE_NAME, Data0025.MA' +
        'NU_PART_NUMBER, '
      '      Data0025.MANU_PART_DESC, '
      '      Data0005_1.EMPLOYEE_NAME AS Dealt_EMPLOYEE_NAME, '
      '      Data0005_2.EMPLOYEE_NAME AS Ent_EMPLOYEE_NAME'
      'FROM Data0101 INNER JOIN'
      
        '      Data0010 ON Data0101.CUSTOMER_PTR = Data0010.RKEY INNER JO' +
        'IN'
      '      Data0025 ON '
      '      Data0101.CUSTOMER_PART_PTR = Data0025.RKEY LEFT OUTER JOIN'
      '      Data0005 Data0005_2 ON '
      '      Data0101.CSI_USER_PTR = Data0005_2.RKEY LEFT OUTER JOIN'
      '      Data0005 Data0005_1 ON '
      '      Data0101.DEALT_BY_PTR = Data0005_1.RKEY LEFT OUTER JOIN'
      '      Data0005 ON Data0101.CLOSED_BY_PTR = Data0005.RKEY'
      'where data0101.rkey = :rkey0101')
    Left = 120
    Top = 48
    object ADOQALL2RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQALL2LOG_NUMBER: TStringField
      DisplayLabel = #25237#35785#32534#21495
      FieldName = 'LOG_NUMBER'
      FixedChar = True
      Size = 10
    end
    object ADOQALL2CUSTOMER_PART_PTR: TIntegerField
      FieldName = 'CUSTOMER_PART_PTR'
    end
    object ADOQALL2CSI_USER_PTR: TIntegerField
      FieldName = 'CSI_USER_PTR'
    end
    object ADOQALL2CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object ADOQALL2LOG_DATE: TDateTimeField
      DisplayLabel = #24314#26723#26085#26399
      FieldName = 'LOG_DATE'
    end
    object ADOQALL2SHIP_DATE: TDateTimeField
      DisplayLabel = #20986#36135#26085#26399
      FieldName = 'SHIP_DATE'
    end
    object ADOQALL2QTY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QTY'
    end
    object ADOQALL2EFFECT_TP: TStringField
      DisplayLabel = #32423#21035
      FieldName = 'EFFECT_TP'
      FixedChar = True
      Size = 2
    end
    object ADOQALL2ANALYSIS: TStringField
      DisplayLabel = #21407#22240#20998#26512
      FieldName = 'ANALYSIS'
      Size = 600
    end
    object ADOQALL2AFTER_ACTION: TStringField
      DisplayLabel = #25913#21892#34892#21160
      FieldName = 'AFTER_ACTION'
      Size = 600
    end
    object ADOQALL2STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object ADOQALL2CLOSED_BY_PTR: TIntegerField
      FieldName = 'CLOSED_BY_PTR'
    end
    object ADOQALL2CLOSED_DATE: TDateTimeField
      DisplayLabel = #32467#26696#26085#26399
      FieldName = 'CLOSED_DATE'
    end
    object ADOQALL2DEALT_BY_PTR: TIntegerField
      FieldName = 'DEALT_BY_PTR'
    end
    object ADOQALL2DEALT_DATE: TDateTimeField
      DisplayLabel = #21463#29702#26085#26399
      FieldName = 'DEALT_DATE'
    end
    object ADOQALL2LOSS_AMT: TIntegerField
      DisplayLabel = #32463#27982#25439#22833#20272#35745
      FieldName = 'LOSS_AMT'
    end
    object ADOQALL2RESULT: TStringField
      DisplayLabel = #25237#35785#32467#26696#20449#24687
      FieldName = 'RESULT'
      Size = 600
    end
    object ADOQALL2CONTENT: TStringField
      DisplayLabel = #25237#35785#20869#23481#25551#36848
      FieldName = 'CONTENT'
      Size = 600
    end
    object ADOQALL2CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ADOQALL2CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ADOQALL2MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ADOQALL2MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ADOQALL2Mystatus: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'Mystatus'
      Size = 10
      Calculated = True
    end
    object ADOQALL2Close_EMPLOYEE_NAME: TStringField
      DisplayLabel = #32467#26696#20154
      FieldName = 'Close_EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQALL2Dealt_EMPLOYEE_NAME: TStringField
      DisplayLabel = #21463#29702#20154
      FieldName = 'Dealt_EMPLOYEE_NAME'
      Size = 16
    end
    object ADOQALL2Ent_EMPLOYEE_NAME: TStringField
      DisplayLabel = #24314#26723#20154
      FieldName = 'Ent_EMPLOYEE_NAME'
      Size = 16
    end
  end
  object ADOQ0118: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey0101'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * '
      'from data0118 '
      'where SOURCE_PTR = :rkey0101')
    Left = 120
    Top = 112
    object ADOQ0118RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ0118SOURCE_PTR: TIntegerField
      FieldName = 'SOURCE_PTR'
    end
    object ADOQ0118defect_ptr: TIntegerField
      FieldName = 'defect_ptr'
    end
    object ADOQ0118RESP_DEPT_PTR: TIntegerField
      FieldName = 'RESP_DEPT_PTR'
    end
    object ADOQ0118MyREJ_CODE: TStringField
      DisplayLabel = #25237#35785#20195#30721
      FieldKind = fkLookup
      FieldName = 'MyREJ_CODE'
      LookupDataSet = ADOQ39
      LookupKeyFields = 'RKEY'
      LookupResultField = 'REJ_CODE'
      KeyFields = 'defect_ptr'
      Lookup = True
    end
    object ADOQ0118MyREJECT_DESCRIPTION: TStringField
      DisplayLabel = #25237#35785#25551#36848
      FieldKind = fkLookup
      FieldName = 'MyREJECT_DESCRIPTION'
      LookupDataSet = ADOQ39
      LookupKeyFields = 'RKEY'
      LookupResultField = 'REJECT_DESCRIPTION'
      KeyFields = 'defect_ptr'
      Lookup = True
    end
    object ADOQ0118MyDEPT_CODE: TStringField
      DisplayLabel = #36131#20219#37096#38376#20195#30721
      FieldKind = fkLookup
      FieldName = 'MyDEPT_CODE'
      LookupDataSet = ADOQ34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_CODE'
      KeyFields = 'RESP_DEPT_PTR'
      Lookup = True
    end
    object ADOQ0118MyDEPT_NAME: TStringField
      DisplayLabel = #36131#20219#37096#38376#21517#31216
      FieldKind = fkLookup
      FieldName = 'MyDEPT_NAME'
      LookupDataSet = ADOQ34
      LookupKeyFields = 'RKEY'
      LookupResultField = 'DEPT_NAME'
      KeyFields = 'RESP_DEPT_PTR'
      Lookup = True
    end
    object ADOQ0118FLAG: TBooleanField
      DisplayLabel = #20998#26512
      FieldName = 'FLAG'
    end
  end
  object ADOQ34: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select RKEY,DEPT_CODE,DEPT_NAME'
      'from data0034')
    Left = 264
    Top = 112
    object ADOQ34RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ34DEPT_CODE: TStringField
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object ADOQ34DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object ADOQ39: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select RKEY,REJ_CODE,REJECT_DESCRIPTION'
      'from data0039')
    Left = 312
    Top = 112
    object ADOQ39RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADOQ39REJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      Size = 5
    end
    object ADOQ39REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      Size = 30
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
    Left = 384
    Top = 32
  end
end
