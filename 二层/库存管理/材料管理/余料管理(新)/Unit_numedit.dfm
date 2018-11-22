object Form_numedit: TForm_numedit
  Left = 363
  Top = 258
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20313#26009#20986#20179#32534#36753
  ClientHeight = 206
  ClientWidth = 412
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
    Left = 14
    Top = 17
    Width = 59
    Height = 13
    Caption = #20313#26009#20195#30721':'
  end
  object Label2: TLabel
    Left = 14
    Top = 50
    Width = 59
    Height = 13
    Caption = #20313#26009#35268#26684':'
  end
  object Label3: TLabel
    Left = 38
    Top = 87
    Width = 33
    Height = 13
    Caption = #38271#24230':'
  end
  object Label4: TLabel
    Left = 219
    Top = 87
    Width = 33
    Height = 13
    Caption = #23485#24230':'
  end
  object Label6: TLabel
    Left = 11
    Top = 120
    Width = 59
    Height = 13
    Caption = #21457#20986#25968#37327':'
  end
  object Label7: TLabel
    Left = 182
    Top = 87
    Width = 26
    Height = 13
    Caption = #27627#31859
  end
  object Label8: TLabel
    Left = 351
    Top = 87
    Width = 26
    Height = 13
    Caption = #27627#31859
  end
  object Label5: TLabel
    Left = 183
    Top = 119
    Width = 59
    Height = 13
    Caption = #24211#23384#25968#37327':'
  end
  object Edit1: TEdit
    Left = 79
    Top = 13
    Width = 161
    Height = 21
    Enabled = False
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 80
    Top = 48
    Width = 321
    Height = 21
    Enabled = False
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 79
    Top = 83
    Width = 97
    Height = 21
    Enabled = False
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 256
    Top = 83
    Width = 89
    Height = 21
    Enabled = False
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 79
    Top = 115
    Width = 97
    Height = 21
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 4
    Text = '0'
    OnKeyPress = Edit5KeyPress
    OnKeyUp = Edit5KeyUp
  end
  object Button1: TButton
    Left = 113
    Top = 158
    Width = 75
    Height = 27
    Caption = #30830#23450
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 238
    Top = 158
    Width = 75
    Height = 28
    Caption = #21462#28040
    TabOrder = 6
    OnClick = Button2Click
  end
  object Edit6: TEdit
    Left = 254
    Top = 115
    Width = 97
    Height = 21
    Enabled = False
    ImeName = #26497#21697#20116#31508#36755#20837#27861'5.0'
    TabOrder = 7
    Text = '0'
    OnKeyPress = Edit5KeyPress
    OnKeyUp = Edit5KeyUp
  end
end
