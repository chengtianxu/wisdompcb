object Form1: TForm1
  Left = 477
  Top = 138
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35831#36141'/'#37319#36141#26597#35810
  ClientHeight = 334
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox4: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 233
    Caption = #38750#29983#20135#29289#26009#37319#36141
    TabOrder = 11
    Visible = False
    object Label10: TLabel
      Left = 88
      Top = 95
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#32456#27490#26085#26399
      Visible = False
    end
    object Label11: TLabel
      Left = 101
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #37319#36141#32534#21495
    end
    object Label12: TLabel
      Left = 88
      Top = 71
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object ComboBox4: TGroupBox
      Left = 99
      Top = 55
      Width = 178
      Height = 117
      TabOrder = 8
      Visible = False
      object CheckBox22: TCheckBox
        Tag = 1
        Left = 8
        Top = 20
        Width = 77
        Height = 17
        Caption = '1.'#24453#23457#25209
        TabOrder = 0
      end
      object CheckBox23: TCheckBox
        Tag = 2
        Left = 96
        Top = 20
        Width = 77
        Height = 17
        Caption = '2.'#34987#36864#22238
        TabOrder = 1
      end
      object CheckBox24: TCheckBox
        Tag = 3
        Left = 8
        Top = 44
        Width = 77
        Height = 17
        Caption = '3.'#24050#20445#30041
        TabOrder = 2
      end
      object CheckBox25: TCheckBox
        Tag = 4
        Left = 96
        Top = 44
        Width = 77
        Height = 17
        Caption = '4.'#24050#26242#32531
        TabOrder = 3
      end
      object CheckBox26: TCheckBox
        Tag = 5
        Left = 8
        Top = 68
        Width = 77
        Height = 17
        Caption = '5.'#24050#23457#26680
        TabOrder = 4
      end
      object CheckBox27: TCheckBox
        Tag = 6
        Left = 96
        Top = 68
        Width = 77
        Height = 17
        Caption = '6.'#24050#25910#36135
        TabOrder = 5
      end
      object CheckBox28: TCheckBox
        Tag = 7
        Left = 8
        Top = 92
        Width = 77
        Height = 17
        Caption = '7.'#24050#23436#25104
        TabOrder = 6
      end
      object CheckBox30: TCheckBox
        Tag = 8
        Left = 96
        Top = 92
        Width = 77
        Height = 17
        Caption = '8.'#26410#25552#20132
        TabOrder = 7
      end
    end
    object ComboBox2: TComboBox
      Left = 105
      Top = 66
      Width = 141
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnClick = ComboBox2Click
      OnKeyDown = ComboBox2KeyDown
    end
    object DTPk7: TDateTimePicker
      Left = 164
      Top = 66
      Width = 90
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 3
      Visible = False
    end
    object Edit4: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 4
      OnKeyUp = Edit4KeyUp
    end
    object ListBox4: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 178
      ItemHeight = 13
      Items.Strings = (
        #37319#36141#32534#21495
        #37319#36141#26085#26399
        #37319#36141#20154#21592
        #35831#36141#32534#21495
        #29289#21697#31867#21035
        #20379#24212#21830
        #29289#21697#21517#31216
        #29289#21697#35268#26684
        #35746#21333#29366#24577
        #24037#21378)
      TabOrder = 0
      OnClick = ListBox4Click
    end
    object StaticText5: TStaticText
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
      TabOrder = 1
    end
    object DTPk8: TDateTimePicker
      Left = 164
      Top = 91
      Width = 90
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 2
      Visible = False
    end
    object Button4: TButton
      Left = 107
      Top = 196
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 5
      OnClick = Button4Click
    end
    object BitBtn7: TBitBtn
      Left = 248
      Top = 63
      Width = 25
      Height = 25
      TabOrder = 6
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
  end
  object groupbox1: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 233
    Caption = #29983#20135#29289#26009#35831#36141
    TabOrder = 0
    object Label1: TLabel
      Left = 88
      Top = 95
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#32456#27490#26085#26399
      Visible = False
    end
    object Label6: TLabel
      Left = 101
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #35831#36141#32534#21495
    end
    object Label5: TLabel
      Left = 88
      Top = 71
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object ComboBox5: TGroupBox
      Left = 99
      Top = 55
      Width = 178
      Height = 117
      TabOrder = 7
      Visible = False
      object CheckBox8: TCheckBox
        Tag = 1
        Left = 8
        Top = 20
        Width = 79
        Height = 17
        Caption = '1.'#24453#23457#25209
        TabOrder = 0
      end
      object CheckBox9: TCheckBox
        Tag = 2
        Left = 96
        Top = 20
        Width = 79
        Height = 17
        Caption = '2.'#24453#37319#36141
        TabOrder = 1
      end
      object CheckBox10: TCheckBox
        Tag = 3
        Left = 8
        Top = 44
        Width = 79
        Height = 17
        Caption = '3.'#24050#25209#20934
        TabOrder = 2
      end
      object CheckBox11: TCheckBox
        Tag = 4
        Left = 96
        Top = 44
        Width = 79
        Height = 17
        Caption = '4.'#34987#36864#22238
        TabOrder = 3
      end
      object CheckBox12: TCheckBox
        Tag = 5
        Left = 8
        Top = 68
        Width = 79
        Height = 17
        Caption = '5.'#24050#25764#28040
        TabOrder = 4
      end
      object CheckBox13: TCheckBox
        Tag = 6
        Left = 96
        Top = 68
        Width = 79
        Height = 17
        Caption = '6.'#24050#22788#29702
        TabOrder = 5
      end
      object CheckBox14: TCheckBox
        Tag = 7
        Left = 8
        Top = 92
        Width = 79
        Height = 17
        Caption = '7.'#26410#25552#20132
        TabOrder = 6
      end
    end
    object DtPk1: TDateTimePicker
      Left = 164
      Top = 66
      Width = 90
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 3
      Visible = False
    end
    object Edit1: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 4
      OnKeyUp = Edit1KeyUp
    end
    object ListBox1: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 178
      ItemHeight = 13
      Items.Strings = (
        #35831#36141#32534#21495
        #35831#36141#37096#38376
        #35831#36141#26085#26399
        #35831#36141#20154#21592
        #24037#21378
        #29289#26009#32534#30721
        #20379' '#24212' '#21830
        #29289#26009#21517#31216
        #35831#36141#29366#24577)
      TabOrder = 0
      OnClick = ListBox1Click
    end
    object StaticText3: TStaticText
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
      TabOrder = 1
    end
    object DtPk2: TDateTimePicker
      Left = 164
      Top = 91
      Width = 90
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 2
      Visible = False
    end
    object Button2: TButton
      Left = 107
      Top = 175
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 5
      OnClick = Button2Click
    end
    object BitBtn5: TBitBtn
      Left = 248
      Top = 63
      Width = 25
      Height = 25
      TabOrder = 6
      Visible = False
      OnClick = BitBtn5Click
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
  object GroupBox2: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 233
    Caption = #38750#29983#20135#29289#26009#35831#36141
    TabOrder = 1
    Visible = False
    object Label2: TLabel
      Left = 88
      Top = 95
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#32456#27490#26085#26399
      Visible = False
    end
    object Label3: TLabel
      Left = 101
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #35831#36141#32534#21495
    end
    object Label4: TLabel
      Left = 88
      Top = 71
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object ComboBox6: TGroupBox
      Left = 99
      Top = 55
      Width = 178
      Height = 117
      TabOrder = 8
      Visible = False
      object CheckBox1: TCheckBox
        Tag = 1
        Left = 8
        Top = 20
        Width = 80
        Height = 17
        Caption = '1.'#24453#23457#25209
        TabOrder = 0
      end
      object CheckBox2: TCheckBox
        Tag = 2
        Left = 96
        Top = 20
        Width = 80
        Height = 17
        Caption = '2.'#24453#37319#36141
        TabOrder = 1
      end
      object CheckBox3: TCheckBox
        Tag = 3
        Left = 8
        Top = 44
        Width = 80
        Height = 17
        Caption = '3.'#24050#25209#20934
        TabOrder = 2
      end
      object CheckBox4: TCheckBox
        Tag = 4
        Left = 96
        Top = 44
        Width = 80
        Height = 17
        Caption = '4.'#34987#36864#22238
        TabOrder = 3
      end
      object CheckBox5: TCheckBox
        Tag = 5
        Left = 8
        Top = 68
        Width = 80
        Height = 17
        Caption = '5.'#24050#25764#28040
        TabOrder = 4
      end
      object CheckBox6: TCheckBox
        Tag = 6
        Left = 96
        Top = 68
        Width = 80
        Height = 17
        Caption = '6.'#24050#22788#29702
        TabOrder = 5
      end
      object CheckBox7: TCheckBox
        Tag = 7
        Left = 8
        Top = 92
        Width = 80
        Height = 17
        Caption = '7.'#26410#25552#20132
        TabOrder = 6
      end
    end
    object DTPk3: TDateTimePicker
      Left = 164
      Top = 66
      Width = 90
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 3
      Visible = False
    end
    object Edit2: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 4
      OnKeyUp = Edit2KeyUp
    end
    object ComboBox1: TComboBox
      Left = 103
      Top = 66
      Width = 141
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnClick = ComboBox1Click
      OnKeyDown = ComboBox1KeyDown
    end
    object ListBox2: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 178
      ItemHeight = 13
      Items.Strings = (
        #35831#36141#32534#21495
        #35831#36141#37096#38376
        #35831#36141#26085#26399
        #35831#36141#20154#21592
        #24037#21378
        #29289#21697#31867#21035
        #20379' '#24212' '#21830
        #29289#21697#21517#31216
        #29289#21697#35268#26684
        #35831#36141#29366#24577)
      TabOrder = 0
      OnClick = ListBox2Click
    end
    object StaticText1: TStaticText
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
      TabOrder = 1
    end
    object DTpk4: TDateTimePicker
      Left = 164
      Top = 91
      Width = 90
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 2
      Visible = False
    end
    object Button1: TButton
      Left = 107
      Top = 183
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 5
      OnClick = Button1Click
    end
    object BitBtn4: TBitBtn
      Left = 248
      Top = 63
      Width = 25
      Height = 25
      TabOrder = 6
      Visible = False
      OnClick = BitBtn4Click
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
  object GroupBox3: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 233
    Caption = #29983#20135#29289#26009#37319#36141
    TabOrder = 10
    Visible = False
    object Label7: TLabel
      Left = 88
      Top = 95
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#32456#27490#26085#26399
      Visible = False
    end
    object Label8: TLabel
      Left = 101
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #37319#36141#32534#21495
    end
    object Label9: TLabel
      Left = 88
      Top = 71
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object ComboBox3: TGroupBox
      Left = 99
      Top = 55
      Width = 178
      Height = 117
      TabOrder = 7
      Visible = False
      object CheckBox15: TCheckBox
        Tag = 1
        Left = 8
        Top = 20
        Width = 78
        Height = 17
        Caption = '1.'#24453#23457#25209
        TabOrder = 0
      end
      object CheckBox16: TCheckBox
        Tag = 2
        Left = 96
        Top = 20
        Width = 75
        Height = 17
        Caption = '2.'#34987#36864#22238
        TabOrder = 1
      end
      object CheckBox17: TCheckBox
        Tag = 3
        Left = 8
        Top = 44
        Width = 76
        Height = 17
        Caption = '3.'#24050#20445#30041
        TabOrder = 2
      end
      object CheckBox18: TCheckBox
        Tag = 4
        Left = 96
        Top = 44
        Width = 76
        Height = 17
        Caption = '4.'#24050#26242#32531
        TabOrder = 3
      end
      object CheckBox19: TCheckBox
        Tag = 5
        Left = 8
        Top = 68
        Width = 76
        Height = 17
        Caption = '5.'#24050#23457#26680
        TabOrder = 4
      end
      object CheckBox20: TCheckBox
        Tag = 6
        Left = 96
        Top = 68
        Width = 76
        Height = 17
        Caption = '6.'#24050#25910#36135
        TabOrder = 5
      end
      object CheckBox21: TCheckBox
        Tag = 7
        Left = 8
        Top = 92
        Width = 76
        Height = 17
        Caption = '7.'#24050#23436#25104
        TabOrder = 6
      end
      object CheckBox29: TCheckBox
        Tag = 8
        Left = 96
        Top = 92
        Width = 76
        Height = 17
        Caption = '8.'#26410#25552#20132
        TabOrder = 7
      end
    end
    object DTPk5: TDateTimePicker
      Left = 164
      Top = 66
      Width = 90
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 3
      Visible = False
    end
    object Edit3: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 4
      OnKeyUp = Edit3KeyUp
    end
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 174
      ItemHeight = 13
      Items.Strings = (
        #37319#36141#32534#21495
        #37319#36141#26085#26399
        #37319#36141#20154#21592
        #35831#36141#32534#21495
        #29289#26009#32534#21495
        #20379#24212#21830
        #29289#26009#21517#31216
        #35746#21333#29366#24577
        #29289#26009#31867#21035
        #24037#21378)
      TabOrder = 0
      OnClick = ListBox3Click
    end
    object StaticText4: TStaticText
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
      TabOrder = 1
    end
    object DTPk6: TDateTimePicker
      Left = 164
      Top = 91
      Width = 90
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 2
      Visible = False
    end
    object Button3: TButton
      Left = 107
      Top = 175
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 5
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 248
      Top = 63
      Width = 25
      Height = 25
      TabOrder = 6
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
  end
  object BitBtn3: TBitBtn
    Left = 545
    Top = 195
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 7
    OnClick = BitBtn3Click
    Kind = bkClose
  end
  object RadioGroup1: TRadioGroup
    Left = 101
    Top = 11
    Width = 428
    Height = 49
    Caption = #26597#25214#20869#23481
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26448#26009#35831#36141
      #26448#26009#37319#36141)
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object SGrid1: TStringGrid
    Left = 292
    Top = 97
    Width = 249
    Height = 158
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 3
    OnMouseDown = SGrid1MouseDown
    ColWidths = (
      76
      167
      250)
  end
  object StaticText2: TStaticText
    Left = 292
    Top = 81
    Width = 248
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
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 545
    Top = 84
    Width = 75
    Height = 25
    Caption = #26597#25214
    Default = True
    TabOrder = 5
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 545
    Top = 121
    Width = 75
    Height = 25
    Caption = #37325#32622
    TabOrder = 6
    OnClick = BitBtn2Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object RGp2: TRadioGroup
    Left = 195
    Top = 11
    Width = 105
    Height = 49
    Color = clBtnFace
    Ctl3D = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #29983#20135#29289#26009
      #38750#29983#20135#29289#26009)
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 8
    OnClick = RGp2Click
  end
  object RGp3: TRadioGroup
    Left = 416
    Top = 11
    Width = 113
    Height = 49
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      #29983#20135#29289#26009
      #38750#29983#20135#29289#26009)
    TabOrder = 9
    OnClick = RGp3Click
  end
  object RadioGroup2: TRadioGroup
    Left = 293
    Top = 260
    Width = 185
    Height = 51
    Caption = #37319#36141#22320#28857
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #22269#20869
      #22269#22806
      #20840#37096)
    TabOrder = 12
  end
  object BitBtn8: TBitBtn
    Left = 546
    Top = 158
    Width = 75
    Height = 25
    Caption = #37319#36141#27719#24635
    TabOrder = 13
    OnClick = BitBtn8Click
    Glyph.Data = {
      F2010000424DF201000000000000760000002800000024000000130000000100
      0400000000007C01000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
      3333333333388F3333333333000033334224333333333333338338F333333333
      0000333422224333333333333833338F33333333000033422222243333333333
      83333338F3333333000034222A22224333333338F33F33338F33333300003222
      A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
      38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
      2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
      0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
      333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
      33333A2224A2233333333338F338F83300003333333333A2224A333333333333
      8F338F33000033333333333A222433333333333338F338F30000333333333333
      A224333333333333338F38F300003333333333333A223333333333333338F8F3
      000033333333333333A3333333333333333383330000}
    NumGlyphs = 2
  end
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 583
    Top = 265
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select DESCRIPTION from data0075'
      'order by DESCRIPTION')
    Left = 583
    Top = 297
  end
  object DataSource5: TDataSource
    DataSet = ADOS276
    Left = 515
    Top = 266
  end
  object ADOS276: TADOStoredProc
    Connection = ADOConnection1
    ProcedureName = 'ep057;2'
    Parameters = <
      item
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        Direction = pdReturnValue
        Precision = 10
        Value = 0
      end
      item
        Name = '@purch_ptr'
        Attributes = [paNullable]
        DataType = ftInteger
        Precision = 10
        Value = 0
      end>
    Left = 549
    Top = 258
    object ADOS276USER_ID: TStringField
      DisplayLabel = #23457#25209#20154#20195#30721
      FieldName = 'USER_ID'
      Size = 10
    end
    object ADOS276auth_date: TDateTimeField
      DisplayLabel = #23457#25209#26085#26399
      FieldName = 'auth_date'
    end
    object ADOS276USER_FULL_NAME: TStringField
      DisplayLabel = #23457#25209#20154#22995#21517
      FieldName = 'USER_FULL_NAME'
      Size = 30
    end
    object ADOS276user_ptr: TIntegerField
      FieldName = 'user_ptr'
    end
    object ADOS276ranking: TWordField
      DisplayLabel = #23457#25209#39034#24207
      FieldName = 'ranking'
    end
    object ADOS276auth_flag: TStringField
      DisplayLabel = #23457#25209#29366#24577
      FieldKind = fkCalculated
      FieldName = 'auth_flag'
      Size = 6
      Calculated = True
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 568
    Top = 24
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
