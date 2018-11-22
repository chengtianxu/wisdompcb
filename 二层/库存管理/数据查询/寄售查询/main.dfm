object Form1: TForm1
  Left = 299
  Top = 297
  Cursor = crArrow
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #23492#21806#26597#35810
  ClientHeight = 377
  ClientWidth = 628
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
  object GroupBox7: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 272
    Caption = #23492#21806#24211#23384#26126#32454
    TabOrder = 10
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
      Top = 42
      Width = 52
      Height = 13
      Caption = #29983#20135#26495#21495
    end
    object DTPk14: TDateTimePicker
      Left = 160
      Top = 91
      Width = 94
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 0
      Visible = False
    end
    object DTPk13: TDateTimePicker
      Left = 160
      Top = 66
      Width = 94
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 1
      Visible = False
    end
    object Button7: TButton
      Left = 139
      Top = 227
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button7Click
    end
    object BitBtn11: TBitBtn
      Left = 248
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 4
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
      Height = 221
      ItemHeight = 13
      Items.Strings = (
        #35746#21333#32534#21495
        #37319#36141#35746#21333#21495
        #20135#21697#31867#22411
        #23458#25143#20195#30721
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #20837#24211#20154#21592
        #20837#24211#26085#26399
        #23458#25143#29289#26009#21495)
      TabOrder = 5
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
      TabOrder = 6
    end
    object Edit7: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 2
      OnChange = Edit7Change
    end
    object GroupBox10: TGroupBox
      Left = 98
      Top = 132
      Width = 176
      Height = 77
      Caption = #26465#20214
      TabOrder = 7
      object RadioButton9: TRadioButton
        Left = 3
        Top = 24
        Width = 65
        Height = 17
        Caption = #31561#20110' ='
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton10: TRadioButton
        Left = 3
        Top = 51
        Width = 65
        Height = 17
        Caption = #22823#20110' >'
        TabOrder = 1
      end
      object RadioButton11: TRadioButton
        Left = 80
        Top = 24
        Width = 89
        Height = 17
        Caption = #19981#31561#20110' <> '
        TabOrder = 2
      end
      object RadioButton12: TRadioButton
        Left = 83
        Top = 51
        Width = 87
        Height = 17
        Caption = #30456#20284' like  '
        TabOrder = 3
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 549
    Top = 126
    Width = 75
    Height = 25
    Caption = #26597#25214
    Default = True
    TabOrder = 1
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
    Left = 549
    Top = 173
    Width = 75
    Height = 25
    Caption = #37325#32622
    TabOrder = 2
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
    Left = 549
    Top = 223
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 3
    OnClick = BitBtn3Click
    Kind = bkClose
  end
  object SGrid1: TStringGrid
    Left = 292
    Top = 97
    Width = 249
    Height = 196
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 4
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
    TabOrder = 5
  end
  object RadioGroup1: TRadioGroup
    Left = 87
    Top = 11
    Width = 462
    Height = 49
    Caption = #26597#25214#20869#23481
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #23492#21806#20837#20179
      #23492#21806#20986#20179
      #23492#21806#24211#23384)
    TabOrder = 6
    OnClick = RadioGroup1Click
  end
  object RGp4: TRadioGroup
    Left = 460
    Top = 306
    Width = 109
    Height = 41
    Caption = #26597#35810#31867#21035
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #26126#32454
      #27719#24635)
    TabOrder = 9
    Visible = False
    OnClick = RGp4Click
  end
  object RadioGroup3: TRadioGroup
    Left = 292
    Top = 307
    Width = 150
    Height = 40
    Caption = #20135#21697#31867#21035
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #37327#26495
      #26679#26495
      #20840#37096)
    TabOrder = 11
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 268
    Caption = #23492#21806#20837#20179#26126#32454
    TabOrder = 0
    object Label4: TLabel
      Left = 88
      Top = 103
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#32456#27490#26085#26399
      Visible = False
    end
    object Label3: TLabel
      Left = 88
      Top = 61
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = '  '#36215#22987#26085#26399
      Visible = False
    end
    object Label2: TLabel
      Left = 101
      Top = 43
      Width = 68
      Height = 13
      AutoSize = False
      Caption = #35746#21333#32534#21495
    end
    object RGp2: TRadioGroup
      Left = 102
      Top = 100
      Width = 139
      Height = 38
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        '>'
        '='
        '<')
      TabOrder = 10
      Visible = False
    end
    object Button1: TButton
      Left = 144
      Top = 231
      Width = 70
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object BitBtn4: TBitBtn
      Left = 248
      Top = 76
      Width = 25
      Height = 21
      TabOrder = 2
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
      Left = 10
      Top = 34
      Width = 81
      Height = 211
      ItemHeight = 13
      Items.Strings = (
        #35746#21333#32534#21495
        #37319#36141#35746#21333#21495
        #20135#21697#31867#22411
        #23458#25143#20195#30721
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #20837#24211#20154#21592
        #20837#24211#25968#37327
        #20837#24211#26085#26399
        #23458#25143#29289#26009#21495)
      TabOrder = 3
      OnClick = ListBox1Click
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
      TabOrder = 4
    end
    object Edit1: TEdit
      Left = 101
      Top = 74
      Width = 139
      Height = 21
      TabOrder = 0
      OnKeyPress = Edit1KeyPress
      OnKeyUp = Edit1KeyUp
    end
    object DateTimePicker1: TDateTimePicker
      Left = 98
      Top = 75
      Width = 93
      Height = 21
      Date = 38680.000000000000000000
      Time = 38680.000000000000000000
      TabOrder = 5
      Visible = False
    end
    object DateTimePicker2: TDateTimePicker
      Left = 192
      Top = 75
      Width = 80
      Height = 21
      Date = 38680.000000000000000000
      Time = 38680.000000000000000000
      Kind = dtkTime
      TabOrder = 6
      Visible = False
    end
    object DateTimePicker3: TDateTimePicker
      Left = 98
      Top = 118
      Width = 93
      Height = 21
      Date = 38680.000000000000000000
      Time = 38680.000000000000000000
      TabOrder = 7
      Visible = False
    end
    object DateTimePicker4: TDateTimePicker
      Left = 191
      Top = 118
      Width = 80
      Height = 21
      Date = 38680.999988425930000000
      Time = 38680.999988425930000000
      Kind = dtkTime
      TabOrder = 8
      Visible = False
    end
    object GroupBox8: TGroupBox
      Left = 96
      Top = 146
      Width = 176
      Height = 77
      Caption = #26465#20214
      TabOrder = 9
      object RadioButton1: TRadioButton
        Left = 3
        Top = 24
        Width = 65
        Height = 17
        Caption = #31561#20110' ='
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton3: TRadioButton
        Left = 3
        Top = 51
        Width = 65
        Height = 17
        Caption = #22823#20110' >'
        TabOrder = 1
      end
      object RadioButton2: TRadioButton
        Left = 80
        Top = 24
        Width = 89
        Height = 17
        Caption = #19981#31561#20110' <> '
        TabOrder = 2
      end
      object RadioButton4: TRadioButton
        Left = 83
        Top = 51
        Width = 87
        Height = 17
        Caption = #30456#20284' like  '
        TabOrder = 3
      end
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 272
    Caption = #23492#21806#24211#23384#27719#24635
    TabOrder = 8
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
      Width = 52
      Height = 13
      Caption = #23458#25143#37096#20214
    end
    object DTPk6: TDateTimePicker
      Left = 154
      Top = 91
      Width = 93
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 0
      Visible = False
    end
    object DTPk5: TDateTimePicker
      Left = 154
      Top = 66
      Width = 93
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 1
      Visible = False
    end
    object Button3: TButton
      Left = 141
      Top = 227
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 248
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 4
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
      Height = 223
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #20135#21697#31867#22411
        #23458#25143#20195#30721
        #20837#24211#26085#26399
        #23458#25143#29289#26009#21495)
      TabOrder = 5
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
      TabOrder = 6
    end
    object Edit3: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 2
      OnKeyUp = Edit3KeyUp
    end
    object GroupBox11: TGroupBox
      Left = 98
      Top = 130
      Width = 176
      Height = 77
      Caption = #26465#20214
      TabOrder = 7
      object RadioButton13: TRadioButton
        Left = 3
        Top = 24
        Width = 65
        Height = 17
        Caption = #31561#20110' ='
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton14: TRadioButton
        Left = 3
        Top = 51
        Width = 65
        Height = 17
        Caption = #22823#20110' >'
        TabOrder = 1
      end
      object RadioButton15: TRadioButton
        Left = 84
        Top = 22
        Width = 89
        Height = 17
        Caption = #19981#31561#20110' <> '
        TabOrder = 2
      end
      object RadioButton16: TRadioButton
        Left = 83
        Top = 51
        Width = 87
        Height = 17
        Caption = #30456#20284' like  '
        TabOrder = 3
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 272
    Caption = #23492#21806#20986#20179#26126#32454
    TabOrder = 7
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
    object dttm3: TDateTimePicker
      Left = 190
      Top = 71
      Width = 88
      Height = 21
      Date = 38976.000000000000000000
      Time = 38976.000000000000000000
      Kind = dtkTime
      TabOrder = 7
      Visible = False
    end
    object DTpk4: TDateTimePicker
      Left = 95
      Top = 109
      Width = 94
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      TabOrder = 0
      Visible = False
    end
    object DTPk3: TDateTimePicker
      Left = 95
      Top = 71
      Width = 94
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 1
      Visible = False
    end
    object Button2: TButton
      Left = 147
      Top = 229
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button2Click
    end
    object BitBtn5: TBitBtn
      Left = 241
      Top = 70
      Width = 25
      Height = 25
      TabOrder = 4
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
      Top = 35
      Width = 81
      Height = 230
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #35746#21333#32534#21495
        #37319#36141#21333#21495
        #23458#25143#20195#30721
        #25171#21360#21333#21495
        #25910#26009#21333#21495
        #24405#20837#26085#26399
        #39046#26009#26085#26399
        #23458#25143#29289#26009#21495)
      TabOrder = 5
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
      TabOrder = 6
    end
    object Edit2: TEdit
      Left = 95
      Top = 71
      Width = 135
      Height = 21
      TabOrder = 2
      OnKeyUp = Edit2KeyUp
    end
    object dttm4: TDateTimePicker
      Left = 190
      Top = 108
      Width = 88
      Height = 21
      Date = 38976.999305555550000000
      Time = 38976.999305555550000000
      Kind = dtkTime
      TabOrder = 8
      Visible = False
    end
    object GroupBox9: TGroupBox
      Left = 98
      Top = 138
      Width = 176
      Height = 77
      Caption = #26465#20214
      TabOrder = 9
      object RadioButton5: TRadioButton
        Left = 3
        Top = 24
        Width = 65
        Height = 17
        Caption = #31561#20110' ='
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RadioButton6: TRadioButton
        Left = 3
        Top = 51
        Width = 65
        Height = 17
        Caption = #22823#20110' >'
        TabOrder = 1
      end
      object RadioButton7: TRadioButton
        Left = 80
        Top = 24
        Width = 89
        Height = 17
        Caption = #19981#31561#20110' <> '
        TabOrder = 2
      end
      object RadioButton8: TRadioButton
        Left = 83
        Top = 51
        Width = 87
        Height = 17
        Caption = #30456#20284' like  '
        TabOrder = 3
      end
    end
  end
  object ADOConnection1: TADOConnection
    ConnectionTimeout = 25
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 551
    Top = 32
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    SQL.Strings = (
      'select convert(datetime,getdate(),120) as sys_datetime')
    Left = 584
    Top = 32
  end
end
