object MainForm1: TMainForm1
  Left = 192
  Top = 107
  Width = 544
  Height = 375
  Caption = #24555#26495#21378#25253#20215#25253#34920#35774#35745
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 104
    Top = 8
    object N1: TMenuItem
      Caption = #25991#20214
      object N2: TMenuItem
        Caption = #24555#36895#25253#20215#25253#34920#35774#35745
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #36864#20986
        OnClick = N3Click
      end
    end
  end
end
