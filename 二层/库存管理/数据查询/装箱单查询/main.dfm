object Form1: TForm1
  Left = 305
  Top = 230
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35013#36816#21450#21457#31080#26597#35810
  ClientHeight = 359
  ClientWidth = 662
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
  object GroupBox2: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 220
    Caption = #21457#36135#36890#30693#21333
    TabOrder = 2
    Visible = False
    object Label1: TLabel
      Left = 101
      Top = 103
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label2: TLabel
      Left = 101
      Top = 71
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Label3: TLabel
      Left = 101
      Top = 42
      Width = 67
      Height = 13
      Caption = #25552'  '#21333'  '#21495
    end
    object Edit2: TEdit
      Left = 101
      Top = 66
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
      OnKeyUp = Edit2KeyUp
    end
    object DTPk4: TDateTimePicker
      Left = 156
      Top = 99
      Width = 101
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 5
      Visible = False
    end
    object DTPk3: TDateTimePicker
      Left = 156
      Top = 67
      Width = 101
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 4
      Visible = False
    end
    object Button2: TButton
      Left = 107
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 6
      OnClick = Button2Click
    end
    object BitBtn5: TBitBtn
      Left = 248
      Top = 64
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
      Top = 40
      Width = 81
      Height = 172
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      Items.Strings = (
        #25552#21333#21495
        #35013#31665#21333#21495
        #23458#25143#20195#30721
        #21457#36816#26085#26399
        #38144#21806#35746#21333
        #26412#21378#32534#21495
        #23458#25143#35746#21333#21495
        #21457#31080#32534#21495
        #36890#30693#21333#21495
        #36816#36755#24037#20855#21495)
      TabOrder = 1
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
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 220
    Caption = #26631#20934#21457#31080
    TabOrder = 4
    Visible = False
    object Label4: TLabel
      Left = 101
      Top = 103
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label5: TLabel
      Left = 101
      Top = 71
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Label6: TLabel
      Left = 101
      Top = 42
      Width = 52
      Height = 13
      Caption = #21457#31080#32534#21495
    end
    object Edit3: TEdit
      Left = 101
      Top = 66
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
      OnKeyUp = Edit3KeyUp
    end
    object DTPk6: TDateTimePicker
      Left = 156
      Top = 99
      Width = 101
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 5
      Visible = False
    end
    object DTPK5: TDateTimePicker
      Left = 156
      Top = 67
      Width = 101
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 4
      Visible = False
    end
    object Button3: TButton
      Left = 107
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 6
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 248
      Top = 64
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
      Height = 172
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      Items.Strings = (
        #21457#31080#32534#21495
        #35013#31665#21333#21495
        #23458#25143#20195#30721
        #21457#31080#26085#26399
        #36755#20837#20154#21592)
      TabOrder = 1
      OnClick = ListBox3Click
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
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 220
    Caption = #20854#23427#21457#31080
    TabOrder = 3
    Visible = False
    object Label10: TLabel
      Left = 101
      Top = 103
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object Label11: TLabel
      Left = 101
      Top = 71
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Label12: TLabel
      Left = 101
      Top = 42
      Width = 52
      Height = 13
      Caption = #21457#31080#32534#21495
    end
    object Edit4: TEdit
      Left = 101
      Top = 66
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
      OnKeyUp = Edit4KeyUp
    end
    object DTPk8: TDateTimePicker
      Left = 156
      Top = 99
      Width = 101
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 5
      Visible = False
    end
    object DTPk7: TDateTimePicker
      Left = 156
      Top = 67
      Width = 101
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
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
      TabOrder = 6
      OnClick = Button4Click
    end
    object BitBtn7: TBitBtn
      Left = 248
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 2
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
    object ListBox4: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 172
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      Items.Strings = (
        #21457#31080#32534#21495
        #23458#25143#20195#30721
        #21457#31080#26085#26399
        #38144#21806#35746#21333
        #26412#21378#32534#21495
        #23458#25143#35746#21333#21495
        '')
      TabOrder = 1
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
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 77
    Width = 281
    Height = 220
    Caption = #35013#31665#21333
    TabOrder = 1
    object Label7: TLabel
      Left = 96
      Top = 92
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399':'
      Visible = False
    end
    object Label8: TLabel
      Left = 96
      Top = 49
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399':'
      Visible = False
    end
    object Label9: TLabel
      Left = 96
      Top = 36
      Width = 52
      Height = 13
      Caption = #35013#31665#21333#21495
    end
    object Edit1: TEdit
      Left = 96
      Top = 66
      Width = 139
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 4
      OnChange = Edit1Change
      OnKeyPress = Edit1KeyPress
    end
    object DTPk1: TDateTimePicker
      Left = 92
      Top = 66
      Width = 95
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
      Visible = False
    end
    object dttm3: TDateTimePicker
      Left = 190
      Top = 66
      Width = 88
      Height = 21
      Date = 38976.000000000000000000
      Time = 38976.000000000000000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 6
      Visible = False
    end
    object DTPk2: TDateTimePicker
      Left = 91
      Top = 110
      Width = 95
      Height = 21
      Date = 37575.906419108790000000
      Time = 37575.906419108790000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 7
      Visible = False
    end
    object Button1: TButton
      Left = 107
      Top = 167
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 9
      OnClick = Button1Click
    end
    object BitBtn4: TBitBtn
      Left = 240
      Top = 65
      Width = 25
      Height = 25
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
      Top = 40
      Width = 81
      Height = 172
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      Items.Strings = (
        #35013#31665#21333#21495
        #23458#25143#20195#30721
        #20986#36135#26085#26399
        #38144#21806#35746#21333
        #26412#21378#32534#21495
        #23458#25143#35746#21333#21495
        #21457#31080#32534#21495
        #21152#24037#24418#24335
        #24037#21378#20195#30721
        #26159#21542#24320#21333
        #26159#21542#24320#31080
        #21457#20986#21830#21697
        #25351#27966#26085#26399
        #20135#21697#23618#25968)
      TabOrder = 1
      OnClick = ListBox1Click
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
    object ComboBox1: TComboBox
      Left = 96
      Top = 66
      Width = 118
      Height = 21
      Style = csDropDownList
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #33258#21046
      Visible = False
      Items.Strings = (
        #33258#21046
        #21457#22806
        #21322#21046#31243)
    end
    object dttm4: TDateTimePicker
      Left = 189
      Top = 110
      Width = 88
      Height = 21
      Date = 38976.999305555550000000
      Time = 38976.999305555550000000
      ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      Kind = dtkTime
      TabOrder = 8
      Visible = False
    end
    object RadioGroup6: TRadioGroup
      Left = 96
      Top = 94
      Width = 157
      Height = 50
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        #31561#20110'='
        #19981#31561#20110'<>'
        #22823#20110'>')
      TabOrder = 10
      Visible = False
    end
  end
  object BitBtn1: TBitBtn
    Left = 557
    Top = 120
    Width = 75
    Height = 25
    Caption = #26597#25214
    TabOrder = 7
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
    Left = 557
    Top = 168
    Width = 75
    Height = 25
    Caption = #37325#32622
    TabOrder = 8
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
    Left = 557
    Top = 216
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 9
    OnClick = BitBtn3Click
    Kind = bkClose
  end
  object StaticText2: TStaticText
    Left = 300
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
  object SGrid1: TStringGrid
    Left = 300
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
    TabOrder = 6
    ColWidths = (
      76
      167
      250)
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 11
    Width = 542
    Height = 49
    Caption = #26597#25214#20869#23481
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      #35013'  '#31665'  '#21333
      #21457#36135#36890#30693
      #26631#20934#21457#31080
      #20854#23427#21457#31080)
    TabOrder = 0
    TabStop = True
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 302
    Top = 272
    Width = 163
    Height = 41
    Caption = #38754#31215
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #19981#21547#26495#36793
      #21547#26495#36793)
    TabOrder = 10
    TabStop = True
  end
  object ADOConnection1: TADOConnection
    KeepConnection = False
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 576
    Top = 35
  end
  object PopupMenu1: TPopupMenu
    Left = 576
    Top = 63
    object N1: TMenuItem
      Caption = #21024#38500'(&D)'
      OnClick = N1Click
    end
  end
  object aqtmp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 608
    Top = 32
  end
end
