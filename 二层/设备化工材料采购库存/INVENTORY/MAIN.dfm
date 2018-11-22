object Form1: TForm1
  Left = 229
  Top = 157
  Width = 499
  Height = 107
  Align = alTop
  Caption = #26448#26009#39033#30446
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
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    491
    61)
  PixelsPerInch = 96
  TextHeight = 13
  object db_ptr: TLabel
    Left = 334
    Top = 15
    Width = 7
    Height = 13
    Caption = '1'
    Visible = False
  end
  object vprev: TLabel
    Left = 353
    Top = 14
    Width = 7
    Height = 13
    Caption = '2'
    Visible = False
  end
  object csi_empl_ptr: TLabel
    Left = 368
    Top = 16
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 405
    Top = 9
    Width = 73
    Height = 25
    Cursor = crHandPoint
    Anchors = [akTop, akRight]
    Caption = '&Q'#36864#20986
    TabOrder = 0
    OnClick = N7Click
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
    Top = 42
    Width = 491
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 8
    object N1: TMenuItem
      Caption = #25991#20214
      object N3: TMenuItem
        Caption = #26448#26009#39033#30446
        OnClick = N3Click
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N7: TMenuItem
        Caption = #36864#20986
        OnClick = N7Click
      end
    end
    object N2: TMenuItem
      Caption = #23454#29992#31243#24207
      object N8: TMenuItem
        Caption = #26356#26032#21407#26448#26009#26631#20934#25104#26412
        OnClick = N8Click
      end
    end
    object N9: TMenuItem
      Caption = #24110#21161
      object N10: TMenuItem
        Caption = #20851#20110
        OnClick = N10Click
      end
      object N5: TMenuItem
        Caption = #24110#21161
      end
    end
  end
end
