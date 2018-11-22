object Form_miscreport: TForm_miscreport
  Left = 549
  Top = 255
  BorderStyle = bsSingle
  Caption = #20837#24211#21333#25253#34920'('#26434#39033')'
  ClientHeight = 297
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DataSource1: TDataSource
    DataSet = Aqwz456
    Left = 96
    Top = 55
  end
  object Aqwz456: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = Aqwz456CalcFields
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 200
      end>
    SQL.Strings = (
      
        'SELECT     dbo.Data0456.RKEY, dbo.Data0456.GRN_NUMBER, dbo.Data0' +
        '456.DELIVER_NUMBER, dbo.Data0023.CODE, dbo.Data0023.SUPPLIER_NAM' +
        'E, '
      
        '                      dbo.Data0023.ABBR_NAME, dbo.Data0456.ship_' +
        'DATE, dbo.Data0456.STATUS, dbo.Data0456.TTYPE, dbo.Data0456.REF_' +
        'NUMBER, '
      
        '                      dbo.Data0070.PO_NUMBER, Data0005_1.EMPLOYE' +
        'E_NAME, Data0005_1.EMPL_CODE, dbo.Data0015.WAREHOUSE_CODE, '
      
        '                      dbo.Data0015.WAREHOUSE_NAME, dbo.Data0456.' +
        'ship_BY, dbo.Data0001.CURR_CODE, dbo.Data0001.CURR_NAME, dbo.Dat' +
        'a0034.DEPT_NAME, '
      
        '                      dbo.Data0456.exch_rate, dbo.Data0456.AUDIT' +
        'ED_DATE,dbo.Data0005.EMPLOYEE_NAME AS AUDITED_NAME'
      'FROM         dbo.Data0005 RIGHT OUTER JOIN'
      '                      dbo.Data0456 INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0005 AS Data0005_1 ON dbo.Data0456' +
        '.CREATE_BY = Data0005_1.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0456.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0456.currency_ptr ' +
        '= dbo.Data0001.RKEY ON dbo.Data0005.RKEY = dbo.Data0456.AUDITED_' +
        'BY LEFT OUTER JOIN'
      '                      dbo.Data0034 RIGHT OUTER JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0034.DEPT_CODE = d' +
        'bo.Data0070.PO_REV_NO ON dbo.Data0456.PO_PTR = dbo.Data0070.RKEY'
      'where'
      '      Data0456.rkey = :rkey')
    Left = 64
    Top = 55
    object Aqwz456rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object Aqwz456GRN_NUMBER: TStringField
      DisplayLabel = #20837#20179#21333#21495
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object Aqwz456DELIVER_NUMBER: TStringField
      DisplayLabel = #36865#36135#21333#21495
      DisplayWidth = 10
      FieldName = 'DELIVER_NUMBER'
      Size = 15
    end
    object Aqwz456CODE: TStringField
      DisplayLabel = #20379#24212#21830#20195#30721
      FieldName = 'CODE'
      Size = 10
    end
    object Aqwz456SUPPLIER_NAME: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object Aqwz456ABBR_NAME: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aqwz456ship_DATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'ship_DATE'
    end
    object Aqwz456STATUS: TSmallintField
      FieldName = 'STATUS'
    end
    object Aqwz456TTYPE: TWordField
      FieldName = 'TTYPE'
    end
    object Aqwz456REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      DisplayWidth = 20
      FieldName = 'REF_NUMBER'
      Size = 50
    end
    object Aqwz456PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object Aqwz456EMPLOYEE_NAME: TStringField
      DisplayLabel = #25910#36135#21592#24037
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object Aqwz456EMPL_CODE: TStringField
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object Aqwz456v_status: TStringField
      DisplayLabel = #29366#24577
      FieldKind = fkCalculated
      FieldName = 'v_status'
      Size = 6
      Calculated = True
    end
    object Aqwz456v_type: TStringField
      DisplayLabel = #20837#20179#31867#22411
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 10
      Calculated = True
    end
    object Aqwz456WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object Aqwz456WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
    object Aqwz456ship_BY: TStringField
      FieldName = 'ship_BY'
    end
    object Aqwz456CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqwz456CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object Aqwz456DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object Aqwz456exch_rate: TBCDField
      FieldName = 'exch_rate'
      Precision = 12
      Size = 8
    end
    object dtmfldAqwz456AUDITED_DATE: TDateTimeField
      FieldName = 'AUDITED_DATE'
    end
    object wdstrngfldAqwz456AUDITED_NAME: TWideStringField
      FieldName = 'AUDITED_NAME'
    end
  end
  object Aq493: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select * from data0493')
    Left = 64
    Top = 136
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
  object DataSource3: TDataSource
    DataSet = Aq493
    Left = 96
    Top = 136
  end
  object ppDB493: TppDBPipeline
    DataSource = DataSource3
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB493'
    Left = 128
    Top = 136
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
  object DataSource2: TDataSource
    DataSet = Aqwz235
    Left = 96
    Top = 106
  end
  object Aqwz235: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    DataSource = DataSource1
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
      
        'SELECT dbo.Data0235.goods_name as DESCRIPTION, dbo.Data0235.good' +
        's_guige as GUI_GE, '
      
        '      dbo.Data0235.goods_type as DESCRIPTION2, dbo.Data0002.UNIT' +
        '_NAME, '
      '      dbo.Data0235.QUAN_RECD, dbo.Data0016.LOCATION, '
      
        '      dbo.Data0235.REF_NUMBER,Data0235.unit_price as tax_price, ' +
        'Data0235.state_tax as STATE_TAX,'
      
        'data0235.rohs,data0235.quan_recd*Data0235.unit_price as amount,d' +
        'ata0235.cust_decl'
      'FROM dbo.Data0235 LEFT JOIN'
      
        '      dbo.Data0072 ON dbo.Data0235.D0072_PTR = dbo.Data0072.RKEY' +
        ' INNER JOIN'
      
        '      dbo.Data0002 ON dbo.Data0235.unit_ptr = dbo.Data0002.RKEY ' +
        'INNER JOIN'
      
        '      dbo.Data0016 ON dbo.Data0235.location_ptr = dbo.Data0016.R' +
        'KEY'
      'where data0235.grn_ptr=:rkey')
    Left = 63
    Top = 106
    object Aqwz235DESCRIPTION: TStringField
      DisplayLabel = #29289#21697#21517#31216
      FieldName = 'DESCRIPTION'
      Size = 60
    end
    object Aqwz235GUI_GE: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'GUI_GE'
      Size = 200
    end
    object Aqwz235DESCRIPTION2: TStringField
      DisplayLabel = #29289#21697#31867#21035
      FieldName = 'DESCRIPTION2'
      FixedChar = True
    end
    object Aqwz235UNIT_NAME: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'UNIT_NAME'
    end
    object Aqwz235QUAN_RECD: TBCDField
      DisplayLabel = #25509#25910#25968#37327
      FieldName = 'QUAN_RECD'
      Precision = 10
      Size = 3
    end
    object Aqwz235LOCATION: TStringField
      DisplayLabel = #23384#36135#20301#32622
      FieldName = 'LOCATION'
      Size = 10
    end
    object Aqwz235REF_NUMBER: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'REF_NUMBER'
      Size = 15
    end
    object Aqwz235tax_price: TFloatField
      FieldName = 'tax_price'
    end
    object Aqwz235STATE_TAX: TBCDField
      FieldName = 'STATE_TAX'
      Precision = 4
      Size = 2
    end
    object Aqwz235rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object Aqwz235amount: TFloatField
      FieldName = 'amount'
      ReadOnly = True
    end
    object Aqwz235cust_decl: TStringField
      FieldName = 'cust_decl'
      Size = 50
    end
  end
  object ppDB235: TppDBPipeline
    DataSource = DataSource2
    UserName = 'DB235'
    Left = 128
    Top = 104
    MasterDataPipelineName = 'ppDB456'
    object ppDB235ppField1: TppField
      FieldAlias = 'DESCRIPTION'
      FieldName = 'DESCRIPTION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField2: TppField
      FieldAlias = 'GUI_GE'
      FieldName = 'GUI_GE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField3: TppField
      FieldAlias = 'DESCRIPTION2'
      FieldName = 'DESCRIPTION2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField4: TppField
      FieldAlias = 'UNIT_NAME'
      FieldName = 'UNIT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField5: TppField
      FieldAlias = 'QUAN_RECD'
      FieldName = 'QUAN_RECD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField6: TppField
      FieldAlias = 'LOCATION'
      FieldName = 'LOCATION'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField7: TppField
      FieldAlias = 'REF_NUMBER'
      FieldName = 'REF_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField8: TppField
      FieldAlias = 'tax_price'
      FieldName = 'tax_price'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField9: TppField
      FieldAlias = 'STATE_TAX'
      FieldName = 'STATE_TAX'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField10: TppField
      FieldAlias = 'rohs'
      FieldName = 'rohs'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField11: TppField
      FieldAlias = 'amount'
      FieldName = 'amount'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDB235ppField12: TppField
      FieldAlias = 'cust_decl'
      FieldName = 'cust_decl'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppDB235
    OnPrintingComplete = ppReport1PrintingComplete
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Custom'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 140000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 256
    Template.FileName = 'D:\DGVLG\NIERP\REPORT\misc_entrance.rtm'
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
    Left = 168
    Top = 112
    Version = '7.01'
    mmColumnWidth = 0
    DataPipelineName = 'ppDB235'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39423
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 7673
        mmLeft = 1852
        mmTop = 31750
        mmWidth = 194998
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'WAREHOUSE_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7620
        mmLeft = 69067
        mmTop = 1323
        mmWidth = 64008
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = #26434#39033#20837#24211#21333
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4953
        mmLeft = 90699
        mmTop = 11113
        mmWidth = 21590
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #20379#24212#21830':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 12435
        mmTop = 17727
        mmWidth = 11642
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'SUPPLIER_NAME'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3969
        mmLeft = 26194
        mmTop = 17727
        mmWidth = 29369
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = #26448#26009#21517#31216
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17198
        mmTop = 33073
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = #35268#26684
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 79904
        mmTop = 32808
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = #21333#20301
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 5556
        mmLeft = 134938
        mmTop = 32808
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = #25968#37327
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 150548
        mmTop = 33338
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = #21333#20215
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 166952
        mmTop = 33073
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = #37329#39069
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 182563
        mmTop = 33338
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = #20837#24211#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 142875
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        AutoSize = True
        DataField = 'GRN_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3969
        mmLeft = 164571
        mmTop = 17463
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = #36865#36135#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 142611
        mmTop = 23019
        mmWidth = 20373
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'ship_DATE'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3969
        mmLeft = 164307
        mmTop = 23019
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = #36865#36135#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 83873
        mmTop = 23019
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        AutoSize = True
        DataField = 'DELIVER_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3969
        mmLeft = 106892
        mmTop = 23283
        mmWidth = 29633
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'PO_NUMBER'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3969
        mmLeft = 26194
        mmTop = 23283
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #37319#36141#35746#21333#21495':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 5556
        mmTop = 23283
        mmWidth = 18785
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 51065
        mmTop = 31750
        mmWidth = 5556
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 132557
        mmTop = 31750
        mmWidth = 5556
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 147902
        mmTop = 32015
        mmWidth = 5556
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 162984
        mmTop = 31750
        mmWidth = 5556
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line13'
        Position = lpLeft
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 179123
        mmTop = 31750
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = #36135#24065#20195#30721':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 85461
        mmTop = 17463
        mmWidth = 19844
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'CURR_CODE'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3969
        mmLeft = 106892
        mmTop = 17463
        mmWidth = 30692
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 1852
        mmTop = 0
        mmWidth = 194998
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DESCRIPTION'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 4233
        mmLeft = 14817
        mmTop = 3175
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'GUI_GE'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 3969
        mmWidth = 78846
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'UNIT_NAME'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 3969
        mmLeft = 133879
        mmTop = 3969
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'QUAN_RECD'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 3969
        mmLeft = 148961
        mmTop = 3704
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'tax_price'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 3969
        mmLeft = 163777
        mmTop = 4233
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 4022
        mmLeft = 181642
        mmTop = 4233
        mmWidth = 11769
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 1852
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 51065
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 147902
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 162984
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 179123
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentHeight = True
        Position = lpRight
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 190765
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object pln1: TppLine
        UserName = 'pln1'
        ParentHeight = True
        Position = lpLeft
        StretchWithParent = True
        Weight = 0.750000000000000000
        mmHeight = 11113
        mmLeft = 132557
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'Line11'
        ParentHeight = True
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 14023
        mmLeft = 265
        mmTop = 0
        mmWidth = 194998
        BandType = 8
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = #20837#24211#21592#24037':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 3969
        mmTop = 6879
        mmWidth = 20108
        BandType = 8
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        AutoSize = True
        DataField = 'EMPLOYEE_NAME'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 6879
        mmWidth = 31221
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = #22791#27880':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 157163
        mmTop = 6879
        mmWidth = 9525
        BandType = 8
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'REF_NUMBER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 167482
        mmTop = 6879
        mmWidth = 27252
        BandType = 8
      end
      object plbl1: TppLabel
        UserName = 'plbl1'
        Caption = #23457#26680#20154':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 61383
        mmTop = 7144
        mmWidth = 14288
        BandType = 8
      end
      object plbl2: TppLabel
        UserName = 'plbl2'
        Caption = #23457#26680#26085#26399':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 94456
        mmTop = 7144
        mmWidth = 18256
        BandType = 8
      end
      object pdbtxt1: TppDBText
        UserName = 'pdbtxt1'
        DataField = 'AUDITED_NAME'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 4022
        mmLeft = 76200
        mmTop = 7144
        mmWidth = 17198
        BandType = 8
      end
      object pdbtxt2: TppDBText
        UserName = 'pdbtxt2'
        DataField = 'AUDITED_DATE'
        DataPipeline = ppDB456
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppDB456'
        mmHeight = 3969
        mmLeft = 113242
        mmTop = 7144
        mmWidth = 42333
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine15: TppLine
        UserName = 'Line14'
        ParentHeight = True
        Weight = 0.750000000000000000
        mmHeight = 7673
        mmLeft = 0
        mmTop = 0
        mmWidth = 194998
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        AutoSize = True
        DataField = 'amount'
        DataPipeline = ppDB235
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDB235'
        mmHeight = 4868
        mmLeft = 169609
        mmTop = 1588
        mmWidth = 25654
        BandType = 7
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = #21512#35745#37329#39069':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 150548
        mmTop = 1323
        mmWidth = 18521
        BandType = 7
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 5821
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
    Left = 168
    Top = 138
  end
  object ppDB456: TppDBPipeline
    DataSource = DataSource1
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB456'
    Left = 128
    Top = 55
    object pfldDB456ppField1: TppField
      FieldAlias = 'rkey'
      FieldName = 'rkey'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField2: TppField
      FieldAlias = 'GRN_NUMBER'
      FieldName = 'GRN_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField3: TppField
      FieldAlias = 'DELIVER_NUMBER'
      FieldName = 'DELIVER_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField4: TppField
      FieldAlias = 'CODE'
      FieldName = 'CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField5: TppField
      FieldAlias = 'SUPPLIER_NAME'
      FieldName = 'SUPPLIER_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField6: TppField
      FieldAlias = 'ABBR_NAME'
      FieldName = 'ABBR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField7: TppField
      FieldAlias = 'ship_DATE'
      FieldName = 'ship_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField8: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField9: TppField
      FieldAlias = 'TTYPE'
      FieldName = 'TTYPE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField10: TppField
      FieldAlias = 'REF_NUMBER'
      FieldName = 'REF_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField11: TppField
      FieldAlias = 'PO_NUMBER'
      FieldName = 'PO_NUMBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField12: TppField
      FieldAlias = 'EMPLOYEE_NAME'
      FieldName = 'EMPLOYEE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField13: TppField
      FieldAlias = 'EMPL_CODE'
      FieldName = 'EMPL_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField14: TppField
      FieldAlias = 'v_status'
      FieldName = 'v_status'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField15: TppField
      FieldAlias = 'v_type'
      FieldName = 'v_type'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField16: TppField
      FieldAlias = 'WAREHOUSE_CODE'
      FieldName = 'WAREHOUSE_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField17: TppField
      FieldAlias = 'WAREHOUSE_NAME'
      FieldName = 'WAREHOUSE_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField18: TppField
      FieldAlias = 'ship_BY'
      FieldName = 'ship_BY'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField19: TppField
      FieldAlias = 'CURR_CODE'
      FieldName = 'CURR_CODE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField20: TppField
      FieldAlias = 'CURR_NAME'
      FieldName = 'CURR_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField21: TppField
      FieldAlias = 'DEPT_NAME'
      FieldName = 'DEPT_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField22: TppField
      FieldAlias = 'exch_rate'
      FieldName = 'exch_rate'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField23: TppField
      FieldAlias = 'AUDITED_DATE'
      FieldName = 'AUDITED_DATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pfldDB456ppField24: TppField
      FieldAlias = 'AUDITED_NAME'
      FieldName = 'AUDITED_NAME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object Ado0005: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <
      item
        Name = 'rkey005'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select EMPLOYEE_NAME  from data0005'
      'where rkey=:rkey005')
    Left = 64
    Top = 168
    object Ado0005EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
  end
  object DataSource4: TDataSource
    DataSet = Ado0005
    Left = 96
    Top = 168
  end
  object ppDB0005: TppDBPipeline
    DataSource = DataSource4
    RangeEnd = reCurrentRecord
    RangeBegin = rbCurrentRecord
    UserName = 'DB0005'
    Left = 128
    Top = 168
  end
end
