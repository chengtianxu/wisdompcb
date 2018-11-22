object frmDes: TfrmDes
  Left = 529
  Top = 348
  Width = 238
  Height = 223
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #21608#26399#23450#20041
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
    Left = 18
    Top = 40
    Width = 52
    Height = 13
    Caption = #26448#26009#31867#21035
  end
  object lbl2: TLabel
    Left = 18
    Top = 80
    Width = 52
    Height = 13
    Caption = #26816#27979#21608#26399
  end
  object edtType: TEdit
    Left = 82
    Top = 36
    Width = 79
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ReadOnly = True
    TabOrder = 0
  end
  object cbbCycle: TComboBox
    Left = 83
    Top = 80
    Width = 81
    Height = 21
    Style = csDropDownList
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#20116#31508#36755#20837#27861
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      #21608
      #26376)
  end
  object btn1: TBitBtn
    Left = 164
    Top = 34
    Width = 25
    Height = 25
    TabOrder = 2
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
    Left = 30
    Top = 128
    Width = 65
    Height = 33
    Caption = #20445#23384
    TabOrder = 3
    OnClick = btn2Click
  end
  object btn3: TBitBtn
    Left = 127
    Top = 128
    Width = 65
    Height = 33
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
  end
end
