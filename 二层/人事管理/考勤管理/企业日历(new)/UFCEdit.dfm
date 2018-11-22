object frmFCEdit: TfrmFCEdit
  Left = 475
  Top = 228
  Width = 346
  Height = 324
  Caption = #20551#26085#32534#36753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 69
    Top = 32
    Width = 36
    Height = 13
    Caption = #36134#22871#65306
  end
  object Label2: TLabel
    Left = 69
    Top = 67
    Width = 36
    Height = 13
    Caption = #26085#26399#65306
  end
  object Label3: TLabel
    Left = 45
    Top = 99
    Width = 60
    Height = 13
    Caption = #20551#26085#31867#21035#65306
  end
  object cbb_SAcc: TComboBox
    Left = 103
    Top = 28
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object cbb_HType: TComboBox
    Left = 103
    Top = 95
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object dtp_HDate: TDateTimePicker
    Left = 102
    Top = 62
    Width = 145
    Height = 21
    Date = 42906.632063923610000000
    Time = 42906.632063923610000000
    TabOrder = 2
  end
  object btn_Save: TButton
    Left = 85
    Top = 192
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 3
    OnClick = btn_SaveClick
  end
  object btn_cancel: TButton
    Left = 181
    Top = 192
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = btn_cancelClick
  end
  object qrytemp: TADOQuery
    Connection = DM.con1
    Parameters = <>
    Left = 296
    Top = 32
  end
  object qryFC: TADOQuery
    Connection = DM.con1
    Parameters = <>
    Left = 288
    Top = 112
  end
end
