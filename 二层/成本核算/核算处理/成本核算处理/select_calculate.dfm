object Form2: TForm2
  Left = 295
  Top = 315
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26680#31639#26399#38388
  ClientHeight = 243
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 136
    Top = 45
    Width = 59
    Height = 13
    Caption = #24320#22987#26085#26399':'
  end
  object Label5: TLabel
    Left = 110
    Top = 76
    Width = 85
    Height = 13
    Caption = #24320#22987#26085#26399#26102#38388':'
  end
  object Label3: TLabel
    Left = 136
    Top = 105
    Width = 59
    Height = 13
    Caption = #32467#26463#26085#26399':'
  end
  object Label6: TLabel
    Left = 110
    Top = 135
    Width = 85
    Height = 13
    Caption = #32467#26463#26085#26399#26102#38388':'
  end
  object Label2: TLabel
    Left = 203
    Top = 76
    Width = 7
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 204
    Top = 135
    Width = 7
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object edit1: TEdit
    Left = 200
    Top = 42
    Width = 121
    Height = 21
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object edit2: TEdit
    Left = 200
    Top = 101
    Width = 121
    Height = 21
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object Button1: TButton
    Left = 179
    Top = 183
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 267
    Top = 183
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 328
    Top = 99
    Width = 25
    Height = 25
    TabOrder = 4
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
end
