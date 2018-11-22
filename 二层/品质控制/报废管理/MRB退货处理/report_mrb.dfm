object Form_report: TForm_report
  Left = 294
  Top = 149
  Width = 468
  Height = 318
  Caption = 'MRB'#21333#25454#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object AQ414: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    OnCalcFields = AQ414CalcFields
    DataSource = DM.DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0414.number as number414,'
      '       data0414.qty_rece,data0414.status,'
      '       data0414.qty_to_be_reworked,data0414.QTY_REWORKED,'
      '      data0414.qty_to_be_remaked,data0414.QTY_REMAKED,'
      '      data0414.sys_date as sys_date414,data0414.rkey,'
      '      Data0005.EMPLOYEE_NAME,'
      '      data0415.number AS number415,data0415.custpart_ptr,'
      '      data0415.quantity,data0415.qty_received,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC,'
      ''
      '      Data0010.ABBR_NAME as abbr_name10,'
      '      data0010.cust_code,data0010.customer_name'
      ''
      'FROM data0415 INNER JOIN'
      
        '      Data0025 ON data0415.custpart_ptr = Data0025.RKEY INNER JO' +
        'IN'
      '      Data0005 INNER JOIN'
      '      data0414 ON Data0005.RKEY = data0414.empl_ptr ON'
      '      data0415.rkey = data0414.d415_ptr INNER JOIN'
      '      Data0010 ON Data0025.CUSTOMER_PTR = Data0010.RKEY'
      'where (data0414.rkey = :rkey)'
      '')
    Left = 152
    Top = 88
    object AQ414rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object AQ414number414: TStringField
      DisplayLabel = 'MRB'#32534#21495
      FieldName = 'number414'
      Size = 15
    end
    object AQ414qty_rece: TIntegerField
      DisplayLabel = #26816#35270#25968#37327
      FieldName = 'qty_rece'
    end
    object AQ414qty_to_be_reworked: TIntegerField
      DisplayLabel = #36820#24037#25968
      FieldName = 'qty_to_be_reworked'
    end
    object AQ414qty_to_be_remaked: TIntegerField
      DisplayLabel = #25253#24223#25968
      FieldName = 'qty_to_be_remaked'
    end
    object AQ414sys_date414: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'sys_date414'
    end
    object AQ414EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object AQ414number415: TStringField
      DisplayLabel = #20986#20179#21333#21495
      FieldName = 'number415'
      Size = 15
    end
    object AQ414ABBR_NAME10: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ABBR_NAME10'
      Size = 10
    end
    object AQ414status: TWordField
      FieldName = 'status'
    end
    object AQ414v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object AQ414QTY_REWORKED: TIntegerField
      FieldName = 'QTY_REWORKED'
    end
    object AQ414QTY_REMAKED: TIntegerField
      FieldName = 'QTY_REMAKED'
    end
    object AQ414custpart_ptr: TIntegerField
      FieldName = 'custpart_ptr'
    end
    object AQ414quantity: TIntegerField
      FieldName = 'quantity'
    end
    object AQ414qty_received: TIntegerField
      FieldName = 'qty_received'
    end
    object AQ414cust_code: TStringField
      FieldName = 'cust_code'
      Size = 10
    end
    object AQ414customer_name: TStringField
      FieldName = 'customer_name'
      Size = 100
    end
    object AQ414MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object AQ414MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = AQ414
    Left = 184
    Top = 88
  end
  object AQ99: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    OnCalcFields = AQ99CalcFields
    DataSource = DataSource1
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0039.REJ_CODE, dbo.Data0039.REJECT_DESCRIPTION,'
      '      dbo.Data0039.REJECT_DEFECT_FLAG, dbo.Data0099.QUANTITY, '
      '      dbo.Data0099.TDATE, dbo.Data0099.REFERENCE_NUMBER'
      'FROM dbo.Data0039 INNER JOIN'
      
        '      dbo.Data0099 ON dbo.Data0039.RKEY = dbo.Data0099.REJECT_CO' +
        'DE_PTR'
      'where data0099.rma_ptr=:rkey')
    Left = 152
    Top = 126
    object AQ99REJ_CODE: TStringField
      FieldName = 'REJ_CODE'
      FixedChar = True
      Size = 5
    end
    object AQ99REJECT_DESCRIPTION: TStringField
      FieldName = 'REJECT_DESCRIPTION'
      FixedChar = True
      Size = 30
    end
    object AQ99REJECT_DEFECT_FLAG: TStringField
      FieldName = 'REJECT_DEFECT_FLAG'
      FixedChar = True
      Size = 1
    end
    object AQ99QUANTITY: TIntegerField
      FieldName = 'QUANTITY'
    end
    object AQ99TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object AQ99REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
    end
    object AQ99v_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 6
      Calculated = True
    end
  end
  object DataSource2: TDataSource
    DataSet = AQ99
    Left = 183
    Top = 127
  end
  object DataSource3: TDataSource
    DataSet = Aq493
    Left = 185
    Top = 163
  end
  object Aq493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 153
    Top = 163
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
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 218
    Top = 164
  end
  object ppDB414: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB414'
    Left = 219
    Top = 88
  end
  object ppDB99: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB99'
    Left = 218
    Top = 128
    MasterDataPipelineName = 'ppDB414'
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB99
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
    Template.FileName = 'R:\NIERP\Report\MRB_report.rtm'
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
    Left = 280
    Top = 96
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB99'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'number414'
        DataPipeline = ppDB414
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB414'
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 10319
        mmWidth = 17198
        BandType = 1
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CUSTOMER_PART_NUMBER'
        DataPipeline = ppDB414
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB414'
        mmHeight = 4763
        mmLeft = 159279
        mmTop = 10054
        mmWidth = 17727
        BandType = 1
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CUSTOMER_PART_DESC'
        DataPipeline = ppDB414
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB414'
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 23019
        mmWidth = 17198
        BandType = 1
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CP_REV'
        DataPipeline = ppDB414
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB414'
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 16404
        mmWidth = 17198
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'qty_rece'
        DataPipeline = ppDB414
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB414'
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 22490
        mmWidth = 17198
        BandType = 1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'qty_to_be_remaked'
        DataPipeline = ppDB414
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB414'
        mmHeight = 4233
        mmLeft = 94986
        mmTop = 22490
        mmWidth = 17216
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'qty_to_be_reworked'
        DataPipeline = ppDB414
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB414'
        mmHeight = 4233
        mmLeft = 60590
        mmTop = 22490
        mmWidth = 17198
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'MBR'#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 4498
        mmTop = 10054
        mmWidth = 15804
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #22788#29702#25968#37327':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5556
        mmTop = 22490
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #36820#24037#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 44715
        mmTop = 22490
        mmWidth = 11642
        BandType = 1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #25253#24223#25968
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 82550
        mmTop = 22225
        mmWidth = 10583
        BandType = 1
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'number415'
        DataPipeline = ppDB414
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB414'
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 3704
        mmWidth = 17216
        BandType = 1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #20986#20179#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 140759
        mmTop = 3969
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'sys_date414'
        DataPipeline = ppDB414
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB414'
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 16669
        mmWidth = 17216
        BandType = 1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #22788#29702#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 5027
        mmTop = 16669
        mmWidth = 15099
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #26412#21378#32534#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 140759
        mmTop = 10054
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #29256#26412':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 147902
        mmTop = 16140
        mmWidth = 7938
        BandType = 1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #23458#25143#22411#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 140759
        mmTop = 22490
        mmWidth = 15081
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'MRB'#26816#35270#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6773
        mmLeft = 78581
        mmTop = 4498
        mmWidth = 30057
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        mmHeight = 7938
        mmLeft = 9790
        mmTop = 0
        mmWidth = 148696
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #25253#24223'/'#19981#33391#21697#20195#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13494
        mmTop = 1588
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #25253#24223'/'#19981#33391#21697#21407#22240
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 45773
        mmTop = 1588
        mmWidth = 25682
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 91546
        mmTop = 1588
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #22791#27880
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 117475
        mmTop = 1588
        mmWidth = 7144
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 41804
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 75936
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 110596
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7938
        mmLeft = 136525
        mmTop = 0
        mmWidth = 265
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #31867#22411
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 139171
        mmTop = 2117
        mmWidth = 7056
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 10848
        mmTop = 0
        mmWidth = 147638
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'REJ_CODE'
        DataPipeline = ppDB99
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB99'
        mmHeight = 4233
        mmLeft = 18785
        mmTop = 2117
        mmWidth = 17216
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'REJECT_DESCRIPTION'
        DataPipeline = ppDB99
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB99'
        mmHeight = 4233
        mmLeft = 49477
        mmTop = 2117
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'QUANTITY'
        DataPipeline = ppDB99
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB99'
        mmHeight = 4233
        mmLeft = 88371
        mmTop = 2117
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'REFERENCE_NUMBER'
        DataPipeline = ppDB99
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB99'
        mmHeight = 4233
        mmLeft = 115623
        mmTop = 2117
        mmWidth = 17198
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 10054
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 41804
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 75936
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 110596
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 136525
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 8467
        mmLeft = 158221
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'v_type'
        DataPipeline = ppDB99
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB99'
        mmHeight = 4163
        mmLeft = 138642
        mmTop = 2117
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9525
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
    Left = 288
    Top = 160
  end
end
