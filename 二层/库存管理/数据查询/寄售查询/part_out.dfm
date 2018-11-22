object Form3: TForm3
  Left = 310
  Top = 157
  Width = 785
  Height = 568
  Caption = #23492#21806#20986#20179#26126#32454
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 509
    Top = 30
    Width = 133
    Height = 13
    Alignment = taRightJustify
    Caption = '   '#37329#39069#21512#35745'('#26412#20301#24065'):'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 769
    Height = 489
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGrid1KeyDown
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PRINT_NUMBER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 68
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 128
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 163
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPL_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENT_DATE'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'personnel_name'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BRING_DATE'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AMOUNT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'unit_sq'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OUTArea'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REMARK'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'receipt_number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUSTOMER_NAME'
        Width = 126
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_NAME'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OUT_QTY'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OUT_PRICE'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_PRICE'
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cajia'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OUT_AMOUNT'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_AMOUNT'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cae'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_RATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECE_NUMBER'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DETAIL_REMARK'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MFG_DATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'delivery_no'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIP_PTR'
        Width = 52
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 769
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Button1: TButton
      Left = 7
      Top = 5
      Width = 71
      Height = 30
      Caption = #36864#20986
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 81
      Top = 5
      Width = 71
      Height = 30
      Caption = #23548#20986'Excel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 231
      Top = 5
      Width = 71
      Height = 30
      Caption = #25171#21360#25253#34920
      TabOrder = 2
      Visible = False
      OnClick = Button3Click
    end
    object btnColumn: TBitBtn
      Left = 156
      Top = 5
      Width = 71
      Height = 30
      Caption = #23383#27573
      TabOrder = 3
      OnClick = btnColumnClick
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
  object ado52: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.DATA0157.PRINT_NUMBER, dbo.Data' +
        '0025.MANU_PART_NUMBER, dbo.Data0025.MANU_PART_DESC, '
      
        '                      dbo.Data0005.EMPL_CODE, dbo.Data0005.EMPLO' +
        'YEE_NAME, dbo.DATA0157.ENT_DATE, dbo.DATA0157.personnel_name, '
      
        '                      dbo.DATA0157.BRING_DATE, dbo.DATA0157.QUAN' +
        'TITY, dbo.DATA0157.AMOUNT, dbo.DATA0157.REMARK, dbo.DATA0157.rec' +
        'eipt_number, '
      
        '                      dbo.Data0010.CUST_CODE, dbo.Data0010.CUSTO' +
        'MER_NAME, dbo.Data0001.CURR_CODE, dbo.Data0010.ABBR_NAME, dbo.Da' +
        'ta0001.CURR_NAME, '
      
        '                      dbo.DATA0158.OUT_QTY, dbo.DATA0158.PRICE A' +
        'S OUT_PRICE, dbo.DATA0153.PRICE AS IN_PRICE, '
      
        '                      dbo.DATA0158.PRICE - dbo.DATA0153.PRICE AS' +
        ' cajia, dbo.DATA0158.OUT_QTY * dbo.DATA0158.PRICE AS OUT_AMOUNT,' +
        ' '
      
        '                      dbo.DATA0153.PRICE * dbo.DATA0158.OUT_QTY ' +
        'AS IN_AMOUNT, '
      
        '                      dbo.DATA0158.OUT_QTY * dbo.DATA0158.PRICE ' +
        '- dbo.DATA0153.PRICE * dbo.DATA0158.OUT_QTY AS cae, dbo.DATA0158' +
        '.RECE_NUMBER, '
      
        '                      dbo.DATA0158.REMARK AS DETAIL_REMARK, dbo.' +
        'Data0060.SALES_ORDER, dbo.DATA0153.PO_NUMBER, dbo.Data0025.ANALY' +
        'SIS_CODE_2, '
      
        '                      dbo.data0439.delivery_no, dbo.Data0025.uni' +
        't_sq, dbo.DATA0157.QUANTITY * dbo.Data0025.unit_sq AS OUTArea, d' +
        'bo.DATA0153.SHIP_PTR, '
      
        '                      dbo.Data0008.PROD_CODE, dbo.Data0008.PRODU' +
        'CT_NAME,dbo.DATA0153.MFG_DATE,data0153.TAX_RATE'
      'FROM         dbo.data0439 RIGHT OUTER JOIN'
      '                      dbo.Data0064 RIGHT OUTER JOIN'
      
        '                      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.' +
        'Data0060.RKEY RIGHT OUTER JOIN'
      '                      dbo.DATA0153 INNER JOIN'
      
        '                      dbo.DATA0158 ON dbo.DATA0153.rkey = dbo.DA' +
        'TA0158.STOCK_PTR INNER JOIN'
      
        '                      dbo.DATA0157 ON dbo.DATA0158.PRINT_PTR = d' +
        'bo.DATA0157.rkey INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.DATA0157.EMPL_PTR = db' +
        'o.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.DATA0157.CUSTOMER_PTR ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.DATA0157.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.DATA0153.CUSTPART_PTR ' +
        '= dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY ON dbo.Data0064.RKEY = dbo.DATA0153.SHIP_PT' +
        'R ON '
      
        '                      dbo.data0439.rkey = dbo.Data0064.packing_l' +
        'ist_ptr'
      'WHERE     (1 = 1)'
      'ORDER BY dbo.DATA0157.BRING_DATE, dbo.DATA0157.ENT_DATE')
    Left = 492
    Top = 472
    object ado52PRINT_NUMBER: TStringField
      DisplayLabel = #25171#21360#21333#21495
      FieldName = 'PRINT_NUMBER'
      Size = 15
    end
    object ado52MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
    end
    object ado52MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      Size = 40
    end
    object ado52EMPL_CODE: TStringField
      DisplayLabel = #25805#20316#21592#24037#21495
      FieldName = 'EMPL_CODE'
      Size = 10
    end
    object ado52EMPLOYEE_NAME: TStringField
      DisplayLabel = #25805#20316#21592#22995#21517
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado52ENT_DATE: TDateTimeField
      DisplayLabel = #36755#20837#26085#26399
      FieldName = 'ENT_DATE'
    end
    object ado52personnel_name: TStringField
      DisplayLabel = #39046#26009#20154#21592
      FieldName = 'personnel_name'
      Size = 15
    end
    object ado52BRING_DATE: TDateTimeField
      DisplayLabel = #39046#26009#26085#26399
      FieldName = 'BRING_DATE'
    end
    object ado52QUANTITY: TIntegerField
      DisplayLabel = #39046#26009#24635#25968#37327'(PCS)'
      FieldName = 'QUANTITY'
    end
    object ado52AMOUNT: TBCDField
      DisplayLabel = #39046#26009#24635#37329#39069'('#19981#21547#31246')'
      FieldName = 'AMOUNT'
      Precision = 10
      Size = 2
    end
    object ado52REMARK: TStringField
      DisplayLabel = #39046#26009#21333#22791#27880
      FieldName = 'REMARK'
      Size = 100
    end
    object ado52receipt_number: TStringField
      DisplayLabel = #25910#25454#25209#21495
      FieldName = 'receipt_number'
    end
    object ado52CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      FieldName = 'CUST_CODE'
      Size = 10
    end
    object ado52CUSTOMER_NAME: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'CUSTOMER_NAME'
      Size = 100
    end
    object ado52ABBR_NAME: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'ABBR_NAME'
      Size = 10
    end
    object ado52CURR_CODE: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado52CURR_NAME: TStringField
      DisplayLabel = #36135#24065#21517#31216
      FieldName = 'CURR_NAME'
    end
    object ado52OUT_QTY: TIntegerField
      DisplayLabel = #20986#20179#25968#37327
      FieldName = 'OUT_QTY'
    end
    object ado52OUT_PRICE: TBCDField
      DisplayLabel = #20986#20179#20215#26684
      FieldName = 'OUT_PRICE'
      Precision = 12
      Size = 6
    end
    object ado52IN_PRICE: TBCDField
      DisplayLabel = #20837#20179#20215#26684
      FieldName = 'IN_PRICE'
      Precision = 12
      Size = 6
    end
    object ado52cajia: TBCDField
      DisplayLabel = #21333#20215#24046#20215
      FieldName = 'cajia'
      ReadOnly = True
      Precision = 13
      Size = 6
    end
    object ado52OUT_AMOUNT: TBCDField
      DisplayLabel = #20986#20179#37329#39069
      FieldName = 'OUT_AMOUNT'
      ReadOnly = True
      Precision = 23
      Size = 6
    end
    object ado52IN_AMOUNT: TBCDField
      DisplayLabel = #23545#24212#20837#20179#37329#39069
      FieldName = 'IN_AMOUNT'
      ReadOnly = True
      Precision = 23
      Size = 6
    end
    object ado52cae: TBCDField
      DisplayLabel = #37329#39069#24046#39069
      FieldName = 'cae'
      ReadOnly = True
      Precision = 24
      Size = 6
    end
    object ado52RECE_NUMBER: TStringField
      DisplayLabel = #25910#26009#21333#21495
      FieldName = 'RECE_NUMBER'
      Size = 15
    end
    object ado52DETAIL_REMARK: TStringField
      DisplayLabel = #39046#26009#26126#32454#22791#27880
      FieldName = 'DETAIL_REMARK'
      Size = 50
    end
    object ado52SALES_ORDER: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'SALES_ORDER'
      FixedChar = True
      Size = 12
    end
    object ado52PO_NUMBER: TStringField
      DisplayLabel = #37319#36141#35746#21333#21495
      FieldName = 'PO_NUMBER'
      Size = 25
    end
    object ado52ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      Size = 50
    end
    object ado52delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#21495
      FieldName = 'delivery_no'
      Size = 10
    end
    object ado52unit_sq: TFloatField
      DisplayLabel = #21333#21482#38754#31215'('#13217')'
      FieldName = 'unit_sq'
    end
    object ado52OUTArea: TFloatField
      DisplayLabel = #20986#24211#38754#31215'('#13217')'
      FieldName = 'OUTArea'
      ReadOnly = True
    end
    object ado52SHIP_PTR: TIntegerField
      DisplayLabel = #35760#24405#21495
      FieldName = 'SHIP_PTR'
    end
    object ado52PROD_CODE: TStringField
      DisplayLabel = #20135#21697#31867#22411#20195#30721
      FieldName = 'PROD_CODE'
      Size = 10
    end
    object ado52PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411#21517#31216
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ado52MFG_DATE: TDateTimeField
      DisplayLabel = #20837#24211#26085#26399
      FieldName = 'MFG_DATE'
    end
    object ado52TAX_RATE: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_RATE'
      Precision = 5
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = ado52
    Left = 456
    Top = 472
  end
  object pmColumn: TPopupMenu
    AutoHotkeys = maManual
    Left = 320
  end
end
