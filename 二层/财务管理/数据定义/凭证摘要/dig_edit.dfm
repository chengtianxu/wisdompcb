object Form_edit: TForm_edit
  Left = 124
  Top = 174
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25688#35201#32534#36753
  ClientHeight = 131
  ClientWidth = 489
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
    Left = 19
    Top = 32
    Width = 65
    Height = 13
    Caption = #25688#35201#31867#21035#65306
  end
  object Label2: TLabel
    Left = 43
    Top = 74
    Width = 39
    Height = 13
    Caption = #25688#35201#65306
  end
  object Edit1: TEdit
    Left = 84
    Top = 73
    Width = 229
    Height = 21
    TabOrder = 0
  end
  object ComboBox1: TComboBox
    Left = 84
    Top = 27
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object Button1: TButton
    Left = 371
    Top = 23
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 371
    Top = 74
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
end
