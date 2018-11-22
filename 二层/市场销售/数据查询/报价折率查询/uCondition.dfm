object frmCondition: TfrmCondition
  Left = 258
  Top = 284
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810#26465#20214
  ClientHeight = 267
  ClientWidth = 656
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
  object RadioGroup1: TRadioGroup
    Left = 10
    Top = 12
    Width = 185
    Height = 51
    Caption = #23457#26680#29366#24577
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      #26410#23457#26680
      #24050#23457#26680
      #20840'  '#37096)
    TabOrder = 0
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 69
    Width = 281
    Height = 178
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 1
    object Label8: TLabel
      Left = 101
      Top = 42
      Width = 57
      Height = 13
      AutoSize = False
      Caption = #26412#21378#32534#21495
    end
    object ComboBox3: TComboBox
      Left = 103
      Top = 66
      Width = 139
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #24453#23457#26680
      Visible = False
      Items.Strings = (
        #24453#23457#26680
        #34987#36864#22238
        #24050#20445#30041
        #24050#26242#32531
        #24050#23457#26680
        #24050#25910#36135
        #24050#23436#25104
        #26410#25552#20132)
    end
    object Edit3: TEdit
      Left = 105
      Top = 66
      Width = 139
      Height = 21
      TabOrder = 2
      OnKeyUp = Edit3KeyUp
    end
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 81
      Height = 127
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #23458#25143#20195#30721
        #19994#21153#20195#34920
        #20135#21697#31867#22411
        #25253#20215#21333#21495
        '')
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
      BevelInner = bvNone
      BevelKind = bkSoft
      BevelOuter = bvRaised
      Caption = #26465#20214#39033#30446
      Color = cl3DLight
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
      Top = 143
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
  end
  object BitBtn3: TBitBtn
    Left = 568
    Top = 207
    Width = 75
    Height = 25
    Caption = #20851#38381
    TabOrder = 2
    Kind = bkClose
  end
  object SGrid1: TStringGrid
    Left = 300
    Top = 92
    Width = 249
    Height = 157
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 3
    ColWidths = (
      76
      167
      250)
  end
  object StaticText2: TStaticText
    Left = 300
    Top = 76
    Width = 248
    Height = 17
    Alignment = taCenter
    AutoSize = False
    BevelInner = bvNone
    BevelKind = bkSoft
    BevelOuter = bvRaised
    Caption = #24050#23450#20041#30340#26465#20214
    Color = cl3DLight
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
    Left = 568
    Top = 87
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
    Left = 568
    Top = 148
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
  object Panel1: TPanel
    Left = 296
    Top = 16
    Width = 346
    Height = 41
    BevelInner = bvLowered
    BevelOuter = bvSpace
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    TabOrder = 7
    object Label9: TLabel
      Left = 9
      Top = 9
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399#65306
    end
    object Label7: TLabel
      Left = 177
      Top = 9
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399#65306
    end
    object DTPk5: TDateTimePicker
      Left = 68
      Top = 9
      Width = 100
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 0
    end
    object DTPk6: TDateTimePicker
      Left = 236
      Top = 9
      Width = 100
      Height = 21
      Date = 37575.000000000000000000
      Time = 37575.000000000000000000
      TabOrder = 1
    end
  end
  object CheckBox1: TCheckBox
    Left = 200
    Top = 24
    Width = 73
    Height = 17
    Caption = #26174#31034#26448#26009
    TabOrder = 8
  end
  object PopupMenu1: TPopupMenu
    Left = 496
    Top = 191
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
