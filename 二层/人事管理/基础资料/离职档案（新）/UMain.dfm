object FrmMain: TFrmMain
  Left = 195
  Top = 188
  Width = 1233
  Height = 563
  Caption = #31163#32844#31649#29702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object txt1: TStaticText
    Left = 609
    Top = 47
    Width = 4
    Height = 4
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnl3: TPanel
    Left = 0
    Top = 0
    Width = 1217
    Height = 525
    Align = alClient
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1215
      Height = 44
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        1215
        44)
      object lbl_field: TLabel
        Left = 484
        Top = 19
        Width = 59
        Height = 17
        AutoSize = False
        BiDiMode = bdRightToLeft
        Caption = #21592#24037#22995#21517
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object lbl_Count: TLabel
        Left = 662
        Top = 21
        Width = 6
        Height = 12
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 900
        Top = 17
        Width = 13
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #21040
      end
      object lbl1: TLabel
        Left = 724
        Top = 17
        Width = 72
        Height = 13
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #31163#32844#26085#26399#20174
      end
      object img1: TImage
        Left = 1183
        Top = 2
        Width = 30
        Height = 40
        Align = alRight
        Picture.Data = {
          055449636F6E0000010001002020040000000000E80200001600000028000000
          2000000040000000010004000000000000020000000000000000000000000000
          0000000000000000000080000080000000808000800000008000800080800000
          80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
          FFFFFF00000000000000000000000000000000000000000000000040B3000000
          0000000000000000000044444B3000700000000000000000004444444B300777
          70000000000000004444444444B3077777700000000000444444444444B30777
          7777700000004444444444424440007777700000000844444444444244481077
          70000000000704444444442A2444810000000000000074444444746A24448100
          00000000000084444447746AA6444810000000000000704444774AAAAA644810
          000000000000074447774AAAAA6474400000000000000844477426A46CC77444
          0000000000000707774667477777777440000000000000777466777777777774
          400000000000008774A7777777777774440000000000007046AAAA7777777774
          44000000000000074AAAAA7777777774444000000000000844AAAAA777777754
          4440000000000007042A677777777754444700000000000074C2277777777754
          4770000000000000877777777777775770000000000000007077777777777770
          0000000000000000077777777777700000000000000000000877777777700000
          0000000000000000070777777000000000000000000000000077777000000000
          0000000000000000008770000000000000000000000000000070000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFFC1FFFFFF007FFFFC001FFFF00007FFC00001FF0000007E000001F
          C000007FC00001FFE00001FFE00000FFE00000FFF000007FF000007FF000003F
          F800003FF800001FF800001FFC00000FFC00000FFC000007FE000007FE00001F
          FE00007FFF0001FFFF0007FFFF001FFFFF807FFFFF81FFFFFF87FFFFFFDFFFFF
          FFFFFFFF}
      end
      object BitBtn1: TBitBtn
        Left = 8
        Top = 9
        Width = 70
        Height = 30
        Caption = #36864#20986
        TabOrder = 0
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
      object btn_refresh: TBitBtn
        Left = 78
        Top = 9
        Width = 70
        Height = 30
        Caption = #21047#26032
        TabOrder = 1
        OnClick = btn_refreshClick
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
      object btn_excel: TBitBtn
        Left = 218
        Top = 9
        Width = 70
        Height = 30
        Caption = #23548#20986
        TabOrder = 3
        OnClick = btn_excelClick
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
      object btn_qry: TBitBtn
        Left = 288
        Top = 9
        Width = 70
        Height = 30
        Caption = #26597#35810
        TabOrder = 4
        OnClick = btn_qryClick
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
      object btn_Selfield: TBitBtn
        Left = 148
        Top = 9
        Width = 70
        Height = 30
        Caption = #23383#27573
        TabOrder = 2
        OnClick = btn_SelfieldClick
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
      object edt_Value: TEdit
        Left = 543
        Top = 15
        Width = 104
        Height = 21
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 5
        OnChange = edt_ValueChange
      end
      object dtp_f: TDateTimePicker
        Left = 794
        Top = 13
        Width = 100
        Height = 21
        Anchors = [akTop, akRight]
        Date = 41434.000000000000000000
        Time = 41434.000000000000000000
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 6
        OnChange = dtp_fChange
      end
      object dtp_t: TDateTimePicker
        Left = 922
        Top = 13
        Width = 100
        Height = 21
        Anchors = [akTop, akRight]
        Date = 41434.000000000000000000
        Time = 41434.000000000000000000
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
        TabOrder = 7
        OnChange = dtp_tChange
      end
      object btn_SendMsg: TBitBtn
        Left = 360
        Top = 9
        Width = 87
        Height = 30
        Caption = #30701#20449#36890#30693
        TabOrder = 8
        Visible = False
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
    end
    object pgc1: TPageControl
      Left = 1
      Top = 45
      Width = 1215
      Height = 479
      ActivePage = TabSheet2
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      OnChange = pgc1Change
      object TabSheet2: TTabSheet
        Caption = ' '#39044'  '#31163'  '#32844'  '
        ImageIndex = 2
        object dgh_pre: TDBGridEh
          Left = 0
          Top = 0
          Width = 1207
          Height = 403
          Align = alClient
          DataSource = DataSource1
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = pm_pre
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = dgh_preDrawColumnCell
          OnKeyDown = dgh_preKeyDown
          OnTitleClick = dgh_preTitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'employeecode'
              Footers = <>
              Title.Caption = #21592#24037#24037#21495
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'chinesename'
              Footers = <>
              Title.Caption = #21592#24037#22995#21517
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'sexy'
              Footers = <>
              Title.Caption = #24615#21035
              Width = 35
            end
            item
              EditButtons = <>
              FieldName = 'pposition'
              Footers = <>
              Title.Caption = #32844#21153
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Title.Caption = #25152#23646#37096#38376
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'ttype'
              Footers = <>
              Title.Caption = #31163#32844#31867#22411
              Width = 74
            end
            item
              EditButtons = <>
              FieldName = 'rreason'
              Footers = <>
              Title.Caption = #31163#32844#21407#22240
              Width = 82
            end
            item
              EditButtons = <>
              FieldName = 'ondutytime'
              Footers = <>
              Title.Caption = #20837#32844#26085#26399
              Width = 82
            end
            item
              EditButtons = <>
              FieldName = 'outdutytime'
              Footers = <>
              Title.Caption = #31163#32844#26085#26399
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'oper_date'
              Footers = <>
              Title.Caption = #25805#20316#26085#26399
              Width = 110
            end
            item
              EditButtons = <>
              FieldName = 'active'
              Footers = <>
              Title.Caption = #26377#25928#24615
              Width = 40
            end
            item
              EditButtons = <>
              FieldName = 'hascard'
              Footers = <>
              Title.Caption = #32771#21220#21345
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'hastrain'
              Footers = <>
              Title.Caption = #22521#35757#26631#35760
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'rkey'
              Footers = <>
              Visible = False
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'employeeid'
              Footers = <>
              Visible = False
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'EMPLOYEE_NAME'
              Footers = <>
              Title.Caption = #25805#20316#20154#21592
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              Title.Caption = #22791#27880
              Width = 200
            end>
        end
        object pnl0: TPanel
          Left = 0
          Top = 403
          Width = 1207
          Height = 45
          Align = alBottom
          Caption = 'pnl0'
          TabOrder = 1
          object rg_status1: TRadioGroup
            Left = 1
            Top = 3
            Width = 1205
            Height = 41
            Align = alBottom
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              #26410#29983#25928
              #24050#29983#25928
              #20840#37096)
            TabOrder = 0
            OnClick = rg_status1Click
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = ' '#31163'  '#32844'  '#26723'  '#26696' '
        object dgh_quit: TDBGridEh
          Left = 0
          Top = 0
          Width = 1207
          Height = 388
          Align = alClient
          DataSource = DataSource2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          UseMultiTitle = True
          OnKeyDown = dgh_quitKeyDown
          OnTitleClick = dgh_quitTitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Title.Caption = #37096#38376
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'orginal_employeecode'
              Footers = <>
              Title.Caption = #24037#21495
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'chinesename'
              Footers = <>
              Title.Caption = #22995#21517
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'sextext'
              Footers = <>
              Title.Caption = #24615#21035
              Width = 40
            end
            item
              EditButtons = <>
              FieldName = 'ondutytime'
              Footers = <>
              Title.Caption = #21040#32844#26085#26399
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'outdutytime'
              Footers = <>
              Title.Caption = #31163#32844#26085#26399
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'leavetype'
              Footers = <>
              Title.Caption = #31163#32844#31867#22411
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'leavereason'
              Footers = <>
              Title.Caption = #31163#32844#21407#22240
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'Positionitem'
              Footers = <>
              Title.Caption = #32844#21153
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'IsKeyPostiton'
              Footers = <>
              Title.Caption = #26159#21542#20851#38190#23703#20301
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'Rankitem'
              Footers = <>
              Title.Caption = #32844#32423
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'multi_ability'
              Footers = <>
              Title.Caption = #23703#20301#25216#33021
            end
            item
              EditButtons = <>
              FieldName = 'nation'
              Footers = <>
              Title.Caption = #27665#26063
              Width = 35
            end
            item
              EditButtons = <>
              FieldName = 'province'
              Footers = <>
              Title.Caption = #31821#36143
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'birthday'
              Footers = <>
              Title.Caption = #20986#29983#24180#26376
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'IDCard'
              Footers = <>
              Title.Caption = #36523#20221#35777#21495#30721
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'addr'
              Footers = <>
              Title.Caption = #36523#20221#35777#22320#22336
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              Title.Caption = #22791#27880
              Width = 200
            end
            item
              EditButtons = <>
              FieldName = 'phone'
              Footers = <>
              Title.Caption = #32852#31995#30005#35805
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'source'
              Footers = <>
              Title.Caption = #24405#29992#26469#28304
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'station'
              Footers = <>
              Title.Caption = #23703#20301
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'Cardno'
              Footers = <>
              Title.Caption = #32771#21220#21345#21495#30721
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'roomcode'
              Footers = <>
              Title.Caption = #23487#33293#32534#21495
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'blood_type'
              Footers = <>
              Title.Caption = #34880#22411
              Width = 35
            end
            item
              EditButtons = <>
              FieldName = 'Height'
              Footers = <>
              Title.Caption = #36523#39640
              Width = 35
            end
            item
              EditButtons = <>
              FieldName = 'graduatedschool'
              Footers = <>
              Title.Caption = #27605#19994#38498#26657
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'majorsubject'
              Footers = <>
              Title.Caption = #19987#19994
              Width = 60
            end
            item
              DisplayFormat = 'yyyy-MM-dd'
              EditButtons = <>
              FieldName = 'iDCardtime'
              Footers = <>
              Title.Caption = #36523#20221#35777#26377#25928#26399
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'Languages'
              Footers = <>
              Title.Caption = #35821#31181
              Width = 45
            end
            item
              EditButtons = <>
              FieldName = 'sicardno'
              Footers = <>
              Title.Caption = #31038#20445#30005#33041#21495
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'Residencepermit'
              Footers = <>
              Title.Caption = #23621#20303#35777
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'bankaccount'
              Footers = <>
              Title.Caption = #38134#34892#24080#21495
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'bankname'
              Footers = <>
              Title.Caption = #38134#34892#21517#31216
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'contactpersonname'
              Footers = <>
              Title.Caption = #32039#24613#32852#32476#20154#22995#21517
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'contactpersontel'
              Footers = <>
              Title.Caption = #32039#24613#32852#32476#20154#30005#35805
              Width = 90
            end
            item
              EditButtons = <>
              FieldName = 'contactpersonaddr'
              Footers = <>
              Title.Caption = #32039#24613#32852#32476#20154#20303#22336
              Width = 240
            end
            item
              EditButtons = <>
              FieldName = 'recommendpersonname'
              Footers = <>
              Title.Caption = #25512#33616#20154#22995#21517
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'recommendpersontel'
              Footers = <>
              Title.Caption = #25512#33616#20154#30005#35805
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'recommendaddr'
              Footers = <>
              Title.Caption = #25512#33616#20154#20303#22336
              Width = 240
            end
            item
              EditButtons = <>
              FieldName = 'recommendworkplace'
              Footers = <>
              Title.Caption = #25512#33616#20154#24037#20316#21333#20301
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'GraduateTime'
              Footers = <>
              Title.Caption = #27605#19994#26102#38388
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'educationitem'
              Footers = <>
              Title.Caption = #25991#21270#31243#24230
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'Politics_faceitem'
              Footers = <>
              Title.Caption = #25919#27835#38754#35980
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'employ_typeitem'
              Footers = <>
              Title.Caption = #21512#21516#31867#22411
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'marriageitem'
              Footers = <>
              Title.Caption = #23130#23035#29366#20917
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'accountname'
              Footers = <>
              Title.Caption = #24080#22871#31867#22411
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'attendancename'
              Footers = <>
              Title.Caption = #26159#21542#32771#21220
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'neverhire'
              Footers = <>
              Title.Caption = #27704#19981#24405#29992
              Width = 55
            end
            item
              EditButtons = <>
              FieldName = 'errmark'
              Footers = <>
              Title.Caption = #21592#24037#20449#24687#22791#27880
              Width = 133
            end>
        end
        object pnl1: TPanel
          Left = 0
          Top = 388
          Width = 1207
          Height = 60
          Align = alBottom
          Caption = 'pnl1'
          TabOrder = 1
          object rg_model: TRadioGroup
            Left = 1
            Top = 1
            Width = 1205
            Height = 60
            Align = alTop
            Columns = 5
            TabOrder = 0
            OnClick = rg_modelClick
          end
        end
      end
      object TabSheet4: TTabSheet
        Caption = #21592' '#24037' '#22797' '#24037
        ImageIndex = 3
        object dgh_rein: TDBGridEh
          Left = 0
          Top = 0
          Width = 1207
          Height = 403
          Align = alClient
          DataSource = DataSource3
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -13
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          PopupMenu = pm_rein
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = dgh_reinDrawColumnCell
          OnKeyDown = dgh_reinKeyDown
          OnTitleClick = dgh_reinTitleClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'chinesename'
              Footers = <>
              Title.Caption = #22995#21517
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'odepartmentname'
              Footers = <>
              Title.Caption = #21407#37096#38376#21517#31216
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'ndepartmentname'
              Footers = <>
              Title.Caption = #26032#37096#38376#21517#31216
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'orginal_employeecode'
              Footers = <>
              Title.Caption = #21407#24037#21495
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'new_employeecode'
              Footers = <>
              Title.Caption = #26032#24037#21495
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'oposition'
              Footers = <>
              Title.Caption = #21407#32844#21153
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'orank'
              Footers = <>
              Title.Caption = #21407#32844#32423
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'ohtype'
              Footers = <>
              Title.Caption = #26087#21512#21516#31867#22411
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'orginal_ondutytime'
              Footers = <>
              Title.Caption = #21407#20837#32844#26085#26399
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'orginal_outdutytime'
              Footers = <>
              Title.Caption = #21407#31163#32844#26085#26399
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'rreason'
              Footers = <>
              Title.Caption = #21407#31163#32844#21407#22240
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'rkey'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'orginal_departmentid'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'employeeid'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'type'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'reason'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'orginal_position'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'orginal_employ_type'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'orginal_politics_face'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'orginal_education'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'orginal_marriage'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'orginal_rank'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'alterdate'
              Footers = <>
              Title.Caption = #22797#32844#26085#26399
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'ttype'
              Footers = <>
              Title.Caption = #21464#21160#31867#22411
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'nposition'
              Footers = <>
              Title.Caption = #26032#32844#21153
              Width = 75
            end
            item
              EditButtons = <>
              FieldName = 'nrank'
              Footers = <>
              Title.Caption = #26032#32844#32423
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'nhtype'
              Footers = <>
              Title.Caption = #26032#21512#21516#31867#22411
              Width = 70
            end
            item
              EditButtons = <>
              FieldName = 'new_departmentid'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'new_position'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'new_employ_type'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'new_politics_face'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'new_education'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'new_marriage'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'new_rank'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'oper_date'
              Footers = <>
              Title.Caption = #25805#20316#26085#26399
              Width = 65
            end
            item
              EditButtons = <>
              FieldName = 'active'
              Footers = <>
              Title.Caption = #26159#21542#29983#25928
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'employeecode'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'employ_type'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'sex'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'pposition'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'dictid'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'phtype'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'departmentname'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'sexy'
              Footers = <>
              Title.Caption = #24615#21035
              Width = 35
            end
            item
              EditButtons = <>
              FieldName = 'EMPLOYEE_NAME'
              Footers = <>
              Title.Caption = #25805#20316#21592
              Width = 50
            end
            item
              EditButtons = <>
              FieldName = 'rank'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              Title.Caption = #22791#27880
            end>
        end
        object pnl2: TPanel
          Left = 0
          Top = 403
          Width = 1207
          Height = 45
          Align = alBottom
          TabOrder = 1
          object rg_status2: TRadioGroup
            Left = 1
            Top = 0
            Width = 1205
            Height = 44
            Align = alBottom
            Columns = 3
            ItemIndex = 2
            Items.Strings = (
              #26410#29983#25928
              #24050#29983#25928
              #20840#37096)
            TabOrder = 0
            OnClick = rg_status2Click
          end
        end
      end
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 997
    Top = 258
  end
  object pm_field: TPopupMenu
    Left = 692
    Top = 4
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
    end
  end
  object pm_pre: TPopupMenu
    OnPopup = pm_prePopup
    Left = 52
    Top = 140
    object N15: TMenuItem
      Caption = '-'
    end
    object N_Add: TMenuItem
      Caption = #26032#22686
      OnClick = N_AddClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N_Modi: TMenuItem
      Caption = #20462#25913#31163#32844#20449#24687
      OnClick = N_ModiClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N_Audit: TMenuItem
      Caption = #31163#32844#29983#25928
      OnClick = N_AuditClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object N_Del: TMenuItem
      Caption = #21024#38500#39044#31163#32844
      OnClick = N_DelClick
    end
    object N13: TMenuItem
      Caption = '-'
    end
  end
  object pm_rein: TPopupMenu
    OnPopup = pm_reinPopup
    Left = 264
    Top = 124
    object N9: TMenuItem
      Caption = '-'
    end
    object N16: TMenuItem
      Caption = #26032#22686
      OnClick = N16Click
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Caption = #22797#32844#29983#25928
      OnClick = N10Click
    end
    object N17: TMenuItem
      Caption = '-'
    end
    object N12: TMenuItem
      Caption = #21024#38500#22797#24037
      OnClick = N12Click
    end
  end
  object qry_pre: TADOQuery
    Connection = DM.con1
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'dtp1'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtp2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT    alt.rkey, alt.employeeid, alt.type, alt.reason, alt.al' +
        'terdate, alt.orginal_employeecode, alt.orginal_departmentid, '
      
        'alt.orginal_position,alt.orginal_employ_type, alt.orginal_politi' +
        'cs_face, alt.orginal_education, alt.orginal_outdutytime,'
      
        'alt.orginal_marriage, alt.orginal_rank, alt.new_employeecode, al' +
        't.new_departmentid, '
      
        'alt.new_position,alt.new_employ_type, alt.new_politics_face, alt' +
        '.new_education, '
      
        'alt.new_marriage, alt.new_rank, alt.oper_date, alt.oper_person,a' +
        'lt.active, '
      
        'Data0005.EMPLOYEE_NAME, msg.chinesename, alt.orginal_employeecod' +
        'e as employeecode, '
      'convert(char(10),alt.orginal_ondutytime,120) as ondutytime,'
      'convert(char(10),alt.alterdate,120) as outdutytime,'
      
        'msg.employ_type, msg.sex,mdet.item AS rank, rdet.item AS rreason' +
        ', tdet.item AS ttype, '
      
        'opdet.item AS pposition, tdet.dictid, npdet.item AS nposition, o' +
        'pdet.item AS oposition, '
      
        'nhdet.item AS nhtype, ohdet.item AS ohtype, hdet.item AS phtype,' +
        ' '
      
        'npdetr.item AS nrank, opdetr.item AS orank, odept.departmentname' +
        ', '
      
        'ndept.departmentname AS ndepartmentname, odept.departmentname AS' +
        ' odepartmentname, '
      
        '(CASE msg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' ELSE '#39#20854#23427#39' END) AS ' +
        'sexy, '
      'case when len(cardno)>0 then '#39#23578#25345#26377#39' else '#39#26080#39' end as hascard,'
      'case when len(roomcode)>0 then 1 else 0 end as hasroom,'
      'case when  EXISTS'
      '(select  *  from dbo.Employee_Train   where feels_payed=0 '
      'and train_feels>0  and effective_date>=getdate() '
      'and Employee_Train.employeeid =alt.employeeid )'
      ' then 1 else 0 end as hastrain,'
      'alt.remark'
      'FROM employee_alteration AS alt LEFT OUTER JOIN'
      'Data0005 ON Data0005.RKEY = alt.oper_person LEFT OUTER JOIN'
      'employeemsg AS msg ON msg.rkey = alt.employeeid LEFT OUTER JOIN'
      'datadetail AS mdet ON mdet.rkey = msg.Rank LEFT OUTER JOIN'
      'datadetail AS rdet ON rdet.rkey = alt.reason LEFT OUTER JOIN'
      'datadetail AS tdet ON tdet.rkey = alt.type LEFT OUTER JOIN'
      'datadetail AS pdet ON pdet.rkey = msg.Position LEFT OUTER JOIN'
      
        'datadetail AS npdet ON npdet.rkey = alt.new_position LEFT OUTER ' +
        'JOIN'
      
        'datadetail AS opdet ON opdet.rkey = alt.orginal_position LEFT OU' +
        'TER JOIN'
      
        'datadetail AS npdetr ON npdetr.rkey = alt.new_rank LEFT OUTER JO' +
        'IN'
      
        'datadetail AS opdetr ON opdetr.rkey = alt.orginal_rank LEFT OUTE' +
        'R JOIN'
      
        'datadetail AS hdet ON hdet.rkey = msg.employ_type LEFT OUTER JOI' +
        'N'
      
        'datadetail AS nhdet ON nhdet.rkey = alt.new_employ_type LEFT OUT' +
        'ER JOIN'
      
        'datadetail AS ohdet ON ohdet.rkey = alt.orginal_employ_type LEFT' +
        ' OUTER JOIN'
      
        'datadepartment AS dept ON dept.rkey = msg.departmentid LEFT OUTE' +
        'R JOIN'
      
        'datadepartment AS ndept ON ndept.rkey = alt.new_departmentid LEF' +
        'T OUTER JOIN'
      'datadepartment AS odept ON odept.rkey = alt.orginal_departmentid'
      
        'where active<>2  and type in (select rkey from datadetail where ' +
        'dictid=9)'
      'and alt.alterdate between :dtp1 and :dtp2 ')
    Left = 436
    Top = 255
  end
  object qry_quit: TADOQuery
    Connection = DM.con1
    Filtered = True
    Parameters = <
      item
        Name = 'dtp1'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end
      item
        Name = 'dtp2'
        Attributes = [paNullable]
        DataType = ftDateTime
        NumericScale = 3
        Precision = 23
        Size = 16
        Value = Null
      end>
    SQL.Strings = (
      'select '
      
        'employee_1.employeeid,employee_1.orginal_departmentid,d.departme' +
        'ntname,employee_1.orginal_employeecode,e.chinesename,'
      
        'e.Languages,convert(char(10),employee_1.orginal_ondutytime,20) a' +
        's ondutytime,employee_1.orginal_outdutytime as outdutytime,'
      
        'CASE e.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' END AS sextext, e.add' +
        'r,e.province, e.IDCard, e.Cardno, e.phone,e.roomcode, '
      
        'e.nation,convert(char(10),e.birthday,120) as birthday,e.blood_ty' +
        'pe,e.Height,  e.graduatedschool, e.majorsubject, e.iDCardtime,e.' +
        'sicardno, '
      
        'e.Residencepermit, e.bankaccount, e.bankname, e.contactpersonnam' +
        'e, e.contactpersontel,e.contactpersonaddr, e.recommendpersonname' +
        ', '
      
        'e.recommendpersontel, e.recommendaddr, e.recommendworkplace, e.G' +
        'raduateTime,d1.item  AS Positionitem,d2.item AS Rankitem,'
      
        'd3.item AS educationitem,d4.item AS Politics_faceitem,d5.item as' +
        ' employ_typeitem,d11.item AS marriageitem,d16.item as station, '
      
        'd17.item as source,e.status,accountname,case when attendance=0 t' +
        'hen '#39#21542#39'  when attendance=1 then '#39#26159#39' end attendancename,'
      
        'd9.item as leavetype,d10.item as leavereason,employee_1.remark a' +
        's remark,e.multi_ability,'
      'case when e.neverhire = 0 then '#39#21542#39' else '#39#26159#39' end as neverhire,'
      
        '( case when e.IsKeyPostiton=1 then '#39#26159#39' else '#39#21542#39' end) as IsKeyPos' +
        'titon,e.remark as errmark'
      ' from '
      
        '( select *from dbo.employee_alteration where type in (select rke' +
        'y from datadetail where dictid=9) and active=1) as employee_1 '
      
        'left join datadepartment  d on employee_1.orginal_departmentid=d' +
        '.rkey'
      'left join employeemsg     e on employee_1.employeeid=e.rkey'
      
        'left join (select * from datadetail where dictid=1) d1 on employ' +
        'ee_1.orginal_position=d1.rkey'
      
        'left join (select * from datadetail where dictid=2) d2 on employ' +
        'ee_1.orginal_rank=d2.rkey '
      
        'left join (select * from datadetail where dictid=3) d3 on e.educ' +
        'ation=d3.rkey'
      
        'left join (select * from datadetail where dictid=4) d4 on e.poli' +
        'tics_face=d4.rkey'
      
        'left join (select * from datadetail where dictid=5)  d5 on e.emp' +
        'loy_type=d5.rkey'
      
        'left join (select * from datadetail where dictid=9)  d9 on emplo' +
        'yee_1.[type]=d9.rkey'
      
        'left join (select * from datadetail where dictid=10) d10 on empl' +
        'oyee_1.reason=d10.rkey'
      
        'left join (select * from datadetail where dictid=11) d11 on orgi' +
        'nal_marriage=d11.rkey  '
      
        'left join (select * from datadetail where dictid=16) d16 on e.st' +
        'ation=d16.rkey'
      
        'left join (select * from datadetail where dictid=17) d17 on e.so' +
        'urce=d17.rkey'
      'left join salaryaccount k  on orginal_accountid=k.rkey'
      'where employee_1.alterdate between :dtp1 and :dtp2')
    Left = 532
    Top = 255
  end
  object qry_UpdateDep: TADOQuery
    Connection = DM.con1
    Parameters = <>
    SQL.Strings = (
      'exec dbo.hrsp_update_datadepartment_empcount')
    Left = 796
    Top = 263
  end
  object qry_rein: TADOQuery
    Connection = DM.con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'dtp1'
        Size = -1
        Value = Null
      end
      item
        Name = 'dtp2'
        Size = -1
        Value = Null
      end>
    Prepared = True
    SQL.Strings = (
      
        'SELECT     alt.rkey, alt.employeeid, alt.type, alt.reason, alt.a' +
        'lterdate, alt.orginal_employeecode, alt.orginal_departmentid, '
      
        'alt.orginal_position,alt.orginal_employ_type, alt.orginal_politi' +
        'cs_face, alt.orginal_education, '
      
        'alt.orginal_outdutytime,alt.orginal_ondutytime,alt.orginal_marri' +
        'age, alt.orginal_rank, alt.new_employeecode, alt.new_departmenti' +
        'd, '
      
        'alt.new_position,alt.new_employ_type, alt.new_politics_face, alt' +
        '.new_education, '
      'alt.new_marriage, alt.new_rank, alt.oper_date, alt.active, '
      
        'Data0005.EMPLOYEE_NAME, msg.chinesename, alt.orginal_employeecod' +
        'e as employeecode, '
      
        'msg.employ_type, msg.sex,mdet.item AS rank, rdet.item AS rreason' +
        ', tdet.item AS ttype, '
      
        'opdet.item AS pposition, tdet.dictid, npdet.item AS nposition, o' +
        'pdet.item AS oposition, '
      
        'nhdet.item AS nhtype, ohdet.item AS ohtype, hdet.item AS phtype,' +
        ' '
      
        'npdetr.item AS nrank, opdetr.item AS orank, odept.departmentname' +
        ', '
      
        'ndept.departmentname AS ndepartmentname, odept.departmentname AS' +
        ' odepartmentname, '
      
        '(CASE msg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' ELSE '#39#20854#23427#39' END) AS ' +
        'sexy, '
      'alt.remark'
      'FROM employee_alteration AS alt LEFT OUTER JOIN'
      'Data0005 ON Data0005.RKEY = alt.oper_person LEFT OUTER JOIN'
      'employeemsg AS msg ON msg.rkey = alt.employeeid LEFT OUTER JOIN'
      'datadetail AS mdet ON mdet.rkey = msg.Rank LEFT OUTER JOIN'
      'datadetail AS rdet ON rdet.rkey = alt.reason LEFT OUTER JOIN'
      'datadetail AS tdet ON tdet.rkey = alt.type LEFT OUTER JOIN'
      'datadetail AS pdet ON pdet.rkey = msg.Position LEFT OUTER JOIN'
      
        'datadetail AS npdet ON npdet.rkey = alt.new_position LEFT OUTER ' +
        'JOIN'
      
        'datadetail AS opdet ON opdet.rkey = alt.orginal_position LEFT OU' +
        'TER JOIN'
      
        'datadetail AS npdetr ON npdetr.rkey = alt.new_rank LEFT OUTER JO' +
        'IN'
      
        'datadetail AS opdetr ON opdetr.rkey = alt.orginal_rank LEFT OUTE' +
        'R JOIN'
      
        'datadetail AS hdet ON hdet.rkey = msg.employ_type LEFT OUTER JOI' +
        'N'
      
        'datadetail AS nhdet ON nhdet.rkey = alt.new_employ_type LEFT OUT' +
        'ER JOIN'
      
        'datadetail AS ohdet ON ohdet.rkey = alt.orginal_employ_type LEFT' +
        ' OUTER JOIN'
      
        'datadepartment AS dept ON dept.rkey = msg.departmentid LEFT OUTE' +
        'R JOIN'
      
        'datadepartment AS ndept ON ndept.rkey = alt.new_departmentid LEF' +
        'T OUTER JOIN'
      'datadepartment AS odept ON odept.rkey = alt.orginal_departmentid'
      
        'where active<>2  and type in (select rkey from datadetail where ' +
        'dictid=7  and item='#39#22797#32844#39')'
      'and alt.alterdate between  :dtp1  and :dtp2')
    Left = 612
    Top = 255
  end
  object DataSource1: TDataSource
    DataSet = qry_pre
    Left = 444
    Top = 335
  end
  object DataSource2: TDataSource
    DataSet = qry_quit
    Left = 532
    Top = 335
  end
  object DataSource3: TDataSource
    DataSet = qry_rein
    Left = 612
    Top = 335
  end
end
