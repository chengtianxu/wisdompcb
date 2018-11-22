object frmModifyType: TfrmModifyType
  Left = 391
  Top = 332
  BorderStyle = bsDialog
  Caption = #20462#25913#25253#20215#31867#22411
  ClientHeight = 88
  ClientWidth = 223
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 59
    Height = 13
    Caption = #25253#20215#31867#22411':'
  end
  object cbType: TComboBox
    Left = 89
    Top = 12
    Width = 113
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      #26032#21333
      #37327#20135#19979#21333
      #35843#20215
      #20854#23427
      #29305#25209#39033#30446
      #23395#24230#35843#20215)
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 56
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 128
    Top = 56
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
end
