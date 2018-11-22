object frmQuerySet: TfrmQuerySet
  Left = 419
  Top = 272
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810#26465#20214#35774#32622
  ClientHeight = 319
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StaticText2: TStaticText
    Left = 327
    Top = 27
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
    TabOrder = 1
  end
  object SGrid1: TStringGrid
    Left = 338
    Top = 44
    Width = 247
    Height = 205
    ColCount = 3
    DefaultRowHeight = 19
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    PopupMenu = PopupMenu1
    ScrollBars = ssHorizontal
    TabOrder = 2
    OnSelectCell = SGrid1SelectCell
    ColWidths = (
      67
      174
      2)
  end
  object GroupBox6: TGroupBox
    Left = 7
    Top = 24
    Width = 330
    Height = 225
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object Label8: TLabel
      Left = 141
      Top = 26
      Width = 59
      Height = 13
      Caption = #35774#22791#32534#30721':'
    end
    object Label1: TLabel
      Left = 144
      Top = 104
      Width = 42
      Height = 13
      Caption = 'Label1'
    end
    object edtValue: TEdit
      Left = 147
      Top = 48
      Width = 134
      Height = 21
      TabOrder = 3
      OnKeyPress = edtValueKeyPress
    end
    object btnAdd: TButton
      Left = 152
      Top = 191
      Width = 62
      Height = 25
      Caption = #22686#21152
      TabOrder = 6
      OnClick = btnAddClick
    end
    object BitBtn6: TBitBtn
      Left = 288
      Top = 47
      Width = 25
      Height = 25
      TabOrder = 2
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
      Width = 119
      Height = 177
      ItemHeight = 13
      TabOrder = 1
      OnClick = ListBox3Click
    end
    object StaticText7: TStaticText
      Left = 10
      Top = 23
      Width = 119
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
    object btnClear: TButton
      Left = 235
      Top = 191
      Width = 62
      Height = 25
      Caption = #28165#38500
      TabOrder = 7
      OnClick = btnClearClick
    end
    object cbbconfirm: TComboBox
      Left = 147
      Top = 50
      Width = 143
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Visible = False
      Items.Strings = (
        '')
    end
    object rg1: TRadioGroup
      Left = 144
      Top = 74
      Width = 156
      Height = 105
      ItemIndex = 0
      Items.Strings = (
        #30456#20284
        #31561#20110)
      TabOrder = 5
      OnClick = rg1Click
    end
    object dtpk1: TDateTimePicker
      Left = 148
      Top = 49
      Width = 145
      Height = 21
      Date = 42203.000000000000000000
      Time = 42203.000000000000000000
      TabOrder = 8
    end
    object dtpk2: TDateTimePicker
      Left = 148
      Top = 121
      Width = 145
      Height = 21
      Date = 42203.618126261570000000
      Time = 42203.618126261570000000
      TabOrder = 9
    end
  end
  object btnOK: TButton
    Left = 191
    Top = 280
    Width = 82
    Height = 28
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 335
    Top = 280
    Width = 82
    Height = 28
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
  object PopupMenu1: TPopupMenu
    Left = 384
    Top = 149
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
