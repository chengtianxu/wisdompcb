object frmModify: TfrmModify
  Left = 473
  Top = 234
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #20462#25913
  ClientHeight = 205
  ClientWidth = 223
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
    Left = 24
    Top = 24
    Width = 52
    Height = 13
    Caption = #35831#36873#25321#65306
  end
  object btn1: TButton
    Left = 16
    Top = 152
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 0
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 136
    Top = 152
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
  end
  object cbb1: TComboBox
    Left = 40
    Top = 48
    Width = 121
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object ads1: TADODataSet
    Connection = DM1.con1
    Parameters = <>
    Left = 168
    Top = 16
  end
end
