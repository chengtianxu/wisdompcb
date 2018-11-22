object frmDept: TfrmDept
  Left = 562
  Top = 310
  Width = 311
  Height = 156
  Caption = #36873#25321#24037#24207
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
  object lbl1: TLabel
    Left = 32
    Top = 32
    Width = 26
    Height = 12
    Caption = #24037#24207
  end
  object edt1: TEdit
    Left = 69
    Top = 27
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object btn1: TBitBtn
    Left = 200
    Top = 24
    Width = 33
    Height = 25
    TabOrder = 1
    OnClick = btn1Click
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
  object btn2: TBitBtn
    Left = 64
    Top = 72
    Width = 75
    Height = 33
    Caption = #30830#23450
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TBitBtn
    Left = 160
    Top = 72
    Width = 75
    Height = 33
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
end
