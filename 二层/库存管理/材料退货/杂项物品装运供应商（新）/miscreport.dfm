object Form_miscreport: TForm_miscreport
  Left = 688
  Top = 293
  Width = 346
  Height = 335
  Caption = #26434#39033#29289#21697#36864#36135#35013#36816#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Ado493: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 40
    Top = 144
    object Ado493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object Ado493Company_Name2: TStringField
      FieldName = 'Company_Name2'
      Size = 50
    end
    object Ado493Company_Name3: TStringField
      FieldName = 'Company_Name3'
      Size = 50
    end
    object Ado493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object Ado493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object Ado493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object Ado493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object Ado493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object Ado493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource3: TDataSource
    DataSet = Ado493
    Left = 112
    Top = 144
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 168
    Top = 144
    object ppDB493ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField2: TppField
      FieldAlias = 'Company_Name2'
      FieldName = 'Company_Name2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField3: TppField
      FieldAlias = 'Company_Name3'
      FieldName = 'Company_Name3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField4: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField5: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField7: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField8: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB493ppField9: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object ado209: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'Rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT        Data0235.goods_name '#29289#21697#21517#31216', Data0235.goods_guige as ' +
        #29289#21697#35268#26684', Data0235.goods_type as '#29289#21697#31867#21035','
      
        '              Data0023.SUPPLIER_NAME as '#20379#24212#21830',Data0070.SUPPIER_CON' +
        'TACT as '#32852#31995#20154',data0070.CONTACT_PHONE as '#32852#31995#30005#35805','
      
        '              Data0023.BILLING_ADDRESS_1 as '#22320#22336',Data0209.tran_dat' +
        'e as '#35013#36816#26085#26399', Data0070.PO_NUMBER as '#37319#36141#35746#21333#21495','
      
        '              Data0456.GRN_NUMBER as '#20837#24211#21333#21495',Data0072.DEL_DATE as '#35201 +
        #27714#26085#26399',Data0456.DELIVER_NUMBER as '#36865#36135#21333#21495','
      
        '              Data0072.QUAN_ORD as '#35746#36141#25968#37327',Data0002.UNIT_NAME as '#35746#36141 +
        #21333#20301',Data0235.QUAN_RECD as '#24050#25509#25910#25968#37327','
      
        '              Data0235.unit_price as '#25509#25910#21333#20215', Data0209.QUANTITY as ' +
        #36864#36135#25968#37327',Data0005.EMPLOYEE_NAME AS '#36864#36135#20154#21592','
      
        '              Data0209.QUANTITY*Data0235.unit_price as '#36864#36135#37329#39069',Data' +
        '0015.WAREHOUSE_NAME as '#24037#21378#21517#31216', '
      
        '              Data0209.shipping_method as '#35013#36816#26041#27861',Data0209.remark a' +
        's '#36864#36135#22791#27880',data0235.state_tax as '#31246#29575','
      
        '              Data0209.Rkey, Data0456.CREATE_DATE as '#25509#25910#26085#26399',tran_b' +
        'y.EMPLOYEE_NAME as '#35013#36816#20154#21592
      'FROM    Data0209 INNER JOIN'
      
        '              Data0235 ON Data0209.SRCE_PTR = Data0235.RKEY INNE' +
        'R JOIN'
      
        '              Data0002 ON Data0235.unit_ptr = Data0002.RKEY INNE' +
        'R JOIN'
      
        '              Data0456 ON Data0235.GRN_PTR = Data0456.RKEY INNER' +
        ' JOIN'
      
        '              Data0023 ON Data0456.SUPP_PTR = Data0023.RKEY  INN' +
        'ER JOIN'
      
        '              Data0072 ON Data0072.RKEY = Data0235.D0072_PTR INN' +
        'ER JOIN'
      
        '              Data0015 ON Data0456.warehouse_ptr = Data0015.RKEY' +
        '  INNER JOIN'
      
        '              Data0005 ON Data0209.EMPL_PTR = Data0005.RKEY left' +
        ' JOIN'
      
        '              Data0070 ON Data0456.PO_PTR = Data0070.RKEY left J' +
        'OIN'
      
        '              Data0005 AS tran_by ON Data0209.tran_by_userptr = ' +
        'tran_by.RKEY '
      'where    Data0209.Rkey= :Rkey')
    Left = 40
    Top = 72
    object ado209DSDesigner: TStringField
      FieldName = #29289#21697#21517#31216
      Size = 60
    end
    object ado209DSDesigner2: TStringField
      FieldName = #29289#21697#35268#26684
      Size = 200
    end
    object ado209DSDesigner3: TStringField
      FieldName = #29289#21697#31867#21035
    end
    object ado209DSDesigner4: TStringField
      FieldName = #20379#24212#21830
      Size = 100
    end
    object ado209DSDesigner5: TStringField
      FieldName = #32852#31995#20154
      FixedChar = True
    end
    object ado209DSDesigner6: TStringField
      FieldName = #32852#31995#30005#35805
      Size = 40
    end
    object ado209DSDesigner7: TStringField
      FieldName = #22320#22336
      Size = 100
    end
    object ado209DSDesigner8: TDateTimeField
      FieldName = #35013#36816#26085#26399
    end
    object ado209DSDesigner9: TStringField
      FieldName = #37319#36141#35746#21333#21495
      Size = 15
    end
    object ado209DSDesigner10: TStringField
      FieldName = #20837#24211#21333#21495
      Size = 10
    end
    object ado209DSDesigner11: TDateTimeField
      FieldName = #35201#27714#26085#26399
    end
    object ado209DSDesigner12: TStringField
      FieldName = #36865#36135#21333#21495
      Size = 15
    end
    object ado209DSDesigner13: TFloatField
      FieldName = #35746#36141#25968#37327
    end
    object ado209DSDesigner14: TStringField
      FieldName = #35746#36141#21333#20301
    end
    object ado209DSDesigner15: TBCDField
      FieldName = #24050#25509#25910#25968#37327
      Precision = 10
      Size = 3
    end
    object ado209DSDesigner16: TBCDField
      FieldName = #25509#25910#21333#20215
      Precision = 10
      Size = 3
    end
    object ado209DSDesigner17: TFloatField
      FieldName = #36864#36135#25968#37327
    end
    object ado209DSDesigner18: TStringField
      FieldName = #36864#36135#20154#21592
      Size = 16
    end
    object ado209DSDesigner19: TFloatField
      FieldName = #36864#36135#37329#39069
      ReadOnly = True
    end
    object ado209DSDesigner20: TStringField
      FieldName = #24037#21378#21517#31216
      Size = 70
    end
    object ado209DSDesigner21: TWideStringField
      FieldName = #35013#36816#26041#27861
    end
    object ado209DSDesigner22: TWideStringField
      FieldName = #36864#36135#22791#27880
      Size = 50
    end
    object ado209DSDesigner23: TBCDField
      FieldName = #31246#29575
      Precision = 4
      Size = 2
    end
    object ado209Rkey: TIntegerField
      FieldName = 'Rkey'
      ReadOnly = True
    end
    object ado209DSDesigner24: TDateTimeField
      FieldName = #25509#25910#26085#26399
    end
    object ado209DSDesigner25: TStringField
      FieldName = #35013#36816#20154#21592
      Size = 16
    end
  end
  object DataSource1: TDataSource
    DataSet = ado209
    Left = 104
    Top = 72
  end
  object ppDB209: TppDBPipeline
    DataSource = DataSource1
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB209'
    Left = 168
    Top = 72
    object ppDB209ppField1: TppField
      FieldAlias = #29289#21697#21517#31216
      FieldName = #29289#21697#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField2: TppField
      FieldAlias = #29289#21697#35268#26684
      FieldName = #29289#21697#35268#26684
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField3: TppField
      FieldAlias = #29289#21697#31867#21035
      FieldName = #29289#21697#31867#21035
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField4: TppField
      FieldAlias = #20379#24212#21830
      FieldName = #20379#24212#21830
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField5: TppField
      FieldAlias = #32852#31995#20154
      FieldName = #32852#31995#20154
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField6: TppField
      FieldAlias = #32852#31995#30005#35805
      FieldName = #32852#31995#30005#35805
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField7: TppField
      FieldAlias = #22320#22336
      FieldName = #22320#22336
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField8: TppField
      FieldAlias = #35013#36816#26085#26399
      FieldName = #35013#36816#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField9: TppField
      FieldAlias = #37319#36141#35746#21333#21495
      FieldName = #37319#36141#35746#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField10: TppField
      FieldAlias = #20837#24211#21333#21495
      FieldName = #20837#24211#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField11: TppField
      FieldAlias = #35201#27714#26085#26399
      FieldName = #35201#27714#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField12: TppField
      FieldAlias = #36865#36135#21333#21495
      FieldName = #36865#36135#21333#21495
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField13: TppField
      FieldAlias = #35746#36141#25968#37327
      FieldName = #35746#36141#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField14: TppField
      FieldAlias = #35746#36141#21333#20301
      FieldName = #35746#36141#21333#20301
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField15: TppField
      FieldAlias = #24050#25509#25910#25968#37327
      FieldName = #24050#25509#25910#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField16: TppField
      FieldAlias = #25509#25910#21333#20215
      FieldName = #25509#25910#21333#20215
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField17: TppField
      FieldAlias = #36864#36135#25968#37327
      FieldName = #36864#36135#25968#37327
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField18: TppField
      FieldAlias = #36864#36135#20154#21592
      FieldName = #36864#36135#20154#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField19: TppField
      FieldAlias = #36864#36135#37329#39069
      FieldName = #36864#36135#37329#39069
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField20: TppField
      FieldAlias = #24037#21378#21517#31216
      FieldName = #24037#21378#21517#31216
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField21: TppField
      FieldAlias = #35013#36816#26041#27861
      FieldName = #35013#36816#26041#27861
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField22: TppField
      FieldAlias = #36864#36135#22791#27880
      FieldName = #36864#36135#22791#27880
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField23: TppField
      FieldAlias = #31246#29575
      FieldName = #31246#29575
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField24: TppField
      FieldAlias = 'Rkey'
      FieldName = 'Rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField25: TppField
      FieldAlias = #25509#25910#26085#26399
      FieldName = #25509#25910#26085#26399
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDB209ppField26: TppField
      FieldAlias = #35013#36816#20154#21592
      FieldName = #35013#36816#20154#21592
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB209
    OnPrintingComplete = ppReport1PrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5000
    PrinterSetup.mmMarginLeft = 5000
    PrinterSetup.mmMarginRight = 5000
    PrinterSetup.mmMarginTop = 5000
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 150
    SaveAsTemplate = True
    Template.FileName = 'D:\sjsys\NIERP\Report\EP304.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 232
    Top = 80
    Version = '7.01'
    mmColumnWidth = 206000
    DataPipelineName = 'ppDB209'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 100000
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 18
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 7144
        mmLeft = 45773
        mmTop = 2646
        mmWidth = 114036
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #20379#24212#21830#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3669
        mmLeft = 7938
        mmTop = 19315
        mmWidth = 12982
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = #20379#24212#21830
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3669
        mmLeft = 25135
        mmTop = 19050
        mmWidth = 9737
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #32852#31995#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 25400
        mmWidth = 12965
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = #32852#31995#20154
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3669
        mmLeft = 25135
        mmTop = 25400
        mmWidth = 9737
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #22320#22336#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 11113
        mmTop = 31221
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #35013#36816#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3669
        mmLeft = 118269
        mmTop = 31485
        mmWidth = 16228
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = #35013#36816#26085#26399
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3669
        mmLeft = 138642
        mmTop = 31485
        mmWidth = 12982
        BandType = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = #22320#22336
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 31750
        mmWidth = 67998
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        DataField = 'Company_Icon'
        DataPipeline = ppDB493
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppDB493'
        mmHeight = 12965
        mmLeft = 7144
        mmTop = 2646
        mmWidth = 30163
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = #36864#36135#35013#36816#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 12435
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = #30005#35805#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 124619
        mmTop = 23548
        mmWidth = 9790
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        AutoSize = True
        DataField = #32852#31995#30005#35805
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 22490
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #37319#36141#35746#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 17198
        mmTop = 39688
        mmWidth = 19579
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = #37319#36141#35746#21333#21495
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3669
        mmLeft = 41275
        mmTop = 39688
        mmWidth = 16228
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #20837#24211#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 39952
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = #20837#24211#21333#21495
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 39952
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #35201#27714#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 46567
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = #35201#27714#26085#26399
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 46567
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #36865#36135#21333#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 46302
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = #36865#36135#21333#21495
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 46302
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #35746#36141#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 53446
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = #35746#36141#25968#37327
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 53711
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #35746#36141#21333#20301#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 59002
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = #35746#36141#21333#20301
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 59267
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #29289#21697#21517#31216#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 60061
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = #29289#21697#21517#31216
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 60061
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #29289#21697#35268#26684#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 66146
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = #29289#21697#35268#26684
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 66411
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #29289#21697#31867#21035#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 52388
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = #29289#21697#31867#21035
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 52652
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #24050#25509#25910#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 17198
        mmTop = 72496
        mmWidth = 19579
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = #24050#25509#25910#25968#37327
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 72496
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #25509#25910#21333#20215'('#21547#31246')'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 108215
        mmTop = 65617
        mmWidth = 26194
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = #25509#25910#21333#20215
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 65617
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #25509#25910#26085#26399#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 78581
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        AutoSize = True
        DataField = #25509#25910#26085#26399
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 78581
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = #36864#36135#25968#37327#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 84138
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        AutoSize = True
        DataField = #36864#36135#25968#37327
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 41275
        mmTop = 84402
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = #36864#36135#37329#39069'('#21547#31246')'#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 108215
        mmTop = 71967
        mmWidth = 26194
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = #36864#36135#37329#39069
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 71967
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = #35013#36816#26041#27861#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 78052
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = #35013#36816#26041#27861
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 78052
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = #36864#36135#22791#27880#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 90223
        mmWidth = 16140
        BandType = 0
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = #36864#36135#22791#27880
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3969
        mmLeft = 41275
        mmTop = 89958
        mmWidth = 131498
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = #35013#36816#20154#21592#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 83873
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = #35013#36816#20154#21592
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 83608
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20000
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = #31614#25910#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 137848
        mmTop = 14817
        mmWidth = 12965
        BandType = 7
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = #36864#36135#20154#21592
        DataPipeline = ppDB209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB209'
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 14817
        mmWidth = 12965
        BandType = 7
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = #21046#21333#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21696
        mmTop = 14817
        mmWidth = 12965
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = #36864#36135#20154#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 76200
        mmTop = 14288
        mmWidth = 12965
        BandType = 7
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 92075
        mmTop = 14552
        mmWidth = 26458
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 3969
        mmLeft = 152665
        mmTop = 15346
        mmWidth = 26458
        BandType = 7
      end
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
    Left = 240
    Top = 144
  end
end
