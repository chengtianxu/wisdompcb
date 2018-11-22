object Frm_Main: TFrm_Main
  Left = 192
  Top = 160
  Width = 1023
  Height = 617
  Caption = #26045#24037#38431#31354#35843#20107#19994#37096#24037#20316#35760#24405
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
    Top = 350
    Width = 1015
    Height = 9
    Cursor = crVSplit
    Align = alBottom
    Color = clAqua
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1015
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Lab_Fielter: TLabel
      Left = 500
      Top = 16
      Width = 52
      Height = 13
      Caption = #24037#20316#21333#21495
    end
    object Label22: TLabel
      Left = 704
      Top = 2
      Width = 26
      Height = 13
      Hint = 
        #26435#38480'1'#21482#33021#36827#34892'"'#26597#30475#26242#20572#35760#24405'""'#37325#26032#30331#38470'"'#12290#13#10#26435#38480'2'#65292'3'#65292'4'#21487#20197#36827#34892#27491#24120#30340#20445#20859#27969#31243#25805#20316#12290#13#10#26435#38480'3'#65292'4'#24182#19988#29366#24577#20026'"'#24453#25191#34892'"'#21487#20197 +
        #21024#38500#35813#26465#20445#20859#35745#21010#65292#13#10#22312#8220#26126#32454#8221#21487#20197#20462#25913#35745#21010#20445#20859#26102#38388
      Caption = #24110#21161
      ParentShowHint = False
      ShowHint = True
    end
    object BtnRefresh: TBitBtn
      Left = 77
      Top = 7
      Width = 70
      Height = 33
      Hint = #21047#26032
      Caption = #21047#26032
      TabOrder = 0
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
    object BtnClose: TBitBtn
      Left = 8
      Top = 7
      Width = 70
      Height = 33
      Hint = #36864#20986#31243#24207
      Caption = #36864#20986
      TabOrder = 1
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
      Left = 146
      Top = 7
      Width = 70
      Height = 33
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
      Left = 215
      Top = 7
      Width = 70
      Height = 33
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
      Left = 284
      Top = 7
      Width = 107
      Height = 33
      Hint = #36873#25321#35201#26174#31034#30340#23383#27573
      Caption = #36873#25321#26174#31034#23383#27573
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
    object Edt_Fielter: TEdit
      Left = 576
      Top = 11
      Width = 121
      Height = 21
      TabOrder = 5
      OnChange = Edt_FielterChange
    end
    object GroupBox2: TGroupBox
      Left = 744
      Top = 0
      Width = 271
      Height = 49
      Align = alRight
      Caption = #21463#29702#26085#26399
      TabOrder = 6
      object Label4: TLabel
        Left = 8
        Top = 20
        Width = 13
        Height = 13
        Caption = #20174
      end
      object Label14: TLabel
        Left = 132
        Top = 20
        Width = 13
        Height = 13
        Caption = #21040
      end
      object DateTimePicker1: TDateTimePicker
        Left = 24
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
        Left = 152
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
    object BitBtn15: TBitBtn
      Left = 392
      Top = 7
      Width = 101
      Height = 33
      Hint = #26356#25913#26597#35810#26465#20214
      Caption = #39033#30446#32791#26102#20449#24687
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
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
  end
  object DBGridEh2: TDBGridEh
    Left = 0
    Top = 359
    Width = 1015
    Height = 164
    Align = alBottom
    DataSource = DM.DataSource2
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -13
    FooterFont.Name = #23435#20307
    FooterFont.Style = []
    PopupMenu = PopupMenu2
    ReadOnly = True
    TabOrder = 1
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
        Width = 88
      end
      item
        EditButtons = <>
        FieldName = 'MainExecStat'
        Footers = <>
        Width = 52
      end
      item
        EditButtons = <>
        FieldName = 'EMPL_CODE'
        Footers = <>
        Width = 59
      end
      item
        EditButtons = <>
        FieldName = 'EMPLOYEE_NAME'
        Footers = <>
        Width = 58
      end
      item
        EditButtons = <>
        FieldName = 'BeginTime'
        Footers = <>
        Width = 137
      end
      item
        EditButtons = <>
        FieldName = 'EndTime'
        Footers = <>
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'TimeRest'
        Footers = <>
        Width = 85
      end
      item
        EditButtons = <>
        FieldName = 'WorkTime'
        Footers = <>
        Width = 87
      end
      item
        EditButtons = <>
        FieldName = 'Remark'
        Footers = <>
        Width = 500
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 523
    Width = 1015
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 332
      Height = 41
      Align = alLeft
      Caption = #31579#36873#29366#24577
      TabOrder = 0
      object CheckBox1: TCheckBox
        Left = 7
        Top = 13
        Width = 56
        Height = 17
        Caption = #24453#25191#34892
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Left = 66
        Top = 13
        Width = 58
        Height = 17
        Caption = #25191#34892#20013
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 245
        Top = 13
        Width = 57
        Height = 17
        Caption = #24050#39564#25910
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Left = 183
        Top = 13
        Width = 56
        Height = 17
        Caption = #24453#39564#25910
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox6: TCheckBox
        Left = 122
        Top = 13
        Width = 56
        Height = 17
        Caption = #24050#26242#20572
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CheckBox1Click
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 564
    Width = 1015
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 1015
    Height = 301
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 4
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = #27010#35272
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 1007
        Height = 273
        Align = alClient
        DataSource = DM.DataSource1
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight]
        PopupMenu = PopupMenu1
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnColumnMoved = DBGridEh1ColumnMoved
        OnKeyDown = DBGridEh1KeyDown
        OnTitleClick = DBGridEh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'WorkOrder'
            Footers = <>
            Title.Color = clRed
            Title.SortIndex = 1
            Title.SortMarker = smUpEh
          end
          item
            EditButtons = <>
            FieldName = 'DeptName'
            Footers = <>
            Width = 82
          end
          item
            EditButtons = <>
            FieldName = 'WorkName'
            Footers = <>
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'WorkExpl'
            Footers = <>
            Width = 219
          end
          item
            EditButtons = <>
            FieldName = 'un_Applican'
            Footers = <>
            Width = 48
          end
          item
            EditButtons = <>
            FieldName = 'MainExecStat'
            Footers = <>
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'un_RespPeop'
            Footers = <>
            Visible = False
            Width = 49
          end
          item
            EditButtons = <>
            FieldName = 'AdmiTime'
            Footers = <>
            Width = 139
          end
          item
            EditButtons = <>
            FieldName = 'un_AdmiPeop'
            Footers = <>
            Width = 52
          end
          item
            EditButtons = <>
            FieldName = 'CompTime'
            Footers = <>
            Width = 137
          end
          item
            EditButtons = <>
            FieldName = 'ForeTime'
            Footers = <>
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'ActuCons'
            Footers = <>
            Width = 55
          end
          item
            EditButtons = <>
            FieldName = 'Efficien'
            Footers = <>
            Width = 45
          end
          item
            EditButtons = <>
            FieldName = 'AcceTime'
            Footers = <>
            Width = 138
          end
          item
            EditButtons = <>
            FieldName = 'un_AccePeop'
            Footers = <>
            Width = 54
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Width = 400
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26126#32454
      ImageIndex = 1
      object Label1: TLabel
        Left = 16
        Top = 2
        Width = 52
        Height = 13
        Caption = #24037#20316#21333#21495
      end
      object Label2: TLabel
        Left = 16
        Top = 45
        Width = 52
        Height = 13
        Caption = #37096#38376#21517#31216
      end
      object Label3: TLabel
        Left = 16
        Top = 89
        Width = 26
        Height = 13
        Caption = #20219#21153
      end
      object Label5: TLabel
        Left = 16
        Top = 135
        Width = 78
        Height = 13
        Caption = #24037#20316#20219#21153#35828#26126
      end
      object Label6: TLabel
        Left = 16
        Top = 221
        Width = 39
        Height = 13
        Caption = #30003#35831#20154
      end
      object Label7: TLabel
        Left = 310
        Top = 2
        Width = 52
        Height = 13
        Caption = #21463#29702#26085#26399
      end
      object Label8: TLabel
        Left = 310
        Top = 45
        Width = 52
        Height = 13
        Caption = #23436#25104#26085#26399
      end
      object Label9: TLabel
        Left = 310
        Top = 89
        Width = 26
        Height = 13
        Caption = #29366#24577
      end
      object Label10: TLabel
        Left = 310
        Top = 135
        Width = 52
        Height = 13
        Caption = #39564#25910#26102#38388
      end
      object Label11: TLabel
        Left = 310
        Top = 179
        Width = 39
        Height = 13
        Caption = #39564#25910#20154
      end
      object Label12: TLabel
        Left = 310
        Top = 221
        Width = 52
        Height = 13
        Caption = #39044#35745#32791#26102
      end
      object Label13: TLabel
        Left = 547
        Top = 2
        Width = 52
        Height = 13
        Caption = #23454#38469#32791#26102
      end
      object Label15: TLabel
        Left = 547
        Top = 45
        Width = 26
        Height = 13
        Caption = #25928#29575
      end
      object Label16: TLabel
        Left = 547
        Top = 89
        Width = 26
        Height = 13
        Caption = #22791#27880
      end
      object Edt_WorkOrder: TEdit
        Left = 16
        Top = 17
        Width = 185
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object cbb_DeptName: TComboBox
        Left = 16
        Top = 61
        Width = 185
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 1
        OnExit = cbb_DeptNameExit
      end
      object Cbb_WorkName: TComboBox
        Left = 16
        Top = 105
        Width = 185
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        TabOrder = 2
        OnExit = Cbb_WorkNameExit
      end
      object Mem_WorkExpl: TMemo
        Left = 16
        Top = 151
        Width = 185
        Height = 64
        Enabled = False
        TabOrder = 3
        OnExit = Mem_WorkExplExit
      end
      object Edt_un_Applican: TEdit
        Left = 16
        Top = 237
        Width = 185
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object Edt_MainExecStat: TEdit
        Left = 310
        Top = 105
        Width = 160
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object Edt_AcceTime: TEdit
        Left = 310
        Top = 151
        Width = 160
        Height = 21
        Enabled = False
        TabOrder = 6
      end
      object Edt_un_AccePeop: TEdit
        Left = 310
        Top = 195
        Width = 160
        Height = 21
        Enabled = False
        TabOrder = 7
      end
      object Edt_ForeTime: TEdit
        Left = 310
        Top = 237
        Width = 160
        Height = 21
        Enabled = False
        TabOrder = 8
        OnExit = Edt_ForeTimeExit
        OnKeyPress = Edt_ForeTimeKeyPress
      end
      object Edt_ActuCons: TEdit
        Left = 547
        Top = 17
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 9
      end
      object Edt_Efficien: TEdit
        Left = 547
        Top = 61
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 10
      end
      object Mem_Remark: TMemo
        Left = 547
        Top = 105
        Width = 185
        Height = 89
        Enabled = False
        TabOrder = 11
        OnExit = Mem_RemarkExit
      end
      object DBDTE_AdmiTime: TDBDateTimeEditEh
        Left = 312
        Top = 18
        Width = 160
        Height = 21
        EditButtons = <>
        Kind = dtkDateTimeEh
        TabOrder = 12
        Visible = True
        OnExit = DBDTE_AdmiTimeExit
      end
      object DBDTE_CompTime: TDBDateTimeEditEh
        Left = 312
        Top = 64
        Width = 160
        Height = 21
        EditButtons = <>
        Kind = dtkDateTimeEh
        TabOrder = 13
        Visible = True
        OnExit = DBDTE_CompTimeExit
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 728
    Top = 104
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #24320#22987#21463#29702
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #25552#20132#39564#25910
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #39564#25910#36890#36807
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #29366#24577#35760#24405
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #37325#26032#30331#38470
      OnClick = N7Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 360
    Top = 400
    object N12: TMenuItem
      Caption = #20174#21382#21490#35760#24405#28155#21152
      OnClick = N12Click
    end
    object N8: TMenuItem
      Caption = #26032#22686
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #32534#36753
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #21024#38500
      OnClick = N10Click
    end
    object N11: TMenuItem
      Caption = #20010#20154#32467#26463
      OnClick = N11Click
    end
  end
end
