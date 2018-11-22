object Form2: TForm2
  Left = 334
  Top = 165
  Width = 930
  Height = 581
  Caption = #35013#31665#21333#28165#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 38
    Width = 914
    Height = 505
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnColumnMoved = DBGrid1ColumnMoved
    OnKeyDown = DBGrid1KeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'delivery_no'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'if_invice'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'invoice_number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTED_DATE'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'rkey'
        Title.Caption = #35760#24405#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abbr_name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_sailing'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATE_ASSIGN'
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'charge'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALES_ORDER'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SCH_DATE'
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SHIPMENT_NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_NUMBER'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MANU_PART_DESC'
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_2'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Width = 144
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_DATE'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUAN_SHIPPED'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'curr_code'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXCH_RATE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part_price'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part_taxprice'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'preamount'
        Title.Caption = #21407#24065#19981#21547#31246#37329#39069
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'amount'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_amount'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_preamount'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_ADD_L_PRICE'
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_in_price'
        Title.Alignment = taCenter
        Title.Caption = #26159#21542#21547#31246
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'mianji'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'weigth'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cartons_no'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fob'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'reference_number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Remark'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_decl'
        Title.Caption = #25253#20851#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_1'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANALYSIS_CODE_5'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'set_qty'
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'REFERENCE_60'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'remark64'
        ReadOnly = True
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ORIG_CUSTOMER'
        ReadOnly = True
        Width = 78
        Visible = True
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'GLPTR_STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ovsh_qty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cost_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'layers'
        ReadOnly = True
        Title.Caption = #23618#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER_NAME_23'
        Title.Caption = #20379#24212#21830#21517#31216
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'assign_type'
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'QUAN_CREDITED'
        Width = -1
        Visible = False
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 914
    Height = 38
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      914
      38)
    object Label1: TLabel
      Left = 587
      Top = 2
      Width = 131
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #20986#36135#37329#39069'('#19981#21547#31246#26412#24065')'
    end
    object Label2: TLabel
      Left = 727
      Top = 1
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #20986#36135#38754#31215
    end
    object Label3: TLabel
      Left = 453
      Top = 2
      Width = 118
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #20986#36135#37329#39069'('#21547#31246#26412#24065')'
    end
    object Edit1: TEdit
      Left = 591
      Top = 17
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 724
      Top = 17
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 10
      Top = 4
      Width = 57
      Height = 30
      Cursor = crHandPoint
      Hint = #36864#20986
      Caption = #36864#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BitBtn1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 67
      Top = 4
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #23548#20986
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DADADADADADA
        DADAADADADADADADADADDADADADADAD00000000000000006666007777777706E
        EF0AA0E6666606EEF0ADDA0E66606EEF060AADA0E606EEF0000DDADA006EEF0A
        DADAADAD06EEF00DADADDAD06EEF0670DADAAD06EEF0E6670DADD06EEF0A0E66
        70DA0FFFF0ADA0EEEE0D00000ADADA00000AADADADADADADADAD}
    end
    object BitBtn2: TBitBtn
      Left = 124
      Top = 4
      Width = 57
      Height = 30
      Hint = #25171#21360#25253#34920
      Caption = #25171#21360
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = BitBtn2Click
      Glyph.Data = {
        46060000424D4606000000000000360400002800000016000000160000000100
        0800000000001002000000000000000000000001000000010000343234009C9A
        9C00CCCECC006466640084828400B4B6B400ECEAEC004C4E4C00DCDEDC007476
        7400ACAAAC008C8E8C00CCC2CC0044424400F4F6F400645A6400DCD2DC00746A
        7400C4C2C400A4A2A400ECE2EC00948A9400C4BAC400FCF2FC005C5A5C00847A
        8400BCB2BC009C929C003C3A3C008C8A8C00F4F2F400E4E6E400B4B2B4004C4A
        4C0074727400D4D6D4008C828C00BCBEBC00F4EAF4005C565C00E4DEE4007C7E
        7C00B4AAB40094969400CCCACC004C424C00FCFEFC0064626400DCDADC00ACA2
        AC00A49AA400D4CED4006C666C00BCB6BC00544E54007C767C00948E9400FCF6
        FC007C6E7C00443A44003C363C0084868400ECEEEC00DCE2DC00ACAEAC00CCC6
        CC0044464400645E6400DCD6DC00746E7400C4C6C400A4A6A400ECE6EC00C4BE
        C4005C5E5C00847E84009C969C007C727C008C868C00F4EEF400E4E2E400B4AE
        B400D4CAD4004C464C006C626C00E4DAE400ACA6AC00A49EA400D4D2D4006C6A
        6C00BCBABC00545254007C7A7C0094929400FCFAFC00443E4400000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000041410C44144B
        27531B55264B37591C1926330C414152000052331031344D51241C4537384C48
        041C451A330C524100000C2A5919514458491A11003152164E073C5316330C41
        000024451630410C3358334415420241054D59420D16330C08020F06102C490C
        4133352F364D304F2E1B0F11210D16330000574D4955282C32592D595A5E5E2E
        0E50372F340D531A0000502A5F1A56110D595A2E2E5E5E50583F483743430019
        00000C04440C210312172E5E0E0658442346501F37340D24080234150841252E
        2E5E2E282358233D4C08461F1F195F2400004B45484F2E5E393E493847130721
        212B50402A2E59370000455D2E39391F2323515D031C2121034301252C401156
        00003A385E5058582C011853425B5B374B324C0545341A330802114C0E25235A
        5B4242214A111D1B510B1D225E404E520000152F48502C4622215B5C19571301
        22560839522E27410000554C5B5A3E5802293438200B1D5D4F2E2E2E125D1541
        00001210564D1B1E301E05380932352E5E5E1E49254D2A330802520C58104545
        120B5C36215E28103E10202551262752000041410C4133152F4D351027010E13
        524012352533131B00004152414141550C10524152115918141E350E5E442F19
        000041524152410C41414141520C4B11242E58485E2E4754080241520C414152
        4141524141414455151B2F522E35224E00005241524152410C52414152410C0C
        33381934191915330000}
    end
    object Edit3: TEdit
      Left = 454
      Top = 17
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ReadOnly = True
      TabOrder = 5
    end
    object BitBtn5: TBitBtn
      Left = 181
      Top = 4
      Width = 85
      Height = 30
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #26174#31034#23383#27573
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
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
  object ADO439: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    LockType = ltReadOnly
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.data0439.delivery_no, dbo.Data0' +
        '010.CUST_CODE, dbo.data0439.date_sailing, dbo.Data0064.cartons_n' +
        'o, dbo.data0439.charge, '
      
        '                      dbo.Data0060.SALES_ORDER, dbo.data0439.fob' +
        ', dbo.Data0060.SCH_DATE, dbo.Data0064.SHIPMENT_NO, dbo.Data0025.' +
        'MANU_PART_NUMBER, '
      
        '                      dbo.Data0010.ABBR_NAME, dbo.Data0097.PO_NU' +
        'MBER, dbo.Data0097.PO_DATE, dbo.Data0060.ORIG_CUSTOMER, dbo.data' +
        '0439.reference_number, '
      
        '                      dbo.Data0005.EMPLOYEE_NAME, dbo.Data0008.P' +
        'RODUCT_NAME, dbo.Data0064.QUAN_SHIPPED, dbo.Data0064.part_price,' +
        ' dbo.Data0064.cust_decl, '
      
        '                      dbo.data0439.Remark, ROUND(dbo.Data0064.QU' +
        'AN_SHIPPED * dbo.Data0064.REPORT_UNIT_VALUE1 * 0.001, 4) AS weig' +
        'th, dbo.Data0025.ANALYSIS_CODE_2, '
      
        '                      dbo.Data0060.REFERENCE_NUMBER AS REFERENCE' +
        '_60, ROUND(dbo.Data0064.part_price * dbo.Data0064.QUAN_SHIPPED /' +
        ' dbo.Data0060.EXCH_RATE, 4) '
      
        '                      AS amount, ROUND(Data0064.part_price * dbo' +
        '.Data0064.QUAN_SHIPPED, 4) AS preamount, dbo.Data0112.invoice_nu' +
        'mber, '
      
        '                      dbo.Data0025.MANU_PART_DESC, dbo.Data0025.' +
        'LAYERS, dbo.Data0001.CURR_CODE, round(dbo.Data0064.QUAN_SHIPPED ' +
        '* dbo.Data0025.unit_sq,4) AS mianji, '
      
        '                      dbo.Data0064.ovsh_qty, dbo.Data0064.GLPTR_' +
        'STATUS, derivedtbl_1.cost_2, dbo.Data0064.TAX_2, Data0064.part_p' +
        'rice* (1 + dbo.Data0064.TAX_2 * 0.01) as part_taxprice,'
      
        '                      ROUND((Data0064.part_price * dbo.Data0064.' +
        'QUAN_SHIPPED) * (1 + dbo.Data0064.TAX_2 * 0.01) / dbo.Data0060.E' +
        'XCH_RATE, 4) AS tax_amount, '
      
        '                      ROUND((Data0064.part_price * dbo.Data0064.' +
        'QUAN_SHIPPED) * (1 + dbo.Data0064.TAX_2 * 0.01), 4) AS tax_pream' +
        'ount, dbo.Data0060.TOTAL_ADD_L_PRICE, '
      
        '                      CASE data0060.tax_in_price WHEN '#39'N'#39' THEN '#39 +
        #21542#39' WHEN '#39'Y'#39' THEN '#39#26159#39' END AS tax_in_price, dbo.Data0064.RKEY, dbo' +
        '.Data0064.REMARK AS remark64, '
      
        '                      dbo.Data0025.ANALYSIS_CODE_1, dbo.Data0025' +
        '.ANALYSIS_CODE_5, dbo.Data0025.set_qty, CASE WHEN data0439.invoi' +
        'ce_ptr IS NULL '
      
        '                      THEN '#39#21542#39' ELSE '#39#26159#39' END AS if_invice,Data006' +
        '0.EXCH_RATE,round(derivedtbl_1.mianji_bb,4) as mianji_bb,data006' +
        '4.DATE_ASSIGN,data0112.POSTED_DATE,'
      
        '                      DATA0023.ABBR_NAME AS SUPPLIER_NAME_23,dat' +
        'a0064.QUAN_CREDITED,case data0064.assign_type  when 0 then '#39#27491#24120' '#39 +
        ' when 1 then '#39#36864#36135#39' end as assign_type'
      'FROM         dbo.data0439 INNER JOIN'
      
        '                      dbo.Data0010 ON dbo.data0439.customer_ptr ' +
        '= dbo.Data0010.RKEY INNER JOIN'
      
        '                      dbo.Data0064 ON dbo.data0439.rkey = dbo.Da' +
        'ta0064.packing_list_ptr INNER JOIN'
      
        '                      dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.' +
        'Data0060.RKEY INNER JOIN'
      
        '                      dbo.Data0097 ON dbo.Data0060.PURCHASE_ORDE' +
        'R_PTR = dbo.Data0097.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.data0439.employee_ptr ' +
        '= dbo.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0060.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY INNER JOIN'
      
        '                      dbo.Data0008 ON dbo.Data0025.PROD_CODE_PTR' +
        ' = dbo.Data0008.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0112 ON dbo.data0439.invoice_ptr =' +
        ' dbo.Data0112.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0060.CURRENCY_PTR ' +
        '= dbo.Data0001.RKEY left outer join'
      
        '                      dbo.Data0023 ON DBO.Data0060.supplier_ptr=' +
        'dbo.Data0023.RKEY'
      '                      INNER JOIN'
      '                          (SELECT     dbo.Data0052.SO_SHP_PTR, '
      
        '          SUM(dbo.Data0052.QUAN_SHP * (dbo.Data0053.cost_pcs + d' +
        'bo.Data0053.matl_ovhd_pcs + '
      
        '                                                                ' +
        ' dbo.Data0053.OVHD_COST + dbo.Data0053.PLANNED_QTY+data0053.ovhd' +
        '1_pcs+data0053.outsource_pcs)) AS cost_2, '
      
        ' SUM(dbo.Data0052.QUAN_SHP *  case when (data0053.work_order_ptr' +
        ' is not null) and (Data0006.PARTS_PER_PANEL>0) then '
      
        '  dbo.Data0006.panel_ln * dbo.Data0006.panel_wd * 0.000001 / dbo' +
        '.Data0006.PARTS_PER_PANEL'
      
        'else Data0025.unit_sq end) AS mianji_bb FROM         dbo.Data005' +
        '2 INNER JOIN'
      
        '                      dbo.Data0053 ON dbo.Data0052.DATA0053_PTR ' +
        '= dbo.Data0053.RKEY INNER JOIN'
      
        '                      dbo.Data0025 ON dbo.Data0053.CUST_PART_PTR' +
        ' = dbo.Data0025.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0006 ON dbo.Data0053.WORK_ORDER_PT' +
        'R = dbo.Data0006.RKEY'
      
        'GROUP BY dbo.Data0052.SO_SHP_PTR) AS derivedtbl_1 ON dbo.Data006' +
        '4.RKEY = derivedtbl_1.SO_SHP_PTR'
      'WHERE     (dbo.Data0064.QUAN_SHIPPED > 0) '
      
        'ORDER BY dbo.data0439.delivery_no, dbo.Data0060.SALES_ORDER, dbo' +
        '.Data0064.SHIPMENT_NO')
    Left = 426
    Top = 454
    object ADO439delivery_no: TStringField
      DisplayLabel = #35013#31665#21333#32534#21495
      DisplayWidth = 18
      FieldName = 'delivery_no'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object ADO439invoice_number: TStringField
      DisplayLabel = #21457#31080#21495#30721
      FieldName = 'invoice_number'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object ADO439CUST_CODE: TStringField
      DisplayLabel = #23458#25143#20195#30721
      DisplayWidth = 10
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 5
    end
    object ADO439date_sailing: TDateTimeField
      DisplayLabel = #20986#36135#26085#26399
      DisplayWidth = 22
      FieldName = 'date_sailing'
      ReadOnly = True
    end
    object ADO439cartons_no: TIntegerField
      DisplayLabel = #20986#36135#31665#25968
      DisplayWidth = 12
      FieldName = 'cartons_no'
      ReadOnly = True
    end
    object ADO439charge: TFloatField
      DisplayLabel = #35013#36816#36153#29992
      DisplayWidth = 12
      FieldName = 'charge'
      ReadOnly = True
    end
    object ADO439SALES_ORDER: TStringField
      DisplayLabel = #38144#21806#35746#21333
      DisplayWidth = 12
      FieldName = 'SALES_ORDER'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object ADO439SHIPMENT_NO: TSmallintField
      DisplayLabel = #25351#27966#25209#27425
      DisplayWidth = 12
      FieldName = 'SHIPMENT_NO'
      ReadOnly = True
    end
    object ADO439PO_NUMBER: TStringField
      DisplayLabel = #23458#25143#35746#21333#21495
      DisplayWidth = 21
      FieldName = 'PO_NUMBER'
      ReadOnly = True
      Size = 25
    end
    object ADO439PO_DATE: TDateTimeField
      DisplayLabel = #37319#36141#35746#21333#26085#26399
      DisplayWidth = 22
      FieldName = 'PO_DATE'
      ReadOnly = True
    end
    object ADO439EMPLOYEE_NAME: TStringField
      DisplayLabel = #25351#27966#21592#24037
      DisplayWidth = 19
      FieldName = 'EMPLOYEE_NAME'
      ReadOnly = True
      Size = 16
    end
    object ADO439QUAN_SHIPPED: TIntegerField
      DisplayLabel = #35013#36816#25968#37327
      FieldName = 'QUAN_SHIPPED'
      ReadOnly = True
    end
    object ADO439part_price: TFloatField
      DisplayLabel = #19981#21547#31246#20215#26684
      FieldName = 'part_price'
      ReadOnly = True
    end
    object ADO439amount: TFloatField
      DisplayLabel = #26412#24065#19981#21547#31246#37329#39069
      FieldName = 'amount'
      ReadOnly = True
    end
    object ADO439fob: TStringField
      DisplayLabel = #20132#36135#31665#23610#23544
      FieldName = 'fob'
      ReadOnly = True
    end
    object ADO439reference_number: TStringField
      DisplayLabel = #21253#35013#31665#23610#23544
      FieldName = 'reference_number'
      ReadOnly = True
    end
    object ADO439Remark: TStringField
      DisplayLabel = #35013#36816#22791#27880
      FieldName = 'Remark'
      ReadOnly = True
      Size = 50
    end
    object ADO439SCH_DATE: TDateTimeField
      DisplayLabel = #22238#22797#20132#26399
      FieldName = 'SCH_DATE'
      ReadOnly = True
    end
    object ADO439mianji: TFloatField
      DisplayLabel = #20986#36135#38754#31215'm2'
      FieldName = 'mianji'
      ReadOnly = True
    end
    object ADO439weigth: TFloatField
      DisplayLabel = #37325#37327'KG'
      FieldName = 'weigth'
      ReadOnly = True
    end
    object ADO439ANALYSIS_CODE_2: TStringField
      DisplayLabel = #23458#25143#29289#26009#21495
      FieldName = 'ANALYSIS_CODE_2'
      ReadOnly = True
      Size = 50
    end
    object ADO439MANU_PART_NUMBER: TStringField
      DisplayLabel = #26412#21378#32534#21495
      FieldName = 'MANU_PART_NUMBER'
      ReadOnly = True
    end
    object ADO439MANU_PART_DESC: TStringField
      DisplayLabel = #23458#25143#22411#21495
      FieldName = 'MANU_PART_DESC'
      ReadOnly = True
      Size = 40
    end
    object ADO439REFERENCE_60: TStringField
      DisplayLabel = #35746#21333#21442#32771
      FieldName = 'REFERENCE_60'
      ReadOnly = True
      Size = 30
    end
    object ADO439PRODUCT_NAME: TStringField
      DisplayLabel = #20135#21697#31867#22411
      FieldName = 'PRODUCT_NAME'
      ReadOnly = True
      Size = 30
    end
    object ADO439abbr_name: TStringField
      DisplayLabel = #23458#25143#31616#31216
      FieldName = 'abbr_name'
      ReadOnly = True
      Size = 10
    end
    object ADO439curr_code: TStringField
      DisplayLabel = #36135#24065#20195#30721
      FieldName = 'curr_code'
      ReadOnly = True
      Size = 5
    end
    object ADO439cust_decl: TStringField
      DisplayWidth = 20
      FieldName = 'cust_decl'
      ReadOnly = True
      Size = 50
    end
    object ADO439preamount: TFloatField
      DisplayLabel = #21407#24065#37329#39069#19981#21547#31246
      FieldName = 'preamount'
      ReadOnly = True
    end
    object ADO439GLPTR_STATUS: TBooleanField
      DisplayLabel = #24320#31080#26631#35782
      FieldName = 'GLPTR_STATUS'
      ReadOnly = True
    end
    object ADO439cost_2: TFloatField
      DisplayLabel = #25104#26412
      FieldName = 'cost_2'
      ReadOnly = True
    end
    object ADO439ovsh_qty: TIntegerField
      DisplayLabel = #24320#31080#25968#37327
      FieldName = 'ovsh_qty'
      ReadOnly = True
    end
    object ADO439TAX_2: TBCDField
      DisplayLabel = #31246#29575'%'
      FieldName = 'TAX_2'
      ReadOnly = True
      Precision = 4
      Size = 2
    end
    object ADO439tax_amount: TFloatField
      DisplayLabel = #26412#24065#21547#31246#37329#39069
      FieldName = 'tax_amount'
      ReadOnly = True
    end
    object ADO439tax_preamount: TFloatField
      DisplayLabel = #21407#24065#21547#31246#37329#39069
      FieldName = 'tax_preamount'
      ReadOnly = True
    end
    object ADO439layers: TWordField
      FieldName = 'layers'
    end
    object ADO439TOTAL_ADD_L_PRICE: TFloatField
      DisplayLabel = #24037#20855#36153#29992
      FieldName = 'TOTAL_ADD_L_PRICE'
    end
    object ADO439tax_in_price: TStringField
      FieldName = 'tax_in_price'
      ReadOnly = True
      Size = 2
    end
    object ADO439ORIG_CUSTOMER: TStringField
      DisplayLabel = #20851#32852#21407#23458#25143
      DisplayWidth = 10
      FieldName = 'ORIG_CUSTOMER'
      Size = 30
    end
    object ADO439rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object ADO439remark64: TStringField
      DisplayLabel = #25351#27966#22791#27880
      DisplayWidth = 20
      FieldName = 'remark64'
      Size = 60
    end
    object ADO439ANALYSIS_CODE_1: TStringField
      DisplayLabel = #20132#36135#23610#23544
      DisplayWidth = 20
      FieldName = 'ANALYSIS_CODE_1'
      ReadOnly = True
      Size = 30
    end
    object ADO439ANALYSIS_CODE_5: TStringField
      DisplayLabel = #21333#21482#23610#23544
      DisplayWidth = 20
      FieldName = 'ANALYSIS_CODE_5'
      ReadOnly = True
      Size = 30
    end
    object ADO439set_qty: TIntegerField
      DisplayLabel = #20132#36135#21333#20803#25968
      FieldName = 'set_qty'
      ReadOnly = True
    end
    object ADO439if_invice: TStringField
      DisplayLabel = #26159#21542#24320#21333
      FieldName = 'if_invice'
      ReadOnly = True
      Size = 2
    end
    object ADO439part_taxprice: TFloatField
      DisplayLabel = #21547#31246#20215#26684
      FieldName = 'part_taxprice'
      ReadOnly = True
    end
    object ADO439EXCH_RATE: TFloatField
      DisplayLabel = #27719#29575
      FieldName = 'EXCH_RATE'
      ReadOnly = True
    end
    object ADO439mianji_bb: TFloatField
      DisplayLabel = #20986#36135#38754#31215'm2'
      FieldName = 'mianji_bb'
      ReadOnly = True
    end
    object ADO439DATE_ASSIGN: TDateTimeField
      DisplayLabel = #25351#27966#26085#26399
      FieldName = 'DATE_ASSIGN'
      ReadOnly = True
    end
    object ADO439POSTED_DATE: TDateTimeField
      DisplayLabel = #21457#31080#26085#26399
      FieldName = 'POSTED_DATE'
      ReadOnly = True
    end
    object ADO439SUPPLIER_NAME_23: TStringField
      FieldName = 'SUPPLIER_NAME_23'
      Size = 100
    end
    object ADO439QUAN_CREDITED: TIntegerField
      DisplayLabel = #36864#36135#25968#37327
      FieldName = 'QUAN_CREDITED'
    end
    object ADO439assign_type: TStringField
      DisplayLabel = #25351#27966#31867#22411
      FieldName = 'assign_type'
      ReadOnly = True
      Size = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = ADO439
    Left = 362
    Top = 453
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu1Popup
    Left = 316
    Top = 54
  end
  object tmp: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 480
    Top = 448
  end
end
