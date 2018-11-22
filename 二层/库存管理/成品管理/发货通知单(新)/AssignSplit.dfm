object Form_AssignSplit: TForm_AssignSplit
  Left = 585
  Top = 237
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #25351#27966#25286#20998
  ClientHeight = 155
  ClientWidth = 232
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 44
    Top = 11
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #21407#26469#25968#37327':'
  end
  object Label4: TLabel
    Left = 44
    Top = 39
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = #25286#21518#25968#37327':'
  end
  object Label1: TLabel
    Left = 44
    Top = 67
    Width = 65
    Height = 13
    Caption = #21407#20808#31665#25968#65306
  end
  object Label2: TLabel
    Left = 44
    Top = 95
    Width = 65
    Height = 13
    Caption = #25286#21518#31665#25968#65306
  end
  object Edit3: TEdit
    Left = 107
    Top = 6
    Width = 65
    Height = 21
    TabStop = False
    Color = cl3DLight
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 0
  end
  object Edit4: TEdit
    Left = 108
    Top = 35
    Width = 66
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 1
    Text = '0'
    OnKeyPress = Edit4KeyPress
    OnKeyUp = Edit4KeyUp
  end
  object Button2: TButton
    Left = 110
    Top = 124
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object Button1: TButton
    Left = 32
    Top = 124
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 107
    Top = 62
    Width = 65
    Height = 21
    TabStop = False
    Color = cl3DLight
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    ReadOnly = True
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 107
    Top = 90
    Width = 66
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#26497#28857#20116#31508
    TabOrder = 5
    Text = '0'
    OnKeyPress = Edit2KeyPress
    OnKeyUp = Edit2KeyUp
  end
end
