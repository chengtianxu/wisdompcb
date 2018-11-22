object frmIniPickMonth: TfrmIniPickMonth
  Left = 395
  Top = 236
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #26376#20221
  ClientHeight = 183
  ClientWidth = 276
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 49
    Top = 56
    Width = 60
    Height = 13
    Caption = #21021#22987#26376#20221#65306
  end
  object btnOK: TButton
    Left = 48
    Top = 120
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btnOKClick
  end
  object btn2: TButton
    Left = 168
    Top = 120
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 1
    OnClick = btn2Click
  end
  object dtp1: TDateTimePicker
    Left = 119
    Top = 51
    Width = 121
    Height = 21
    Date = 41684.375076041670000000
    Time = 41684.375076041670000000
    TabOrder = 2
  end
end
