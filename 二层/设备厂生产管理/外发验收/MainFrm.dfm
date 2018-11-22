object FrmMain: TFrmMain
  Left = 281
  Top = 209
  Width = 908
  Height = 534
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = #22806#21457#39564#25910
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 47
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 317
      Top = 23
      Width = 48
      Height = 12
      Caption = #22806#21457#32534#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object LabelCount: TLabel
      Left = 496
      Top = 24
      Width = 60
      Height = 12
      Caption = 'LabelCount'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 8
      Width = 75
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
    object BitBtn2: TBitBtn
      Left = 83
      Top = 8
      Width = 75
      Height = 30
      Caption = #21047#26032
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        BE060000424DBE06000000000000360400002800000024000000120000000100
        0800000000008802000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
        0404040404040303030303030303030303FFF8F8F8F8F8F803FF030303030302
        0403030402020202020204040303030303F8F8FF03F8030303030303F8F8FF03
        030303020204040202020202020202020403030303F8FFF8F80303FFFFFFFFFF
        0303F8FF030303020202020202FAFAFAFAFA02020204030303F8FF030303FFF8
        F8F8F8F8FF0303F8FF03030202020202FA0303030303FA020202040303F8FF03
        03FFF80303030303F8FF0303F8FF03020202020203030303030303FA02020403
        03F8FF0303F803030303030303F8FF03F8FF03020202020202030303030303FA
        0404040303F8FFFFFFFFF8FF0303030303F8F8F8F80303FAFAFAFAFAFAFA0303
        030303030303030303F8F8F8F8F8F8F803030303030303030303030303030303
        030303030303030303030303030303030303030303030303FFFFFFFFFFFF0303
        030303030303030303030404040404040303FFFFFFFF030303030303F8F8F8F8
        F8F803FA040404030303030303FA02020202020403F8F8F8F8FF0303030303F8
        FF03030303F803FA02020403030303030303FA020202020403F8FF03F8FF0303
        03030303F803030303F80303FA0202040303030303040402020202040303F803
        03F8FFFFFFFFFFF8F803030303F80303FA020202040404040402020202020204
        0303F8FF0303F8F8F8F8F8030303FFFF03F8030303FA02020202020202020202
        FAFA0204030303F8FFFF030303030303FFFFF8F8FFF803030303FAFA02020202
        0202FAFA0303FA0303030303F8F8FFFFFFFFFFFFF8F80303F803030303030303
        FAFAFAFAFAFA030303030303030303030303F8F8F8F8F8F80303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303}
      NumGlyphs = 2
    end
    object BitBtn3: TBitBtn
      Left = 158
      Top = 8
      Width = 75
      Height = 30
      Caption = #23548#20986
      TabOrder = 2
      OnClick = BitBtn3Click
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
    object BitBtn4: TBitBtn
      Left = 233
      Top = 8
      Width = 75
      Height = 30
      Caption = #26597#35810
      TabOrder = 3
      OnClick = BitBtn4Click
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
    object edt_1: TEdit
      Left = 369
      Top = 17
      Width = 121
      Height = 20
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnChange = edt_1Change
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 466
    Width = 900
    Height = 41
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
  end
  object pgc1: TPageControl
    Left = 0
    Top = 47
    Width = 900
    Height = 419
    ActivePage = ts1
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 2
    OnChange = pgc1Change
    object ts1: TTabSheet
      Caption = #39564#25910#20449#24687
      object dbgrideh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 892
        Height = 388
        Align = alClient
        DataSource = DM.dsWZCP89
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        ReadOnly = True
        RowSizingAllowed = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        TitleHeight = 16
        OnDrawColumnCell = dbgrideh2DrawColumnCell
        OnGetCellParams = dbgrideh2GetCellParams
        OnKeyDown = DBGridEh1KeyDown
        OnTitleClick = dbgrideh2TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'Rec_No'
            Footers = <>
            Title.Caption = #39564#25910#32534#21495
            Width = 89
          end
          item
            EditButtons = <>
            FieldName = #39564#25910#20154#21592
            Footers = <>
            Width = 76
          end
          item
            DisplayFormat = 'yyyy-MM-dd'
            EditButtons = <>
            FieldName = 'Check_Date'
            Footers = <>
            Title.Caption = #39564#25910#26085#26399
            Width = 81
          end
          item
            EditButtons = <>
            FieldName = 'Rec_Price'
            Footers = <>
            Title.Caption = #39564#25910#20215#26684
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'Rec_Remark'
            Footers = <>
            Title.Caption = #22791#27880
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'ExTernal_No'
            Footers = <>
            Title.Caption = #22806#21457#32534#21495
            Width = 84
          end
          item
            EditButtons = <>
            FieldName = 'Cut_no'
            Footers = <>
            Title.Caption = #29983#20135#21333#21495
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'PROD_CODE'
            Footers = <>
            Title.Caption = #20135#21697#32534#30721
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'PRODUCT_NAME'
            Footers = <>
            Title.Caption = #20135#21697#21517#31216
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'Dept_Name'
            Footers = <>
            Title.Caption = #36131#20219#37096#38376
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'CUSTOMER_NAME'
            Footers = <>
            Title.Caption = #23458#25143#21517#31216
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Title.Caption = #22806#21457#20215#26684
            Width = 68
          end
          item
            DisplayFormat = 'yyyy-MM-dd'
            EditButtons = <>
            FieldName = 'Ent_Date'
            Footers = <>
            Title.Caption = #30003#35831#26085#26399
            Width = 83
          end
          item
            DisplayFormat = 'yyyy-MM-dd'
            EditButtons = <>
            FieldName = 'FinishDate'
            Footers = <>
            Title.Caption = #39044#35745#23436#24037#26085#26399
            Width = 88
          end
          item
            EditButtons = <>
            FieldName = #25552#20132#20154#21592
            Footers = <>
            Title.Caption = #30003#35831#21592#24037
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'SUPPLIER_NAME'
            Footers = <>
            Title.Caption = #20379#24212#21830#21517#31216
            Width = 97
          end
          item
            EditButtons = <>
            FieldName = 'StatusName'
            Footers = <>
            Title.Caption = #29366#24577
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = 'Remark'
            Footers = <>
            Title.Caption = #22791#27880
            Width = 113
          end
          item
            EditButtons = <>
            FieldName = #23457#26680#20154#21592
            Footers = <>
          end>
      end
    end
    object ts2: TTabSheet
      Caption = #24453#39564#25910#22806#21457#21333#27010#35272
      ImageIndex = 1
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 892
        Height = 388
        Align = alClient
        DataSource = DM.dsMain
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Microsoft Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = ANSI_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -13
        FooterFont.Name = #23435#20307
        FooterFont.Style = []
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = PopupMenu1
        ReadOnly = True
        RowSizingAllowed = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        TitleHeight = 16
        OnDrawColumnCell = DBGridEh1DrawColumnCell
        OnGetCellParams = DBGridEh1GetCellParams
        OnKeyDown = DBGridEh1KeyDown
        OnTitleClick = DBGridEh1TitleClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ExTernal_No'
            Footers = <>
            Title.Caption = #22806#21457#32534#21495
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'Cut_no'
            Footers = <>
            Title.Caption = #29983#20135#21333#21495
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'PROD_CODE'
            Footers = <>
            Title.Caption = #20135#21697#32534#30721
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'PRODUCT_NAME'
            Footers = <>
            Title.Caption = #20135#21697#21517#31216
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'Dept_Name'
            Footers = <>
            Title.Caption = #36131#20219#37096#38376
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'CUSTOMER_NAME'
            Footers = <>
            Title.Caption = #23458#25143#21517#31216
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'Price'
            Footers = <>
            Title.Caption = #22806#21457#20215#26684
            Width = 72
          end
          item
            DisplayFormat = 'yyyy-MM-dd'
            EditButtons = <>
            FieldName = 'Ent_Date'
            Footers = <>
            Title.Caption = #30003#35831#26085#26399
            Width = 95
          end
          item
            DisplayFormat = 'yyyy-MM-dd'
            EditButtons = <>
            FieldName = 'FinishDate'
            Footers = <>
            Title.Caption = #39044#35745#23436#24037#26085#26399
            Width = 95
          end
          item
            EditButtons = <>
            FieldName = #25552#20132#20154#21592
            Footers = <>
            Title.Caption = #30003#35831#21592#24037
            Width = 68
          end
          item
            EditButtons = <>
            FieldName = 'SUPPLIER_NAME'
            Footers = <>
            Title.Caption = #20379#24212#21830#21517#31216
            Width = 147
          end
          item
            EditButtons = <>
            FieldName = 'StatusName'
            Footers = <>
            Title.Caption = #29366#24577
            Width = 66
          end
          item
            EditButtons = <>
            FieldName = #23457#26680#20154#21592
            Footers = <>
          end>
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 72
    Top = 128
    object N1: TMenuItem
      Tag = 2
      Caption = #26597#30475
      OnClick = N1Click
    end
    object N2: TMenuItem
      Tag = 2
      Caption = #32467#26463#25910#36135
      OnClick = N2Click
    end
  end
end
