object Form_outnum: TForm_outnum
  Left = 323
  Top = 267
  Width = 386
  Height = 210
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #26448#26009#21457#25918
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 75
    Top = 27
    Width = 91
    Height = 13
    Caption = #26377#25928#24211#23384#25968#37327#65306
  end
  object Label2: TLabel
    Left = 123
    Top = 60
    Width = 39
    Height = 13
    Caption = #21333#20301#65306
  end
  object Label3: TLabel
    Left = 71
    Top = 92
    Width = 91
    Height = 13
    Caption = #26412#27425#35843#25320#25968#37327#65306
  end
  object Edit1: TEdit
    Left = 168
    Top = 24
    Width = 121
    Height = 21
    Color = clScrollBar
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ReadOnly = True
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 168
    Top = 56
    Width = 121
    Height = 21
    Color = cl3DLight
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    ReadOnly = True
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 168
    Top = 88
    Width = 121
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#24494#36719#25340#38899
    TabOrder = 2
    OnExit = Edit3Exit
    OnKeyPress = Edit3KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 88
    Top = 136
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 136
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
end
