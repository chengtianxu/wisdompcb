object frm_Search: Tfrm_Search
  Left = 411
  Top = 263
  Width = 602
  Height = 256
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 273
    Height = 145
    Caption = #26597#35810#26465#20214#23450#20041
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 48
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 24
      Width = 92
      Height = 17
      Caption = '  '#26465#20214#39033#30446'  '
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object ListBox1: TListBox
      Left = 8
      Top = 40
      Width = 92
      Height = 97
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #23458#25143#35746#21333
        #23458#25143#22411#21495
        #35013#31665#21333#21495
        #38144#21806#35746#21333)
      ParentFont = False
      TabOrder = 2
      OnClick = ListBox1Click
    end
    object Edit1: TEdit
      Left = 112
      Top = 64
      Width = 121
      Height = 21
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyUp = Edit1KeyUp
    end
    object Button1: TButton
      Left = 152
      Top = 104
      Width = 75
      Height = 25
      Caption = #26032' '#22686
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object BitBtn1: TBitBtn
      Left = 240
      Top = 64
      Width = 25
      Height = 21
      TabOrder = 4
      OnClick = BitBtn1Click
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
  end
  object StaticText2: TStaticText
    Left = 288
    Top = 16
    Width = 296
    Height = 17
    Caption = '             '#24050#23450#20041#30340#26465#20214'             '
    Color = clGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
  object SGrd: TStringGrid
    Left = 288
    Top = 32
    Width = 297
    Height = 129
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 2
    ColWidths = (
      106
      183
      2)
  end
  object Button2: TButton
    Left = 216
    Top = 176
    Width = 75
    Height = 25
    Caption = #30830' '#23450
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 320
    Top = 176
    Width = 75
    Height = 25
    Caption = #21462' '#28040
    TabOrder = 4
    OnClick = Button3Click
  end
end
