object Form_putoutintreport: TForm_putoutintreport
  Left = 566
  Top = 282
  Width = 283
  Height = 287
  Caption = #29983#20135#29289#26009#20986#20179#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB207
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 217000
    PrinterSetup.PaperSize = 256
    Units = utMillimeters
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
    Top = 88
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB207'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44979
      mmPrintPosition = 0
      object ppDBText12: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #20844#21496#21517#31216'1'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 6350
        mmLeft = 85725
        mmTop = 2117
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label1'
        Caption = #25910#36135#21333#20301':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 8996
        mmTop = 30427
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DEPT_NAME'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 3683
        mmLeft = 26194
        mmTop = 30427
        mmWidth = 25654
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label2'
        Caption = #20986#24211#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 14
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5556
        mmLeft = 89694
        mmTop = 15610
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label4'
        Caption = #20986#24211#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 158486
        mmTop = 22490
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'REF_NUMBER'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 4022
        mmLeft = 175948
        mmTop = 22490
        mmWidth = 17780
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label6'
        Caption = #20986#24211#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 142346
        mmTop = 30427
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CREATE_DATE'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 3979
        mmLeft = 159809
        mmTop = 30427
        mmWidth = 30692
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label7'
        Caption = #26448#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 47361
        mmTop = 38629
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label8'
        Caption = #26448#26009#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 80169
        mmTop = 38629
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label9'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4826
        mmLeft = 147241
        mmTop = 38629
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label10'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 162190
        mmTop = 38629
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label11'
        Caption = #20379#24212#21830#31616#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 175419
        mmTop = 38629
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label3'
        Caption = #26448#26009#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4826
        mmLeft = 9525
        mmTop = 38629
        mmWidth = 16933
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 529
        mmLeft = 6879
        mmTop = 44450
        mmWidth = 187590
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label15'
        Caption = #20986#20179#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 8996
        mmTop = 22490
        mmWidth = 17568
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'GON_NUMBER'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 4022
        mmLeft = 26723
        mmTop = 22490
        mmWidth = 17780
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppDBText18: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'INV_NAME'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3969
        mmLeft = 49213
        mmTop = 2381
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'INV_DESCRIPTION'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 3969
        mmLeft = 74348
        mmTop = 2381
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 4022
        mmLeft = 143473
        mmTop = 2381
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'QUANTITY'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 4022
        mmLeft = 159443
        mmTop = 2381
        mmWidth = 14224
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'ABBR_NAME'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 4022
        mmLeft = 180711
        mmTop = 2381
        mmWidth = 16002
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'INV_PART_NUMBER'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 4022
        mmLeft = 7408
        mmTop = 2381
        mmWidth = 26670
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label5'
        Caption = #21046#21333#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 16933
        mmWidth = 14023
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'Label12'
        Caption = #36865#36135#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 66411
        mmTop = 16933
        mmWidth = 14023
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'Label13'
        Caption = #25910#36135#21333#20301#30422#31456#21450#31614#21517#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 129911
        mmTop = 16933
        mmWidth = 35190
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'Line13'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 165100
        mmTop = 20638
        mmWidth = 28310
        BandType = 8
      end
      object ppDBText2: TppDBText
        UserName = 'DBText5'
        DataField = #21457#26009#20154#21592
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 3969
        mmLeft = 80169
        mmTop = 16933
        mmWidth = 17198
        BandType = 8
      end
      object ppDBText3: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 3969
        mmLeft = 20373
        mmTop = 16933
        mmWidth = 23019
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'Label14'
        Caption = #22791#27880#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 129911
        mmTop = 7144
        mmWidth = 10541
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 140494
        mmTop = 10848
        mmWidth = 52917
        BandType = 8
      end
      object ppDBText5: TppDBText
        UserName = 'DBText14'
        DataField = #22791#27880
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 3969
        mmLeft = 142611
        mmTop = 7144
        mmWidth = 17198
        BandType = 8
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = aq493
    Left = 88
    Top = 152
  end
  object aq493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'SELECT Company_Name as '#20844#21496#21517#31216'1, '
      'Company_Name2 as '#20844#21496#21517#31216'2, '
      'Company_Name3 as '#20844#21496#21517#31216'3, '
      'ship_address as '#20844#21496#22320#22336','
      'Company_Icon as '#20844#21496#22270#26631', '
      'SITE_INFO_ADD_1 as '#20844#21496#20301#32622'1, '
      'SITE_INFO_ADD_2 as '#20844#21496#20301#32622'2, '
      'SITE_INFO_ADD_3 as '#20844#21496#20301#32622'3, '
      'SITE_INFO_PHONE as '#30005#35805
      'FROM DATA0493')
    Left = 32
    Top = 152
    object aq493DSDesigner1: TStringField
      FieldName = #20844#21496#21517#31216'1'
      Size = 50
    end
    object aq493DSDesigner2: TStringField
      FieldName = #20844#21496#21517#31216'2'
      Size = 50
    end
    object aq493DSDesigner3: TStringField
      FieldName = #20844#21496#21517#31216'3'
      Size = 50
    end
    object aq493DSDesigner: TStringField
      FieldName = #20844#21496#22320#22336
      Size = 50
    end
    object aq493DSDesigner4: TBlobField
      FieldName = #20844#21496#22270#26631
    end
    object aq493DSDesigner12: TStringField
      FieldName = #20844#21496#20301#32622'1'
      FixedChar = True
      Size = 50
    end
    object aq493DSDesigner22: TStringField
      FieldName = #20844#21496#20301#32622'2'
      FixedChar = True
      Size = 50
    end
    object aq493DSDesigner32: TStringField
      FieldName = #20844#21496#20301#32622'3'
      FixedChar = True
      Size = 50
    end
    object aq493DSDesigner5: TStringField
      FieldName = #30005#35805
      FixedChar = True
      Size = 30
    end
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 152
    Top = 152
    object ppDBPipeline1ppField1: TppField
      FieldAlias = #20844#21496#21517#31216'1'
      FieldName = #20844#21496#21517#31216'1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = #20844#21496#21517#31216'2'
      FieldName = #20844#21496#21517#31216'2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = #20844#21496#21517#31216'3'
      FieldName = #20844#21496#21517#31216'3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = #20844#21496#22320#22336
      FieldName = #20844#21496#22320#22336
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = #20844#21496#22270#26631
      FieldName = #20844#21496#22270#26631
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = #20844#21496#20301#32622'1'
      FieldName = #20844#21496#20301#32622'1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = #20844#21496#20301#32622'2'
      FieldName = #20844#21496#20301#32622'2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = #20844#21496#20301#32622'3'
      FieldName = #20844#21496#20301#32622'3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = #30005#35805
      FieldName = #30005#35805
      FieldLength = 30
      DisplayWidth = 30
      Position = 8
    end
  end
  object DataSource2: TDataSource
    DataSet = aq457
    Left = 88
    Top = 24
  end
  object aq457: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0457.RKEY, dbo.Data0457.GON_NUMBER, '#13#10'     dbo.Da' +
      'ta0457.REF_NUMBER, '#13#10'      dbo.Data0457.CREATE_DATE, '#13#10'      dbo' +
      '.Data0015.ABBR_NAME, data0457.TTYPE,'#13#10'      dbo.Data0034.DEPT_CO' +
      'DE, dbo.Data0034.DEPT_NAME, '#13#10'      dbo.Data0005.EMPLOYEE_NAME,'#13 +
      #10'Data0005_1.EMPLOYEE_NAME as '#21457#26009#20154#21592','#13#10'case data0457.ttype when 1 t' +
      'hen '#39#25353#37197#26009#21333#39#13#10'when 2 then '#39#25353#37096#38376#39' when 3 then '#39#21457#26009#21040#36710#38388#39#13#10'when 4 then '#39 +
      #29289#26009#36864#20179#39' when 5 then '#39#26434#39033#29289#21697#39#13#10'when 6 then '#39#26434#39033#36864#20179#39#13#10'end as '#20986#20179#31867#22411','#13#10'case' +
      ' data0457.status when 0 then '#39#26410#23457#35745#39#13#10'when 1 then '#39#24050#23457#35745#39#13#10'end as '#29366#24577 +
      ',Data0457.Cut_No as '#22791#27880#13#10'FROM dbo.Data0457 INNER JOIN'#13#10'      dbo.' +
      'Data0015 ON dbo.Data0457.warehouse_ptr = dbo.Data0015.RKEY INNER' +
      ' JOIN'#13#10'      dbo.Data0034 ON dbo.Data0457.dept_ptr = dbo.Data003' +
      '4.RKEY INNER JOIN'#13#10'      dbo.Data0005 ON dbo.Data0457.RECD_BY = ' +
      'dbo.Data0005.RKEY INNER JOIN'#13#10'      dbo.Data0005 Data0005_1 ON d' +
      'bo.Data0457.CREATE_BY = Data0005_1.RKEY'#13#10'where data0457.rkey=:rk' +
      'ey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 24
    object aq457RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object aq457GON_NUMBER: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object aq457REF_NUMBER: TStringField
      DisplayLabel = #39046#26009#21333#21495
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object aq457CREATE_DATE: TDateTimeField
      DisplayLabel = #39046#26009#26085#26399
      FieldName = 'CREATE_DATE'
    end
    object aq457ABBR_NAME: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq457DEPT_CODE: TStringField
      DisplayLabel = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      Size = 10
    end
    object aq457DEPT_NAME: TStringField
      DisplayLabel = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object aq457EMPLOYEE_NAME: TStringField
      DisplayLabel = #39046#26009#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq457DSDesigner: TStringField
      FieldName = #20986#20179#31867#22411
      ReadOnly = True
      Size = 10
    end
    object aq457DSDesigner2: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object aq457TTYPE: TSmallintField
      FieldName = 'TTYPE'
    end
    object aq457DSDesigner3: TStringField
      FieldName = #21457#26009#20154#21592
      Size = 16
    end
    object aq457DSDesigner4: TStringField
      FieldName = #22791#27880
      Size = 40
    end
  end
  object DataSource3: TDataSource
    DataSet = ado207
    Left = 88
    Top = 88
  end
  object ado207: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT Data0017.INV_PART_NUMBER,Data0017.INV_NAME,Data0017.INV_D' +
      'ESCRIPTION,Data0207.QUANTITY, '#13#10'       Data0207.RTN_QUANTITY,Dat' +
      'a0002.UNIT_NAME,Data0022.rohs,Data0022.SUPPLIER2,Data0207.D0022_' +
      'PTR, '#13#10'       Data0022.QUAN_ON_HAND,Data0207.INVENTORY_PTR,Data0' +
      '207.RKEY,Data0017.QUAN_ON_HAND AS hand17, '#13#10'       Data0023.ABBR' +
      '_NAME'#13#10'FROM   Data0207 INNER JOIN'#13#10'       Data0017 ON Data0207.I' +
      'NVENTORY_PTR = Data0017.RKEY INNER JOIN'#13#10'       Data0022 ON Data' +
      '0207.D0022_PTR = Data0022.RKEY INNER JOIN'#13#10'       Data0002 ON Da' +
      'ta0022.LOCATION_PTR_FROM = Data0002.RKEY INNER JOIN'#13#10'       Data' +
      '0456 ON Data0022.GRN_PTR = Data0456.RKEY INNER JOIN'#13#10'       Data' +
      '0023 ON Data0456.SUPP_PTR = Data0023.RKEY'#13#10'where gon_ptr=:rkey'
    DataSource = DataSource2
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 31797
      end>
    Left = 32
    Top = 88
    object ado207INV_PART_NUMBER: TStringField
      DisplayLabel = #29289#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado207INV_NAME: TStringField
      DisplayLabel = #29289#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ado207INV_DESCRIPTION: TStringField
      DisplayLabel = #29289#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ado207QUANTITY: TBCDField
      DisplayLabel = #21457#25918#25968#37327
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 3
    end
    object ado207RTN_QUANTITY: TBCDField
      DisplayLabel = #36864#20179#25968#37327
      FieldName = 'RTN_QUANTITY'
      Precision = 10
      Size = 3
    end
    object ado207UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object ado207rohs: TStringField
      DisplayLabel = #29615#20445#26631#35782
      FieldName = 'rohs'
      Size = 10
    end
    object ado207SUPPLIER2: TStringField
      DisplayLabel = #21407#21046#36896#21830
      FieldName = 'SUPPLIER2'
      Size = 10
    end
    object ado207D0022_PTR: TIntegerField
      FieldName = 'D0022_PTR'
    end
    object ado207QUAN_ON_HAND: TBCDField
      FieldName = 'QUAN_ON_HAND'
      Precision = 19
    end
    object ado207INVENTORY_PTR: TIntegerField
      FieldName = 'INVENTORY_PTR'
    end
    object ado207rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ado207hand17: TFloatField
      FieldName = 'hand17'
    end
    object ado207ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
  end
  object ppDB457: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB457'
    Left = 152
    Top = 24
    object ppDB457ppField1: TppField
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField2: TppField
      FieldAlias = 'GON_NUMBER'
      FieldName = 'GON_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField3: TppField
      FieldAlias = 'REF_NUMBER'
      FieldName = 'REF_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField4: TppField
      FieldAlias = 'CREATE_DATE'
      FieldName = 'CREATE_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField5: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField6: TppField
      FieldAlias = 'DEPT_CODE'
      FieldName = 'DEPT_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField7: TppField
      FieldAlias = 'DEPT_NAME'
      FieldName = 'DEPT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField8: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField9: TppField
      FieldAlias = #20986#20179#31867#22411
      FieldName = #20986#20179#31867#22411
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField10: TppField
      FieldAlias = #29366#24577
      FieldName = #29366#24577
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField11: TppField
      FieldAlias = 'TTYPE'
      FieldName = 'TTYPE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField12: TppField
      FieldAlias = #21457#26009#20154#21592
      FieldName = #21457#26009#20154#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField13: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object ppDB207: TppDBPipeline
    DataSource = DataSource3
    OpenDataSource = False
    UserName = 'DB207'
    Left = 152
    Top = 88
    object ppDB207ppField1: TppField
      FieldAlias = 'INV_PART_NUMBER'
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField2: TppField
      FieldAlias = 'INV_NAME'
      FieldName = 'INV_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField3: TppField
      FieldAlias = 'INV_DESCRIPTION'
      FieldName = 'INV_DESCRIPTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField4: TppField
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField5: TppField
      FieldAlias = 'RTN_QUANTITY'
      FieldName = 'RTN_QUANTITY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField6: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField7: TppField
      FieldAlias = 'rohs'
      FieldName = 'rohs'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField8: TppField
      FieldAlias = 'SUPPLIER2'
      FieldName = 'SUPPLIER2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField9: TppField
      FieldAlias = 'D0022_PTR'
      FieldName = 'D0022_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField10: TppField
      FieldAlias = 'QUAN_ON_HAND'
      FieldName = 'QUAN_ON_HAND'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField11: TppField
      FieldAlias = 'INVENTORY_PTR'
      FieldName = 'INVENTORY_PTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField12: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField13: TppField
      FieldAlias = 'hand17'
      FieldName = 'hand17'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField14: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
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
    Left = 200
    Top = 120
  end
end
