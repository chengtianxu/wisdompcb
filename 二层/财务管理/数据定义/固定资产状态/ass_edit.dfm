object Form_edit: TForm_edit
  Left = 247
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22266#23450#36164#20135#29366#20917'-'#32534#36753
  ClientHeight = 120
  ClientWidth = 420
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 68
    Width = 120
    Height = 13
    Caption = #22266#23450#36164#20135#29366#24577#21517#31216#65306'    '
  end
  object Edit1: TEdit
    Left = 157
    Top = 65
    Width = 129
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 0
  end
  object Button1: TButton
    Left = 317
    Top = 20
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 317
    Top = 62
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 2
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 16
    Top = 13
    Width = 273
    Height = 41
    Caption = #35745#25552#25240#26087#24773#20917
    Columns = 2
    Items.Strings = (
      #19981#35745#25552#25240#26087
      #35745#25552#25240#26087)
    TabOrder = 3
  end
end
