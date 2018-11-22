object frmQuerySet: TfrmQuerySet
  Left = 234
  Top = 212
  BorderStyle = bsDialog
  Caption = #26597#35810#26465#20214#35774#32622
  ClientHeight = 342
  ClientWidth = 620
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
    Left = 354
    Top = 130
    Width = 245
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
    Left = 354
    Top = 147
    Width = 247
    Height = 153
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssNone
    TabOrder = 1
    ColWidths = (
      67
      174
      2)
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 127
    Width = 330
    Height = 173
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
      Left = 141
      Top = 48
      Width = 137
      Height = 73
      ItemIndex = 0
      Items.Strings = (
        #37327#20135#26495
        #26679#26495)
      TabOrder = 6
      Visible = False
    end
    object edtValue: TEdit
      Left = 141
      Top = 48
      Width = 136
      Height = 21
      TabOrder = 0
      OnChange = edtValueChange
      OnKeyPress = edtValueKeyPress
    end
    object Button3: TButton
      Left = 141
      Top = 144
      Width = 62
      Height = 25
      Caption = #22686#21152
      Enabled = False
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
      Top = 40
      Width = 119
      Height = 121
      ItemHeight = 13
      TabOrder = 3
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
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
      Left = 216
      Top = 144
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 5
      OnClick = Button4Click
    end
    object ComboBox1: TComboBox
      Left = 144
      Top = 48
      Width = 132
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      Visible = False
      OnChange = ComboBox1Change
      Items.Strings = (
        #33258#21046
        #22806#21457
        #21322#21046#31243)
    end
    object GroupBox1: TGroupBox
      Left = 142
      Top = 48
      Width = 136
      Height = 76
      TabOrder = 8
      Visible = False
      object Label1: TLabel
        Left = 7
        Top = 18
        Width = 13
        Height = 13
        Caption = #20174
      end
      object Label2: TLabel
        Left = 7
        Top = 50
        Width = 13
        Height = 13
        Caption = #21040
      end
      object DateTimePicker1: TDateTimePicker
        Left = 22
        Top = 15
        Width = 98
        Height = 21
        Date = 39919.000000000000000000
        Time = 39919.000000000000000000
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 22
        Top = 47
        Width = 98
        Height = 21
        Date = 39919.000000000000000000
        Time = 39919.000000000000000000
        TabOrder = 1
      end
    end
    object GroupBox2: TGroupBox
      Left = 142
      Top = 74
      Width = 135
      Height = 69
      TabOrder = 9
      Visible = False
      object RadioButton1: TRadioButton
        Left = 8
        Top = 50
        Width = 68
        Height = 17
        Caption = #31561#20110' ='
        TabOrder = 0
      end
      object RadioButton2: TRadioButton
        Left = 8
        Top = 28
        Width = 98
        Height = 17
        Caption = #22823#20110#31561#20110' >='
        TabOrder = 1
      end
      object RadioButton3: TRadioButton
        Left = 8
        Top = 8
        Width = 109
        Height = 17
        Caption = #23567#20110#31561#20110' <='
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 136
      Top = 48
      Width = 188
      Height = 90
      TabOrder = 10
      Visible = False
      object CheckBox1: TCheckBox
        Left = 6
        Top = 16
        Width = 85
        Height = 17
        Caption = '0.'#27491#24120#25237#20135
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Tag = 1
        Left = 93
        Top = 16
        Width = 91
        Height = 17
        Caption = '1.'#34917#26009#25237#20135
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Tag = 2
        Left = 6
        Top = 42
        Width = 85
        Height = 17
        Caption = '2.MRB'#37325#25237
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Tag = 3
        Left = 93
        Top = 43
        Width = 91
        Height = 17
        Caption = '3.MRB'#36820#20462
        TabOrder = 3
        OnClick = CheckBox1Click
      end
      object CheckBox5: TCheckBox
        Tag = 4
        Left = 6
        Top = 68
        Width = 85
        Height = 17
        Caption = '4.'#26495#21495#25237#20135
        TabOrder = 4
        OnClick = CheckBox1Click
      end
    end
  end
  object Button1: TButton
    Left = 199
    Top = 307
    Width = 82
    Height = 28
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 335
    Top = 307
    Width = 82
    Height = 28
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object rgRptType: TRadioGroup
    Left = 7
    Top = 4
    Width = 186
    Height = 38
    Caption = #32479#35745#26041#24335
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      #27719#24635
      #26126#32454)
    TabOrder = 5
  end
  object rgUnit: TRadioGroup
    Left = 215
    Top = 4
    Width = 122
    Height = 80
    Caption = #32479#35745#21333#20301
    ItemIndex = 1
    Items.Strings = (
      'PCS'
      'PNL'
      #24179#26041#31859)
    TabOrder = 6
  end
  object rgSumType: TRadioGroup
    Left = 7
    Top = 47
    Width = 186
    Height = 38
    Caption = #27719#24635#26041#24335
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      #25353#29677#32452
      #25353#24037#24207)
    TabOrder = 7
  end
  object RadioGroup1: TRadioGroup
    Left = 354
    Top = 4
    Width = 247
    Height = 80
    Caption = #35746#21333#29366#24577
    ItemIndex = 2
    Items.Strings = (
      #19981#26174#31034#24050#23436#25104#20294#23578#26377#22312#21046#30340#35746#21333
      #21482#26174#31034#24050#23436#25104#20294#23578#26377#22312#21046#30340#35746#21333
      #26174#31034#20840#37096#22312#21046#21697)
    TabOrder = 8
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 87
    Width = 593
    Height = 40
    Caption = #29983#20135#29366#24577
    TabOrder = 9
    object CheckBox6: TCheckBox
      Tag = 3
      Left = 40
      Top = 15
      Width = 73
      Height = 17
      Caption = #29983#20135#20013
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox7: TCheckBox
      Tag = 4
      Left = 168
      Top = 15
      Width = 73
      Height = 17
      Caption = #22806#21457#29983#20135
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox8: TCheckBox
      Tag = 5
      Left = 280
      Top = 15
      Width = 73
      Height = 17
      Caption = #24453#20837#20179
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object CheckBox9: TCheckBox
      Tag = 6
      Left = 376
      Top = 15
      Width = 73
      Height = 17
      Caption = #24453#20998#37197
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object CheckBox10: TCheckBox
      Tag = 103
      Left = 488
      Top = 15
      Width = 97
      Height = 17
      Caption = #29983#20135#20013#26242#32531
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
  end
  object rgBB: TRadioGroup
    Left = 7
    Top = 296
    Width = 185
    Height = 41
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #19981#21547#26495#36793
      #21547#26495#36793)
    TabOrder = 10
  end
  object PopupMenu1: TPopupMenu
    Left = 392
    Top = 188
    object N1: TMenuItem
      Caption = #21024#38500'(&D)'
      OnClick = N1Click
    end
  end
end
