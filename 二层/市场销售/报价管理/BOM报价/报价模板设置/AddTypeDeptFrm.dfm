object frmAddTypeDept: TfrmAddTypeDept
  Left = 0
  Top = 0
  Caption = 'BOM'#25253#20215#24037#24207
  ClientHeight = 228
  ClientWidth = 409
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 101
    Top = 24
    Width = 36
    Height = 13
    Caption = #24037#24207#65306
  end
  object lbl2: TLabel
    Left = 77
    Top = 51
    Width = 60
    Height = 13
    Caption = #32463#36807#27425#25968#65306
  end
  object btn3: TSpeedButton
    Left = 292
    Top = 20
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btn3Click
  end
  object edt1: TEdit
    Left = 143
    Top = 21
    Width = 143
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object se1: TSpinEdit
    Left = 143
    Top = 48
    Width = 143
    Height = 22
    MaxValue = 100
    MinValue = 1
    TabOrder = 1
    Value = 1
  end
  object btn2: TRzButton
    Left = 245
    Top = 176
    Caption = #21462#28040
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn1: TRzButton
    Left = 93
    Top = 176
    Caption = #30830#23450
    TabOrder = 3
    OnClick = btn1Click
  end
end
