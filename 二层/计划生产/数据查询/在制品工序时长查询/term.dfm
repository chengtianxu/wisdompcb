object Form4: TForm4
  Left = 374
  Top = 263
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810#26465#20214#35774#32622
  ClientHeight = 263
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox6: TGroupBox
    Left = 7
    Top = 12
    Width = 268
    Height = 210
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label8: TLabel
      Left = 101
      Top = 42
      Width = 52
      Height = 13
      Caption = #23458#25143#20195#30721
    end
    object Label7: TLabel
      Left = 101
      Top = 74
      Width = 26
      Height = 13
      Caption = #22823#20110
    end
    object Label1: TLabel
      Left = 229
      Top = 75
      Width = 13
      Height = 13
      Caption = #22825
      Visible = False
    end
    object Label3: TLabel
      Left = 92
      Top = 55
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #36215#22987#26085#26399
      Visible = False
    end
    object Label4: TLabel
      Left = 95
      Top = 97
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = #32456#27490#26085#26399
      Visible = False
    end
    object lab_rkey15: TLabel
      Left = 120
      Top = 184
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object ComboBox2: TComboBox
      Left = 131
      Top = 71
      Width = 94
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #26377#25928#30340
      Visible = False
      Items.Strings = (
        #26377#25928#30340
        #34987#26242#32531
        #24050#20851#38381
        #24050#23436#25104
        #24050#21462#28040
        #26410#25552#20132)
    end
    object DTTm1: TDateTimePicker
      Left = 185
      Top = 71
      Width = 82
      Height = 21
      Date = 38974.000000000000000000
      Time = 38974.000000000000000000
      Kind = dtkTime
      TabOrder = 7
      Visible = False
    end
    object DTPk1: TDateTimePicker
      Left = 91
      Top = 71
      Width = 95
      Height = 21
      Date = 37257.000000000000000000
      Time = 37257.000000000000000000
      TabOrder = 6
      Visible = False
    end
    object Edit3: TEdit
      Left = 130
      Top = 71
      Width = 95
      Height = 21
      TabOrder = 0
      OnChange = Edit3Change
    end
    object Button3: TButton
      Left = 107
      Top = 143
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 234
      Top = 69
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
      Left = 3
      Top = 31
      Width = 87
      Height = 178
      ItemHeight = 13
      Items.Strings = (
        #23458#25143#20195#30721
        #24037#24207#20195#30721
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #22312#32447#22825#25968
        #22312#32447#23567#26102
        #20316#19994#21333#21495
        #37197#26009#21333#21495
        #38144#21806#35746#21333#21495
        #35746#21333#29366#24577
        #21457#25918#26085#26399
        #24037#21378#20195#30721
        #22312#32447#29366#24577
        #20869'/'#22806#23618)
      TabOrder = 3
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 4
      Top = 16
      Width = 84
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
    object DTPk2: TDateTimePicker
      Left = 91
      Top = 113
      Width = 95
      Height = 21
      Date = 37575.000000000000000000
      Time = 37575.000000000000000000
      TabOrder = 8
      Visible = False
    end
    object DTTm2: TDateTimePicker
      Left = 185
      Top = 113
      Width = 82
      Height = 21
      Date = 38974.999305555550000000
      Time = 38974.999305555550000000
      Kind = dtkTime
      TabOrder = 9
      Visible = False
    end
    object rgType: TRadioGroup
      Left = 103
      Top = 62
      Width = 137
      Height = 73
      ItemIndex = 0
      Items.Strings = (
        #27491#24120
        #36820#24037)
      TabOrder = 10
      Visible = False
    end
  end
  object StaticText2: TStaticText
    Left = 279
    Top = 15
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
    TabOrder = 1
  end
  object SGrid1: TStringGrid
    Left = 279
    Top = 32
    Width = 249
    Height = 187
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 2
    OnClick = SGrid1Click
    OnMouseDown = SGrid1MouseDown
    ColWidths = (
      76
      167
      250)
  end
  object Button1: TButton
    Left = 183
    Top = 228
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 271
    Top = 228
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 408
    Top = 181
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
