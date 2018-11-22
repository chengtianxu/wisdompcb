object Form_trp: TForm_trp
  Left = 406
  Top = 207
  Width = 290
  Height = 260
  Caption = #29305#27530#20986#20179#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object AQ415: TADOQuery
    Connection = Form4.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQ415CalcFields
    Parameters = <
      item
        Name = 'rkey415'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT data0415.number,data0415.type,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      '      Data0005.EMPLOYEE_NAME, dbo.data0415.sys_date,'
      '      dbo.data0415.quantity, dbo.data0415.reference,'
      
        '      dbo.Data0010.ABBR_NAME AS abbr_name10, dbo.Data0010.CUST_C' +
        'ODE,'
      '      dbo.Data0010.CUSTOMER_NAME, dbo.data0415.auth_date,'
      '      Data0005_1.EMPLOYEE_NAME AS '#20986#20179#20154#21592
      'FROM dbo.data0415 INNER JOIN'
      
        '      dbo.Data0025 ON dbo.data0415.custpart_ptr = dbo.Data0025.R' +
        'KEY INNER JOIN'
      
        '      dbo.Data0005 ON dbo.data0415.empl_ptr = dbo.Data0005.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0010 ON'
      
        '      dbo.Data0025.CUSTOMER_PTR = dbo.Data0010.RKEY LEFT OUTER J' +
        'OIN'
      '      dbo.Data0005 Data0005_1 ON'
      '      dbo.data0415.auth_empl_ptr = Data0005_1.RKEY'
      'where data0415.rkey=:rkey415')
    Left = 96
    Top = 55
    object AQ415number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object AQ415EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ415sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object AQ415quantity: TIntegerField
      FieldName = 'quantity'
    end
    object AQ415reference: TStringField
      FieldName = 'reference'
      Size = 50
    end
    object AQ415abbr_name10: TStringField
      FieldName = 'abbr_name10'
      Size = 10
    end
    object AQ415CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object AQ415CUSTOMER_NAME: TStringField
      FieldName = 'CUSTOMER_NAME'
      Size = 30
    end
    object AQ415auth_date: TDateTimeField
      FieldName = 'auth_date'
    end
    object AQ415DSDesigner: TStringField
      FieldName = #20986#20179#20154#21592
      Size = 16
    end
    object AQ415v_type: TStringField
      DisplayLabel = #20986#20179#31867#22411
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 8
      Calculated = True
    end
    object AQ415type: TWordField
      FieldName = 'type'
    end
    object AQ415MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQ415MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ415
    Left = 128
    Top = 56
  end
  object DataSource2: TDataSource
    DataSet = Aq465
    Left = 128
    Top = 88
  end
  object DataSource3: TDataSource
    DataSet = Aq493
    Left = 128
    Top = 123
  end
  object Aq493: TADOQuery
    Connection = Form4.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 96
    Top = 123
    object Aq493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object Aq493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object Aq493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object Aq493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object Aq493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object Aq493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object Aq493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object Aq465: TADOQuery
    Connection = Form4.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey415'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 20
      end>
    SQL.Strings = (
      'SELECT dbo.Data0016.LOCATION, dbo.Data0015.ABBR_NAME, '
      
        '      dbo.Data0006.WORK_ORDER_NUMBER, dbo.Data0053.REFERENCE_NUM' +
        'BER, '
      '      dbo.Data0465.REFERENCE, dbo.Data0465.QUANTITY'
      'FROM dbo.Data0016 INNER JOIN'
      
        '      dbo.Data0053 ON dbo.Data0016.RKEY = dbo.Data0053.LOC_PTR I' +
        'NNER JOIN'
      
        '      dbo.Data0465 ON dbo.Data0053.RKEY = dbo.Data0465.D0053_PTR' +
        ' INNER JOIN'
      '      dbo.Data0015 ON '
      '      dbo.Data0053.WHSE_PTR = dbo.Data0015.RKEY LEFT OUTER JOIN'
      
        '      dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PTR = dbo.Data0006' +
        '.RKEY'
      'where data0465.heard_ptr=:rkey415      ')
    Left = 96
    Top = 88
    object Aq465LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
    object Aq465ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aq465WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object Aq465REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object Aq465REFERENCE: TStringField
      FieldName = 'REFERENCE'
      Size = 50
    end
    object Aq465QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
  end
  object ppDB465: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DBP465'
    Left = 160
    Top = 90
    MasterDataPipelineName = 'ppDB415'
    object ppDB465ppField1: TppField
      FieldAlias = 'LOCATION'
      FieldName = 'LOCATION'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB465ppField2: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB465ppField3: TppField
      FieldAlias = 'WORK_ORDER_NUMBER'
      FieldName = 'WORK_ORDER_NUMBER'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB465ppField4: TppField
      FieldAlias = 'REFERENCE_NUMBER'
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB465ppField5: TppField
      FieldAlias = 'REFERENCE'
      FieldName = 'REFERENCE'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB465ppField6: TppField
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 123
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB465
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
    Template.FileName = 'R:\NIERP\Report\Tout_warehoue.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zsPercentage
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 220
    Top = 67
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB465'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #29305#27530#20986#20179#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7408
        mmLeft = 74877
        mmTop = 2646
        mmWidth = 32015
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #26412#21378#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 12700
        mmWidth = 14023
        BandType = 1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'CUSTOMER_PART_NUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4163
        mmLeft = 22225
        mmTop = 12700
        mmWidth = 48613
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #23458#25143#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 18521
        mmWidth = 14023
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CUSTOMER_PART_DESC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4163
        mmLeft = 22225
        mmTop = 18521
        mmWidth = 43180
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #29256#26412
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 55563
        mmTop = 12700
        mmWidth = 7144
        BandType = 1
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'CP_REV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4163
        mmLeft = 66401
        mmTop = 12700
        mmWidth = 14041
        BandType = 1
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'v_type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 122502
        mmTop = 12700
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #20986#20179#31867#22411
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 102923
        mmTop = 12700
        mmWidth = 14023
        BandType = 1
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4163
        mmLeft = 164307
        mmTop = 12700
        mmWidth = 11924
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #20986#20179#21333#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 12700
        mmWidth = 14023
        BandType = 1
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'auth_date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4163
        mmLeft = 164042
        mmTop = 18256
        mmWidth = 15804
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #20986#20179#26085#26399
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 18256
        mmWidth = 14023
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        mmHeight = 7408
        mmLeft = 5556
        mmTop = 0
        mmWidth = 179123
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #24037#20316#23450#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 9790
        mmTop = 1323
        mmWidth = 14111
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #24037#21378
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 50536
        mmTop = 1323
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #20179#24211
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 74877
        mmTop = 1323
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #20855#20307#20301#32622
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 126736
        mmTop = 1588
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 1323
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #20986#20179#25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 103717
        mmTop = 1323
        mmWidth = 14111
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 5556
        mmTop = 0
        mmWidth = 178859
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'WORK_ORDER_NUMBER'
        DataPipeline = ppDB465
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB465'
        mmHeight = 4163
        mmLeft = 8202
        mmTop = 1588
        mmWidth = 42968
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'ABBR_NAME'
        DataPipeline = ppDB465
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB465'
        mmHeight = 4163
        mmLeft = 43048
        mmTop = 1588
        mmWidth = 21590
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'LOCATION'
        DataPipeline = ppDB465
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB465'
        mmHeight = 4163
        mmLeft = 73290
        mmTop = 1588
        mmWidth = 12559
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'REFERENCE_NUMBER'
        DataPipeline = ppDB465
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB465'
        mmHeight = 4233
        mmLeft = 124884
        mmTop = 2117
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'REFERENCE'
        DataPipeline = ppDB465
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB465'
        mmHeight = 4163
        mmLeft = 156898
        mmTop = 1588
        mmWidth = 21661
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 5556
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 38894
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 66146
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 93134
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 120386
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 149754
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 184415
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'QUANTITY'
        DataPipeline = ppDB465
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB465'
        mmHeight = 4163
        mmLeft = 98893
        mmTop = 1852
        mmWidth = 17851
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 2646
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #25968#37327#21512#35745
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4163
        mmLeft = 131852
        mmTop = 1323
        mmWidth = 14111
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'QUANTITY'
        DataPipeline = ppDB465
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB465'
        mmHeight = 4163
        mmLeft = 159544
        mmTop = 1323
        mmWidth = 17198
        BandType = 7
      end
    end
  end
  object ppDB415: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB415'
    Left = 160
    Top = 56
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
    Left = 224
    Top = 120
  end
end
