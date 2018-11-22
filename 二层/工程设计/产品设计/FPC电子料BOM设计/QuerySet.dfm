object frmQuerySet: TfrmQuerySet
  Left = 324
  Top = 223
  Width = 623
  Height = 407
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
  object StaticText2: TStaticText
    Left = 327
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
    Left = 338
    Top = 44
    Width = 247
    Height = 237
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
      166
      5)
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 24
    Width = 330
    Height = 257
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 2
    object Label8: TLabel
      Left = 141
      Top = 26
      Width = 52
      Height = 13
      Caption = #23458#25143#32534#21495
    end
    object rgType: TRadioGroup
      Left = 144
      Top = 65
      Width = 135
      Height = 121
      ItemIndex = 0
      Items.Strings = (
        #30456'  '#20284
        #31561'  '#20110)
      TabOrder = 6
    end
    object edtValue: TEdit
      Left = 144
      Top = 48
      Width = 134
      Height = 21
      TabOrder = 0
      OnKeyPress = edtValueKeyPress
      OnKeyUp = edtValueKeyUp
    end
    object Button3: TButton
      Left = 155
      Top = 193
      Width = 62
      Height = 25
      Caption = #22686#21152
      TabOrder = 1
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 285
      Top = 46
      Width = 25
      Height = 25
      TabOrder = 2
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
      Top = 33
      Width = 119
      Height = 220
      ItemHeight = 13
      TabOrder = 3
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 15
      Width = 119
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
      Left = 235
      Top = 193
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 5
      OnClick = Button4Click
    end
    object cbbJS: TComboBox
      Left = 144
      Top = 48
      Width = 137
      Height = 21
      ItemHeight = 13
      TabOrder = 7
      Visible = False
    end
    object Panel3: TPanel
      Left = 136
      Top = 44
      Width = 185
      Height = 141
      TabOrder = 8
      Visible = False
      object ComboBox3: TComboBox
        Left = 16
        Top = 28
        Width = 41
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = '='
        Items.Strings = (
          '='
          '<'
          '>')
      end
      object Edit1: TEdit
        Left = 59
        Top = 28
        Width = 105
        Height = 21
        TabOrder = 1
        OnKeyPress = Edit1KeyPress
      end
    end
  end
  object Button1: TButton
    Left = 175
    Top = 330
    Width = 82
    Height = 28
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 335
    Top = 330
    Width = 82
    Height = 28
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object pnl1: TPanel
    Left = 96
    Top = 288
    Width = 393
    Height = 33
    BevelOuter = bvLowered
    TabOrder = 5
    object lbl1: TLabel
      Left = 232
      Top = 11
      Width = 13
      Height = 13
      Caption = #33267
    end
    object cbx1: TComboBox
      Left = 8
      Top = 8
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #21019#24314#26085#26399
      Items.Strings = (
        #21019#24314#26085#26399
        #23457#26680#26085#26399)
    end
    object dtp1: TDateTimePicker
      Left = 120
      Top = 8
      Width = 100
      Height = 21
      Date = 43350.429927384260000000
      Time = 43350.429927384260000000
      TabOrder = 1
    end
    object dtp2: TDateTimePicker
      Left = 259
      Top = 7
      Width = 100
      Height = 21
      Date = 43350.430058171300000000
      Time = 43350.430058171300000000
      TabOrder = 2
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 384
    Top = 149
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = Button4Click
    end
  end
end
