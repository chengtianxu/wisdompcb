object Form_Condition: TForm_Condition
  Left = 234
  Top = 123
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20844#21153#22806#20986#21333#26597#35810
  ClientHeight = 301
  ClientWidth = 554
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 12
    Width = 64
    Height = 13
    AutoSize = False
    Caption = #21019#24314#26085#26399':'
  end
  object Label2: TLabel
    Left = 301
    Top = 10
    Width = 16
    Height = 16
    Caption = #21040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 173
    Top = 10
    Width = 16
    Height = 16
    Caption = #20174
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 192
    Top = 7
    Width = 107
    Height = 21
    Date = 39878.000000000000000000
    Time = 39878.000000000000000000
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 320
    Top = 8
    Width = 107
    Height = 21
    Date = 39878.000000000000000000
    Time = 39878.000000000000000000
    TabOrder = 1
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 33
    Width = 290
    Height = 226
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 2
    object Label8: TLabel
      Left = 125
      Top = 46
      Width = 60
      Height = 13
      AutoSize = False
      Caption = #30003#35831#26085#26399
    end
    object edtValue: TEdit
      Left = 116
      Top = 66
      Width = 140
      Height = 21
      TabOrder = 0
      Visible = False
      OnChange = edtValueChange
    end
    object Button3: TButton
      Left = 123
      Top = 185
      Width = 62
      Height = 25
      Caption = #22686#21152
      TabOrder = 1
      OnClick = Button3Click
    end
    object ListBox3: TListBox
      Left = 10
      Top = 40
      Width = 103
      Height = 183
      ItemHeight = 13
      TabOrder = 2
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
      Width = 103
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
      TabOrder = 3
    end
    object Button4: TButton
      Left = 203
      Top = 185
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 4
      OnClick = Button4Click
    end
    object BitBtn7: TBitBtn
      Left = 258
      Top = 64
      Width = 25
      Height = 25
      TabOrder = 5
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
    object GroupBox1: TGroupBox
      Left = 116
      Top = 62
      Width = 157
      Height = 66
      TabOrder = 6
      Visible = False
      object CheckBox1: TCheckBox
        Left = 8
        Top = 16
        Width = 65
        Height = 17
        Caption = #24453#25552#20132
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Tag = 1
        Left = 8
        Top = 40
        Width = 65
        Height = 17
        Caption = #24453#23457#26680
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox3: TCheckBox
        Tag = 1
        Left = 73
        Top = 16
        Width = 65
        Height = 17
        Caption = #24050#23457#26680
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox4: TCheckBox
        Tag = 1
        Left = 73
        Top = 40
        Width = 65
        Height = 17
        Caption = #34987#36864#22238
        TabOrder = 3
        OnClick = CheckBox1Click
      end
    end
    object DateTimePicker3: TDateTimePicker
      Left = 120
      Top = 68
      Width = 107
      Height = 21
      Date = 39878.000000000000000000
      Time = 39878.000000000000000000
      TabOrder = 7
    end
  end
  object StaticText2: TStaticText
    Left = 295
    Top = 36
    Width = 258
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
    TabOrder = 3
  end
  object SGrid1: TStringGrid
    Left = 298
    Top = 53
    Width = 247
    Height = 206
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ScrollBars = ssHorizontal
    TabOrder = 4
    OnSelectCell = SGrid1SelectCell
    ColWidths = (
      67
      174
      2)
  end
  object Button1: TButton
    Left = 167
    Top = 264
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 5
  end
  object Button2: TButton
    Left = 311
    Top = 264
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 6
  end
  object PopupMenu1: TPopupMenu
    Left = 376
    Top = 134
    object N1: TMenuItem
      Caption = #21024#38500
    end
  end
end
