object Form_entinvt: TForm_entinvt
  Left = 510
  Top = 231
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #22312#32447#26448#26009#36755#20837
  ClientHeight = 289
  ClientWidth = 408
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
    Left = 40
    Top = 52
    Width = 59
    Height = 13
    Caption = #24037#24207#20195#30721':'
  end
  object Label2: TLabel
    Left = 40
    Top = 85
    Width = 59
    Height = 13
    Caption = #26448#26009#32534#30721':'
  end
  object Label3: TLabel
    Left = 66
    Top = 142
    Width = 33
    Height = 13
    Caption = #21333#20301':'
  end
  object Label4: TLabel
    Left = 66
    Top = 179
    Width = 33
    Height = 13
    Caption = #21333#20215':'
  end
  object Label5: TLabel
    Left = 66
    Top = 215
    Width = 33
    Height = 13
    Caption = #25968#37327':'
  end
  object Label6: TLabel
    Left = 100
    Top = 115
    Width = 301
    Height = 13
    AutoSize = False
  end
  object Label7: TLabel
    Left = 220
    Top = 52
    Width = 141
    Height = 13
    AutoSize = False
  end
  object Label8: TLabel
    Left = 40
    Top = 20
    Width = 59
    Height = 13
    Caption = #24037#21378#20195#30721':'
  end
  object Label9: TLabel
    Left = 220
    Top = 20
    Width = 133
    Height = 13
    AutoSize = False
  end
  object Edit1: TEdit
    Left = 100
    Top = 48
    Width = 85
    Height = 21
    TabOrder = 1
    OnClick = Edit1Click
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 100
    Top = 81
    Width = 161
    Height = 21
    TabOrder = 2
    OnClick = Edit2Click
    OnExit = Edit2Exit
  end
  object Edit3: TEdit
    Left = 100
    Top = 138
    Width = 85
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 100
    Top = 175
    Width = 161
    Height = 21
    TabStop = False
    Color = cl3DLight
    ReadOnly = True
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 100
    Top = 211
    Width = 85
    Height = 21
    TabOrder = 5
    Text = '0'
    OnKeyPress = Edit5KeyPress
    OnKeyUp = Edit5KeyUp
  end
  object Button1: TButton
    Left = 100
    Top = 248
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 6
    OnClick = Button1Click
    OnEnter = Button1Enter
  end
  object Button2: TButton
    Left = 218
    Top = 248
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 7
    OnClick = Button2Click
  end
  object BitBtn1: TBitBtn
    Left = 189
    Top = 46
    Width = 25
    Height = 25
    TabOrder = 9
    OnClick = BitBtn1Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object BitBtn2: TBitBtn
    Left = 266
    Top = 79
    Width = 25
    Height = 25
    TabOrder = 10
    OnClick = BitBtn2Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
  object Edit6: TEdit
    Left = 100
    Top = 16
    Width = 85
    Height = 21
    TabOrder = 0
    OnExit = Edit6Exit
  end
  object BitBtn3: TBitBtn
    Left = 189
    Top = 14
    Width = 25
    Height = 25
    TabOrder = 8
    OnClick = BitBtn3Click
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
  end
end
