object frmSelect: TfrmSelect
  Left = 504
  Top = 367
  Width = 336
  Height = 250
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36873#25321
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 120
    Width = 52
    Height = 13
    Caption = #26085#26399#20174#65306
  end
  object Label2: TLabel
    Left = 184
    Top = 72
    Width = 13
    Height = 13
    Caption = #33267
  end
  object Label3: TLabel
    Left = 10
    Top = 75
    Width = 65
    Height = 13
    Caption = #20844#24335#20195#30721#65306
  end
  object Label4: TLabel
    Left = 34
    Top = 34
    Width = 39
    Height = 13
    Caption = #24037#21378#65306
  end
  object dtpks: TDateTimePicker
    Left = 78
    Top = 116
    Width = 97
    Height = 21
    Date = 42563.000000000000000000
    Time = 42563.000000000000000000
    TabOrder = 0
  end
  object dtpke: TDateTimePicker
    Left = 206
    Top = 116
    Width = 97
    Height = 21
    Date = 42563.000000000000000000
    Time = 42563.000000000000000000
    TabOrder = 1
  end
  object edtDept: TEdit
    Left = 78
    Top = 72
    Width = 94
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 182
    Top = 72
    Width = 25
    Height = 25
    TabOrder = 3
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
    Left = 64
    Top = 160
    Width = 75
    Height = 25
    Caption = #23548#20986
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 184
    Top = 160
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 5
  end
  object cbbWH: TComboBox
    Left = 79
    Top = 31
    Width = 127
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
end
