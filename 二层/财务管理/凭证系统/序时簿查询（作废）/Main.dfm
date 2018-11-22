object FrmMain: TFrmMain
  Left = 393
  Top = 194
  BorderStyle = bsSingle
  Caption = #20250#35745#20998#24405#24207#26102#31807
  ClientHeight = 482
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 22
    Top = 429
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20250#35745#24180#24230':'
  end
  object Label2: TLabel
    Left = 22
    Top = 452
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #20250#35745#26399#38388':'
  end
  object Label3: TLabel
    Left = 340
    Top = 427
    Width = 59
    Height = 13
    Caption = #31185#30446#20195#30721':'
  end
  object GroupBox1: TGroupBox
    Left = 52
    Top = 274
    Width = 201
    Height = 118
    Caption = #20973#35777#31867#22411
    TabOrder = 0
    object CheckBox1: TCheckBox
      Left = 24
      Top = 19
      Width = 135
      Height = 17
      Caption = #36716#24080#20973#35777
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 24
      Top = 37
      Width = 135
      Height = 17
      Caption = #20184#27454#20973#35777
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = CheckBox1Click
    end
    object CheckBox3: TCheckBox
      Left = 24
      Top = 55
      Width = 135
      Height = 17
      Caption = #25910#27454#20973#35777
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object CheckBox4: TCheckBox
      Left = 24
      Top = 73
      Width = 135
      Height = 17
      Caption = #25910'/'#20184#27454#20973#35777
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox1Click
    end
    object CheckBox5: TCheckBox
      Left = 24
      Top = 91
      Width = 135
      Height = 17
      Caption = #29305#27530#36716#24080#20973#35777
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox1Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 268
    Top = 274
    Width = 162
    Height = 118
    Caption = #20973#35777#29366#24577
    TabOrder = 1
    object CheckBox6: TCheckBox
      Left = 32
      Top = 15
      Width = 81
      Height = 17
      Caption = #26410#23457#26680
      Checked = True
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox6Click
    end
    object CheckBox7: TCheckBox
      Left = 32
      Top = 64
      Width = 81
      Height = 17
      Caption = #20986#32435#24050#23457
      TabOrder = 1
      OnClick = CheckBox6Click
    end
    object CheckBox8: TCheckBox
      Left = 32
      Top = 81
      Width = 73
      Height = 17
      Caption = #24050#30331#24080
      TabOrder = 2
      OnClick = CheckBox6Click
    end
    object CheckBox9: TCheckBox
      Left = 32
      Top = 31
      Width = 73
      Height = 17
      Caption = #20250#35745#24050#23457
      TabOrder = 3
      OnClick = CheckBox6Click
    end
    object CheckBox10: TCheckBox
      Left = 32
      Top = 47
      Width = 81
      Height = 17
      Caption = #20027#31649#24050#23457
      TabOrder = 4
      OnClick = CheckBox6Click
    end
    object CheckBox11: TCheckBox
      Left = 32
      Top = 97
      Width = 73
      Height = 17
      Caption = #34987#20316#24223
      TabOrder = 5
      OnClick = CheckBox6Click
    end
  end
  object SpinEdit1: TSpinEdit
    Left = 84
    Top = 423
    Width = 58
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object SpinEdit2: TSpinEdit
    Left = 84
    Top = 447
    Width = 58
    Height = 22
    MaxLength = 2
    MaxValue = 12
    MinValue = 1
    TabOrder = 3
    Value = 1
  end
  object BitBtn1: TBitBtn
    Left = 165
    Top = 405
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 8
    TabOrder = 4
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 253
    Top = 405
    Width = 75
    Height = 25
    Cancel = True
    Caption = #36864#20986
    ModalResult = 2
    TabOrder = 5
    OnClick = BitBtn2Click
    NumGlyphs = 2
  end
  object Edit1: TEdit
    Left = 405
    Top = 424
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 502
    Height = 37
    Align = alTop
    TabOrder = 7
    object Label4: TLabel
      Left = 29
      Top = 13
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #20973#35777#26085#26399#20174':'
    end
    object Label5: TLabel
      Left = 218
      Top = 13
      Width = 20
      Height = 13
      Caption = #21040':'
    end
    object dtpk1: TDateTimePicker
      Left = 102
      Top = 10
      Width = 105
      Height = 21
      Date = 39445.000000000000000000
      Time = 39445.000000000000000000
      TabOrder = 0
    end
    object dtpk2: TDateTimePicker
      Left = 239
      Top = 10
      Width = 105
      Height = 21
      Date = 39272.000000000000000000
      Time = 39272.000000000000000000
      TabOrder = 1
    end
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 38
    Width = 252
    Height = 231
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 8
    TabStop = True
    object Label8: TLabel
      Left = 98
      Top = 42
      Width = 52
      Height = 13
      Caption = #20973#35777#32534#21495
    end
    object Label6: TLabel
      Left = 142
      Top = 88
      Width = 13
      Height = 13
      Caption = #33267
      Visible = False
    end
    object Edit3: TEdit
      Left = 98
      Top = 60
      Width = 119
      Height = 21
      TabOrder = 1
    end
    object Button3: TButton
      Left = 109
      Top = 175
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 218
      Top = 58
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
      Top = 40
      Width = 81
      Height = 182
      ItemHeight = 13
      Items.Strings = (
        #20973#35777#32534#21495
        #21442#32771#21495
        #21046#21333#21592
        #23457#26680#20250#35745
        #23457#26680#20027#31649
        #25688#35201
        #31185#30446
        #26041#21521
        #24065#31181
        #37329#39069
        #23458#25143#20195#30721
        #20379#24212#21830#20195#30721)
      TabOrder = 0
      OnClick = ListBox3Click
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
    object ComboBox1: TComboBox
      Left = 99
      Top = 60
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Visible = False
    end
    object Edit2: TEdit
      Left = 96
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 6
      Visible = False
    end
  end
  object SGrid1: TStringGrid
    Left = 258
    Top = 57
    Width = 239
    Height = 211
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 9
    ColWidths = (
      76
      166
      250)
  end
  object StaticText2: TStaticText
    Left = 259
    Top = 40
    Width = 238
    Height = 19
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
    TabOrder = 10
  end
  object Edit4: TEdit
    Left = 105
    Top = 140
    Width = 121
    Height = 21
    TabOrder = 11
    Visible = False
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 166
    object N1: TMenuItem
      Caption = #21024#38500
    end
  end
end
