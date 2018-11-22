object frmQuery: TfrmQuery
  Left = 385
  Top = 211
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810
  ClientHeight = 365
  ClientWidth = 611
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
  object Label1: TLabel
    Left = 120
    Top = 24
    Width = 65
    Height = 13
    Caption = #24320#22987#26085#26399#65306
  end
  object Label2: TLabel
    Left = 314
    Top = 24
    Width = 26
    Height = 13
    Caption = #21040#65306
  end
  object gbCondition: TGroupBox
    Left = 30
    Top = 64
    Width = 345
    Height = 244
    Caption = #26465#20214#23450#20041
    TabOrder = 0
    object lbCondition: TLabel
      Left = 184
      Top = 32
      Width = 77
      Height = 13
      Caption = 'lbCondition'
    end
    object ltbConditon: TListBox
      Left = 15
      Top = 31
      Width = 145
      Height = 193
      ItemHeight = 13
      TabOrder = 0
      OnClick = ltbConditonClick
    end
    object btnAdd: TBitBtn
      Left = 176
      Top = 200
      Width = 70
      Height = 25
      Caption = #22686#21152
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnClear: TBitBtn
      Left = 260
      Top = 200
      Width = 70
      Height = 25
      Caption = #28165#31354
      TabOrder = 2
      OnClick = btnClearClick
    end
    object rgCondition: TRadioGroup
      Left = 184
      Top = 80
      Width = 137
      Height = 113
      TabOrder = 3
    end
    object edtCondition: TEdit
      Left = 184
      Top = 59
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object rgStatus: TRadioGroup
      Left = 184
      Top = 56
      Width = 137
      Height = 137
      TabOrder = 5
    end
    object cbbWarehouse: TComboBox
      Left = 184
      Top = 56
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
    end
  end
  object GroupBox2: TGroupBox
    Left = 390
    Top = 64
    Width = 185
    Height = 242
    Caption = #24050#23450#20041#30340#26465#20214
    TabOrder = 1
    object sgCondition: TStringGrid
      Left = 2
      Top = 25
      Width = 181
      Height = 215
      Align = alBottom
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      PopupMenu = PopupMenu1
      TabOrder = 0
      ColWidths = (
        71
        105
        3)
    end
  end
  object btnOk: TBitBtn
    Left = 186
    Top = 329
    Width = 75
    Height = 30
    Caption = #30830#23450
    ModalResult = 6
    TabOrder = 2
  end
  object btnCancel: TBitBtn
    Left = 331
    Top = 329
    Width = 75
    Height = 30
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object dtpkStartDate: TDateTimePicker
    Left = 190
    Top = 20
    Width = 97
    Height = 21
    Date = 42334.000000000000000000
    Time = 42334.000000000000000000
    TabOrder = 4
  end
  object dtpkEndDate: TDateTimePicker
    Left = 360
    Top = 20
    Width = 97
    Height = 21
    Date = 42334.000000000000000000
    Time = 42334.000000000000000000
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 470
    Top = 152
    object nDelete: TMenuItem
      Caption = #21024#38500#19968#34892
      OnClick = nDeleteClick
    end
  end
end
