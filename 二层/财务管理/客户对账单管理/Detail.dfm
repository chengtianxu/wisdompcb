object Form_Detail: TForm_Detail
  Left = 203
  Top = 121
  Width = 923
  Height = 567
  Caption = #23545#24080#21333#26126#32454
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel6: TPanel
    Left = 0
    Top = 33
    Width = 915
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 391
      Top = 17
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = #23458#25143':'
    end
    object Label19: TLabel
      Left = 529
      Top = 17
      Width = 28
      Height = 13
      Caption = '    '
    end
    object Label3: TLabel
      Left = 391
      Top = 44
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = #36135#24065':'
    end
    object Label20: TLabel
      Left = 529
      Top = 44
      Width = 28
      Height = 13
      Caption = '    '
    end
    object Label4: TLabel
      Left = 734
      Top = 44
      Width = 33
      Height = 13
      Alignment = taRightJustify
      Caption = #27719#29575':'
    end
    object Label23: TLabel
      Left = 1
      Top = 17
      Width = 59
      Height = 13
      Caption = #23545#24080#32534#21495':'
    end
    object Label24: TLabel
      Left = 1
      Top = 44
      Width = 59
      Height = 13
      Caption = #23545#24080#26085#26399':'
    end
    object Label27: TLabel
      Left = 168
      Top = 44
      Width = 59
      Height = 13
      Caption = #20250#35745#24180#24230':'
    end
    object Label28: TLabel
      Left = 276
      Top = 44
      Width = 59
      Height = 13
      Caption = #20250#35745#26376#20221':'
    end
    object Label1: TLabel
      Left = 1
      Top = 70
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #24037#20855#36153#29992':'
    end
    object Label5: TLabel
      Left = 166
      Top = 70
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #26434#39033#36153#29992':'
    end
    object Label6: TLabel
      Left = 364
      Top = 70
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #20986#36135#20215#27454':'
    end
    object Label7: TLabel
      Left = 553
      Top = 70
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #22686#20540#31246':'
    end
    object Label8: TLabel
      Left = 708
      Top = 70
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #24212#25910#24635#35745':'
    end
    object Label9: TLabel
      Left = 181
      Top = 16
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = #21442#32771#21495':'
    end
    object Edit1: TEdit
      Left = 429
      Top = 13
      Width = 65
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
    end
    object Edit5: TEdit
      Left = 429
      Top = 40
      Width = 65
      Height = 21
      TabStop = False
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 1
    end
    object BitBtn6: TBitBtn
      Left = 497
      Top = 11
      Width = 25
      Height = 25
      TabOrder = 2
      OnClick = BitBtn6Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object BitBtn4: TBitBtn
      Left = 497
      Top = 38
      Width = 25
      Height = 25
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object Edit2: TEdit
      Left = 771
      Top = 40
      Width = 86
      Height = 21
      TabOrder = 4
      Text = '0.00000000'
    end
    object Edit8: TEdit
      Left = 64
      Top = 13
      Width = 99
      Height = 21
      ReadOnly = True
      TabOrder = 5
    end
    object Edit11: TEdit
      Left = 64
      Top = 40
      Width = 99
      Height = 21
      TabOrder = 6
      OnExit = Edit11Exit
      OnKeyPress = Edit11KeyPress
    end
    object Edit13: TEdit
      Left = 230
      Top = 40
      Width = 45
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 7
    end
    object Edit14: TEdit
      Left = 338
      Top = 40
      Width = 43
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 8
    end
    object Edit3: TEdit
      Left = 64
      Top = 66
      Width = 86
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 9
      Text = '0.00'
    end
    object Edit4: TEdit
      Left = 230
      Top = 66
      Width = 86
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 10
      Text = '0.00'
    end
    object Edit6: TEdit
      Left = 429
      Top = 66
      Width = 86
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 11
      Text = '0.00'
    end
    object Edit7: TEdit
      Left = 604
      Top = 66
      Width = 86
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 12
      Text = '0.00'
    end
    object Edit9: TEdit
      Left = 772
      Top = 66
      Width = 86
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 13
      Text = '0.00'
    end
    object Edit10: TEdit
      Left = 231
      Top = 13
      Width = 99
      Height = 21
      TabOrder = 14
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 130
    Width = 915
    Height = 215
    Align = alTop
    TabOrder = 1
    object StringGrid1: TStringGrid
      Left = 1
      Top = 1
      Width = 913
      Height = 213
      Align = alClient
      ColCount = 15
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
      PopupMenu = PopupMenu1
      TabOrder = 0
      OnDrawCell = StringGrid1DrawCell
      OnExit = StringGrid1Exit
      OnKeyDown = StringGrid1KeyDown
      OnKeyPress = StringGrid1KeyPress
      OnKeyUp = StringGrid1KeyUp
      OnMouseDown = StringGrid1MouseDown
      OnSelectCell = StringGrid1SelectCell
      ColWidths = (
        78
        74
        78
        73
        77
        72
        54
        48
        6
        74
        78
        99
        64
        85
        64)
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 915
    Height = 33
    Align = alTop
    TabOrder = 2
    object BitBtn3: TBitBtn
      Left = 36
      Top = 1
      Width = 30
      Height = 30
      Cursor = crHandPoint
      Hint = #21462#28040
      ModalResult = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333FFFFF333333000033333388888833333333333F888888FFF333
        000033338811111188333333338833FFF388FF33000033381119999111833333
        38F338888F338FF30000339119933331111833338F388333383338F300003391
        13333381111833338F8F3333833F38F3000039118333381119118338F38F3338
        33F8F38F000039183333811193918338F8F333833F838F8F0000391833381119
        33918338F8F33833F8338F8F000039183381119333918338F8F3833F83338F8F
        000039183811193333918338F8F833F83333838F000039118111933339118338
        F3833F83333833830000339111193333391833338F33F8333FF838F300003391
        11833338111833338F338FFFF883F83300003339111888811183333338FF3888
        83FF83330000333399111111993333333388FFFFFF8833330000333333999999
        3333333333338888883333330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 4
      Top = 1
      Width = 30
      Height = 30
      Cursor = crHandPoint
      Hint = #20445#23384
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      OnClick = BitBtn1Click
      Glyph.Data = {
        56070000424D5607000000000000360400002800000028000000140000000100
        0800000000002003000000000000000000000001000000000000000000000000
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
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        030303FFFFFFFFFFFFFFFFFFFFFFFF030303030303F800000000000000000000
        0000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F803FF030303030300FCFC
        00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303030303F8FF03F8FF
        030303030300FCFC00F8FCFCFF070700FCFC00030303030303F8FF03F8FF0303
        030303F8FF03F8FF030303030300FCFC0007F8F807070700FCFC000303030303
        03F8FF03F8FFFFFFFFFFFFF80303F8FF030303030300FCFC0600000000000006
        FCFC00030303030303F8FF0303F8F8F8F8F8F8030303F8FF030303030300FCFC
        FCFCFCFCFCFCFCFCFCFC00030303030303F8FF0303FFFFFFFFFFFFFFFF03F8FF
        030303030300FC06000000000000000006FC00030303030303F8FF03F8F8F8F8
        F8F8F8F803FFF8FF030303030300FC00FFFFFFFFFFFFFFFF00FC000303030303
        03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
        00FC00030303030303F8FFF8FF03030303030303F8FFF8FF030303030300FC00
        FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF03030303030303F8FFF8FF
        030303030300FC00FFFFFFFFFFFFFFFF00FC00030303030303F8FFF8FF030303
        03030303F8FFF8FF0303030303000000FFFFFFFFFFFFFFFF0000000303030303
        03F8FFF8FF03030303030303F8FFF8FF030303030300FC00FFFFFFFFFFFFFFFF
        00FC00030303030303F8FFF8FFFFFFFFFFFFFFFFF8FFF8030303030303F80000
        00000000000000000000F803030303030303F8F8F8F8F8F8F8F8F8F8F8F80303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303030303030303
        0303030303030303030303030303030303030303030303030303}
      NumGlyphs = 2
    end
  end
  object StringGrid2: TStringGrid
    Left = 0
    Top = 345
    Width = 915
    Height = 188
    Align = alClient
    ColCount = 16
    DefaultRowHeight = 20
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
    PopupMenu = PopupMenu2
    TabOrder = 3
    OnDrawCell = StringGrid2DrawCell
    OnExit = StringGrid2Exit
    OnKeyDown = StringGrid2KeyDown
    OnKeyPress = StringGrid2KeyPress
    OnKeyUp = StringGrid2KeyUp
    OnMouseDown = StringGrid2MouseDown
    OnSelectCell = StringGrid2SelectCell
    ColWidths = (
      74
      73
      81
      75
      71
      76
      58
      59
      47
      53
      48
      40
      46
      35
      64
      64)
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 216
    Top = 160
    object N1: TMenuItem
      Caption = #28155#21152#24037#20855','#26434#39033#21457#31080#21450#26080#36864#36135#22791#24536
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
  object PopupMenu2: TPopupMenu
    OnPopup = PopupMenu2Popup
    Left = 360
    Top = 392
    object N3: TMenuItem
      Caption = #25353#26631#20934#21457#31080#25110#36864#36135#22791#24536#28155#21152
      OnClick = N3Click
    end
    object N12: TMenuItem
      Caption = #25353#25351#27966#26126#32454#28155#21152
      OnClick = N12Click
    end
    object N14: TMenuItem
      Caption = #25353#36864#36135#26126#32454#28155#21152
      OnClick = N14Click
    end
    object N13: TMenuItem
      Caption = #21024#38500
      OnClick = N13Click
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object EXCEL2: TMenuItem
      Caption = #23548#20837'EXCEL'
      Hint = 'Excel'#31532#19968#21015#20026#26631#35782','#20108#21015#20026#31867#22411','#19977#21015#20026#24320#31080#25968#37327','#13#10#22235#21015#20026#26085#26399','#20116#21015#20026#31246#31080#21495','#20845#21015#20026#24320#31080#20215#26684
      OnClick = EXCEL2Click
    end
    object EXCEL1: TMenuItem
      Caption = #23548#20986'EXCEL'
      OnClick = EXCEL1Click
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.XLS'
    Filter = '*.XLS|*.XLS'
    Left = 268
    Top = 362
  end
end
