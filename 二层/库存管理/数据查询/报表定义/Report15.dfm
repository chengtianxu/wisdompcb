object FrmReport15: TFrmReport15
  Left = 358
  Top = 255
  Width = 332
  Height = 302
  Caption = #29983#20135#29289#26009#39046#26009#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = aq457
    Left = 120
    Top = 48
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
      #13#10'FROM dbo.Data0457 INNER JOIN'#13#10'      dbo.Data0015 ON dbo.Data04' +
      '57.warehouse_ptr = dbo.Data0015.RKEY INNER JOIN'#13#10'      dbo.Data0' +
      '034 ON dbo.Data0457.dept_ptr = dbo.Data0034.RKEY INNER JOIN'#13#10'   ' +
      '   dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo.Data0005.RKEY INNE' +
      'R JOIN'#13#10'      dbo.Data0005 Data0005_1 ON dbo.Data0457.CREATE_BY ' +
      '= Data0005_1.RKEY'#13#10'where CREATE_DATE>=:dtpk1 and  CREATE_DATE<=:' +
      'dtpk2'
    IndexFieldNames = 'GON_NUMBER'
    Parameters = <
      item
        Name = 'dtpk1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38718d
      end
      item
        Name = 'dtpk2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = 38718d
      end>
    Left = 88
    Top = 48
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
  end
  object ado207: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_NAME, '#13#10'  ' +
      '    dbo.Data0017.INV_DESCRIPTION, dbo.Data0207.QUANTITY, '#13#10'     ' +
      ' dbo.Data0207.RTN_QUANTITY, dbo.Data0002.UNIT_NAME, dbo.Data0022' +
      '.rohs, '#13#10'      dbo.Data0022.SUPPLIER2,dbo.Data0207.D0022_PTR ,'#13#10 +
      '      data0022.QUAN_ON_HAND,data0207.INVENTORY_PTR,'#13#10'      data0' +
      '207.rkey,data0017.QUAN_ON_HAND as hand17'#13#10'FROM dbo.Data0207 INNE' +
      'R JOIN'#13#10'      dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR = dbo.D' +
      'ata0017.RKEY INNER JOIN'#13#10'      dbo.Data0022 ON dbo.Data0207.D002' +
      '2_PTR = dbo.Data0022.RKEY INNER JOIN'#13#10'      dbo.Data0002 ON dbo.' +
      'Data0022.LOCATION_PTR_FROM = dbo.Data0002.RKEY'#13#10'where gon_ptr=:r' +
      'key'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = 31797
      end>
    Left = 88
    Top = 80
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
  end
  object DataSource2: TDataSource
    DataSet = ado207
    Left = 120
    Top = 80
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB207
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
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\putout_invtreport.rtm'
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
    Top = 85
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB207'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 9260
        mmLeft = 5292
        mmTop = 25929
        mmWidth = 186532
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #20844#21496#21517#31216'1'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 4953
        mmLeft = 68792
        mmTop = 3969
        mmWidth = 51816
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #39046#26009#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 85196
        mmTop = 10848
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #39046#26009#37096#38376':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 14817
        mmTop = 11377
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DEPT_NAME'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 35719
        mmTop = 11377
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #20986#20179#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 147638
        mmTop = 10848
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'GON_NUMBER'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 167746
        mmTop = 10848
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #39046#26009#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 147109
        mmTop = 17198
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'REF_NUMBER'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 167746
        mmTop = 17198
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #39046#26009#20154#21592':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 14552
        mmTop = 17727
        mmWidth = 18521
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 35454
        mmTop = 17727
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #39046#26009#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4953
        mmLeft = 67469
        mmTop = 18256
        mmWidth = 18415
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'CREATE_DATE'
        DataPipeline = ppDB457
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB457'
        mmHeight = 5027
        mmLeft = 87048
        mmTop = 17992
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #29289#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4953
        mmLeft = 13229
        mmTop = 28575
        mmWidth = 17272
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #29289#26009#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4953
        mmLeft = 43127
        mmTop = 28840
        mmWidth = 17272
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 94721
        mmTop = 27517
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 5027
        mmLeft = 117740
        mmTop = 28046
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'rohs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4953
        mmLeft = 147373
        mmTop = 27517
        mmWidth = 8001
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 42069
        mmTop = 26194
        mmWidth = 13229
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 91546
        mmTop = 25929
        mmWidth = 5292
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 111654
        mmTop = 25929
        mmWidth = 5292
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 9260
        mmLeft = 132292
        mmTop = 25929
        mmWidth = 5292
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'INV_NAME'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 4953
        mmLeft = 11906
        mmTop = 2910
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'INV_DESCRIPTION'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 4953
        mmLeft = 43392
        mmTop = 3175
        mmWidth = 12954
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 5027
        mmLeft = 97631
        mmTop = 2381
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'QUANTITY'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 5027
        mmLeft = 120650
        mmTop = 2381
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'rohs'
        DataPipeline = ppDB207
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB207'
        mmHeight = 4763
        mmLeft = 142346
        mmTop = 2910
        mmWidth = 32808
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10848
        mmLeft = 5292
        mmTop = 0
        mmWidth = 186532
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10848
        mmLeft = 5292
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10848
        mmLeft = 41804
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10848
        mmLeft = 91546
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10848
        mmLeft = 111654
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10848
        mmLeft = 132027
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 10848
        mmLeft = 191559
        mmTop = 0
        mmWidth = 5027
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object DataSource3: TDataSource
    DataSet = aq493
    Left = 120
    Top = 124
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
    Left = 88
    Top = 124
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
    DataSource = DataSource3
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 120
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
  object ppDB207: TppDBPipeline
    DataSource = DataSource2
    OpenDataSource = False
    UserName = 'DB207'
    Left = 160
    Top = 82
    MasterDataPipelineName = 'ppDB457'
    object ppDB207ppField1: TppField
      FieldAlias = #26448#26009#32534#30721
      FieldName = 'INV_PART_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField2: TppField
      FieldAlias = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField3: TppField
      FieldAlias = #26448#26009#35268#26684
      FieldName = 'INV_DESCRIPTION'
      FieldLength = 0
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField4: TppField
      FieldAlias = #25968#37327
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField5: TppField
      FieldAlias = #36864#20179#25968#37327
      FieldName = 'RTN_QUANTITY'
      FieldLength = 0
      DataType = dtSingle
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField6: TppField
      FieldAlias = #21333#20301
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField7: TppField
      FieldAlias = #29615#20445#26631#35782
      FieldName = 'rohs'
      FieldLength = 0
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB207ppField8: TppField
      FieldAlias = #21407#21046#36896#21830
      FieldName = 'SUPPLIER2'
      FieldLength = 0
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
  end
  object ppDB457: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB457'
    Left = 160
    Top = 48
    object ppDB457ppField2: TppField
      FieldAlias = #20986#20179#21333#21495
      FieldName = 'GON_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField3: TppField
      FieldAlias = #39046#26009#21333#21495
      FieldName = 'REF_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField4: TppField
      FieldAlias = #39046#26009#26085#26399
      FieldName = 'CREATE_DATE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField5: TppField
      FieldAlias = #24037#21378#31616#31216
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField6: TppField
      FieldAlias = #37096#38376#20195#30721
      FieldName = 'DEPT_CODE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField7: TppField
      FieldAlias = #37096#38376#21517#31216
      FieldName = 'DEPT_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField8: TppField
      FieldAlias = #39046#26009#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField9: TppField
      FieldAlias = #20986#20179#31867#22411
      FieldName = #20986#20179#31867#22411
      FieldLength = 0
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField10: TppField
      FieldAlias = #29366#24577
      FieldName = #29366#24577
      FieldLength = 0
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB457ppField12: TppField
      FieldAlias = #21457#26009#20154#21592
      FieldName = #21457#26009#20154#21592
      FieldLength = 0
      DisplayWidth = 0
      Position = 9
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
    WindowState = wsMaximized
    Left = 200
    Top = 120
  end
end
