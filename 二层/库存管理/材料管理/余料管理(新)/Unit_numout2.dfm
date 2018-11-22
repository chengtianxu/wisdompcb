object Form_numout2: TForm_numout2
  Left = 645
  Top = 264
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26032#22686#37197#26009#21333#20986#20179
  ClientHeight = 286
  ClientWidth = 502
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
    Left = 11
    Top = 57
    Width = 59
    Height = 13
    Caption = #26448#26009#32534#30721':'
  end
  object Label2: TLabel
    Left = 11
    Top = 97
    Width = 59
    Height = 13
    Caption = #26448#26009#35268#26684':'
  end
  object Label6: TLabel
    Left = 186
    Top = 134
    Width = 59
    Height = 13
    Caption = #21457#20986#25968#37327':'
  end
  object Label9: TLabel
    Left = 9
    Top = 135
    Width = 59
    Height = 13
    Caption = #26377#25928#24211#23384':'
  end
  object Edit1: TEdit
    Left = 81
    Top = 53
    Width = 161
    Height = 21
    Enabled = False
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 80
    Top = 92
    Width = 321
    Height = 21
    Enabled = False
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 1
  end
  object Edit5: TEdit
    Left = 252
    Top = 129
    Width = 97
    Height = 21
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 2
    Text = '0'
    OnKeyPress = Edit5KeyPress
    OnKeyUp = Edit5KeyUp
  end
  object Button1: TButton
    Left = 136
    Top = 214
    Width = 75
    Height = 27
    Caption = #30830#23450
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 236
    Top = 214
    Width = 75
    Height = 28
    Caption = #21462#28040
    TabOrder = 4
    OnClick = Button2Click
  end
  object Edit7: TEdit
    Left = 80
    Top = 131
    Width = 97
    Height = 21
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 5
    Text = '0'
    OnKeyPress = Edit5KeyPress
    OnKeyUp = Edit7KeyUp
  end
end
