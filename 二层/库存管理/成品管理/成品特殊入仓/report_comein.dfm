object F_partin_report: TF_partin_report
  Left = 248
  Top = 161
  Width = 384
  Height = 496
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
      'SELECT'
      '      data0416.rkey,'
      '      data0416.number, Data0098.RMA_NUMBER,'
      '      Data0060.SALES_ORDER, Data0005.EMPLOYEE_NAME,'
      '      data0416.sys_date, data0416.quantity, data0416.type'
      'FROM data0416 INNER JOIN'
      
        '      Data0005 ON data0416.empl_ptr = Data0005.RKEY LEFT OUTER J' +
        'OIN'
      
        '      Data0060 ON data0416.so_ptr = Data0060.RKEY LEFT OUTER JOI' +
        'N'
      '      Data0098 ON data0416.rma_ptr = Data0098.RKEY'
      'where data0416.rkey=:rkey')
    Left = 96
    Top = 104
    object aq416rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object aq416number: TStringField
      FieldName = 'number'
      Size = 15
    end
    object aq416RMA_NUMBER: TStringField
      FieldName = 'RMA_NUMBER'
      FixedChar = True
      Size = 10
    end
    object aq416SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object aq416EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq416sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object aq416quantity: TIntegerField
      FieldName = 'quantity'
    end
    object aq416type: TWordField
      FieldName = 'type'
    end
    object aq416C_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'C_type'
      Size = 10
      Calculated = True
    end
  end
  object DataSource1: TDataSource
    DataSet = aq416
    Left = 128
    Top = 104
  end
  object ppDB416: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB416'
    Left = 160
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
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Value = Null
      end>
    SQL.Strings = (
      'SELECT dbo.Data0006.WORK_ORDER_NUMBER,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC, '
      '      Data0015.WAREHOUSE_CODE, '
      
        '      dbo.Data0015.ABBR_NAME, dbo.Data0016.LOCATION, dbo.Data005' +
        '3.MFG_DATE, '
      '      dbo.Data0053.REFERENCE_NUMBER, dbo.Data0053.QUANTITY'
      'FROM dbo.Data0006 RIGHT OUTER JOIN'
      '      dbo.Data0015 INNER JOIN'
      '      dbo.Data0016 INNER JOIN'
      
        '      dbo.Data0053 ON dbo.Data0016.RKEY = dbo.Data0053.LOC_PTR I' +
        'NNER JOIN'
      
        '      dbo.Data0025 ON dbo.Data0053.CUST_PART_PTR = dbo.Data0025.' +
        'RKEY ON '
      '      dbo.Data0015.RKEY = dbo.Data0053.WHSE_PTR ON '
      '      dbo.Data0006.RKEY = dbo.Data0053.WORK_ORDER_PTR'
      'where data0053.npad_ptr=:rkey      ')
    Left = 95
    Top = 142
    object aq53WORK_ORDER_NUMBER: TStringField
      FieldName = 'WORK_ORDER_NUMBER'
      Size = 22
    end
    object aq53WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object aq53ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object aq53LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
    object aq53MFG_DATE: TDateTimeField
      FieldName = 'MFG_DATE'
    end
    object aq53REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
      FixedChar = True
    end
    object aq53QUANTITY: TFloatField
      FieldName = 'QUANTITY'
    end
    object aq53MANU_PART_NUMBER: TStringField
      FieldName = 'MANU_PART_NUMBER'
    end
    object aq53MANU_PART_DESC: TStringField
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
  end
  object ppDB53: TppDBPipeline
    DataSource = DataSource3
    UserName = 'DB53'
    Left = 160
    Top = 142
    MasterDataPipelineName = 'ppDB416'
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB53
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210x297 '#27627#31859
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'R:\NIERP\Report\part_comein.rtm'
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
        DataField = 'number'
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 4233
        mmLeft = 153723
        mmTop = 8996
        mmWidth = 17230
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
        mmLeft = 137319
        mmTop = 8996
        mmWidth = 15081
        BandType = 1
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 4233
        mmLeft = 153723
        mmTop = 15875
        mmWidth = 17230
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
        DataField = 'quantity'
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 4233
        mmLeft = 153723
        mmTop = 21431
        mmWidth = 17230
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
        DataField = 'C_type'
        DataPipeline = ppDB416
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB416'
        mmHeight = 4163
        mmLeft = 30692
        mmTop = 21696
        mmWidth = 11218
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
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        ParentHeight = True
        mmHeight = 6350
        mmLeft = 10319
        mmTop = 0
        mmWidth = 172773
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #26412#21378#32534#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4163
        mmLeft = 14817
        mmTop = 1058
        mmWidth = 14111
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
        mmLeft = 74083
        mmTop = 794
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #23458#25143#22411#21495
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 37571
        mmTop = 794
        mmWidth = 14224
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
        mmHeight = 4163
        mmLeft = 101600
        mmTop = 794
        mmWidth = 7056
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
        mmHeight = 4163
        mmLeft = 131234
        mmTop = 794
        mmWidth = 7056
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
        mmHeight = 4163
        mmLeft = 152929
        mmTop = 794
        mmWidth = 7056
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
        mmWidth = 172773
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'MANU_PART_NUMBER'
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
        mmHeight = 4233
        mmLeft = 12428
        mmTop = 2117
        mmWidth = 17230
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'ABBR_NAME'
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 4233
        mmLeft = 71438
        mmTop = 2117
        mmWidth = 17230
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'LOCATION'
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 4233
        mmLeft = 99484
        mmTop = 2117
        mmWidth = 17230
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'REFERENCE_NUMBER'
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 4233
        mmLeft = 124884
        mmTop = 2117
        mmWidth = 17230
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'QUANTITY'
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 4233
        mmLeft = 151871
        mmTop = 2117
        mmWidth = 17230
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'MANU_PART_DESC'
        DataPipeline = ppDB53
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB53'
        mmHeight = 4149
        mmLeft = 37571
        mmTop = 2381
        mmWidth = 17230
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
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
    WindowState = wsMaximized
    Left = 224
    Top = 152
  end
end
