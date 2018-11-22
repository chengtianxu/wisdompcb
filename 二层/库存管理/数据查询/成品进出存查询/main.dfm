object Form1: TForm1
  Left = 266
  Top = 192
  Cursor = crArrow
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25104#21697#36827#20986#23384#26597#35810
  ClientHeight = 394
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
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
  object Label_rkey15: TLabel
    Left = 24
    Top = 18
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label_rkey16: TLabel
    Left = 45
    Top = 18
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 64
    Width = 281
    Height = 221
    Caption = #25104#21697#24211#23384#27719#24635
    TabOrder = 6
    Visible = False
    object Label7: TLabel
      Left = 97
      Top = 95
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label8: TLabel
      Left = 97
      Top = 71
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Label9: TLabel
      Left = 101
      Top = 42
      Width = 92
      Height = 13
      AutoSize = False
      Caption = #23458#25143#37096#20214
    end
    object Label23: TLabel
      Left = 195
      Top = 153
      Width = 14
      Height = 13
      Caption = '(,'
      Visible = False
    end
    object Edit3: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 4
      OnChange = Edit3Change
      OnDblClick = Edit3DblClick
      OnKeyUp = Edit3KeyUp
    end
    object DTPk6: TDateTimePicker
      Left = 154
      Top = 91
      Width = 93
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 6
      Visible = False
    end
    object DTPk5: TDateTimePicker
      Left = 154
      Top = 66
      Width = 93
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 5
      Visible = False
    end
    object Button3: TButton
      Left = 107
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 7
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 248
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 3
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
      Height = 177
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #24037#21378
        #20179#24211
        #23458#25143#20195#30721
        #20837#20179#26085#26399
        #20135#21697#31867#22411
        #27979#35797#25104#22411#22791#27880
        #22909#26495#21449#26495
        #21608#26399
        #20851#32852#21407#23458#25143)
      TabOrder = 1
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
      TabOrder = 0
    end
    object rg1: TRadioGroup
      Left = 104
      Top = 56
      Width = 145
      Height = 33
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #22909#26495
        #21449#26495)
      TabOrder = 2
      Visible = False
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 65
    Width = 281
    Height = 221
    Caption = #25104#21697#36716#31227
    TabOrder = 1
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
    object Label12: TLabel
      Left = 101
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #36716#31227#21592#24037
    end
    object Label11: TLabel
      Left = 88
      Top = 71
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object Edit4: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 3
      OnKeyPress = Edit4KeyPress
      OnKeyUp = Edit4KeyUp
    end
    object DTPk7: TDateTimePicker
      Left = 160
      Top = 66
      Width = 94
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 4
      Visible = False
    end
    object Button4: TButton
      Left = 107
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 7
      OnClick = Button4Click
    end
    object BitBtn7: TBitBtn
      Left = 248
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 2
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
      TabOrder = 0
    end
    object ListBox4: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 127
      ItemHeight = 13
      Items.Strings = (
        #36716#31227#21592#24037
        #36716#31227#26085#26399
        #36716#31227#25968#37327
        #36716#20986#26495#21495
        #36716#20837#26495#21495)
      TabOrder = 1
      OnClick = ListBox4Click
    end
    object RadioGroup2: TRadioGroup
      Left = 105
      Top = 90
      Width = 139
      Height = 38
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '>'
        '='
        '<')
      TabOrder = 5
      Visible = False
    end
    object DTpk8: TDateTimePicker
      Left = 160
      Top = 91
      Width = 94
      Height = 21
      Date = 37575.000000000000000000
      Time = 37575.000000000000000000
      TabOrder = 6
      Visible = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 76
    Width = 281
    Height = 211
    Caption = #25104#21697#20837#20179#26126#32454
    TabOrder = 2
    object Label4: TLabel
      Left = 88
      Top = 106
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#32456#27490#26085#26399
      Visible = False
    end
    object Label3: TLabel
      Left = 89
      Top = 60
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object Label2: TLabel
      Left = 101
      Top = 77
      Width = 100
      Height = 13
      AutoSize = False
      Caption = #24037#20316#35746#21333
    end
    object ListBox1: TListBox
      Left = 10
      Top = 34
      Width = 81
      Height = 174
      ItemHeight = 13
      Items.Strings = (
        #20316#19994#21333#21495
        #26412#21378#32534#21495
        #20135#21697#32452#21035
        #20179#24211
        #23458#25143#20195#30721
        #20837#20179#26085#26399
        #20837#20179#25968#37327
        #20135#21697#31867#22411
        #23458#25143#22411#21495
        #38144#21806#35746#21333
        #20837#20179#21333#21495
        #23618#25968
        #27979#24335#25104#22411#22791#27880
        #20851#32852#21407#23458#25143
        #22909#26495#21449#26495
        #21608#26399
        #20135#21697#38454#25968
        #24037#21378
        #36135#24065#20195#30721)
      TabOrder = 1
      OnClick = ListBox1Click
    end
    object DateTimePicker2: TDateTimePicker
      Left = 189
      Top = 77
      Width = 80
      Height = 21
      Date = 38680.000000000000000000
      Time = 38680.000000000000000000
      Kind = dtkTime
      TabOrder = 6
      Visible = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 97
      Top = 78
      Width = 93
      Height = 21
      Date = 38680.000000000000000000
      Time = 38680.000000000000000000
      TabOrder = 4
      Visible = False
    end
    object RGp2: TRadioGroup
      Left = 111
      Top = 130
      Width = 139
      Height = 38
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '>'
        '='
        '<')
      TabOrder = 7
      Visible = False
    end
    object Button1: TButton
      Left = 143
      Top = 162
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 10
      OnClick = Button1Click
    end
    object BitBtn4: TBitBtn
      Left = 248
      Top = 101
      Width = 25
      Height = 25
      TabOrder = 3
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
    object StaticText1: TStaticText
      Left = 10
      Top = 17
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
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 103
      Top = 103
      Width = 139
      Height = 21
      TabOrder = 5
      OnKeyPress = Edit1KeyPress
      OnKeyUp = Edit1KeyUp
    end
    object DateTimePicker3: TDateTimePicker
      Left = 101
      Top = 126
      Width = 93
      Height = 21
      Date = 38680.000000000000000000
      Time = 38680.000000000000000000
      TabOrder = 8
      Visible = False
    end
    object DateTimePicker4: TDateTimePicker
      Left = 192
      Top = 125
      Width = 79
      Height = 21
      Date = 38680.999988425930000000
      Time = 38680.999988425930000000
      Kind = dtkTime
      TabOrder = 9
      Visible = False
    end
    object rgIsChaBan: TRadioGroup
      Left = 97
      Top = 90
      Width = 161
      Height = 41
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #22909#26495
        #21449#26495)
      TabOrder = 2
      Visible = False
    end
    object ComboBox7: TComboBox
      Left = 106
      Top = 101
      Width = 141
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 11
      Visible = False
    end
  end
  object GroupBox7: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 221
    Caption = #25104#21697#24211#23384#26126#32454
    TabOrder = 3
    Visible = False
    object Label19: TLabel
      Left = 88
      Top = 95
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#32456#27490#26085#26399
      Visible = False
    end
    object Label20: TLabel
      Left = 88
      Top = 71
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object Label21: TLabel
      Left = 101
      Top = 45
      Width = 92
      Height = 13
      AutoSize = False
      Caption = #29983#20135#26495#21495
    end
    object Label22: TLabel
      Left = 195
      Top = 153
      Width = 14
      Height = 13
      Caption = '(,'
      Visible = False
    end
    object Edit7: TEdit
      Left = 105
      Top = 67
      Width = 139
      Height = 21
      TabOrder = 5
      OnChange = Edit7Change
      OnDblClick = Edit7DblClick
    end
    object ComboBox1: TComboBox
      Left = 105
      Top = 68
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Text = #20869#38144
      Items.Strings = (
        #20869#38144
        #36716#21378)
    end
    object DTPk14: TDateTimePicker
      Left = 160
      Top = 91
      Width = 94
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 7
      Visible = False
    end
    object DTPk13: TDateTimePicker
      Left = 160
      Top = 66
      Width = 94
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 4
      Visible = False
    end
    object Button7: TButton
      Left = 107
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 8
      OnClick = Button7Click
    end
    object BitBtn11: TBitBtn
      Left = 248
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 3
      Visible = False
      OnClick = BitBtn11Click
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
    object ListBox7: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 177
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #20179#24211#20195#30721
        #23458#25143#20195#30721
        #20837#20179#26085#26399
        #20135#21697#31867#22411
        #24037#21378
        #38144#21806#26041#24335
        #27979#24335#25104#22411#22791#27880
        #20851#32852#21407#23458#25143
        #22909#26495#21449#26495
        #21608#26399
        #20135#21697#38454#25968
        '')
      TabOrder = 1
      OnClick = ListBox7Click
    end
    object StaticText8: TStaticText
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
      TabOrder = 0
    end
    object rg2: TRadioGroup
      Left = 112
      Top = 64
      Width = 129
      Height = 41
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #22909#26495
        #21449#26495)
      TabOrder = 2
    end
    object ComboBox6: TComboBox
      Left = 106
      Top = 74
      Width = 141
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 9
      Visible = False
    end
  end
  object GroupBox5: TGroupBox
    Left = 9
    Top = 67
    Width = 281
    Height = 221
    Caption = #25104#21697#20837#20179#27719#24635
    TabOrder = 5
    Visible = False
    object Label13: TLabel
      Left = 88
      Top = 104
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#32456#27490#26085#26399
      Visible = False
    end
    object Label14: TLabel
      Left = 88
      Top = 51
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object Label15: TLabel
      Left = 101
      Top = 31
      Width = 92
      Height = 13
      AutoSize = False
      Caption = #20135#21697#20195#30721
    end
    object Edit5: TEdit
      Left = 105
      Top = 74
      Width = 139
      Height = 21
      TabOrder = 2
      OnKeyUp = Edit5KeyUp
    end
    object RadioGroup7: TRadioGroup
      Left = 105
      Top = 97
      Width = 165
      Height = 52
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110#65309
        #19981#31561#20110'<>'
        #22823#20110'>')
      TabOrder = 6
      Visible = False
    end
    object Button5: TButton
      Left = 107
      Top = 158
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 9
      OnClick = Button5Click
    end
    object BitBtn8: TBitBtn
      Left = 251
      Top = 79
      Width = 25
      Height = 25
      TabOrder = 3
      Visible = False
      OnClick = BitBtn8Click
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
    object ListBox5: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 177
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #20135#21697#31867#22411
        #20837#20179#26085#26399
        #23458#25143
        #24037#21378
        #20179#24211
        #23458#25143#22411#21495
        #23618#25968
        #27979#35797#25104#22411#22791#27880)
      TabOrder = 1
      OnClick = ListBox5Click
    end
    object StaticText6: TStaticText
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
      TabOrder = 0
    end
    object DateTimePicker5: TDateTimePicker
      Left = 101
      Top = 95
      Width = 93
      Height = 21
      Date = 38680.000000000000000000
      Time = 38680.000000000000000000
      TabOrder = 4
      Visible = False
    end
    object DateTimePicker6: TDateTimePicker
      Left = 195
      Top = 95
      Width = 79
      Height = 21
      Date = 38680.000000000000000000
      Time = 38680.000000000000000000
      Kind = dtkTime
      TabOrder = 5
      Visible = False
    end
    object DateTimePicker7: TDateTimePicker
      Left = 104
      Top = 127
      Width = 92
      Height = 21
      Date = 38680.000000000000000000
      Time = 38680.000000000000000000
      TabOrder = 7
      Visible = False
    end
    object DateTimePicker8: TDateTimePicker
      Left = 192
      Top = 127
      Width = 79
      Height = 21
      Date = 38680.999988425930000000
      Time = 38680.999988425930000000
      Kind = dtkTime
      TabOrder = 8
      Visible = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 73
    Width = 281
    Height = 221
    Caption = #25104#21697#20986#20179#26126#32454
    TabOrder = 4
    Visible = False
    object Label6: TLabel
      Left = 101
      Top = 39
      Width = 52
      Height = 13
      Caption = #38144#21806#35746#21333
    end
    object Label1: TLabel
      Left = 101
      Top = 95
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label5: TLabel
      Left = 101
      Top = 57
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Edit2: TEdit
      Left = 95
      Top = 71
      Width = 135
      Height = 21
      TabOrder = 5
      OnKeyUp = Edit2KeyUp
    end
    object ComboBox2: TComboBox
      Left = 95
      Top = 71
      Width = 137
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = #33258#21046
      Visible = False
      Items.Strings = (
        #33258#21046
        #22806#21457
        #21322#21046#31243)
    end
    object dttm3: TDateTimePicker
      Left = 190
      Top = 71
      Width = 88
      Height = 21
      Date = 38976.000000000000000000
      Time = 38976.000000000000000000
      Kind = dtkTime
      TabOrder = 6
      Visible = False
    end
    object DTpk4: TDateTimePicker
      Left = 95
      Top = 109
      Width = 94
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 9
      Visible = False
    end
    object DTPk3: TDateTimePicker
      Left = 95
      Top = 71
      Width = 94
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 3
      Visible = False
    end
    object Button2: TButton
      Left = 127
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 10
      OnClick = Button2Click
    end
    object BitBtn5: TBitBtn
      Left = 241
      Top = 70
      Width = 25
      Height = 25
      TabOrder = 2
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
    object ListBox2: TListBox
      Left = 10
      Top = 33
      Width = 81
      Height = 186
      ItemHeight = 13
      Items.Strings = (
        #38144#21806#35746#21333
        #35013#31665#21333#21495
        #26412#21378#32534#21495
        #20135#21697#32452#21035
        #20179#24211
        #23458#25143#20195#30721
        #25351#27966#26085#26399
        #20135#21697#31867#22411
        #23458#25143#35746#21333#21495
        #23458#25143#22411#21495
        #21152#24037#24418#24335
        #20986#36135#26085#26399
        #36135#24065#20195#30721
        #20135#21697#23618#25968
        #20851#32852#21407#23458#25143
        #20135#21697#38454#25968
        #24037#21378
        #25253#20851#21333#21495)
      TabOrder = 1
      OnClick = ListBox2Click
    end
    object StaticText3: TStaticText
      Left = 10
      Top = 16
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
      TabOrder = 0
    end
    object dttm4: TDateTimePicker
      Left = 190
      Top = 108
      Width = 88
      Height = 21
      Date = 38976.999305555550000000
      Time = 38976.999305555550000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      Kind = dtkTime
      TabOrder = 8
      Visible = False
    end
    object RadioGroup5: TRadioGroup
      Left = 95
      Top = 92
      Width = 157
      Height = 50
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110'='
        #19981#31561#20110'<>'
        #22823#20110'>')
      TabOrder = 7
      Visible = False
    end
    object ComboBox5: TComboBox
      Left = 100
      Top = 71
      Width = 141
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 11
      Visible = False
    end
  end
  object GroupBox6: TGroupBox
    Left = 6
    Top = 68
    Width = 281
    Height = 221
    Caption = #25104#21697#20986#20179#27719#24635
    TabOrder = 7
    Visible = False
    object Label16: TLabel
      Left = 101
      Top = 96
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label17: TLabel
      Left = 101
      Top = 58
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Label18: TLabel
      Left = 101
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #20135#21697#20195#30721
    end
    object Edit6: TEdit
      Left = 105
      Top = 72
      Width = 124
      Height = 21
      TabOrder = 5
      OnKeyUp = Edit6KeyUp
    end
    object ComboBox3: TComboBox
      Left = 104
      Top = 72
      Width = 126
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = #33258#21046
      Visible = False
      Items.Strings = (
        #33258#21046
        #22806#21457
        #21322#21046#31243)
    end
    object dttm11: TDateTimePicker
      Left = 184
      Top = 72
      Width = 84
      Height = 21
      Date = 38976.000000000000000000
      Time = 38976.000000000000000000
      Kind = dtkTime
      TabOrder = 6
      Visible = False
    end
    object DTPk12: TDateTimePicker
      Left = 94
      Top = 110
      Width = 93
      Height = 21
      Date = 37575.000000000000000000
      Time = 37575.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 8
      Visible = False
    end
    object DTPk11: TDateTimePicker
      Left = 94
      Top = 72
      Width = 94
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 3
      Visible = False
    end
    object Button6: TButton
      Left = 107
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 10
      OnClick = Button6Click
    end
    object BitBtn9: TBitBtn
      Left = 238
      Top = 70
      Width = 25
      Height = 25
      TabOrder = 2
      Visible = False
      OnClick = BitBtn9Click
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
    object ListBox6: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 177
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #20135#21697#31867#22411
        #25351#27966#26085#26399
        #23458#25143
        #24037#21378
        #20179#24211
        #23458#25143#22411#21495
        #21152#24037#24418#24335
        #20986#36135#26085#26399
        #20135#21697#23618#25968
        '')
      TabOrder = 1
      OnClick = ListBox6Click
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
      TabOrder = 0
    end
    object dttm12: TDateTimePicker
      Left = 191
      Top = 111
      Width = 84
      Height = 21
      Date = 38976.999305555550000000
      Time = 38976.999305555550000000
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      Kind = dtkTime
      TabOrder = 9
      Visible = False
    end
    object RadioGroup6: TRadioGroup
      Left = 93
      Top = 92
      Width = 157
      Height = 50
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110'='
        #19981#31561#20110'<>'
        #22823#20110'>')
      TabOrder = 7
      Visible = False
    end
  end
  object RadioGroup4: TRadioGroup
    Left = 152
    Top = 330
    Width = 149
    Height = 39
    Caption = #25351#27966#31867#22411
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #27491#24120
      #36864#36135
      #20840#37096)
    TabOrder = 19
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 545
    Top = 80
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 8
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
    TabOrder = 11
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
  object BitBtn3: TBitBtn
    Left = 545
    Top = 203
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 13
    OnClick = BitBtn3Click
    Kind = bkClose
  end
  object SGrid1: TStringGrid
    Left = 292
    Top = 97
    Width = 249
    Height = 176
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 10
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
    TabOrder = 9
  end
  object RadioGroup1: TRadioGroup
    Left = 79
    Top = 11
    Width = 450
    Height = 49
    Caption = #26597#25214#20869#23481
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      #25104#21697#20837#20179
      #25104#21697#20986#20179
      #25104#21697#24211#23384
      #25104#21697#36716#31227)
    TabOrder = 0
    OnClick = RadioGroup1Click
  end
  object RGp3: TRadioGroup
    Left = 303
    Top = 289
    Width = 117
    Height = 72
    ItemIndex = 0
    Items.Strings = (
      #24050#35013#36816
      #26410#35013#36816
      #20840#37096)
    TabOrder = 16
    Visible = False
  end
  object RGp4: TRadioGroup
    Left = 424
    Top = 288
    Width = 120
    Height = 73
    ItemIndex = 0
    Items.Strings = (
      #26126'  '#32454
      #27719'  '#24635)
    TabOrder = 14
    OnClick = RGp4Click
  end
  object BitBtn10: TBitBtn
    Left = 544
    Top = 162
    Width = 75
    Height = 25
    Caption = #32508#21512
    TabOrder = 12
    OnClick = BitBtn10Click
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
  object RadioGroup3: TRadioGroup
    Left = 152
    Top = 289
    Width = 150
    Height = 40
    Caption = #20135#21697#23646#24615
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #37327#26495
      #26679#26495
      #20840#37096)
    TabOrder = 15
  end
  object ComboBox4: TComboBox
    Left = 11
    Top = 296
    Width = 117
    Height = 21
    Style = csDropDownList
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 17
    Text = #27491#24120#36807#25968#20837#20179
    Items.Strings = (
      #27491#24120#36807#25968#20837#20179
      #36864#36135#37325#26816#20837#20179
      #36820#20462#37325#26816#20837#20179
      #30452#25509#20837#20179
      #22996#22806#21152#24037#20837#20179
      #22996#22806#21152#24037#36864#36135#20837#20179
      #38144#21806#36864#36135#20837#20179
      #36716#25442#20837#20179
      #30424#28857#20837#20179
      #20840#37096)
  end
  object RadioGroup8: TRadioGroup
    Left = 11
    Top = 319
    Width = 120
    Height = 48
    Caption = #38754#31215#35745#31639
    ItemIndex = 0
    Items.Strings = (
      #19981#21547#29983#20135#26495#36793
      #21547#29983#20135#26495#36793)
    TabOrder = 18
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 554
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 640
    Top = 32
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 376
    Top = 168
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
