object frm_main: Tfrm_main
  Left = 216
  Top = 128
  BorderStyle = bsSingle
  Caption = #35774#22791#32500#20462#21463#29702
  ClientHeight = 674
  ClientWidth = 1043
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
    Top = 440
    Width = 1043
    Height = 7
    Cursor = crVSplit
    Align = alBottom
    Color = clAqua
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1043
    Height = 49
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 468
      Top = 18
      Width = 52
      Height = 13
      Caption = #30003#35831#21333#21495
    end
    object Label21: TLabel
      Left = 648
      Top = 16
      Width = 65
      Height = 13
      Caption = #22266#23450#26639#30446#65306
    end
    object BtnClose: TBitBtn
      Left = 2
      Top = 7
      Width = 60
      Height = 35
      Hint = #36864#20986#31243#24207
      Caption = #36864#20986
      TabOrder = 0
      OnClick = BtnCloseClick
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
    object BtnRefresh: TBitBtn
      Left = 61
      Top = 7
      Width = 60
      Height = 35
      Hint = #21047#26032
      Caption = #21047#26032
      TabOrder = 1
      OnClick = BtnRefreshClick
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
    object BtnExportToExcel: TBitBtn
      Left = 120
      Top = 7
      Width = 60
      Height = 35
      Hint = #23548#20986#25968#25454
      Caption = #23548#20986
      TabOrder = 2
      OnClick = BtnExportToExcelClick
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
    object BtnQuery: TBitBtn
      Left = 179
      Top = 7
      Width = 60
      Height = 35
      Hint = #26597#35810#26465#20214
      Caption = #26597#35810
      TabOrder = 3
      OnClick = BtnQueryClick
      Glyph.Data = {
        F2060000424DF206000000000000360400002800000019000000190000000100
        080000000000BC0200001217000012170000000100000000000000000000F8F8
        0000B0B0B00080808000F8600000F0F8F80060606000C8F8C80048484800D0E0
        E00098300000F8C89800F8F8980060000000F898000098989800F86060003030
        3000F8F83000F8F8C800F8E8C800C8C8C800F8F8F8001818180070707000C0C0
        C000E8E8E8005050500000000000000000000000000000000000000000000000
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
        00000013000088331700000000000000E400F712000035A6FC00770000001300
        0700A7FC7700080613000083A600FC7700000000000035A5FC0077FFFF000000
        7C00010000000000000000000000000000000000000000000000000000000000
        4300000000000039F000008800008A0098006317000078011300009863001700
        78000113000090631700000000000000C000F7120000C8F3EB007770F5001200
        0000ECFD7F0002000000000000001300F2000100000001000A0000884000F877
        8800331700000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF000000E40039F00000E439F000001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000009000001A020090331700007FFF00FFFF
        00000000000090331700000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF0000007C0001000000E439F000000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        7C0001000000D0F8120000D8F80012000800000000000E000000161616161616
        1616161616161616161616161616161616161600000016161616161616161616
        1616161616161616161616161616160000001616161616161616161616161616
        16161616161616161616160000001616161616161616161616161616161616F9
        0F161616161616000000161616161616161616161616161616160A0E040D1616
        1616160000001616161616161616181B1B1B1B1B1B0A0E0ED90D1B0816161600
        00001616161616161616181515151515B50E010E0D030F181616160000001616
        16161616161618050505050F0EFB048302151A0F051616000000161616161616
        1616180909090A0E0E040D0F090505031616160000001616161616161616180F
        150600010E0D03150505050F051616000000161616161602020318A318030211
        E30F19191905050316161600000016161616180B0C1513070B181706030F0F0F
        0F05050F05161600000016161616180C0715130FE90B18171909090909050503
        161616000000161616020B1A14151312120B0B170F0F0F0F0F05050F05161600
        00001616160213131A0907AA0F12191702190219020509031616160000001616
        160213050515140F0F0F0B1802090909A709191816161600000016161602131A
        0515071212121818191A050509190F06161616000000161616090F0C14091319
        0B0F18190219051903061B08161616000000161616161618180B0B0B0F18091A
        0505051505091902051616000000161616161616031818180F14050505050515
        09191B05161616000000161616161616161603091A05050505050515191B1616
        1616160000001616161616161616031902191902190219020F16161616161600
        0000161616161616161616161605161616160505161616161616160000001616
        1616161616161616161616161616161616161616161616000000161616161616
        16161616161616161616161616161616161616000000}
    end
    object BtnFieldsVisable: TBitBtn
      Left = 239
      Top = 7
      Width = 57
      Height = 35
      Hint = #36873#25321#23383#27573
      Caption = #23383#27573
      TabOrder = 4
      OnClick = BtnFieldsVisableClick
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
    object BitBtn14: TBitBtn
      Left = 295
      Top = 7
      Width = 98
      Height = 35
      Hint = #21047#26032#25968#25454
      Caption = #24322#24120#31867#21035#26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = BitBtn14Click
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000610B0000610B00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E5005A1E1E00783C3C0096646400C8969600FFC8C800465F
        82005591B9006EB9D7008CD2E600B4E6F000D8E9EC0099A8AC00646F7100E2EF
        F100C56A31000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000EEEEEEEEEEEE
        EEEEEE8383ADEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEE3AD82EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEF1E3AC
        ACACE38283ADAD82EEEEEEEEEEF1E3ACACACE3EEEEEEEEEEEEEEEEEEF1E3E2DF
        F0DF81E3AC83ADAD82EEEEEEF1E3E281DF8181E3EEEEEEEEEEEEEEEEE3DFDFF0
        F056E1DFE3AD82AD83EEEEEEE38181DFDFDFDF81E3EEEEEEEEEEEEEEEFDF81E2
        E2DEDFE1DFE38282AD82EEEEEF8181E2E2DE81DF81E3EEEEEEEEEEE356DFE2AC
        ACE2DEDF56EFE382E383EEE3DF81E2ACACE2DE81DFEFE3EEEEEEF1EFE156E1E1
        81ACE281E1DFAC82EEADF1EFDFDFDFDF81ACE281DF81ACEEEEEEDEE1E1E1DF57
        56E2ACE2DFF0ACEEEEEEDEDFDFDF81DFDFE2ACE281DFACEEEEEE57DFE1F0DFDF
        DFE1ACE2F0F0ACEEEEEEDF81DFDF818181DFACE2DFDFACEEEEEEDFDE2BDFAC81
        F0E1E2EFF0DFACEEEEEE81DEDF81AC81DFDFE2EFDF81ACEEEEEE81D7E1E1D7AC
        F0568181F081E3EEEEEE81D7DFDFD7ACDFDF8181DF81E3EEEEEEDE81AC2BE1F0
        E1F0DFDF56DEF1EEEEEEDE81ACDFDFDFDFDF8181DFDEF1EEEEEEEE8157E12BE1
        E15656F081E3EEEEEEEEEE81DFDFDFDFDFDFDFDF81E3EEEEEEEEEEEEEEEE812B
        2BE15681E3F1EEEEEEEEEEEEEEEE81DFDFDFDF81E3F1EEEEEEEEEEEEEEEEEEE3
        DEDEE3F1EEEEEEEEEEEEEEEEEEEEEEE3DEDEE3F1EEEEEEEEEEEE}
      NumGlyphs = 2
    end
    object BitBtn15: TBitBtn
      Left = 393
      Top = 7
      Width = 74
      Height = 35
      Hint = #26356#25913#26597#35810#26465#20214
      Caption = #24037#26102#26597#35810
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BitBtn15Click
      Glyph.Data = {
        C6050000424DC605000000000000360400002800000014000000140000000100
        08000000000090010000C40E0000C40E0000000100000000000000000000E8E0
        0000D0A000006060600038383800F0700000B8B8C00020202000A8B0B000F0F0
        F800B8400000C0600800A0A0A000E0E0E800D8D8E000B8100000D0D8D800C0A0
        8800B8300000F8F8080098989800B0504000B0908800B8706000E0A86000E0D8
        C000F070380088888800F0D8B0005858580008101000E0D0B000B8504000E8C8
        A000F0B85000E8D8A800C8C8C800D8982000D8C0B00050505000C8803800F0C8
        8800F8500800D8A040007078780008080800E8C0880028283000F8980000E8F0
        F00040404000B0B8B800B8A0A000C0682800E0A87800F0800000C8D0D000C898
        8000E0A88000D8904800E0E0E000F0A0000070707000E0783000B0888800E8D0
        6800C8B8A800C8700800D8885000B850180028282000B8887800F0F0D8001818
        1800F070180090909000D8C05800E8B09800F8F0E000F8F0F00048484800B8C0
        C800F0C06000F8F8F800F8805800F8F0C80080808000B8906000B0B0B000D090
        5000F8600000D8D0C800E0A05800B8585800B8B00000B8481000D0D0B000D078
        3000C0702000F0A86800C0602000E8E8E800A8A8A800F0C0B800B0201000F0A8
        4000E0B89000B8B8B80068686800F0F0E800F0982000D8D0A800E8C88000F0E0
        C000B8380800F0800800D8E0E000C0C0C000F0680800B0B0B800C0601800E0B8
        7800F0981000C8781800C0C8C80010101800C8A09000E0B8600030303000F0F0
        F000C0B8B80028282800E8E0E000F0F8F8003838400078787800F0D8B800D8C8
        B800F0C89000E0E8E800B8601000D0883800F8680800D8D0B800E8D08800C8C8
        D000D0D0D000B8B0B00058586000D8D8D8002820200010101000E8E8F000F8F8
        F000D8D0D000B8786000B8480000F0780000F0880000E0B08000B8C0C000B818
        0000C0A88800B8300800B0504800F0E0B000E8D0B000F0D08800F8501000F880
        0800ECFD7F0002000000000000001300E8000100000001000A0000884000F877
        78004B1B00000100000000998400E6775400F71200000101010001D8F8001200
        450090FB7700801FF80077FFFF00FFFF6000F8120000AD84E6007760F8001200
        D80084E677000000000000FFFF0000003800A8F8000038A8F800001800000000
        00000000000044F8120000400000000000000000000028F81200000000000000
        00000000000000000000000C000000000200000000000101120000872B00F877
        0000ECFD7F00000000000002000000006C00001A0200804B1B00007FFF00FFFF
        000000000000804B1B00000500000000870031E6770084F8120000218600E677
        9800F81200006713000010FFFF00000020000100000038A8F800000000000000
        7000F8120000ACF8120000D8F8001200100030001000F8400000105F5400E677
        200001000000D0F8120000D8F80012000800000000000E0000005331B2861D86
        1D861D861D861DF81DC57431F62C9824801414572C572C6C2C6C6C1D6C6C77B2
        6CB2B26C2CDF1232DF6C6CF86CF86C861D1B006C1D0E94530E8A6E8A24240E24
        24240E6F6CB294800E531D31550E4C245524242424515551B26C322453318655
        248A0E557780000086576C002CB20E5398536C31305A55F8CC1424511486B2F3
        1D802453535386534C229457536F066F06242CB2806C065353551D5353511D53
        638C12152477248680F8245353318653531D7755358D35121B57066FF66C2453
        98536C535380240EAA6F631557123551B26C24535353945353B2065398554D35
        776F0624C56C065353551D53536C6F53535355246F152451806C245353319453
        532480535353246F7E8D531D946C245398536C53535314F85353AA2453531480
        576C245353532C5353555314C557776F14002C246C5706535355575353315353
        551B6CF857146E146C2C24535331866C775353555353535353225A35C5B20653
        9853570E57535353535353535353AA08143153315353986C866C2C6C6C1D941D
        861D8680775398535355}
    end
    object Edit1: TEdit
      Left = 531
      Top = 12
      Width = 111
      Height = 21
      TabOrder = 7
      OnChange = Edit1Change
    end
    object Edit2: TEdit
      Left = 704
      Top = 12
      Width = 41
      Height = 21
      TabOrder = 8
      Text = '5'
      OnKeyPress = Edit2KeyPress
    end
    object UpDown1: TUpDown
      Left = 745
      Top = 12
      Width = 16
      Height = 21
      Associate = Edit2
      Position = 5
      TabOrder = 9
      Visible = False
      OnChangingEx = UpDown1ChangingEx
    end
    object GroupBox2: TGroupBox
      Left = 763
      Top = 0
      Width = 263
      Height = 50
      Caption = #25925#38556#26085#26399
      TabOrder = 10
      object Label4: TLabel
        Left = 4
        Top = 20
        Width = 13
        Height = 13
        Caption = #20174
      end
      object Label14: TLabel
        Left = 128
        Top = 20
        Width = 13
        Height = 13
        Caption = #21040
      end
      object DateTimePicker1: TDateTimePicker
        Left = 20
        Top = 14
        Width = 105
        Height = 21
        Date = 42219.479457638890000000
        Time = 42219.479457638890000000
        TabOrder = 0
        OnCloseUp = DateTimePicker1CloseUp
        OnExit = DateTimePicker1Exit
      end
      object DateTimePicker2: TDateTimePicker
        Left = 148
        Top = 12
        Width = 105
        Height = 21
        Date = 42219.481003865740000000
        Time = 42219.481003865740000000
        TabOrder = 1
        OnCloseUp = DateTimePicker2CloseUp
        OnExit = DateTimePicker2Exit
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 615
    Width = 1043
    Height = 40
    Align = alBottom
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 537
      Height = 41
      Caption = #29366#24577
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 8
        Top = 16
        Width = 65
        Height = 17
        Caption = #26410#25552#20132
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 79
        Top = 16
        Width = 65
        Height = 17
        Caption = #24453#21463#29702
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 151
        Top = 16
        Width = 65
        Height = 17
        Caption = #24050#21463#29702
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 222
        Top = 16
        Width = 65
        Height = 17
        Caption = #24050#23436#24037
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox5: TCheckBox
        Left = 294
        Top = 16
        Width = 65
        Height = 17
        Caption = #24050#39564#25910
        TabOrder = 4
        OnClick = CheckBox1Click
      end
      object CheckBox6: TCheckBox
        Left = 365
        Top = 16
        Width = 65
        Height = 17
        Caption = #34987#36864#22238
        TabOrder = 5
        OnClick = CheckBox1Click
      end
      object CheckBox7: TCheckBox
        Left = 437
        Top = 16
        Width = 65
        Height = 17
        Caption = #24050#26242#20572
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = CheckBox1Click
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 447
    Width = 1043
    Height = 168
    Align = alBottom
    TabOrder = 2
    object DBGridEh2: TDBGridEh
      Left = 1
      Top = 1
      Width = 936
      Height = 166
      Align = alClient
      DataSource = DM.DataSource2
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      PopupMenu = PopupMenu3
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnKeyDown = DBGridEh2KeyDown
      Columns = <
        item
          EditButtons = <>
          FieldName = 'WorkDate'
          Footers = <>
          Title.Caption = #26085#26399
          Width = 82
        end
        item
          EditButtons = <>
          FieldName = 'MainexecStat'
          Footers = <>
          Title.Caption = #29366#24577
          Width = 48
        end
        item
          EditButtons = <>
          FieldName = 'EMPL_CODE'
          Footers = <>
          Title.Caption = #38599#21592#20195#30721
          Width = 65
        end
        item
          EditButtons = <>
          FieldName = 'EMPLOYEE_NAME'
          Footers = <>
          Title.Caption = #22995#21517
          Width = 76
        end
        item
          EditButtons = <>
          FieldName = 'BeginTime'
          Footers = <>
          Title.Caption = #24320#22987#26102#38388
          Width = 146
        end
        item
          EditButtons = <>
          FieldName = 'EndTime'
          Footers = <>
          Title.Caption = #32467#26463#26102#38388
          Width = 138
        end
        item
          EditButtons = <>
          FieldName = 'TimeCons'
          Footers = <>
          Title.Caption = #26242#20572#26102#38388
        end
        item
          EditButtons = <>
          FieldName = 'TimeRest'
          Footers = <>
          Title.Caption = #20013#36884#20241#24687#26102#38388
          Width = 77
        end
        item
          EditButtons = <>
          FieldName = 'WorkTime'
          Footers = <>
          Title.Caption = #38599#21592#24037#20316#26102#38388
          Width = 78
        end
        item
          EditButtons = <>
          FieldName = 'DayShift'
          Footers = <>
          Title.Caption = #29677#27425
          Width = 42
        end
        item
          EditButtons = <>
          FieldName = 'Remark'
          Footers = <>
          Title.Caption = #22791#27880
          Width = 200
        end>
    end
    object Panel4: TPanel
      Left = 937
      Top = 1
      Width = 105
      Height = 166
      Align = alRight
      TabOrder = 1
      object BtnAdd: TButton
        Left = 7
        Top = 8
        Width = 93
        Height = 25
        Caption = #26032'   '#22686
        Enabled = False
        TabOrder = 0
        OnClick = BtnAddClick
      end
      object BtnEdit: TButton
        Left = 7
        Top = 50
        Width = 93
        Height = 25
        Caption = #32534'   '#36753
        Enabled = False
        TabOrder = 1
        OnClick = BtnEditClick
      end
      object Btndelete: TButton
        Left = 7
        Top = 96
        Width = 93
        Height = 22
        Caption = #21024'   '#38500
        Enabled = False
        TabOrder = 2
        OnClick = BtndeleteClick
      end
      object BtnPersonEnd: TButton
        Left = 7
        Top = 136
        Width = 93
        Height = 25
        Caption = #20010#20154#32467#26463
        Enabled = False
        TabOrder = 3
        OnClick = BtnPersonEndClick
      end
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 1043
    Height = 391
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 3
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #25925#38556#30003#35831#28165#21333
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 1035
        Height = 363
        Align = alClient
        DataSource = DM.DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        FrozenCols = 5
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        PopupMenu = PopupMenu2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnColumnMoved = DBGridEh1ColumnMoved
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        OnKeyDown = DBGridEh1KeyDown
        OnTitleClick = DBGridEh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NUMBER'
            Footers = <>
            Title.Caption = #30003#35831#21333#21495
            Title.Color = clRed
            Title.SortIndex = 1
            Title.SortMarker = smUpEh
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'abbr_name'
            Footers = <>
            Title.Caption = #24037#21378
          end
          item
            EditButtons = <>
            FieldName = 'DEPT_NAME'
            Footers = <>
            Title.Caption = #37096#38376#21517#31216
            Width = 102
          end
          item
            EditButtons = <>
            FieldName = 'FASSET_CODE'
            Footers = <>
            Title.Caption = #35774#22791#32534#30721
            Width = 69
          end
          item
            EditButtons = <>
            FieldName = 'FASSET_NAME'
            Footers = <>
            Title.Caption = #35774#22791#21517#31216
            Width = 129
          end
          item
            EditButtons = <>
            FieldName = 'FASSET_DESC'
            Footers = <>
            Title.Caption = #35774#22791#35268#26684#25551#36848
            Visible = False
            Width = 191
          end
          item
            EditButtons = <>
            FieldName = 'V_stat'
            Footers = <>
            Title.Caption = #29366#24577
            Width = 51
          end
          item
            EditButtons = <>
            FieldName = 'DEPT_CODE'
            Footers = <>
            Title.Caption = #37096#38376#20195#30721
            Visible = False
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'fail_type'
            Footers = <>
            Title.Caption = #24322#24120#31867#21035
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'equipment_grade'
            Footers = <>
            Title.Caption = #35774#22791#32423#21035
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'failure_grade'
            Footers = <>
            Title.Caption = #25925#38556#32423#21035
            Width = 61
          end
          item
            EditButtons = <>
            FieldName = 'failure_degree'
            Footers = <>
            Title.Caption = #24433#21709#31243#24230
          end
          item
            EditButtons = <>
            FieldName = 'EMPL_CODE'
            Footers = <>
            Title.Caption = #30003#25253#20154#20195#30721
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'EMPLOYEE_NAME'
            Footers = <>
            Title.Caption = #30003#25253#20154#22995#21517
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'CONTACT_PHONE'
            Footers = <>
            Title.Caption = #32852#32476#30005#35805
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'failure_dat'
            Footers = <>
            Title.Caption = #25925#38556#26085#26399
            Visible = False
            Width = 145
          end
          item
            EditButtons = <>
            FieldName = 'failure_circs'
            Footers = <>
            Title.Caption = #25925#38556#35828#26126
            Width = 227
          end
          item
            EditButtons = <>
            FieldName = 'maintain_text'
            Footers = <>
            Title.Caption = #32500#20462#35760#24405
            Width = 187
          end
          item
            EditButtons = <>
            FieldName = 'Location'
            Footers = <>
            Title.Caption = #35774#22791#36131#20219#23567#32452
            Width = 88
          end
          item
            EditButtons = <>
            FieldName = 'ent_date'
            Footers = <>
            Title.Caption = #36755#20837#26085#26399
            Visible = False
            Width = 141
          end
          item
            EditButtons = <>
            FieldName = 'referring_date'
            Footers = <>
            Title.Caption = #25552#20132#26085#26399
            Width = 140
          end
          item
            EditButtons = <>
            FieldName = 'CONTACT_NAME'
            Footers = <>
            Title.Caption = #32852#32476#20154
            Visible = False
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'disposal_date'
            Footers = <>
            Title.Caption = #21463#29702#26085#26399
            Width = 138
          end
          item
            EditButtons = <>
            FieldName = 'complete_date'
            Footers = <>
            Title.Caption = #23436#24037#26085#26399
            Width = 137
          end
          item
            EditButtons = <>
            FieldName = 'maintain_house'
            Footers = <>
            Title.Caption = #23454#38469#32500#20462#26102#38388
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'GZSJ'
            Footers = <>
            Title.Caption = #25925#38556#28040#32791#26102#38388
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'stdDate'
            Footers = <>
            Title.Caption = #26631#20934#32500#20462#26102#38388
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'FaultName'
            Footers = <>
            Title.Caption = #25925#38556#21517#31216
            Width = 71
          end
          item
            EditButtons = <>
            FieldName = 'disposal_emplname'
            Footers = <>
            Title.Caption = #21463#29702#20154#22995#21517
            Visible = False
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'completion_emplname'
            Footers = <>
            Title.Caption = #23436#24037#20154#22995#21517
            Visible = False
            Width = 83
          end
          item
            EditButtons = <>
            FieldName = 'stop_house'
            Footers = <>
            Title.Caption = #26242#20572#23567#26102
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'Staff_Sum_house'
            Footers = <>
            Title.Caption = #24037#20154#21512#35745#32500#20462#26102#38388
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = 'maintain_empl'
            Footers = <>
            Title.Caption = #32500#20462#20154#21592
            Width = 131
          end
          item
            EditButtons = <>
            FieldName = 'validate_date'
            Footers = <>
            Title.Caption = #39564#25910#26085#26399
            Width = 146
          end
          item
            EditButtons = <>
            FieldName = 'validate_appraise'
            Footers = <>
            Title.Caption = #39564#25910#35780#20215
            Width = 62
          end
          item
            EditButtons = <>
            FieldName = 'validate_Description'
            Footers = <>
            Title.Caption = #39564#25910#24847#35265
            Width = 155
          end
          item
            EditButtons = <>
            FieldName = 'stoppage_time'
            Footers = <>
            Title.Caption = #26242#20572#24320#22987#26102#38388
            Visible = False
            Width = 163
          end
          item
            EditButtons = <>
            FieldName = 'suspended_reason'
            Footers = <>
            Title.Caption = #26242#20572#21407#22240
            Visible = False
            Width = 186
          end
          item
            EditButtons = <>
            FieldName = 'recovery_time'
            Footers = <>
            Title.Caption = #26242#20572#32467#26463#26102#38388
            Visible = False
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'PLACE'
            Footers = <>
            Title.Caption = #35774#22791#22320#28857
            Visible = False
            Width = 106
          end
          item
            EditButtons = <>
            FieldName = 'tslr'
            Footers = <>
            Title.Caption = #25237#35785#20869#23481
            Width = 244
          end
          item
            EditButtons = <>
            FieldName = 'EquiType'
            Footers = <>
            Title.Caption = #26159#21542#35774#22791#32452
            Width = 72
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26126#32454
      ImageIndex = 1
      object Label2: TLabel
        Left = 8
        Top = 5
        Width = 52
        Height = 13
        Caption = #30003#35831#21333#21495
      end
      object Label3: TLabel
        Left = 8
        Top = 47
        Width = 52
        Height = 13
        Caption = #37096#38376#21517#31216
      end
      object Label5: TLabel
        Left = 8
        Top = 89
        Width = 52
        Height = 13
        Caption = #35774#22791#20195#30721
      end
      object Label6: TLabel
        Left = 8
        Top = 130
        Width = 52
        Height = 13
        Caption = #35774#22791#21517#31216
      end
      object Label7: TLabel
        Left = 8
        Top = 172
        Width = 52
        Height = 13
        Caption = #35774#22791#32423#21035
      end
      object Label8: TLabel
        Left = 8
        Top = 214
        Width = 52
        Height = 13
        Caption = #35774#22791#22320#28857
      end
      object Label9: TLabel
        Left = 298
        Top = 130
        Width = 26
        Height = 13
        Caption = #29366#24577
      end
      object Label11: TLabel
        Left = 143
        Top = 5
        Width = 65
        Height = 13
        Caption = #30003#25253#20154#22995#21517
      end
      object Label12: TLabel
        Left = 143
        Top = 47
        Width = 52
        Height = 13
        Caption = #25552#20132#26085#26399
      end
      object Label28: TLabel
        Left = 143
        Top = 89
        Width = 52
        Height = 13
        Caption = #25925#38556#26085#26399
      end
      object Label26: TLabel
        Left = 143
        Top = 130
        Width = 52
        Height = 13
        Caption = #25925#38556#32423#21035
      end
      object Label29: TLabel
        Left = 143
        Top = 173
        Width = 52
        Height = 13
        Caption = #25925#38556#35828#26126
      end
      object Label27: TLabel
        Left = 298
        Top = 47
        Width = 52
        Height = 13
        Caption = #24433#21709#31243#24230
      end
      object Label10: TLabel
        Left = 298
        Top = 5
        Width = 26
        Height = 13
        Caption = #24037#21378
      end
      object Label39: TLabel
        Left = 298
        Top = 89
        Width = 52
        Height = 13
        Caption = #25925#38556#21517#31216
      end
      object Label42: TLabel
        Left = 434
        Top = 5
        Width = 65
        Height = 13
        Caption = #21463#29702#20154#22995#21517
      end
      object Label44: TLabel
        Left = 434
        Top = 130
        Width = 52
        Height = 13
        Caption = #21463#29702#26085#26399
      end
      object Label32: TLabel
        Left = 434
        Top = 89
        Width = 52
        Height = 13
        Caption = #24322#24120#31867#21035
      end
      object Label30: TLabel
        Left = 434
        Top = 47
        Width = 78
        Height = 13
        Caption = #21442#20110#32500#20462#20154#21592
      end
      object Label13: TLabel
        Left = 577
        Top = 49
        Width = 78
        Height = 13
        Caption = #35774#22791#36131#20219#23567#32452
      end
      object Label31: TLabel
        Left = 434
        Top = 173
        Width = 52
        Height = 13
        Caption = #32500#20462#35760#24405
      end
      object Label40: TLabel
        Left = 577
        Top = 6
        Width = 78
        Height = 13
        Caption = #26631#20934#32500#20462#26102#38388
      end
      object Label43: TLabel
        Left = 715
        Top = 5
        Width = 65
        Height = 13
        Caption = #23436#24037#20154#22995#21517
      end
      object Label45: TLabel
        Left = 715
        Top = 47
        Width = 52
        Height = 13
        Caption = #23436#24037#26085#26399
      end
      object Label41: TLabel
        Left = 715
        Top = 89
        Width = 39
        Height = 13
        Caption = #36798#25104#29575
      end
      object Label33: TLabel
        Left = 715
        Top = 130
        Width = 52
        Height = 13
        Caption = #26242#20572#23567#26102
      end
      object Label34: TLabel
        Left = 715
        Top = 173
        Width = 78
        Height = 13
        Caption = #23454#38469#32500#20462#26102#38388
      end
      object Label38: TLabel
        Left = 715
        Top = 214
        Width = 104
        Height = 13
        Caption = #24037#20154#21512#35745#32500#20462#26102#38388
      end
      object Label15: TLabel
        Left = 864
        Top = 5
        Width = 39
        Height = 13
        Caption = #39564#25910#20154
      end
      object Label35: TLabel
        Left = 864
        Top = 47
        Width = 52
        Height = 13
        Caption = #39564#25910#26085#26399
      end
      object Label36: TLabel
        Left = 864
        Top = 89
        Width = 52
        Height = 13
        Caption = #39564#25910#35780#20215
      end
      object Label37: TLabel
        Left = 864
        Top = 173
        Width = 52
        Height = 13
        Caption = #39564#25910#24847#35265
      end
      object edt_number: TEdit
        Left = 8
        Top = 20
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object Edt_DEPT_NAME: TEdit
        Left = 8
        Top = 62
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object edt_FASSET_CODE: TEdit
        Left = 8
        Top = 104
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object Edt_FASSET_PTR: TEdit
        Left = 8
        Top = 145
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object edt_EquiType: TEdit
        Left = 8
        Top = 187
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object edt_V_stat: TEdit
        Left = 298
        Top = 145
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object Edt_EMPLOYEE_NAME: TEdit
        Left = 143
        Top = 20
        Width = 145
        Height = 21
        Enabled = False
        TabOrder = 6
      end
      object Edt_ent_date: TEdit
        Left = 143
        Top = 62
        Width = 145
        Height = 21
        Enabled = False
        TabOrder = 7
      end
      object Edt_failure_date: TEdit
        Left = 143
        Top = 104
        Width = 145
        Height = 21
        Enabled = False
        TabOrder = 8
      end
      object Edt_failure_grade: TEdit
        Left = 143
        Top = 145
        Width = 145
        Height = 21
        Enabled = False
        TabOrder = 9
      end
      object Edt_failure_degree: TEdit
        Left = 298
        Top = 62
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 10
      end
      object edt_PLACE: TEdit
        Left = 8
        Top = 228
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 11
      end
      object Memo_failure_circs: TMemo
        Left = 143
        Top = 187
        Width = 274
        Height = 62
        Enabled = False
        TabOrder = 12
      end
      object edt_abbr_name: TEdit
        Left = 298
        Top = 20
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 13
      end
      object Edt_FaultName: TEdit
        Left = 298
        Top = 104
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 14
      end
      object Edt_disposal_emplname: TEdit
        Left = 434
        Top = 20
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 15
      end
      object Edt_disposal_date: TEdit
        Left = 434
        Top = 145
        Width = 265
        Height = 21
        Enabled = False
        TabOrder = 16
      end
      object Edt_maintain_empl: TEdit
        Left = 434
        Top = 62
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 17
        OnExit = Edt_maintain_emplExit
      end
      object Memo_maintain_text: TMemo
        Left = 434
        Top = 187
        Width = 265
        Height = 61
        Enabled = False
        Lines.Strings = (
          '')
        TabOrder = 18
        OnExit = Memo_maintain_textExit
      end
      object Cbb_fail_type: TComboBox
        Left = 434
        Top = 104
        Width = 269
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 19
        OnExit = Cbb_fail_typeExit
      end
      object Edt_stdDate: TEdit
        Left = 577
        Top = 21
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 20
      end
      object Edt_Location: TEdit
        Left = 577
        Top = 64
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 21
      end
      object Edt_completion_emplname: TEdit
        Left = 715
        Top = 20
        Width = 138
        Height = 21
        Enabled = False
        TabOrder = 22
      end
      object Edt_complete_date: TEdit
        Left = 715
        Top = 62
        Width = 138
        Height = 21
        Enabled = False
        TabOrder = 23
      end
      object Edt_AchiRate: TEdit
        Left = 715
        Top = 104
        Width = 138
        Height = 21
        Enabled = False
        TabOrder = 24
      end
      object Edt_stop_house: TEdit
        Left = 715
        Top = 145
        Width = 138
        Height = 21
        Enabled = False
        TabOrder = 25
      end
      object Edt_maintain_house: TEdit
        Left = 715
        Top = 187
        Width = 138
        Height = 21
        Enabled = False
        TabOrder = 26
      end
      object Edt_Staff_Sum_house: TEdit
        Left = 716
        Top = 229
        Width = 138
        Height = 21
        Enabled = False
        TabOrder = 27
      end
      object Edt_validate_emplname: TEdit
        Left = 864
        Top = 20
        Width = 168
        Height = 21
        Enabled = False
        TabOrder = 28
      end
      object Edt_validate_date: TEdit
        Left = 864
        Top = 62
        Width = 168
        Height = 21
        Enabled = False
        TabOrder = 29
      end
      object Memo_validate_appraise: TMemo
        Left = 864
        Top = 104
        Width = 168
        Height = 60
        Enabled = False
        Lines.Strings = (
          '')
        TabOrder = 30
      end
      object Memo_validate_Description: TMemo
        Left = 864
        Top = 187
        Width = 168
        Height = 62
        Enabled = False
        TabOrder = 31
      end
      object Panel5: TPanel
        Left = 0
        Top = 256
        Width = 1035
        Height = 107
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 32
        object CheckBox8: TCheckBox
          Left = 0
          Top = 8
          Width = 153
          Height = 17
          Caption = #33258#21160#26174#31034#26448#26009#39046#29992#26126#32454
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBox8Click
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 27
          Width = 1035
          Height = 80
          Align = alBottom
          DataSource = DM.DataSource3
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'number'
              Title.Caption = #39046#26009#21333#32534#21495
              Width = 116
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INV_PART_NUMBER'
              Title.Caption = #26448#26009#32534#21495
              Width = 225
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INV_PART_DESCRIPTION'
              Title.Caption = #26448#26009#21517#31216'/'#35268#26684
              Width = 364
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'unit_name'
              Title.Caption = #21333#20301
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUAN_BOM'
              Title.Caption = #30003#39046#25968#37327
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QUAN_ISSUED'
              Title.Caption = #24050#21457#25968#37327
              Width = 64
              Visible = True
            end>
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 655
    Width = 1043
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object PopupMenu2: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenu2Popup
    Left = 976
    Top = 312
    object N5: TMenuItem
      Caption = #24320#22987#21463#29702
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #20197#20854#23427#29992#25143#21463#29702
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #21462#28040#21463#29702
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = #20197#20854#23427#29992#25143#21462#28040#21463#29702
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #26242#20572#32467#26463
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #20197#20854#23427#29992#25143#26242#20572#32467#26463
      OnClick = N10Click
    end
    object N19: TMenuItem
      Caption = #23548#20986#20840#37096#30003#35831#21333#39033#30446
      Visible = False
      OnClick = N19Click
    end
    object N20: TMenuItem
      Caption = #23548#20986#26412#26465#30003#35831#21333#39033#30446
      OnClick = N20Click
    end
    object N11: TMenuItem
      Caption = #26242#20572#35760#24405
      OnClick = N11Click
    end
    object N12: TMenuItem
      Caption = #23436#24037#22788#29702
      OnClick = N12Click
    end
    object N13: TMenuItem
      Caption = #20197#20854#23427#29992#25143#23436#24037
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #21462#28040#23436#24037
      OnClick = N14Click
    end
    object N15: TMenuItem
      Caption = #20197#20854#23427#29992#25143#21462#28040#23436#24037
      OnClick = N15Click
    end
    object N16: TMenuItem
      Caption = #36864#22238#30003#35831
      OnClick = N16Click
    end
    object N17: TMenuItem
      Caption = #29366#24577#35760#24405
      OnClick = N17Click
    end
    object N18: TMenuItem
      Caption = #25237#35785#35760#24405
      OnClick = N18Click
    end
  end
  object PopupMenu3: TPopupMenu
    OnPopup = PopupMenu3Popup
    Left = 664
    Top = 512
    object N1: TMenuItem
      Caption = #26032#24314
      OnClick = BtnAddClick
    end
    object N2: TMenuItem
      Caption = #32534#36753
      OnClick = BtnEditClick
    end
    object N3: TMenuItem
      Caption = #21024#38500
      OnClick = BtndeleteClick
    end
    object N4: TMenuItem
      Caption = #20010#20154#32467#26463
      OnClick = BtnPersonEndClick
    end
  end
end
