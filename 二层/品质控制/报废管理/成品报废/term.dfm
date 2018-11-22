object Form_condition: TForm_condition
  Left = 334
  Top = 214
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25253#24223#26597#35810#26465#20214#35774#32622
  ClientHeight = 297
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 31
    Top = 221
    Width = 65
    Height = 13
    Caption = #23436#24037#26102#38388#65306
  end
  object Label2: TLabel
    Left = 294
    Top = 221
    Width = 7
    Height = 13
    Caption = '-'
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 24
    Width = 268
    Height = 178
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label8: TLabel
      Left = 101
      Top = 42
      Width = 52
      Height = 13
      Caption = #26412#21378#32534#21495
    end
    object Edit3: TEdit
      Left = 103
      Top = 64
      Width = 119
      Height = 21
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      TabOrder = 0
      OnChange = Edit3Change
    end
    object Button3: TButton
      Left = 131
      Top = 143
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
      Top = 40
      Width = 81
      Height = 127
      ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #20316#19994#21333#21495
        #20179#24211#20301#32622
        #23458#25143#20195#30721)
      TabOrder = 3
      OnClick = ListBox3Click
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
    Height = 158
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssHorizontal
    TabOrder = 2
    OnMouseDown = SGrid1MouseDown
    ColWidths = (
      76
      167
      250)
  end
  object Button1: TButton
    Left = 183
    Top = 256
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 271
    Top = 256
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object DateTimePicker1: TDateTimePicker
    Left = 102
    Top = 217
    Width = 101
    Height = 21
    Date = 39938.000000000000000000
    Time = 39938.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 5
  end
  object DateTimePicker2: TDateTimePicker
    Left = 206
    Top = 217
    Width = 85
    Height = 21
    Date = 39938.000000000000000000
    Time = 39938.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Kind = dtkTime
    TabOrder = 6
  end
  object DateTimePicker3: TDateTimePicker
    Left = 302
    Top = 217
    Width = 97
    Height = 21
    Date = 39938.000000000000000000
    Time = 39938.000000000000000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 7
  end
  object DateTimePicker4: TDateTimePicker
    Left = 402
    Top = 217
    Width = 81
    Height = 21
    Date = 39938.999988425920000000
    Time = 39938.999988425920000000
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    Kind = dtkTime
    TabOrder = 8
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
