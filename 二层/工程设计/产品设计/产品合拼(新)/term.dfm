object Form_condition: TForm_condition
  Left = 246
  Top = 218
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#35746#21333#26597#35810#26465#20214#35774#32622
  ClientHeight = 323
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
  object Bevel1: TBevel
    Left = 80
    Top = 256
    Width = 361
    Height = 37
  end
  object Label3: TLabel
    Left = 298
    Top = 267
    Width = 20
    Height = 13
    Caption = #21040':'
  end
  object Label4: TLabel
    Left = 115
    Top = 268
    Width = 72
    Height = 13
    Caption = #36755#20837#26085#26399#20174':'
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 24
    Width = 268
    Height = 226
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label8: TLabel
      Left = 101
      Top = 42
      Width = 52
      Height = 13
      Caption = #38144#21806#35746#21333
    end
    object lab_rkey15: TLabel
      Left = 120
      Top = 168
      Width = 7
      Height = 13
      Caption = '0'
      Visible = False
    end
    object Edit3: TEdit
      Left = 103
      Top = 64
      Width = 119
      Height = 21
      TabOrder = 0
      OnKeyUp = Edit3KeyUp
    end
    object ComboBox1: TComboBox
      Left = 103
      Top = 64
      Width = 118
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 5
      Text = #26410#35780#23457
      Visible = False
      Items.Strings = (
        #26410#35780#23457
        #24050#35780#23457
        #34987#36864#22238
        #19981#35780#23457)
    end
    object ComboBox2: TComboBox
      Left = 103
      Top = 64
      Width = 118
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = #33258#21046
      Visible = False
      Items.Strings = (
        #33258#21046
        #22806#21457
        #21322#21046#31243)
    end
    object Button3: TButton
      Left = 131
      Top = 127
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 229
      Top = 62
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
      Top = 37
      Width = 81
      Height = 186
      ItemHeight = 13
      Items.Strings = (
        #38144#21806#35746#21333
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #23458#25143#20195#30721
        #23458#25143#35746#21333#21495
        #35780#23457#26631#35760
        #36755#20837#20154#21592
        #21152#24037#24418#24335
        #35746#21333#31867#22411
        #35746#21333#26032#26087
        #29983#20135#26631#35782
        #20135#21697#23646#24615
        #24037#21378#20195#30721
        #20851#32852#21407#23458#25143)
      TabOrder = 3
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
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
      TabOrder = 4
    end
  end
  object StaticText2: TStaticText
    Left = 279
    Top = 27
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
    Top = 44
    Width = 249
    Height = 206
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssHorizontal
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
    Top = 297
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 271
    Top = 297
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object dtpk1: TDateTimePicker
    Left = 192
    Top = 264
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    TabOrder = 5
  end
  object dtpk2: TDateTimePicker
    Left = 320
    Top = 264
    Width = 96
    Height = 21
    Date = 38847.000000000000000000
    Time = 38847.000000000000000000
    TabOrder = 6
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 280
    Top = 149
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
