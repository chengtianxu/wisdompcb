object Query_Form: TQuery_Form
  Left = 115
  Top = 133
  Width = 553
  Height = 338
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26597#35810#35774#32622
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
  object Label3: TLabel
    Left = 24
    Top = 252
    Width = 497
    Height = 13
    AutoSize = False
    Caption = '(select rkey from datadepartment)'
    Visible = False
  end
  object GroupBox6: TGroupBox
    Left = 9
    Top = 7
    Width = 533
    Height = 210
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label8: TLabel
      Left = 117
      Top = 21
      Width = 108
      Height = 13
      AutoSize = False
      Caption = #21512#21516#32534#21495
    end
    object Label1: TLabel
      Left = 126
      Top = 72
      Width = 26
      Height = 13
      Caption = #21040#65306
    end
    object RadioGroup3: TRadioGroup
      Left = 107
      Top = 79
      Width = 157
      Height = 58
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110' ='
        #22823#20110' >'
        #23567#20110' <'
        #30456#20284' like')
      TabOrder = 6
      Visible = False
    end
    object RadioGroup1: TRadioGroup
      Left = 107
      Top = 81
      Width = 157
      Height = 57
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31934#30830#26597#25214' '
        #27169#31946#26597#25214)
      TabOrder = 10
    end
    object RadioGroup2: TRadioGroup
      Left = 107
      Top = 80
      Width = 157
      Height = 57
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #26377#25928' '
        #26080#25928)
      TabOrder = 11
      OnClick = RadioGroup2Click
    end
    object edtValue: TEdit
      Left = 109
      Top = 41
      Width = 132
      Height = 21
      TabOrder = 0
      OnChange = edtValueChange
    end
    object Button3: TButton
      Left = 117
      Top = 158
      Width = 62
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object ListBox3: TListBox
      Left = 10
      Top = 41
      Width = 97
      Height = 145
      ItemHeight = 13
      Items.Strings = (
        #22521#35757#32534#21495
        #21592#24037#22995#21517
        #24320#22987#26085#26399
        #32467#26463#26085#26399
        #22521#35757#32467#26524
        #37096#38376
        #21592#24037#20837#32844#26085#26399)
      TabOrder = 2
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
      Width = 97
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
      Top = 158
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 4
      OnClick = Button4Click
    end
    object BitBtn1: TBitBtn
      Left = 248
      Top = 40
      Width = 23
      Height = 23
      TabOrder = 5
      Visible = False
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
    object DateTimePicker2: TDateTimePicker
      Left = 107
      Top = 41
      Width = 142
      Height = 21
      Date = 40780.667675590280000000
      Time = 40780.667675590280000000
      TabOrder = 7
    end
    object ComboBox2: TComboBox
      Left = 108
      Top = 41
      Width = 141
      Height = 21
      ItemHeight = 13
      TabOrder = 8
      OnChange = ComboBox2Change
      Items.Strings = (
        #25163#26426#36890#23380#26495
        #25163#26426#26495
        #26222#36890#26495
        #20809#26495
        '')
    end
    object ComboBox1: TComboBox
      Left = 109
      Top = 41
      Width = 141
      Height = 21
      ItemHeight = 13
      TabOrder = 9
      Visible = False
      Items.Strings = (
        #25163#26426#36890#23380#26495
        #25163#26426#26495
        #26222#36890#26495
        #20809#26495
        '')
    end
    object BitBtn2: TBitBtn
      Left = 249
      Top = 39
      Width = 22
      Height = 23
      TabOrder = 12
      Visible = False
      OnClick = BitBtn2Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
    object StaticText2: TStaticText
      Left = 273
      Top = 23
      Width = 253
      Height = 17
      Alignment = taCenter
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = '       '#24050#23450#20041#30340#26465#20214'      '
      Color = clGrayText
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 13
    end
    object SGrid1: TStringGrid
      Left = 273
      Top = 49
      Width = 254
      Height = 152
      ColCount = 3
      DefaultRowHeight = 19
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
      PopupMenu = PopupMenu1
      ScrollBars = ssHorizontal
      TabOrder = 14
      ColWidths = (
        68
        175
        2)
    end
    object DateTimePicker1: TDateTimePicker
      Left = 108
      Top = 96
      Width = 142
      Height = 21
      Date = 72686.576834120380000000
      Time = 72686.576834120380000000
      TabOrder = 15
    end
  end
  object Button1: TButton
    Left = 159
    Top = 228
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 303
    Top = 228
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 139
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
