object frmStockPass: TfrmStockPass
  Left = 490
  Top = 333
  Width = 433
  Height = 289
  Caption = #20179#24211#30830#35748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 72
    Top = 30
    Width = 36
    Height = 13
    Caption = #37325#37327#65306
  end
  object lbl2: TLabel
    Left = 72
    Top = 64
    Width = 36
    Height = 13
    Caption = #31665#25968#65306
  end
  object lbl3: TLabel
    Left = 72
    Top = 98
    Width = 36
    Height = 13
    Caption = #22791#27880#65306
  end
  object btn1: TButton
    Left = 168
    Top = 206
    Width = 75
    Height = 25
    Caption = #30830#35748
    TabOrder = 0
    OnClick = btn1Click
  end
  object edtRealWeight: TEdit
    Left = 120
    Top = 24
    Width = 185
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object edtPackCount: TEdit
    Left = 120
    Top = 57
    Width = 185
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object mmoNote: TMemo
    Left = 120
    Top = 96
    Width = 185
    Height = 89
    TabOrder = 3
  end
end
