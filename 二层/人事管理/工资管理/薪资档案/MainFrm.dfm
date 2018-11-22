object FrmMain: TFrmMain
  Left = 209
  Top = 174
  Width = 888
  Height = 577
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = #21592#24037#34218#36164#20449#24687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 494
    Width = 880
    Height = 52
    Align = alBottom
    Anchors = [akBottom]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 880
    Height = 494
    Align = alClient
    TabOrder = 1
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 878
      Height = 49
      Align = alTop
      Anchors = [akTop]
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        878
        49)
      object Label1: TLabel
        Left = 365
        Top = 25
        Width = 59
        Height = 13
        Caption = ' '#21592#24037#24037#21495
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object lblCount: TLabel
        Left = 504
        Top = 24
        Width = 7
        Height = 13
        Font.Charset = ANSI_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object BitBtn1: TBitBtn
        Left = 8
        Top = 10
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
      object BitBtn2: TBitBtn
        Left = 78
        Top = 10
        Width = 70
        Height = 30
        Caption = #21047#26032
        TabOrder = 1
        OnClick = BitBtn2Click
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
      object BitBtn3: TBitBtn
        Left = 148
        Top = 10
        Width = 70
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
      object BitBtn5: TBitBtn
        Left = 218
        Top = 10
        Width = 70
        Height = 30
        Caption = #23383#27573
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
      object edt_1: TEdit
        Left = 429
        Top = 18
        Width = 121
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnChange = edt_1Change
      end
      object CheckBox1: TCheckBox
        Left = 707
        Top = 17
        Width = 73
        Height = 17
        Anchors = [akRight]
        Caption = #21253#25324#31163#32844
        TabOrder = 5
        OnClick = CheckBox1Click
      end
      object BitBtn8: TBitBtn
        Left = 288
        Top = 10
        Width = 70
        Height = 30
        Caption = #26597#35810
        TabOrder = 6
        OnClick = BitBtn8Click
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000520B0000520B00000001000000000000000000003300
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
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE0000000000EE
          EEEEEEEE0000000000EE8181818181EEEEEEEEEE8181818181EE00DF2B2B00EE
          EEEEEEEE00DF2B2B00EE81ACE2E281EEEEEEEEEE81ACE2E281EE00DF2B2B00EE
          EEEEEEEE00DF2B2B00EE81ACE2E281EEEEEEEEEE81ACE2E281EE000000000000
          00D700000000000000EE81818181818181D781818181818181EE00DF2B2B002B
          002B00DF002B2B2B00EE81ACE2E281E281E281AC81E2E2E281EE00DF2B2B002B
          00EE00DF002B2B2B00EE81ACE2E281E281EE81AC81E2E2E281EE00DF2B2B002B
          00EE00DF002B2B2B00EE81ACE2E281E281EE81AC81E2E2E281EEEE0000000000
          002B000000000000EEEEEE818181818181E2818181818181EEEEEEEE00DF2B2B
          00D700DF002B00EEEEEEEEEE81ACE2E281D781AC81E281EEEEEEEEEE00000000
          00EE0000000000EEEEEEEEEE8181818181EE8181818181EEEEEEEEEEEE002B00
          EEEEEE002B00EEEEEEEEEEEEEE81E281EEEEEE81E281EEEEEEEEEEEEEEDFD700
          EEEEEEDFD700EEEEEEEEEEEEEEACD781EEEEEEACD781EEEEEEEEEEEEEE2B2B2B
          EEEEEE2B2B2BEEEEEEEEEEEEEEE2E2E2EEEEEEE2E2E2EEEEEEEEEEEEEEEEEEEE
          EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE}
        NumGlyphs = 2
      end
      object BitBtn9: TBitBtn
        Left = 626
        Top = 13
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #38544#34255#39033#30446
        TabOrder = 7
        Visible = False
        OnClick = BitBtn9Click
      end
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 50
      Width = 878
      Height = 443
      ActivePage = ts1
      Align = alClient
      Style = tsFlatButtons
      TabOrder = 1
      OnChange = PageControl1Change
      object ts1: TTabSheet
        Caption = #21592#24037#24403#21069#34218#36164#26723#26696
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 870
          Height = 412
          Align = alClient
          Color = clWhite
          DataSource = DM.ds1
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ParentFont = False
          PopupMenu = PopupMenu2
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnCellClick = DBGridEh1CellClick
          OnDrawColumnCell = DBGridEh1DrawColumnCell
          OnKeyDown = DBGridEh1KeyDown
          OnTitleClick = DBGridEh1TitleClick
        end
      end
      object ts2: TTabSheet
        Caption = #21592#24037#36807#24448#34218#36164#26723#26696
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
        object DBGridEH2: TDBGridEh
          Left = 0
          Top = 0
          Width = 870
          Height = 379
          Align = alClient
          DataSource = DM.ds2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #23435#20307
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = ANSI_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -12
          FooterFont.Name = #23435#20307
          FooterFont.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = #23435#20307
          TitleFont.Style = []
          OnDrawColumnCell = DBGridEH2DrawColumnCell
          OnGetCellParams = DBGridEH2GetCellParams
          OnKeyDown = DBGridEH2KeyDown
          OnTitleClick = DBGridEH2TitleClick
        end
        object Panel2: TPanel
          Left = 0
          Top = 379
          Width = 870
          Height = 33
          Align = alBottom
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 1
          DesignSize = (
            870
            33)
          object Label2: TLabel
            Left = 617
            Top = 15
            Width = 36
            Height = 12
            Anchors = [akRight, akBottom]
            Caption = #36339#36716#21040
            Font.Charset = ANSI_CHARSET
            Font.Color = clTeal
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 772
            Top = 15
            Width = 12
            Height = 12
            Anchors = [akRight, akBottom]
            Caption = #26376
            Font.Charset = ANSI_CHARSET
            Font.Color = clTeal
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object SpeedButton4: TSpeedButton
            Left = 798
            Top = 6
            Width = 68
            Height = 22
            Anchors = [akRight, akBottom]
            Caption = #30830#23450
            Font.Charset = ANSI_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            OnClick = SpeedButton4Click
          end
          object Label6: TLabel
            Left = 705
            Top = 15
            Width = 12
            Height = 12
            Anchors = [akRight, akBottom]
            Caption = #24180
            Font.Charset = ANSI_CHARSET
            Font.Color = clTeal
            Font.Height = -12
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object Label4: TLabel
            Left = 240
            Top = 12
            Width = 7
            Height = 13
            Anchors = [akLeft, akBottom]
            Font.Charset = ANSI_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
          end
          object ComboBox1: TComboBox
            Left = 729
            Top = 12
            Width = 41
            Height = 21
            Style = csDropDownList
            Anchors = [akRight, akBottom]
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = '1'
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
          end
          object BitBtn4: TBitBtn
            Left = 4
            Top = 7
            Width = 75
            Height = 22
            Anchors = [akLeft, akBottom]
            Caption = #19978#19968#26376
            Font.Charset = ANSI_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = BitBtn4Click
          end
          object BitBtn6: TBitBtn
            Left = 79
            Top = 7
            Width = 75
            Height = 22
            Anchors = [akLeft, akBottom]
            Caption = #26412#26376
            Font.Charset = ANSI_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = BitBtn6Click
          end
          object BitBtn7: TBitBtn
            Left = 154
            Top = 7
            Width = 75
            Height = 22
            Anchors = [akLeft, akBottom]
            Caption = #19979#19968#26376
            Font.Charset = ANSI_CHARSET
            Font.Color = clTeal
            Font.Height = -13
            Font.Name = #23435#20307
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = BitBtn7Click
          end
          object Edit1: TEdit
            Left = 657
            Top = 12
            Width = 47
            Height = 21
            Anchors = [akRight, akBottom]
            MaxLength = 4
            TabOrder = 4
            OnKeyPress = Edit1KeyPress
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 576
    Top = 104
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 640
    Top = 128
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 188
    Top = 156
    object N3: TMenuItem
      Caption = #33258#21160#20998#37197#32844#21153#23703#20301#37329#39069
      OnClick = N3Click
    end
    object N5: TMenuItem
      Tag = 2
      Caption = #20445#23384#26032#36827#20154#21592#34218#36164#26723#26696
      OnClick = N5Click
    end
    object N1: TMenuItem
      Tag = -1
      Caption = #26597#30475#35813#21592#24037#36807#24448#34218#36164#26723#26696
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #23548#20837#26032#36827#20154#21592#34218#36164#26723#26696
      OnClick = N2Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #26723#26696#35299#38145
      OnClick = N6Click
    end
  end
  object ActionList1: TActionList
    Left = 696
    Top = 144
    object Action1: TAction
      Caption = 'Action1'
      ShortCut = 16456
      OnExecute = Action1Execute
    end
  end
end
