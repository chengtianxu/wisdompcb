object Form_posearch: TForm_posearch
  Left = 221
  Top = 122
  Width = 645
  Height = 582
  Caption = #37319#36141#35746#21333#25628#32034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 324
    Width = 637
    Height = 5
    Cursor = crVSplit
    HelpType = htKeyword
    Align = alBottom
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 32
    Width = 637
    Height = 292
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Title.Caption = #37319#36141#35746#21333#21495#30721
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        ReadOnly = False
        Title.Caption = #35746#21333#26085#26399
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_warename'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        Width = 101
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONFIRMATION_NUMBER'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_suppname'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        ReadOnly = False
        Title.Caption = #31867#22411
        Width = 95
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 514
    Width = 637
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 223
      Top = 11
      Width = 75
      Height = 25
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 303
      Top = 11
      Width = 75
      Height = 25
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 637
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 98
      Top = 9
      Width = 113
      Height = 13
      Alignment = taRightJustify
      Caption = '    '#37319#36141#35746#21333#21495#30721':'
    end
    object Edit1: TEdit
      Left = 214
      Top = 5
      Width = 157
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object BitBtn1: TBitBtn
      Left = 378
      Top = 3
      Width = 25
      Height = 25
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DADADADADADA
        DADABFBFBDADADADADADDADADBFADADADADAADADAD000DADADADDADAD0FBF0DA
        DADAADAD0F7FBF0DADADDAD0F7F87BF0DADAAD0F7F87BFB70DADD0F7F87BFB78
        80DA000F87BFB78880ADDAD00BFB78880ADAADADA0B7888740ADDADADA088804
        440AADADADA000A04440DADADADADADA0440ADADADADADADA00D}
    end
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 329
    Width = 637
    Height = 185
    Align = alBottom
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'INV_NAME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_ORD'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pr_unitname'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REQ_DATE'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'extra_req'
        Width = 91
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = AQ70
    Left = 384
    Top = 292
  end
  object ADO0071: TADOQuery
    Connection = dm.ADOConnection1
    CursorType = ctStatic
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
      
        'SELECT data0071.rkey,Data0017.INV_NAME, Data0017.INV_DESCRIPTION' +
        ', '
      '      Data0071.QUAN_ORD, Data0071.QUAN_RECD, Data0071.PRICE,'
      '      Data0071.REQ_DATE, Data0071.extra_req, Data0002.UNIT_NAME,'
      
        '      Data0071.WO_PTR, Data0071.PURCHASE_UNIT_PTR, Data0071.TAX_' +
        '2,'
      
        '      Data0071.CONVERSION_FACTOR,Data0071.INVT_PTR,data0017.SHEL' +
        'F_LIFE,'
      
        '      Data0002_1.UNIT_NAME AS pr_unitname,data0017.inv_part_numb' +
        'er'
      'FROM dbo.Data0017 INNER JOIN'
      
        '      dbo.Data0071 ON dbo.Data0017.RKEY = Data0071.INVT_PTR INNE' +
        'R JOIN'
      '      dbo.Data0002 ON '
      
        '      dbo.Data0071.PURCHASE_UNIT_PTR = dbo.Data0002.RKEY INNER J' +
        'OIN'
      
        '      dbo.Data0002 Data0002_1 ON Data0071.WO_PTR = Data0002_1.RK' +
        'EY'
      'where data0071.PO_ptr=:rkey')
    Left = 417
    Top = 351
    object ADO0071rkey: TIntegerField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO0071inv_part_number: TStringField
      FieldName = 'inv_part_number'
      Size = 25
    end
    object ADO0071INVT_PTR: TIntegerField
      FieldName = 'INVT_PTR'
    end
    object ADO0071INV_NAME: TStringField
      DisplayLabel = #26448#26009#21517#31216
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ADO0071INV_DESCRIPTION: TStringField
      DisplayLabel = #26448#26009#35268#26684
      DisplayWidth = 30
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ADO0071recd_DATE: TDateTimeField
      DisplayLabel = #38656#27714#26085#26399
      FieldName = 'REQ_DATE'
    end
    object ADO0071extra_req: TStringField
      DisplayLabel = #29305#27530#35828#26126
      FieldName = 'extra_req'
    end
    object ADO0071UNIT_NAME: TStringField
      DisplayLabel = #37319#36141#21333#20301
      DisplayWidth = 10
      FieldName = 'UNIT_NAME'
    end
    object ADO0071QUAN_RECD: TBCDField
      FieldName = 'QUAN_RECD'
      Precision = 9
      Size = 3
    end
    object ADO0071WO_PTR: TIntegerField
      FieldName = 'WO_PTR'
    end
    object ADO0071PURCHASE_UNIT_PTR: TIntegerField
      FieldName = 'PURCHASE_UNIT_PTR'
    end
    object ADO0071TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ADO0071CONVERSION_FACTOR: TBCDField
      FieldName = 'CONVERSION_FACTOR'
      Precision = 7
      Size = 2
    end
    object ADO0071pr_unitname: TStringField
      DisplayLabel = #35831#36141#21333#20301
      DisplayWidth = 10
      FieldName = 'pr_unitname'
    end
    object ADO0071QUAN_ORD: TBCDField
      DisplayLabel = #35746#21333#25968#37327
      FieldName = 'QUAN_ORD'
      Precision = 9
      Size = 3
    end
    object ADO0071PRICE: TBCDField
      DisplayLabel = #20215#26684
      FieldName = 'PRICE'
      Precision = 9
      Size = 3
    end
    object ADO0071SHELF_LIFE: TSmallintField
      FieldName = 'SHELF_LIFE'
    end
  end
  object DataSource2: TDataSource
    DataSet = ADO0071
    Left = 385
    Top = 351
  end
  object AQ70: TADOQuery
    Connection = dm.ADOConnection1
    Filtered = True
    LockType = ltReadOnly
    OnCalcFields = AQ70CalcFields
    Parameters = <>
    SQL.Strings = (
      'SELECT Data0070.RKEY,Data0070.PO_TYPE,Data0070.PO_NUMBER,'
      '      Data0070.CONFIRMATION_NUMBER, Data0070.PO_DATE,'
      
        '      Data0023.CODE, Data0023.SUPPLIER_NAME,Data0023.ABBR_NAME A' +
        'S abbr_suppname,'
      
        '      Data0015.ABBR_NAME AS abbr_warename,Data0070.WAREHOUSE_POI' +
        'NTER,'
      '      Data0015.WAREHOUSE_CODE,Data0015.WAREHOUSE_NAME,'
      
        '      Data0070.CURRENCY_PTR,Data0001.CURR_CODE, Data0001.CURR_NA' +
        'ME,'
      '      Data0070.EXCHANGE_RATE, Data0034.DEPT_NAME,'
      '      Data0070.SHIPTO_ADDRESS,Data0070.SUPPLIER_POINTER'
      'FROM dbo.Data0070 INNER JOIN'
      '      dbo.Data0023 ON '
      
        '      dbo.Data0070.SUPPLIER_POINTER = dbo.Data0023.RKEY INNER JO' +
        'IN'
      '      dbo.Data0015 ON '
      
        '      dbo.Data0070.WAREHOUSE_POINTER = dbo.Data0015.RKEY INNER J' +
        'OIN'
      '      dbo.Data0001 ON '
      
        '      dbo.Data0070.CURRENCY_PTR = dbo.Data0001.RKEY LEFT OUTER J' +
        'OIN'
      
        '      dbo.Data0034 ON dbo.Data0070.PO_REV_NO = dbo.Data0034.DEPT' +
        '_CODE'
      'WHERE (dbo.Data0070.STATUS = 5) and (Data0070.PO_TYPE='#39'S'#39')'
      'ORDER BY dbo.Data0070.PO_NUMBER')
    Left = 416
    Top = 291
    object AQ70RKEY: TAutoIncField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object AQ70PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object AQ70CONFIRMATION_NUMBER: TStringField
      DisplayLabel = #23457#25209#20154#21592
      FieldName = 'CONFIRMATION_NUMBER'
    end
    object AQ70PO_DATE: TDateTimeField
      FieldName = 'PO_DATE'
    end
    object AQ70PO_TYPE: TStringField
      FieldName = 'PO_TYPE'
      FixedChar = True
      Size = 1
    end
    object AQ70CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object AQ70SUPPLIER_NAME: TStringField
      FieldName = 'SUPPLIER_NAME'
      Size = 100
    end
    object AQ70abbr_warename: TStringField
      DisplayLabel = #24037#21378
      FieldName = 'abbr_warename'
      Size = 10
    end
    object AQ70abbr_suppname: TStringField
      DisplayLabel = #20379#24212#21830#31616#31216
      FieldName = 'abbr_suppname'
      Size = 10
    end
    object AQ70SHIPTO_ADDRESS: TStringField
      FieldName = 'SHIPTO_ADDRESS'
      Size = 50
    end
    object AQ70CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object AQ70CURR_NAME: TStringField
      FieldName = 'CURR_NAME'
    end
    object AQ70EXCHANGE_RATE: TFloatField
      FieldName = 'EXCHANGE_RATE'
    end
    object AQ70DEPT_NAME: TStringField
      DisplayLabel = #35831#36141#37096#38376
      DisplayWidth = 10
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object AQ70CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object AQ70SUPPLIER_POINTER: TIntegerField
      FieldName = 'SUPPLIER_POINTER'
    end
    object AQ70WAREHOUSE_POINTER: TIntegerField
      FieldName = 'WAREHOUSE_POINTER'
    end
    object AQ70v_type: TStringField
      FieldKind = fkCalculated
      FieldName = 'v_type'
      Size = 10
      Calculated = True
    end
    object AQ70WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object AQ70WAREHOUSE_NAME: TStringField
      FieldName = 'WAREHOUSE_NAME'
      Size = 70
    end
  end
end
