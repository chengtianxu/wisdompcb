object MainForm: TMainForm
  Left = 238
  Top = 162
  Width = 640
  Height = 117
  Align = alTop
  Caption = #23450#21046#25253#34920
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clBlack
  Font.Height = -13
  Font.Name = #23435#20307
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
    Caption = '0'
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
    Width = 632
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
    object SpeedButton2: TSpeedButton
      Left = 5
      Top = 2
      Width = 26
      Height = 26
      Hint = #36864#20986
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
      OnClick = SpeedButton2Click
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 52
    Width = 632
    Height = 19
    Panels = <>
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 96
    Top = 8
    object File1: TMenuItem
      Caption = #26448#26009#26597#35810
      Hint = 'File related commands'
      object Production1: TMenuItem
        Caption = #26448#26009#24211#23384
        Hint = #26448#26009#24211#23384
        OnClick = Production1Click
      end
      object N3: TMenuItem
        Caption = #24050#25509#25910#30340#26448#26009
        Hint = #24050#25509#25910#30340#26448#26009
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #24050#21457#25918#30340#26448#26009
        Hint = #24050#21457#25918#30340#26448#26009
        OnClick = N4Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = #36864#20986
        Hint = #36864#20986
        OnClick = N2Click
      end
    end
    object Help1: TMenuItem
      Caption = #25104#21697#26597#35810
      object Item_Help: TMenuItem
        Caption = #25104#21697#24211#23384#28165#21333
        Hint = #25104#21697#24211#23384#28165#21333
        OnClick = Item_HelpClick
      end
      object N9: TMenuItem
        Caption = #25104#21697#36827#20179#28165#21333
        Hint = #25104#21697#36827#20179#28165#21333
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #25104#21697#20986#20179#28165#21333
        Hint = #25104#21697#20986#20179#28165#21333
        OnClick = N10Click
      end
      object N39: TMenuItem
        Caption = #20135#25104#20837#20179#21333
        OnClick = N39Click
      end
      object N40: TMenuItem
        Caption = #25104#21697#26816#35270#21333
        OnClick = N40Click
      end
    end
    object N5: TMenuItem
      Caption = #25104#21697#20986#20179#25253#34920
      object N6: TMenuItem
        Caption = #35013#31665#21333#28165#21333
        Hint = #35013#31665#21333#28165#21333
        OnClick = N6Click
      end
      object N8: TMenuItem
        Caption = #21457#36135#36890#30693#28165#21333
        Hint = #21457#36135#36890#30693#28165#21333
        OnClick = N8Click
      end
      object N11: TMenuItem
        Caption = #26631#20934#21457#31080#28165#21333
        Hint = #26631#20934#21457#31080#28165#21333
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #24037#20855#21457#31080#28165#21333
        Hint = #24037#20855#21457#31080#28165#21333
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N1: TMenuItem
        Caption = #35013#31665#21333
        Hint = #35013#31665#21333
        object N32: TMenuItem
          Caption = #36865#36135#21333#26684#24335#19968
          OnClick = N32Click
        end
        object N33: TMenuItem
          Caption = #36865#36135#21333#26684#24335#20108
          OnClick = N33Click
        end
        object N34: TMenuItem
          Caption = #36865#36135#21333#26684#24335#19977
          OnClick = N34Click
        end
        object N35: TMenuItem
          Caption = #36865#36135#21333#26684#24335#22235
          OnClick = N35Click
        end
      end
      object N14: TMenuItem
        Caption = #21457#36135#36890#30693#21333
        Hint = #21457#36135#36890#30693#21333
        object N41: TMenuItem
          Caption = #26684#24335#19968'(By Air)'
          OnClick = N41Click
        end
        object N42: TMenuItem
          Caption = #26684#24335#20108'(By Sea)'
          OnClick = N42Click
        end
      end
      object N38: TMenuItem
        Caption = #29305#27530#20986#20179#21333
        OnClick = N38Click
      end
    end
    object N15: TMenuItem
      Caption = #26448#26009#36827#20986
      object N16: TMenuItem
        Caption = #30452#25509#37319#36141#36135#21697#25910#36135#21333
        Hint = #30452#25509#37319#36141#36135#21697#25910#36135#21333
        OnClick = N16Click
      end
      object N17: TMenuItem
        Caption = #35746#36141#29983#20135#29289#26009#25910#36135#21333
        Hint = #26631#20934#37319#36141#36135#21697#25910#36135#21333
        OnClick = N17Click
      end
      object N18: TMenuItem
        Caption = #35746#36141#38750#29983#20135#29289#26009#25910#36135#21333
        Hint = #26631#20934#37319#36141#26434#39033#26448#26009#25910#36135#21333
        OnClick = N18Click
      end
      object N19: TMenuItem
        Caption = '-'
      end
      object N20: TMenuItem
        Caption = #21015#21360#26465#24418#30721#26631#31614
        Hint = #21015#21360#26465#24418#30721#26631#31614
        OnClick = N20Click
      end
      object N21: TMenuItem
        Caption = #20986#20179#21333'-'#21040#37197#26009#21333
        Hint = #20986#20179#21333'-'#21040#37197#26009#21333
        OnClick = N21Click
      end
      object N22: TMenuItem
        Caption = #20986#20179#21333'-'#21040#37096#38376'/'#24037#24207
        Hint = #20986#20179#21333'-'#21040#37096#38376'/'#24037#24207
        OnClick = N22Click
      end
    end
    object N23: TMenuItem
      Caption = #37319#36141#35746#21333
      object N24: TMenuItem
        Caption = #22269#20869#37319#36141#35746#21333
        Hint = #26631#20934#37319#36141#35746#21333
        object N26: TMenuItem
          Caption = #29983#20135#29289#26009
          OnClick = N26Click
        end
        object N27: TMenuItem
          Caption = #38750#29983#20135#29289#26009
          OnClick = N27Click
        end
      end
      object N25: TMenuItem
        Caption = #22269#22806#37319#36141#35746#21333
        Hint = #26434#39033#37319#36141#35746#21333
        object N28: TMenuItem
          Caption = #29983#20135#29289#26009
          OnClick = N28Click
        end
        object N29: TMenuItem
          Caption = #38750#29983#20135#29289#26009
          OnClick = N29Click
        end
      end
    end
    object N30: TMenuItem
      Caption = #38144#21806#35746#21333
      object N31: TMenuItem
        Caption = #21516#19968#26495#21495
        OnClick = N31Click
      end
      object N36: TMenuItem
        Caption = #19981#21516#26495#21495
        OnClick = N36Click
      end
      object N43: TMenuItem
        Caption = #36830#32493#32534#21495#25171#21360#25253#34920
        OnClick = N43Click
      end
    end
    object N44: TMenuItem
      Caption = #23458#25143#21672#35810
      object N45: TMenuItem
        Caption = #23458#25143#21672#20449#35843#26597#34920
        OnClick = N45Click
      end
    end
  end
end
