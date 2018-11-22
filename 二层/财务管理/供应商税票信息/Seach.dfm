object Form_Seach: TForm_Seach
  Left = 369
  Top = 277
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810#26465#20214#35774#32622
  ClientHeight = 280
  ClientWidth = 579
  Color = clActiveBorder
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 24
    Width = 289
    Height = 161
    Caption = #26597#35810#26465#20214#23450#20041
    Color = clActiveBorder
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 112
      Top = 50
      Width = 42
      Height = 13
      Caption = 'Label1'
    end
    object ListBox1: TListBox
      Left = 12
      Top = 40
      Width = 93
      Height = 113
      ItemHeight = 13
      Items.Strings = (
        #21457#31080#32534#30721
        #21457#31080#21495#30721
        #20379#24212#21830#20195#30721
        #36135#27454#24180#24230
        #36135#27454#26376#20221
        #26159#21542#24050#20570#20973#35777)
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object StaticText1: TStaticText
      Left = 12
      Top = 24
      Width = 92
      Height = 17
      Caption = '  '#26465#20214#39033#30446'  '
      Color = clGrayText
      Font.Charset = GB2312_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object Edit1: TEdit
      Left = 112
      Top = 72
      Width = 137
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
    end
    object BitBtn1: TBitBtn
      Left = 256
      Top = 70
      Width = 25
      Height = 24
      TabOrder = 3
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
    object btnInsert: TButton
      Left = 158
      Top = 112
      Width = 75
      Height = 25
      Caption = #22686#21152
      TabOrder = 4
      OnClick = btnInsertClick
    end
    object Chk: TCheckBox
      Left = 152
      Top = 74
      Width = 97
      Height = 17
      Caption = #26159#21542#24050#20570#20973#35777
      TabOrder = 5
    end
  end
  object StaticText2: TStaticText
    Left = 304
    Top = 26
    Width = 264
    Height = 17
    Caption = '           '#24050#23450#20041#30340#26465#20214'           '
    Color = clGrayText
    Font.Charset = GB2312_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
  object SGrid: TStringGrid
    Left = 304
    Top = 43
    Width = 265
    Height = 142
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    TabOrder = 2
    ColWidths = (
      98
      161
      14)
  end
  object Panel1: TPanel
    Left = 104
    Top = 196
    Width = 409
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 3
    object Label2: TLabel
      Left = 38
      Top = 16
      Width = 78
      Height = 13
      Caption = #21457#31080#26085#26399#20174#65306
    end
    object Label3: TLabel
      Left = 238
      Top = 16
      Width = 13
      Height = 13
      Caption = #21040
    end
    object DateTimePicker1: TDateTimePicker
      Left = 112
      Top = 12
      Width = 120
      Height = 21
      Date = 40863.000000000000000000
      Time = 40863.000000000000000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 256
      Top = 12
      Width = 120
      Height = 21
      Date = 40863.000000000000000000
      Time = 40863.000000000000000000
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 14
      Top = 12
      Width = 75
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 2
      Text = #21457#31080#26085#26399
      OnChange = ComboBox1Change
      Items.Strings = (
        #21457#31080#26085#26399
        #23545#24080#26085#26399)
    end
  end
  object btnEnter: TButton
    Left = 208
    Top = 248
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 4
    OnClick = btnEnterClick
  end
  object btnCancel: TButton
    Left = 296
    Top = 248
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = btnCancelClick
  end
  object PopupMenu1: TPopupMenu
    Left = 456
    Top = 88
    object N1: TMenuItem
      Caption = #21024#38500#26465#20214
      OnClick = N1Click
    end
  end
end
