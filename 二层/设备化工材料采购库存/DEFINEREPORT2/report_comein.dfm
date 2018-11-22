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
      'SELECT data0416.rkey,data0416.number,'
      '      wzcp0060.SALES_ORDER, Data0005.EMPLOYEE_NAME,'
      '      data0416.sys_date, data0416.quantity, data0416.type,'
      '      data0416.reference,data0015.WAREHOUSE_CODE,'
      '      data0015.WAREHOUSE_NAME'
      'FROM data0416 INNER JOIN'
      
        '      Data0005 ON data0416.empl_ptr = Data0005.RKEY LEFT OUTER J' +
        'OIN'
      '      wzcp0060 ON data0416.so_ptr = wzcp0060.RKEY inner JOIN'
      '      Data0015 ON data0416.warehouse_ptr = Data0015.RKEY'
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
    object aq416SALES_ORDER: TStringField
      FieldName = 'SALES_ORDER'
      Size = 12
    end
    object aq416EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object aq416sys_date: TDateTimeField
      FieldName = 'sys_date'
    end
    object aq416quantity: TBCDField
      FieldName = 'quantity'
      Precision = 11
      Size = 3
    end
    object aq416type: TWordField
      FieldName = 'type'
    end
    object aq416reference: TStringField
      FieldName = 'reference'
      Size = 50
    end
    object aq416WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object aq416WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
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
      FieldAlias = #20837#24211#21333#21495
      FieldName = 'number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField3: TppField
      FieldAlias = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField4: TppField
      FieldAlias = #20837#24211#20154#21592
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField5: TppField
      FieldAlias = #20837#24211#26085#26399
      FieldName = 'sys_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField6: TppField
      FieldAlias = #20837#24211#24635#25968
      FieldName = 'quantity'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField8: TppField
      FieldAlias = #22791#27880
      FieldName = 'reference'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField9: TppField
      FieldAlias = #24037#21378#20195#30721
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField10: TppField
      FieldAlias = #24037#21378#21517#31216
      FieldName = 'WAREHOUSE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB416ppField11: TppField
      FieldAlias = #20837#24211#31867#22411
      FieldName = 'C_type'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
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
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, Data0016.C' +
        'ODE, '
      '      dbo.Data0016.LOCATION, dbo.Data0053.QUANTITY, '
      '      dbo.Data0053.REFERENCE_NUMBER, dbo.Data0002.UNIT_CODE, '
      '      dbo.Data0002.UNIT_NAME'
      'FROM dbo.Data0008 INNER JOIN'
      
        '      dbo.Data0053 ON dbo.Data0008.RKEY = dbo.Data0053.CUST_PART' +
        '_PTR INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0008.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      '      dbo.Data0016 ON dbo.Data0053.LOC_PTR = dbo.Data0016.RKEY'
      'where data0053.npad_ptr=:rkey      '
      'order by Data0008.PROD_CODE,Data0016.CODE')
    Left = 95
    Top = 142
    object aq53PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object aq53PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object aq53CODE: TStringField
      FieldName = 'CODE'
      FixedChar = True
      Size = 5
    end
    object aq53LOCATION: TStringField
      FieldName = 'LOCATION'
      Size = 10
    end
    object aq53QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 10
      Size = 2
    end
    object aq53REFERENCE_NUMBER: TStringField
      FieldName = 'REFERENCE_NUMBER'
    end
    object aq53UNIT_CODE: TStringField
      FieldName = 'UNIT_CODE'
      Size = 5
    end
    object aq53UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
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
      FieldAlias = #20135#21697#20195#30721
      FieldName = 'PROD_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField2: TppField
      FieldAlias = #20135#21697#21517#31216
      FieldName = 'PRODUCT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField3: TppField
      FieldAlias = #20179#24211#20195#30721
      FieldName = 'CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField4: TppField
      FieldAlias = #20179#24211#21517#31216
      FieldName = 'LOCATION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField5: TppField
      FieldAlias = #20837#24211#25968#37327
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField6: TppField
      FieldAlias = #20855#20307#20301#32622
      FieldName = 'REFERENCE_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField7: TppField
      FieldAlias = #21333#20301#20195#30721
      FieldName = 'UNIT_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB53ppField8: TppField
      FieldAlias = #21333#20301#21517#31216
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
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
    Template.FileName = 'R:\NIERP\Report\wzcppart_comein.rtm'
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
