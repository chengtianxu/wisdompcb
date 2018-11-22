object Frm_Search: TFrm_Search
  Left = 396
  Top = 232
  Width = 673
  Height = 341
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
    Top = 8
    Width = 297
    Height = 161
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label1: TLabel
      Left = 128
      Top = 48
      Width = 42
      Height = 13
      Caption = 'Label1'
    end
    object ListBox1: TListBox
      Left = 8
      Top = 48
      Width = 108
      Height = 97
      ItemHeight = 13
      Items.Strings = (
        #23458#25143
        #38144#21806#35746#21333
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #21512#21516#21495)
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 32
      Width = 108
      Height = 17
      Caption = '   '#26465#20214#39033#30446'   '
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
    object Edit1: TEdit
      Left = 128
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 2
      OnKeyPress = Edit1KeyPress
    end
    object Button1: TButton
      Left = 160
      Top = 112
      Width = 75
      Height = 25
      Caption = #22686#21152
      TabOrder = 3
      OnClick = Button1Click
    end
    object BitBtn1: TBitBtn
      Left = 256
      Top = 72
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
    Left = 320
    Top = 16
    Width = 328
    Height = 17
    Caption = '               '#24050#23450#20041#30340#26465#20214'               '
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
  object SGrd1: TStringGrid
    Left = 320
    Top = 32
    Width = 329
    Height = 137
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = Popup1
    TabOrder = 2
    ColWidths = (
      82
      237
      4)
  end
  object Button2: TButton
    Left = 232
    Top = 240
    Width = 75
    Height = 25
    Caption = #30830' '#23450
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 336
    Top = 240
    Width = 75
    Height = 25
    Caption = #21462' '#28040
    TabOrder = 4
    OnClick = Button3Click
  end
  object Panel1: TPanel
    Left = 80
    Top = 184
    Width = 497
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 5
    object Label2: TLabel
      Left = 80
      Top = 16
      Width = 65
      Height = 13
      Caption = #19979#21333#26085#26399#20174
    end
    object Label3: TLabel
      Left = 280
      Top = 16
      Width = 13
      Height = 13
      Caption = #21040
    end
    object dtpk1: TDateTimePicker
      Left = 152
      Top = 12
      Width = 120
      Height = 21
      Date = 41085.673209085640000000
      Time = 41085.673209085640000000
      TabOrder = 0
    end
    object dtpk2: TDateTimePicker
      Left = 304
      Top = 12
      Width = 120
      Height = 21
      Date = 41085.673732997680000000
      Time = 41085.673732997680000000
      TabOrder = 1
    end
  end
  object Popup1: TPopupMenu
    Left = 480
    Top = 72
    object N1: TMenuItem
      Caption = #21024#38500#26465#20214
      OnClick = N1Click
    end
  end
end
