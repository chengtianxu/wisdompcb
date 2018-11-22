object Form_Return: TForm_Return
  Left = 509
  Top = 309
  Width = 456
  Height = 222
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = #36864#22238#21407#22240
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 18
    Width = 65
    Height = 13
    Caption = #36864#22238#21407#22240#65306
  end
  object btnEnter: TButton
    Left = 136
    Top = 152
    Width = 75
    Height = 25
    Caption = #30830#23450
    TabOrder = 1
    OnClick = btnEnterClick
  end
  object btnCancel: TButton
    Left = 232
    Top = 152
    Width = 75
    Height = 25
    Caption = #36820#22238
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object Memo1: TMemo
    Left = 80
    Top = 16
    Width = 345
    Height = 121
    TabOrder = 0
  end
end
