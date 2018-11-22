object Form1: TForm1
  Left = 306
  Top = 285
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26448#26009#36827#20986#23384#26597#35810
  ClientHeight = 345
  ClientWidth = 623
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label19: TLabel
    Left = 483
    Top = 296
    Width = 49
    Height = 13
    Caption = 'Label19'
    Visible = False
  end
  object Label20: TLabel
    Left = 486
    Top = 315
    Width = 49
    Height = 13
    Caption = 'Label20'
    Visible = False
  end
  object GroupBox5: TGroupBox
    Left = 4
    Top = 76
    Width = 281
    Height = 260
    Caption = #26448#26009#25509#25910#27719#24635
    TabOrder = 11
    Visible = False
    object Label13: TLabel
      Left = 102
      Top = 95
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label14: TLabel
      Left = 102
      Top = 55
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Label15: TLabel
      Left = 101
      Top = 40
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object Label_rkey15: TLabel
      Left = 120
      Top = 16
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object dttm9: TDateTimePicker
      Left = 192
      Top = 70
      Width = 82
      Height = 21
      Date = 38974.000000000000000000
      Time = 38974.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 7
      Visible = False
    end
    object DTPk10: TDateTimePicker
      Left = 92
      Top = 110
      Width = 96
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 0
      Visible = False
    end
    object DTPk9: TDateTimePicker
      Left = 92
      Top = 70
      Width = 96
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 1
      Visible = False
    end
    object Edit5: TEdit
      Left = 93
      Top = 70
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
      OnKeyUp = Edit5KeyUp
    end
    object Button5: TButton
      Left = 107
      Top = 151
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button5Click
    end
    object BitBtn8: TBitBtn
      Left = 243
      Top = 69
      Width = 25
      Height = 25
      TabOrder = 4
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
      Left = 7
      Top = 34
      Width = 81
      Height = 207
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      Items.Strings = (
        #26448#26009#32534#30721
        #26448#26009#31867#21035
        #25509#25910#26085#26399
        #20379#24212#21830
        #26448#26009#32452#21035
        #20837#24211#24037#21378
        #20837#20179#31867#22411
        #20837#24211#20179#24211)
      TabOrder = 5
      OnClick = ListBox5Click
    end
    object StaticText6: TStaticText
      Left = 7
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
      TabOrder = 6
    end
    object dttm10: TDateTimePicker
      Left = 192
      Top = 110
      Width = 82
      Height = 21
      Date = 38974.999305555550000000
      Time = 38974.999305555550000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 8
      Visible = False
    end
    object ComboBox3: TComboBox
      Left = 101
      Top = 194
      Width = 139
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = #32534#30721#20837#24211
      Visible = False
      Items.Strings = (
        #32534#30721#20837#24211
        #30452#25509#20837#24211
        #35843#25300#20837#24211
        'VMI'#20837#24211)
    end
  end
  object GroupBox6: TGroupBox
    Left = 4
    Top = 77
    Width = 281
    Height = 260
    Caption = #26448#26009#21457#25918#27719#24635
    TabOrder = 12
    Visible = False
    object Label16: TLabel
      Left = 102
      Top = 95
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label17: TLabel
      Left = 102
      Top = 55
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Label18: TLabel
      Left = 101
      Top = 39
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object DTpk11: TDateTimePicker
      Left = 92
      Top = 70
      Width = 95
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 1
      Visible = False
    end
    object Edit6: TEdit
      Left = 93
      Top = 70
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
      OnKeyUp = Edit6KeyUp
    end
    object dttm11: TDateTimePicker
      Left = 189
      Top = 70
      Width = 86
      Height = 21
      Date = 38974.000000000000000000
      Time = 38974.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 7
      Visible = False
    end
    object DTPk12: TDateTimePicker
      Left = 92
      Top = 110
      Width = 95
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 0
      Visible = False
    end
    object Button6: TButton
      Left = 107
      Top = 151
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button6Click
    end
    object BitBtn9: TBitBtn
      Left = 243
      Top = 68
      Width = 25
      Height = 25
      TabOrder = 4
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
      Left = 8
      Top = 35
      Width = 81
      Height = 207
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      Items.Strings = (
        #26448#26009#32534#30721
        #26448#26009#31867#21035
        #21457#25918#26085#26399
        #20379#24212#21830
        #26448#26009#32452#21035
        #24037#21378
        #37096#38376
        #29983#20135#21333#21495
        #20837#20179#31867#22411
        #39046#26009#21333#21495
        #21457#25918#20179#24211)
      TabOrder = 5
      OnClick = ListBox6Click
    end
    object StaticText7: TStaticText
      Left = 8
      Top = 18
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
      TabOrder = 6
    end
    object dttm12: TDateTimePicker
      Left = 189
      Top = 110
      Width = 86
      Height = 21
      Date = 38974.999305555550000000
      Time = 38974.999305555550000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 8
      Visible = False
    end
    object ComboBox5: TComboBox
      Left = 101
      Top = 194
      Width = 139
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = #32534#30721#20837#24211
      Visible = False
      Items.Strings = (
        #32534#30721#20837#24211
        #30452#25509#20837#24211
        #35843#25300#20837#24211
        'VMI'#20837#24211)
    end
  end
  object GroupBox7: TGroupBox
    Left = 4
    Top = 77
    Width = 281
    Height = 260
    Caption = #26448#26009#24211#23384#26126#32454
    TabOrder = 14
    Visible = False
    object Label21: TLabel
      Left = 101
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #26448#26009#32534#30721
    end
    object ComboBox1: TComboBox
      Left = 104
      Top = 64
      Width = 145
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #26377#25928
      Visible = False
      Items.Strings = (
        #26377#25928
        #24050#36807#26399)
    end
    object Edit7: TEdit
      Left = 105
      Top = 65
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 0
      OnChange = Edit7Change
      OnKeyPress = Edit7KeyPress
    end
    object Button7: TButton
      Left = 107
      Top = 151
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button7Click
    end
    object BitBtn11: TBitBtn
      Left = 248
      Top = 63
      Width = 25
      Height = 25
      TabOrder = 2
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
      Height = 207
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      Items.Strings = (
        #26448#26009#32534#30721
        #26448#26009#21517#31216
        #26448#26009#31867#21035
        #20379' '#24212' '#21830
        #24037#21378
        #20179#24211
        #26448#26009#35268#26684
        #29366#24577
        #21547#31246#20215
        #20837#24211#31867#22411
        #26448#26009#32452#21035)
      TabOrder = 3
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
      TabOrder = 4
    end
    object RadioGroup4: TRadioGroup
      Left = 94
      Top = 92
      Width = 177
      Height = 45
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110' ='
        #30456#20284' Like')
      TabOrder = 6
    end
  end
  object GroupBox4: TGroupBox
    Left = 4
    Top = 78
    Width = 281
    Height = 260
    Caption = #26448#26009#36716#31227
    TabOrder = 9
    Visible = False
    object Label10: TLabel
      Left = 89
      Top = 95
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#32456#27490#26085#26399
      Visible = False
    end
    object Label11: TLabel
      Left = 89
      Top = 71
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = ' '#36215#22987#26085#26399
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
    object RGp3: TRadioGroup
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
      TabOrder = 7
      Visible = False
    end
    object Edit4: TEdit
      Left = 105
      Top = 65
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 4
      OnKeyPress = Edit4KeyPress
      OnKeyUp = Edit4KeyUp
    end
    object DTPk7: TDateTimePicker
      Left = 151
      Top = 66
      Width = 97
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
      Visible = False
    end
    object ListBox4: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 207
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 13
      Items.Strings = (
        #36716#31227#21592#24037
        #36716#31227#26085#26399
        #36716#31227#25968#37327
        #26448#26009#32534#30721
        #22791#27880
        #36716#20986#24037#21378
        #36716#20837#24037#21378
        #36716#20986#20179#24211
        #36716#20837#20179#24211)
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
      Left = 151
      Top = 91
      Width = 97
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
      Visible = False
    end
    object Button4: TButton
      Left = 107
      Top = 151
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 5
      OnClick = Button4Click
    end
    object BitBtn7: TBitBtn
      Left = 249
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 6
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
  object BitBtn1: TBitBtn
    Left = 545
    Top = 80
    Width = 75
    Height = 25
    Caption = #26597#25214
    Default = True
    TabOrder = 0
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
    Top = 128
    Width = 75
    Height = 25
    Caption = #37325#32622
    TabOrder = 1
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
    Top = 208
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 2
    OnClick = BitBtn3Click
    Kind = bkClose
  end
  object SGrid1: TStringGrid
    Left = 291
    Top = 98
    Width = 249
    Height = 188
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
    Left = 291
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
  object RadioGroup1: TRadioGroup
    Left = 72
    Top = 11
    Width = 471
    Height = 49
    Caption = #26597#25214#20869#23481
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      #26448#26009#25509#25910
      #26448#26009#21457#25918
      #26448#26009#24211#23384
      #26448#26009#36716#31227)
    TabOrder = 7
    OnClick = RadioGroup1Click
  end
  object RGp4: TRadioGroup
    Left = 290
    Top = 287
    Width = 185
    Height = 49
    Caption = #32467#26524
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26126#32454
      #27719#24635)
    TabOrder = 10
    OnClick = RGp4Click
  end
  object BitBtn10: TBitBtn
    Left = 544
    Top = 168
    Width = 75
    Height = 25
    Caption = #32508#21512
    TabOrder = 13
    OnClick = BitBtn10Click
    Kind = bkAll
  end
  object GroupBox2: TGroupBox
    Left = 4
    Top = 76
    Width = 281
    Height = 260
    Caption = #26448#26009#21457#25918#26126#32454
    TabOrder = 6
    Visible = False
    object Label1: TLabel
      Left = 94
      Top = 96
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label6: TLabel
      Left = 94
      Top = 39
      Width = 52
      Height = 13
      Caption = #20986#20179#21333#21495
    end
    object Label5: TLabel
      Left = 94
      Top = 54
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Edit2: TEdit
      Left = 92
      Top = 70
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 4
      OnChange = Edit2Change
      OnKeyPress = Edit2KeyPress
    end
    object dttm3: TDateTimePicker
      Left = 186
      Top = 70
      Width = 86
      Height = 21
      Date = 38974.000000000000000000
      Time = 38974.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 7
      Visible = False
    end
    object DtPk3: TDateTimePicker
      Left = 92
      Top = 70
      Width = 95
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
      Visible = False
    end
    object RadioGroup2: TRadioGroup
      Left = 92
      Top = 91
      Width = 177
      Height = 49
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110' ='
        #30456#20284' Like')
      TabOrder = 9
    end
    object ListBox2: TListBox
      Left = 8
      Top = 32
      Width = 81
      Height = 214
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      Items.Strings = (
        #20986#20179#21333#21495
        #26448#26009#32534#30721
        #26448#26009#31867#21035
        #37197#26009#21333
        #39046#26009#37096#38376
        #21457#25918#26085#26399
        #26448#26009#32452#21035
        #39046#26009#24037#21378
        #39046#26009#21333#21495
        #20379#24212#21830
        #39046#26009#20154#21592
        #21457#25918#20179#24211
        #20837#20179#21333#21495
        #29983#20135#21333#21495
        #21547#31246#20215
        #20837#20179#31867#22411
        #24211#23384#24037#21378
        #26448#26009#21517#31216
        #26448#26009#35268#26684
        #39046#26009#31867#22411
        #30452#25509'/'#38388#25509#26448#26009)
      TabOrder = 0
      OnClick = ListBox2Click
    end
    object StaticText3: TStaticText
      Left = 8
      Top = 15
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
    object DtPk4: TDateTimePicker
      Left = 92
      Top = 111
      Width = 95
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
      Visible = False
    end
    object Button2: TButton
      Left = 107
      Top = 151
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 5
      OnClick = Button2Click
    end
    object BitBtn5: TBitBtn
      Left = 238
      Top = 69
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
    object dttm4: TDateTimePicker
      Left = 188
      Top = 111
      Width = 86
      Height = 21
      Date = 38974.999988425930000000
      Time = 38974.999988425930000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 8
      Visible = False
    end
    object ComboBox4: TComboBox
      Left = 93
      Top = 186
      Width = 139
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      TabOrder = 10
      Visible = False
      Items.Strings = (
        #32534#30721#20837#24211
        #30452#25509#20837#24211
        #35843#25300#20837#24211
        'VMI'#20837#24211)
    end
  end
  object GroupBox3: TGroupBox
    Left = 4
    Top = 77
    Width = 281
    Height = 260
    Caption = #26448#26009#24211#23384#27719#24635
    TabOrder = 8
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
      Left = 88
      Top = 71
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object Label9: TLabel
      Left = 101
      Top = 42
      Width = 52
      Height = 13
      Caption = #26448#26009#32534#30721
    end
    object Edit3: TEdit
      Left = 105
      Top = 65
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 4
      OnKeyUp = Edit3KeyUp
    end
    object DTPk5: TDateTimePicker
      Left = 157
      Top = 66
      Width = 91
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
      Visible = False
    end
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 207
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ItemHeight = 13
      Items.Strings = (
        #26448#26009#32534#30721
        #26448#26009#31867#21035
        #24037#21378
        #20179#24211
        #26377#25928#26399
        #20379#24212#21830
        #26448#26009#32452#21035
        #26448#26009#21517#31216
        #23433#20840#24211#23384#20302)
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
      Left = 157
      Top = 91
      Width = 91
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
      Visible = False
    end
    object Button3: TButton
      Left = 107
      Top = 151
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
    object CheckBox1: TCheckBox
      Left = 104
      Top = 68
      Width = 97
      Height = 17
      Caption = #20302#20110#23433#20840#24211#23384
      Checked = True
      State = cbChecked
      TabOrder = 7
      Visible = False
    end
  end
  object GroupBox1: TGroupBox
    Left = 4
    Top = 78
    Width = 281
    Height = 260
    Caption = #26448#26009#25509#25910#26126#32454
    TabOrder = 5
    object Label4: TLabel
      Left = 96
      Top = 92
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label3: TLabel
      Left = 93
      Top = 50
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Label2: TLabel
      Left = 95
      Top = 34
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #37319#36141#35746#21333
    end
    object ComboBox2: TComboBox
      Left = 93
      Top = 66
      Width = 139
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 10
      Text = #32534#30721#20837#24211
      Visible = False
      Items.Strings = (
        #32534#30721#20837#24211
        #30452#25509#20837#24211
        'VMI'#20837#24211)
    end
    object DTPk1: TDateTimePicker
      Left = 92
      Top = 66
      Width = 95
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 1
      Visible = False
    end
    object Edit1: TEdit
      Left = 93
      Top = 65
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 2
      OnKeyPress = Edit1KeyPress
      OnKeyUp = Edit1KeyUp
    end
    object DTTm1: TDateTimePicker
      Left = 188
      Top = 66
      Width = 82
      Height = 21
      Date = 38974.000000000000000000
      Time = 38974.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 7
      Visible = False
    end
    object RadioGroup3: TRadioGroup
      Left = 92
      Top = 91
      Width = 177
      Height = 39
      Caption = #26465#20214
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110' ='
        #30456#20284' Like')
      TabOrder = 9
    end
    object DTPk2: TDateTimePicker
      Left = 92
      Top = 108
      Width = 95
      Height = 21
      Date = 37575.000000000000000000
      Time = 37575.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 0
      Visible = False
    end
    object Button1: TButton
      Left = 107
      Top = 151
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object BitBtn4: TBitBtn
      Left = 248
      Top = 65
      Width = 25
      Height = 25
      TabOrder = 4
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
    object ListBox1: TListBox
      Left = 7
      Top = 35
      Width = 81
      Height = 207
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      Items.Strings = (
        #37319#36141#35746#21333
        #26448#26009#32534#30721
        #26448#26009#31867#21035
        #20837#24211#21333#21495
        #25509#25910#26085#26399
        #20379' '#24212' '#21830
        #20837#24211#24037#21378
        #36865#36135#21333#21495
        #26448#26009#32452#21035
        #26448#26009#21517#31216
        #20837#20179#31867#22411
        #36135#24065#20195#30721
        #26448#26009#35268#26684
        #20837#24211#20179#24211)
      TabOrder = 5
      OnClick = ListBox1Click
    end
    object StaticText1: TStaticText
      Left = 8
      Top = 18
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
      TabOrder = 6
    end
    object DTTm2: TDateTimePicker
      Left = 188
      Top = 108
      Width = 82
      Height = 21
      Date = 38974.999988425930000000
      Time = 38974.999988425930000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 8
      Visible = False
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 224
    Top = 280
  end
  object ADOserver_date: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      
        'SELECT SUBSTRING(CONVERT(varchar, getdate(),120), 1, 10) AS date' +
        '1 ')
    Left = 136
    Top = 280
    object ADOserver_datedate1: TStringField
      FieldName = 'date1'
      ReadOnly = True
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 560
    Top = 32
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
