object Form_condition: TForm_condition
  Left = 299
  Top = 268
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #38144#21806#21457#31080#20837#24080#26597#35810#26465#20214#35774#32622
  ClientHeight = 293
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
    Top = 24
    Width = 268
    Height = 178
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label8: TLabel
      Left = 101
      Top = 45
      Width = 52
      Height = 13
      Caption = #26680#31639#24180#24230
    end
    object Edit3: TEdit
      Left = 103
      Top = 67
      Width = 119
      Height = 21
      TabOrder = 0
      OnKeyUp = Edit3KeyUp
    end
    object Button3: TButton
      Left = 123
      Top = 135
      Width = 75
      Height = 25
      Caption = #22686#21152
      Enabled = False
      TabOrder = 1
      OnClick = Button3Click
    end
    object BitBtn6: TBitBtn
      Left = 229
      Top = 65
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
      ItemHeight = 13
      Items.Strings = (
        #26680#31639#24180#24230
        #26680#31639#20154#21592)
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
    object SpinEdit1: TSpinEdit
      Left = 103
      Top = 67
      Width = 121
      Height = 22
      MaxValue = 2100
      MinValue = 2000
      TabOrder = 5
      Value = 2006
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
    ScrollBars = ssVertical
    TabOrder = 2
    OnMouseDown = SGrid1MouseDown
    ColWidths = (
      76
      167
      250)
  end
  object Button1: TButton
    Left = 183
    Top = 259
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 271
    Top = 259
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
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
