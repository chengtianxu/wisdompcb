object Form_where: TForm_where
  Left = 398
  Top = 306
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #26465#20214#35774#32622
  ClientHeight = 382
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 4
    Top = 40
    Width = 276
    Height = 24
    Caption = '      '#26597#35810#26465#20214#23450#20041'     '
    Color = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label5: TLabel
    Left = 280
    Top = 40
    Width = 264
    Height = 24
    Caption = '     '#24050#36873#25321#30340#26465#20214'     '
    Color = clMedGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = #23435#20307
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 132
    Top = 96
    Width = 59
    Height = 13
    Caption = #39046#26009#21333#21495' '
  end
  object Splitter1: TSplitter
    Left = 0
    Top = 283
    Width = 561
    Height = 7
    Align = alCustom
    Color = clSilver
    ParentColor = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 82
      Top = 11
      Width = 65
      Height = 13
      Caption = #26597#35810#26085#26399#65306
    end
    object Label2: TLabel
      Left = 148
      Top = 12
      Width = 13
      Height = 13
      Caption = #20174
    end
    object Label3: TLabel
      Left = 303
      Top = 12
      Width = 13
      Height = 13
      Caption = #21040
    end
    object DateTimePicker1: TDateTimePicker
      Left = 168
      Top = 8
      Width = 125
      Height = 21
      Date = 42964.489105219910000000
      Time = 42964.489105219910000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 328
      Top = 8
      Width = 125
      Height = 21
      Date = 42964.489283113430000000
      Time = 42964.489283113430000000
      TabOrder = 1
    end
  end
  object ListBox1: TListBox
    Left = 4
    Top = 64
    Width = 121
    Height = 217
    Color = clActiveCaption
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListBox1Click
  end
  object StringGrid1: TStringGrid
    Left = 280
    Top = 64
    Width = 265
    Height = 216
    Color = clMedGray
    ColCount = 3
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 2
    ColWidths = (
      62
      189
      3)
  end
  object Edit1: TEdit
    Left = 128
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object BitBtn7: TBitBtn
    Left = 250
    Top = 109
    Width = 25
    Height = 25
    TabOrder = 4
    OnClick = BitBtn7Click
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
  object Button3: TButton
    Left = 131
    Top = 169
    Width = 62
    Height = 25
    Caption = #22686#21152
    TabOrder = 5
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 211
    Top = 169
    Width = 62
    Height = 25
    Caption = #28165#38500
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 165
    Top = 324
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 7
  end
  object Button2: TButton
    Left = 309
    Top = 324
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 8
  end
end
