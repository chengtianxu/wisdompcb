object FrmMain: TFrmMain
  Left = 260
  Top = 141
  Width = 1052
  Height = 720
  Caption = #21592#24037#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1036
    Height = 682
    Align = alClient
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 1034
      Height = 680
      Align = alClient
      TabOrder = 0
      object spl1: TSplitter
        Left = 146
        Top = 42
        Height = 637
      end
      object pnl1: TPanel
        Left = 1
        Top = 1
        Width = 1032
        Height = 41
        Align = alTop
        TabOrder = 0
        object lbl1: TLabel
          Left = 403
          Top = 14
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = #24037#21495#65306
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 574
          Top = 16
          Width = 48
          Height = 13
          Caption = #24635#20154#25968#65306
        end
        object lblMCount: TLabel
          Left = 624
          Top = 16
          Width = 12
          Height = 13
          Caption = '00'
        end
        object btnExit: TBitBtn
          Left = 2
          Top = 5
          Width = 55
          Height = 25
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
          TabOrder = 1
          OnClick = btnExitClick
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
        object btnFresh: TBitBtn
          Left = 59
          Top = 5
          Width = 54
          Height = 25
          Hint = #21047#26032#25968#25454
          Caption = #21047#26032
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnFreshClick
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
        object btnQry: TBitBtn
          Left = 112
          Top = 5
          Width = 57
          Height = 25
          Hint = #37325#26032#23450#20041#26597#35810#26465#20214
          Caption = #26597#35810
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnQryClick
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
        object btnExcel: TBitBtn
          Left = 165
          Top = 5
          Width = 60
          Height = 25
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
          TabOrder = 4
          OnClick = btnExcelClick
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
        object btnField: TBitBtn
          Left = 222
          Top = 5
          Width = 64
          Height = 25
          Hint = #29992#25143#33258#23450#20041#26174#31034#23383#27573
          Caption = #23383#27573
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnFieldClick
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
        object btnmodel: TBitBtn
          Left = 288
          Top = 5
          Width = 86
          Height = 25
          Caption = #23450#20041#27169#29256
          Font.Charset = GB2312_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          PopupMenu = pm_field
          TabOrder = 6
          OnClick = btnmodelClick
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
            EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE2B2B81EEEEEE
            EEEEEEEEEEEEEEEEEEEE565681EEEEEEEEEEEEEEEEEEEEEEEEEEAC562B2BEEEE
            EEEEEEEEEEEEEEEEEEEE81DF5656EEEEEEEEEEEEEEEEEEEEEEEEEE5656562B81
            EEEEEEEEEEEEEEEEEEEEEEDFDFDF5681EEEEEEEEEEEEEEEEEEEEEEAC5656562B
            7EEEEEEEEEEEEEEEEEEEEE81DFDFDF5681EEEEEEEEEEEEEEEEEEEEEE5656D5AB
            AB7EEEEEEEEEEEEEEEEEEEEEDFDFE3ACAC81EEEEEEEEEEEEEEEEEEEEACDFD6D5
            ABAB7EABEEEEEEEEEEEEEEEE81DFE3E3ACAC81ACEEEEEEEEEEEEEEEEEEAAD7D6
            D5D5ABAA7EEEEEEEEEEEEEEEEEACD7E3E3E3ACAC81EEEEEEEEEEEEEEEEAAD7D6
            D6D5D5ABAB7EAAEEEEEEEEEEEEACD7E3E3E3E3ACAC81ACEEEEEEEEEEEEEEABD7
            D6D6D5D5ABAD0909EEEEEEEEEEEEACD7E3E3E3E3ACAC5656EEEEEEEEEEEEAAD7
            D6D6AD101009090909EEEEEEEEEEACD7E3E3ACDFDF56565656EEEEEEEEEEEEAB
            D7D61010101009090909EEEEEEEEEEACD7E3DFDFDFDF56565656EEEEEEEEEEAA
            D7AD1010101010090909EEEEEEEEEEACD7ACDFDFDFDFDF565656EEEEEEEEEEEE
            17171010101010100909EEEEEEEEEEEE8181DFDFDFDFDFDF5656EEEEEEEEEEEE
            10171710101010101009EEEEEEEEEEEE568181DFDFDFDFDFDF56EEEEEEEEEEEE
            EE101717101010101010EEEEEEEEEEEEEE568181DFDFDFDFDFDF}
          NumGlyphs = 2
        end
        object edt_value: TEdit
          Left = 446
          Top = 8
          Width = 121
          Height = 21
          ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
          TabOrder = 7
          OnChange = edt_valueChange
          OnKeyDown = edt_valueKeyDown
        end
        object rg_status: TRadioGroup
          Left = 664
          Top = 0
          Width = 401
          Height = 37
          Columns = 4
          Items.Strings = (
            #26410#23457#26680'+'#22312#32844
            #26410#23457#26680
            #22312#32844
            #31163#32844)
          TabOrder = 0
          OnClick = rg_statusClick
        end
      end
      object pnl2: TPanel
        Left = 1
        Top = 42
        Width = 145
        Height = 637
        Align = alLeft
        TabOrder = 1
        object tv1: TTreeView
          Left = 1
          Top = 1
          Width = 143
          Height = 635
          Align = alClient
          Images = il1
          Indent = 19
          TabOrder = 0
          OnClick = tv1Click
          OnGetImageIndex = tv1GetImageIndex
        end
      end
      object pnl3: TPanel
        Left = 149
        Top = 42
        Width = 884
        Height = 637
        Align = alClient
        TabOrder = 2
        object pnl4: TPanel
          Left = 1
          Top = 560
          Width = 882
          Height = 76
          Align = alBottom
          TabOrder = 0
          object rg1: TRadioGroup
            Left = 1
            Top = 0
            Width = 880
            Height = 75
            Align = alBottom
            Caption = #27169#29256
            Columns = 6
            TabOrder = 0
            OnClick = rg1Click
          end
        end
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 882
          Height = 559
          Align = alClient
          TabOrder = 1
          object Panel4: TPanel
            Left = 1
            Top = 521
            Width = 880
            Height = 37
            Align = alBottom
            TabOrder = 0
            object Label1: TLabel
              Left = 8
              Top = 8
              Width = 802
              Height = 17
              Caption = #27880#65306#20197#19978#27700#32418#33394#20026#26410#23457#26680#30340#65292#34013#33394#26159#21512#21516#25968#36229#38480#65292' '#32418#33394#26159#26377#29359#36807#20005#37325#38169#35823#30340#65292#28129#34013#33394#20026#36824#24046#19968#20010#26376#36523#20221#35777#21363#23558#21040#26399
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'Onyx'
              Font.Pitch = fpFixed
              Font.Style = []
              ParentFont = False
            end
          end
          object dbgrdhDetail: TDBGridEh
            Left = 1
            Top = 1
            Width = 880
            Height = 520
            Align = alClient
            DataSource = ds1
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'MS Sans Serif'
            FooterFont.Style = []
            FrozenCols = 3
            ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            PopupMenu = pm_Main
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = dbgrdhDetailDblClick
            OnDrawColumnCell = dbgrdhDetailDrawColumnCell
            OnKeyDown = dbgrdhDetailKeyDown
            OnTitleClick = dbgrdhDetailTitleClick
            Columns = <
              item
                EditButtons = <>
                FieldName = 'ID'
                Footers = <>
                Width = 23
              end
              item
                EditButtons = <>
                FieldName = 'employeecode'
                Footers = <>
                Title.Caption = #24037#21495
                Width = 66
              end
              item
                EditButtons = <>
                FieldName = 'chinesename'
                Footers = <>
                Title.Caption = #22995#21517
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'departmentname'
                Footers = <>
                Title.Caption = #37096#38376
                Width = 93
              end
              item
                EditButtons = <>
                FieldName = 'sextext'
                Footers = <>
                Title.Caption = #24615#21035
                Width = 37
              end
              item
                EditButtons = <>
                FieldName = 'status2'
                Footers = <>
                Title.Caption = #21592#24037#29366#24577
                Width = 54
              end
              item
                EditButtons = <>
                FieldName = 'formal'
                Footers = <>
                Title.Caption = #26159#21542#36716#27491
                Width = 108
              end
              item
                EditButtons = <>
                FieldName = 'ondutytime'
                Footers = <>
                Title.Caption = #21040#32844#26085#26399
              end
              item
                EditButtons = <>
                FieldName = 'adate'
                Footers = <>
                Title.Caption = #35797#29992#26399#28385#26085#26399
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'outdutytime'
                Footers = <>
                Title.Caption = #31163#32844#26085#26399
              end
              item
                EditButtons = <>
                FieldName = 'Positionitem'
                Footers = <>
                Title.Caption = #32844#21153
                Width = 74
              end
              item
                EditButtons = <>
                FieldName = 'Rankitem'
                Footers = <>
                Title.Caption = #32844#32423
                Width = 49
              end
              item
                EditButtons = <>
                FieldName = 'pGradeItem'
                Footers = <>
                Title.Caption = #32844#31561
                Visible = False
                Width = 118
              end
              item
                EditButtons = <>
                FieldName = 'IsKeyPostiton'
                Footers = <>
                Title.Caption = #26159#21542#20851#38190#23703#20301
                Width = 79
              end
              item
                EditButtons = <>
                FieldName = 'Dgrade'
                Footers = <>
                Title.Caption = #23487#33293#31561#32423
                Width = 100
              end
              item
                EditButtons = <>
                FieldName = 'starlevel'
                Footers = <>
                Title.Caption = #21592#24037#26143#32423
              end
              item
                EditButtons = <>
                FieldName = 'birthday'
                Footers = <>
                Title.Caption = #20986#29983#26085#26399
              end
              item
                EditButtons = <>
                FieldName = 'age'
                Footers = <>
                Title.Caption = #24180#40836
                Width = 39
              end
              item
                EditButtons = <>
                FieldName = 'workage'
                Footers = <>
                Title.Caption = #24037#40836
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'province'
                Footers = <>
                Title.Caption = #30465#20221
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'prinvicename'
                Footers = <>
                Title.Caption = #31821#36143
                Width = 60
              end
              item
                EditButtons = <>
                FieldName = 'nation'
                Footers = <>
                Title.Caption = #27665#26063
                Width = 48
              end
              item
                EditButtons = <>
                FieldName = 'marriageitem'
                Footers = <>
                Title.Caption = #23130#23035#29366#20917
                Width = 55
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
                FieldName = 'station'
                Footers = <>
                Title.Caption = #23703#20301
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'source'
                Footers = <>
                Title.Caption = #24405#29992#26469#28304
                Width = 68
              end
              item
                EditButtons = <>
                FieldName = 'Politics_faceitem'
                Footers = <>
                Title.Caption = #25919#27835#38754#35980
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'educationitem'
                Footers = <>
                Title.Caption = #25991#21270#31243#24230
                Width = 61
              end
              item
                EditButtons = <>
                FieldName = 'IDCard'
                Footers = <>
                Title.Caption = #36523#20221#35777#21495#30721
              end
              item
                EditButtons = <>
                FieldName = 'iDCardtime'
                Footers = <>
                Title.Caption = #36523#20221#35777#26377#25928#26399
                Width = 81
              end
              item
                EditButtons = <>
                FieldName = 'addr'
                Footers = <>
                Title.Caption = #36523#20221#35777#22320#22336
                Width = 194
              end
              item
                EditButtons = <>
                FieldName = 'Cardno'
                Footers = <>
                Title.Caption = #32771#21220#21495#30721
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'phone'
                Footers = <>
                Title.Caption = #32852#31995#30005#35805
                Width = 71
              end
              item
                EditButtons = <>
                FieldName = 'roomcode'
                Footers = <>
                Title.Caption = #23487#33293#32534#21495
                Width = 62
              end
              item
                EditButtons = <>
                FieldName = 'graduatedschool'
                Footers = <>
                Title.Caption = #27605#19994#38498#26657
              end
              item
                EditButtons = <>
                FieldName = 'majorsubject'
                Footers = <>
                Title.Caption = #19987#19994
              end
              item
                EditButtons = <>
                FieldName = 'GraduateTime'
                Footers = <>
                Title.Caption = #27605#19994#26102#38388
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'Residencepermit'
                Footers = <>
                Title.Caption = #23621#20303#35777
                Width = 86
              end
              item
                EditButtons = <>
                FieldName = 'sicardno'
                Footers = <>
                Title.Caption = #31038#20445#30005#33041#21495
                Width = 95
              end
              item
                EditButtons = <>
                FieldName = 'recognizor'
                Footers = <>
                Title.Caption = #25285#20445#20154
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'recognizor_Phone'
                Footers = <>
                Title.Caption = #25285#20445#20154#30005#35805
              end
              item
                EditButtons = <>
                FieldName = 'contactpersonname'
                Footers = <>
                Title.Caption = #32039#24613#32852#32476#20154
                Width = 73
              end
              item
                EditButtons = <>
                FieldName = 'contactpersontel'
                Footers = <>
                Title.Caption = #32039#24613#32852#32476#20154#30005#35805
                Width = 96
              end
              item
                EditButtons = <>
                FieldName = 'contactpersonaddr'
                Footers = <>
                Title.Caption = #32039#24613#32852#32476#20154#22320#22336
              end
              item
                EditButtons = <>
                FieldName = 'recommendpersonname'
                Footers = <>
                Title.Caption = #25512#33616#20154
                Width = 55
              end
              item
                EditButtons = <>
                FieldName = 'recommendpersontel'
                Footers = <>
                Title.Caption = #25512#33616#20154#30005#35805
                Width = 84
              end
              item
                EditButtons = <>
                FieldName = 'recommendaddr'
                Footers = <>
                Title.Caption = #25512#33616#20154#22320#22336
              end
              item
                EditButtons = <>
                FieldName = 'recommendworkplace'
                Footers = <>
                Title.Caption = #25512#33616#20154#24037#20316#21333#20301
              end
              item
                EditButtons = <>
                FieldName = 'wagetypename'
                Footers = <>
                Title.Caption = #34218#36164#36134#22871
                Width = 76
              end
              item
                EditButtons = <>
                FieldName = 'attendancename'
                Footers = <>
                Title.Caption = #26159#21542#32771#21220
                Width = 63
              end
              item
                EditButtons = <>
                FieldName = 'public_accumulation_funds'
                Footers = <>
                Title.Caption = #20844#31215#37329#36134#21495
                Width = 80
              end
              item
                EditButtons = <>
                FieldName = 'siaccountno'
                Footers = <>
                Title.Caption = #31038#20250#20445#38556#21495
                Width = 78
              end
              item
                EditButtons = <>
                FieldName = 'serious_mistake'
                Footers = <>
                Title.Caption = #35760#36807#27425#25968
              end
              item
                EditButtons = <>
                FieldName = 'multi_ability'
                Footers = <>
                Title.Caption = #23703#20301#25216#33021
                Width = 246
              end
              item
                EditButtons = <>
                FieldName = 'emp_contract_flag'
                Footers = <>
                Title.Caption = #21512#21516#26631#35782
              end
              item
                EditButtons = <>
                FieldName = 'contractcount'
                Footers = <>
                Title.Caption = #26377#25928#21512#25968
              end
              item
                EditButtons = <>
                FieldName = 'user_defined2'
                Footers = <>
                Title.Caption = #21512#21516#38480#21046#25968
              end
              item
                EditButtons = <>
                FieldName = 'IDCardFlag'
                Footers = <>
                Title.Caption = #36523#20221#35777#26159#21542#36807#26399
                Width = 89
              end
              item
                EditButtons = <>
                FieldName = 'bankaccount'
                Footers = <>
                Title.Caption = #38134#34892#36134#21495
                Width = 146
              end
              item
                EditButtons = <>
                FieldName = 'remark'
                Footers = <>
                Title.Caption = #22791#27880
                Width = 417
              end
              item
                EditButtons = <>
                FieldName = 'printdate'
                Footers = <>
              end>
          end
        end
      end
    end
  end
  object ds1: TDataSource
    DataSet = qry_EMP
    Left = 540
    Top = 281
  end
  object qryDep: TADOQuery
    Connection = FDM.con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT     rkey, departmentname, departmentcode, superior, charg' +
        'ename, departmentration, departmentcount, scarcity'
      
        'FROM   dbo.datadepartment where isnull(invalid,0)=0 order by dep' +
        'artmentcode')
    Left = 72
    Top = 176
    object atncfld_departmentrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qryDepdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object qryDepdepartmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object intgrfld_departmentsuperior: TIntegerField
      FieldName = 'superior'
    end
    object qryDepchargename: TWideStringField
      FieldName = 'chargename'
    end
    object intgrfld_departmentdepartmentration: TIntegerField
      FieldName = 'departmentration'
    end
    object intgrfld_departmentdepartmentcount: TIntegerField
      FieldName = 'departmentcount'
    end
    object intgrfld_departmentscarcity: TIntegerField
      FieldName = 'scarcity'
    end
  end
  object qry_EMP: TADOQuery
    Connection = FDM.con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT   dbo.employeemsg. Lsight, dbo.employeemsg.Rsight,      d' +
        'bo.employeemsg.rkey,dbo.employeemsg.chinesename, '
      
        'case when formal=0 then '#39#26410#36716#27491#39' when  formal=1   then '#39#24050#36716#27491#21512#26684#39'     ' +
        ' when formal =2  then '#39#24050#36716#27491#19981#21512#26684#39'  when formal = 3 then '#39#26410#36716#27491'('#36716#27491#19981#35843#34218')' +
        #39'    end as formal,'
      
        'case when status=0 then '#39#26410#23457#26680#39' when  status=1   then '#39#22312#32844#39'      wh' +
        'en status=2  then '#39#31163#32844#39'      end as status2,'
      'dbo.employeemsg.employeecode, dbo.employeemsg.departmentid,'
      
        'employeemsg.Languages,convert(char(10),dbo.employeemsg.ondutytim' +
        'e,20) as ondutytime, convert(char(10),'
      
        #9'dbo.employeemsg.outdutytime,20) as outdutytime, dbo.employeemsg' +
        '.employ_type, dbo.employeemsg.Position, '
      
        #9'dbo.employeemsg.Rank,dbo.employeemsg.Politics_face, dbo.employe' +
        'emsg.education, dbo.employeemsg.marriage, dbo.employeemsg.sex,'
      
        'cast ( ((datediff(month,birthday,getdate())-case when day(birthd' +
        'ay)>day(getdate()) then 1 else 0 end)/12) as nvarchar(10))+'#39'.'#39
      
        '+case when ( (datediff(month,birthday,getdate())-case when day(b' +
        'irthday)>day(getdate()) then 1 else 0 end)%12)<10  then '#39'0'#39' else' +
        ' '#39#39' end '
      
        '+cast( ( (datediff(month,birthday,getdate())-case when day(birth' +
        'day)>day(getdate()) then 1 else 0 end)%12) as nvarchar(10))   as' +
        ' age,'
      ''
      'cast ( ((datediff(month,ondutytime,getdate())-  '
      
        'case when day(ondutytime)>day(getdate()) then 1 else 0 end)/12) ' +
        ' '
      'as nvarchar(10))+'#39#24180#39'+  '
      'cast(  '
      ' ( (datediff(month,ondutytime,getdate())-  '
      
        'case when day(ondutytime)>day(getdate()) then 1 else 0 end)%12) ' +
        ' '
      'as nvarchar(10))+'#39#26376#39'+  '
      'cast(  '
      '(case when   '
      
        'dateadd(month,datediff(month,ondutytime,getdate()),ondutytime)>g' +
        'etdate()    '
      'then day(getdate())+     '
      
        ' (datediff(day,ondutytime, dateadd(month,1,convert(datetime,(sub' +
        'string(convert (nvarchar(20),ondutytime,120),1,7)+'#39'-01'#39'),120) ) ' +
        ')-1)  '
      'else day(getdate())-day(ondutytime) end)  '
      ' as nvarchar(10))+'#39#22825#39'   as workage,'
      
        #9'CASE employeemsg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' END AS sex' +
        'text, dbo.employeemsg.addr,'
      
        #9'dbo.employeemsg.province, dbo.employeemsg.IDCard, dbo.employeem' +
        'sg.Cardno, dbo.employeemsg.phone, dbo.employeemsg.attendance,'
      
        #9'dbo.employeemsg.wagetype, dbo.employeemsg.roomcode, dbo.employe' +
        'emsg.nation, convert(char(10),dbo.employeemsg.birthday,20) as bi' +
        'rthday,'
      
        #9'blood_type,Height,graduatedschool, majorsubject, iDCardtime, si' +
        'cardno, Residencepermit, bankaccount, bankname, contactpersonnam' +
        'e, contactpersontel,'
      
        #9'contactpersonaddr, recommendpersonname, recommendpersontel, rec' +
        'ommendaddr, recommendworkplace, GraduateTime,'
      
        #9'dbo.datadepartment.departmentcode, dbo.datadepartment.departmen' +
        'tname, dbo.datadepartment.superior, dbo.datadepartment.rkey AS r' +
        'keydep, '
      
        #9'dbo.datadetail.item AS employ_typeitem, datadetail_1.item AS Ra' +
        'nkitem,'
      
        #9'datadetail_2.item AS Politics_faceitem, datadetail_3.item AS ed' +
        'ucationitem, datadetail_4.item AS marriageitem, datadetail_5.ite' +
        'm AS Positionitem,dbo.employeemsg.status,'
      '                salaryaccount.accountname as wagetypename,'
      
        #9'case when attendance=0 then '#39#21542#39' when attendance=1 then '#39#26159#39' end ' +
        'attendancename,'
      
        #9'case  when IsKeyPostiton=1 then '#39#26159#39'  else '#39#21542#39' end IsKeyPostiton' +
        ','
      #9'datadetail_6.item as source, '
      'datadetail_7.item as station,'
      'employeemsg.recognizor,'
      'employeemsg.recognizor_Phone,'
      'employeemsg.E_people_relation,'
      'employeemsg.starlevel,employeemsg.remark,province_ptr,'
      'datadetail_8.memo as prinvicename,'
      'employeemsg.public_accumulation_funds,'
      'employeemsg.siaccountno,'
      'employeemsg.serious_mistake,'
      'employeemsg.multi_ability,'
      'datadetail_5.user_defined2,'
      'emp_contract2.contractcount2 as contractcount,'
      
        '    case  when isnull(isnull(emp_contract2.contractcount2,0)-dat' +
        'adetail_5.user_defined2,0)>0'
      ' then '#39#21512#21516#25968#36229#38480#39
      '  when  isnull(emp_contract.contractcount,0)>0 then '#39#27491#24120#39
      'else '#39#26242#26080#39' end as emp_contract_flag,'
      
        'case when  datediff(month ,getdate(),iDCardtime) <=1  then '#39#36523#20221#35777#24555 +
        #36807#26399#39' else '#39#27491#24120#39' end as IDCardFlag,'
      
        'adate,dbo.employeemsg.pgrade,PGrade.item as pGradeItem,DGrade9.i' +
        'tem  as Dgrade , keyPID,employeemsg.printdate'
      'FROM dbo.employeemsg LEFT JOIN'
      
        #9'dbo.datadetail AS datadetail_4 ON dbo.employeemsg.marriage = da' +
        'tadetail_4.rkey LEFT JOIN'
      
        #9'dbo.datadetail AS datadetail_3 ON dbo.employeemsg.education = d' +
        'atadetail_3.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_5 ON dbo.employeemsg.Position = da' +
        'tadetail_5.rkey LEFT JOIN'
      
        #9'dbo.datadetail AS datadetail_2 ON dbo.employeemsg.Politics_face' +
        ' = datadetail_2.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_6 ON dbo.employeemsg.source = data' +
        'detail_6.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_7 ON dbo.employeemsg.station = dat' +
        'adetail_7.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_1 ON dbo.employeemsg.Rank = datade' +
        'tail_1.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_8 ON dbo.employeemsg.province_ptr ' +
        '= datadetail_8.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS DGrade9 ON dbo.employeemsg.DGrade_ptr = DGrad' +
        'e9.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS PGrade ON dbo.employeemsg.PGrade = PGrade.rke' +
        'y LEFT  JOIN'
      
        #9'dbo.datadetail ON dbo.employeemsg.employ_type = dbo.datadetail.' +
        'rkey '
      
        '   LEFT  JOIN'#9'dbo.datadepartment ON dbo.employeemsg.departmentid' +
        ' = dbo.datadepartment.rkey '
      
        '  left join salaryaccount on employeemsg.wagetype= salaryaccount' +
        '.rkey'
      
        '  left join ( select  employeeid,count(employeeid)as contractcou' +
        'nt from dbo.employee_contract '
      'where  getdate() between dateadd(day,-2,startdate) and enddate'
      '  group by employeeid) as emp_contract on '
      #9'employeemsg.rkey=emp_contract.employeeid'
      
        '  left join ( select  employeeid,count(employeeid)as contractcou' +
        'nt2 from dbo.employee_contract '
      'where   getdate()<= enddate'
      '  group by employeeid) as emp_contract2 on '
      #9'employeemsg.rkey=emp_contract2.employeeid'
      'WHERE    ( status=1  or status=0) '
      '')
    Left = 456
    Top = 128
    object atncfld_EMPrkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_EMPchinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object qry_EMPemployeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object intgrfld_EMPdepartmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object qry_EMPLanguages: TWideStringField
      FieldName = 'Languages'
      Size = 10
    end
    object qry_EMPondutytime: TStringField
      FieldName = 'ondutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qry_EMPoutdutytime: TStringField
      FieldName = 'outdutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object intgrfld_EMPemploy_type: TIntegerField
      FieldName = 'employ_type'
    end
    object intgrfld_EMPPosition: TIntegerField
      FieldName = 'Position'
    end
    object intgrfld_EMPRank: TIntegerField
      FieldName = 'Rank'
    end
    object intgrfld_EMPPolitics_face: TIntegerField
      FieldName = 'Politics_face'
    end
    object intgrfld_EMPeducation: TIntegerField
      FieldName = 'education'
    end
    object intgrfld_EMPmarriage: TIntegerField
      FieldName = 'marriage'
    end
    object intgrfld_EMPsex: TIntegerField
      FieldName = 'sex'
    end
    object qry_EMPage: TWideStringField
      FieldName = 'age'
      ReadOnly = True
      Size = 22
    end
    object qry_EMPworkage: TWideStringField
      FieldName = 'workage'
      ReadOnly = True
      Size = 22
    end
    object qry_EMPsextext: TStringField
      FieldName = 'sextext'
      ReadOnly = True
      Size = 2
    end
    object qry_EMPaddr: TWideStringField
      FieldName = 'addr'
      Size = 80
    end
    object qry_EMPprovince: TWideStringField
      FieldName = 'province'
    end
    object qry_EMPIDCard: TWideStringField
      FieldName = 'IDCard'
    end
    object qry_EMPCardno: TStringField
      FieldName = 'Cardno'
    end
    object qry_EMPphone: TWideStringField
      FieldName = 'phone'
    end
    object intgrfld_EMPattendance: TIntegerField
      FieldName = 'attendance'
    end
    object intgrfld_EMPwagetype: TIntegerField
      FieldName = 'wagetype'
    end
    object qry_EMProomcode: TWideStringField
      FieldName = 'roomcode'
    end
    object qry_EMPnation: TWideStringField
      FieldName = 'nation'
    end
    object qry_EMPbirthday: TStringField
      FieldName = 'birthday'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object qry_EMPblood_type: TWideStringField
      FieldName = 'blood_type'
      FixedChar = True
      Size = 10
    end
    object intgrfld_EMPHeight: TIntegerField
      FieldName = 'Height'
    end
    object qry_EMPgraduatedschool: TWideStringField
      FieldName = 'graduatedschool'
    end
    object qry_EMPmajorsubject: TWideStringField
      FieldName = 'majorsubject'
    end
    object qry_EMPiDCardtime: TDateTimeField
      FieldName = 'iDCardtime'
    end
    object qry_EMPsicardno: TStringField
      FieldName = 'sicardno'
    end
    object qry_EMPResidencepermit: TStringField
      FieldName = 'Residencepermit'
    end
    object qry_EMPbankaccount: TStringField
      FieldName = 'bankaccount'
    end
    object qry_EMPbankname: TWideStringField
      FieldName = 'bankname'
    end
    object qry_EMPcontactpersonname: TWideStringField
      FieldName = 'contactpersonname'
    end
    object qry_EMPcontactpersontel: TWideStringField
      FieldName = 'contactpersontel'
    end
    object qry_EMPcontactpersonaddr: TWideStringField
      FieldName = 'contactpersonaddr'
    end
    object qry_EMPrecommendpersonname: TWideStringField
      FieldName = 'recommendpersonname'
    end
    object qry_EMPrecommendpersontel: TWideStringField
      FieldName = 'recommendpersontel'
    end
    object qry_EMPrecommendaddr: TWideStringField
      FieldName = 'recommendaddr'
    end
    object qry_EMPrecommendworkplace: TWideStringField
      FieldName = 'recommendworkplace'
    end
    object qry_EMPGraduateTime: TWideStringField
      FieldName = 'GraduateTime'
    end
    object qry_EMPdepartmentcode: TWideStringField
      FieldName = 'departmentcode'
    end
    object qry_EMPdepartmentname: TWideStringField
      FieldName = 'departmentname'
    end
    object intgrfld_EMPsuperior: TIntegerField
      FieldName = 'superior'
    end
    object atncfld_EMPrkeydep: TAutoIncField
      FieldName = 'rkeydep'
      ReadOnly = True
    end
    object qry_EMPemploy_typeitem: TWideStringField
      FieldName = 'employ_typeitem'
    end
    object qry_EMPRankitem: TWideStringField
      FieldName = 'Rankitem'
    end
    object qry_EMPPolitics_faceitem: TWideStringField
      FieldName = 'Politics_faceitem'
    end
    object qry_EMPeducationitem: TWideStringField
      FieldName = 'educationitem'
    end
    object qry_EMPmarriageitem: TWideStringField
      FieldName = 'marriageitem'
    end
    object qry_EMPPositionitem: TWideStringField
      FieldName = 'Positionitem'
    end
    object qry_EMPwagetypename: TWideStringField
      FieldName = 'wagetypename'
      Size = 50
    end
    object qry_EMPattendancename: TStringField
      FieldName = 'attendancename'
      ReadOnly = True
      Size = 2
    end
    object qry_EMPsource: TWideStringField
      FieldName = 'source'
    end
    object qry_EMPstation: TWideStringField
      FieldName = 'station'
    end
    object qry_EMPrecognizor: TWideStringField
      FieldName = 'recognizor'
    end
    object qry_EMPrecognizor_Phone: TWideStringField
      FieldName = 'recognizor_Phone'
    end
    object qry_EMPE_people_relation: TWideStringField
      FieldName = 'E_people_relation'
    end
    object intgrfld_EMPstarlevel: TIntegerField
      FieldName = 'starlevel'
    end
    object qry_EMPremark: TWideStringField
      FieldName = 'remark'
      Size = 200
    end
    object intgrfld_EMPprovince_ptr: TIntegerField
      FieldName = 'province_ptr'
    end
    object qry_EMPprinvicename: TWideStringField
      FieldName = 'prinvicename'
      Size = 200
    end
    object qry_EMPpublic_accumulation_funds: TWideStringField
      FieldName = 'public_accumulation_funds'
    end
    object qry_EMPsiaccountno: TWideStringField
      FieldName = 'siaccountno'
    end
    object intgrfld_EMPserious_mistake: TIntegerField
      FieldName = 'serious_mistake'
    end
    object qry_EMPmulti_ability: TWideStringField
      FieldName = 'multi_ability'
      Size = 50
    end
    object intgrfld_EMPuser_defined2: TIntegerField
      FieldName = 'user_defined2'
    end
    object wdstrngfld_EMPpGradeItem: TWideStringField
      FieldName = 'pGradeItem'
      Size = 50
    end
    object intgrfld_EMPcontractcount: TIntegerField
      FieldName = 'contractcount'
      ReadOnly = True
    end
    object qry_EMPemp_contract_flag: TStringField
      FieldName = 'emp_contract_flag'
      ReadOnly = True
      Size = 10
    end
    object intgrfld_EMPID: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ID'
      OnGetText = intgrfld_EMPIDGetText
      Calculated = True
    end
    object qry_EMPLsight: TBCDField
      FieldName = 'Lsight'
      Precision = 18
      Size = 1
    end
    object qry_EMPRsight: TBCDField
      FieldName = 'Rsight'
      Precision = 18
      Size = 1
    end
    object qry_EMPformal: TStringField
      FieldName = 'formal'
    end
    object qry_EMPstatus2: TStringField
      FieldName = 'status2'
      ReadOnly = True
      Size = 6
    end
    object qry_EMPIDCardFlag: TStringField
      FieldName = 'IDCardFlag'
      ReadOnly = True
      Size = 12
    end
    object qry_EMPstatus: TWordField
      FieldName = 'status'
    end
    object dtmfld_EMPadate: TDateTimeField
      FieldName = 'adate'
    end
    object intgrfld_EMPpgrade: TIntegerField
      FieldName = 'pgrade'
    end
    object wdstrngfld_EMPDgrade: TWideStringField
      FieldName = 'Dgrade'
      Size = 50
    end
    object qry_EMPIsKeyPostiton: TStringField
      FieldName = 'IsKeyPostiton'
      ReadOnly = True
      Size = 2
    end
    object qry_EMPkeyPID: TIntegerField
      FieldName = 'keyPID'
    end
    object qry_EMPprintdate: TDateTimeField
      DisplayLabel = #36716#27491#25253#21578#25171#21360#26102#38388
      FieldName = 'printdate'
    end
  end
  object qry_EMP_1: TADOQuery
    Connection = FDM.con1
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    Parameters = <
      item
        Name = 'rkeymsg'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT     rkey, chinesename, employeecode, departmentid, onduty' +
        'time, outdutytime, employ_type, Position, Rank, Politics_face, e' +
        'ducation, marriage, sex, addr, '
      
        '                      province, IDCard, Cardno, phone, attendanc' +
        'e, wagetype, roomcode, nation, photo, resume, others_contacts, b' +
        'irthday, status, classgroupid, blood_type, '
      
        '                      Height, graduatedschool, majorsubject, iDC' +
        'ardtime, sicardno, Residencepermit, bankaccount, bankname, conta' +
        'ctpersonname, contactpersontel, '
      
        '                      contactpersonaddr, recommendpersonname, re' +
        'commendpersontel, recommendaddr, recommendworkplace, GraduateTim' +
        'e,Languages,station,source,  '
      
        'case when wagetype=9 then '#39#26085#34218#24080#39'  when wagetype=10 then '#39#26376#34218'5.5'#39' w' +
        'hen wagetype=11 then '#39#26376#34218'6'#39'  end wagetypename,'
      
        'case when attendance=0 then '#39#21542#39' when attendance=1 then '#39#26159#39' end a' +
        'ttendancename ,employeemsg.recognizor,employeemsg.recognizor_Pho' +
        'ne,'
      
        'employeemsg.E_people_relation,employeemsg.starlevel,employeemsg.' +
        'remark,province_ptr,employeemsg.public_accumulation_funds,'
      
        'employeemsg.siaccountno,employeemsg.serious_mistake,employeemsg.' +
        'multi_ability,frist_RKEY'
      'FROM   dbo.employeemsg'
      'Where rkey=:rkeymsg')
    Left = 32
    Top = 288
    object atncfld_msg_1rkey: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object qry_EMP_1chinesename: TWideStringField
      FieldName = 'chinesename'
    end
    object intgrfld_msg_1departmentid: TIntegerField
      FieldName = 'departmentid'
    end
    object qry_EMP_1ondutytime: TDateTimeField
      FieldName = 'ondutytime'
    end
    object qry_EMP_1outdutytime: TDateTimeField
      FieldName = 'outdutytime'
    end
    object intgrfld_msg_1employ_type: TIntegerField
      FieldName = 'employ_type'
    end
    object intgrfld_msg_1Position: TIntegerField
      FieldName = 'Position'
    end
    object intgrfld_msg_1Rank: TIntegerField
      FieldName = 'Rank'
    end
    object intgrfld_msg_1Politics_face: TIntegerField
      FieldName = 'Politics_face'
    end
    object intgrfld_msg_1education: TIntegerField
      FieldName = 'education'
    end
    object intgrfld_msg_1marriage: TIntegerField
      FieldName = 'marriage'
    end
    object intgrfld_msg_1sex: TIntegerField
      FieldName = 'sex'
    end
    object qry_EMP_1addr: TWideStringField
      FieldName = 'addr'
      Size = 50
    end
    object qry_EMP_1province: TWideStringField
      FieldName = 'province'
    end
    object qry_EMP_1IDCard: TWideStringField
      FieldName = 'IDCard'
    end
    object qry_EMP_1Cardno: TWideStringField
      FieldName = 'Cardno'
      FixedChar = True
      Size = 10
    end
    object qry_EMP_1phone: TWideStringField
      FieldName = 'phone'
    end
    object intgrfld_msg_1attendance: TIntegerField
      FieldName = 'attendance'
    end
    object intgrfld_msg_1wagetype: TIntegerField
      FieldName = 'wagetype'
    end
    object qry_EMP_1roomcode: TWideStringField
      FieldName = 'roomcode'
    end
    object qry_EMP_1nation: TWideStringField
      FieldName = 'nation'
    end
    object qry_EMP_1photo: TBlobField
      FieldName = 'photo'
    end
    object qry_EMP_1resume: TMemoField
      FieldName = 'resume'
      BlobType = ftMemo
    end
    object qry_EMP_1others_contacts: TWideStringField
      FieldName = 'others_contacts'
    end
    object qry_EMP_1birthday: TDateTimeField
      FieldName = 'birthday'
    end
    object qry_EMP_1status: TWordField
      FieldName = 'status'
    end
    object intgrfld_msg_1classgroupid: TIntegerField
      FieldName = 'classgroupid'
    end
    object qry_EMP_1blood_type: TWideStringField
      FieldName = 'blood_type'
      FixedChar = True
      Size = 10
    end
    object intgrfld_msg_1Height: TIntegerField
      FieldName = 'Height'
    end
    object qry_EMP_1graduatedschool: TWideStringField
      FieldName = 'graduatedschool'
    end
    object qry_EMP_1majorsubject: TWideStringField
      FieldName = 'majorsubject'
    end
    object qry_EMP_1iDCardtime: TDateTimeField
      FieldName = 'iDCardtime'
    end
    object qry_EMP_1sicardno: TStringField
      FieldName = 'sicardno'
    end
    object qry_EMP_1Residencepermit: TStringField
      FieldName = 'Residencepermit'
    end
    object qry_EMP_1bankaccount: TStringField
      FieldName = 'bankaccount'
      Size = 30
    end
    object qry_EMP_1bankname: TWideStringField
      FieldName = 'bankname'
    end
    object qry_EMP_1contactpersonname: TWideStringField
      FieldName = 'contactpersonname'
    end
    object qry_EMP_1contactpersontel: TWideStringField
      FieldName = 'contactpersontel'
    end
    object qry_EMP_1contactpersonaddr: TWideStringField
      FieldName = 'contactpersonaddr'
    end
    object qry_EMP_1recommendpersonname: TWideStringField
      FieldName = 'recommendpersonname'
    end
    object qry_EMP_1recommendpersontel: TWideStringField
      FieldName = 'recommendpersontel'
    end
    object qry_EMP_1recommendaddr: TWideStringField
      FieldName = 'recommendaddr'
    end
    object qry_EMP_1recommendworkplace: TWideStringField
      FieldName = 'recommendworkplace'
    end
    object qry_EMP_1GraduateTime: TWideStringField
      FieldName = 'GraduateTime'
      FixedChar = True
      Size = 10
    end
    object qry_EMP_1Languages: TWideStringField
      FieldName = 'Languages'
      Size = 10
    end
    object qry_EMP_1wagetypename: TStringField
      FieldName = 'wagetypename'
      ReadOnly = True
      Size = 7
    end
    object qry_EMP_1attendancename: TStringField
      FieldName = 'attendancename'
      ReadOnly = True
      Size = 8
    end
    object intgrfld_msg_1station: TIntegerField
      FieldName = 'station'
    end
    object intgrfld_msg_1source: TIntegerField
      FieldName = 'source'
    end
    object qry_EMP_1recognizor: TWideStringField
      FieldName = 'recognizor'
    end
    object qry_EMP_1recognizor_Phone: TWideStringField
      FieldName = 'recognizor_Phone'
    end
    object qry_EMP_1E_people_relation: TWideStringField
      FieldName = 'E_people_relation'
    end
    object intgrfld_msg_1starlevel: TIntegerField
      FieldName = 'starlevel'
    end
    object qry_EMP_1employeecode: TWideStringField
      FieldName = 'employeecode'
    end
    object qry_EMP_1remark: TWideStringField
      FieldName = 'remark'
      Size = 200
    end
    object intgrfld_msg_1province_ptr: TIntegerField
      FieldName = 'province_ptr'
    end
    object qry_EMP_1public_accumulation_funds: TWideStringField
      FieldName = 'public_accumulation_funds'
    end
    object qry_EMP_1siaccountno: TWideStringField
      FieldName = 'siaccountno'
    end
    object intgrfld_msg_1serious_mistake: TIntegerField
      FieldName = 'serious_mistake'
    end
    object intgrfld_msg_1frist_RKEY: TIntegerField
      FieldName = 'frist_RKEY'
    end
    object qry_EMP_1multi_ability: TWideStringField
      FieldName = 'multi_ability'
      Size = 50
    end
  end
  object pm_field: TPopupMenu
    Left = 308
    Top = 89
  end
  object pm_Main: TPopupMenu
    AutoHotkeys = maManual
    Left = 336
    Top = 217
    object mniAdd: TMenuItem
      Tag = 1
      Caption = #26032#22686
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Tag = 2
      Caption = #32534#36753
      OnClick = mniAddClick
    end
    object mniBrowser: TMenuItem
      Tag = 3
      Caption = #26597#30475
      OnClick = mniAddClick
    end
    object mniEmpChangeInfo: TMenuItem
      Tag = 4
      Caption = #26597#30475#20154#20107#21464#21160#20449#24687
      OnClick = mniEmpChangeInfoClick
    end
    object mniResumePrint: TMenuItem
      Tag = 5
      Caption = #25171#21360#31616#21382
      OnClick = mniResumePrintClick
    end
    object mniDel: TMenuItem
      Tag = 6
      Caption = #21024#38500
      OnClick = mniDelClick
    end
    object mniN_Audit: TMenuItem
      Tag = 7
      Caption = #23457#26680'('#21487#22810#36873')'
      OnClick = mniN_AuditClick
    end
    object mni_AudiModi: TMenuItem
      Tag = 9
      Caption = #23457#26680#21518#20462#25913#36164#26009
      OnClick = mniAddClick
    end
    object mnil_formal: TMenuItem
      Tag = 8
      Caption = #36716#27491'('#21487#22810#36873')'
      OnClick = mnil_formalClick
    end
    object N1: TMenuItem
      Caption = #36523#20221#35777#36807#26399#26126#32454
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #31038#20445#21040#26399#26597#35810
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #35797#29992#26399#39044#35686
      OnClick = N3Click
    end
    object N_Pulishment: TMenuItem
      Caption = #22870#24809#26126#32454
      OnClick = N_PulishmentClick
    end
    object mniPBCode: TMenuItem
      Caption = #25171#21360#24037#21495#26465#30721
      OnClick = mniPBCodeClick
    end
    object mniN4: TMenuItem
      Caption = #24037#21495#26465#30721#35774#35745
      Visible = False
      OnClick = mniN4Click
    end
    object N4: TMenuItem
      Caption = #25171#21360#36716#27491#25253#21578
      OnClick = N4Click
    end
  end
  object il1: TImageList
    Left = 88
    Top = 56
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
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
      0000000000000000000000000000C6C6C600B5B5B500A5A5A5009C9C9C00A5A5
      A500B5B5B500000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600BDBDBD00B5B5B500B5B5B500B5B5B500B5B5B500BDBDBD00BDBD
      BD00C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009C9C940094633900A56B4200A56B4200A56B42009C6B
      4200A56B4200735A4A00BDBDBD00000000000000000000000000C6C6C600ADAD
      AD00949494006B6B6B004A4A4A0042424200424242004A4A4A00636363008C8C
      8C0094949400B5B5B500C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BDBDBD00BDBDBD009C6B4A009C6331009C6331009C633100A56B42009C5A
      3100945A29007B5231007B6B6300000000000000000000000000BDBDBD005A42
      3100947352008C7352008C7352007B5A4200846B4A00846B4A00846B4A008463
      42005239290094949400C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000000393939005A5A
      5A000000000000000000BDBDBD00949494003139390073737300B5B5B500C6C6
      C6000000000000000000000000000000000000000000C6C6C600ADADAD004A5A
      5A0039525200394A3900A56B39009C5A3100A5633100A5632900BDA58C00A563
      31009C633100845229007B5A4200000000000000000000000000636363008C73
      520094735A00947B5A00947B5A00846B5200A58C73008C73520084634A008463
      4A007B6342004A4A4A00C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000000F7F7F700ADAD
      AD006B6B6B0039424A00526B7B00849CB5007394AD007B94B500738CA5004A63
      730031424A0039424200848484000000000000000000A5A5A50029736B000063
      5A0000635A0000635200B57B4A00AD6B3100B56B3100B5734200EFE7DE00AD6B
      3100A56331009C63310084736B000000000000000000000000007B7B7B00947B
      5A009C7B63009C846300A5846B00A5948400CEBDAD0094735200F7F7EF008C6B
      4A008C6B4A0063636300C6C6C600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000000F7F7F700949C
      9C00637B9400738CA5007394A50063849C00425A6B005263730039424A00424A
      52004A525A00525A6300293139000000000000000000315A5A0000524A00086B
      5A00086B6300006B63009C633100AD6B3100BD845200B59C8400B5B5B5009C63
      3900A5633100AD734A0000000000000000000000000000000000000000007363
      5A00A5846B00AD8C7300A58C6B00FFFFFF00FFFFFF009C8463009C7B63009473
      5A0042312900C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000000FFFFFF00A5A5
      A50094ADC6009CB5CE0094ADBD007B8CA500849CB5008CA5B50063738400C6C6
      C600000000000000000000000000000000000000000039635A00006B5A00086B
      630008736B0008736B0000736B00AD6B39003184AD0039A5E70039A5E700299C
      DE008C634A00B5B5B5000000000000000000000000000000000000000000C6C6
      C600524A4200C6AD94008C735A00000010000000080063524200947363003129
      2100BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0000000800FFFFFF00ADA5
      A500B5C6DE00BDCEE700BDCEE700BDD6E700D6E7EF00DEE7F7006B7B8400C6C6
      C60000000000000000000000000000000000000000008C8C8C00218473000873
      6B000873630008635A0008635A0000739400319CE70042A5E70042A5E7002194
      DE00319CE7000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B001073D6000831630008315A00105AAD0052525200C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ADADAD0018181800ADADAD007B7B
      7B00848C8C00B5B5B500B5B5B500ADADAD00737B7B007B7B7B00000000000000
      000000000000000000000000000000000000000000000000000021525200187B
      730008526300185A8C00185A84002994D6005AADE7007BC6EF0073BDEF0042A5
      E70039A5E700C6C6C60000000000000000000000000000000000000000000000
      0000C6C6C60021314A001073CE0008427B0008427B00106BC60018294200B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000842
      6300186B9C00186B9C0010639400298CCE0063B5EF009CD6F70084C6EF004AAD
      E70039A5E7000000000000000000000000000000000000000000000000000000
      0000C6C6C60008294A00187BD600187BCE00187BCE001873D60000213900B5B5
      B500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002973
      A5003184B500398CC600297BB500106B9C0063BDEF006BB5EF0063B5EF0039A5
      E700297BB5000000000000000000000000000000000000000000000000000000
      000000000000081010002184E700218CEF00218CE700187BDE0000000800BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000317B
      B5004294CE005AADE700398CC600186BA50018639400318CCE00319CDE00527B
      9400000000000000000000000000000000000000000000000000000000000000
      000000000000292929000000000000000000000000000000000029292900C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002163
      9400318CBD004294CE003184BD00186B9C00526B7B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600216394003184B5002973A500315A73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000737373007373730000000000000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000FFFFFE07E0030000
      FFFFFC01C0010000FFFFF001C00100000C0F8001C001000000018001C0010000
      00018003E0030000000F8003E0070000000F8007F80F0000003FC003F00F0000
      FFFFE007F00F0000FFFFE007F80F0000FFFFE00FF80F0000FFFFE07FFC1F0000
      FFFFE0FFFE7F0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object qry_EmpAll: TADOQuery
    Connection = FDM.con1
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT   dbo.employeemsg. Lsight, dbo.employeemsg.Rsight,      d' +
        'bo.employeemsg.rkey,dbo.employeemsg.chinesename, '
      
        'case when formal=0 then '#39#26410#36716#27491#39' when  formal=1   then '#39#24050#36716#27491#21512#26684#39'     ' +
        ' when formal =2  then '#39#24050#36716#27491#19981#21512#26684#39' when formal = 3 then '#39#26410#36716#27491'('#36716#27491#19981#35843#34218')'#39 +
        '      end as formal,'
      
        'case when status=0 then '#39#26410#23457#26680#39' when  status=1   then '#39#22312#32844#39'      wh' +
        'en status=2  then '#39#31163#32844#39'      end as status2,'
      'dbo.employeemsg.employeecode, dbo.employeemsg.departmentid,'
      
        'employeemsg.Languages,convert(char(10),dbo.employeemsg.ondutytim' +
        'e,20) as ondutytime, convert(char(10),'
      
        #9'dbo.employeemsg.outdutytime,20) as outdutytime, dbo.employeemsg' +
        '.employ_type, dbo.employeemsg.Position, '
      
        #9'dbo.employeemsg.Rank,dbo.employeemsg.Politics_face, dbo.employe' +
        'emsg.education, dbo.employeemsg.marriage, dbo.employeemsg.sex,'
      
        'cast ( ((datediff(month,birthday,getdate())-case when day(birthd' +
        'ay)>day(getdate()) then 1 else 0 end)/12) as nvarchar(10))+'#39'.'#39
      
        '+case when ( (datediff(month,birthday,getdate())-case when day(b' +
        'irthday)>day(getdate()) then 1 else 0 end)%12)<10  then '#39'0'#39' else' +
        ' '#39#39' end '
      
        '+cast( ( (datediff(month,birthday,getdate())-case when day(birth' +
        'day)>day(getdate()) then 1 else 0 end)%12) as nvarchar(10))   as' +
        ' age,'
      'cast ( ((datediff(month,ondutytime,getdate())-  '
      
        'case when day(ondutytime)>day(getdate()) then 1 else 0 end)/12) ' +
        ' '
      'as nvarchar(10))+'#39#24180#39'+  '
      'cast(  '
      ' ( (datediff(month,ondutytime,getdate())-  '
      
        'case when day(ondutytime)>day(getdate()) then 1 else 0 end)%12) ' +
        ' '
      'as nvarchar(10))+'#39#26376#39'+  '
      'cast(  '
      '(case when   '
      
        'dateadd(month,datediff(month,ondutytime,getdate()),ondutytime)>g' +
        'etdate()    '
      'then day(getdate())+     '
      
        ' (datediff(day,ondutytime, dateadd(month,1,convert(datetime,(sub' +
        'string(convert (nvarchar(20),ondutytime,120),1,7)+'#39'-01'#39'),120) ) ' +
        ')-1)  '
      'else day(getdate())-day(ondutytime) end)  '
      ' as nvarchar(10))+'#39#22825#39'  as workage,'
      
        #9'CASE employeemsg.sex WHEN 0 THEN '#39#22899#39' WHEN 1 THEN '#39#30007#39' END AS sex' +
        'text, dbo.employeemsg.addr,'
      
        #9'dbo.employeemsg.province, dbo.employeemsg.IDCard, dbo.employeem' +
        'sg.Cardno, dbo.employeemsg.phone, dbo.employeemsg.attendance,'
      
        #9'dbo.employeemsg.wagetype, dbo.employeemsg.roomcode, dbo.employe' +
        'emsg.nation, convert(char(10),dbo.employeemsg.birthday,20) as bi' +
        'rthday,'
      
        #9'blood_type,Height,graduatedschool, majorsubject, iDCardtime, si' +
        'cardno, Residencepermit, bankaccount, bankname, contactpersonnam' +
        'e, contactpersontel,'
      
        #9'contactpersonaddr, recommendpersonname, recommendpersontel, rec' +
        'ommendaddr, recommendworkplace, GraduateTime,'
      
        #9'dbo.datadepartment.departmentcode, dbo.datadepartment.departmen' +
        'tname, dbo.datadepartment.superior, dbo.datadepartment.rkey AS r' +
        'keydep, '
      
        #9'dbo.datadetail.item AS employ_typeitem, datadetail_1.item AS Ra' +
        'nkitem,'
      
        #9'datadetail_2.item AS Politics_faceitem, datadetail_3.item AS ed' +
        'ucationitem, datadetail_4.item AS marriageitem, datadetail_5.ite' +
        'm AS Positionitem,dbo.employeemsg.status,'
      '                salaryaccount.accountname as wagetypename,'
      
        #9'case when attendance=0 then '#39#21542#39' when attendance=1 then '#39#26159#39' end ' +
        'attendancename,'
      
        #9'case  when IsKeyPostiton=1 then '#39#26159#39'  else '#39#21542#39' end IsKeyPostiton' +
        ','
      #9'datadetail_6.item as source, '
      'datadetail_7.item as station,'
      'employeemsg.recognizor,'
      'employeemsg.recognizor_Phone,'
      'employeemsg.E_people_relation,'
      'employeemsg.starlevel,employeemsg.remark,province_ptr,'
      'datadetail_8.memo as prinvicename,'
      'employeemsg.public_accumulation_funds,'
      'employeemsg.siaccountno,'
      'employeemsg.serious_mistake,'
      'employeemsg.multi_ability,'
      'datadetail_5.user_defined2,'
      'emp_contract2.contractcount2 as contractcount,'
      
        '    case  when isnull(isnull(emp_contract2.contractcount2,0)-dat' +
        'adetail_5.user_defined2,0)>0'
      ' then '#39#21512#21516#25968#36229#38480#39
      '  when  isnull(emp_contract.contractcount,0)>0 then '#39#27491#24120#39
      'else '#39#26242#26080#39' end as emp_contract_flag,'
      
        'case when  datediff(month ,getdate(),iDCardtime) =1  then '#39#36523#20221#35777#24555#36807 +
        #26399#39' else '#39#27491#24120#39' end as IDCardFlag,adate,'
      
        'dbo.employeemsg.pgrade,PGrade.item as PGRadeItem,DGrade9.item as' +
        ' Dgrade, KeyPID,employeemsg.printdate'
      'FROM dbo.employeemsg LEFT JOIN'
      
        #9'dbo.datadetail AS datadetail_4 ON dbo.employeemsg.marriage = da' +
        'tadetail_4.rkey LEFT JOIN'
      
        #9'dbo.datadetail AS datadetail_3 ON dbo.employeemsg.education = d' +
        'atadetail_3.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_5 ON dbo.employeemsg.Position = da' +
        'tadetail_5.rkey LEFT JOIN'
      
        #9'dbo.datadetail AS datadetail_2 ON dbo.employeemsg.Politics_face' +
        ' = datadetail_2.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_6 ON dbo.employeemsg.source = data' +
        'detail_6.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_7 ON dbo.employeemsg.station = dat' +
        'adetail_7.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_1 ON dbo.employeemsg.Rank = datade' +
        'tail_1.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS datadetail_8 ON dbo.employeemsg.province_ptr ' +
        '= datadetail_8.rkey LEFT  JOIN'
      
        #9'dbo.datadetail AS DGrade9 ON dbo.employeemsg.DGrade_ptr = DGrad' +
        'e9.rkey LEFT  JOIN'
      
        'dbo.datadetail AS PGrade ON dbo.employeemsg.PGrade = PGrade.rkey' +
        ' LEFT  JOIN'
      
        #9'dbo.datadetail ON dbo.employeemsg.employ_type = dbo.datadetail.' +
        'rkey '
      
        '   LEFT  JOIN'#9'dbo.datadepartment ON dbo.employeemsg.departmentid' +
        ' = dbo.datadepartment.rkey '
      
        '  left join salaryaccount on employeemsg.wagetype= salaryaccount' +
        '.rkey'
      
        '  left join ( select  employeeid,count(employeeid)as contractcou' +
        'nt from dbo.employee_contract '
      'where  getdate() between dateadd(day,-2,startdate) and enddate'
      '  group by employeeid) as emp_contract on '
      #9'employeemsg.rkey=emp_contract.employeeid'
      
        '  left join ( select  employeeid,count(employeeid)as contractcou' +
        'nt2 from dbo.employee_contract '
      'where   getdate()<= enddate'
      '  group by employeeid) as emp_contract2 on '
      #9'employeemsg.rkey=emp_contract2.employeeid'
      'WHERE  1=1 ')
    Left = 520
    Top = 136
    object AutoIncField1: TAutoIncField
      FieldName = 'rkey'
      ReadOnly = True
    end
    object WideStringField1: TWideStringField
      FieldName = 'chinesename'
    end
    object WideStringField2: TWideStringField
      FieldName = 'employeecode'
    end
    object IntegerField1: TIntegerField
      FieldName = 'departmentid'
    end
    object WideStringField3: TWideStringField
      FieldName = 'Languages'
      Size = 10
    end
    object StringField1: TStringField
      FieldName = 'ondutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object StringField2: TStringField
      FieldName = 'outdutytime'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object IntegerField2: TIntegerField
      FieldName = 'employ_type'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Position'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Rank'
    end
    object IntegerField5: TIntegerField
      FieldName = 'Politics_face'
    end
    object IntegerField6: TIntegerField
      FieldName = 'education'
    end
    object IntegerField7: TIntegerField
      FieldName = 'marriage'
    end
    object IntegerField8: TIntegerField
      FieldName = 'sex'
    end
    object WideStringField4: TWideStringField
      FieldName = 'age'
      ReadOnly = True
      Size = 22
    end
    object WideStringField5: TWideStringField
      FieldName = 'workage'
      ReadOnly = True
      Size = 22
    end
    object StringField3: TStringField
      FieldName = 'sextext'
      ReadOnly = True
      Size = 2
    end
    object WideStringField6: TWideStringField
      FieldName = 'addr'
      Size = 80
    end
    object WideStringField7: TWideStringField
      FieldName = 'province'
    end
    object WideStringField8: TWideStringField
      FieldName = 'IDCard'
    end
    object StringField4: TStringField
      FieldName = 'Cardno'
    end
    object WideStringField9: TWideStringField
      FieldName = 'phone'
    end
    object IntegerField9: TIntegerField
      FieldName = 'attendance'
    end
    object IntegerField10: TIntegerField
      FieldName = 'wagetype'
    end
    object WideStringField10: TWideStringField
      FieldName = 'roomcode'
    end
    object WideStringField11: TWideStringField
      FieldName = 'nation'
    end
    object StringField5: TStringField
      FieldName = 'birthday'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
    object WideStringField12: TWideStringField
      FieldName = 'blood_type'
      FixedChar = True
      Size = 10
    end
    object IntegerField11: TIntegerField
      FieldName = 'Height'
    end
    object WideStringField13: TWideStringField
      FieldName = 'graduatedschool'
    end
    object WideStringField14: TWideStringField
      FieldName = 'majorsubject'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'iDCardtime'
    end
    object StringField6: TStringField
      FieldName = 'sicardno'
    end
    object StringField7: TStringField
      FieldName = 'Residencepermit'
    end
    object StringField8: TStringField
      FieldName = 'bankaccount'
    end
    object WideStringField15: TWideStringField
      FieldName = 'bankname'
    end
    object WideStringField16: TWideStringField
      FieldName = 'contactpersonname'
    end
    object WideStringField17: TWideStringField
      FieldName = 'contactpersontel'
    end
    object WideStringField18: TWideStringField
      FieldName = 'contactpersonaddr'
    end
    object WideStringField19: TWideStringField
      FieldName = 'recommendpersonname'
    end
    object WideStringField20: TWideStringField
      FieldName = 'recommendpersontel'
    end
    object WideStringField21: TWideStringField
      FieldName = 'recommendaddr'
    end
    object WideStringField22: TWideStringField
      FieldName = 'recommendworkplace'
    end
    object WideStringField23: TWideStringField
      FieldName = 'GraduateTime'
    end
    object WideStringField24: TWideStringField
      FieldName = 'departmentcode'
    end
    object WideStringField25: TWideStringField
      FieldName = 'departmentname'
    end
    object IntegerField12: TIntegerField
      FieldName = 'superior'
    end
    object AutoIncField2: TAutoIncField
      FieldName = 'rkeydep'
      ReadOnly = True
    end
    object WideStringField26: TWideStringField
      FieldName = 'employ_typeitem'
    end
    object WideStringField27: TWideStringField
      FieldName = 'Rankitem'
    end
    object WideStringField28: TWideStringField
      FieldName = 'Politics_faceitem'
    end
    object WideStringField29: TWideStringField
      FieldName = 'educationitem'
    end
    object WideStringField30: TWideStringField
      FieldName = 'marriageitem'
    end
    object WideStringField31: TWideStringField
      FieldName = 'Positionitem'
    end
    object WideStringField32: TWideStringField
      FieldName = 'wagetypename'
      Size = 50
    end
    object StringField9: TStringField
      FieldName = 'attendancename'
      ReadOnly = True
      Size = 2
    end
    object WideStringField33: TWideStringField
      FieldName = 'source'
    end
    object WideStringField34: TWideStringField
      FieldName = 'station'
    end
    object WideStringField35: TWideStringField
      FieldName = 'recognizor'
    end
    object WideStringField36: TWideStringField
      FieldName = 'recognizor_Phone'
    end
    object WideStringField37: TWideStringField
      FieldName = 'E_people_relation'
    end
    object IntegerField13: TIntegerField
      FieldName = 'starlevel'
    end
    object WideStringField38: TWideStringField
      FieldName = 'remark'
      Size = 200
    end
    object IntegerField14: TIntegerField
      FieldName = 'province_ptr'
    end
    object WideStringField39: TWideStringField
      FieldName = 'prinvicename'
      Size = 200
    end
    object WideStringField40: TWideStringField
      FieldName = 'public_accumulation_funds'
    end
    object WideStringField41: TWideStringField
      FieldName = 'siaccountno'
    end
    object IntegerField15: TIntegerField
      FieldName = 'serious_mistake'
    end
    object WideStringField42: TWideStringField
      FieldName = 'multi_ability'
      Size = 50
    end
    object IntegerField16: TIntegerField
      FieldName = 'user_defined2'
    end
    object IntegerField17: TIntegerField
      FieldName = 'contractcount'
      ReadOnly = True
    end
    object StringField10: TStringField
      FieldName = 'emp_contract_flag'
      ReadOnly = True
      Size = 10
    end
    object IntegerField18: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'ID'
      OnGetText = intgrfld_EMPIDGetText
      Calculated = True
    end
    object BCDField1: TBCDField
      FieldName = 'Lsight'
      Precision = 18
      Size = 1
    end
    object BCDField2: TBCDField
      FieldName = 'Rsight'
      Precision = 18
      Size = 1
    end
    object StringField11: TStringField
      FieldName = 'formal'
    end
    object StringField12: TStringField
      FieldName = 'status2'
      ReadOnly = True
      Size = 6
    end
    object WordField1: TWordField
      FieldName = 'status'
    end
    object strngfld_EmpAllIDCardFlag: TStringField
      FieldName = 'IDCardFlag'
      ReadOnly = True
      Size = 12
    end
    object dtmfld_EmpAlladate: TDateTimeField
      FieldName = 'adate'
    end
    object intgrfld_EmpAllpgrade: TIntegerField
      FieldName = 'pgrade'
    end
    object wdstrngfld_EmpAllPGRadeItem: TWideStringField
      FieldName = 'PGRadeItem'
      Size = 50
    end
    object wdstrngfld_EmpAllDgrade: TWideStringField
      FieldName = 'Dgrade'
      Size = 50
    end
    object qry_EmpAllIsKeyPostiton: TStringField
      FieldName = 'IsKeyPostiton'
      ReadOnly = True
      Size = 2
    end
    object qry_EmpAllKeyPID: TIntegerField
      FieldName = 'KeyPID'
    end
    object qry_EmpAllprintdate: TDateTimeField
      DisplayLabel = #36716#27491#25253#21578#25171#21360#26102#38388
      FieldName = 'printdate'
    end
  end
end
