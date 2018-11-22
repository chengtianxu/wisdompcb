object frmDlg_Department: TfrmDlg_Department
  Left = 437
  Top = 270
  Width = 530
  Height = 248
  Caption = #25240#26087#37096#38376
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 40
    Width = 59
    Height = 13
    Caption = #20351#29992#37096#38376':'
  end
  object Label2: TLabel
    Left = 32
    Top = 72
    Width = 59
    Height = 13
    Caption = #25240#26087#31185#30446':'
  end
  object Label3: TLabel
    Left = 24
    Top = 104
    Width = 67
    Height = 13
    Caption = #30334#20998#27604'(%):'
  end
  object SpeedButton1: TSpeedButton
    Left = 231
    Top = 30
    Width = 26
    Height = 27
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 231
    Top = 62
    Width = 26
    Height = 27
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888800000888880000080F000888880F00080F000888880F0008000000080000
      000800F000000F00000800F000800F00000800F000800F000008800000000000
      0088880F00080F000888880000080000088888800088800088888880F08880F0
      888888800088800088888888888888888888}
    OnClick = SpeedButton2Click
  end
  object LabelDept: TLabel
    Left = 260
    Top = 37
    Width = 7
    Height = 13
  end
  object LabelAcctName: TLabel
    Left = 260
    Top = 70
    Width = 7
    Height = 13
  end
  object edtDept: TEdit
    Left = 104
    Top = 32
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edtAcctNo: TEdit
    Left = 104
    Top = 64
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edtPercent: TEdit
    Left = 104
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = edtPercentChange
    OnKeyPress = edtPercentKeyPress
  end
  object Button1: TButton
    Left = 112
    Top = 176
    Width = 75
    Height = 25
    Caption = #30830#23450'(&Y)'
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 248
    Top = 176
    Width = 75
    Height = 25
    Caption = #21462#28040'(&C)'
    ModalResult = 2
    TabOrder = 4
  end
end
