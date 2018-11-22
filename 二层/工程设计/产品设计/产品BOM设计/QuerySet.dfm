object frmQuerySet: TfrmQuerySet
  Left = 260
  Top = 212
  Width = 543
  Height = 346
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26597#35810#26465#20214#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 80
    Top = 214
    Width = 361
    Height = 37
  end
  object Label3: TLabel
    Left = 298
    Top = 225
    Width = 20
    Height = 13
    Caption = #21040':'
  end
  object Label4: TLabel
    Left = 115
    Top = 226
    Width = 72
    Height = 13
    Caption = #20462#35746#26085#26399#20174':'
  end
  object StaticText2: TStaticText
    Left = 263
    Top = 27
    Width = 258
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
    TabOrder = 0
  end
  object SGrid1: TStringGrid
    Left = 274
    Top = 44
    Width = 247
    Height = 158
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssHorizontal
    TabOrder = 1
    ColWidths = (
      67
      174
      2)
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 24
    Width = 268
    Height = 178
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 2
    object Label8: TLabel
      Left = 101
      Top = 42
      Width = 52
      Height = 13
      Caption = #23458#25143#20195#30721
    end
    object Edit1: TEdit
      Left = 103
      Top = 64
      Width = 119
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
      OnKeyUp = Edit1KeyUp
    end
    object Button3: TButton
      Left = 107
      Top = 127
      Width = 62
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 229
      Top = 62
      Width = 25
      Height = 25
      TabOrder = 2
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
    object ListBox1: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 127
      ItemHeight = 13
      TabOrder = 3
      OnClick = ListBox1Click
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
      TabOrder = 4
    end
    object Button4: TButton
      Left = 187
      Top = 127
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 5
      OnClick = Button4Click
    end
    object RadioGroup1: TRadioGroup
      Left = 100
      Top = 56
      Width = 154
      Height = 41
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #37327#20135
        #26679#26495)
      TabOrder = 6
      Visible = False
    end
  end
  object Button1: TButton
    Left = 183
    Top = 261
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 271
    Top = 261
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object dtpk1: TDateTimePicker
    Left = 192
    Top = 222
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    TabOrder = 5
  end
  object dtpk2: TDateTimePicker
    Left = 320
    Top = 222
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    TabOrder = 6
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 149
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = Button4Click
    end
  end
end
