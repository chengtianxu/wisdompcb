object frmBOMBaoJiaDeptAddParam: TfrmBOMBaoJiaDeptAddParam
  Left = 0
  Top = 0
  Caption = #21442#25968
  ClientHeight = 309
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TRzLabel
    Left = 74
    Top = 83
    Width = 60
    Height = 13
    Caption = #21442#25968#21517#31216#65306
  end
  object btn1: TSpeedButton
    Left = 301
    Top = 79
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = btn1Click
  end
  object lbl2: TRzLabel
    Left = 86
    Top = 147
    Width = 48
    Height = 13
    Caption = #21442#25968#20540#65306
  end
  object edt1: TRzEdit
    Left = 136
    Top = 80
    Width = 159
    Height = 21
    Text = ''
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 0
  end
  object edt2: TRzEdit
    Left = 136
    Top = 144
    Width = 159
    Height = 21
    Text = ''
    TabOrder = 1
  end
  object btn2: TRzButton
    Left = 110
    Top = 240
    Caption = #30830#23450
    TabOrder = 2
    OnClick = btn2Click
  end
  object btn3: TRzButton
    Left = 272
    Top = 240
    Caption = #21462#28040
    TabOrder = 3
    OnClick = btn3Click
  end
end
