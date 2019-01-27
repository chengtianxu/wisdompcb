object frmQuerySet: TfrmQuerySet
  Left = 223
  Top = 202
  Width = 561
  Height = 299
  Caption = #26597#35810#26465#20214#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText2: TStaticText
    Left = 287
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
    Left = 298
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
    Width = 290
    Height = 178
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 2
    object Label8: TLabel
      Left = 125
      Top = 39
      Width = 78
      Height = 13
      Caption = #22266#23450#36164#20135#21345#21495
    end
    object edtValue: TEdit
      Left = 127
      Top = 61
      Width = 119
      Height = 21
      TabOrder = 0
      OnKeyPress = edtValueKeyPress
      OnKeyUp = edtValueKeyUp
    end
    object Button3: TButton
      Left = 131
      Top = 127
      Width = 62
      Height = 25
      Caption = #22686#21152
      TabOrder = 1
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 253
      Top = 59
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
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 103
      Height = 127
      ItemHeight = 13
      TabOrder = 3
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
      Width = 103
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
      Left = 211
      Top = 127
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 5
      OnClick = Button4Click
    end
    object ComboBox1: TComboBox
      Left = 128
      Top = 60
      Width = 129
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Text = 'ComboBox1'
      Visible = False
    end
  end
  object Button1: TButton
    Left = 167
    Top = 224
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 311
    Top = 224
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object PopupMenu1: TPopupMenu
    Left = 304
    Top = 149
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = Button4Click
    end
  end
end
