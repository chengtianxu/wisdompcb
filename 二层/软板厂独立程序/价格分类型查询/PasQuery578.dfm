object FrmQuery578: TFrmQuery578
  Left = 372
  Top = 151
  BorderStyle = bsDialog
  Caption = #35746#21333#20215#26684#20998#31867#26597#35810
  ClientHeight = 372
  ClientWidth = 500
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    500
    372)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 7
    Top = 8
    Width = 490
    Height = 52
    Caption = #26597#35810#20869#23481
    TabOrder = 0
    object RadioButton1: TRadioButton
      Left = 24
      Top = 22
      Width = 59
      Height = 17
      Caption = #25353#35746#21333
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RadioButton1Click
    end
    object RadioButton2: TRadioButton
      Left = 138
      Top = 22
      Width = 60
      Height = 17
      Caption = #25353#20986#36135
      TabOrder = 1
      OnClick = RadioButton2Click
    end
    object RadioButton3: TRadioButton
      Left = 254
      Top = 22
      Width = 59
      Height = 17
      Caption = #25353#36864#36135
      TabOrder = 2
      OnClick = RadioButton3Click
    end
    object RadioButton4: TRadioButton
      Left = 368
      Top = 22
      Width = 60
      Height = 17
      Caption = #25353#25910#27454
      TabOrder = 3
      OnClick = RadioButton4Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 285
    Width = 501
    Height = 37
    TabOrder = 1
    object Label4: TLabel
      Left = 49
      Top = 11
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = #35746#21333#26085#26399#20174':'
    end
    object Label5: TLabel
      Left = 251
      Top = 12
      Width = 13
      Height = 13
      Caption = #21040
    end
    object dtpk1: TDateTimePicker
      Left = 122
      Top = 8
      Width = 123
      Height = 21
      Date = 39445.000000000000000000
      Time = 39445.000000000000000000
      DateMode = dmUpDown
      TabOrder = 0
    end
    object dtpk2: TDateTimePicker
      Left = 272
      Top = 8
      Width = 125
      Height = 21
      Date = 39272.999988425930000000
      Time = 39272.999988425930000000
      DateMode = dmUpDown
      TabOrder = 1
    end
  end
  object GroupBox6: TGroupBox
    Left = 0
    Top = 64
    Width = 254
    Height = 219
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 2
    TabStop = True
    object Label8: TLabel
      Left = 99
      Top = 42
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object lab_rkey15: TLabel
      Left = 120
      Top = 184
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object Edit1: TEdit
      Left = 99
      Top = 60
      Width = 119
      Height = 21
      TabOrder = 1
    end
    object Button3: TButton
      Left = 117
      Top = 159
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 219
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
      Height = 167
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #37319#36141#21333#21495
        #38144#21806#21333#21495
        #20135#21697#31867#22411
        #23458#25143#20195#30721
        #38144#21806#20195#34920
        #24037#21378#20195#30721
        #35746#21333#29366#24577
        #20135#21697#23646#24615
        #35746#21333#31867#22411)
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
      Left = 100
      Top = 60
      Width = 119
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      Visible = False
    end
    object GroupBox2: TGroupBox
      Left = 16
      Top = 162
      Width = 216
      Height = 57
      Caption = #25910#27454#31867#22411
      TabOrder = 6
      Visible = False
      object CheckBox1: TCheckBox
        Left = 16
        Top = 24
        Width = 73
        Height = 17
        Caption = #29616#37329#25910#27454
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 120
        Top = 24
        Width = 73
        Height = 17
        Caption = #36716#24080#25910#27454
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox2Click
      end
    end
  end
  object StaticText2: TStaticText
    Left = 255
    Top = 63
    Width = 244
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
  object SGrid1: TStringGrid
    Left = 254
    Top = 80
    Width = 246
    Height = 203
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 4
    ColWidths = (
      76
      164
      2)
  end
  object Panel2: TPanel
    Left = 0
    Top = 325
    Width = 500
    Height = 47
    Align = alBottom
    TabOrder = 5
    object BitBtn1: TBitBtn
      Left = 161
      Top = 8
      Width = 75
      Height = 28
      Caption = #30830#23450
      ModalResult = 8
      TabOrder = 0
      OnClick = BitBtn1Click
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 249
      Top = 8
      Width = 75
      Height = 28
      Cancel = True
      Caption = #20851#38381
      TabOrder = 1
      OnClick = BitBtn2Click
      NumGlyphs = 2
    end
  end
  object RadioGroup2: TRadioGroup
    Left = 94
    Top = 159
    Width = 157
    Height = 50
    Anchors = []
    Caption = #26465#20214
    Columns = 2
    Ctl3D = True
    ItemIndex = 0
    Items.Strings = (
      #31561#20110'='
      #30456#20284'Like')
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    OnClick = RadioGroup2Click
  end
  object PopupMenu1: TPopupMenu
    Left = 352
    Top = 132
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
