object Form_Report: TForm_Report
  Left = 395
  Top = 154
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Form_Report'
  ClientHeight = 317
  ClientWidth = 521
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADO68: TADOQuery
    Active = True
    Connection = DM.ADOCon
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'rkey68'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'SELECT data0068.*,'
      '       data0005.empl_code,data0005.employee_name,'
      '       data0015.abbr_name,data0015.warehouse_code,'
      '      data0094.code code94,data0094.PURCHASE_APPROV_DESC ,'
      
        '      data0362.code code362,data0362.DESCRIPTION,data0034.DEPT_N' +
        'AME'
      
        'from data0068 inner join  data0005 on data0068.req_by=data0005.r' +
        'key inner join'
      
        'data0015 on data0068.WHSE_PTR=data0015.rkey inner join data0094 ' +
        'on '
      
        'data0068.auth_type=data0094.rkey inner join data0362 on data0068' +
        '.budget_ptr=data0362.rkey'
      
        'inner join Data0034 on data0068.DEPARTMENT_NAME=data0034.DEPT_CO' +
        'DE'
      'where data0068.RKEY=:rkey68')
    Left = 48
    Top = 16
    object ADO68RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object ADO68PO_REQ_NUMBER: TStringField
      FieldName = 'PO_REQ_NUMBER'
      Size = 15
    end
    object ADO68USER_PTR: TIntegerField
      FieldName = 'USER_PTR'
    end
    object ADO68REQ_BY: TIntegerField
      FieldName = 'REQ_BY'
    end
    object ADO68BUYER_PTR: TIntegerField
      FieldName = 'BUYER_PTR'
    end
    object ADO68APPD_BY: TIntegerField
      FieldName = 'APPD_BY'
    end
    object ADO68DATA275_PTR: TIntegerField
      FieldName = 'DATA275_PTR'
    end
    object ADO68AUTH_TYPE: TIntegerField
      FieldName = 'AUTH_TYPE'
    end
    object ADO68WHSE_PTR: TIntegerField
      FieldName = 'WHSE_PTR'
    end
    object ADO68budget_ptr: TIntegerField
      FieldName = 'budget_ptr'
    end
    object ADO68NPAD_PTR: TIntegerField
      FieldName = 'NPAD_PTR'
    end
    object ADO68ENT_DATE: TDateTimeField
      FieldName = 'ENT_DATE'
    end
    object ADO68REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
    end
    object ADO68AUTH_DATE: TDateTimeField
      FieldName = 'AUTH_DATE'
    end
    object ADO68STATUS: TWordField
      FieldName = 'STATUS'
    end
    object ADO68DEPARTMENT_NAME: TStringField
      FieldName = 'DEPARTMENT_NAME'
      Size = 10
    end
    object ADO68FLAG: TStringField
      FieldName = 'FLAG'
      FixedChar = True
      Size = 1
    end
    object ADO68EDITED_DATE: TDateTimeField
      FieldName = 'EDITED_DATE'
    end
    object ADO68EDITED_BY_USER_PTR: TIntegerField
      FieldName = 'EDITED_BY_USER_PTR'
    end
    object ADO68EDITED_BY_EMP_PTR: TIntegerField
      FieldName = 'EDITED_BY_EMP_PTR'
    end
    object ADO68TOTAL: TBCDField
      FieldName = 'TOTAL'
      Precision = 19
    end
    object ADO68CURRENY_PTR: TIntegerField
      FieldName = 'CURRENY_PTR'
    end
    object ADO68EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object ADO68v_year: TSmallintField
      FieldName = 'v_year'
    end
    object ADO68v_month: TSmallintField
      FieldName = 'v_month'
    end
    object ADO68REQ_TYPE: TStringField
      FieldName = 'REQ_TYPE'
      FixedChar = True
      Size = 1
    end
    object ADO68user_name: TStringField
      FieldName = 'user_name'
      Size = 50
    end
    object ADO68user_phone: TStringField
      FieldName = 'user_phone'
    end
    object ADO68Remark: TMemoField
      FieldName = 'Remark'
      BlobType = ftMemo
    end
    object ADO68empl_code: TStringField
      FieldName = 'empl_code'
      Size = 10
    end
    object ADO68employee_name: TStringField
      FieldName = 'employee_name'
      Size = 16
    end
    object ADO68abbr_name: TStringField
      FieldName = 'abbr_name'
      Size = 10
    end
    object ADO68warehouse_code: TStringField
      FieldName = 'warehouse_code'
      Size = 5
    end
    object ADO68code94: TStringField
      FieldName = 'code94'
      Size = 15
    end
    object ADO68PURCHASE_APPROV_DESC: TStringField
      FieldName = 'PURCHASE_APPROV_DESC'
      Size = 40
    end
    object ADO68code362: TStringField
      FieldName = 'code362'
      Size = 10
    end
    object ADO68DESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 40
    end
    object ADO68DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO68
    Left = 96
    Top = 16
  end
  object ADO69: TADOQuery
    Connection = DM.ADOCon
    Parameters = <
      item
        Name = 'rkey'
        Size = -1
        Value = Null
      end
      item
        Name = 'rkey'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select data0069.REQ_DATE,data0069.reply_date,data0069.reason,dat' +
        'a0069.QUANTITY,'
      
        'data0017.inv_part_number,data0017.inv_description,data0017.inv_n' +
        'ame ,'
      'data0002.unit_code,data0002.unit_name'
      'from dbo.Data0069 INNER JOIN'
      
        'dbo.Data0017 ON dbo.Data0069.INVT_PTR = dbo.Data0017.RKEY LEFT O' +
        'UTER JOIN'
      'dbo.Data0002 ON dbo.Data0069.UNIT_PTR = dbo.Data0002.RKEY'
      'where data0069 .purch_req_ptr=:rkey'
      'union'
      
        'select data0204.REQ_DATE,data0204.reply_date,data0204.reason,dat' +
        'a0204.QUANTITY_REQUIRED as QUANTITY,'
      
        'data0204.DESCRIPTION_2 as inv_part_number,data0204.DESCRIPTION_1' +
        ' as inv_description,data0204.GUI_GE as inv_name,'
      'data0002.unit_code,data0002.unit_name  from data0204 '
      'inner join data0002 on data0204.G_L_PTR=data0002.rkey'
      'where data0204 .purchase_req_ptr=:rkey'
      '')
    Left = 48
    Top = 64
    object ADO69REQ_DATE: TDateTimeField
      FieldName = 'REQ_DATE'
      ReadOnly = True
    end
    object ADO69reply_date: TDateTimeField
      FieldName = 'reply_date'
      ReadOnly = True
    end
    object ADO69reason: TStringField
      FieldName = 'reason'
      ReadOnly = True
      Size = 60
    end
    object ADO69QUANTITY: TFloatField
      FieldName = 'QUANTITY'
      ReadOnly = True
    end
    object ADO69inv_part_number: TStringField
      FieldName = 'inv_part_number'
      ReadOnly = True
      Size = 25
    end
    object ADO69inv_description: TStringField
      FieldName = 'inv_description'
      ReadOnly = True
      Size = 70
    end
    object ADO69inv_name: TStringField
      FieldName = 'inv_name'
      ReadOnly = True
      Size = 200
    end
    object ADO69unit_code: TStringField
      FieldName = 'unit_code'
      ReadOnly = True
      Size = 5
    end
    object ADO69unit_name: TStringField
      FieldName = 'unit_name'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO69
    Left = 96
    Top = 64
  end
  object ppDB69: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB69'
    Left = 160
    Top = 56
    object ppDB69ppField1: TppField
      FieldAlias = 'REQ_DATE'
      FieldName = 'REQ_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB69ppField2: TppField
      FieldAlias = 'reply_date'
      FieldName = 'reply_date'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB69ppField3: TppField
      FieldAlias = 'reason'
      FieldName = 'reason'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB69ppField4: TppField
      FieldAlias = 'QUANTITY'
      FieldName = 'QUANTITY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB69ppField5: TppField
      FieldAlias = 'inv_part_number'
      FieldName = 'inv_part_number'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB69ppField6: TppField
      FieldAlias = 'inv_description'
      FieldName = 'inv_description'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB69ppField7: TppField
      FieldAlias = 'inv_name'
      FieldName = 'inv_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB69ppField8: TppField
      FieldAlias = 'unit_code'
      FieldName = 'unit_code'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB69ppField9: TppField
      FieldAlias = 'unit_name'
      FieldName = 'unit_name'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object aq0493: TADOQuery
    Connection = DM.ADOCon
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 48
    Top = 131
    object aq0493Company_Name: TStringField
      FieldName = 'Company_Name'
      Size = 50
    end
    object aq0493ship_address: TStringField
      FieldName = 'ship_address'
      Size = 50
    end
    object aq0493Company_Icon: TBlobField
      FieldName = 'Company_Icon'
    end
    object aq0493SITE_INFO_ADD_1: TStringField
      FieldName = 'SITE_INFO_ADD_1'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_2: TStringField
      FieldName = 'SITE_INFO_ADD_2'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_ADD_3: TStringField
      FieldName = 'SITE_INFO_ADD_3'
      FixedChar = True
      Size = 50
    end
    object aq0493SITE_INFO_PHONE: TStringField
      FieldName = 'SITE_INFO_PHONE'
      FixedChar = True
      Size = 30
    end
  end
  object DataSource3: TDataSource
    DataSet = aq0493
    Left = 104
    Top = 131
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 160
    Top = 131
    object ppDBPipeline4ppField1: TppField
      FieldAlias = 'Company_Name'
      FieldName = 'Company_Name'
      FieldLength = 50
      DisplayWidth = 30
      Position = 0
    end
    object ppDBPipeline4ppField2: TppField
      FieldAlias = 'ship_address'
      FieldName = 'ship_address'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppDBPipeline4ppField3: TppField
      FieldAlias = 'Company_Icon'
      FieldName = 'Company_Icon'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPipeline4ppField4: TppField
      FieldAlias = 'SITE_INFO_ADD_1'
      FieldName = 'SITE_INFO_ADD_1'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDBPipeline4ppField5: TppField
      FieldAlias = 'SITE_INFO_ADD_2'
      FieldName = 'SITE_INFO_ADD_2'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppDBPipeline4ppField6: TppField
      FieldAlias = 'SITE_INFO_ADD_3'
      FieldName = 'SITE_INFO_ADD_3'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppDBPipeline4ppField7: TppField
      FieldAlias = 'SITE_INFO_PHONE'
      FieldName = 'SITE_INFO_PHONE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
  end
  object ppDB68: TppDBPipeline
    DataSource = DataSource1
    UserName = 'DB68'
    Left = 160
    Top = 16
    object ppDB68ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'RKEY'
      FieldName = 'RKEY'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 0
      Position = 0
    end
    object ppDB68ppField2: TppField
      FieldAlias = 'PO_REQ_NUMBER'
      FieldName = 'PO_REQ_NUMBER'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppDB68ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'USER_PTR'
      FieldName = 'USER_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object ppDB68ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'REQ_BY'
      FieldName = 'REQ_BY'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 3
    end
    object ppDB68ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'BUYER_PTR'
      FieldName = 'BUYER_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 4
    end
    object ppDB68ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'APPD_BY'
      FieldName = 'APPD_BY'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 5
    end
    object ppDB68ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DATA275_PTR'
      FieldName = 'DATA275_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 6
    end
    object ppDB68ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'AUTH_TYPE'
      FieldName = 'AUTH_TYPE'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 7
    end
    object ppDB68ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'WHSE_PTR'
      FieldName = 'WHSE_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 8
    end
    object ppDB68ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'budget_ptr'
      FieldName = 'budget_ptr'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object ppDB68ppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'NPAD_PTR'
      FieldName = 'NPAD_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 10
    end
    object ppDB68ppField12: TppField
      FieldAlias = 'ENT_DATE'
      FieldName = 'ENT_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppDB68ppField13: TppField
      FieldAlias = 'REQ_DATE'
      FieldName = 'REQ_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object ppDB68ppField14: TppField
      FieldAlias = 'AUTH_DATE'
      FieldName = 'AUTH_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 13
    end
    object ppDB68ppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtLongint
      DisplayWidth = 10
      Position = 14
    end
    object ppDB68ppField16: TppField
      FieldAlias = 'DEPARTMENT_NAME'
      FieldName = 'DEPARTMENT_NAME'
      FieldLength = 10
      DisplayWidth = 10
      Position = 15
    end
    object ppDB68ppField17: TppField
      FieldAlias = 'FLAG'
      FieldName = 'FLAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object ppDB68ppField18: TppField
      FieldAlias = 'EDITED_DATE'
      FieldName = 'EDITED_DATE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 17
    end
    object ppDB68ppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'EDITED_BY_USER_PTR'
      FieldName = 'EDITED_BY_USER_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 18
    end
    object ppDB68ppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'EDITED_BY_EMP_PTR'
      FieldName = 'EDITED_BY_EMP_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 19
    end
    object ppDB68ppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 20
      Position = 20
    end
    object ppDB68ppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'CURRENY_PTR'
      FieldName = 'CURRENY_PTR'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 21
    end
    object ppDB68ppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'EXCHANGE_RATE'
      FieldName = 'EXCHANGE_RATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppDB68ppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'v_year'
      FieldName = 'v_year'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 23
    end
    object ppDB68ppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'v_month'
      FieldName = 'v_month'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 24
    end
    object ppDB68ppField26: TppField
      FieldAlias = 'REQ_TYPE'
      FieldName = 'REQ_TYPE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 25
    end
    object ppDB68ppField27: TppField
      FieldAlias = 'user_name'
      FieldName = 'user_name'
      FieldLength = 50
      DisplayWidth = 50
      Position = 26
    end
    object ppDB68ppField28: TppField
      FieldAlias = 'user_phone'
      FieldName = 'user_phone'
      FieldLength = 20
      DisplayWidth = 20
      Position = 27
    end
    object ppDB68ppField29: TppField
      FieldAlias = 'Remark'
      FieldName = 'Remark'
      FieldLength = 0
      DataType = dtMemo
      DisplayWidth = 10
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDB68ppField30: TppField
      FieldAlias = 'empl_code'
      FieldName = 'empl_code'
      FieldLength = 10
      DisplayWidth = 10
      Position = 29
    end
    object ppDB68ppField31: TppField
      FieldAlias = 'employee_name'
      FieldName = 'employee_name'
      FieldLength = 16
      DisplayWidth = 16
      Position = 30
    end
    object ppDB68ppField32: TppField
      FieldAlias = 'abbr_name'
      FieldName = 'abbr_name'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object ppDB68ppField33: TppField
      FieldAlias = 'warehouse_code'
      FieldName = 'warehouse_code'
      FieldLength = 5
      DisplayWidth = 5
      Position = 32
    end
    object ppDB68ppField34: TppField
      FieldAlias = 'code94'
      FieldName = 'code94'
      FieldLength = 15
      DisplayWidth = 15
      Position = 33
    end
    object ppDB68ppField35: TppField
      FieldAlias = 'PURCHASE_APPROV_DESC'
      FieldName = 'PURCHASE_APPROV_DESC'
      FieldLength = 40
      DisplayWidth = 40
      Position = 34
    end
    object ppDB68ppField36: TppField
      FieldAlias = 'code362'
      FieldName = 'code362'
      FieldLength = 10
      DisplayWidth = 10
      Position = 35
    end
    object ppDB68ppField37: TppField
      FieldAlias = 'DESCRIPTION'
      FieldName = 'DESCRIPTION'
      FieldLength = 40
      DisplayWidth = 40
      Position = 36
    end
    object ppDB68ppField38: TppField
      FieldAlias = 'DEPT_NAME'
      FieldName = 'DEPT_NAME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 37
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
    Left = 416
    Top = 152
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB69
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 'D:\SJSYS\NIERP\Report\Req51.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    SavePrinterSetup = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 399
    Top = 72
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB69'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'Company_Name'
        DataPipeline = ppDB493
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB493'
        mmHeight = 6646
        mmLeft = 77788
        mmTop = 4763
        mmWidth = 43942
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'inv_part_number'
        DataPipeline = ppDB69
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB69'
        mmHeight = 4022
        mmLeft = 13758
        mmTop = 8202
        mmWidth = 26374
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'inv_name'
        DataPipeline = ppDB69
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB69'
        mmHeight = 4022
        mmLeft = 47096
        mmTop = 7673
        mmWidth = 15240
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'inv_description'
        DataPipeline = ppDB69
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB69'
        mmHeight = 3969
        mmLeft = 74083
        mmTop = 6879
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
end
