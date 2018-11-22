object form_condition: Tform_condition
  Left = 356
  Top = 280
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'form_condition'
  ClientHeight = 292
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lb_11: TLabel
    Left = 290
    Top = 223
    Width = 20
    Height = 13
    Caption = #21040':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object lb_12: TLabel
    Left = 112
    Top = 224
    Width = 72
    Height = 13
    Caption = #25253#20215#26085#26399#20174':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object btn_1: TButton
    Left = 131
    Top = 119
    Width = 75
    Height = 25
    Caption = #22686#21152
    Enabled = False
    TabOrder = 0
  end
  object txt1: TStaticText
    Left = 263
    Top = 14
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
  object dtpk1: TDateTimePicker
    Left = 184
    Top = 220
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    TabOrder = 2
  end
  object btn_11: TButton
    Left = 263
    Top = 259
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = btn_11Click
  end
  object btn_12: TButton
    Left = 170
    Top = 259
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 4
    OnClick = btn_12Click
  end
  object dtpk2: TDateTimePicker
    Left = 304
    Top = 220
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    TabOrder = 5
  end
  object sgrid1: TStringGrid
    Left = 267
    Top = 33
    Width = 249
    Height = 176
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = pm_1
    ScrollBars = ssHorizontal
    TabOrder = 6
    OnClick = sgrid1Click
    OnMouseDown = sgrid1MouseDown
    ColWidths = (
      76
      167
      250)
  end
  object grb_1: TGroupBox
    Left = -1
    Top = 8
    Width = 268
    Height = 201
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 7
    object label8: TLabel
      Left = 101
      Top = 42
      Width = 48
      Height = 12
      Caption = #25253#20215#21333#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 103
      Top = 64
      Width = 119
      Height = 21
      TabOrder = 0
      OnKeyUp = Edit3KeyUp
    end
    object Button3: TButton
      Left = 131
      Top = 134
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object bbt_11: TBitBtn
      Left = 229
      Top = 62
      Width = 25
      Height = 25
      TabOrder = 2
      Visible = False
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
    object lst2: TListBox
      Left = 9
      Top = 40
      Width = 81
      Height = 153
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        #25253#20215#21333#21495
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #23458#25143#21517#31216
        #23458#25143#20195#30721)
      ParentFont = False
      TabOrder = 3
      OnClick = lst2Click
    end
    object txt2: TStaticText
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
      TabOrder = 4
    end
  end
  object pm_1: TPopupMenu
    OnPopup = pm_1Popup
    Left = 304
    Top = 85
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
