object frmQryMain: TfrmQryMain
  Left = 309
  Top = 237
  Width = 493
  Height = 275
  Caption = #32508#21512#26597#35810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  WindowMenu = windows1
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 96
    Top = 72
    object N1: TMenuItem
      Caption = #26597#35810
      object N2: TMenuItem
        Caption = #26597#35810#23383#27573#35774#32622
        Visible = False
        OnClick = N2Click
      end
      object N6: TMenuItem
        Caption = #35746#21333#20215#26684#20998#26512
        Visible = False
        OnClick = N6Click
      end
      object N3: TMenuItem
        Caption = #26448#26009#36827#20986#23384
        OnClick = N3Click
      end
      object N5: TMenuItem
        Caption = #35831#36141'/'#37319#36141#26597#35810
        OnClick = N5Click
      end
    end
    object N100: TMenuItem
      Caption = #25253#34920
      Visible = False
      object N12: TMenuItem
        Caption = #25253#34920#35774#35745
        OnClick = N12Click
      end
    end
    object N4: TMenuItem
      Caption = #36864#20986
      OnClick = N4Click
    end
    object windows1: TMenuItem
      Caption = #31383#21475'(&W)'
      object N11: TMenuItem
        Action = WindowClose1
        Caption = #20851#38381#31383#20307
      end
      object N7: TMenuItem
        Action = WindowCascade1
        Caption = #23618#21472
      end
      object N8: TMenuItem
        Action = WindowTileVertical1
        Caption = #27178#21521#24179#38138
      end
      object N9: TMenuItem
        Action = WindowTileHorizontal1
        Caption = #32437#21521#24179#38138
      end
      object N10: TMenuItem
        Caption = '-'
      end
    end
  end
  object ActionList1: TActionList
    Left = 352
    Top = 112
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = 'C&lose'
      Enabled = False
      Hint = 'Close'
    end
    object WindowCascade1: TWindowCascade
      Category = 'Window'
      Caption = '&Cascade'
      Enabled = False
      Hint = 'Cascade'
      ImageIndex = 17
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = 'Tile &Horizontally'
      Enabled = False
      Hint = 'Tile Horizontal'
      ImageIndex = 15
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = '&Tile Vertically'
      Enabled = False
      Hint = 'Tile Vertical'
      ImageIndex = 16
    end
    object WindowMinimizeAll1: TWindowMinimizeAll
      Category = 'Window'
      Caption = '&Minimize All'
      Enabled = False
      Hint = 'Minimize All'
    end
    object WindowArrange1: TWindowArrange
      Category = 'Window'
      Caption = '&Arrange'
      Enabled = False
    end
  end
end
