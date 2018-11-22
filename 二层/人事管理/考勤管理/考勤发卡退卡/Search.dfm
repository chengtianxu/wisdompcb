object Form_Search: TForm_Search
  Left = 401
  Top = 238
  Width = 634
  Height = 272
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26597#35810#26465#20214#35774#32622
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 305
    Height = 177
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label1: TLabel
      Left = 136
      Top = 40
      Width = 42
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 136
      Top = 86
      Width = 65
      Height = 13
      Caption = #32467#26463#26085#26399#65306
    end
    object StaticText1: TStaticText
      Left = 12
      Top = 24
      Width = 108
      Height = 17
      Caption = '   '#26465#20214#23450#20041'   '
      Color = clGrayText
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object ListBox1: TListBox
      Left = 12
      Top = 40
      Width = 108
      Height = 121
      ItemHeight = 13
      Items.Strings = (
        #32771#21220#21345#21495
        #21592#24037#24037#21495
        #21457#21345#26085#26399
        #36864#21345'\'#25346#22833#26085#26399
        #32771#21220#21345#29366#24577)
      TabOrder = 1
      OnClick = ListBox1Click
    end
    object Edit1: TEdit
      Left = 136
      Top = 58
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit1'
      OnChange = Edit1Change
    end
    object Button1: TButton
      Left = 158
      Top = 136
      Width = 75
      Height = 25
      Caption = #22686#21152
      TabOrder = 3
      OnClick = Button1Click
    end
    object dtpk2: TDateTimePicker
      Left = 136
      Top = 104
      Width = 121
      Height = 21
      Date = 40878.999988425930000000
      Time = 40878.999988425930000000
      TabOrder = 4
    end
    object BitBtn1: TBitBtn
      Left = 265
      Top = 56
      Width = 28
      Height = 24
      TabOrder = 5
      OnClick = BitBtn1Click
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
      Left = 136
      Top = 58
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = #26377#25928
      Items.Strings = (
        #26377#25928
        #25346#22833
        #36864#21345
        #25439#22351)
    end
    object dtpk1: TDateTimePicker
      Left = 136
      Top = 58
      Width = 121
      Height = 21
      Date = 40878.000000000000000000
      Time = 40878.000000000000000000
      TabOrder = 7
    end
  end
  object StaticText2: TStaticText
    Left = 320
    Top = 20
    Width = 296
    Height = 17
    Caption = '             '#24050#23450#20041#30340#26465#20214'             '
    Color = clGrayText
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
  object SGrd: TStringGrid
    Left = 320
    Top = 36
    Width = 297
    Height = 157
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    PopupMenu = Popup1
    ScrollBars = ssNone
    TabOrder = 2
    ColWidths = (
      78
      213
      3)
  end
  object Button2: TButton
    Left = 224
    Top = 208
    Width = 75
    Height = 25
    Caption = #30830' '#23450
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 328
    Top = 208
    Width = 75
    Height = 25
    Caption = #21462' '#28040
    TabOrder = 4
    OnClick = Button3Click
  end
  object Popup1: TPopupMenu
    Left = 456
    Top = 112
    object N1: TMenuItem
      Caption = #21024#38500#26465#20214
    end
  end
end
