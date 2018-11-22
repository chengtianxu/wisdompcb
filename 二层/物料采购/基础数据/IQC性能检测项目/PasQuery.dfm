object frmQuery: TfrmQuery
  Left = 391
  Top = 283
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26597#35810
  ClientHeight = 350
  ClientWidth = 596
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
  object Label1: TLabel
    Left = 77
    Top = 17
    Width = 78
    Height = 13
    Alignment = taRightJustify
    Caption = #21019#24314#26085#26399#20174#65306
  end
  object Label2: TLabel
    Left = 280
    Top = 16
    Width = 20
    Height = 13
    Caption = #21040':'
  end
  object gbCondition: TGroupBox
    Left = 7
    Top = 49
    Width = 318
    Height = 249
    Caption = #26465#20214#23450#20041
    TabOrder = 0
    object lbCondition: TLabel
      Left = 169
      Top = 32
      Width = 77
      Height = 13
      Caption = 'lbCondition'
    end
    object rgCondition: TRadioGroup
      Left = 169
      Top = 81
      Width = 137
      Height = 113
      ItemIndex = 0
      Items.Strings = (
        #30456#20284#20110
        #30456#31561#20110)
      TabOrder = 4
    end
    object ltbConditon: TListBox
      Left = 15
      Top = 31
      Width = 145
      Height = 193
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      ItemHeight = 13
      TabOrder = 0
      OnClick = ltbConditonClick
    end
    object btnAdd: TBitBtn
      Left = 161
      Top = 200
      Width = 70
      Height = 25
      Caption = #22686#21152
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnClear: TBitBtn
      Left = 245
      Top = 200
      Width = 70
      Height = 25
      Caption = #28165#31354
      TabOrder = 2
      OnClick = btnClearClick
    end
    object edtCondition: TEdit
      Left = 169
      Top = 59
      Width = 104
      Height = 21
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
      TabOrder = 3
    end
    object btn1: TBitBtn
      Left = 277
      Top = 58
      Width = 25
      Height = 25
      TabOrder = 5
      OnClick = btn1Click
      Glyph.Data = {
        EE000000424DEE000000000000007600000028000000100000000F0000000100
        04000000000078000000130B0000130B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000888880000080F000888880F00080F000888880F0008000000080000
        000800F000000F00000800F000800F00000800F000800F000008800000000000
        0088880F00080F000888880000080000088888800088800088888880F08880F0
        888888800088800088888888888888888888}
    end
  end
  object GroupBox2: TGroupBox
    Left = 332
    Top = 48
    Width = 253
    Height = 249
    Caption = #24050#23450#20041#30340#26465#20214
    TabOrder = 1
    object sgCondition: TStringGrid
      Left = 2
      Top = 32
      Width = 249
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
        167
        3)
    end
  end
  object btnOk: TBitBtn
    Left = 186
    Top = 312
    Width = 75
    Height = 30
    Caption = #30830#23450
    ModalResult = 6
    TabOrder = 2
  end
  object btnCancel: TBitBtn
    Left = 331
    Top = 312
    Width = 75
    Height = 30
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object dtpkFrom: TDateTimePicker
    Left = 161
    Top = 13
    Width = 113
    Height = 21
    Date = 42263.000000000000000000
    Time = 42263.000000000000000000
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 4
  end
  object dtpkTo: TDateTimePicker
    Left = 304
    Top = 13
    Width = 113
    Height = 21
    Date = 42263.000000000000000000
    Time = 42263.000000000000000000
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    TabOrder = 5
  end
  object PopupMenu1: TPopupMenu
    Left = 468
    Top = 167
    object nDelete: TMenuItem
      Caption = #21024#38500#19968#34892
      OnClick = nDeleteClick
    end
  end
end
