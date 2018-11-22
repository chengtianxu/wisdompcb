object frmQuery: TfrmQuery
  Left = 508
  Top = 228
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810
  ClientHeight = 357
  ClientWidth = 620
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
    Left = 16
    Top = 24
    Width = 585
    Height = 265
    Caption = #26597#35810#26465#20214#23450#20041
    TabOrder = 0
    object lbName: TLabel
      Left = 224
      Top = 39
      Width = 42
      Height = 13
      Caption = 'lbName'
    end
    object lbCondition: TListBox
      Left = 32
      Top = 30
      Width = 177
      Height = 209
      ItemHeight = 13
      TabOrder = 0
      OnClick = lbConditionClick
    end
    object edtCondition: TEdit
      Left = 223
      Top = 57
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object sgCondition: TStringGrid
      Left = 363
      Top = 30
      Width = 201
      Height = 209
      ColCount = 3
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
      PopupMenu = PopupMenu1
      TabOrder = 2
      ColWidths = (
        67
        128
        22)
    end
    object pndate: TPanel
      Left = 223
      Top = 56
      Width = 121
      Height = 129
      TabOrder = 3
      object dtpkFrom: TDateTimePicker
        Left = 8
        Top = 32
        Width = 97
        Height = 21
        Date = 42249.601492013890000000
        Time = 42249.601492013890000000
        TabOrder = 0
      end
      object dtpkTo: TDateTimePicker
        Left = 8
        Top = 88
        Width = 97
        Height = 21
        Date = 42249.601667974530000000
        Time = 42249.601667974530000000
        TabOrder = 1
      end
      object StaticText1: TStaticText
        Left = 8
        Top = 8
        Width = 30
        Height = 17
        Caption = #20174#65306
        TabOrder = 2
      end
      object StaticText2: TStaticText
        Left = 8
        Top = 64
        Width = 30
        Height = 17
        Caption = #21040#65306
        TabOrder = 3
      end
    end
    object cbbType: TComboBox
      Left = 224
      Top = 60
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
    end
    object btnAdd: TBitBtn
      Left = 224
      Top = 208
      Width = 57
      Height = 25
      Caption = #22686#21152
      TabOrder = 5
      OnClick = btnAddClick
    end
    object btnClear: TBitBtn
      Left = 288
      Top = 208
      Width = 57
      Height = 25
      Caption = #28165#31354
      TabOrder = 6
      OnClick = btnClearClick
    end
  end
  object btnConfirm: TBitBtn
    Left = 195
    Top = 308
    Width = 81
    Height = 32
    Caption = #30830#23450
    ModalResult = 6
    TabOrder = 1
  end
  object btnCancel: TBitBtn
    Left = 323
    Top = 308
    Width = 81
    Height = 32
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 448
    Top = 184
    object N1: TMenuItem
      Caption = #21024#38500#19968#34892
      OnClick = N1Click
    end
  end
end
