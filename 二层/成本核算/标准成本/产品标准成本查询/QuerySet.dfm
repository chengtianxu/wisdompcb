object frmQuerySet: TfrmQuerySet
  Left = 258
  Top = 204
  Width = 646
  Height = 333
  Caption = #26597#35810#26465#20214#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 275
    Width = 104
    Height = 13
    Caption = #38144#21806#26085#26399#65288#20174#65289#65306
  end
  object Label1: TLabel
    Left = 300
    Top = 275
    Width = 52
    Height = 13
    Caption = #65288#33267#65289#65306
  end
  object StaticText2: TStaticText
    Left = 290
    Top = 61
    Width = 253
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
    TabOrder = 11
  end
  object SGrid1: TStringGrid
    Left = 290
    Top = 78
    Width = 255
    Height = 181
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssVertical
    TabOrder = 10
    ColWidths = (
      67
      183
      3)
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 58
    Width = 274
    Height = 201
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 2
    object Label8: TLabel
      Left = 96
      Top = 34
      Width = 65
      Height = 13
      Caption = #26412#21378#32534#21495#65306
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object rgType: TRadioGroup
      Left = 95
      Top = 56
      Width = 154
      Height = 70
      ItemIndex = 0
      Items.Strings = (
        #37327#20135
        #26679#26495)
      TabOrder = 2
      Visible = False
    end
    object edtValue: TEdit
      Left = 95
      Top = 56
      Width = 130
      Height = 21
      TabOrder = 0
      OnChange = edtValueChange
      OnExit = edtValueExit
      OnKeyPress = edtValueKeyPress
    end
    object Button3: TButton
      Left = 101
      Top = 167
      Width = 62
      Height = 25
      Caption = #22686#21152
      TabOrder = 4
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 229
      Top = 54
      Width = 25
      Height = 25
      TabOrder = 3
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
      Width = 79
      Height = 153
      ItemHeight = 13
      Items.Strings = (
        #26412#21378#32534#21495
        #23458#25143#22411#21495
        #23458#25143#20195#30721
        #23458#25143#21517#31216
        #20135#21697#31867#22411
        #37327#20135'/'#26679#26495
        #24037#21378#20195#30721)
      TabOrder = 1
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
      Width = 79
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
      TabOrder = 5
    end
  end
  object Button1: TButton
    Left = 555
    Top = 103
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 555
    Top = 207
    Width = 75
    Height = 25
    Caption = #36864#20986
    ModalResult = 2
    TabOrder = 5
  end
  object RadioGroup1: TRadioGroup
    Left = 7
    Top = 8
    Width = 274
    Height = 41
    Caption = #25104#26412#21333#20301
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #24179#31859#25104#26412
      'PCS'#25104#26412)
    TabOrder = 0
  end
  object RadioGroup2: TRadioGroup
    Left = 290
    Top = 8
    Width = 255
    Height = 41
    Caption = #20135#21697#32467#26500
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      #22806#23618#25104#26412
      #20869#23618#25104#26412)
    TabOrder = 1
    Visible = False
  end
  object DTPD1: TDateTimePicker
    Left = 106
    Top = 271
    Width = 99
    Height = 21
    Date = 39365.425981435180000000
    Time = 39365.425981435180000000
    TabOrder = 6
  end
  object DTPT1: TDateTimePicker
    Left = 211
    Top = 271
    Width = 84
    Height = 21
    Date = 39365.000000000000000000
    Time = 39365.000000000000000000
    Kind = dtkTime
    TabOrder = 7
  end
  object DTPD2: TDateTimePicker
    Left = 355
    Top = 271
    Width = 99
    Height = 21
    Date = 39365.425981435180000000
    Time = 39365.425981435180000000
    TabOrder = 8
  end
  object DTPT2: TDateTimePicker
    Left = 461
    Top = 271
    Width = 84
    Height = 21
    Date = 39365.999988425930000000
    Time = 39365.999988425930000000
    Kind = dtkTime
    TabOrder = 9
  end
  object Button4: TButton
    Left = 555
    Top = 155
    Width = 75
    Height = 25
    Caption = #37325#32622
    TabOrder = 4
    OnClick = Button4Click
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 181
    object N1: TMenuItem
      Caption = #21024#38500'(&D)'
      OnClick = N1Click
    end
  end
end
