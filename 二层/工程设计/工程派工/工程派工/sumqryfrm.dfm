object frmsumqry: Tfrmsumqry
  Left = 416
  Top = 280
  Width = 523
  Height = 262
  Caption = #27719#24635#26597#35810
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
  object lbl1: TLabel
    Left = 85
    Top = 128
    Width = 39
    Height = 13
    Caption = #26102#38388#65306
  end
  object lbl2: TLabel
    Left = 244
    Top = 128
    Width = 13
    Height = 13
    Caption = #33267
  end
  object rg1: TRadioGroup
    Left = 32
    Top = 16
    Width = 433
    Height = 81
    Caption = #20998#32452#31867#22411
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      #39044#23457#20154#21592
      'CAM'#20154#21592
      'QAE'#20154#21592)
    TabOrder = 0
  end
  object dtp1: TDateTimePicker
    Left = 130
    Top = 124
    Width = 103
    Height = 21
    Date = 42419.375423657410000000
    Time = 42419.375423657410000000
    TabOrder = 1
  end
  object dtp2: TDateTimePicker
    Left = 267
    Top = 124
    Width = 103
    Height = 21
    Date = 42419.375423657410000000
    Time = 42419.375423657410000000
    TabOrder = 2
  end
  object btn1: TButton
    Left = 146
    Top = 176
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 291
    Top = 176
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = btn2Click
  end
end
