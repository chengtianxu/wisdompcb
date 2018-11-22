object Form4: TForm4
  Left = 404
  Top = 278
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22806#21457#21152#24037#30003#35831#21333#26597#35810#26465#20214#35774#32622
  ClientHeight = 239
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox6: TGroupBox
    Left = 7
    Top = 3
    Width = 268
    Height = 178
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label9: TLabel
      Left = 98
      Top = 98
      Width = 60
      Height = 13
      Caption = #32456#27490#26085#26399#65306
      Visible = False
    end
    object Label7: TLabel
      Left = 98
      Top = 70
      Width = 60
      Height = 13
      Caption = #36215#22987#26085#26399#65306
      Visible = False
    end
    object Label8: TLabel
      Left = 98
      Top = 42
      Width = 48
      Height = 13
      Caption = #22806#21457#32534#21495
    end
    object DTpk5: TDateTimePicker
      Left = 158
      Top = 66
      Width = 95
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 1
      Visible = False
    end
    object Edit3: TEdit
      Left = 98
      Top = 66
      Width = 122
      Height = 21
      TabOrder = 2
      OnExit = Edit3Exit
      OnKeyUp = Edit3KeyUp
    end
    object DTPk6: TDateTimePicker
      Left = 158
      Top = 94
      Width = 95
      Height = 21
      Date = 37575.999988425930000000
      Time = 37575.999988425930000000
      TabOrder = 0
      Visible = False
    end
    object Button3: TButton
      Left = 107
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 234
      Top = 63
      Width = 25
      Height = 25
      TabOrder = 4
      Visible = False
      OnClick = BitBtn6Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
        333333777777777F33333330B00000003333337F7777777F3333333000000000
        333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
        333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
        03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
        03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
        3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
        333333333377F7F33333333333330F03333333333337F7F33333333333330B03
        3333333333373733333333333333303333333333333373333333}
      NumGlyphs = 2
    end
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 127
      ItemHeight = 13
      Items.Strings = (
        #22806#21457#32534#21495
        #20379#24212#21830
        #22806#21457#24037#24207
        #22806#21457#26085#26399
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #29366#24577
        #24037#21378#20195#30721
        #36865#36135#26085#26399)
      TabOrder = 5
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
      Width = 81
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = #26465#20214#39033#30446
      Color = clGrayText
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 6
    end
    object GroupBox1: TGroupBox
      Left = 103
      Top = 20
      Width = 137
      Height = 116
      Caption = #22806#21457#29366#24577
      TabOrder = 7
      object CheckBox2: TCheckBox
        Left = 8
        Top = 17
        Width = 70
        Height = 17
        Caption = #26410#25552#20132
        TabOrder = 0
        OnClick = CheckBox2Click
      end
      object CheckBox3: TCheckBox
        Left = 7
        Top = 28
        Width = 73
        Height = 32
        Caption = #24453#23457#25209
        TabOrder = 1
        OnClick = CheckBox2Click
      end
      object CheckBox4: TCheckBox
        Left = 8
        Top = 53
        Width = 79
        Height = 17
        Caption = #24050#25209#20934
        TabOrder = 2
        OnClick = CheckBox2Click
      end
      object CheckBox5: TCheckBox
        Left = 8
        Top = 72
        Width = 82
        Height = 17
        Caption = #24050#25910#36135
        TabOrder = 3
        OnClick = CheckBox2Click
      end
      object CheckBox6: TCheckBox
        Left = 8
        Top = 91
        Width = 81
        Height = 17
        Caption = #34987#36864#22238
        TabOrder = 4
        OnClick = CheckBox2Click
      end
    end
  end
  object StaticText2: TStaticText
    Left = 279
    Top = 7
    Width = 248
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelInner = bvLowered
    BevelOuter = bvNone
    Caption = #24050#23450#20041#30340#26465#20214
    Color = clGrayText
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
  object SGrid1: TStringGrid
    Left = 279
    Top = 23
    Width = 249
    Height = 158
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 2
    OnMouseDown = SGrid1MouseDown
    ColWidths = (
      76
      167
      250)
  end
  object Button1: TButton
    Left = 183
    Top = 199
    Width = 75
    Height = 25
    Caption = #30830#23450
    Enabled = False
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 271
    Top = 199
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 184
    Width = 97
    Height = 17
    Caption = #26174#31034#25910#36135#26126#32454
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 408
    Top = 160
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
