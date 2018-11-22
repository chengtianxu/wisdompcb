object frmedit: Tfrmedit
  Left = 682
  Top = 446
  Width = 277
  Height = 271
  Caption = #32534#36753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 32
    Top = 20
    Width = 39
    Height = 13
    Caption = #24037#21495#65306
  end
  object lbl_code: TLabel
    Left = 72
    Top = 21
    Width = 14
    Height = 13
    Caption = '..'
  end
  object lbl2: TLabel
    Left = 136
    Top = 21
    Width = 39
    Height = 13
    Caption = #22995#21517#65306
  end
  object lbl3: TLabel
    Left = 32
    Top = 44
    Width = 39
    Height = 13
    Caption = #26085#26399#65306
  end
  object lbl_Ename: TLabel
    Left = 176
    Top = 21
    Width = 14
    Height = 13
    Caption = '..'
  end
  object lbl_date: TLabel
    Left = 68
    Top = 44
    Width = 14
    Height = 13
    Caption = '..'
  end
  object lbl_class: TLabel
    Left = 32
    Top = 72
    Width = 26
    Height = 13
    Caption = #29677#27425
  end
  object edt_class: TEdit
    Left = 72
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btn_OK: TButton
    Left = 48
    Top = 152
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btn_OKClick
  end
  object btn_exit: TButton
    Left = 168
    Top = 152
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btn_exitClick
  end
end
