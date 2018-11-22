object Form_numcat: TForm_numcat
  Left = 564
  Top = 231
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20313#26009#35268#26684
  ClientHeight = 277
  ClientWidth = 419
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
    Left = 26
    Top = 63
    Width = 65
    Height = 13
    Caption = #20313#26009#32534#21495#65306
  end
  object Label2: TLabel
    Left = 26
    Top = 88
    Width = 65
    Height = 13
    Caption = #20313#26009#35268#26684#65306
  end
  object Label3: TLabel
    Left = 25
    Top = 133
    Width = 52
    Height = 13
    Caption = #20379#24212#21830#65306
  end
  object Label11: TLabel
    Left = 26
    Top = 108
    Width = 65
    Height = 13
    Caption = #20313#26009#38271#24230#65306
  end
  object Label12: TLabel
    Left = 208
    Top = 109
    Width = 65
    Height = 13
    Caption = #20313#26009#23485#24230#65306
  end
  object Label6: TLabel
    Left = 166
    Top = 109
    Width = 26
    Height = 13
    Caption = #27627#31859
  end
  object Label7: TLabel
    Left = 350
    Top = 109
    Width = 26
    Height = 13
    Caption = #27627#31859
  end
  object key17: TLabel
    Left = 360
    Top = 8
    Width = 7
    Height = 13
    Caption = '0'
    Visible = False
  end
  object Label4: TLabel
    Left = 26
    Top = 10
    Width = 65
    Height = 13
    Caption = #26448#26009#32534#21495#65306
  end
  object Label5: TLabel
    Left = 26
    Top = 37
    Width = 65
    Height = 13
    Caption = #26448#26009#35268#26684#65306
  end
  object Label9: TLabel
    Left = 217
    Top = 136
    Width = 39
    Height = 13
    Caption = #25968#37327#65306
    Visible = False
  end
  object Label10: TLabel
    Left = 22
    Top = 159
    Width = 65
    Height = 13
    Caption = #37197#26009#21333#21495#65306
    Visible = False
  end
  object Label8: TLabel
    Left = 32
    Top = 185
    Width = 53
    Height = 13
    Caption = #22791'  '#27880#65306
    ParentShowHint = False
    ShowHint = False
  end
  object Edit1: TEdit
    Left = 95
    Top = 58
    Width = 185
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 95
    Top = 82
    Width = 306
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 291
    Top = 3
    Width = 26
    Height = 24
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
      333333777777777F33333330B00000003333337F7777777F3333333000000000
      333333777777777F333333330EEEEEE033333337FFFFFF7F3333333300000000
      333333377777777F3333333330BFBFB03333333373333373F33333330BFBFBFB
      03333337F33333F7F33333330FBFBF0F03333337F33337F7F33333330BFBFB0B
      03333337F3F3F7F7333333330F0F0F0033333337F7F7F773333333330B0B0B03
      3333333737F7F7F333333333300F0F03333333337737F7F33333333333300B03
      333333333377F7F33333333333330F03333333333337F7F33333333333330B03
      3333333333373733333333333333303333333333333373333333}
    NumGlyphs = 2
  end
  object edit3: TEdit
    Left = 95
    Top = 105
    Width = 57
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 3
    Text = '0'
    OnKeyPress = edit3KeyPress
    OnKeyUp = edit3KeyUp
  end
  object Edit4: TEdit
    Left = 280
    Top = 105
    Width = 57
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 4
    Text = '0'
    OnKeyPress = edit3KeyPress
    OnKeyUp = Edit4KeyUp
  end
  object Edit6: TEdit
    Left = 257
    Top = 131
    Width = 90
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 5
    Visible = False
    OnKeyPress = Edit6KeyPress
    OnKeyUp = Edit6KeyUp
  end
  object Button2: TButton
    Left = 209
    Top = 233
    Width = 75
    Height = 28
    Caption = #21462#28040
    TabOrder = 7
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 113
    Top = 234
    Width = 75
    Height = 27
    Caption = #30830#23450
    TabOrder = 6
    OnClick = Button1Click
    OnEnter = Button1Enter
  end
  object inv_code: TEdit
    Left = 95
    Top = 5
    Width = 184
    Height = 21
    Color = cl3DLight
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 8
  end
  object Edit7: TEdit
    Left = 95
    Top = 33
    Width = 305
    Height = 21
    Color = clScrollBar
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 9
  end
  object Edit9: TEdit
    Left = 95
    Top = 154
    Width = 116
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 10
    Visible = False
  end
  object Edit8: TEdit
    Left = 95
    Top = 180
    Width = 117
    Height = 21
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 11
  end
  object Edit5: TEdit
    Left = 95
    Top = 129
    Width = 115
    Height = 21
    Enabled = False
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 12
    OnExit = Edit1Exit
  end
end
