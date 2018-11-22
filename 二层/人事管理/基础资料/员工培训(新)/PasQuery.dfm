object frmQuery: TfrmQuery
  Left = 359
  Top = 325
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810
  ClientHeight = 370
  ClientWidth = 609
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
  object Label2: TLabel
    Left = 86
    Top = 21
    Width = 91
    Height = 13
    Caption = #22521#35757#24320#22987#26102#38388#65306
  end
  object Label3: TLabel
    Left = 298
    Top = 24
    Width = 13
    Height = 13
    Caption = #33267
  end
  object gbCondition: TGroupBox
    Left = 34
    Top = 58
    Width = 345
    Height = 249
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
      Left = 16
      Top = 32
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
    object rgStatus: TRadioGroup
      Left = 176
      Top = 48
      Width = 137
      Height = 145
      ItemIndex = 0
      Items.Strings = (
        #22312#32844
        #31163#32844)
      TabOrder = 3
    end
    object edtCondition: TEdit
      Left = 176
      Top = 48
      Width = 137
      Height = 21
      TabOrder = 4
    end
    object cbbType: TComboBox
      Left = 176
      Top = 48
      Width = 137
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
    end
    object pnl1: TPanel
      Left = 176
      Top = 48
      Width = 137
      Height = 145
      TabOrder = 6
      object lbl1: TLabel
        Left = 8
        Top = 16
        Width = 26
        Height = 13
        Caption = #20174#65306
      end
      object lbl2: TLabel
        Left = 8
        Top = 80
        Width = 26
        Height = 13
        Caption = #21040#65306
      end
      object dtpkFrom: TDateTimePicker
        Left = 8
        Top = 40
        Width = 113
        Height = 21
        Date = 42263.660011388880000000
        Time = 42263.660011388880000000
        TabOrder = 0
      end
      object dtpkTo: TDateTimePicker
        Left = 8
        Top = 112
        Width = 113
        Height = 21
        Date = 42263.660011388880000000
        Time = 42263.660011388880000000
        TabOrder = 1
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 385
    Top = 58
    Width = 185
    Height = 249
    Caption = #24050#23450#20041#30340#26465#20214
    TabOrder = 1
    object sgCondition: TStringGrid
      Left = 2
      Top = 32
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
    Left = 192
    Top = 326
    Width = 75
    Height = 30
    Caption = #30830#23450
    ModalResult = 6
    TabOrder = 2
  end
  object btnCancel: TBitBtn
    Left = 312
    Top = 326
    Width = 75
    Height = 30
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object dtpkqueryStart: TDateTimePicker
    Left = 184
    Top = 20
    Width = 97
    Height = 21
    Date = 42263.000000000000000000
    Time = 42263.000000000000000000
    TabOrder = 4
  end
  object dtpkqureyEnd: TDateTimePicker
    Left = 328
    Top = 20
    Width = 97
    Height = 21
    Date = 42263.000000000000000000
    Time = 42263.000000000000000000
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 463
    Top = 152
    object N1: TMenuItem
      Caption = #21024#38500#19968#34892
      OnClick = N1Click
    end
  end
end
