object Form1: TForm1
  Left = 529
  Top = 284
  Width = 542
  Height = 417
  Caption = 'Reg'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object lbl1: TLabel
    Left = 72
    Top = 88
    Width = 40
    Height = 16
    AutoSize = False
    Caption = 'Key1: '
  end
  object lbl2: TLabel
    Left = 72
    Top = 152
    Width = 48
    Height = 16
    Caption = 'Key2'#65306
  end
  object lbl3: TLabel
    Left = 72
    Top = 28
    Width = 80
    Height = 16
    Caption = #26377#25928#26399#33267#65306
  end
  object edt1: TEdit
    Left = 120
    Top = 88
    Width = 329
    Height = 24
    TabOrder = 0
    Text = 'edt1'
  end
  object mmo1: TMemo
    Left = 120
    Top = 160
    Width = 329
    Height = 65
    Lines.Strings = (
      'mmo1')
    TabOrder = 1
  end
  object dtp1: TDateTimePicker
    Left = 168
    Top = 24
    Width = 186
    Height = 24
    Date = 43270.649026736110000000
    Time = 43270.649026736110000000
    TabOrder = 2
  end
  object btn1: TButton
    Left = 200
    Top = 256
    Width = 121
    Height = 57
    Caption = #29983#25104#27880#20876#30721
    TabOrder = 3
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 408
    Top = 280
    Width = 75
    Height = 25
    Caption = #39564#35777
    TabOrder = 4
    OnClick = btn2Click
  end
end
