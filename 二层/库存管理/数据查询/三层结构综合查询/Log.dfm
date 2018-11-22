object frmLog: TfrmLog
  Left = 289
  Top = 232
  Width = 342
  Height = 220
  Caption = 'frmLog'
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
    Top = 32
    Width = 117
    Height = 13
    Caption = #25968#25454#24211#36830#25509#23383#31526#20018#65306
  end
  object Label2: TLabel
    Left = 77
    Top = 64
    Width = 52
    Height = 13
    Caption = #26381#21153#22120#65306
  end
  object edtConStr: TEdit
    Left = 125
    Top = 24
    Width = 196
    Height = 21
    TabOrder = 0
  end
  object edtServer: TEdit
    Left = 125
    Top = 56
    Width = 193
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 64
    Top = 128
    Width = 75
    Height = 25
    Caption = #30331#20837
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 128
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 3
    OnClick = Button2Click
  end
end
