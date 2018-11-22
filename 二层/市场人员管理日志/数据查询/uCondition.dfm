object frmCondition: TfrmCondition
  Left = 261
  Top = 249
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#26597#35810
  ClientHeight = 372
  ClientWidth = 667
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object GroupBox6: TGroupBox
    Left = 8
    Top = 137
    Width = 281
    Height = 196
    Caption = #38144#21806#24635#32467
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 9
    object Label10: TLabel
      Left = 101
      Top = 42
      Width = 76
      Height = 13
      AutoSize = False
      Caption = #24635#32467#32534#21495
    end
    object Edit3: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 2
      OnChange = Edit3Change
    end
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 121
      ItemHeight = 13
      Items.Strings = (
        #24635#32467#32534#21495
        #21019#24314#20154
        #21019#24314#20154#37096#38376
        #32844#20301)
      TabOrder = 0
      OnClick = ListBox3Click
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
    object Button3: TButton
      Left = 107
      Top = 119
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 248
      Top = 63
      Width = 25
      Height = 25
      TabOrder = 4
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
    object ComboBox3: TComboBox
      Left = 104
      Top = 66
      Width = 141
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #36319#21333#21592
      Visible = False
      Items.Strings = (
        #36319#21333#21592
        #19994#21153#21592
        #33829#38144#32463#29702
        #24320#21457#21103#24635)
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 137
    Width = 281
    Height = 196
    Caption = #38144#21806#35745#21010
    TabOrder = 4
    object Label7: TLabel
      Left = 101
      Top = 42
      Width = 76
      Height = 13
      AutoSize = False
      Caption = #35745#21010#32534#21495
    end
    object Edit1: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 2
      OnChange = Edit1Change
      OnKeyUp = Edit1KeyUp
    end
    object ListBox1: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 121
      ItemHeight = 13
      Items.Strings = (
        #35745#21010#32534#21495
        #35745#21010#20154
        #35745#21010#20154#37096#38376
        #32844#20301)
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
    object Button1: TButton
      Left = 107
      Top = 119
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object BitBtn4: TBitBtn
      Left = 247
      Top = 64
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
    object ComboBox1: TComboBox
      Left = 104
      Top = 66
      Width = 141
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #36319#21333#21592
      Visible = False
      Items.Strings = (
        #36319#21333#21592
        #19994#21153#21592
        #33829#38144#32463#29702
        #24320#21457#21103#24635)
    end
  end
  object GroupBox5: TGroupBox
    Left = 8
    Top = 137
    Width = 281
    Height = 196
    Caption = #24037#20316#26085#24535
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 7
    object Label9: TLabel
      Left = 101
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #26085#24535#32534#21495
    end
    object Edit2: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 2
      OnChange = Edit2Change
      OnKeyUp = Edit2KeyUp
    end
    object ListBox2: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 121
      ItemHeight = 13
      Items.Strings = (
        #26085#24535#32534#21495
        #21019#24314#20154
        #21019#24314#20154#37096#38376
        #32844#20301)
      TabOrder = 0
      OnClick = ListBox2Click
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
    object Button2: TButton
      Left = 107
      Top = 119
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 3
      OnClick = Button2Click
    end
    object BitBtn5: TBitBtn
      Left = 248
      Top = 63
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
    object ComboBox2: TComboBox
      Left = 104
      Top = 66
      Width = 141
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #36319#21333#21592
      Visible = False
      Items.Strings = (
        #36319#21333#21592
        #19994#21153#21592
        #33829#38144#32463#29702
        #24320#21457#21103#24635)
    end
  end
  object GroupBox1: TGroupBox
    Left = 96
    Top = 16
    Width = 201
    Height = 57
    Caption = #35745#21010#24180#24230
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 24
      Width = 39
      Height = 13
      Caption = #24320#22987#65306
    end
    object Label3: TLabel
      Left = 107
      Top = 24
      Width = 39
      Height = 13
      Caption = #32467#26463#65306
    end
    object YJH: TSpinEdit
      Left = 35
      Top = 24
      Width = 58
      Height = 22
      MaxValue = 9999
      MinValue = 1990
      TabOrder = 0
      Value = 1990
    end
    object SpinEdit1: TSpinEdit
      Left = 138
      Top = 24
      Width = 58
      Height = 22
      MaxValue = 9999
      MinValue = 1990
      TabOrder = 1
      Value = 1990
    end
  end
  object GroupBox2: TGroupBox
    Left = 344
    Top = 16
    Width = 201
    Height = 57
    Caption = #35745#21010#26376#20221
    TabOrder = 1
    object Label4: TLabel
      Left = 115
      Top = 24
      Width = 39
      Height = 13
      Caption = #32467#26463#65306
    end
    object Label2: TLabel
      Left = 4
      Top = 24
      Width = 39
      Height = 13
      Caption = #24320#22987#65306
    end
    object SpinEdit2: TSpinEdit
      Left = 152
      Top = 24
      Width = 42
      Height = 22
      MaxValue = 12
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
    object MJH: TSpinEdit
      Left = 39
      Top = 24
      Width = 42
      Height = 22
      MaxValue = 12
      MinValue = 1
      TabOrder = 1
      Value = 1
    end
  end
  object BitBtn3: TBitBtn
    Left = 573
    Top = 224
    Width = 70
    Height = 25
    Caption = #20851#38381
    TabOrder = 2
    Kind = bkClose
  end
  object BitBtn1: TBitBtn
    Left = 573
    Top = 96
    Width = 70
    Height = 25
    Caption = #26597#25214
    Default = True
    TabOrder = 3
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
  object StaticText2: TStaticText
    Left = 300
    Top = 140
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
    Top = 156
    Width = 249
    Height = 173
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
    Top = 80
    Width = 537
    Height = 49
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #38144#21806#35745#21010
      #24037#20316#26085#24535
      #38144#21806#24635#32467)
    TabOrder = 8
    OnClick = RadioGroup1Click
  end
  object BitBtn2: TBitBtn
    Left = 573
    Top = 160
    Width = 70
    Height = 25
    Caption = #37325#32622
    TabOrder = 10
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
  object PopupMenu1: TPopupMenu
    Left = 424
    Top = 247
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
