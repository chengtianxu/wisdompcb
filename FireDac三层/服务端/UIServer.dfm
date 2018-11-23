object frmServerUI: TfrmServerUI
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #26381#21153#31471
  ClientHeight = 182
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = #40657#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 21
  object lbl1: TLabel
    Left = 152
    Top = 72
    Width = 88
    Height = 21
    Caption = #29992#25143#25968#65306
  end
  object lbl2: TLabel
    Left = 254
    Top = 72
    Width = 11
    Height = 21
    Caption = '0'
  end
  object lbl3: TLabel
    Left = 8
    Top = 153
    Width = 44
    Height = 21
    Caption = 'lbl3'
  end
  object btn1: TButton
    Left = 152
    Top = 128
    Width = 132
    Height = 25
    Caption = #21047#26032'Buffer'
    TabOrder = 0
    OnClick = btn1Click
  end
end
