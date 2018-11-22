object frmSaveBill: TfrmSaveBill
  Left = 835
  Top = 467
  Width = 371
  Height = 259
  Caption = #21069#21488#25910#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 28
    Top = 32
    Width = 48
    Height = 13
    Caption = #24555#36882#36153#65306
  end
  object lbl2: TLabel
    Left = 44
    Top = 72
    Width = 36
    Height = 13
    Caption = #22791#27880#65306
  end
  object btn1: TButton
    Left = 136
    Top = 177
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btn1Click
  end
  object edtRealMoney: TEdit
    Left = 94
    Top = 27
    Width = 187
    Height = 21
    TabOrder = 1
  end
  object mmoNote: TMemo
    Left = 96
    Top = 72
    Width = 185
    Height = 89
    TabOrder = 2
  end
end
