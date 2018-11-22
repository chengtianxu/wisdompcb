object FrmReport14: TFrmReport14
  Left = 296
  Top = 264
  Width = 454
  Height = 208
  Caption = #21015#21360#26465#24418#30721#26631#31614
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource3: TDataSource
    DataSet = ADOQuery1
    Left = 159
    Top = 43
  end
  object ppReport1: TppReport
    Columns = 2
    ColumnPositions.Strings = (
      '6350'
      '107950')
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = #20449#32440' 8 1/2 x 11 '#33521#23544
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 1270
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 1270
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\BarCode_Label.rtm'
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
    mmColumnWidth = 101600
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 54769
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 30956
        mmLeft = 2646
        mmTop = 10319
        mmWidth = 95515
        BandType = 4
      end
      object Barcode_Id: TppVariable
        UserName = 'Barcode_Id'
        CalcOrder = 0
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 20
        Font.Style = []
        Transparent = True
        mmHeight = 5362
        mmLeft = 21431
        mmTop = 4233
        mmWidth = 40922
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #26465#30721#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4163
        mmLeft = 6491
        mmTop = 4763
        mmWidth = 11571
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20195#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 17727
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #29289#21697#21517#31216':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 23548
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #25968#37327':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 29633
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #26377#25928#26399':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 35719
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #26465#30721#21495':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3598
        mmLeft = 7409
        mmTop = 11906
        mmWidth = 10653
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #26816#26597#20154':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 44186
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #20379#24212#21830':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 64823
        mmTop = 11906
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #21333#20301':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 67733
        mmTop = 17727
        mmWidth = 7408
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #26469#36135#26085#26399':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 53975
        mmTop = 29633
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #26159#21542#38656'IQC:'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 35719
        mmWidth = 16140
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #26816#26597#32467#26524':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 38100
        mmTop = 44186
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #26816#26597#26085#26399':'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 66146
        mmTop = 44186
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'barcode_id'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 21166
        mmTop = 11906
        mmWidth = 15734
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'inv_part_number'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 21166
        mmTop = 17727
        mmWidth = 23918
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'inv_part_description'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 21166
        mmTop = 23548
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'quantity'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 21166
        mmTop = 29633
        mmWidth = 11077
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'expire_date'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 21166
        mmTop = 35719
        mmWidth = 16581
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'code'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 78052
        mmTop = 11906
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'unit_code'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 78052
        mmTop = 17727
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'tdate'
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 69586
        mmTop = 29633
        mmWidth = 17198
        BandType = 4
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 265
        mmLeft = 18256
        mmTop = 48419
        mmWidth = 19050
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 265
        mmLeft = 52917
        mmTop = 48419
        mmWidth = 9790
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 265
        mmLeft = 80169
        mmTop = 48419
        mmWidth = 18256
        BandType = 4
      end
      object IQC_Flag: TppVariable
        UserName = 'IQC_Flag'
        CalcOrder = 1
        Font.Charset = GB2312_CHARSET
        Font.Color = clBlack
        Font.Name = #23435#20307
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 69321
        mmTop = 35719
        mmWidth = 13476
        BandType = 4
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650610
        426172636F64655F49644F6E43616C630B50726F6772616D54797065070B7474
        50726F63656475726506536F75726365067270726F6365647572652042617263
        6F64655F49644F6E43616C63287661722056616C75653A2056617269616E7429
        3B0D0A626567696E0D0A0D0A202056616C7565203A3D20272A272B7472696D28
        444244657461696C5B27626172636F64655F6964275D292B272A273B0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060A426172636F64655F49640945
        76656E744E616D6506064F6E43616C63074576656E74494402210001060F5472
        614576656E7448616E646C65720B50726F6772616D4E616D65060E4951435F46
        6C61674F6E43616C630B50726F6772616D54797065070B747450726F63656475
        726506536F75726365068670726F636564757265204951435F466C61674F6E43
        616C63287661722056616C75653A2056617269616E74293B0D0A626567696E0D
        0A2020696620444244657461696C5B27696E7370656374275D3D275927207468
        656E0D0A202056616C7565203A3D27596573270D0A2020656C73652056616C75
        65203A3D274E6F273B0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        084951435F466C6167094576656E744E616D6506064F6E43616C63074576656E
        74494402210000}
    end
  end
  object ADOQuery1: TADOQuery
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'select data0022.barcode_id,data0017.inv_part_number,'
      'data0017.inv_part_description,data0017.inspect,'
      'data0002.unit_code,data0022.tdate,data0022.expire_date,'
      'data0023.code,data0022.quantity'
      'From data0022,data0017,data0002,data0023'
      'where data0022.quantity>0'
      'and data0022.inventory_ptr=data0017.rkey'
      'and data0017.stock_unit_ptr=data0002.rkey'
      'and data0022.supplier_ptr=data0023.rkey'
      'order by data0022.barcode_id')
    Left = 122
    Top = 43
    object ADOQuery1barcode_id: TStringField
      FieldName = 'barcode_id'
      FixedChar = True
      Size = 12
    end
    object ADOQuery1inv_part_number: TStringField
      FieldName = 'inv_part_number'
    end
    object ADOQuery1inv_part_description: TStringField
      FieldName = 'inv_part_description'
      Size = 40
    end
    object ADOQuery1inspect: TStringField
      FieldName = 'inspect'
      FixedChar = True
      Size = 1
    end
    object ADOQuery1unit_code: TStringField
      FieldName = 'unit_code'
      Size = 5
    end
    object ADOQuery1tdate: TDateTimeField
      FieldName = 'tdate'
    end
    object ADOQuery1expire_date: TDateTimeField
      FieldName = 'expire_date'
    end
    object ADOQuery1code: TStringField
      FieldName = 'code'
      Size = 5
    end
    object ADOQuery1quantity: TFloatField
      FieldName = 'quantity'
    end
  end
  object ppDBPipeline1: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DBDetail'
    Left = 192
    Top = 43
    object ppDBPipeline1ppField1: TppField
      FieldAlias = 'barcode_id'
      FieldName = 'barcode_id'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField2: TppField
      FieldAlias = 'inv_part_number'
      FieldName = 'inv_part_number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField3: TppField
      FieldAlias = 'inv_part_description'
      FieldName = 'inv_part_description'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField4: TppField
      FieldAlias = 'inspect'
      FieldName = 'inspect'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField5: TppField
      FieldAlias = 'unit_code'
      FieldName = 'unit_code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField6: TppField
      FieldAlias = 'tdate'
      FieldName = 'tdate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField7: TppField
      FieldAlias = 'expire_date'
      FieldName = 'expire_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField8: TppField
      FieldAlias = 'code'
      FieldName = 'code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline1ppField9: TppField
      FieldAlias = 'quantity'
      FieldName = 'quantity'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
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
    Left = 232
    Top = 76
  end
end
