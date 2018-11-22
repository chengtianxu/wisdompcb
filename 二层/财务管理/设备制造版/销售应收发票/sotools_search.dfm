object Form_sotool: TForm_sotool
  Left = 228
  Top = 124
  Width = 683
  Height = 555
  Caption = #38144#21806#35746#21333#24037#20855#36153#29992#26597#25214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 355
    Width = 667
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 667
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 216
      Top = 22
      Width = 52
      Height = 13
      Caption = #38144#21806#35746#21333
    end
    object Label2: TLabel
      Left = 401
      Top = 3
      Width = 72
      Height = 13
      Caption = #36865#36135#26085#26399#20174':'
    end
    object Label4: TLabel
      Left = 514
      Top = 3
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object Edit1: TEdit
      Left = 271
      Top = 18
      Width = 121
      Height = 21
      TabOrder = 0
      OnChange = Edit1Change
      OnKeyDown = DBGrid1KeyDown
    end
    object dtpk1: TDateTimePicker
      Left = 400
      Top = 18
      Width = 102
      Height = 21
      Date = 38848.000000000000000000
      Time = 38848.000000000000000000
      TabOrder = 1
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1CloseUp
    end
    object dtpk2: TDateTimePicker
      Left = 510
      Top = 18
      Width = 102
      Height = 21
      Date = 38848.000000000000000000
      Time = 38848.000000000000000000
      TabOrder = 2
      OnCloseUp = dtpk1CloseUp
      OnExit = dtpk1CloseUp
    end
    object BitBtn5: TBitBtn
      Left = 11
      Top = 6
      Width = 57
      Height = 30
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #23383#27573
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn5Click
      Glyph.Data = {
        0E070000424D0E0700000000000036040000280000001A0000001A0000000100
        080000000000D80200001217000012170000000100000000000000000000D0C8
        C80078787800383838000088080050F85800B8B8B800F8F8F800004800006060
        600080F8880000F00800A0A0A000E0E0E0009898980030303000E8E8E800C0C0
        C00000A80800A8A8A80020F83000D8D8D800C8C8C800505050009090900000D8
        080068686800F0F0F0008080880010F8200098F8A000B0B0B00060F86800D0D0
        D0003850380000A0080090F898000058000008080800C8D0C80008F818007070
        70008080800000980800C8D0D00058F8600088888800D0C8D00068F87000A0F8
        A00000F8080028F8300000B0080000E0080018F8200098F89800000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000130000904C1A00000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        2000010000000000000000000000000000000000000000000000000000000000
        31000000000000F1F500006400006600C800651A00007801130000C865001A00
        780001130000C0651A00000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300E8000100000001000A0000884000F877
        90004C1A00000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF0000003000F1F5000030F1F500001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200984C1A00007FFF00FFFF
        000000000000984C1A00000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF00000020000100000030F1F500000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        200001000000D0F8120000D8F80012000800000000000E000000070707070700
        0000000000000000000000000000000000070707000007070707002222222222
        2222222222222222222222222200070700000707070700222222222222222222
        2222222222222222220007070000070707070022222222222222222222222222
        2222222222000707000007070707002222222222222222222222222222222222
        2200070700000707070700220000000000000000000000000000000022000707
        0000070707070022170E0E0E0E0E180E0E0E0E0E0E0E0E002200070700000707
        07070022171313130C1C1A0C1313131313131300220007070000070707070022
        1706061F1809252E1F060606060606002200070700000707070700220911060E
        09239C1A0E061111111111002200070700000707070700221A110C1A34191908
        1A0C11012C0127002200070700000707070700221A0602343514302308291321
        1515150022000707000007070707002229160514050A0DC233D82202060D1000
        220007070000070707070022021B1B070707071B1B312D12081F070022000707
        000007070707002202070707070707070710312D23291B002200070700000707
        07070022021B1B1B1B1B1B1B1B1B0D1E2D201000220007070000070707070022
        290D0D0D0D0D0D0D0D0D0D1524C20DAF2200070700000707070700221A151515
        151515151515151515151500220007070000070707070022092F27212C161616
        0127210116162F002200070700000707070700220F090029291A29F50F171709
        1A0F09002200070700000707070700222222002E0D151017290E111F0E0F2222
        22000707000007070707002222222200002E10290E2121000022222222000707
        0000070707070022222222222200111829210022222222222200070700000707
        0707070000000000000002211F00000000000000000707070000070707070707
        0707070707070300110007070707070707070707000007070707070707070707
        0707170F2A03070707070707070707070000}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 478
    Width = 667
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      667
      39)
    object Button1: TButton
      Left = 246
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Caption = #30830#23450
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 325
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 667
    Height = 314
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
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
        FieldName = 'delivery_no'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_sailing'
        ReadOnly = False
        Width = 67
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Title.Color = clRed
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 72
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'TOTAL_ADD_L_PRICE'
        ReadOnly = False
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_NAME'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 52
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'base_to_other'
        ReadOnly = False
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        ReadOnly = False
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FED_TAX_ID_NO'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbrname15'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 358
    Width = 667
    Height = 120
    Align = alBottom
    DataSource = DataSource2
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CATEGORY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FREE_AMOUNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_FLAG'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GL_ACC_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GL_DESCRIPTION'
        Width = 196
        Visible = True
      end>
  end
  object Aqd64: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT DISTINCT data0439.delivery_no, dbo.data0439.date_sailing,' +
      ' '#13#10'      dbo.Data0060.SALES_ORDER, dbo.Data0060.TOTAL_ADD_L_PRIC' +
      'E, '#13#10'      dbo.Data0025.MANU_PART_NUMBER, Data0025.MANU_PART_DES' +
      'C, '#13#10'      Data0010.CUST_CODE, Data0010.CUSTOMER_NAME, Data0010.' +
      'ABBR_NAME, '#13#10'      Data0097.PO_NUMBER,Data0097.PO_DATE, Data0060' +
      '.ENT_DATE, '#13#10'      Data0060.SCH_DATE, Data0010.NET_PAY, Data0001' +
      '.CURR_CODE, '#13#10'      Data0001.CURR_NAME, Data0001.base_to_other,F' +
      'ED_TAX_ID_NO,'#13#10'      data0060.RKEY,Data0060.CUSTOMER_PTR,Data006' +
      '0.CURRENCY_PTR,'#13#10'      data0060.tax_in_price,data0064.tax_2,Data' +
      '0010.ACC_REC_PTR,'#13#10'      data0010.REG_TAX_FIXED_UNUSED, data0010' +
      '.EDI_FLAG_CREDIT_MEMO,'#13#10'    data0439.warehouse_ptr,data0015.abbr' +
      '_name as abbrname15'#13#10'FROM dbo.Data0010 INNER JOIN'#13#10'      dbo.Dat' +
      'a0060 ON dbo.Data0010.RKEY = dbo.Data0060.CUSTOMER_PTR INNER JOI' +
      'N'#13#10'      dbo.Data0097 ON '#13#10'      dbo.Data0060.PURCHASE_ORDER_PTR' +
      ' = dbo.Data0097.RKEY INNER JOIN'#13#10'      dbo.Data0064 ON dbo.Data0' +
      '060.RKEY = dbo.Data0064.SO_PTR INNER JOIN'#13#10'      dbo.data0439 ON' +
      ' dbo.Data0064.packing_list_ptr = dbo.data0439.rkey INNER JOIN'#13#10' ' +
      '     dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR = dbo.Data0025.R' +
      'KEY INNER JOIN'#13#10'      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR ' +
      '= dbo.Data0001.RKEY  INNER JOIN'#13#10'      dbo.Data0015 ON dbo.data0' +
      '439.warehouse_ptr = dbo.Data0015.RKEY'#13#10'WHERE (dbo.Data0060.TOTAL' +
      '_ADD_L_PRICE - dbo.Data0060.INVD_ADD_L_PRICE > 0) and'#13#10'         ' +
      '     (data0439.date_sailing >= :dtpk1) and'#13#10'              (data0' +
      '439.date_sailing <= :dtpk2)'
    IndexFieldNames = 'sales_order'
    Parameters = <
      item
        Name = 'dtpk1'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 38353d
      end
      item
        Name = 'dtpk2'
        DataType = ftDateTime
        Precision = 16
        Size = 16
        Value = 39000d
      end>
    Left = 168
    Top = 416
    object Aqd64delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      Size = 10
    end
    object Aqd64date_sailing: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'date_sailing'
    end
    object Aqd64SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object Aqd64TOTAL_ADD_L_PRICE: TFloatField
      DisplayLabel = #24037#20855#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object Aqd64CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object Aqd64CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object Aqd64ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object Aqd64PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object Aqd64PO_DATE: TDateTimeField
      DisplayLabel = #23458#25143#35746#21333#26085#26399
      FieldName = 'PO_DATE'
    end
    object Aqd64ENT_DATE: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'ENT_DATE'
    end
    object Aqd64SCH_DATE: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'SCH_DATE'
    end
    object Aqd64NET_PAY: TSmallintField
      DisplayLabel = #20184#27454#22825#25968
      FieldName = 'NET_PAY'
    end
    object Aqd64CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object Aqd64CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object Aqd64base_to_other: TFloatField
      DisplayLabel = #27719#29575
      DisplayWidth = 5
      FieldName = 'base_to_other'
    end
    object Aqd64RKEY: TIntegerField
      FieldName = 'RKEY'
      ReadOnly = True
    end
    object Aqd64CUSTOMER_PTR: TIntegerField
      FieldName = 'CUSTOMER_PTR'
    end
    object Aqd64CURRENCY_PTR: TIntegerField
      FieldName = 'CURRENCY_PTR'
    end
    object Aqd64tax_in_price: TStringField
      FieldName = 'tax_in_price'
      FixedChar = True
      Size = 1
    end
    object Aqd64tax_2: TBCDField
      FieldName = 'tax_2'
      Precision = 4
      Size = 2
    end
    object Aqd64ACC_REC_PTR: TIntegerField
      FieldName = 'ACC_REC_PTR'
    end
    object Aqd64MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object Aqd64MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object Aqd64REG_TAX_FIXED_UNUSED: TStringField
      DisplayLabel = #21457#31080#21040#26399#35745#31639#26041#27861
      FieldName = 'REG_TAX_FIXED_UNUSED'
      FixedChar = True
      Size = 1
    end
    object Aqd64EDI_FLAG_CREDIT_MEMO: TSmallintField
      DisplayLabel = #32467#24080#26085
      FieldName = 'EDI_FLAG_CREDIT_MEMO'
    end
    object Aqd64warehouse_ptr: TIntegerField
      FieldName = 'warehouse_ptr'
    end
    object Aqd64abbrname15: TStringField
      DisplayLabel = #24037#21378#31616#31216
      FieldName = 'abbrname15'
      Size = 10
    end
    object Aqd64FED_TAX_ID_NO: TStringField
      DisplayLabel = #20184#27454#26041#24335
      DisplayWidth = 20
      FieldName = 'FED_TAX_ID_NO'
      Size = 50
    end
  end
  object DataSource1: TDataSource
    DataSet = Aqd64
    Left = 136
    Top = 416
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 80
    Top = 8
    object N1: TMenuItem
      Caption = #35013#31665#21333#21495
      Checked = True
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #36865#36135#26085#26399
      Checked = True
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #38144#21806#35746#21333
      Checked = True
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #26412#21378#32534#21495
      Checked = True
      OnClick = N1Click
    end
    object N5: TMenuItem
      Caption = #23458#25143#22411#21495
      OnClick = N1Click
    end
    object N6: TMenuItem
      Caption = #29256#26412
      Checked = True
      OnClick = N1Click
    end
    object N7: TMenuItem
      Caption = #24037#20855#36153#29992
      Checked = True
      OnClick = N1Click
    end
    object N8: TMenuItem
      Caption = #23458#25143#20195#30721
      OnClick = N1Click
    end
    object N9: TMenuItem
      Caption = #23458#25143#21517#31216
      OnClick = N1Click
    end
    object N10: TMenuItem
      Caption = #23458#25143#31616#31216
      Checked = True
      OnClick = N1Click
    end
    object N11: TMenuItem
      Caption = #36135#24065#20195#30721
      OnClick = N1Click
    end
    object N12: TMenuItem
      Caption = #36135#24065#21517#31216
      Checked = True
      OnClick = N1Click
    end
    object N13: TMenuItem
      Caption = #27719#29575
      Checked = True
      OnClick = N1Click
    end
    object N14: TMenuItem
      Caption = #23458#25143#35746#21333#21495
      Checked = True
      OnClick = N1Click
    end
    object N15: TMenuItem
      Caption = #23458#25143#35746#21333#26085#26399
      OnClick = N1Click
    end
    object N16: TMenuItem
      Caption = #24037#21378#31616#31216
      Checked = True
      OnClick = N1Click
    end
  end
  object Aqd62: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    CommandText = 
      'SELECT dbo.Data0061.CATEGORY, dbo.Data0062.AMOUNT, dbo.Data0062.' +
      'FREE_AMOUNT, '#13#10'      dbo.Data0061.PTR_TO_GL_ACCT, dbo.Data0062.A' +
      'DDL_CAT_PTR, '#13#10'      dbo.Data0062.TAX_FLAG, dbo.Data0103.GL_ACC_' +
      'NUMBER, '#13#10'      dbo.Data0103.GL_DESCRIPTION'#13#10'FROM dbo.Data0062 I' +
      'NNER JOIN'#13#10'      dbo.Data0061 ON '#13#10'      dbo.Data0062.ADDL_CAT_P' +
      'TR = dbo.Data0061.RKEY LEFT OUTER JOIN'#13#10'      dbo.Data0103 ON db' +
      'o.Data0061.PTR_TO_GL_ACCT = dbo.Data0103.RKEY'#13#10'where data0062.so' +
      '_ptr=:rkey'
    DataSource = DataSource1
    MasterFields = 'rkey'
    Parameters = <
      item
        Name = 'rkey'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 168
    Top = 448
    object Aqd62CATEGORY: TStringField
      DisplayLabel = #24037#20855#36153#29992#31867#21035
      FieldName = 'CATEGORY'
    end
    object Aqd62AMOUNT: TFloatField
      DisplayLabel = #24212#25910#37329#39069
      FieldName = 'AMOUNT'
    end
    object Aqd62FREE_AMOUNT: TFloatField
      DisplayLabel = #20813#25910#37329#39069
      FieldName = 'FREE_AMOUNT'
    end
    object Aqd62PTR_TO_GL_ACCT: TIntegerField
      FieldName = 'PTR_TO_GL_ACCT'
    end
    object Aqd62ADDL_CAT_PTR: TIntegerField
      FieldName = 'ADDL_CAT_PTR'
    end
    object Aqd62TAX_FLAG: TStringField
      DisplayLabel = #24449#31246
      FieldName = 'TAX_FLAG'
      FixedChar = True
      Size = 1
    end
    object Aqd62GL_ACC_NUMBER: TStringField
      DisplayLabel = #35760#24080#31185#30446#20195#30721
      FieldName = 'GL_ACC_NUMBER'
      FixedChar = True
      Size = 18
    end
    object Aqd62GL_DESCRIPTION: TStringField
      DisplayLabel = #35760#24080#31185#30446#21517#31216
      FieldName = 'GL_DESCRIPTION'
      Size = 50
    end
  end
  object DataSource2: TDataSource
    DataSet = Aqd62
    Left = 136
    Top = 448
  end
end
