object FrmQuery: TFrmQuery
  Left = 302
  Top = 95
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810#26465#20214#35774#32622
  ClientHeight = 298
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox3: TGroupBox
    Left = 0
    Top = 0
    Width = 598
    Height = 52
    Align = alTop
    TabOrder = 0
    object Label5: TLabel
      Left = 4
      Top = 22
      Width = 90
      Height = 13
      Caption = 'QAE'#32467#26463#26102#38388#20174
    end
    object Label6: TLabel
      Left = 221
      Top = 23
      Width = 13
      Height = 13
      Caption = #21040
    end
    object DateTimePicker3: TDateTimePicker
      Left = 97
      Top = 18
      Width = 118
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      DateMode = dmUpDown
      TabOrder = 0
    end
    object DateTimePicker4: TDateTimePicker
      Left = 491
      Top = 18
      Width = 86
      Height = 21
      Date = 38974.000000000000000000
      Time = 38974.000000000000000000
      Kind = dtkTime
      TabOrder = 1
      Visible = False
    end
    object DateTimePicker5: TDateTimePicker
      Left = 237
      Top = 18
      Width = 117
      Height = 21
      Date = 37575.000000000000000000
      Time = 37575.000000000000000000
      DateMode = dmUpDown
      TabOrder = 2
    end
    object DateTimePicker6: TDateTimePicker
      Left = 395
      Top = 18
      Width = 89
      Height = 21
      Date = 38974.999305555550000000
      Time = 38974.999305555550000000
      Kind = dtkTime
      TabOrder = 3
      Visible = False
    end
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 70
    Width = 290
    Height = 190
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 1
    object Label8: TLabel
      Left = 125
      Top = 39
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object edtValue: TEdit
      Left = 116
      Top = 66
      Width = 125
      Height = 21
      TabOrder = 0
      OnChange = edtValueChange
    end
    object Button3: TButton
      Left = 123
      Top = 151
      Width = 62
      Height = 25
      Caption = #22686#21152
      TabOrder = 1
      OnClick = Button3Click
    end
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 103
      Height = 127
      ItemHeight = 13
      TabOrder = 2
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
      TabOrder = 3
    end
    object Button4: TButton
      Left = 203
      Top = 151
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 4
      OnClick = Button4Click
    end
    object BitBtn7: TBitBtn
      Left = 242
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 5
      Visible = False
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
    object RadioGroup3: TRadioGroup
      Left = 114
      Top = 94
      Width = 169
      Height = 48
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110' ='
        #30456#20284' like')
      TabOrder = 6
    end
  end
  object SGrid1: TStringGrid
    Left = 298
    Top = 90
    Width = 295
    Height = 170
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssHorizontal
    TabOrder = 2
    ColWidths = (
      67
      224
      2)
  end
  object StaticText2: TStaticText
    Left = 287
    Top = 73
    Width = 306
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
    TabOrder = 3
  end
  object Button1: TButton
    Left = 167
    Top = 264
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 4
  end
  object Button2: TButton
    Left = 311
    Top = 264
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 376
    Top = 171
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = Button4Click
    end
  end
end
