object frmPHourEdit: TfrmPHourEdit
  Left = 604
  Top = 331
  Width = 277
  Height = 172
  Caption = #24405#20837#36820#24037#24037#26102
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
    Left = 16
    Top = 40
    Width = 52
    Height = 13
    Caption = #35745#21010#24037#26102
  end
  object btn1: TButton
    Left = 48
    Top = 96
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 152
    Top = 96
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object edt_PHour: TEdit
    Left = 80
    Top = 38
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0'
    OnKeyPress = edt_PHourKeyPress
  end
end
