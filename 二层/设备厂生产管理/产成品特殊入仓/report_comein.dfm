object F_partin_report: TF_partin_report
  Left = 545
  Top = 229
  Width = 368
  Height = 398
  Caption = #20837#20179#21333#25253#34920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object aq416: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    OnCalcFields = aq416CalcFields
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
      'SELECT data0416.rkey,data0416.number '#20837#24211#21333#21495','
      '      wzcp0070.SALES_ORDER '#38144#21806#35746#21333', Data0005.EMPLOYEE_NAME '#25805#20316#21592#24037','
      '      data0416.sys_date '#20837#20179#26085#26399', data0416.quantity '#20837#20179#24635#25968', '
      '      case data0416.type when 1 then '#39#30452#25509#20837#20179#39' when 2 then '#39#36807#25968#20837#20179#39' '
      '      when 3 then '#39#22996#22806#20837#20179#39' when 4 then '#39#36864#36135#20837#20179#39' when 5 then '#39#36716#25442#20837#20179#39
      '      when 6 then '#39#30424#28857#20837#20179#39' end as '#20837#20179#31867#22411','
      '      data0416.reference '#22791#27880',data0015.WAREHOUSE_CODE '#24037#21378#20195#30721','
      '      data0015.WAREHOUSE_NAME '#24037#21378#21517#31216',data0015.ABBR_NAME '#24037#21378#31616#31216','
      'data0034.dept_code '#37096#38376#20195#30721',data0034.dept_name '#37096#38376#21517#31216
      'FROM data0416 INNER JOIN'
      
        '      Data0005 ON data0416.empl_ptr = Data0005.RKEY LEFT OUTER J' +
        'OIN'
      '      wzcp0070 ON data0416.so_ptr = wzcp0070.RKEY inner JOIN'
      
        '      Data0015 ON data0416.warehouse_ptr = Data0015.RKEY inner j' +
        'oin data0034'
      'on data0416.dept_ptr=data0034.rkey'
      'where data0416.rkey=:rkey')
    Left = 95
    Top = 104
    object aq416rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq416DSDesigner: TStringField
      FieldName = #20837#24211#21333#21495
      Size = 15
    end
    object aq416DSDesigner2: TStringField
      FieldName = #38144#21806#35746#21333
      Size = 12
    end
    object aq416DSDesigner3: TStringField
      FieldName = #25805#20316#21592#24037
      Size = 16
    end
    object aq416DSDesigner4: TDateTimeField
      FieldName = #20837#20179#26085#26399
    end
    object aq416DSDesigner5: TBCDField
      FieldName = #20837#20179#24635#25968
      Precision = 11
      Size = 3
    end
    object aq416DSDesigner6: TStringField
      FieldName = #20837#20179#31867#22411
      ReadOnly = True
      Size = 8
    end
    object aq416DSDesigner7: TStringField
      FieldName = #22791#27880
      Size = 50
    end
    object aq416DSDesigner8: TStringField
      FieldName = #24037#21378#20195#30721
      Size = 5
    end
    object aq416DSDesigner9: TStringField
      FieldName = #24037#21378#21517#31216
      Size = 70
    end
    object aq416DSDesigner10: TStringField
      FieldName = #37096#38376#20195#30721
      Size = 10
    end
    object aq416DSDesigner11: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object aq416DSDesigner12: TStringField
      FieldName = #24037#21378#31616#31216
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = aq416
    Left = 128
    Top = 104
  end
  object aq493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 97
    Top = 177
    object aq493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object aq493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object aq493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object aq493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object aq493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object aq493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object aq493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object aq493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object aq493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource2: TDataSource
    DataSet = aq493
    Left = 129
    Top = 177
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource2
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 161
    Top = 177
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DisplayWidth = 0
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
  object DataSource3: TDataSource
    DataSet = aq53
    Left = 127
    Top = 142
  end
  object aq53: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
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
      
        'SELECT Data0008.PROD_CODE '#20135#21697#32534#30721', dbo.Data0008.PRODUCT_NAME '#20135#21697#21517#31216', ' +
        'dbo.Data0008.PRODUCT_DESC  '#20135#21697#35268#26684' ,Data0016.CODE '#20179#24211#20195#30721', '
      '      dbo.Data0016.LOCATION '#20179#24211#20301#32622', dbo.Data0053.QUANTITY '#20837#20179#25968#37327', '
      
        '      dbo.Data0053.REFERENCE_NUMBER '#21442#32771#21495#30721', dbo.Data0002.UNIT_CODE' +
        ' '#21333#20301#20195#30721', '
      '      dbo.Data0002.UNIT_NAME '#21333#20301#21517#31216
      'FROM dbo.Data0008 INNER JOIN'
      
        '      dbo.Data0053 ON dbo.Data0008.RKEY = dbo.Data0053.CUST_PART' +
        '_PTR INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY'
      'where data0053.npad_ptr=:rkey      '
      'order by Data0008.PROD_CODE,Data0016.CODE')
    Left = 94
    Top = 142
    object aq53DSDesigner: TStringField
      FieldName = #20135#21697#32534#30721
      Size = 10
    end
    object aq53DSDesigner2: TStringField
      FieldName = #20135#21697#21517#31216
      Size = 30
    end
    object aq53DSDesigner3: TStringField
      FieldName = #20135#21697#35268#26684
      Size = 200
    end
    object aq53DSDesigner4: TStringField
      FieldName = #20179#24211#20195#30721
      Size = 10
    end
    object aq53DSDesigner5: TStringField
      FieldName = #20179#24211#20301#32622
    end
    object aq53DSDesigner6: TBCDField
      FieldName = #20837#20179#25968#37327
      Precision = 10
      Size = 2
    end
    object aq53DSDesigner7: TStringField
      FieldName = #21442#32771#21495#30721
    end
    object aq53DSDesigner8: TStringField
      FieldName = #21333#20301#20195#30721
      Size = 5
    end
    object aq53DSDesigner9: TStringField
      FieldName = #21333#20301#21517#31216
    end
  end
  object ppDB53: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB53'
    Left = 160
    Top = 142
    MasterDataPipelineName = 'ppDB416'
    object ppDB53ppField1: TppField
      FieldAlias = #20135#21697#32534#30721
      FieldName = #20135#21697#32534#30721
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDB53ppField2: TppField
      FieldAlias = #20135#21697#21517#31216
      FieldName = #20135#21697#21517#31216
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object pfldDB53ppField9: TppField
      FieldAlias = #20135#21697#35268#26684
      FieldName = #20135#21697#35268#26684
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object ppDB53ppField3: TppField
      FieldAlias = #20179#24211#20195#30721
      FieldName = #20179#24211#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppDB53ppField4: TppField
      FieldAlias = #20179#24211#20301#32622
      FieldName = #20179#24211#20301#32622
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppDB53ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = #20837#20179#25968#37327
      FieldName = #20837#20179#25968#37327
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 11
      Position = 5
    end
    object ppDB53ppField6: TppField
      FieldAlias = #21442#32771#21495#30721
      FieldName = #21442#32771#21495#30721
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object ppDB53ppField7: TppField
      FieldAlias = #21333#20301#20195#30721
      FieldName = #21333#20301#20195#30721
      FieldLength = 5
      DisplayWidth = 5
      Position = 7
    end
    object ppDB53ppField8: TppField
      FieldAlias = #21333#20301#21517#31216
      FieldName = #21333#20301#21517#31216
      FieldLength = 20
      DisplayWidth = 20
      Position = 8
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB53
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
    Template.FileName = 'D:\DGVLG\NIERP\REPORT\wzcppart_comein.rtm'
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
    Left = 192
    Top = 144
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB53'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 26988
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #20837#20179#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 8202
        mmLeft = 84931
        mmTop = 7938
        mmWidth = 21431
        BandType = 1
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = #20837#24211#21333#21495
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 4022
        mmLeft = 155311
        mmTop = 8996
        mmWidth = 14224
        BandType = 1
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20837#20179#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 138113
        mmTop = 8996
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = #25805#20316#21592#24037
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 4022
        mmLeft = 155046
        mmTop = 15875
        mmWidth = 14224
        BandType = 1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #25805#20316#21592#24037':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 137319
        mmTop = 15875
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #20837#20179#24635#25968
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 4022
        mmLeft = 155575
        mmTop = 21431
        mmWidth = 14224
        BandType = 1
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #20837#20179#24635#25968':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 137319
        mmTop = 21431
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #20837#20179#31867#22411
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 4022
        mmLeft = 30692
        mmTop = 21696
        mmWidth = 14224
        BandType = 1
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #20837#20179#31867#22411':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4163
        mmLeft = 14817
        mmTop = 21696
        mmWidth = 15099
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #20837#20179#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 56886
        mmTop = 21960
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        AutoSize = True
        DataField = #20837#20179#26085#26399
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 4022
        mmLeft = 73290
        mmTop = 22225
        mmWidth = 14224
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        mmHeight = 6350
        mmLeft = 9790
        mmTop = 0
        mmWidth = 162984
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #20135#21697#32534#30721
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 18521
        mmTop = 794
        mmWidth = 14224
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #24037#21378
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 55298
        mmTop = 529
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #20135#21697#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 37042
        mmTop = 794
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #20179#24211
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 132292
        mmTop = 794
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20301#32622
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 149754
        mmTop = 794
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 163248
        mmTop = 794
        mmWidth = 7144
        BandType = 0
      end
      object plbl1: TppLabel
        UserName = 'plbl1'
        Caption = #20135#21697#35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 86519
        mmTop = 1058
        mmWidth = 16933
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
        mmLeft = 9790
        mmTop = 0
        mmWidth = 162984
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #20135#21697#32534#30721
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 4022
        mmLeft = 17463
        mmTop = 1588
        mmWidth = 14224
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #24037#21378#31616#31216
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 3969
        mmLeft = 52917
        mmTop = 1588
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #20179#24211#20301#32622
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 3969
        mmLeft = 129117
        mmTop = 1852
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #21442#32771#21495#30721
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 3969
        mmLeft = 145786
        mmTop = 1852
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #20837#20179#25968#37327
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 3969
        mmLeft = 162719
        mmTop = 1852
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #20135#21697#21517#31216
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 3969
        mmLeft = 35190
        mmTop = 1588
        mmWidth = 14288
        BandType = 4
      end
      object pdbtxt1: TppDBText
        UserName = 'DBText11'
        DataField = #20135#21697#35268#26684
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 3969
        mmLeft = 69056
        mmTop = 1588
        mmWidth = 57415
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
  end
  object ppDB416: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB416'
    Left = 164
    Top = 107
    object ppDB416ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 0
    end
    object ppDB416ppField3: TppField
      FieldAlias = #38144#21806#35746#21333
      FieldName = #38144#21806#35746#21333
      FieldLength = 12
      DisplayWidth = 12
      Position = 1
    end
    object ppDB416ppField4: TppField
      FieldAlias = #25805#20316#21592#24037
      FieldName = #25805#20316#21592#24037
      FieldLength = 16
      DisplayWidth = 16
      Position = 2
    end
    object ppDB416ppField5: TppField
      FieldAlias = #20837#20179#26085#26399
      FieldName = #20837#20179#26085#26399
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppDB416ppField2: TppField
      FieldAlias = #20837#24211#21333#21495
      FieldName = #20837#24211#21333#21495
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppDB416ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = #20837#20179#24635#25968
      FieldName = #20837#20179#24635#25968
      FieldLength = 3
      DataType = dtDouble
      DisplayWidth = 12
      Position = 5
    end
    object ppDB416ppField7: TppField
      FieldAlias = #20837#20179#31867#22411
      FieldName = #20837#20179#31867#22411
      FieldLength = 8
      DisplayWidth = 8
      Position = 6
    end
    object ppDB416ppField8: TppField
      FieldAlias = #22791#27880
      FieldName = #22791#27880
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object ppDB416ppField9: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = #24037#21378#20195#30721
      FieldLength = 5
      DisplayWidth = 5
      Position = 8
    end
    object ppDB416ppField10: TppField
      FieldAlias = #24037#21378#21517#31216
      FieldName = #24037#21378#21517#31216
      FieldLength = 70
      DisplayWidth = 70
      Position = 9
    end
    object ppDB416ppField11: TppField
      FieldAlias = #37096#38376#20195#30721
      FieldName = #37096#38376#20195#30721
      FieldLength = 10
      DisplayWidth = 10
      Position = 10
    end
    object ppDB416ppField12: TppField
      FieldAlias = #37096#38376#21517#31216
      FieldName = #37096#38376#21517#31216
      FieldLength = 30
      DisplayWidth = 30
      Position = 11
    end
    object ppDB416ppField13: TppField
      FieldAlias = #24037#21378#31616#31216
      FieldName = #24037#21378#31616#31216
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
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
    Left = 225
    Top = 146
  end
end
