object Form_add: TForm_add
  Left = 202
  Top = 218
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22266#23450#36164#20135#22686#21152
  ClientHeight = 155
  ClientWidth = 475
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 26
    Width = 171
    Height = 13
    Caption = #22266#23450#36164#20135#21464#21160#26041#24335#21517#31216#65306'    '
  end
  object Edit1: TEdit
    Left = 196
    Top = 22
    Width = 121
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 0
  end
  object Button1: TButton
    Left = 354
    Top = 35
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 354
    Top = 98
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 49
    Top = 67
    Width = 257
    Height = 65
    Caption = #21464#21160#26041#24335
    TabOrder = 1
  end
  object RadioButton1: TRadioButton
    Left = 79
    Top = 96
    Width = 113
    Height = 17
    Caption = #22266#23450#36164#20135#22686#21152
    Checked = True
    TabOrder = 4
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 184
    Top = 96
    Width = 113
    Height = 17
    Caption = #22266#23450#36164#20135#20943#23569
    TabOrder = 5
  end
end
