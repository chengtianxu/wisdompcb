object Form1: TForm1
  Left = 497
  Top = 250
  Align = alTop
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#23450#21333#30830#35748
  ClientHeight = 69
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 8
    Top = 16
    Width = 70
    Height = 27
    Caption = #36864#20986
    TabOrder = 0
    OnClick = N4Click
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 50
    Width = 490
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    Left = 192
    Top = 8
    object F1: TMenuItem
      Caption = #25991#20214'(&F)'
      object N1: TMenuItem
        Caption = #30830#35748
        OnClick = N1Click
      end
      object N2: TMenuItem
        Caption = #21453#30830#35748
        OnClick = N2Click
      end
      object N7: TMenuItem
        Caption = #24212#26399#36864#22238
        OnClick = N7Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #36864#20986
        OnClick = N4Click
      end
    end
    object O1: TMenuItem
      Caption = #36873#39033'(&O)'
      object N5: TMenuItem
        Caption = #36807#28388#21450#25490#24207
        OnClick = N5Click
      end
    end
    object H1: TMenuItem
      Caption = #24110#21161'(&H)'
      object N6: TMenuItem
        Caption = #20851#20110
        OnClick = N6Click
      end
    end
  end
end
