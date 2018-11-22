object F_partin_report: TF_partin_report
  Left = 382
  Top = 217
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
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB416'
    Left = 160
    Top = 104
    object ppDB416ppField2: TppField
      FieldAlias = #20837#20179#21333#21495
      FieldName = 'number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField3: TppField
      FieldAlias = #36864#36135#21333#21495
      FieldName = 'RMA_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField4: TppField
      FieldAlias = #22806#21457#35746#21333#21495
      FieldName = 'SALES_ORDER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField5: TppField
      FieldAlias = #20837#20179#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField6: TppField
      FieldAlias = #20837#20179#26085#26399
      FieldName = 'sys_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField7: TppField
      FieldAlias = #25968#37327
      FieldName = 'quantity'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField9: TppField
      FieldAlias = #20837#20179#31867#22411
      FieldName = 'C_type'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
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
    OpenDataSource = False
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 161
    Top = 177
    object ppDB493ppField1: TppField
      FieldAlias = #20844#21496#21517#31216
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
      FieldAlias = #20844#21496#22270#26631
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
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Data0006.WORK_ORDER_NUMBER,'
      '      Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DESC, '
      '      Data0015.WAREHOUSE_CODE, '
      '      Data0015.ABBR_NAME, Data0016.LOCATION, Data0053.MFG_DATE, '
      '      Data0053.REFERENCE_NUMBER, Data0053.QUANTITY'
      'FROM dbo.Data0006 RIGHT OUTER JOIN'
      '      dbo.Data0015 INNER JOIN'
      '      dbo.Data0016 INNER JOIN'
      
        '      dbo.Data0053 ON dbo.Data0016.RKEY = dbo.Data0053.LOC_PTR I' +
        'NNER JOIN'
      '      Data0025 ON Data0053.CUST_PART_PTR = Data0025.RKEY ON '
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
    OpenDataSource = False
    UserName = 'DB53'
    Left = 160
    Top = 142
    MasterDataPipelineName = 'ppDB416'
    object ppDB53ppField1: TppField
      FieldAlias = #24037#20316#35746#21333
      FieldName = 'WORK_ORDER_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField2: TppField
      FieldAlias = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField3: TppField
      FieldAlias = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      FieldLength = 0
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField5: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 0
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField6: TppField
      FieldAlias = #24037#21378#32553#20889
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField7: TppField
      FieldAlias = #20179#24211
      FieldName = 'LOCATION'
      FieldLength = 0
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField8: TppField
      FieldAlias = #20837#20179#26085#26399
      FieldName = 'MFG_DATE'
      FieldLength = 0
      DataType = dtDate
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField9: TppField
      FieldAlias = #20301#32622
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 0
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField10: TppField
      FieldAlias = #25968#37327
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
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
    SaveAsTemplate = True
    Template.FileName = 'R:\NIERP\Report\part_comein.rtm'
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 192
    Top = 144
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB53'
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
    Top = 144
  end
end
