object Form_add: TForm_add
  Left = 143
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22266#23450#36164#20135#29366#20917'-'#26032#22686
  ClientHeight = 125
  ClientWidth = 423
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 72
    Width = 123
    Height = 13
    Caption = #22266#23450#36164#20135#29366#24577#21517#31216#65306'     '
  end
  object Edit1: TEdit
    Left = 160
    Top = 67
    Width = 129
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 0
  end
  object Button1: TButton
    Left = 316
    Top = 24
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 317
    Top = 64
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
    ItemIndex = 0
    Items.Strings = (
      #19981#35745#25552#25240#26087
      #35745#25552#25240#26087)
    TabOrder = 3
  end
end
