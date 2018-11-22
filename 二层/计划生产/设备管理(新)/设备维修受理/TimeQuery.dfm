object Frm_TimeQuery: TFrm_TimeQuery
  Left = 249
  Top = 240
  Width = 1045
  Height = 560
  Caption = #24037#26102#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1037
    Height = 41
    Align = alTop
    TabOrder = 0
    object BtnClose: TBitBtn
      Left = 8
      Top = 4
      Width = 70
      Height = 33
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
    object BtnExportToExcel: TBitBtn
      Left = 77
      Top = 4
      Width = 70
      Height = 33
      Hint = #23548#20986#25968#25454
      Caption = #23548#20986
      TabOrder = 1
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
      Left = 146
      Top = 4
      Width = 70
      Height = 33
      Hint = #26597#35810#26465#20214
      Caption = #26597#35810
      TabOrder = 2
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
    object BitBtn1: TBitBtn
      Left = 216
      Top = 4
      Width = 81
      Height = 33
      Caption = #36873#25321#23383#27573
      TabOrder = 3
      OnClick = BitBtn1Click
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 41
    Width = 1037
    Height = 466
    Align = alClient
    DataSource = DataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = #30003#35831#21333#21495
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #35774#22791#20195#30721
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #35774#22791#21517#31216
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #37096#38376#21517#31216
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #25925#38556#35828#26126
        Footers = <>
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = #32500#20462#35760#24405
        Footers = <>
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = #29366#24577
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24037#21378
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #23436#24037#20154#21592
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #23454#38469#32500#20462#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #21463#29702#20154
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #35774#22791#32423#21035
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24433#21709#31243#24230
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #25552#20132#26085#26399
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #32852#32476#20154
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #32852#32476#20154#30005#35805
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #21463#29702#26085#26399
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #23436#24037#26085#26399
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #39564#25910#35780#20215
        Footers = <>
        Width = 262
      end
      item
        EditButtons = <>
        FieldName = #24322#24120#31867#21035
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #25237#35785#20869#23481
        Footers = <>
        Width = 300
      end
      item
        EditButtons = <>
        FieldName = #24037#20316#26085#26399
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #38599#21592
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24037#20316#21333#29366#24577
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24320#22987#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #32467#26463#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #26631#20934#32500#20462#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #20013#36884#20241#24687#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #38599#21592#24037#20316#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #26242#20572#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #22791#27880
        Footers = <>
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = #36798#25104#29575
        Footers = <>
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 507
    Width = 1037
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 41
    Width = 1037
    Height = 466
    Align = alClient
    DataSource = DataSource1
    EditActions = [geaCopyEh, geaSelectAllEh]
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnKeyDown = DBGridEh1KeyDown
    OnTitleClick = DBGridEh1TitleClick
    Columns = <
      item
        EditButtons = <>
        FieldName = #30003#35831#21333#21495
        Footers = <>
        Width = 72
      end
      item
        EditButtons = <>
        FieldName = #35774#22791#20195#30721
        Footers = <>
        Width = 115
      end
      item
        EditButtons = <>
        FieldName = #35774#22791#21517#31216
        Footers = <>
        Width = 167
      end
      item
        EditButtons = <>
        FieldName = #37096#38376#21517#31216
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = #25925#38556#35828#26126
        Footers = <>
        Width = 147
      end
      item
        EditButtons = <>
        FieldName = #32500#20462#35760#24405
        Footers = <>
        Width = 138
      end
      item
        EditButtons = <>
        FieldName = #29366#24577
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24037#21378
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #23436#24037#20154#21592
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #23454#38469#32500#20462#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #21463#29702#20154
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #35774#22791#32423#21035
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24433#21709#31243#24230
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #25552#20132#26085#26399
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #32852#32476#20154
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #32852#32476#20154#30005#35805
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #21463#29702#26085#26399
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #23436#24037#26085#26399
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #39564#25910#35780#20215
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24322#24120#31867#21035
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #25237#35785#20869#23481
        Footers = <>
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = #24037#20316#26085#26399
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24037#20316#21333#29366#24577
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #26631#20934#32500#20462#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #38599#21592
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #24320#22987#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #32467#26463#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #38599#21592#24037#20316#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #36798#25104#29575
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #20013#36884#20241#24687#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #26242#20572#26102#38388
        Footers = <>
      end
      item
        EditButtons = <>
        FieldName = #22791#27880
        Footers = <>
        Width = 200
      end>
  end
  object ADS: TADODataSet
    Connection = DM.ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    AfterScroll = ADSAfterScroll
    CommandText = 
      'select Data0567.NUMBER as '#39#30003#35831#21333#21495#39',Data0417.FASSET_CODE as '#39#35774#22791#20195#30721#39',' +
      #13#10'       Data0417.FASSET_NAME as '#39#35774#22791#21517#31216#39',Data0034.DEPT_NAME as '#39#37096 +
      #38376#21517#31216#39','#13#10'       Data0567.failure_circs as '#39#25925#38556#35828#26126#39', Data0567.maintai' +
      'n_text as '#39#32500#20462#35760#24405#39','#13#10'       case data0567.status when 0 then '#39#26410#25552#20132#39 +
      ' when 1 then '#39#24453#21463#29702#39' '#13#10'       when 2 then '#39#24050#21463#29702#39' when 3 then '#39#24050#23436#24037#39' ' +
      'when 4 then '#39#24050#39564#25910#39' '#13#10'       when 5 then '#39#34987#36864#22238#39' when 6 then '#39#24050#26242#20572#39' e' +
      'nd as '#39#29366#24577#39','#13#10'       Data0015.abbr_name as  '#39#24037#21378#39',Data0005_2.EMPLO' +
      'YEE_NAME as '#39#23436#24037#20154#21592#39',  '#13#10'       DATA0567.maintain_house  as '#39#23454#38469#32500#20462#26102 +
      #38388#39',Data0005_1.EMPLOYEE_NAME as '#39#21463#29702#20154#39','#13#10'       '#13#10'       DATA0567.' +
      'equipment_grade as '#39#35774#22791#32423#21035#39','#13#10'       DATA0567.failure_degree as '#39#24433 +
      #21709#31243#24230#39', DATA0567.referring_date as '#39#25552#20132#26085#26399#39','#13#10'       DATA0567.CONTAC' +
      'T_NAME as '#39#32852#32476#20154#39', DATA0567.CONTACT_PHONE as '#39#32852#32476#20154#30005#35805#39','#13#10'       DATA' +
      '0567.disposal_date as '#39#21463#29702#26085#26399#39',DATA0567.complete_date as '#39#23436#24037#26085#26399#39','#13#10 +
      '       DATA0567.validate_appraise as '#39#39564#25910#35780#20215#39', DATA0567.fail_type ' +
      'as '#39#24322#24120#31867#21035#39','#13#10'       '#39#25237#35785#20869#23481#39'=convert(varchar(500),STUFF((SELECT '#39#65307#39 +
      ' + remark from data0841'#13#10'       where data0841.D567_ptr=data0567' +
      '.rkey and Status_ptr=7'#13#10'       FOR XML PATH('#39#39')), 1, 1, '#39#39')),'#13#10' ' +
      '      '#13#10'       Data0842.WorkDate as  '#39#24037#20316#26085#26399#39',d5.EMPLOYEE_NAME  as' +
      '  '#39#38599#21592#39','#13#10'       Data0832.MainexecStat  as '#39#24037#20316#21333#29366#24577#39',Data0842.Begin' +
      'Time  as '#39#24320#22987#26102#38388#39','#13#10'       Data0842.EndTime as  '#39#32467#26463#26102#38388#39',Data0846.st' +
      'dDate as  '#39#26631#20934#32500#20462#26102#38388#39','#13#10'       Data0842.TimeRest as  '#39#20013#36884#20241#24687#26102#38388#39',Data0' +
      '842.WorkTime  as '#39#38599#21592#24037#20316#26102#38388#39','#13#10'       Data0842.TimeCons as '#39#26242#20572#26102#38388#39',D' +
      'ata0842.Remark  as '#39#22791#27880#39', '#13#10'       case when Data0846.stdDate>0 a' +
      'nd DATA0567.Staff_Sum_house>0 then'#13#10'       convert(decimal(18,2)' +
      ',round(Data0846.stdDate/DATA0567.Staff_Sum_house,2)) else 0 end ' +
      ' as '#39#36798#25104#29575#39' '#13#10'from   DATA0567 join data0417 on DATA0567.FASSET_PTR' +
      '=data0417.rkey'#13#10'       join  Data0034 ON DATA0567.DEPT_PTR = Dat' +
      'a0034.RKEY '#13#10'       join  Data0005 AS Data0005_1 ON DATA0567.dis' +
      'posal_emplptr = Data0005_1.RKEY '#13#10'       left JOIN Data0005 AS D' +
      'ata0005_2 ON Data0567.completion_emplptr=Data0005_2.RKEY '#13#10'     ' +
      '  left join Data0015 ON DATA0567.whouse_ptr=data0015.rkey'#13#10'     ' +
      '  left join Data0842 on Data0842.Work_ptr=DATA0567.rkey'#13#10'       ' +
      'left join data0005 as  d5 on Data0842.Empl_ptr=d5.rkey'#13#10'       j' +
      'oin data0832 on Data0842.Status=data0832.rkey'#13#10'       left join ' +
      'data0846 on data0846.rkey=DATA0567.d846_ptr '#13#10'where  1=1'
    IndexFieldNames = #30003#35831#21333#21495
    Parameters = <>
    Left = 304
    Top = 200
    object ADSDSDesigner: TStringField
      FieldName = #30003#35831#21333#21495
      Size = 15
    end
    object ADSDSDesigner2: TStringField
      FieldName = #35774#22791#20195#30721
    end
    object ADSDSDesigner3: TStringField
      FieldName = #35774#22791#21517#31216
      Size = 30
    end
    object ADSDSDesigner4: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object ADSDSDesigner5: TStringField
      FieldName = #25925#38556#35828#26126
      Size = 200
    end
    object ADSDSDesigner6: TStringField
      FieldName = #32500#20462#35760#24405
      Size = 400
    end
    object ADSDSDesigner7: TStringField
      FieldName = #29366#24577
      ReadOnly = True
      Size = 6
    end
    object ADSDSDesigner8: TStringField
      FieldName = #24037#21378
      Size = 10
    end
    object ADSDSDesigner9: TStringField
      FieldName = #23436#24037#20154#21592
      Size = 16
    end
    object ADSDSDesigner10: TBCDField
      FieldName = #23454#38469#32500#20462#26102#38388
      Precision = 8
      Size = 2
    end
    object ADSDSDesigner11: TStringField
      FieldName = #21463#29702#20154
      Size = 16
    end
    object ADSDSDesigner12: TStringField
      FieldName = #35774#22791#32423#21035
      Size = 10
    end
    object ADSDSDesigner13: TStringField
      FieldName = #24433#21709#31243#24230
      Size = 8
    end
    object ADSDSDesigner14: TDateTimeField
      FieldName = #25552#20132#26085#26399
    end
    object ADSDSDesigner15: TStringField
      FieldName = #32852#32476#20154
      Size = 10
    end
    object ADSDSDesigner16: TStringField
      FieldName = #32852#32476#20154#30005#35805
      Size = 15
    end
    object ADSDSDesigner17: TDateTimeField
      FieldName = #21463#29702#26085#26399
    end
    object ADSDSDesigner18: TDateTimeField
      FieldName = #23436#24037#26085#26399
    end
    object ADSDSDesigner19: TStringField
      FieldName = #39564#25910#35780#20215
      Size = 50
    end
    object ADSDSDesigner20: TStringField
      FieldName = #24322#24120#31867#21035
      Size = 30
    end
    object ADSDSDesigner21: TStringField
      FieldName = #25237#35785#20869#23481
      ReadOnly = True
      Size = 500
    end
    object ADSDSDesigner22: TDateTimeField
      FieldName = #24037#20316#26085#26399
    end
    object ADSDSDesigner23: TStringField
      FieldName = #38599#21592
      Size = 16
    end
    object ADSDSDesigner24: TStringField
      FieldName = #24037#20316#21333#29366#24577
      Size = 10
    end
    object ADSDSDesigner25: TDateTimeField
      FieldName = #24320#22987#26102#38388
    end
    object ADSDSDesigner26: TDateTimeField
      FieldName = #32467#26463#26102#38388
    end
    object ADSDSDesigner27: TBCDField
      FieldName = #26631#20934#32500#20462#26102#38388
      Precision = 9
      Size = 2
    end
    object ADSDSDesigner28: TBCDField
      FieldName = #20013#36884#20241#24687#26102#38388
      Precision = 8
      Size = 2
    end
    object ADSDSDesigner29: TBCDField
      FieldName = #38599#21592#24037#20316#26102#38388
      Precision = 5
      Size = 2
    end
    object ADSDSDesigner30: TBCDField
      FieldName = #26242#20572#26102#38388
      Precision = 8
      Size = 2
    end
    object ADSDSDesigner31: TStringField
      FieldName = #22791#27880
      Size = 200
    end
    object ADSDSDesigner32: TBCDField
      FieldName = #36798#25104#29575
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = ADS
    Left = 368
    Top = 200
  end
end
