object Form3: TForm3
  Left = 309
  Top = 271
  Width = 963
  Height = 588
  Caption = #26448#26009#21457#25918#26126#32454
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 955
    Height = 513
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
        FieldName = 'REF457_NUMBER'
        ReadOnly = True
        Title.Caption = #39046#26009#21333#21495
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GON_NUMBER'
        ReadOnly = True
        Title.Caption = #20986#20179#21333#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_PART_NUMBER'
        ReadOnly = True
        Title.Caption = #26448#26009#32534#30721
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_NAME'
        ReadOnly = True
        Title.Caption = #26448#26009#21517#31216
        Width = 166
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INV_DESCRIPTION'
        ReadOnly = True
        Title.Caption = #26448#26009#35268#26684
        Width = 160
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_group_name'
        ReadOnly = True
        Title.Caption = #26448#26009#32452#21035
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'reason'
        ReadOnly = True
        Title.Caption = #35831#36141#21407#22240
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GROUP_DESC'
        ReadOnly = True
        Title.Caption = #26448#26009#31867#22411
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODE'
        ReadOnly = True
        Title.Caption = #20379#24212#21830#20195#30721
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME'
        ReadOnly = True
        Title.Caption = #20379#24212#21830
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEPT_NAME'
        ReadOnly = True
        Title.Caption = #21457#25918#37096#38376
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TDATE'
        ReadOnly = True
        Title.Caption = #21457#25918#26085#26399
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QUANTITY'
        ReadOnly = True
        Title.Caption = #21457#25918#25968#37327
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIT_NAME'
        ReadOnly = True
        Title.Caption = #21333#20301
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'tax_price'
        ReadOnly = True
        Title.Caption = #21547#31246#20215
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STANDARD_COST'
        Title.Caption = #19981#21547#31246#20215
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAX_2'
        ReadOnly = True
        Title.Caption = #31246#29575'%'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_price'
        Title.Caption = #37329#39069'('#26412#24065#21547#31246')'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_notaxprice'
        Title.Caption = #37329#39069'('#26412#24065#19981#21547#31246')'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_area'
        Title.Caption = #21457#25918#38754#31215
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total_Weight'
        Title.Caption = #21457#25918#37325#37327
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUPPLIER2'
        ReadOnly = True
        Title.Caption = #21407#20379#24212#21830#25110#29983#20135#25209#21495
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CURR_CODE'
        ReadOnly = True
        Title.Caption = #36135#24065
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPLOYEE_NAME'
        ReadOnly = True
        Title.Caption = #39046#26009#20154#21592
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FL_EMPLOYEE'
        ReadOnly = True
        Title.Caption = #21457#26009#20154#21592
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RTN_QUANTITY'
        ReadOnly = True
        Title.Caption = #36864#20179#25968#37327
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GRN_NUMBER'
        ReadOnly = True
        Title.Caption = #20837#20179#21333#21495
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'v_type'
        Title.Caption = #20837#24211#31867#22411
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ship_DATE'
        ReadOnly = True
        Title.Caption = #20837#24211#26085#26399
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CUT_NO'
        Title.Caption = #29983#20135#21333#21495
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CUST_CODE'
        Title.Caption = #23458#25143#20195#30721
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'ABBR_NAME10'
        ReadOnly = True
        Title.Caption = #23458#25143#21517#31216
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'PROD_CODE'
        Title.Caption = #20135#21697#32534#30721
        Width = 114
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_NAME'
        Title.Caption = #20135#21697#21517#31216
        Width = 157
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUCT_DESC'
        Title.Caption = #20135#21697#35268#26684
        Width = -1
        Visible = False
      end
      item
        Expanded = False
        FieldName = 's_type'
        Title.Caption = #39046#26009#31867#22411
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SO_NO'
        Title.Caption = #38144#21806#35746#21333
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'rohs'
        ReadOnly = True
        Title.Caption = #29615#20445#31561#32423
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'note_info'
        ReadOnly = True
        Title.Caption = #21457#26009#22791#27880
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'yf_remark'
        Title.Caption = #39069#22806#22791#27880
        Width = 258
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOCATION'
        ReadOnly = True
        Title.Caption = #20179#24211
        Width = 95
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WAREHOUSE_CODE'
        ReadOnly = True
        Title.Caption = #39046#26009#24037#21378
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PO_NUMBER'
        ReadOnly = True
        Title.Caption = #37319#36141#21333#21495
        Visible = False
      end
      item
        Expanded = False
        FieldName = #24211#23384#24037#21378
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EXPIRE_DATE'
        Title.Caption = #26377#25928#26399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'inv_type'
        Title.Caption = #30452#25509'/'#38388#25509#26448#26009
        Width = 93
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 955
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      955
      41)
    object Label1: TLabel
      Left = 604
      Top = 4
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '  '#25968#37327#21512#35745
    end
    object Label2: TLabel
      Left = 705
      Top = 3
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #37329#39069#26412#24065#21547#31246
    end
    object Label3: TLabel
      Left = 277
      Top = 14
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #26448#26009#32534#30721
    end
    object Label4: TLabel
      Left = 822
      Top = 3
      Width = 91
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #37329#39069#26412#24065#19981#21547#31246
    end
    object Edit1: TEdit
      Left = 612
      Top = 18
      Width = 89
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
      Text = '0.00'
    end
    object Edit2: TEdit
      Left = 705
      Top = 18
      Width = 113
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
      Text = '0.0000'
    end
    object Edit3: TEdit
      Left = 342
      Top = 10
      Width = 152
      Height = 21
      Anchors = [akTop]
      TabOrder = 2
      OnChange = Edit3Change
    end
    object Edit4: TEdit
      Left = 823
      Top = 18
      Width = 113
      Height = 21
      TabStop = False
      Anchors = [akTop, akRight]
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 3
      Text = '0.0000'
    end
    object BitBtn1: TBitBtn
      Left = 15
      Top = 5
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
      TabOrder = 4
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
      Left = 73
      Top = 5
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
      TabOrder = 5
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
      Left = 131
      Top = 5
      Width = 57
      Height = 30
      Hint = #23548#20986#25968#25454'Excel'
      Caption = #25171#21360
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
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
    object BitBtn5: TBitBtn
      Left = 189
      Top = 5
      Width = 57
      Height = 30
      Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
      Caption = #23383#27573
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = BitBtn10Click
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
  object ado207: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     TOP (100) PERCENT dbo.Data0457.REF_NUMBER AS REF457_N' +
        'UMBER, dbo.Data0457.GON_NUMBER, dbo.Data0017.INV_PART_NUMBER, '
      
        '                      dbo.Data0017.INV_NAME, dbo.Data0017.INV_DE' +
        'SCRIPTION, dbo.Data0496.GROUP_DESC, dbo.Data0034.DEPT_NAME, dbo.' +
        'Data0207.QUANTITY, '
      
        '                      dbo.Data0207.RTN_QUANTITY, dbo.Data0001.CU' +
        'RR_CODE, ROUND(dbo.Data0022.PRICE, 4) AS STANDARD_COST, '
      
        '                      CASE WHEN dbo.Data0468.CUT_NO IS NULL THEN' +
        ' dbo.DATA0268.CUT_NO ELSE Data0468.CUT_NO END AS CUT_NO,'
      
        '                      Data0492.SO_NO, data0010.CUST_CODE AS CUST' +
        '_CODE, '
      
        '                      data0010.ABBR_NAME AS ABBR_NAME10, dbo.Dat' +
        'a0022.BARCODE_ID, dbo.Data0019.inv_group_name, dbo.Data0022.TAX_' +
        '2, '
      
        '                      dbo.Data0022.tax_price, dbo.Data0022.SUPPL' +
        'IER2, ROUND(dbo.Data0207.QUANTITY * dbo.Data0022.tax_price * dbo' +
        '.Data0456.exch_rate, 4) '
      
        '                      AS total_price, ROUND((dbo.Data0207.QUANTI' +
        'TY * dbo.Data0022.tax_price * dbo.Data0456.exch_rate) / (1 + dbo' +
        '.Data0022.TAX_2 * 0.01), 4) '
      
        '                      AS total_notaxprice, dbo.Data0023.CODE, db' +
        'o.Data0023.ABBR_NAME, dbo.Data0002.UNIT_NAME, dbo.Data0207.TDATE' +
        ', dbo.Data0022.rohs, '
      
        '                      dbo.Data0456.GRN_NUMBER, dbo.Data0005.EMPL' +
        'OYEE_NAME, dbo.Data0457.Cut_NO AS note_info, '
      
        '                      ROUND(dbo.Data0207.QUANTITY * dbo.Data0017' +
        '.STOCK_SELL, 4) AS total_area, ROUND(dbo.Data0207.QUANTITY * dbo' +
        '.Data0022.STOCK_BASE, 4) '
      
        '                      AS total_Weight, dbo.Data0016.LOCATION, db' +
        'o.Data0015.WAREHOUSE_CODE, '
      
        #9#9#9#9#9'  case  dbo.data0496.ttype when '#39'p'#39' then '#39#30452#25509#26448#26009#39' else '#39#38388#25509#26448#26009#39 +
        ' end as inv_type,'
      
        '                      CASE data0456.ttype WHEN 1 THEN '#39#32534#30721#20837#24211#39' WHE' +
        'N 3 THEN '#39#30452#25509#20837#24211#39' WHEN 4 THEN '#39#35843#25300#20837#24211#39' WHEN 5 THEN '#39'VMI'#20837#24211#39' END AS v_' +
        'type, '
      
        '                      CASE WHEN dbo.Data0034.ttype = 1 THEN '#39#24037#24207#39 +
        ' WHEN dbo.Data0034.ttype <> 1 THEN '#39#38750#24037#24207#39' END AS s_type, dbo.Data' +
        '0456.ship_DATE, '
      
        '                      dbo.Data0456.ship_DATE AS ship_DATE_1, Dat' +
        'a0005_1.EMPLOYEE_NAME AS FL_EMPLOYEE, dbo.Data0070.PO_NUMBER, db' +
        'o.Data0207.yf_remark, '
      
        '                      Data0015_1.WAREHOUSE_CODE AS '#24211#23384#24037#21378', dbo.Dat' +
        'a0071.reason, dbo.Data0022.EXPIRE_DATE, dbo.Data0008.PROD_CODE, '
      
        #9#9#9#9#9'  dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC     ' +
        '                  '
      'FROM         dbo.Data0071 RIGHT OUTER JOIN'
      '                      dbo.DATA0268 LEFT OUTER JOIN'
      '                      dbo.data0492 LEFT OUTER JOIN'
      
        '                      dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo' +
        '.Data0008.RKEY ON dbo.DATA0268.CUT_NO = dbo.data0492.CUT_NO RIGH' +
        'T OUTER JOIN'
      '                      dbo.Data0468 RIGHT OUTER JOIN'
      '                      dbo.Data0207 INNER JOIN'
      
        '                      dbo.Data0457 ON dbo.Data0207.GON_PTR = dbo' +
        '.Data0457.RKEY INNER JOIN'
      
        '                      dbo.Data0017 ON dbo.Data0207.INVENTORY_PTR' +
        ' = dbo.Data0017.RKEY INNER JOIN'
      
        '                      dbo.Data0496 ON dbo.Data0017.GROUP_PTR = d' +
        'bo.Data0496.RKEY INNER JOIN'
      
        '                      dbo.Data0022 ON dbo.Data0207.D0022_PTR = d' +
        'bo.Data0022.RKEY INNER JOIN'
      
        '                      dbo.Data0019 ON dbo.Data0496.group_ptr = d' +
        'bo.Data0019.rkey INNER JOIN'
      
        '                      dbo.Data0002 ON dbo.Data0022.LOCATION_PTR_' +
        'FROM = dbo.Data0002.RKEY INNER JOIN'
      
        '                      dbo.Data0456 ON dbo.Data0022.GRN_PTR = dbo' +
        '.Data0456.RKEY INNER JOIN'
      
        '                      dbo.Data0023 ON dbo.Data0456.SUPP_PTR = db' +
        'o.Data0023.RKEY INNER JOIN'
      
        '                      dbo.Data0001 ON dbo.Data0456.currency_ptr ' +
        '= dbo.Data0001.RKEY INNER JOIN'
      
        '                      dbo.Data0015 AS Data0015_1 ON dbo.Data0456' +
        '.warehouse_ptr = Data0015_1.RKEY INNER JOIN'
      
        '                      dbo.Data0034 ON dbo.Data0457.dept_ptr = db' +
        'o.Data0034.RKEY INNER JOIN'
      
        '                      dbo.Data0005 ON dbo.Data0457.RECD_BY = dbo' +
        '.Data0005.RKEY INNER JOIN'
      
        '                      dbo.Data0016 ON dbo.Data0022.LOCATION_PTR ' +
        '= dbo.Data0016.RKEY INNER JOIN'
      
        '                      dbo.Data0015 ON dbo.Data0457.warehouse_ptr' +
        ' = dbo.Data0015.RKEY INNER JOIN'
      
        '                      dbo.Data0005 AS Data0005_1 ON dbo.Data0457' +
        '.CREATE_BY = Data0005_1.RKEY ON dbo.Data0468.RKEY = dbo.Data0207' +
        '.D0468_PTR ON '
      
        '                      dbo.DATA0268.rkey = dbo.Data0468.FLOW_NO O' +
        'N dbo.Data0071.RKEY = dbo.Data0022.SOURCE_PTR LEFT OUTER JOIN'
      
        '                      dbo.Data0070 ON dbo.Data0456.PO_PTR = dbo.' +
        'Data0070.RKEY LEFT OUTER JOIN'
      
        '                      dbo.Data0010 ON dbo.data0492.COMPLETED = d' +
        'ata0010.RKEY'
      'WHERE     (dbo.Data0207.QUANTITY <> 0)')
    Left = 232
    Top = 464
    object ado207REF457_NUMBER: TStringField
      FieldName = 'REF457_NUMBER'
      Size = 15
    end
    object ado207GON_NUMBER: TStringField
      FieldName = 'GON_NUMBER'
      Size = 10
    end
    object ado207INV_PART_NUMBER: TStringField
      FieldName = 'INV_PART_NUMBER'
      Size = 25
    end
    object ado207INV_NAME: TStringField
      FieldName = 'INV_NAME'
      Size = 30
    end
    object ado207INV_DESCRIPTION: TStringField
      FieldName = 'INV_DESCRIPTION'
      Size = 70
    end
    object ado207GROUP_DESC: TStringField
      FieldName = 'GROUP_DESC'
      Size = 30
    end
    object ado207DEPT_NAME: TStringField
      FieldName = 'DEPT_NAME'
      Size = 30
    end
    object ado207QUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Precision = 19
    end
    object ado207RTN_QUANTITY: TFloatField
      FieldName = 'RTN_QUANTITY'
    end
    object ado207CURR_CODE: TStringField
      FieldName = 'CURR_CODE'
      Size = 5
    end
    object ado207STANDARD_COST: TBCDField
      FieldName = 'STANDARD_COST'
      ReadOnly = True
      Precision = 15
      Size = 6
    end
    object ado207CUT_NO: TStringField
      FieldName = 'CUT_NO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object ado207SO_NO: TStringField
      FieldName = 'SO_NO'
      ReadOnly = True
      FixedChar = True
      Size = 12
    end
    object ado207CUST_CODE: TStringField
      FieldName = 'CUST_CODE'
      ReadOnly = True
      Size = 10
    end
    object ado207BARCODE_ID: TStringField
      FieldName = 'BARCODE_ID'
      Size = 50
    end
    object ado207inv_group_name: TStringField
      FieldName = 'inv_group_name'
    end
    object ado207TAX_2: TBCDField
      FieldName = 'TAX_2'
      Precision = 4
      Size = 2
    end
    object ado207tax_price: TBCDField
      FieldName = 'tax_price'
      Precision = 13
    end
    object ado207SUPPLIER2: TStringField
      FieldName = 'SUPPLIER2'
      Size = 30
    end
    object ado207total_price: TBCDField
      FieldName = 'total_price'
      ReadOnly = True
      Precision = 32
      Size = 8
    end
    object ado207total_notaxprice: TBCDField
      FieldName = 'total_notaxprice'
      ReadOnly = True
      Precision = 32
      Size = 6
    end
    object ado207CODE: TStringField
      FieldName = 'CODE'
      Size = 10
    end
    object ado207UNIT_NAME: TStringField
      FieldName = 'UNIT_NAME'
    end
    object ado207TDATE: TDateTimeField
      FieldName = 'TDATE'
    end
    object ado207rohs: TStringField
      FieldName = 'rohs'
      Size = 10
    end
    object ado207GRN_NUMBER: TStringField
      FieldName = 'GRN_NUMBER'
      Size = 10
    end
    object ado207EMPLOYEE_NAME: TStringField
      FieldName = 'EMPLOYEE_NAME'
      Size = 16
    end
    object ado207note_info: TStringField
      FieldName = 'note_info'
      Size = 40
    end
    object ado207total_area: TFloatField
      FieldName = 'total_area'
      ReadOnly = True
    end
    object ado207total_Weight: TBCDField
      FieldName = 'total_Weight'
      ReadOnly = True
      Precision = 28
      Size = 8
    end
    object ado207LOCATION: TStringField
      FieldName = 'LOCATION'
    end
    object ado207WAREHOUSE_CODE: TStringField
      FieldName = 'WAREHOUSE_CODE'
      Size = 5
    end
    object ado207v_type: TStringField
      FieldName = 'v_type'
      ReadOnly = True
      Size = 8
    end
    object ado207ship_DATE: TDateTimeField
      FieldName = 'ship_DATE'
    end
    object ado207ship_DATE_1: TDateTimeField
      FieldName = 'ship_DATE_1'
    end
    object ado207FL_EMPLOYEE: TStringField
      FieldName = 'FL_EMPLOYEE'
      Size = 16
    end
    object ado207PO_NUMBER: TStringField
      FieldName = 'PO_NUMBER'
      Size = 15
    end
    object ado207yf_remark: TStringField
      FieldName = 'yf_remark'
      ReadOnly = True
      Size = 50
    end
    object ado207DSDesigner: TStringField
      FieldName = #24211#23384#24037#21378
      Size = 5
    end
    object ado207reason: TStringField
      FieldName = 'reason'
      Size = 60
    end
    object ado207ABBR_NAME10: TStringField
      FieldName = 'ABBR_NAME10'
      Size = 10
    end
    object ado207ABBR_NAME: TStringField
      FieldName = 'ABBR_NAME'
      Size = 16
    end
    object ado207EXPIRE_DATE: TDateTimeField
      FieldName = 'EXPIRE_DATE'
    end
    object ado207s_type: TStringField
      FieldName = 's_type'
      ReadOnly = True
      Size = 10
    end
    object ado207inv_type: TStringField
      FieldName = 'inv_type'
      ReadOnly = True
      Size = 8
    end
    object ado207PROD_CODE: TStringField
      FieldName = 'PROD_CODE'
      Size = 25
    end
    object ado207PRODUCT_NAME: TStringField
      FieldName = 'PRODUCT_NAME'
      Size = 30
    end
    object ado207PRODUCT_DESC: TStringField
      DisplayWidth = 30
      FieldName = 'PRODUCT_DESC'
      Size = 200
    end
  end
  object DataSource1: TDataSource
    DataSet = ado207
    Left = 176
    Top = 464
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    Left = 120
    Top = 76
  end
  object PopupMenu1: TPopupMenu
    Left = 476
    Top = 89
    object N1: TMenuItem
      Caption = #35774#35745#25253#34920
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #25171#21360#25253#34920
      OnClick = N2Click
    end
  end
end
