object MainForm: TMainForm
  Left = 191
  Top = 122
  Width = 505
  Height = 115
  Align = alTop
  Caption = #26448#26009#21457#25918#21644#36864#22238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDesktopCenter
  PrintScale = poNone
  Scaled = False
  Visible = True
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object user_ptr: TLabel
    Left = 360
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '3'
    Visible = False
  end
  object db_ptr: TLabel
    Left = 384
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '0'
    Visible = False
  end
  object vpass: TLabel
    Left = 403
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '0'
    Visible = False
  end
  object vprev: TLabel
    Left = 424
    Top = 12
    Width = 17
    Height = 13
    AutoSize = False
    Caption = '0'
    Visible = False
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 497
    Height = 37
    BorderWidth = 1
    ButtonHeight = 26
    Color = clBtnFace
    Indent = 5
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Wrapable = False
    object SpeedButton1: TSpeedButton
      Left = 5
      Top = 2
      Width = 26
      Height = 26
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
      OnClick = SpeedButton1Click
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 50
    Width = 497
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 72
    Top = 8
    object File1: TMenuItem
      Caption = #26631#20934
      Hint = 'File related commands'
      object Production1: TMenuItem
        Caption = #26448#26009#21457#25918
        object N6: TMenuItem
          Caption = #21040#37197#26009#21333
          OnClick = N6Click
        end
        object N7: TMenuItem
          Caption = #21040#37096#38376
          OnClick = N7Click
        end
        object N9: TMenuItem
          Caption = #21040#36710#38388#24211#23384
          OnClick = N9Click
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object N12: TMenuItem
          Caption = #21040#26469#26009#26816#26597
          OnClick = N12Click
        end
      end
      object N3: TMenuItem
        Caption = #26448#26009#36864#22238
        OnClick = N3Click
      end
      object N8: TMenuItem
        Caption = #37325#21360#20986#20179#21333
        OnClick = N8Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Caption = #36710#38388#24211#23384#35843#25972
        OnClick = N4Click
      end
      object N10: TMenuItem
        Caption = #35843#25972#35760#24405#26597#38405
        OnClick = N10Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = #36864#20986
        OnClick = N2Click
      end
    end
    object N13: TMenuItem
      Caption = #26434#39033
      object N14: TMenuItem
        Caption = #26448#26009#21457#25918
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #26448#26009#36864#22238
      end
    end
    object Help1: TMenuItem
      Caption = #20851#20110
      Hint = 'Help topics'
      object Item_Help: TMenuItem
        Caption = 'About'
        Hint = 'System Help Information'
      end
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=SJ_V20_SAMPLE;Data Source=w18'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 108
    Top = 8
  end
end
