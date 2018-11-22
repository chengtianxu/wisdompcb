object frmSearch: TfrmSearch
  Left = 441
  Top = 388
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810
  ClientHeight = 373
  ClientWidth = 621
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
  object GroupBox1: TGroupBox
    Left = 24
    Top = 30
    Width = 321
    Height = 265
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object lbText: TLabel
      Left = 170
      Top = 42
      Width = 52
      Height = 13
      Caption = #37096#38376#32534#30721
    end
    object lbList: TListBox
      Left = 10
      Top = 40
      Width = 137
      Height = 209
      ItemHeight = 13
      Items.Strings = (
        #37096#38376#32534#30721
        #37096#38376#21517#31216)
      TabOrder = 0
      OnClick = lbListClick
    end
    object edtCondition: TEdit
      Left = 169
      Top = 61
      Width = 136
      Height = 21
      TabOrder = 1
    end
    object rgCondition: TRadioGroup
      Left = 169
      Top = 94
      Width = 136
      Height = 105
      Items.Strings = (
        #21253#21547
        #31561#20110)
      TabOrder = 2
    end
    object btnAdd: TBitBtn
      Left = 168
      Top = 222
      Width = 65
      Height = 25
      Caption = #22686#21152
      TabOrder = 3
      OnClick = btnAddClick
    end
    object btnClear: TBitBtn
      Left = 240
      Top = 222
      Width = 65
      Height = 25
      Caption = #28165#31354
      TabOrder = 4
      OnClick = btnClearClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 352
    Top = 30
    Width = 241
    Height = 265
    Caption = #24050#23450#20041#30340#26465#20214
    TabOrder = 1
    object sgList: TStringGrid
      Left = 2
      Top = 40
      Width = 237
      Height = 223
      Align = alBottom
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      PopupMenu = PopupMenu1
      TabOrder = 0
      ColWidths = (
        80
        152
        4)
    end
  end
  object btnConfirm: TBitBtn
    Left = 168
    Top = 318
    Width = 97
    Height = 41
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TBitBtn
    Left = 334
    Top = 318
    Width = 97
    Height = 41
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object PopupMenu1: TPopupMenu
    Left = 496
    Top = 150
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
